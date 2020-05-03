(defclass minitomato-object
  :super cascaded-link
  :slots ())

(defmethod minitomato-object
  (:init
   (&rest args &key (name "minitomato") (pos (float-vector 0 0 0)) (rot (unit-matrix 3)) &allow-other-keys)
   (let (tomato e2)
     (send-super* :init :name name args)
     
     (setq tomato (make-sphere 25))
     (send tomato :locate #f(0 0 0))
     (send tomato :set-color :red)
     (setq points (list #f(-15 0 0) #f(-5 5 0) #f(0 15 0) #f(5 5 0) #f(15 0 0) #f(5 -5 0) #f(0 -15 0) #f(-5 -5 0)))
     (setq e2 (make-prism points 3))
     (send e2 :locate #f(0 0 23))
     (send e2 :set-color :forestgreen)
     (send tomato :assoc e2)
     
     (setq link1 (instance bodyset-link :init (make-cascoords) :bodies (list tomato e2)))
     
     ;;definition of assoc
     (send self :assoc link1)
     
     ;;init-ending
     (setq links (list link1))
     (send self :init-ending)
     (send self :move-to (make-coords :pos pos :rot rot))
     (send-all links :worldpos)
     
     self))
  )

(defun minitomato (&rest args) (instance* minitomato-object :init args))
