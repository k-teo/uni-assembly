.data
   result: .asciiz "(a+b)-(c-d)="
.text
   li $v0, 5
   syscall
   move $t0, $v0
   
   li $v0, 5
   syscall
   move $t1, $v0
   
   li $v0, 5
   syscall
   move $t2, $v0
   
   li $v0, 5
   syscall
   move $t3, $v0
   
   add $t0, $t0, $t1
   sub $t2, $t2, $t3
   sub $t0, $t0, $t2
   
   li $v0, 4
   la $a0, result
   syscall
   
   li $v0, 1
   move $a0, $t0
   syscall
   
