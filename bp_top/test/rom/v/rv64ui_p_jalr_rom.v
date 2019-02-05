// auto-generated by bsg_ascii_to_rom.py from /home/petrisko/bitbucket/bp_be/tb/asm/rv64ui_p_jalr.bin; do not modify
//
//rv64ui_p_jalr.riscv:     file format elf64-littleriscv
//
//
//Disassembly of section .text.init:
//
//0000000080000000 <_start>:
//    80000000:	04c0006f          	jal	x0,8000004c <reset_vector>
//
//0000000080000004 <trap_vector>:
//    80000004:	34202f73          	csrrs	x30,mcause,x0
//    80000008:	00800f93          	addi	x31,x0,8
//    8000000c:	03ff0a63          	beq	x30,x31,80000040 <write_tohost>
//    80000010:	00900f93          	addi	x31,x0,9
//    80000014:	03ff0663          	beq	x30,x31,80000040 <write_tohost>
//    80000018:	00b00f93          	addi	x31,x0,11
//    8000001c:	03ff0263          	beq	x30,x31,80000040 <write_tohost>
//    80000020:	80000f17          	auipc	x30,0x80000
//    80000024:	fe0f0f13          	addi	x30,x30,-32 # 0 <_start-0x80000000>
//    80000028:	000f0463          	beq	x30,x0,80000030 <trap_vector+0x2c>
//    8000002c:	000f0067          	jalr	x0,0(x30)
//    80000030:	34202f73          	csrrs	x30,mcause,x0
//    80000034:	000f5463          	bge	x30,x0,8000003c <handle_exception>
//    80000038:	0040006f          	jal	x0,8000003c <handle_exception>
//
//000000008000003c <handle_exception>:
//    8000003c:	539e6e13          	ori	x28,x28,1337
//
//0000000080000040 <write_tohost>:
//    80000040:	00001f17          	auipc	x30,0x1
//    80000044:	fdcf2023          	sw	x28,-64(x30) # 80001000 <tohost>
//    80000048:	ff9ff06f          	jal	x0,80000040 <write_tohost>
//
//000000008000004c <reset_vector>:
//    8000004c:	f1402573          	csrrs	x10,mhartid,x0
//    80000050:	00051063          	bne	x10,x0,80000050 <reset_vector+0x4>
//    80000054:	00000297          	auipc	x5,0x0
//    80000058:	01028293          	addi	x5,x5,16 # 80000064 <reset_vector+0x18>
//    8000005c:	30529073          	csrrw	x0,mtvec,x5
//    80000060:	18005073          	csrrwi	x0,satp,0
//    80000064:	00000297          	auipc	x5,0x0
//    80000068:	01c28293          	addi	x5,x5,28 # 80000080 <reset_vector+0x34>
//    8000006c:	30529073          	csrrw	x0,mtvec,x5
//    80000070:	fff00293          	addi	x5,x0,-1
//    80000074:	3b029073          	csrrw	x0,pmpaddr0,x5
//    80000078:	01f00293          	addi	x5,x0,31
//    8000007c:	3a029073          	csrrw	x0,pmpcfg0,x5
//    80000080:	00000297          	auipc	x5,0x0
//    80000084:	01828293          	addi	x5,x5,24 # 80000098 <reset_vector+0x4c>
//    80000088:	30529073          	csrrw	x0,mtvec,x5
//    8000008c:	30205073          	csrrwi	x0,medeleg,0
//    80000090:	30305073          	csrrwi	x0,mideleg,0
//    80000094:	30405073          	csrrwi	x0,mie,0
//    80000098:	00000e13          	addi	x28,x0,0
//    8000009c:	00000297          	auipc	x5,0x0
//    800000a0:	f6828293          	addi	x5,x5,-152 # 80000004 <trap_vector>
//    800000a4:	30529073          	csrrw	x0,mtvec,x5
//    800000a8:	00100513          	addi	x10,x0,1
//    800000ac:	01f51513          	slli	x10,x10,0x1f
//    800000b0:	02055c63          	bge	x10,x0,800000e8 <reset_vector+0x9c>
//    800000b4:	0ff0000f          	fence	iorw,iorw
//    800000b8:	000c02b7          	lui	x5,0xc0
//    800000bc:	0df2829b          	addiw	x5,x5,223
//    800000c0:	00c29293          	slli	x5,x5,0xc
//    800000c4:	ad028293          	addi	x5,x5,-1328 # bfad0 <_start-0x7ff40530>
//    800000c8:	000e0513          	addi	x10,x28,0
//    800000cc:	000105b7          	lui	x11,0x10
//    800000d0:	fff5859b          	addiw	x11,x11,-1
//    800000d4:	00b57533          	and	x10,x10,x11
//    800000d8:	00a2a023          	sw	x10,0(x5)
//    800000dc:	0ff0000f          	fence	iorw,iorw
//    800000e0:	00100e13          	addi	x28,x0,1
//    800000e4:	00000073          	ecall
//    800000e8:	80000297          	auipc	x5,0x80000
//    800000ec:	f1828293          	addi	x5,x5,-232 # 0 <_start-0x80000000>
//    800000f0:	00028e63          	beq	x5,x0,8000010c <reset_vector+0xc0>
//    800000f4:	10529073          	csrrw	x0,stvec,x5
//    800000f8:	0000b2b7          	lui	x5,0xb
//    800000fc:	1092829b          	addiw	x5,x5,265
//    80000100:	30229073          	csrrw	x0,medeleg,x5
//    80000104:	30202373          	csrrs	x6,medeleg,x0
//    80000108:	f2629ae3          	bne	x5,x6,8000003c <handle_exception>
//    8000010c:	30005073          	csrrwi	x0,mstatus,0
//    80000110:	00000297          	auipc	x5,0x0
//    80000114:	01428293          	addi	x5,x5,20 # 80000124 <test_2>
//    80000118:	34129073          	csrrw	x0,mepc,x5
//    8000011c:	f1402573          	csrrs	x10,mhartid,x0
//    80000120:	30200073          	mret
//
//0000000080000124 <test_2>:
//    80000124:	00200e13          	addi	x28,x0,2
//    80000128:	00000293          	addi	x5,x0,0
//    8000012c:	00000317          	auipc	x6,0x0
//    80000130:	01030313          	addi	x6,x6,16 # 8000013c <target_2>
//    80000134:	000302e7          	jalr	x5,0(x6)
//
//0000000080000138 <linkaddr_2>:
//    80000138:	0c00006f          	jal	x0,800001f8 <fail>
//
//000000008000013c <target_2>:
//    8000013c:	00000317          	auipc	x6,0x0
//    80000140:	ffc30313          	addi	x6,x6,-4 # 80000138 <linkaddr_2>
//    80000144:	0a629a63          	bne	x5,x6,800001f8 <fail>
//
//0000000080000148 <test_4>:
//    80000148:	00400e13          	addi	x28,x0,4
//    8000014c:	00000213          	addi	x4,x0,0
//    80000150:	00000317          	auipc	x6,0x0
//    80000154:	01030313          	addi	x6,x6,16 # 80000160 <test_4+0x18>
//    80000158:	000309e7          	jalr	x19,0(x6)
//    8000015c:	09c01e63          	bne	x0,x28,800001f8 <fail>
//    80000160:	00120213          	addi	x4,x4,1 # 1 <_start-0x7fffffff>
//    80000164:	00200293          	addi	x5,x0,2
//    80000168:	fe5214e3          	bne	x4,x5,80000150 <test_4+0x8>
//
//000000008000016c <test_5>:
//    8000016c:	00500e13          	addi	x28,x0,5
//    80000170:	00000213          	addi	x4,x0,0
//    80000174:	00000317          	auipc	x6,0x0
//    80000178:	01430313          	addi	x6,x6,20 # 80000188 <test_5+0x1c>
//    8000017c:	00000013          	addi	x0,x0,0
//    80000180:	000309e7          	jalr	x19,0(x6)
//    80000184:	07c01a63          	bne	x0,x28,800001f8 <fail>
//    80000188:	00120213          	addi	x4,x4,1 # 1 <_start-0x7fffffff>
//    8000018c:	00200293          	addi	x5,x0,2
//    80000190:	fe5212e3          	bne	x4,x5,80000174 <test_5+0x8>
//
//0000000080000194 <test_6>:
//    80000194:	00600e13          	addi	x28,x0,6
//    80000198:	00000213          	addi	x4,x0,0
//    8000019c:	00000317          	auipc	x6,0x0
//    800001a0:	01830313          	addi	x6,x6,24 # 800001b4 <test_6+0x20>
//    800001a4:	00000013          	addi	x0,x0,0
//    800001a8:	00000013          	addi	x0,x0,0
//    800001ac:	000309e7          	jalr	x19,0(x6)
//    800001b0:	05c01463          	bne	x0,x28,800001f8 <fail>
//    800001b4:	00120213          	addi	x4,x4,1 # 1 <_start-0x7fffffff>
//    800001b8:	00200293          	addi	x5,x0,2
//    800001bc:	fe5210e3          	bne	x4,x5,8000019c <test_6+0x8>
//
//00000000800001c0 <test_7>:
//    800001c0:	00100293          	addi	x5,x0,1
//    800001c4:	00000317          	auipc	x6,0x0
//    800001c8:	01c30313          	addi	x6,x6,28 # 800001e0 <test_7+0x20>
//    800001cc:	ffc30067          	jalr	x0,-4(x6)
//    800001d0:	00128293          	addi	x5,x5,1
//    800001d4:	00128293          	addi	x5,x5,1
//    800001d8:	00128293          	addi	x5,x5,1
//    800001dc:	00128293          	addi	x5,x5,1
//    800001e0:	00128293          	addi	x5,x5,1
//    800001e4:	00128293          	addi	x5,x5,1
//    800001e8:	00400e93          	addi	x29,x0,4
//    800001ec:	00700e13          	addi	x28,x0,7
//    800001f0:	01d29463          	bne	x5,x29,800001f8 <fail>
//    800001f4:	05c01263          	bne	x0,x28,80000238 <pass>
//
//00000000800001f8 <fail>:
//    800001f8:	0ff0000f          	fence	iorw,iorw
//    800001fc:	000c0337          	lui	x6,0xc0
//    80000200:	0df3031b          	addiw	x6,x6,223
//    80000204:	00c31313          	slli	x6,x6,0xc
//    80000208:	ad030313          	addi	x6,x6,-1328 # bfad0 <_start-0x7ff40530>
//    8000020c:	000e0513          	addi	x10,x28,0
//    80000210:	000105b7          	lui	x11,0x10
//    80000214:	fff5859b          	addiw	x11,x11,-1
//    80000218:	01059593          	slli	x11,x11,0x10
//    8000021c:	00b56533          	or	x10,x10,x11
//    80000220:	00a32023          	sw	x10,0(x6)
//    80000224:	0ff0000f          	fence	iorw,iorw
//    80000228:	000e0063          	beq	x28,x0,80000228 <fail+0x30>
//    8000022c:	001e1e13          	slli	x28,x28,0x1
//    80000230:	001e6e13          	ori	x28,x28,1
//    80000234:	00000073          	ecall
//
//0000000080000238 <pass>:
//    80000238:	0ff0000f          	fence	iorw,iorw
//    8000023c:	000c02b7          	lui	x5,0xc0
//    80000240:	0df2829b          	addiw	x5,x5,223
//    80000244:	00c29293          	slli	x5,x5,0xc
//    80000248:	ad028293          	addi	x5,x5,-1328 # bfad0 <_start-0x7ff40530>
//    8000024c:	000e0513          	addi	x10,x28,0
//    80000250:	000105b7          	lui	x11,0x10
//    80000254:	fff5859b          	addiw	x11,x11,-1
//    80000258:	00b57533          	and	x10,x10,x11
//    8000025c:	00a2a023          	sw	x10,0(x5)
//    80000260:	0ff0000f          	fence	iorw,iorw
//    80000264:	00100e13          	addi	x28,x0,1
//    80000268:	00000073          	ecall
//    8000026c:	c0001073          	unimp
//	...
//
//Disassembly of section .tohost:
//
//0000000080001000 <tohost>:
//	...
//
//0000000080001040 <fromhost>:
//	...
module bp_be_boot_rom #(parameter width_p=-1, addr_width_p=-1)
(input  [addr_width_p-1:0] addr_i
,output logic [width_p-1:0]      data_o
);
always_comb case(addr_i)
         0: data_o = width_p ' (512'b01010011100111100110111000010011000000000100000000000000011011110000000000001111010101000110001100110100001000000010111101110011000000000000111100000000011001110000000000001111000001000110001111111110000011110000111100010011100000000000000000001111000101110000001111111111000000100110001100000000101100000000111110010011000000111111111100000110011000110000000010010000000011111001001100000011111111110000101001100011000000001000000000001111100100110011010000100000001011110111001100000100110000000000000001101111); // 0x539E6E130040006F000F546334202F73000F0067000F0463FE0F0F1380000F1703FF026300B00F9303FF066300900F9303FF0A6300800F9334202F7304C0006F
         1: data_o = width_p ' (512'b00111010000000101001000001110011000000011111000000000010100100110011101100000010100100000111001111111111111100000000001010010011001100000101001010010000011100110000000111000010100000101001001100000000000000000000001010010111000110000000000001010000011100110011000001010010100100000111001100000001000000101000001010010011000000000000000000000010100101110000000000000101000100000110001111110001010000000010010101110011111111111001111111110000011011111111110111001111001000000010001100000000000000000001111100010111); // 0x3A02907301F002933B029073FFF002933052907301C28293000002971800507330529073010282930000029700051063F1402573FF9FF06FFDCF202300001F17
         2: data_o = width_p ' (512'b00001101111100101000001010011011000000000000110000000010101101110000111111110000000000000000111100000010000001010101110001100011000000011111010100010101000100110000000000010000000001010001001100110000010100101001000001110011111101101000001010000010100100110000000000000000000000101001011100000000000000000000111000010011001100000100000001010000011100110011000000110000010100000111001100110000001000000101000001110011001100000101001010010000011100110000000110000010100000101001001100000000000000000000001010010111); // 0x0DF2829B000C02B70FF0000F02055C6301F515130010051330529073F68282930000029700000E13304050733030507330205073305290730182829300000297
         3: data_o = width_p ' (512'b00010000100100101000001010011011000000000000000010110010101101110001000001010010100100000111001100000000000000101000111001100011111100011000001010000010100100111000000000000000000000101001011100000000000000000000000001110011000000000001000000001110000100110000111111110000000000000000111100000000101000101010000000100011000000001011010101110101001100111111111111110101100001011001101100000000000000010000010110110111000000000000111000000101000100111010110100000010100000101001001100000000110000101001001010010011); // 0x1092829B0000B2B71052907300028E63F1828293800002970000007300100E130FF0000F00A2A02300B57533FFF5859B000105B7000E0513AD02829300C29293
         4: data_o = width_p ' (512'b00000000000000000000001100010111000011000000000000000000011011110000000000000011000000101110011100000001000000110000001100010011000000000000000000000011000101110000000000000000000000101001001100000000001000000000111000010011001100000010000000000000011100111111000101000000001001010111001100110100000100101001000001110011000000010100001010000010100100110000000000000000000000101001011100110000000000000101000001110011111100100110001010011010111000110011000000100000001000110111001100110000001000101001000001110011); // 0x000003170C00006F000302E701030313000003170000029300200E1330200073F140257334129073014282930000029730005073F2629AE33020237330229073
         5: data_o = width_p ' (512'b00000000000000000000000000010011000000010100001100000011000100110000000000000000000000110001011100000000000000000000001000010011000000000101000000001110000100111111111001010010000101001110001100000000001000000000001010010011000000000001001000000010000100110000100111000000000111100110001100000000000000110000100111100111000000010000001100000011000100110000000000000000000000110001011100000000000000000000001000010011000000000100000000001110000100110000101001100010100110100110001111111111110000110000001100010011); // 0x0000001301430313000003170000021300500E13FE5214E3002002930012021309C01E63000309E701030313000003170000021300400E130A629A63FFC30313
         6: data_o = width_p ' (512'b11111110010100100001000011100011000000000010000000000010100100110000000000010010000000100001001100000101110000000001010001100011000000000000001100001001111001110000000000000000000000000001001100000000000000000000000000010011000000011000001100000011000100110000000000000000000000110001011100000000000000000000001000010011000000000110000000001110000100111111111001010010000100101110001100000000001000000000001010010011000000000001001000000010000100110000011111000000000110100110001100000000000000110000100111100111); // 0xFE5210E3002002930012021305C01463000309E7000000130000001301830313000003170000021300600E13FE5212E3002002930012021307C01A63000309E7
         7: data_o = width_p ' (512'b00000000000011000000001100110111000011111111000000000000000011110000010111000000000100100110001100000001110100101001010001100011000000000111000000001110000100110000000001000000000011101001001100000000000100101000001010010011000000000001001010000010100100110000000000010010100000101001001100000000000100101000001010010011000000000001001010000010100100110000000000010010100000101001001111111111110000110000000001100111000000011100001100000011000100110000000000000000000000110001011100000000000100000000001010010011); // 0x000C03370FF0000F05C0126301D2946300700E1300400E93001282930012829300128293001282930012829300128293FFC3006701C303130000031700100293
         8: data_o = width_p ' (512'b00000000000011000000001010110111000011111111000000000000000011110000000000000000000000000111001100000000000111100110111000010011000000000001111000011110000100110000000000001110000000000110001100001111111100000000000000001111000000001010001100100000001000110000000010110101011001010011001100000001000001011001010110010011111111111111010110000101100110110000000000000001000001011011011100000000000011100000010100010011101011010000001100000011000100110000000011000011000100110001001100001101111100110000001100011011); // 0x000C02B70FF0000F00000073001E6E13001E1E13000E00630FF0000F00A3202300B5653301059593FFF5859B000105B7000E0513AD03031300C313130DF3031B
         9: data_o = width_p ' (512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000010000011100110000000000000000000000000111001100000000000100000000111000010011000011111111000000000000000011110000000010100010101000000010001100000000101101010111010100110011111111111111010110000101100110110000000000000001000001011011011100000000000011100000010100010011101011010000001010000010100100110000000011000010100100101001001100001101111100101000001010011011); // 0x00000000000000000000000000000000C00010730000007300100E130FF0000F00A2A02300B57533FFF5859B000105B7000E0513AD02829300C292930DF2829B
   default: data_o = { width_p { 1'b0 } };
endcase
endmodule
