.data 
    #vector1: .asciiz  "vector1: \n"
    #vector2: .asciiz  "vector2: \n"
    orderVector: .space 16
    vectorOfValues: .space 16
    space: .asciiz " "
    enter: .asciiz "\n"
   
.text
   main:
   
       #size of vectors
       #addi $t8, $zero, 16
       
       #index of orderVector
       addi $t0, $zero, 0
       
       #index of vectorOfValues
       addi $t1, $zero, 0
       
       addi $t2, $zero, 1
       
       assigning:
           beq $t0, 16, endOfAssigning
           
           li $v0, 5
           syscall
           move $t3, $v0
           
           bne $t3, 0, else
               sw $t3, orderVector($t0)
               j endOfIf
               
           else:
               sw $t2, orderVector($t0)
               sw $t3, vectorOfValues($t1)
               
               addi $t1, $t1, 4
               
           endOfIf:
           
           addi $t0, $t0, 4           
           
           j assigning
              
       endOfAssigning:
       
       addi $t0, $zero, 0
       
       printingOrderVector:
           beq $t0, 16, endOfPrintingOrderVector
           
           lw $t2, orderVector($t0)
           
           li $v0, 1
           move $a0, $t2
           syscall
           
           li $v0, 4
           la $a0, space
           syscall
           
           addi $t0, $t0, 4
               
           j printingOrderVector
       
       endOfPrintingOrderVector:
       
       addi $t0, $zero, 0
       
       li $v0, 4
       la $a0, enter
       syscall
       
       printingVectorOfValues:
           beq $t0, $t1, endOfPrintingVectorOfValues
           
           lw $t2, vectorOfValues($t0)
           
           li $v0, 1
           move $a0, $t2
           syscall
           
           li $v0, 4
           la $a0, space
           syscall
       
           addi $t0, $t0, 4
           
           j printingVectorOfValues
       
       endOfPrintingVectorOfValues:
       
       addi $t0, $zero, 0
       addi $s0, $zero, 0
       
       li $v0, 4
       la $a0, enter
       syscall
       
       scalarProduct:
           beq $t0, $t1, exit
           
           lw $t2, vectorOfValues($t0)
           lw $t3, orderVector($t0)
           
           mul $t3, $t3, $t2
           add $s0, $s0, $t3
       
           addi $t0, $t0, 4
           
           j scalarProduct
       
       exit:
           
           li $v0, 1
           move $a0, $s0
           syscall           
           
           li $v0, 10
           syscall
       
       
       
       
           
