
opcodes = {

    "xor": "000",
    "or": "000",
    "and": "000",
    "add": "000",
    "sub": "000",
    "div": "000",
    "mult": "000",
    "nand": "000",
    "lw": "001",
    "sw": "010",
    "beq": "011",
    "addi": "100",
    "andi": "101",
    "ori": "110",
    "jump": "111"
}

functions = {
    "xor": "0000",
    "or": "0001",
    "and": "0010",
    "add": "0011",
    "sub": "0100",
    "div": "0101",
    "mult": "0110",
    "nand": "0111",
}


def RType(res: str, cm, rs, rt, rd):
    res += dec_to_bin(rs, 1)
    res += dec_to_bin(rt, 1)
    res += dec_to_bin(rd, 1)
    res += functions[cm]

    return res


def IType(res: str, rs, rt, addr_cons):
    res += dec_to_bin(rs, 1)
    res += dec_to_bin(rt, 1)
    res += dec_to_bin(addr_cons, 2)

    return res


def JType(res: str, address):
    res += dec_to_bin(address, 3)

    return res


def dec_to_bin(n, flag: int):
    n = bin(int(n)).replace("0b", "")
    if flag == 1:
        n = ((3 - len(n)) * '0') + n
    elif flag == 2:
        n = ((7 - len(n)) * '0') + n
    else:
        n = ((13 - len(n)) * '0') + n

    return n


while True:
    str = input().split(" ")
    res = ""
    res += opcodes[str[0]]
    second = str[1].split(",")
    match str[0]:
        case "xor":
            res = RType(res, "xor", second[0], second[1], second[2])
        case "or":
            res = RType(res, "or", second[0], second[1], second[2])
        case "and":
            res = RType(res, "and", second[0], second[1], second[2])
        case "add":
            res = RType(res, "add", second[0], second[1], second[2])
        case "sub":
            res = RType(res, "sub", second[0], second[1], second[2])
        case "div":
            res = RType(res, "div", second[0], second[1], second[2])
        case "mult":
            res = RType(res, "mult", second[0], second[1], second[2])
        case "nand":
            res = RType(res, "nand", second[0], second[1], second[2])
        case "lw":
            res = IType(res, second[0], second[1], second[2])
        case "sw":
            res = IType(res, second[0], second[1], second[2])
        case "beq":
            res = IType(res, second[0], second[1], second[2])
        case "addi":
            res = IType(res, second[0], second[1], second[2])
        case "andi":
            res = IType(res, second[0], second[1], second[2])
        case "ori":
            res = IType(res, second[1], second[0], second[2])
        case "jump":
            res = JType(res, second[0])

    print(res)
    print("{0:0>4X}".format(int(res, 2)))
