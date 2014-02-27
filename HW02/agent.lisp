(defclass agent ()
    (
        (coords :accessor agent-coords
            :initform '(0 0 0) ; (Y X Rot)
            :initarg :coords)

        (distfn
            :accessor agent-dist-fn
            :initarg :distfn)

        (hitfn
            :accessor agent-hit-fn
            :initarg :hitfn)
    )
)

(defmethod get-rot ((a agent))
    (nth 2 (agent-coords a))
)

(defmethod get-x ((a agent))
    (nth 0 (agent-coords a))
)

(defmethod get-y ((a agent))
    (nth 1 (agent-coords a))
)

(defmethod turn-right ((a agent))
    (setf (nth 2 (agent-coords a))
        (mod (+ (get-rot a) 1) 4)
    ) 
    (print (agent-coords a))
)

(defmethod turn-left ((a agent))
    (setf (nth 2 (agent-coords a))
        (mod (- (nth 2 (agent-coords a)) 1) 4)
    ) 
    (print (agent-coords a))
)

(defmethod move-fwd ((a agent))
    ; coord = rot % 2
    ; Rotation 0 or 2 = moving on X axis.
    ; Rotation 1 or 3 = moving on Y axis.
    (let ((coord (mod (get-rot a) 2)))
        (setf (nth coord (agent-coords a))
            (- (nth coord (agent-coords a)) (- (get-rot a) 1 coord))
        )
    )
    (print (agent-coords a))
)

(defmethod move-right ((a agent))
    (turn-right a)
    (move-fwd a)
    (turn-left a)
)

(defmethod move-left ((a agent))
    (turn-left a)
    (move-fwd a)
    (turn-right a)
)

(let ((a (make-instance 'agent :distfn #'print :hitfn #'print)))
    (move-fwd a)
    (move-fwd a)
    (move-fwd a)
    (turn-right a)
    (move-fwd a)
    (turn-right a)
    (move-fwd a)
    (turn-right a)
    (move-fwd a)
    (turn-right a)
    (move-fwd a)
    (turn-left a)
    (move-fwd a)
    (turn-left a)
    (move-fwd a)
    (turn-left a)
    (move-fwd a)
    (turn-left a)
    (move-fwd a)
    (turn-left a)
    (move-fwd a)
)