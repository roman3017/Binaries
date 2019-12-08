
build/machineModeSbi.elf:     file format elf32-littleriscv


Disassembly of section .init:

70000000 <_start>:
70000000:	00001117          	auipc	sp,0x1
70000004:	f4810113          	addi	sp,sp,-184 # 70000f48 <_sp>
70000008:	00001517          	auipc	a0,0x1
7000000c:	ad450513          	addi	a0,a0,-1324 # 70000adc <__init_array_end>
70000010:	00001597          	auipc	a1,0x1
70000014:	acc58593          	addi	a1,a1,-1332 # 70000adc <__init_array_end>
70000018:	00001617          	auipc	a2,0x1
7000001c:	b3060613          	addi	a2,a2,-1232 # 70000b48 <__bss_start>
70000020:	00c5fc63          	bleu	a2,a1,70000038 <_start+0x38>
70000024:	00052283          	lw	t0,0(a0)
70000028:	0055a023          	sw	t0,0(a1)
7000002c:	00450513          	addi	a0,a0,4
70000030:	00458593          	addi	a1,a1,4
70000034:	fec5e8e3          	bltu	a1,a2,70000024 <_start+0x24>
70000038:	00001517          	auipc	a0,0x1
7000003c:	b1050513          	addi	a0,a0,-1264 # 70000b48 <__bss_start>
70000040:	00001597          	auipc	a1,0x1
70000044:	b0858593          	addi	a1,a1,-1272 # 70000b48 <__bss_start>
70000048:	00b57863          	bleu	a1,a0,70000058 <_start+0x58>
7000004c:	00052023          	sw	zero,0(a0)
70000050:	00450513          	addi	a0,a0,4
70000054:	feb56ce3          	bltu	a0,a1,7000004c <_start+0x4c>
70000058:	1ed000ef          	jal	ra,70000a44 <__libc_init_array>
7000005c:	190000ef          	jal	ra,700001ec <init>
70000060:	00000097          	auipc	ra,0x0
70000064:	01408093          	addi	ra,ra,20 # 70000074 <done>
70000068:	00000513          	li	a0,0
7000006c:	80ff05b7          	lui	a1,0x80ff0
70000070:	30200073          	mret

70000074 <done>:
70000074:	0000006f          	j	70000074 <done>

70000078 <_init>:
70000078:	00008067          	ret

Disassembly of section .text:

7000007c <stopSim>:
7000007c:	700017b7          	lui	a5,0x70001
70000080:	adc78793          	addi	a5,a5,-1316 # 70000adc <__init_array_end>
70000084:	10010637          	lui	a2,0x10010
70000088:	0007c683          	lbu	a3,0(a5)
7000008c:	00069463          	bnez	a3,70000094 <stopSim+0x18>
70000090:	0000006f          	j	70000090 <stopSim+0x14>
70000094:	00178793          	addi	a5,a5,1
70000098:	00462703          	lw	a4,4(a2) # 10010004 <__stack_size+0x1000fc04>
7000009c:	01075713          	srli	a4,a4,0x10
700000a0:	0ff77713          	andi	a4,a4,255
700000a4:	fe070ae3          	beqz	a4,70000098 <stopSim+0x1c>
700000a8:	00d62023          	sw	a3,0(a2)
700000ac:	fddff06f          	j	70000088 <stopSim+0xc>

700000b0 <putC>:
700000b0:	10010737          	lui	a4,0x10010
700000b4:	00472783          	lw	a5,4(a4) # 10010004 <__stack_size+0x1000fc04>
700000b8:	0107d793          	srli	a5,a5,0x10
700000bc:	0ff7f793          	andi	a5,a5,255
700000c0:	fe078ae3          	beqz	a5,700000b4 <putC+0x4>
700000c4:	00a72023          	sw	a0,0(a4)
700000c8:	00008067          	ret

700000cc <getC>:
700000cc:	100107b7          	lui	a5,0x10010
700000d0:	0047a783          	lw	a5,4(a5) # 10010004 <__stack_size+0x1000fc04>
700000d4:	fff00513          	li	a0,-1
700000d8:	0187d793          	srli	a5,a5,0x18
700000dc:	00078e63          	beqz	a5,700000f8 <getC+0x2c>
700000e0:	10010737          	lui	a4,0x10010
700000e4:	00472783          	lw	a5,4(a4) # 10010004 <__stack_size+0x1000fc04>
700000e8:	0187d793          	srli	a5,a5,0x18
700000ec:	fe078ce3          	beqz	a5,700000e4 <getC+0x18>
700000f0:	00072503          	lw	a0,0(a4)
700000f4:	0ff57513          	andi	a0,a0,255
700000f8:	00008067          	ret

700000fc <rdtime>:
700000fc:	100087b7          	lui	a5,0x10008
70000100:	0007a503          	lw	a0,0(a5) # 10008000 <__stack_size+0x10007c00>
70000104:	00008067          	ret

70000108 <rdtimeh>:
70000108:	100087b7          	lui	a5,0x10008
7000010c:	0047a503          	lw	a0,4(a5) # 10008004 <__stack_size+0x10007c04>
70000110:	00008067          	ret

70000114 <setMachineTimerCmp>:
70000114:	100087b7          	lui	a5,0x10008
70000118:	fff00713          	li	a4,-1
7000011c:	00e7a623          	sw	a4,12(a5) # 1000800c <__stack_size+0x10007c0c>
70000120:	00a7a423          	sw	a0,8(a5)
70000124:	00b7a623          	sw	a1,12(a5)
70000128:	00008067          	ret

7000012c <halInit>:
7000012c:	00008067          	ret

70000130 <putHex>:
70000130:	fe010113          	addi	sp,sp,-32
70000134:	00812c23          	sw	s0,24(sp)
70000138:	00912a23          	sw	s1,20(sp)
7000013c:	01212823          	sw	s2,16(sp)
70000140:	01312623          	sw	s3,12(sp)
70000144:	00112e23          	sw	ra,28(sp)
70000148:	00050913          	mv	s2,a0
7000014c:	01c00413          	li	s0,28
70000150:	00900993          	li	s3,9
70000154:	ffc00493          	li	s1,-4
70000158:	408957b3          	sra	a5,s2,s0
7000015c:	00f7f793          	andi	a5,a5,15
70000160:	0ff7f713          	andi	a4,a5,255
70000164:	03070513          	addi	a0,a4,48
70000168:	00f9d463          	ble	a5,s3,70000170 <putHex+0x40>
7000016c:	03770513          	addi	a0,a4,55
70000170:	ffc40413          	addi	s0,s0,-4
70000174:	f3dff0ef          	jal	ra,700000b0 <putC>
70000178:	fe9410e3          	bne	s0,s1,70000158 <putHex+0x28>
7000017c:	01c12083          	lw	ra,28(sp)
70000180:	01812403          	lw	s0,24(sp)
70000184:	01412483          	lw	s1,20(sp)
70000188:	01012903          	lw	s2,16(sp)
7000018c:	00c12983          	lw	s3,12(sp)
70000190:	02010113          	addi	sp,sp,32
70000194:	00008067          	ret

70000198 <putString>:
70000198:	ff010113          	addi	sp,sp,-16
7000019c:	00812423          	sw	s0,8(sp)
700001a0:	00112623          	sw	ra,12(sp)
700001a4:	00050413          	mv	s0,a0
700001a8:	00044503          	lbu	a0,0(s0)
700001ac:	00051a63          	bnez	a0,700001c0 <putString+0x28>
700001b0:	00c12083          	lw	ra,12(sp)
700001b4:	00812403          	lw	s0,8(sp)
700001b8:	01010113          	addi	sp,sp,16
700001bc:	00008067          	ret
700001c0:	ef1ff0ef          	jal	ra,700000b0 <putC>
700001c4:	00140413          	addi	s0,s0,1
700001c8:	fe1ff06f          	j	700001a8 <putString+0x10>

700001cc <setup_pmp>:
700001cc:	01f00793          	li	a5,31
700001d0:	fff00713          	li	a4,-1
700001d4:	00000297          	auipc	t0,0x0
700001d8:	01428293          	addi	t0,t0,20 # 700001e8 <setup_pmp+0x1c>
700001dc:	30529073          	csrw	mtvec,t0
700001e0:	3b071073          	csrw	pmpaddr0,a4
700001e4:	3a079073          	csrw	pmpcfg0,a5
700001e8:	00008067          	ret

700001ec <init>:
700001ec:	ff010113          	addi	sp,sp,-16
700001f0:	00112623          	sw	ra,12(sp)
700001f4:	fd9ff0ef          	jal	ra,700001cc <setup_pmp>
700001f8:	f35ff0ef          	jal	ra,7000012c <halInit>
700001fc:	70001537          	lui	a0,0x70001
70000200:	af850513          	addi	a0,a0,-1288 # 70000af8 <__init_array_end+0x1c>
70000204:	f95ff0ef          	jal	ra,70000198 <putString>
70000208:	700017b7          	lui	a5,0x70001
7000020c:	94478793          	addi	a5,a5,-1724 # 70000944 <trapEntry>
70000210:	30579073          	csrw	mtvec,a5
70000214:	700017b7          	lui	a5,0x70001
70000218:	ec878793          	addi	a5,a5,-312 # 70000ec8 <__bss_start+0x380>
7000021c:	34079073          	csrw	mscratch,a5
70000220:	000017b7          	lui	a5,0x1
70000224:	88078793          	addi	a5,a5,-1920 # 880 <__stack_size+0x480>
70000228:	30079073          	csrw	mstatus,a5
7000022c:	30405073          	csrwi	mie,0
70000230:	804007b7          	lui	a5,0x80400
70000234:	34179073          	csrw	mepc,a5
70000238:	0000b7b7          	lui	a5,0xb
7000023c:	10078793          	addi	a5,a5,256 # b100 <__stack_size+0xad00>
70000240:	30279073          	csrw	medeleg,a5
70000244:	22200793          	li	a5,546
70000248:	30379073          	csrw	mideleg,a5
7000024c:	14305073          	csrwi	sbadaddr,0
70000250:	00c12083          	lw	ra,12(sp)
70000254:	70001537          	lui	a0,0x70001
70000258:	b1050513          	addi	a0,a0,-1264 # 70000b10 <__init_array_end+0x34>
7000025c:	01010113          	addi	sp,sp,16
70000260:	f39ff06f          	j	70000198 <putString>

70000264 <readRegister>:
70000264:	700017b7          	lui	a5,0x70001
70000268:	ec878793          	addi	a5,a5,-312 # 70000ec8 <__bss_start+0x380>
7000026c:	00251513          	slli	a0,a0,0x2
70000270:	00f50533          	add	a0,a0,a5
70000274:	00052503          	lw	a0,0(a0)
70000278:	00008067          	ret

7000027c <writeRegister>:
7000027c:	700017b7          	lui	a5,0x70001
70000280:	00251513          	slli	a0,a0,0x2
70000284:	ec878793          	addi	a5,a5,-312 # 70000ec8 <__bss_start+0x380>
70000288:	00f50533          	add	a0,a0,a5
7000028c:	00b52023          	sw	a1,0(a0)
70000290:	00008067          	ret

70000294 <redirectTrap>:
70000294:	ff010113          	addi	sp,sp,-16
70000298:	00112623          	sw	ra,12(sp)
7000029c:	de1ff0ef          	jal	ra,7000007c <stopSim>
700002a0:	343027f3          	csrr	a5,mbadaddr
700002a4:	14379073          	csrw	sbadaddr,a5
700002a8:	341027f3          	csrr	a5,mepc
700002ac:	14179073          	csrw	sepc,a5
700002b0:	342027f3          	csrr	a5,mcause
700002b4:	14279073          	csrw	scause,a5
700002b8:	105027f3          	csrr	a5,stvec
700002bc:	34179073          	csrw	mepc,a5
700002c0:	00c12083          	lw	ra,12(sp)
700002c4:	01010113          	addi	sp,sp,16
700002c8:	00008067          	ret

700002cc <emulationTrapToSupervisorTrap>:
700002cc:	700017b7          	lui	a5,0x70001
700002d0:	94478793          	addi	a5,a5,-1724 # 70000944 <trapEntry>
700002d4:	30579073          	csrw	mtvec,a5
700002d8:	343027f3          	csrr	a5,mbadaddr
700002dc:	14379073          	csrw	sbadaddr,a5
700002e0:	342027f3          	csrr	a5,mcause
700002e4:	14279073          	csrw	scause,a5
700002e8:	14151073          	csrw	sepc,a0
700002ec:	105027f3          	csrr	a5,stvec
700002f0:	34179073          	csrw	mepc,a5
700002f4:	ffffe737          	lui	a4,0xffffe
700002f8:	6dd70713          	addi	a4,a4,1757 # ffffe6dd <_sp+0x8fffd795>
700002fc:	000016b7          	lui	a3,0x1
70000300:	0035d793          	srli	a5,a1,0x3
70000304:	00e5f733          	and	a4,a1,a4
70000308:	88068693          	addi	a3,a3,-1920 # 880 <__stack_size+0x480>
7000030c:	00d76733          	or	a4,a4,a3
70000310:	1007f793          	andi	a5,a5,256
70000314:	00459593          	slli	a1,a1,0x4
70000318:	00e7e7b3          	or	a5,a5,a4
7000031c:	0205f593          	andi	a1,a1,32
70000320:	00b7e5b3          	or	a1,a5,a1
70000324:	30059073          	csrw	mstatus,a1
70000328:	00008067          	ret

7000032c <readWord>:
7000032c:	00020737          	lui	a4,0x20
70000330:	30072073          	csrs	mstatus,a4
70000334:	00000717          	auipc	a4,0x0
70000338:	01870713          	addi	a4,a4,24 # 7000034c <readWord+0x20>
7000033c:	30571073          	csrw	mtvec,a4
70000340:	00100693          	li	a3,1
70000344:	00052783          	lw	a5,0(a0)
70000348:	00000693          	li	a3,0
7000034c:	00020737          	lui	a4,0x20
70000350:	30073073          	csrc	mstatus,a4
70000354:	00068513          	mv	a0,a3
70000358:	00f5a023          	sw	a5,0(a1) # 80ff0000 <_sp+0x10fef0b8>
7000035c:	00008067          	ret

70000360 <readWordUnaligned>:
70000360:	00020737          	lui	a4,0x20
70000364:	30072073          	csrs	mstatus,a4
70000368:	00000717          	auipc	a4,0x0
7000036c:	03c70713          	addi	a4,a4,60 # 700003a4 <readWordUnaligned+0x44>
70000370:	30571073          	csrw	mtvec,a4
70000374:	00100693          	li	a3,1
70000378:	00054783          	lbu	a5,0(a0)
7000037c:	00154703          	lbu	a4,1(a0)
70000380:	00871713          	slli	a4,a4,0x8
70000384:	00e7e7b3          	or	a5,a5,a4
70000388:	00254703          	lbu	a4,2(a0)
7000038c:	01071713          	slli	a4,a4,0x10
70000390:	00e7e7b3          	or	a5,a5,a4
70000394:	00354703          	lbu	a4,3(a0)
70000398:	01871713          	slli	a4,a4,0x18
7000039c:	00e7e7b3          	or	a5,a5,a4
700003a0:	00000693          	li	a3,0
700003a4:	00020737          	lui	a4,0x20
700003a8:	30073073          	csrc	mstatus,a4
700003ac:	00068513          	mv	a0,a3
700003b0:	00f5a023          	sw	a5,0(a1)
700003b4:	00008067          	ret

700003b8 <readHalfUnaligned>:
700003b8:	00020737          	lui	a4,0x20
700003bc:	30072073          	csrs	mstatus,a4
700003c0:	00000717          	auipc	a4,0x0
700003c4:	02470713          	addi	a4,a4,36 # 700003e4 <readHalfUnaligned+0x2c>
700003c8:	30571073          	csrw	mtvec,a4
700003cc:	00100693          	li	a3,1
700003d0:	00150783          	lb	a5,1(a0)
700003d4:	00879793          	slli	a5,a5,0x8
700003d8:	00054703          	lbu	a4,0(a0)
700003dc:	00e7e7b3          	or	a5,a5,a4
700003e0:	00000693          	li	a3,0
700003e4:	00020737          	lui	a4,0x20
700003e8:	30073073          	csrc	mstatus,a4
700003ec:	00068513          	mv	a0,a3
700003f0:	00f5a023          	sw	a5,0(a1)
700003f4:	00008067          	ret

700003f8 <writeWord>:
700003f8:	00020737          	lui	a4,0x20
700003fc:	30072073          	csrs	mstatus,a4
70000400:	00000717          	auipc	a4,0x0
70000404:	01870713          	addi	a4,a4,24 # 70000418 <writeWord+0x20>
70000408:	30571073          	csrw	mtvec,a4
7000040c:	00100793          	li	a5,1
70000410:	00b52023          	sw	a1,0(a0)
70000414:	00000793          	li	a5,0
70000418:	00020737          	lui	a4,0x20
7000041c:	30073073          	csrc	mstatus,a4
70000420:	00078513          	mv	a0,a5
70000424:	00008067          	ret

70000428 <writeWordUnaligned>:
70000428:	00020737          	lui	a4,0x20
7000042c:	30072073          	csrs	mstatus,a4
70000430:	00000717          	auipc	a4,0x0
70000434:	03070713          	addi	a4,a4,48 # 70000460 <writeWordUnaligned+0x38>
70000438:	30571073          	csrw	mtvec,a4
7000043c:	00100793          	li	a5,1
70000440:	00b50023          	sb	a1,0(a0)
70000444:	0085d593          	srli	a1,a1,0x8
70000448:	00b500a3          	sb	a1,1(a0)
7000044c:	0085d593          	srli	a1,a1,0x8
70000450:	00b50123          	sb	a1,2(a0)
70000454:	0085d593          	srli	a1,a1,0x8
70000458:	00b501a3          	sb	a1,3(a0)
7000045c:	00000793          	li	a5,0
70000460:	00020737          	lui	a4,0x20
70000464:	30073073          	csrc	mstatus,a4
70000468:	00078513          	mv	a0,a5
7000046c:	00008067          	ret

70000470 <writeShortUnaligned>:
70000470:	00020737          	lui	a4,0x20
70000474:	30072073          	csrs	mstatus,a4
70000478:	00000717          	auipc	a4,0x0
7000047c:	02070713          	addi	a4,a4,32 # 70000498 <writeShortUnaligned+0x28>
70000480:	30571073          	csrw	mtvec,a4
70000484:	00100793          	li	a5,1
70000488:	00b50023          	sb	a1,0(a0)
7000048c:	0085d593          	srli	a1,a1,0x8
70000490:	00b500a3          	sb	a1,1(a0)
70000494:	00000793          	li	a5,0
70000498:	00020737          	lui	a4,0x20
7000049c:	30073073          	csrc	mstatus,a4
700004a0:	00078513          	mv	a0,a5
700004a4:	00008067          	ret

700004a8 <readInstruction>:
700004a8:	fe010113          	addi	sp,sp,-32
700004ac:	00112e23          	sw	ra,28(sp)
700004b0:	00812c23          	sw	s0,24(sp)
700004b4:	00257793          	andi	a5,a0,2
700004b8:	06078263          	beqz	a5,7000051c <readInstruction+0x74>
700004bc:	00050413          	mv	s0,a0
700004c0:	00810593          	addi	a1,sp,8
700004c4:	ffe50513          	addi	a0,a0,-2
700004c8:	e65ff0ef          	jal	ra,7000032c <readWord>
700004cc:	00a15783          	lhu	a5,10(sp)
700004d0:	00300713          	li	a4,3
700004d4:	00f12423          	sw	a5,8(sp)
700004d8:	0037f793          	andi	a5,a5,3
700004dc:	02e79263          	bne	a5,a4,70000500 <readInstruction+0x58>
700004e0:	00c10593          	addi	a1,sp,12
700004e4:	00240513          	addi	a0,s0,2
700004e8:	e45ff0ef          	jal	ra,7000032c <readWord>
700004ec:	00c12783          	lw	a5,12(sp)
700004f0:	01079713          	slli	a4,a5,0x10
700004f4:	00812783          	lw	a5,8(sp)
700004f8:	00e7e7b3          	or	a5,a5,a4
700004fc:	00f12423          	sw	a5,8(sp)
70000500:	00812783          	lw	a5,8(sp)
70000504:	00f12623          	sw	a5,12(sp)
70000508:	01c12083          	lw	ra,28(sp)
7000050c:	01812403          	lw	s0,24(sp)
70000510:	00c12503          	lw	a0,12(sp)
70000514:	02010113          	addi	sp,sp,32
70000518:	00008067          	ret
7000051c:	00c10593          	addi	a1,sp,12
70000520:	e0dff0ef          	jal	ra,7000032c <readWord>
70000524:	fe5ff06f          	j	70000508 <readInstruction+0x60>

70000528 <trap>:
70000528:	fd010113          	addi	sp,sp,-48
7000052c:	02112623          	sw	ra,44(sp)
70000530:	02812423          	sw	s0,40(sp)
70000534:	02912223          	sw	s1,36(sp)
70000538:	03212023          	sw	s2,32(sp)
7000053c:	01312e23          	sw	s3,28(sp)
70000540:	01412c23          	sw	s4,24(sp)
70000544:	34202473          	csrr	s0,mcause
70000548:	04045063          	bgez	s0,70000588 <trap+0x60>
7000054c:	0ff47413          	andi	s0,s0,255
70000550:	00700793          	li	a5,7
70000554:	1ef41c63          	bne	s0,a5,7000074c <trap+0x224>
70000558:	02000793          	li	a5,32
7000055c:	1447a073          	csrs	sip,a5
70000560:	08000793          	li	a5,128
70000564:	3047b073          	csrc	mie,a5
70000568:	02c12083          	lw	ra,44(sp)
7000056c:	02812403          	lw	s0,40(sp)
70000570:	02412483          	lw	s1,36(sp)
70000574:	02012903          	lw	s2,32(sp)
70000578:	01c12983          	lw	s3,28(sp)
7000057c:	01812a03          	lw	s4,24(sp)
70000580:	03010113          	addi	sp,sp,48
70000584:	00008067          	ret
70000588:	00400793          	li	a5,4
7000058c:	08f40263          	beq	s0,a5,70000610 <trap+0xe8>
70000590:	0287e863          	bltu	a5,s0,700005c0 <trap+0x98>
70000594:	00200793          	li	a5,2
70000598:	18f40863          	beq	s0,a5,70000728 <trap+0x200>
7000059c:	70001537          	lui	a0,0x70001
700005a0:	b3450513          	addi	a0,a0,-1228 # 70000b34 <__init_array_end+0x58>
700005a4:	bf5ff0ef          	jal	ra,70000198 <putString>
700005a8:	00040513          	mv	a0,s0
700005ac:	b85ff0ef          	jal	ra,70000130 <putHex>
700005b0:	70001537          	lui	a0,0x70001
700005b4:	b3050513          	addi	a0,a0,-1232 # 70000b30 <__init_array_end+0x54>
700005b8:	be1ff0ef          	jal	ra,70000198 <putString>
700005bc:	1900006f          	j	7000074c <trap+0x224>
700005c0:	00600793          	li	a5,6
700005c4:	0ef40663          	beq	s0,a5,700006b0 <trap+0x188>
700005c8:	00900793          	li	a5,9
700005cc:	fcf418e3          	bne	s0,a5,7000059c <trap+0x74>
700005d0:	70001437          	lui	s0,0x70001
700005d4:	f4840413          	addi	s0,s0,-184 # 70000f48 <_sp>
700005d8:	fc442783          	lw	a5,-60(s0)
700005dc:	00100713          	li	a4,1
700005e0:	fa842503          	lw	a0,-88(s0)
700005e4:	32e78463          	beq	a5,a4,7000090c <trap+0x3e4>
700005e8:	00200713          	li	a4,2
700005ec:	32e78c63          	beq	a5,a4,70000924 <trap+0x3fc>
700005f0:	34079063          	bnez	a5,70000930 <trap+0x408>
700005f4:	fac42583          	lw	a1,-84(s0)
700005f8:	b1dff0ef          	jal	ra,70000114 <setMachineTimerCmp>
700005fc:	08000793          	li	a5,128
70000600:	3047a073          	csrs	mie,a5
70000604:	02000793          	li	a5,32
70000608:	1447b073          	csrc	sip,a5
7000060c:	3080006f          	j	70000914 <trap+0x3ec>
70000610:	34102473          	csrr	s0,mepc
70000614:	300029f3          	csrr	s3,mstatus
70000618:	00040513          	mv	a0,s0
7000061c:	e8dff0ef          	jal	ra,700004a8 <readInstruction>
70000620:	00050493          	mv	s1,a0
70000624:	34302573          	csrr	a0,mbadaddr
70000628:	00c4d793          	srli	a5,s1,0xc
7000062c:	0077f793          	andi	a5,a5,7
70000630:	00200713          	li	a4,2
70000634:	02e78a63          	beq	a5,a4,70000668 <trap+0x140>
70000638:	00500713          	li	a4,5
7000063c:	02e78c63          	beq	a5,a4,70000674 <trap+0x14c>
70000640:	00100713          	li	a4,1
70000644:	00e79863          	bne	a5,a4,70000654 <trap+0x12c>
70000648:	00c10593          	addi	a1,sp,12
7000064c:	d6dff0ef          	jal	ra,700003b8 <readHalfUnaligned>
70000650:	00050913          	mv	s2,a0
70000654:	02090a63          	beqz	s2,70000688 <trap+0x160>
70000658:	00098593          	mv	a1,s3
7000065c:	00040513          	mv	a0,s0
70000660:	c6dff0ef          	jal	ra,700002cc <emulationTrapToSupervisorTrap>
70000664:	f05ff06f          	j	70000568 <trap+0x40>
70000668:	00c10593          	addi	a1,sp,12
7000066c:	cf5ff0ef          	jal	ra,70000360 <readWordUnaligned>
70000670:	fe1ff06f          	j	70000650 <trap+0x128>
70000674:	00c10593          	addi	a1,sp,12
70000678:	d41ff0ef          	jal	ra,700003b8 <readHalfUnaligned>
7000067c:	01051913          	slli	s2,a0,0x10
70000680:	01095913          	srli	s2,s2,0x10
70000684:	fd1ff06f          	j	70000654 <trap+0x12c>
70000688:	00c12583          	lw	a1,12(sp)
7000068c:	0074d513          	srli	a0,s1,0x7
70000690:	01f57513          	andi	a0,a0,31
70000694:	be9ff0ef          	jal	ra,7000027c <writeRegister>
70000698:	00440413          	addi	s0,s0,4
7000069c:	34141073          	csrw	mepc,s0
700006a0:	700017b7          	lui	a5,0x70001
700006a4:	94478793          	addi	a5,a5,-1724 # 70000944 <trapEntry>
700006a8:	30579073          	csrw	mtvec,a5
700006ac:	ebdff06f          	j	70000568 <trap+0x40>
700006b0:	341024f3          	csrr	s1,mepc
700006b4:	300029f3          	csrr	s3,mstatus
700006b8:	00048513          	mv	a0,s1
700006bc:	dedff0ef          	jal	ra,700004a8 <readInstruction>
700006c0:	00050413          	mv	s0,a0
700006c4:	34302973          	csrr	s2,mbadaddr
700006c8:	01455513          	srli	a0,a0,0x14
700006cc:	01f57513          	andi	a0,a0,31
700006d0:	b95ff0ef          	jal	ra,70000264 <readRegister>
700006d4:	00c45413          	srli	s0,s0,0xc
700006d8:	00747413          	andi	s0,s0,7
700006dc:	00100793          	li	a5,1
700006e0:	00050593          	mv	a1,a0
700006e4:	00f40e63          	beq	s0,a5,70000700 <trap+0x1d8>
700006e8:	00200793          	li	a5,2
700006ec:	02f40263          	beq	s0,a5,70000710 <trap+0x1e8>
700006f0:	020a0663          	beqz	s4,7000071c <trap+0x1f4>
700006f4:	00098593          	mv	a1,s3
700006f8:	00048513          	mv	a0,s1
700006fc:	f65ff06f          	j	70000660 <trap+0x138>
70000700:	00090513          	mv	a0,s2
70000704:	d6dff0ef          	jal	ra,70000470 <writeShortUnaligned>
70000708:	00050a13          	mv	s4,a0
7000070c:	fe5ff06f          	j	700006f0 <trap+0x1c8>
70000710:	00090513          	mv	a0,s2
70000714:	d15ff0ef          	jal	ra,70000428 <writeWordUnaligned>
70000718:	ff1ff06f          	j	70000708 <trap+0x1e0>
7000071c:	00448493          	addi	s1,s1,4
70000720:	34149073          	csrw	mepc,s1
70000724:	f7dff06f          	j	700006a0 <trap+0x178>
70000728:	34102973          	csrr	s2,mepc
7000072c:	30002a73          	csrr	s4,mstatus
70000730:	343024f3          	csrr	s1,mbadaddr
70000734:	02f00693          	li	a3,47
70000738:	07f4f713          	andi	a4,s1,127
7000073c:	00c4d793          	srli	a5,s1,0xc
70000740:	00d70a63          	beq	a4,a3,70000754 <trap+0x22c>
70000744:	07300693          	li	a3,115
70000748:	12d70663          	beq	a4,a3,70000874 <trap+0x34c>
7000074c:	b49ff0ef          	jal	ra,70000294 <redirectTrap>
70000750:	e19ff06f          	j	70000568 <trap+0x40>
70000754:	0077f793          	andi	a5,a5,7
70000758:	fe879ae3          	bne	a5,s0,7000074c <trap+0x224>
7000075c:	00f4d513          	srli	a0,s1,0xf
70000760:	01f57513          	andi	a0,a0,31
70000764:	b01ff0ef          	jal	ra,70000264 <readRegister>
70000768:	00050993          	mv	s3,a0
7000076c:	0144d513          	srli	a0,s1,0x14
70000770:	01f57513          	andi	a0,a0,31
70000774:	af1ff0ef          	jal	ra,70000264 <readRegister>
70000778:	00050413          	mv	s0,a0
7000077c:	00c10593          	addi	a1,sp,12
70000780:	00098513          	mv	a0,s3
70000784:	ba9ff0ef          	jal	ra,7000032c <readWord>
70000788:	00050863          	beqz	a0,70000798 <trap+0x270>
7000078c:	000a0593          	mv	a1,s4
70000790:	00090513          	mv	a0,s2
70000794:	ecdff06f          	j	70000660 <trap+0x138>
70000798:	01b4d793          	srli	a5,s1,0x1b
7000079c:	00c00713          	li	a4,12
700007a0:	0ae78863          	beq	a5,a4,70000850 <trap+0x328>
700007a4:	02f76663          	bltu	a4,a5,700007d0 <trap+0x2a8>
700007a8:	00100713          	li	a4,1
700007ac:	06e78663          	beq	a5,a4,70000818 <trap+0x2f0>
700007b0:	06078063          	beqz	a5,70000810 <trap+0x2e8>
700007b4:	00400713          	li	a4,4
700007b8:	08e78663          	beq	a5,a4,70000844 <trap+0x31c>
700007bc:	00800713          	li	a4,8
700007c0:	f8e796e3          	bne	a5,a4,7000074c <trap+0x224>
700007c4:	00c12783          	lw	a5,12(sp)
700007c8:	00f46433          	or	s0,s0,a5
700007cc:	04c0006f          	j	70000818 <trap+0x2f0>
700007d0:	01400713          	li	a4,20
700007d4:	08e78463          	beq	a5,a4,7000085c <trap+0x334>
700007d8:	00f76e63          	bltu	a4,a5,700007f4 <trap+0x2cc>
700007dc:	01000713          	li	a4,16
700007e0:	f6e796e3          	bne	a5,a4,7000074c <trap+0x224>
700007e4:	00c12783          	lw	a5,12(sp)
700007e8:	0287d863          	ble	s0,a5,70000818 <trap+0x2f0>
700007ec:	00078413          	mv	s0,a5
700007f0:	0280006f          	j	70000818 <trap+0x2f0>
700007f4:	01800713          	li	a4,24
700007f8:	06e78863          	beq	a5,a4,70000868 <trap+0x340>
700007fc:	01c00713          	li	a4,28
70000800:	f4e796e3          	bne	a5,a4,7000074c <trap+0x224>
70000804:	00c12783          	lw	a5,12(sp)
70000808:	00f47863          	bleu	a5,s0,70000818 <trap+0x2f0>
7000080c:	fe1ff06f          	j	700007ec <trap+0x2c4>
70000810:	00c12783          	lw	a5,12(sp)
70000814:	00f40433          	add	s0,s0,a5
70000818:	00040593          	mv	a1,s0
7000081c:	00098513          	mv	a0,s3
70000820:	bd9ff0ef          	jal	ra,700003f8 <writeWord>
70000824:	f60514e3          	bnez	a0,7000078c <trap+0x264>
70000828:	00c12583          	lw	a1,12(sp)
7000082c:	0074d513          	srli	a0,s1,0x7
70000830:	01f57513          	andi	a0,a0,31
70000834:	a49ff0ef          	jal	ra,7000027c <writeRegister>
70000838:	00490913          	addi	s2,s2,4
7000083c:	34191073          	csrw	mepc,s2
70000840:	e61ff06f          	j	700006a0 <trap+0x178>
70000844:	00c12783          	lw	a5,12(sp)
70000848:	00f44433          	xor	s0,s0,a5
7000084c:	fcdff06f          	j	70000818 <trap+0x2f0>
70000850:	00c12783          	lw	a5,12(sp)
70000854:	00f47433          	and	s0,s0,a5
70000858:	fc1ff06f          	j	70000818 <trap+0x2f0>
7000085c:	00c12783          	lw	a5,12(sp)
70000860:	faf45ce3          	ble	a5,s0,70000818 <trap+0x2f0>
70000864:	f89ff06f          	j	700007ec <trap+0x2c4>
70000868:	00c12783          	lw	a5,12(sp)
7000086c:	fa87f6e3          	bleu	s0,a5,70000818 <trap+0x2f0>
70000870:	f7dff06f          	j	700007ec <trap+0x2c4>
70000874:	0037f793          	andi	a5,a5,3
70000878:	04878863          	beq	a5,s0,700008c8 <trap+0x3a0>
7000087c:	00300713          	li	a4,3
70000880:	04e78463          	beq	a5,a4,700008c8 <trap+0x3a0>
70000884:	00100713          	li	a4,1
70000888:	00100413          	li	s0,1
7000088c:	00e78463          	beq	a5,a4,70000894 <trap+0x36c>
70000890:	a05ff0ef          	jal	ra,70000294 <redirectTrap>
70000894:	00001737          	lui	a4,0x1
70000898:	0144d793          	srli	a5,s1,0x14
7000089c:	c0070693          	addi	a3,a4,-1024 # c00 <__stack_size+0x800>
700008a0:	02d7e063          	bltu	a5,a3,700008c0 <trap+0x398>
700008a4:	c0270713          	addi	a4,a4,-1022
700008a8:	02f77863          	bleu	a5,a4,700008d8 <trap+0x3b0>
700008ac:	fffff737          	lui	a4,0xfffff
700008b0:	38070713          	addi	a4,a4,896 # fffff380 <_sp+0x8fffe438>
700008b4:	00e787b3          	add	a5,a5,a4
700008b8:	00200713          	li	a4,2
700008bc:	04f77463          	bleu	a5,a4,70000904 <trap+0x3dc>
700008c0:	9d5ff0ef          	jal	ra,70000294 <redirectTrap>
700008c4:	01c0006f          	j	700008e0 <trap+0x3b8>
700008c8:	00f4d413          	srli	s0,s1,0xf
700008cc:	01f47413          	andi	s0,s0,31
700008d0:	00803433          	snez	s0,s0
700008d4:	fc1ff06f          	j	70000894 <trap+0x36c>
700008d8:	825ff0ef          	jal	ra,700000fc <rdtime>
700008dc:	00050993          	mv	s3,a0
700008e0:	00040463          	beqz	s0,700008e8 <trap+0x3c0>
700008e4:	9b1ff0ef          	jal	ra,70000294 <redirectTrap>
700008e8:	0074d493          	srli	s1,s1,0x7
700008ec:	00098593          	mv	a1,s3
700008f0:	01f4f513          	andi	a0,s1,31
700008f4:	989ff0ef          	jal	ra,7000027c <writeRegister>
700008f8:	00490913          	addi	s2,s2,4
700008fc:	34191073          	csrw	mepc,s2
70000900:	c69ff06f          	j	70000568 <trap+0x40>
70000904:	805ff0ef          	jal	ra,70000108 <rdtimeh>
70000908:	fd5ff06f          	j	700008dc <trap+0x3b4>
7000090c:	0ff57513          	andi	a0,a0,255
70000910:	fa0ff0ef          	jal	ra,700000b0 <putC>
70000914:	341027f3          	csrr	a5,mepc
70000918:	00478793          	addi	a5,a5,4
7000091c:	34179073          	csrw	mepc,a5
70000920:	c49ff06f          	j	70000568 <trap+0x40>
70000924:	fa8ff0ef          	jal	ra,700000cc <getC>
70000928:	faa42423          	sw	a0,-88(s0)
7000092c:	fe9ff06f          	j	70000914 <trap+0x3ec>
70000930:	70001537          	lui	a0,0x70001
70000934:	b2450513          	addi	a0,a0,-1244 # 70000b24 <__init_array_end+0x48>
70000938:	861ff0ef          	jal	ra,70000198 <putString>
7000093c:	f40ff0ef          	jal	ra,7000007c <stopSim>
70000940:	c29ff06f          	j	70000568 <trap+0x40>

70000944 <trapEntry>:
70000944:	34011173          	csrrw	sp,mscratch,sp
70000948:	00112223          	sw	ra,4(sp)
7000094c:	00312623          	sw	gp,12(sp)
70000950:	00412823          	sw	tp,16(sp)
70000954:	00512a23          	sw	t0,20(sp)
70000958:	00612c23          	sw	t1,24(sp)
7000095c:	00712e23          	sw	t2,28(sp)
70000960:	02812023          	sw	s0,32(sp)
70000964:	02912223          	sw	s1,36(sp)
70000968:	02a12423          	sw	a0,40(sp)
7000096c:	02b12623          	sw	a1,44(sp)
70000970:	02c12823          	sw	a2,48(sp)
70000974:	02d12a23          	sw	a3,52(sp)
70000978:	02e12c23          	sw	a4,56(sp)
7000097c:	02f12e23          	sw	a5,60(sp)
70000980:	05012023          	sw	a6,64(sp)
70000984:	05112223          	sw	a7,68(sp)
70000988:	05212423          	sw	s2,72(sp)
7000098c:	05312623          	sw	s3,76(sp)
70000990:	05412823          	sw	s4,80(sp)
70000994:	05512a23          	sw	s5,84(sp)
70000998:	05612c23          	sw	s6,88(sp)
7000099c:	05712e23          	sw	s7,92(sp)
700009a0:	07812023          	sw	s8,96(sp)
700009a4:	07912223          	sw	s9,100(sp)
700009a8:	07a12423          	sw	s10,104(sp)
700009ac:	07b12623          	sw	s11,108(sp)
700009b0:	07c12823          	sw	t3,112(sp)
700009b4:	07d12a23          	sw	t4,116(sp)
700009b8:	07e12c23          	sw	t5,120(sp)
700009bc:	07f12e23          	sw	t6,124(sp)
700009c0:	b69ff0ef          	jal	ra,70000528 <trap>
700009c4:	00412083          	lw	ra,4(sp)
700009c8:	00c12183          	lw	gp,12(sp)
700009cc:	01012203          	lw	tp,16(sp)
700009d0:	01412283          	lw	t0,20(sp)
700009d4:	01812303          	lw	t1,24(sp)
700009d8:	01c12383          	lw	t2,28(sp)
700009dc:	02012403          	lw	s0,32(sp)
700009e0:	02412483          	lw	s1,36(sp)
700009e4:	02812503          	lw	a0,40(sp)
700009e8:	02c12583          	lw	a1,44(sp)
700009ec:	03012603          	lw	a2,48(sp)
700009f0:	03412683          	lw	a3,52(sp)
700009f4:	03812703          	lw	a4,56(sp)
700009f8:	03c12783          	lw	a5,60(sp)
700009fc:	04012803          	lw	a6,64(sp)
70000a00:	04412883          	lw	a7,68(sp)
70000a04:	04812903          	lw	s2,72(sp)
70000a08:	04c12983          	lw	s3,76(sp)
70000a0c:	05012a03          	lw	s4,80(sp)
70000a10:	05412a83          	lw	s5,84(sp)
70000a14:	05812b03          	lw	s6,88(sp)
70000a18:	05c12b83          	lw	s7,92(sp)
70000a1c:	06012c03          	lw	s8,96(sp)
70000a20:	06412c83          	lw	s9,100(sp)
70000a24:	06812d03          	lw	s10,104(sp)
70000a28:	06c12d83          	lw	s11,108(sp)
70000a2c:	07012e03          	lw	t3,112(sp)
70000a30:	07412e83          	lw	t4,116(sp)
70000a34:	07812f03          	lw	t5,120(sp)
70000a38:	07c12f83          	lw	t6,124(sp)
70000a3c:	34011173          	csrrw	sp,mscratch,sp
70000a40:	30200073          	mret

70000a44 <__libc_init_array>:
70000a44:	ff010113          	addi	sp,sp,-16
70000a48:	00812423          	sw	s0,8(sp)
70000a4c:	00912223          	sw	s1,4(sp)
70000a50:	00000417          	auipc	s0,0x0
70000a54:	08c40413          	addi	s0,s0,140 # 70000adc <__init_array_end>
70000a58:	00000497          	auipc	s1,0x0
70000a5c:	08448493          	addi	s1,s1,132 # 70000adc <__init_array_end>
70000a60:	408484b3          	sub	s1,s1,s0
70000a64:	01212023          	sw	s2,0(sp)
70000a68:	00112623          	sw	ra,12(sp)
70000a6c:	4024d493          	srai	s1,s1,0x2
70000a70:	00000913          	li	s2,0
70000a74:	04991063          	bne	s2,s1,70000ab4 <__libc_init_array+0x70>
70000a78:	00000417          	auipc	s0,0x0
70000a7c:	06440413          	addi	s0,s0,100 # 70000adc <__init_array_end>
70000a80:	00000497          	auipc	s1,0x0
70000a84:	05c48493          	addi	s1,s1,92 # 70000adc <__init_array_end>
70000a88:	408484b3          	sub	s1,s1,s0
70000a8c:	decff0ef          	jal	ra,70000078 <_init>
70000a90:	4024d493          	srai	s1,s1,0x2
70000a94:	00000913          	li	s2,0
70000a98:	02991863          	bne	s2,s1,70000ac8 <__libc_init_array+0x84>
70000a9c:	00c12083          	lw	ra,12(sp)
70000aa0:	00812403          	lw	s0,8(sp)
70000aa4:	00412483          	lw	s1,4(sp)
70000aa8:	00012903          	lw	s2,0(sp)
70000aac:	01010113          	addi	sp,sp,16
70000ab0:	00008067          	ret
70000ab4:	00042783          	lw	a5,0(s0)
70000ab8:	00190913          	addi	s2,s2,1
70000abc:	00440413          	addi	s0,s0,4
70000ac0:	000780e7          	jalr	a5
70000ac4:	fb1ff06f          	j	70000a74 <__libc_init_array+0x30>
70000ac8:	00042783          	lw	a5,0(s0)
70000acc:	00190913          	addi	s2,s2,1
70000ad0:	00440413          	addi	s0,s0,4
70000ad4:	000780e7          	jalr	a5
70000ad8:	fc1ff06f          	j	70000a98 <__libc_init_array+0x54>
