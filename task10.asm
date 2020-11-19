.data
    matrix_1: .word 0, 0, 0, 0
              .word 0, 0, 0, 0
              .word 0, 0, 0, 0
              .word 0, 0, 0, 0
              
    matrix_2: .word 0, 0, 0, 0
              .word 0, 0, 0, 0
              .word 0, 0, 0, 0
              .word 0, 0, 0, 0
              
    result:   .word 0, 0, 0, 0
              .word 0, 0, 0, 0
              .word 0, 0, 0, 0
              .word 0, 0, 0, 0
    
    
    rowsMatrix_1:     .asciiz "Number of rows (max 4) of the first matrix: \n"
    columnsMatrix_1:  .asciiz "Number of columns (max 4) of the first matrix: \n"
    rowsMatrix_2:     .asciiz "Number of rows (same as number of the columns of first matrix) of second matrix: \n"
    columnsMatrix_2:  .asciiz "\nNumber of columns (max 4) of the second matrix: \n"
    
    valuesMatrix_1:   .asciiz "Type all numbers of the first matrix (by rows): \n"
    valuesMatrix_2:   .asciiz "Type all numbers of the second matrix (by rows): \n"
    
    printMatrix_1:    .asciiz "First matrix: \n"
    printMatrix_2:    .asciiz "Second matrix: \n"
    print:            .asciiz "Result: \n"
    
    enter:            .asciiz "\n"
    
    
.text
    main:
        la $a1, matrix_1   #address of Matrix 1
        la $a2, matrix_2   #address of Matrix 2
        jal readMatrix
        jal printMatrices
        jal multiplication
        jal printResult
    
        li $v0, 10
        syscall 

    readMatrix:
        #getting sizes of matrices
        li $v0, 4
        la $a0, rowsMatrix_1
        syscall
        
        li $v0, 5
        syscall
        move $s0, $v0      #s0 - number of rows - Matrix 1
        
        li $v0, 4
        la $a0, columnsMatrix_1
        syscall
        
        li $v0, 5
        syscall
        move $s1, $v0      #s1 - number of columns - Matrix 1
        
        li $v0, 4
        la $a0, rowsMatrix_2
        syscall
        
        li $v0, 1
        move $a0, $s1      #s1 - number of rows - Matrix 2
        syscall
        
        li $v0, 4
        la $a0, columnsMatrix_2
        syscall
        
        li $v0, 5
        syscall
        move $s2, $v0      #s2 - number of colums - Matrix 2
        
        addi $s3, $zero, 4 #s3 - data size
        
        #getting values of matrices
        li $v0, 4
        la $a0, valuesMatrix_1
        syscall
        
        addi $t0, $zero, 0 #t0 - index of row
        addi $t1, $zero, 0 #t1 - index of column
                           #t2 - address
                           #t3 - value
        addi $t4, $zero, 0 #t4 - counter
        mul  $t5, $s0, $s1 #t5 - number of iterations
        
        assigning_1:
        
            beq $t4, $t5, endOfAssigning_1
            
            
            #address
            mul $t2, $t0, $s1
            add $t2, $t2, $t1
            mul $t2, $t2, $s3
            add $t2, $t2, $a1
            
            #value
            li $v0, 5
            syscall
            move $t3, $v0
            
            #assigning
            sw $t3, ($t2)
            
            #changing indexes
            addi $t1, $t1, 1
            addi $t4, $t4, 1
            
            blt $t1, $s1, assigning_1
                addi $t0, $t0, 1
                addi $t1, $zero, 0
                
                
                j assigning_1
            
        endOfAssigning_1:
        
        li $v0, 4
        la $a0, valuesMatrix_2
        syscall
        
        addi $t0, $zero, 0 #t0 - index of row
        addi $t1, $zero, 0 #t1 - index of column
                           #t2 - address
                           #t3 - value
        addi $t4, $zero, 0 #t4 - counter
        mul  $t5, $s1, $s2 #t5 - number of iterations
        
        assigning_2:
        
            beq $t4, $t5, endOfAssigning_2
            
            #address
            mul $t2, $t0, $s2	
            add $t2, $t2, $t1
            mul $t2, $t2, $s3
            add $t2, $t2, $a2
            
            #value
            li $v0, 5
            syscall
            move $t3, $v0
            
            #assigning
            sw $t3, ($t2)
            
            #changing indexes
            addi $t1, $t1, 1
            addi $t4, $t4, 1
            
            blt $t1, $s2, assigning_2
                addi $t0, $t0, 1
                addi $t1, $zero, 0
                
                j assigning_2
            
        endOfAssigning_2:
        
        jr $ra
        
        
        
    printMatrices:
        li $v0, 4
        la $a0, printMatrix_1
        syscall
        
        addi $t0, $zero, 0 #t0 - index of row
        addi $t1, $zero, 0 #t1 - index of column
                           #t2 - address
                           #t3 - value
        addi $t4, $zero, 0 #t4 - counter
        mul  $t5, $s0, $s1 #t5 - number of iterations
        
        printing_1:
        
            beq $t4, $t5, endOfPrinting_1
            
            #address
            mul $t2, $t0, $s1
            add $t2, $t2, $t1
            mul $t2, $t2, $s3
            add $t2, $t2, $a1
            
            lw $t3, ($t2)
            
            #printing
            li $v0, 1
            move $a0, $t3
            syscall
            
            li $a0, 32
            li $v0, 11  
            syscall
            
            #changing indexes
            addi $t1, $t1, 1
            addi $t4, $t4, 1
            
            blt $t1, $s1, printing_1
                addi $t0, $t0, 1
                addi $t1, $zero, 0
                
                li $v0, 4
                la $a0, enter
                syscall
 
                j printing_1
                
        endOfPrinting_1:
        
        
        li $v0, 4
        la $a0, printMatrix_2
        syscall
        
        addi $t0, $zero, 0 #t0 - index of row
        addi $t1, $zero, 0 #t1 - index of column
                           #t2 - address
                           #t3 - value
        addi $t4, $zero, 0 #t4 - counter
        mul  $t5, $s1, $s2 #t5 - number of iterations
        
        printing_2:
        
            beq $t4, $t5, endOfPrinting_2
            
            #address
            mul $t2, $t0, $s2
            add $t2, $t2, $t1
            mul $t2, $t2, $s3
            add $t2, $t2, $a2
            
            lw $t3, ($t2)
            
            #printing
            li $v0, 1
            move $a0, $t3
            syscall
            
            li $a0, 32
            li $v0, 11  
            syscall
            
            #changing indexes
            addi $t1, $t1, 1
            addi $t4, $t4, 1
            
            blt $t1, $s2, printing_2
                addi $t0, $t0, 1
                addi $t1, $zero, 0
                
                li $v0, 4
                la $a0, enter
                syscall
 
                j printing_2
                
        endOfPrinting_2:
        
        jr $ra
        
    multiplication:
        addi $t0, $zero, 0 #t0 - index of row - array1       / index of row - result
        addi $t1, $zero, 0 #t1 - index of column - array1 
        addi $t2, $zero, 0 #t2 - index of row - array2
        addi $t3, $zero, 0 #t3 - index of column - array2    / index of column - result
        
                           #t4 - value of array1
                           #t5 - value of array2
                           
        addi $t7, $zero, 0 #t7 - result
                           #t8 - address
                           
                           #s0 - number of rows of result
                           #s2 - number of columns of result
                           
        multiplying:
        
            beq $t0, $s0, endOfMultiplication
            
            
            loop:
                beq $t1, $s1, endOfLoop
            
                #address of array1
                mul $t8, $t0, $s1
                add $t8, $t8, $t1
                mul $t8, $t8, $s3
                add $t8, $t8, $a1
             
                lw $t4, ($t8)
             	
                #address of array2
                mul $t8, $t2, $s2
                add $t8, $t8, $t3
                mul $t8, $t8, $s3
                add $t8, $t8, $a2
                
                lw $t5, ($t8)
                
                mul $t5, $t5, $t4 
                add $t7, $t7, $t5
                
                addi $t1, $t1, 1
                addi $t2, $t2, 1
                
                j loop
                
            endOfLoop:
            addi $t1, $zero, 0
            addi $t2, $zero, 0

            la $a0, result #address of resut

            #address of result
            mul $t8, $t0, $s2
            add $t8, $t8, $t3
            mul $t8, $t8, $s3
            add $t8, $t8, $a0
            
            sw $t7, ($t8)
            
            addi $t7, $zero, 0
            
            #changing indexes
            addi $t3, $t3, 1
            blt $t3, $s2, multiplying
                addi $t0, $t0, 1
                addi $t3, $zero, 0
 
            j multiplying
                
        endOfMultiplication:
        
        jr $ra
        
    printResult:
        li $v0, 4
        la $a0, print
        syscall
        
        addi $t0, $zero, 0 #t0 - index of row
        addi $t1, $zero, 0 #t1 - index of column
                           #t2 - address
                           #t3 - value
        addi $t4, $zero, 0 #t4 - counter
        mul  $t5, $s0, $s2 #t5 - number of iterations  
    
        printing:
            
            beq $t4, $t5, endOfPrinting
            
            la $a0, result #address of result
            
            #address
            mul $t2, $t0, $s2
            add $t2, $t2, $t1
            mul $t2, $t2, $s3
            add $t2, $t2, $a0
            
            lw $t3, ($t2)
            
            #printing
            li $v0, 1
            move $a0, $t3
            syscall
            
            li $a0, 32
            li $v0, 11  
            syscall
            
            #changing indexes
            addi $t1, $t1, 1
            addi $t4, $t4, 1
            
            blt $t1, $s2, printing
                addi $t0, $t0, 1
                addi $t1, $zero, 0
                
                li $v0, 4
                la $a0, enter
                syscall
 
                j printing
                
        endOfPrinting:
        
        jr $ra
