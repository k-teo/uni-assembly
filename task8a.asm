.data
    orderVector1: .space 16
    vectorOfValues1: .space 16
    orderVector2: .space 16
    vectorOfValues2: .space 16
    
    enter: .asciiz "\n lala"
.text
   main:
   
       #size of vectors
       #addi $t8, $zero, 16
       
       #index of orderVector
       addi $t0, $zero, 0
       
       #index of vectorOfValues
       addi $t1, $zero, 0
       
       addi $t2, $zero, 1
       
       assigning1:
           beq $t0, 16, endOfAssigning1
           
           li $v0, 5
           syscall
           move $t3, $v0
           
           bne $t3, 0, else1
               sw $t3, orderVector1($t0)
               j endOfIf1
               
           else1:
               sw $t2, orderVector1($t0)
               sw $t3, vectorOfValues1($t1)
               
               addi $t1, $t1, 4
               
           endOfIf1:
           
           addi $t0, $t0, 4           
           
           j assigning1
              
       endOfAssigning1:
       
       addi $t0, $zero, 0
       
       
       assigning2:
           beq $t0, 16, endOfAssigning2
           
           li $v0, 5
           syscall
           move $t3, $v0
           
           bne $t3, 0, else2
               sw $t3, orderVector2($t0)
               j endOfIf2
               
           else2:
               sw $t2, orderVector2($t0)
               sw $t3, vectorOfValues2($t1)
               
               addi $t1, $t1, 4
               
           endOfIf2:
           
           addi $t0, $t0, 4           
           
           j assigning2
              
       endOfAssigning2:
       
       addi $t0, $zero, 0
       
       printingOrderVector1:
           beq $t0, 16, endOfPrintingOrderVector1
           
           lw $t2, orderVector1($t0)
           
           li $v0, 1
           move $a0, $t2
           syscall
           
           li $a0, 32
           li $v0, 11  
           syscall
           
           addi $t0, $t0, 4
               
           j printingOrderVector1
       
       endOfPrintingOrderVector1:
       
       addi $t0, $zero, 0
       
       li $v0, 4
       la $a0, enter
       syscall
       
       printingVectorOfValues1:
           beq $t0, $t1, endOfPrintingVectorOfValues1
           
           lw $t2, vectorOfValues1($t0)
           
           li $v0, 1
           move $a0, $t2
           syscall
           
           li $a0, 32
           li $v0, 11  
           syscall
       
           addi $t0, $t0, 4
           
           j printingVectorOfValues1
       
       endOfPrintingVectorOfValues1:
       
       addi $t0, $zero, 0
       
       printingOrderVector2:
           beq $t0, 16, endOfPrintingOrderVector2
           
           lw $t2, orderVector2($t0)
           
           li $v0, 1
           move $a0, $t2
           syscall
           
           li $a0, 32
           li $v0, 11  # syscall number for printing character
           syscall
           
           addi $t0, $t0, 4
               
           j printingOrderVector2
       
       endOfPrintingOrderVector2:
       
       addi $t0, $zero, 0
       
       li $a0, 32
       li $v0, 11  
       syscall
       
       printingVectorOfValues2:
           beq $t0, $t1, endOfPrintingVectorOfValues2
           
           lw $t2, vectorOfValues2($t0)
           
           li $v0, 1
           move $a0, $t2
           syscall
           
           li $a0, 32
           li $v0, 11  
           syscall
       
           addi $t0, $t0, 4
           
           j printingVectorOfValues2
       
       endOfPrintingVectorOfValues2:
       
       addi $t0, $zero, 0
       addi $s0, $zero, 0
       
       li $v0, 4
       la $a0, enter
       syscall
       
       scalarProduct:
           beq $t0, $t1, exit
           
           lw $t2, vectorOfValues1($t0)
           lw $t3, orderVector1($t0)
           
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
       
       
       
       
           
