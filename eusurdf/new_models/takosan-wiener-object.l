(defclass takosan-wiener-object
  :super cascaded-link
  :slots ())

(defmethod takosan-wiener-object
  (:init
   (&rest args &key (name "takosan-wiener") (pos (float-vector 0 0 0)) (rot (unit-matrix 3)) &allow-other-keys)
   (let (tako c2 c3 c4 c5)
     (send-super* :init :name name args)

     ;;make takosan-wiener
     (setq tako (make-cylinder 20 50))
     (send tako :locate #f(0 0 0))
     (send tako :set-color :tomato)
     (setq c2 (make-sphere 20))
     (send c2 :locate #f(0 0 50))
     (send c2 :set-color :tomato)
     (setq c3 (make-cube 40 5 10))
     (send c3 :locate #f(0 0 4.9))
     (send c3 :set-color :wheat)
     (setq c4 (make-cube 5 40 10))
     (send c4 :locate #f(0 0 4.9))
     (send c4 :set-color :wheat)
     (setq c5 (make-sphere 2))
     (send c5 :locate #f(0 0 71))
     (send c5 :set-color :tomato)
     (send tako :assoc c2)
     (send tako :assoc c3)
     (send tako :assoc c4)
     (send tako :assoc c5)
     
     (setq link1 (instance bodyset-link :init (make-cascoords) :bodies (list tako c2 c3 c4 c5)))
     
     ;;definition of assoc
     (send self :assoc link1)
     
     ;;init-ending
     (setq links (list link1))
     (send self :init-ending)
     (send self :move-to (make-coords :pos pos :rot rot))
     (send-all links :worldpos)
     
     self))
  )

(defun takosan-wiener (&rest args) (instance* takosan-wiener-object :init args))

	    
