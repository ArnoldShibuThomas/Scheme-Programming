;;;
; CSE240 Functional Programming 2 Homework
; This assignment involves pracicing operations and how to use lists.This also covers the idea of procedures.
;
; Completion time: 10 hours
;
; @author Arnold Shibu
; @version 9/21/2021
;;;


; Q1

;1.1
(define (sumEven lst)
  (cond ((= 0 (length lst)) 0) ;return zero if the list is of length zero
        ((even? (car lst)) (+ (car lst) (sumEven (cdr lst)))) ; if the first element of this list is even add and it to the result of the recursive call to get the sum
        ((odd? (car lst)) (sumEven (cdr lst))) ; if the first elment of this list is odd skip the number and do a recursive call
  ))

;1.2

((lambda (lst) (sumEven lst));calls the sumEven Procedure and passes the list to get the sum of the Evens
 '(1 3 -4 5 6 -7))

; Q2
(define(list-push-back lst new-list) 
  (append lst new-list);appends the new list to the end of the original list
  )

; Q3
(define(list-push-front lst new-list)
  (append new-list lst);appends the new list to the front of the original list
  )

 
; Q4
(define (list-draw-front n lst)
  (cond ((= n 1) (cons (car lst) '())) ; base case if n =1 return this list
  ((> n 1)(cons (car lst) (list-draw-front (- n 1) (cdr lst)))))) ; combine the first number with the recursively called list 


; Q5

(define (list-draw-back n lst)
  (cond ((= n 1) (cons (list-ref lst (- (length lst) n)) '())) ; base case if the last element of the list return this list
  ((> n 1)(cons (list-ref lst (- (length lst) n)) (list-draw-back (- n 1) (cdr lst))))));combine the last nth position to the last with a recusovely called list

; Q6
(define (list-shuffle lst1 lst2) ;a procedure that tkes to lists and combines them
  (cond ((null? lst1) '()) ;stopping conditions are if either list is null that returns an empty list 
        ((null? lst2) '())
        ((append (list (car lst1) (car lst2)) (list-shuffle (cdr lst1) (cdr lst2)))))); the size m and constructing the size n
;append creates a list with the first item from lst1 followed by the first item in lst2 and appends that with the result of the recusive call when passing the remainder of both of those list to the procedure
