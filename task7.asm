.data
   result: .asciiz "factorial of given number is: "
   e:  .asciiz "error: number should be >=0"
.text
   main:
      addi $t0, $zero, 2
   
      li $v0, 5
      syscall
      move $t1, $v0
      
      blt $t1, $zero, error
      
      addi $t2, $zero, 1
      
      for:
         bgt $t0, $t1, exit
         
         mul $t2, $t2, $t0
         
         addi $t0, $t0, 1
         j for
         
      exit:  
         li $v0, 4
         la $a0, result
         syscall
         
         li $v0, 1
         move $a0, $t2
         syscall
         
         j end
         
      error:
         li $v0, 4
         la $a0, e
         syscall
      
      end:
