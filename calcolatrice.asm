org 100h

jmp start

msg:    db      "1-Addizione",0dh,0ah,"2-Moltiplicazione",0dh,0ah,"3-Sottrazione",0dh,0ah,"4-Divisione", 0Dh,0Ah, '$'
msg2:    db      0dh,0ah,"Primo numero: $"
msg3:    db      0dh,0ah,"Secondo numero: $"
msg4:    db      0dh,0ah,"!!Errore!! $" 
msg5:    db      0dh,0ah,"Risultato : $" 
msg6:    db      0dh,0ah ,'grazie di avermi utilizzato, ora premi un tasto per chiudere, se non lo fai ti entro in casa...', 0Dh,0Ah, '$'
msg7:    db      0dh,0ah, "!!ERRORE!!",0dh,0ah,"Non puoi dividere un qualsiasi numero per 0, pirla $"

start:  mov ah,9
        mov dx, offset msg
        int 21h
        mov ah,0                       
        int 16h
        cmp al,31h
        je Addition
        cmp al,32h
        je Multiply
        cmp al,33h
        je Subtract
        cmp al,34h
        je Divide
        mov ah,09h
        mov dx, offset msg4
        int 21h
        mov ah,0
        int 16h
        jmp start
        
Addition:   mov ah,9
            mov dx, offset msg2
            int 21h
            mov cx,0
            call InputNo
            push dx
            mov ah,9
            mov dx, offset msg3
            int 21h 
            mov cx,0
            call InputNo
            pop bx
            add dx,bx
            push dx 
            mov ah,9
            mov dx, offset msg5
            int 21h
            mov cx,10000
            pop dx
            call View 
            jmp exit 
            
InputNo:    mov ah,0
            int 16h
            mov dx,0  
            mov bx,1 
            cmp al,0dh
            je FormNo
            sub ax,30h
            call ViewNo
            mov ah,0
            push ax
            inc cx   
            jmp InputNo         
   
FormNo:     pop ax
            push dx      
            mul bx
            pop dx
            add dx,ax
            mov ax,bx      
            mov bx,10
            push dx
            mul bx
            pop dx
            mov bx,ax
            dec cx
            cmp cx,0
            jne FormNo
            ret  

View:  mov ax,dx
       mov dx,0
       div cx 
       call ViewNo
       mov bx,dx 
       mov dx,0
       mov ax,cx 
       mov cx,10
       div cx
       mov dx,bx 
       mov cx,ax
       cmp ax,0
       jne View
       ret

ViewNo:    push ax 
           push dx 
           mov dx,ax 
           add dl,30h 
           mov ah,2
           int 21h
           pop dx  
           pop ax
           ret
      
exit:   mov dx,offset msg6
        mov ah, 9
        int 21h  

        mov ah, 0
        int 16h

        ret
            
                       
Multiply:   mov ah,9
            mov dx, offset msg2
            int 21h
            mov cx,0
            call InputNo
            push dx
            mov ah,9
            mov dx, offset msg3
            int 21h 
            mov cx,0
            call InputNo
            pop bx
            mov ax,dx
            mul bx 
            mov dx,ax
            push dx 
            mov ah,9
            mov dx, offset msg5
            int 21h
            mov cx,10000
            pop dx
            call View 
            jmp exit 

Subtract:   mov ah,9
            mov dx, offset msg2
            int 21h
            mov cx,0
            call InputNo
            push dx
            mov ah,9
            mov dx, offset msg3
            int 21h 
            mov cx,0
            call InputNo
            pop bx
            sub bx,dx
            mov dx,bx
            push dx 
            mov ah,9
            mov dx, offset msg5
            int 21h
            mov cx,10000
            pop dx
            call View 
            jmp exit 
    
            
Divide:     mov ah,9
            mov dx, offset msg2
            int 21h
            mov cx,0
            call InputNo
            cmp dx,0
            je DivisionError
            push dx
            mov ah,9
            mov dx, offset msg3
            int 21h 
            mov cx,0
            call InputNo
            cmp dx,0
            je DivisionError
            pop bx
            mov ax,bx
            mov cx,dx
            mov dx,0
            mov bx,0
            div cx
            mov bx,dx
            mov dx,ax
            push bx 
            push dx 
            mov ah,9
            mov dx, offset msg5
            int 21h
            mov cx,10000
            pop dx
            call View
            pop bx
            cmp bx,0
            je exit 
            jmp exit

DivisionError:
            mov ah,9
            mov dx, offset msg7
            int 21h
            jmp exit