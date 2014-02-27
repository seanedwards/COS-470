(defun first2 (l)
    (list (car l) (car (cdr l))))

(defun add1 (x) 
    (+ x 1))

(defun listadd1 (l) 
    (cond
          (l (cons (add1 (car l)) (listadd1 (cdr l))))
          (T ())
    )
)

(defun listadd2 (l) (mapcar `add1 l))

(defun listadd3 (l) 
    (loop for x in l collect
        (add1 x)
    )
)

(defun flatten (l)
    (cond
        ((null l) nil)
        ((atom l) (list l))
        (t (mapcan #'flatten l))
    )
)

(defun last2 (l)
    (cond
        ((cdr (cdr l)) (last2 (cdr l)))
        (t l)
    )
)

(defun my-reverse (l)
    (cond
        (l (list (reverse (cdr l)) (car l)))
        (t nil)
    )
)

(defun printlist (l)
    (loop for i in l
          for n from 1 to (list-length l)
          do
          (print (format nil "~@(~:r~) element: ~a" n i))
    )
)

(let ((l nil))
    (defun next (&optional in)
        (car (if in
            (setq l (cons nil in))
            (setq l (cdr l))
        ))
    )
)

(print (first2 `(a b c d e f)) )
(print (add1 1))
(print (listadd1 `(2 3 4 5)))
(print (listadd2 `(2 3 4 5)))
(print (listadd3 `(2 3 4 5)))
(print (flatten `(a (b c) d (e (f (g (h) i))) j)))
(print (last2 `(1 2 3 4)))
(print (reverse `(1 2 3 4)))
(printlist `(1 2 3 4))

(print (next `(a b c d)))
(print (next))
(print (next))
(print (next))
(print (next))
(print (next))
(print (next `(1 2 3)))
(print (next))