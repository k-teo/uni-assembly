.data
    toSort:      .space 1024
    
    size:        .asciiz "How many number do you want to sort? \n"
    numbers:     .asciiz "Type numbers. \n"
    before:      .asciiz "\nBefore bubble sort:\n"
    after:       .asciiz "\nAfter bubble sort:\n"

.text
    main:
        jal readNumbers
        
        li $v0, 4
        la $a0, before
        syscall
        
        jal printArray
        jal bubbleSort
        
        li $v0, 4
        la $a0, after
        syscall
        
        jal printArray
        
        li $v0, 10
        syscall   
    
    readNumbers:
        li $v0, 4
        la $a0, size
        syscall
        
        #size
        li $v0, 5
        syscall
        move $t0, $v0 
        
        addi $t1, $zero, 4
        mul $t0, $t0, $t1
        
        li $v0, 4
        la $a0, numbers
        syscall
        
        #index
        addi $t1, $zero, 0
        
        assigning:
            beq $t1, $t0, endOfAssigning
                  
            li $v0, 5
            syscall
            move $t2, $v0
            
            sw $t2, toSort($t1)
            
            addi $t1, $t1, 4
            
            j assigning
            
        endOfAssigning:
        
        jr $ra
    
    printArray:
        addi $t1, $zero, 0
        
        printing:
            beq $t1, $t0, endOfPrinting
            
            lw $t2, toSort($t1)
            
            li $v0, 1
            move $a0, $t2
            syscall  
            
            li $a0, 32
            li $v0, 11  
            syscall
            
            addi $t1, $t1, 4
            
            j printing
            
        endOfPrinting:
        
        jr $ra
    
    bubbleSort:
        addi $t1, $zero, 0
        addi $t2, $t0, -4
        
        for1:
            beq $t1, $t0, endOfFor1
            addi $t3, $zero, 0
            
            for2:
                beq $t3, $t2, endOfFor2
                addi $t4, $t3, 4
                
                lw $t5, toSort($t3)
                lw $t6, toSort($t4)
                
                blt $t5, $t6, else
                    sw $t6, toSort($t3)
                    sw $t5, toSort($t4)
                
                else:
                    addi $t3, $t3, 4
                    j for2
                    
            endOfFor2:
            
            addi $t1, $t1, 4
            j for1
            
        endOfFor1:
         
        jr $ra
