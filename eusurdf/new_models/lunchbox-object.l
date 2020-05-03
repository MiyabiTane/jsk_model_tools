(defclass lunchbox-object
  :super cascaded-link
  :slots ())

(defmethod lunchbox-object
  (:init
   (&rest args &key (name "lunchbox") (pos (float-vector 0 0 0)) (rot (unit-matrix 3)) &allow-other-keys)

   (defun make-lunchbox ()
     (let (box b2 b3)
       (setq box (make-cube 180 260 100))
       (send box :locate #f(0 0 0)) 
       (setq b2 (make-cube 170 250 90))
       (send b2 :locate #f(0 0 5))
       (setq box (body- box b2))
       (setq b3 (make-cube 180 10 100))
       (send b3 :locate #f(0 50 0))
       (setq box (body+ box b3))
       (send box :set-color :salmon)
       box))

   (let (box rice)
     (send-super* :init :name name args)
     
     ;;make object
     (setq box (make-lunchbox))
     (setq rice (make-cube 170 70 40))
     (send rice :locate #f(0 90 0))
     (send rice :set-color :white)
     (send box :assoc rice)
     (instance bodyset-link :init (make-cascoords) :bodies (list box rice))
     
     (setq link1 (instance bodyset-link :init (make-cascoords) :bodies (list box rice)))
     
     ;;definition of assoc
     (send self :assoc link1)
     
     ;;init-ending
     (setq links (list link1))
     (send self :init-ending)
     (send self :move-to (make-coords :pos pos :rot rot))
     (send-all links :worldpos)
     
     self))
  )

(defun lunchbox (&rest args) (instance* lunchbox-object :init args))

	    
