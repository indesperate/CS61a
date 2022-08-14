(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cdr (cdr s))))

(define (ordered? s) 
    (if (<= (length s) 1) 
    #t
    (if (<= (car s) (car (cdr s)))
        (ordered? (cdr s))
        #f
        )
    )
)

(define (square x) (* x x))

(define (pow base exp) 
    (if (= base 1)
        1
    (if (= exp 1)
        base
    (if (even? exp)
        (square (pow base (/ exp 2)))
        (* (pow base (quotient exp 2)) (pow base ( + (quotient exp 2) 1 ) ) )
    )
    )
    )
)
