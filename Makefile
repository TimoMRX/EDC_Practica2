all:
	iverilog alu.v componentes.v microc.v memprog.v
	rm a.out
