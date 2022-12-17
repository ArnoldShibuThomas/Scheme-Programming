;;;
; CSE240 Functional Programming 3 Homework
; This Program use functional programing to evaulate binary additon with the use of higher level prgramming
;
; Completion time: 10 hours
;
; @author Arnold Shibu, Chen, Acuna
; @version 9/29/2021
;;;


;Q1
; enter your code here:
(define (AND-gate b1 b2)
  (cond ((= b1 1)
         (if (= b2 1) 1 0))
        (else 0)))

(define (OR-gate b1 b2)
    (cond ((= b1 0)
         (if (= b2 0) 0 1))
        (else 1)))

(define (NOT-gate b1)
  (cond ((= b1 1)0)
        ((= b1 0)1)))

; Test cases
(display "AND-Gate Output\n")
(AND-gate 0 0)
(AND-gate 0 1)
(AND-gate 1 0)
(AND-gate 1 1)
; Expected outputs
;0
;0
;0
;1
; Test cases
(display "OR-Gate Output\n")
(OR-gate 0 0)
(OR-gate 0 1)
(OR-gate 1 0)
(OR-gate 1 1)
; Expected outputs
;0
;1
;1
;1
; Test cases
(display "NOT-Gate Output\n")
(NOT-gate 0)
(NOT-gate 1)
; Expected outputs
;1
;0

; Q2
; enter your code here:
(define (XOR-gate b1 b2)
  (OR-gate (AND-gate (NOT-gate b1) b2) (AND-gate b1 (NOT-gate b2)) ))

; Test cases
(display "XOR-Gate Output\n")
(XOR-gate 0 0)
(XOR-gate 0 1)
(XOR-gate 1 0)
(XOR-gate 1 1)
; Expected outputs
;0
;1
;1
;0

;Q3.1
; enter your code here:
(define (half-adder x a b)
  (XOR-gate x (XOR-gate a b)))

;Q3.2
; enter your code here:
(define (carry-out x a b)
  (OR-gate (AND-gate x (XOR-gate a b) ) (AND-gate a b) ))


;Q3.3
; enter your code here:
(define (full-adder x a b)
  (cons (carry-out x a b) (half-adder x a b)))


; Test cases
(Display "half-adder Output\n")
(half-adder 0 0 0) 	
(half-adder 0 0 1) 	
(half-adder 0 1 0) 	
(half-adder 0 1 1)	
(half-adder 1 0 0) 	
(half-adder 1 0 1)	
(half-adder 1 1 0) 	
(half-adder 1 1 1)

; Expected outputs
;0
;1
;1
;0
;1
;0
;0
;1


; Test cases
(Display "fullAdder Output\n")
(full-adder 0 0 0) 	
(full-adder 0 0 1) 	
(full-adder 0 1 0) 	
(full-adder 0 1 1)	
(full-adder 1 0 0) 	
(full-adder 1 0 1)	
(full-adder 1 1 0) 	
(full-adder 1 1 1)

; Expected outputs
;(0 . 0)
;(0 . 1)
;(0 . 1)
;(1 . 0)
;(0 . 1)
;(1 . 0)
;(1 . 0)
;(1 . 1)


;Q4.1
; enter your code here:
(define (tail lst)
  (cond ((null? lst) '())
    ((= (length lst) 1) (car lst))
    ((> (length lst) 1) (tail (cdr lst)) )))


;Q4.2
(define (rmtail lst)
   (cond ((null? lst) '())
    ((= (length lst) 1) '())
    ((> (length lst) 1) (cons (car lst)(rmtail (cdr lst))))))

;Q4.3
; Step 1 size-n problem: Lines of code
; ----> recursive-add A B c

; Step 2 Stopping condition: Lines of code
; ----> if (null? A)then return'()

; Step 3 size-m problem: Lines of code
; ----> (if (> (length A) 1) (list (cdr (full-adder (tail A) (tail B) c))) (cons c(list (cdr (full-adder (tail A) (tail B) c))))))))

; Step 4: Lines of code
; ---->  (append (recursive-add(rmtail A)(rmtail B)
;                              (car(full-adder (tail A) (tail B) c)))
;                (if (> (length A) 1) (list (cdr (full-adder (tail A) (tail B) c))) (cons c(list (cdr (full-adder (tail A) (tail B) c))))))))


;Q4.4
; enter your code here:
(define (n-bit-adder A B n)
  (let ((t (recursive-add A B 0)))
    (cons (car t) (list (cdr t)))))

(define (recursive-add A B c)
  (if (null? A)
      '()
        (append (recursive-add(rmtail A)(rmtail B)
                              (car(full-adder (tail A) (tail B) c)))
                (if (> (length A) 1) (list (cdr (full-adder (tail A) (tail B) c))) (cons c(list (cdr (full-adder (tail A) (tail B) c))))))))
;Test cases
(define x1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0) )	
(define x2 '(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1) )	
(define x3 '(0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1) )	
(define x4 '(1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0) )
(define x5 '(1 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1) )	
(define x6 '(1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 0) )


(display "n-bit-adder Output\n")
(n-bit-adder  x1 x2 32)
(n-bit-adder  x3 x4 32)
(n-bit-adder  x5 x6 32)
(n-bit-adder  x2 x3 32)
(n-bit-adder  x4 x5 32)
(n-bit-adder  x1 x6 32)
; Expected outputs
;(0 (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1))
;(0 (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1))
;(1 (1 0 1 1 1 0 0 0 1 1 1 0 0 1 0 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 1))
;(1 (0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 0))
;(1 (1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1))
;(0 (1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 0))


;Q5 boilerplate (implementations for reduce and filter)
(define reduce
	  (lambda (op base x) ;passing by name
		(if (null? x)
			base
			(op (car x) (reduce op base (cdr x))))))

(define filter (lambda (pred a-list)
	(if (null? a-list)
	    '()
	    (if	(pred (car a-list))
			(cons (car a-list) (filter pred (cdr a-list)))
			(filter pred (cdr a-list)))))) 


;Q5.1
; enter your code here:
(define (number-length lst) (+ (reduce + 0 lst) (reduce + 0 (map NOT-gate lst))))

;Q5.2
; enter your code here:
(define(count-zeros lst) (reduce + 0 (map NOT-gate lst)))

;Q5.3
; enter your code here:
(define (binary->string lst) (list->string (map (lambda (x)(if (= x 1) #\1 #\0)) lst)))

