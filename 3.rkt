; The Little Schemer, Chapter 3

(begin 
  ; substitute the first occurrence of y1 or y2 in ys with x
  (define subst2
    (lambda (x y1 y2 ys) 
      (cond ((null? ys) (quote ()))
            (else (cond
                    ((eq? (car ys) y1) (cons x (cdr ys)))
                    ((eq? (car ys) y2) (cons x (cdr ys)))
                    (else (cons (car ys) (subst2 x y1 y2 (cdr ys)))))))))
  ; remove all occurrences of x in xs
  (define multirember 
    (lambda (x xs)
      (cond 
        ((null? xs) (quote ()))
        ((eq? (car xs) x) (multirember x (cdr xs)))
        (else (cons (car xs) (multirember x (cdr xs)))))))
  ; insert x to the right of y for every occurence of y in ys
  (define multiinsertR 
    (lambda (x y ys)
      (cond 
        ((null? ys) (quote ()))
        ((eq? (car ys) y) (cons (car ys) (cons x (multiinsertR x y (cdr ys)))))
        (else (cons (car ys) (multiinsertR x y (cdr ys))))))))
