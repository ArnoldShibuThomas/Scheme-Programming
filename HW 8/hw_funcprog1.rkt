;;;
; CSE240 Functional Programming 1 Homework
; This assignment involves pracicing various expressions and procedures in Scheme.
; 
; For the first assignment, we are providing the default header so you can see how it
; looks in Scheme. For future assignments, you will need to add it yourself.
;
; Completion time: 6 hours
;
; @author Arnold Shibu
; @version 9/20/2021
;;;


; Q1

;1.1
(+ 5 (- 9 2))
;1.2
(- (* 5 (+ 6 12 5)) 25)
;1.3
(* 7 ( + (- 5 (* 1 3)) (* 2 4)))
;1.4
(* 3 (+ (/ ( + (* 6 6) (* 6 6)) (+ 10 2)) 4 ))
;1.5
( + (/ (- (/ (/ (* (+ 4 6 ) (+ 6 4)) 2) 2) 5) 2) (+ (/ (+ (* 4 5 ) (* 5 4)) 2) (* 4 5))) 

; Q2
(define (add x y)
  (+ x y))

; Q3

(define (square a) ; the code for  thesize-n problem is a procedure called square that takes one parameter
  
  (cond ((= a 0)0) ; the code for stopping condition and the return value of zero
        ; the code for sontructing the size-n problem is this 
        ((> a 0) (+ (add a (- a 1)) (square (- a 1)))) ; the code for solving the size-m problem is a-1
        ((< a 0) (square (- a)))))
; Q4

(define (read-for-square)
  (square (read)))


; Q5

(define (diff-squares)
  (abs(- (read-for-square) (read-for-square) )))


; Q6

(define (sum-odds max)
  (cond ((= max 1)1) ;base case and return
        ((> max 1) ;size n
         (if (odd? max) ;if the number is odd or even
             ( + max (sum-odds (- max 2))) ; the size m
             (sum-odds (- max 1))))
    ))


; Q7

(define (fib a)
   (cond (( = a 0) 0) ;base case
         (( = a 1) 1) ;base case 
         ((> a 1) ( + (fib (- a 1)) (fib (- a 2)))));size m problem 
  )
