.data
     orderVector_1:      .space 1024
     vectorOfValues_1:   .space 1024
     
     orderVector_2:      .space 1024
     vectorOfValues_2:   .space 1024
     
     size:       .asciiz  "\nSize of both vectors: "
     vector_1:   .asciiz  "\nValues for vector_1: \n"
     vector_2:   .asciiz  "\nValues for vector_2: \n"
     vectors_1:  .asciiz  "\nOrder vector and vector of values for vector_1:\n"
     vectors_2:  .asciiz  "\nOrder vector and vector of values for vector_2:\n"
     result:     .asciiz  "\nThe scalar product of both vectors is: "
     enter:      .asciiz  "\n"

.text
    main:
        li $v0, 4
        la $a0, size
        syscall
        
        #size
        li $v0, 5
        syscall
        move $t0, $v0    
        
        addi $t1, $zero, 4
        
        mul $t0, $t0, $t1
        
        #index of orderVector
        addi $t1, $zero, 0
        
        #index of vectorOfValues1
        addi $t2, $zero, 0
        
        #index of vectorOfValues2
        addi $t3, $zero, 0
        
        #always 1
        addi $t4, $zero, 1
        
        li $v0, 4
        la $a0, vector_1
        syscall
        
        assigning_1:
            beq $t1, $t0, endOfAssigning_1
                  
            li $v0, 5
            syscall
            move $t5, $v0
            
            bne $t5, 0, else_1
                sw $t5, orderVector_1($t1)
                
                j endOfIf_1
                
            else_1:
                sw $t4, orderVector_1($t1)
                sw $t5, vectorOfValues_1($t2)
                
                addi $t2, $t2, 4
                
            endOfIf_1:
            
            addi $t1, $t1, 4           
            
            j assigning_1
        
        endOfAssigning_1:
       
        addi $t1, $zero, 0
        
        li $v0, 4
        la $a0, vector_2
        syscall
        
        assigning_2:
            beq $t1, $t0, endOfAssigning_2
                  
            li $v0, 5
            syscall
            move $t5, $v0
            
            bne $t5, 0, else_2
                sw $t5, orderVector_2($t1)
                
                j endOfIf_2
                
            else_2:
                sw $t4, orderVector_2($t1)
                sw $t5, vectorOfValues_2($t3)
                
                addi $t3, $t3, 4
                
            endOfIf_2:
            
            addi $t1, $t1, 4           
            
            j assigning_2
        
        endOfAssigning_2:
       
        addi $t1, $zero, 0
        
        li $v0, 4
        la $a0, vectors_1
        syscall
        
        printingOrderVector_1:
            beq $t1, $t0, endOfPrintingOrderVector_1
               
            lw $t4, orderVector_1($t1)
            
            li $v0, 1
            move $a0, $t4
            syscall
            
            li $a0, 32
            li $v0, 11  
            syscall
            
            addi $t1, $t1, 4
                
            j printingOrderVector_1
        
        endOfPrintingOrderVector_1:
        
        li $v0, 4
        la $a0, enter
        syscall
        
        addi $t1, $zero, 0
        
        printingVectorOfValues_1:
            beq $t1, $t2, endOfPrintingVectorOfValues_1
            
            lw $t4, vectorOfValues_1($t1)
            
            li $v0, 1
            move $a0, $t4
            syscall
            
            li $a0, 32
            li $v0, 11  
            syscall
        
            addi $t1, $t1, 4
            
            j printingVectorOfValues_1
       
        endOfPrintingVectorOfValues_1:
        
        li $v0, 4
        la $a0, enter
        syscall
        
        li $v0, 4
        la $a0, vectors_2
        syscall
        
        addi $t1, $zero, 0
        
        printingOrderVector_2:
            beq $t1, $t0, endOfPrintingOrderVector_2
               
            lw $t4, orderVector_2($t1)
            
            li $v0, 1
            move $a0, $t4
            syscall
            
            li $a0, 32
            li $v0, 11  
            syscall
            
            addi $t1, $t1, 4
                
            j printingOrderVector_2
        
        endOfPrintingOrderVector_2:
        
        li $v0, 4
        la $a0, enter
        syscall
        
        addi $t1, $zero, 0
        
        printingVectorOfValues_2:
            beq $t1, $t3, endOfPrintingVectorOfValues_2
            
            lw $t4, vectorOfValues_2($t1)
            
            li $v0, 1
            move $a0, $t4
            syscall
            
            li $a0, 32
            li $v0, 11  
            syscall
        
            addi $t1, $t1, 4
            
            j printingVectorOfValues_2
       
        endOfPrintingVectorOfValues_2:
        
        exit:
           li $v0, 10
           syscall   
           
           