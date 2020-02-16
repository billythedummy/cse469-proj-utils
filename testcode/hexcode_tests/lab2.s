	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"lab2.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Hello, World %d!\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #2
	bl	add1
	mov	r3, r0
	mov	r1, r3
	ldr	r0, .L3
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LC0
	.size	main, .-main
	.align	2
	.global	add1
	.syntax unified
	.arm
	.fpu softvfp
	.type	add1, %function
add1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	add1, .-add1
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
