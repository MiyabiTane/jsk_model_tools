(defclass tamagoyaki-object
  :super cascaded-link
  :slots ())

(defmethod tamagoyaki-object
  (:init
   (&rest args &key (name "tamagoyaki") (pos (float-vector 0 0 0)) (rot (unit-matrix 3)) &allow-other-keys)
   (let (tamagoyaki a1 a2)
     (send-super* :init :name name args)

     ;;make object
     (setq points (list #f(-20 18 0) #f(-10 25 0) #f(10 25 0) #f(20 18 0) #f(20 -18 0) #f(10 -25 0) #f(-10 -25 0) #f(-20 -18 0)))
     (setq tamagoyaki (make-prism points 20))
     (send tamagoyaki :locate #f(0 0 0))
     (send tamagoyaki :set-color :yellow)
     (setq points (list #f(-15 13 0) #f(-5 20 0) #f(5 20 0) #f(15 13 0) #f(15 -13 0) #f(5 -20 0) #f(-5 -20 0) #f(-15 -13 0)))
     (setq a1 (make-prism points 20))
     (send a1 :locate #f(0 0 0.1))
     (send a1 :set-color :white)
     (send tamagoyaki :assoc a1)
     (setq points (list #f(-10 8 0) #f(-1 15 0) #f(1 15 0) #f(10 8 0) #f(10 -15 0) #f(1 -25 0) #f(-1 -25 0) #f(-10 -15 0)))
     (setq a2 (make-prism points 20))
     (send a2 :locate #f(0 0 0.2))
     (send a2 :set-color :yellow)
     (send tamagoyaki :assoc a2)
     
     (setq link1 (instance bodyset-link :init (make-cascoords) :bodies (list tamagoyaki a1 a2)))
     
     ;;definition of assoc
     (send self :assoc link1)
     
     ;;init-ending
     (setq links (list link1))
     (send self :init-ending)
     (send self :move-to (make-coords :pos pos :rot rot))
     (send-all links :worldpos)
     
     self))
  )

(defun tamagoyaki (&rest args) (instance* tamagoyaki-object :init args))

	    
