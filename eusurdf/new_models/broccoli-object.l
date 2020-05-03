(defclass broccoli-object
  :super cascaded-link
  :slots ())

(defmethod broccoli-object
  (:init
   (&rest args &key (name "broccoli") (pos (float-vector 0 0 0)) (rot (unit-matrix 3)) &allow-other-keys)
   (let (bro d2)
     (send-super* :init :name name args)

     ;;make object
     (setq bro (make-sphere 25))
     (send bro :locate #f(0 0 0))
     (send bro :set-color :forestgreen)
     (setq d2 (make-cylinder 8 50))
     (send d2 :locate #f(0 0 -50))
     (send d2 :set-color :lightgreen)
     (send bro :assoc d2)
     
     (setq link1 (instance bodyset-link :init (make-cascoords) :bodies (list bro d2)))
     
     ;;definition of assoc
     (send self :assoc link1)
     
     ;;init-ending
     (setq links (list link1))
     (send self :init-ending)
     (send self :move-to (make-coords :pos pos :rot rot))
     (send-all links :worldpos)
     
     self))
  )

(defun broccoli (&rest args) (instance* broccoli-object :init args))

	    
