.data
     orderVector_1:      .space 1024
     vectorOfValues_1:   .space 1024
     
     orderVector_2:      .space 1024
     vectorOfValues_2:   .space 1024
     
     size:       .asciiz  "\nSize of both vectors: "
     vector_1:   .asciiz  "\nValues for vector: Y\n"
     vector_2:   .asciiz  "\nValues for vector: Z\n"
     input:      .asciiz  "Input the value: "
     result:     .asciiz  "\nThe scalar product of both vectors is: "
     error:      .asciiz  "zero"

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
        
        #index of vectorOfValues
        addi $t2, $zero, 0
        
        #always 1
        addi $t3, $zero, 1
        
        li $v0, 4
        la $a0, vector_1
        syscall
        
        assigning_1:
            beq $t1, $t0, endOfAssigning_1
                  
            li $v0, 5
            syscall
            move $t4, $v0
            
            bne $t4, 0, else_1
                sw $t4, orderVector_1($t1)
                
                j endOfIf_1
                
            else_1:
                sw $t3, orderVector_1($t1)
                sw $t4, vectorOfValues_1($t2)
                
                addi $t2, $t2, 4
                
            endOfIf_1:
            
            addi $t1, $t1, 4           
            
            j assigning_1
        
        endOfAssigning_1:
       
        addi $t1, $zero, 0
        
        printingOrderVector_1:
            beq $t1, $t0, endOfPrintingOrderVector_1
               
            lw $t3, orderVector_1($t1)
            
            li $v0, 1
            move $a0, $t3
            syscall
            
            li $a0, 32
            li $v0, 11  
            syscall
            
            addi $t1, $t1, 4
                
            j printingOrderVector_1
        
        endOfPrintingOrderVector_1:
        
        addi $t1, $zero, 0
        
        printingVectorOfValues_1:
            beq $t1, $t2, endOfPrintingVectorOfValues_1
            
            lw $t3, vectorOfValues_1($t1)
            
            li $v0, 1
            move $a0, $t3
            syscall
            
            li $a0, 32
            li $v0, 11  
            syscall
        
            addi $t1, $t1, 4
            
            j printingVectorOfValues_1
       
        endOfPrintingVectorOfValues_1:
        
        exit:
           li $v0, 10
           syscall   