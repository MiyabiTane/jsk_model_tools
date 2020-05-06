(defclass fried-chicken-object
  :super cascaded-link
  :slots ())

(defmethod fried-chicken-object
  (:init
   (&rest args &key (name "fried-chicken") (pos (float-vector 0 0 0)) (rot (unit-matrix 3)) &allow-other-keys)
   (let (chicken c1 c2 c3 c4 c5 c6)
     (send-super* :init :name name args)

     (setq chicken (make-sphere 25))
     (send chicken :set-color :brown)
     (setq c2 (make-sphere 10))
     (send c2 :locate #f(-10 0 20))
     (send c2 :set-color :peru)
     (setq c1 (make-sphere 20))
     (send c1 :locate #f(0 10 15))
     (send c1 :set-color :brown)
     (setq c3 (make-sphere 20))
     (send c3 :locate #f(0 -5 15))
     (send c3 :set-color :brown)
     (setq c4 (make-sphere 20))
     (send c4 :locate #f(10 0 10))
     (send c4 :set-color :brown)
     (setq c5 (make-sphere 20))
     (send c5 :locate #f(-10 0 8))
     (send c5 :set-color :brown)
     (setq c6 (make-sphere 10))
     (send c6 :locate #f(18 0 0))
     (send c6 :set-color :peru)
     (send chicken :assoc c1)
     (send chicken :assoc c2)
     (send chicken :assoc c3)
     (send chicken :assoc c4)
     (send chicken :assoc c5)
     (send chicken :assoc c6)
     
     (setq link1 (instance bodyset-link :init (make-cascoords) :bodies (list chicken c1 c2 c3 c4 c5 c6)))
     
     ;;definition of assoc
     (send self :assoc link1)
     
     ;;init-ending
     (setq links (list link1))
     (send self :init-ending)
     (send self :move-to (make-coords :pos pos :rot rot))
     (send-all links :worldpos)
     
     self))
  )

(defun fried-chicken (&rest args) (instance* fried-chicken-object :init args))

	    
