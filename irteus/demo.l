(defclass sample-robot
  :super robot-model
  :slots ())
(defmethod sample-robot
  (:init 
   (&rest args)
   (let (c bal1 bal2 bal3 bal4 bal5 bal6 bal7
	   bar1 bar2 bar3 bar4 bar5 bar6 bar7
	   bll1 bll2 bll3 bll4 bll5 bll6 bll6b
	   blr1 blr2 blr3 blr4 blr5 blr6 blr6b
	   jal0 jal1 jal2 jal3 jal4 jal5 jal6
	   jar0 jar1 jar2 jar3 jar4 jar5 jar6
	   jll0 jll1 jll2 jll3 jll4 jll5
	   jlr0 jlr1 jlr2 jlr3 jlr4 jlr5
	   bc0 bc1 bc2 jc0 jc1
	   bh0 bh1 bh2 jh0 jh1
	   bh2e
	   )
     (send-super* :init args)
     (setq c (make-coords :pos #f(0 100 0) :rpy (float-vector pi/2 pi/2 0)))

     (setq bc0 (make-cube 100 200 100))
     (send bc0 :locate #f(0 0 -75))
     (send bc0 :set-color :green)
     (setq bc0 (instance bodyset-link :init (make-cascoords) :bodies (list bc0) :name :weist))
     (setq bc1 (make-default-robot-link 0 50 :y :torso-link0))
     (send bc1 :locate #f(0 0 -25))

     (setq bc2 (make-cube 100 200 200))
     (send bc2 :locate #f(0 0 100))
     (send bc2 :set-color :green)
     (setq bc2 (instance bodyset-link :init (make-cascoords) :bodies (list bc2) :name :torso-link1))

     (send self :assoc bc0)
     (send bc0 :assoc bc1)
     (send bc1 :assoc bc2)
     
     (setq jc0 (instance rotational-joint :init :parent-link bc0 :child-link bc1 :name :torso-waist-y :axis :z :min-angle -45 :max-angle 45))
     (setq jc1 (instance rotational-joint :init :parent-link bc1 :child-link bc2 :name :torso-waist-p :axis :y))
     
     ;;
     ;;

     (setq bh0 (make-default-robot-link 0 50 :z :head-link0))

     (setq bh1 (make-default-robot-link 0 50 :y :head-link1))

     (setq bh2 (make-cube 120 100 150))
     (send bh2 :locate #f(0 0 80))
     (send bh2 :set-color :green)
     (setq bh2e (make-cylinder 10 30))
     (send bh2e :rotate pi/2 :y)
     (send bh2e :locate #f(60 0 70) :world)
     (send bh2e :set-color :green)
     (send bh2 :assoc bh2e)
     (setq bh2 (instance bodyset-link :init (make-cascoords) :bodies (list bh2 bh2e) :name :head))

     (setq head-end-coords (make-cascoords :pos #f(60 0 100) :rpy (float-vector 0 pi/2 0)))
     (send bh2 :assoc head-end-coords)
     (send bh1 :assoc bh2)
     (send bh0 :assoc bh1)
     (send bh0 :locate #f(0 0 225))
     (send bc2 :assoc bh0)
     
     (setq jh0 (instance rotational-joint :init :parent-link bh0 :child-link bh1 :name :head-neck-y :axis :z))
     (setq jh1 (instance rotational-joint :init :parent-link bh1 :child-link bh2 :name :head-neck-p :axis :y))

     ;;
     ;;

     (setq bal1 (make-default-robot-link 0 50 :y :larm-link0))
     (setq bal2 (make-default-robot-link 0 50 :x :larm-link1))
     (setq bal3 (make-default-robot-link 275 50 :z :larm-link2))
     (setq bal4 (make-default-robot-link 195 50 :y :larm-link3))
     (setq bal5 (make-default-robot-link 0 50 :z :larm-link4))
     (setq bal6 (make-default-robot-link 0 50 :x :larm-link5))
     (setq bal7 (make-default-robot-link 50 50 :y :larm-link6))
     (setq larm-end-coords (make-cascoords))
     (send larm-end-coords :locate #f(0 0 -50))
     (send bal7 :assoc larm-end-coords)
     (send bal6 :assoc bal7)
     (send bal5 :assoc bal6)
     (send bal5 :translate #f(0 0 -195) :world)
     (send bal4 :assoc bal5)
     (send bal4 :translate #f(0 0 -275) :world)
     (send bal3 :assoc bal4)
     (send bal2 :assoc bal3)
     (send bal1 :assoc bal2)
     (send bal1 :translate #f(0 150 175) :world)
     (send bc2  :assoc bal1)

     (setq bar1 (make-default-robot-link 0 50 :y :rarm-link0))
     (setq bar2 (make-default-robot-link 0 50 :x :rarm-link1))
     (setq bar3 (make-default-robot-link 275 50 :z :rarm-link2))
     (setq bar4 (make-default-robot-link 195 50 :y :rarm-link3))
     (setq bar5 (make-default-robot-link 0 50 :z :rarm-link4))
     (setq bar6 (make-default-robot-link 0 50 :x :rarm-link5))
     (setq bar7 (make-default-robot-link 50 50 :y :rarm-link6))
     (setq rarm-end-coords (make-cascoords))
     (send rarm-end-coords :locate #f(0 0 -50))
     (send bar7 :assoc rarm-end-coords)
     (send bar6 :assoc bar7)
     (send bar5 :assoc bar6)
     (send bar5 :translate #f(0 0 -195) :world)
     (send bar4 :assoc bar5)
     (send bar4 :translate #f(0 0 -275) :world)
     (send bar3 :assoc bar4)
     (send bar2 :assoc bar3)
     (send bar1 :assoc bar2)
     (send bar1 :translate #f(0 -150 175) :world)
     (send bc2  :assoc bar1)

     (setq jal0 (instance rotational-joint :init :parent-link bc2  :child-link bal1 :name :larm-shoulder-p :axis :y))
     (setq jal1 (instance rotational-joint :init :parent-link bal1 :child-link bal2 :name :larm-shoulder-r :axis :x :min-angle -30 :max-angle 180))
     (setq jal2 (instance rotational-joint :init :parent-link bal2 :child-link bal3 :name :larm-shoulder-y :axis :z))
     (setq jal3 (instance rotational-joint :init :parent-link bal3 :child-link bal4 :name :larm-elbow-p :axis :y :min-angle -180 :max-angle 0))
     (setq jal4 (instance rotational-joint :init :parent-link bal4 :child-link bal5 :name :larm-wrist-y :axis :z))
     (setq jal5 (instance rotational-joint :init :parent-link bal5 :child-link bal6 :name :larm-wrist-r :axis :x))
     (setq jal6 (instance rotational-joint :init :parent-link bal6 :child-link bal7 :name :larm-wrist-p :axis :y))

     (setq jar0 (instance rotational-joint :init :parent-link bc2  :child-link bar1 :name :rarm-shoulder-p :axis :y))
     (setq jar1 (instance rotational-joint :init :parent-link bar1 :child-link bar2 :name :rarm-shoulder-r :axis :-x :min-angle -30 :max-angle 180))
     (setq jar2 (instance rotational-joint :init :parent-link bar2 :child-link bar3 :name :rarm-shoulder-y :axis :-z))
     (setq jar3 (instance rotational-joint :init :parent-link bar3 :child-link bar4 :name :rarm-elbow-p :axis :y :min-angle -180 :max-angle 0))
     (setq jar4 (instance rotational-joint :init :parent-link bar4 :child-link bar5 :name :rarm-wrist-y :axis :z))
     (setq jar5 (instance rotational-joint :init :parent-link bar5 :child-link bar6 :name :rarm-wrist-r :axis :-x))
     (setq jar6 (instance rotational-joint :init :parent-link bar6 :child-link bar7 :name :rarm-wrist-p :axis :y))
     ;;;
     ;;;
     (setq bll1 (make-default-robot-link 0 50 :y :lleg-link0))
     (setq bll2 (make-default-robot-link 0 50 :x :lleg-link1))
     (setq bll3 (make-default-robot-link 225 50 :z :lleg-link2))
     (setq bll4 (make-default-robot-link 225 50 :y :lleg-link3))
     (setq bll5 (make-default-robot-link 0 50 :x :lleg-link4))
     (setq bll6b (make-cube 200 100 25))
     (send bll6b :locate #f(50 0 -50))
     (send bll6b :set-color :green)
     (setq bll6 (make-default-robot-link 50 50 :y :lleg-link5 (list bll6b)))
     (setq lleg-end-coords (make-cascoords))
     (send lleg-end-coords :locate #f(0 0 -62.5))
     (send bll6 :assoc lleg-end-coords)
     (send bll5 :assoc bll6)
     (send bll5 :translate #f(0 0 -250) :world)
     (send bll4 :assoc bll5)
     (send bll4 :translate #f(0 0 -250) :world)
     (send bll3 :assoc bll4)
     (send bll2 :assoc bll3)
     (send bll1 :assoc bll2)
     (send bll1 :translate #f(0 75 -150) :world)
     (send bc0 :assoc bll1)

     (setq blr1 (make-default-robot-link 0 50 :y :rarm-link0))
     (setq blr2 (make-default-robot-link 0 50 :-x :rarm-link1))
     (setq blr3 (make-default-robot-link 225 50 :-z :rarm-link2))
     (setq blr4 (make-default-robot-link 225 50 :y :rarm-link3))
     (setq blr5 (make-default-robot-link 0 50 :-x :rarm-link4))
     (setq blr6b (make-cube 200 100 25))
     (send blr6b :locate #f(50 0 -50))
     (send blr6b :set-color :green)
     (setq blr6 (make-default-robot-link 50 50 :y :rarm-link5 (list blr6b)))
     (setq rleg-end-coords (make-cascoords))
     (send rleg-end-coords :locate #f(0 0 -62.5))
     (send blr6 :assoc rleg-end-coords)
     (send blr5 :assoc blr6)
     (send blr5 :translate #f(0 0 -250) :world)
     (send blr4 :assoc blr5)
     (send blr4 :translate #f(0 0 -250) :world)
     (send blr3 :assoc blr4)
     (send blr2 :assoc blr3)
     (send blr1 :assoc blr2)
     (send blr1 :translate #f(0 -75 -150) :world)
     (send bc0 :assoc blr1)

     (send bc0 :locate #f(0 0 700))

     (setq jll0 (instance rotational-joint :init :parent-link bc0 :child-link bll1 :name :lleg-crotch-y :axis :z))
     (setq jll1 (instance rotational-joint :init :parent-link bll1 :child-link bll2 :name :lleg-crotch-r :axis :x))
     (setq jll2 (instance rotational-joint :init :parent-link bll2 :child-link bll3 :name :lleg-crotch-p :axis :y))
     (setq jll3 (instance rotational-joint :init :parent-link bll3 :child-link bll4 :name :lleg-knee-p :axis :y :min-angle 0))
     (setq jll4 (instance rotational-joint :init :parent-link bll4 :child-link bll5 :name :lleg-ankle-p :axis :x))
     (setq jll5 (instance rotational-joint :init :parent-link bll5 :child-link bll6 :name :lleg-ankle-r :axis :y))

     (setq jlr0 (instance rotational-joint :init :parent-link bc0 :child-link blr1 :name :rleg-crotch-y :axis :-z))
     (setq jlr1 (instance rotational-joint :init :parent-link blr1 :child-link blr2 :name :rleg-crotch-r :axis :-x))
     (setq jlr2 (instance rotational-joint :init :parent-link blr2 :child-link blr3 :name :rleg-crotch-p :axis :y))
     (setq jlr3 (instance rotational-joint :init :parent-link blr3 :child-link blr4 :name :rleg-kneep-p :axis :y :min-angle 0))
     (setq jlr4 (instance rotational-joint :init :parent-link blr4 :child-link blr5 :name :rleg-ankle-p :axis :-x))
     (setq jlr5 (instance rotational-joint :init :parent-link blr5 :child-link blr6 :name :rleg-ankle-r :axis :y))

     ;;;
     ;;;
     (setq larm-root-link bal1 rarm-root-link bar1
	   lleg-root-link bll1 rleg-root-link blr1
	   torso-root-link bc1 head-root-link bh1)
     (setq larm (list bal1 bal2 bal3 bal4 bal5 bal6 bal7)
	   rarm (list bar1 bar2 bar3 bar4 bar5 bar6 bar7)
	   lleg (list bll1 bll2 bll3 bll4 bll5 bll6)
	   rleg (list blr1 blr2 blr3 blr4 blr5 blr6)
	   head (list bh1 bh2)
	   torso (list bc1 bc2))
     (setq links (list bc0 bc1 bc2 bh0 bh1 bh2
		       bal1 bal2 bal3 bal4 bal5 bal6 bal7
		       bar1 bar2 bar3 bar4 bar5 bar6 bar7
		       bll1 bll2 bll3 bll4 bll5 bll6
		       blr1 blr2 blr3 blr4 blr5 blr6
		       ))
     (setq joint-list (list jc0 jc1 jh0 jh1
			    jal0 jal1 jal2 jal3 jal4 jal5 jal6
			    jar0 jar1 jar2 jar3 jar4 jar5 jar6
			    jll0 jll1 jll2 jll3 jll4 jll5
			    jlr0 jlr1 jlr2 jlr3 jlr4 jlr5
			    ))
     (setq ik-collision-link-pair (list (list bal4 bc0) (list bal4 bc2)
					(list bar4 bc0) (list bar4 bc2)))
     (send self :init-ending)
     self))
  )

(defun test1
  (&key (target (make-coords :pos (float-vector 0 0 1500))))
  "full body ik"
  (let (ll dav r iik fik len a vel)
    ;;
    (unless (boundp '*robot*)
      (setq *robot* (instance sample-robot :init)))
    (send *robot* :angle-vector (instantiate float-vector 30))
    (send *robot* :newcoords (make-coords))
    (send *robot* :legs :angle-vector #f(0 0 -10 20 -10 0 0))
    (send *robot* :arms :angle-vector #f(10 20 0 -20 10 0 0))

    (send *robot* :transform (send  (send *robot* :lleg :end-coords) :transformation (make-coords)))
    (setq ll (send *robot* :link-list
		   (send *robot* :larm :end-coords :parent)
		   (send *robot* :torso :root-link)
		   ;;(send *robot* :larm :root-link)
		   ;;(send *robot* :lleg :end-coords :parent)
		   ))
    (objects (list *robot*))
    ;;
    (do-until-key
	(setq vel (send (send *robot* :larm :end-coords) :difference-position target))
       (send *robot* :move-joints-avoidance
	      vel #f(0 0 0) :link-list ll
	      :move-target (send *robot* :larm :end-coords)
	      :rotation-axis nil :translation-axis t
	      :p-limit 10
	      :debug-view t
	      )
      (send *robot* :head :look-at (send *robot* :larm :end-coords :worldpos))
      (send *robot* :transform
	    (send *robot* :transformation (make-coords)))
      (send *robot* :transform
	    (send (send *robot* :lleg :end-coords) :transformation (make-coords)))
      (send *irtviewer* :draw-objects :flush nil)
      (send *irtviewer* :viewer :viewsurface :color #f(1 1 1))
      (send *irtviewer* :viewer :viewsurface :line-width 8)
      (send *irtviewer* :draw-line
	    (send *robot* :larm :end-coords :worldpos)
	    (send *robot* :rarm :end-coords :worldpos))
      (send *irtviewer* :flush)
      )
    ))


(defun test2 nil
  (let ((i 0))
    ;;
    (provide :rbrain-basic nil)
    (defclass robot-link :super cascaded-link)
    (defclass articulated-link :super cascaded-link
      :slots (analysis-level))
    (defmethod articulated-link
      (:vertices () (list (send self :worldpos))))
    (defclass robot-frame :super cascaded-link)
    (defclass robot-limb :super cascaded-link)
    (unless (find-package "WIN32") (make-package "WIN32"))
    (load "~/prog/euslib/rbrain/jskmapclass.l")
    (defmethod bodyset-with-knowledge
      (:vertices () (list (send self :worldpos))))
    (setq r0 (instance sample-robot :init))
    (send r0 :lleg :move-end-pos #f(0 0 50) :local :rotation-axis t)
    (send r0 :rleg :move-end-pos #f(0 0 50) :local :rotation-axis t)
    (setq b0 (instance broom :init :length 700 :bar-color :brown :sweep-color :red))
    (send b0 :locate #f(200 0 0))
    (objects (list  r0 b0))
    ;;
    (do-until-key
      (send r0 :larm :inverse-kinematics (car (send b0 :handle))
	    :rotation-axis nil :thre 10.0 :rthre 100.0 :debug-view nil)
      (send r0 :rarm :inverse-kinematics (cadr (send b0 :handle))
	    :rotation-axis nil :thre 10.0 :rthre 100.0 :debug-view nil)
      (send b0 :orient (* 0.2 (sin (/ i 10.0))) :x :world)
      (send b0 :locate (float-vector 200 (* 100 (sin (/ (incf i) 10.0))) 0) :world)
      (incf i)
	    
      (send *irtviewer* :draw-objects)
     )
    ))
;;;
;;;
;;;

(defclass sample-hand
  :super cascaded-link
  :slots (thumb-end-coords middle-end-coords inedex-end-cords))
(defmethod sample-hand
  (:init
   (&rest args)
   (let (b0 b00 b01 b10 b11 b20 b21
	    j00 j01 j10 j11 j2 j22)
     (send-super* :init args)
     (setq b0 (make-cube 40 75 114))
     (setq b0 (instance bodyset-link :init (make-cascoords) 
			:bodies (list b0)
			:name "root-link"))

     ;;koyubi
     (setq b00 (make-cylinder 11 75))
     (send b00 :set-color :gray60)
     (setq b00 (instance bodyset-link :init (make-cascoords)
			 :bodies (list b00)
			 :name "koyubi-link-0"))
     (send b00 :locate #f(-3 -22 57))
     (setq b01 (make-cylinder 11 45))
     (send b01 :set-color :gray60)
     (setq b01 (instance bodyset-link :init (make-cascoords)
			 :bodies (list b01)
			 :name "koyubi-link-1"))
     (send b01 :locate #f(-3 -22 132))
     (setq middle-end-coords 
       (make-cascoords :pos (float-vector -3 -22 (+ 45 132))))
     (send b01 :assoc middle-end-coords)

     ;;hitosashi
     (setq b10 (make-cylinder 11 75))
     (send b10 :set-color :gray60)
     (setq b10 (instance bodyset-link :init (make-cascoords)
			 :bodies (list b10)
			 :name "hitosashi-link-0"))
     (send b10 :locate #f(-3  18  57))
     (setq b11 (make-cylinder 11 45))
     (send b11 :set-color :gray60)
     (setq b11 (instance bodyset-link :init (make-cascoords)
			 :bodies (list b11)
			 :name "hitosashi-link-1"))
     (send b11 :locate #f(-3  18 132))
     (setq index-end-coords 
       (make-cascoords :pos (float-vector -3 18 (+ 45 132))))
     (send b11 :assoc index-end-coords)

     ;;oyayubi
     (setq b20 (make-cylinder 11 27))
     (send b20 :set-color :gray60)
     (setq b20 (instance bodyset-link :init (make-cascoords)
			 :bodies (list b20)
			 :name "oyayubi-link-0"))
     (send b20 :locate #f(30 23  -18))
     (send b20 :rotate pi/2 :y)

     (setq b21 (make-cylinder 11 40))
     (send b21 :set-color :gray60)
     (setq b21 (instance bodyset-link :init (make-cascoords)
			 :bodies (list b21)
			 :name "oyayubi-link-1"))
     (send b21 :locate #f(57 25  -18))
     (send b21 :rotate pi :z)
     (setq b22 (make-cylinder 11 40))
     (send b22 :set-color :gray60)
     (setq b22 (instance bodyset-link :init (make-cascoords)
			 :bodies (list b22)
			 :name "oyayubi-link-2"))
     (send b22 :locate #f(57 25 25))
     (send b22 :rotate pi :z)
     (setq thumb-end-coords 
       (make-cascoords :pos (float-vector 47 25 (+ 55 20))))
     (send b22 :assoc thumb-end-coords)
     ;;
     (setq j00 (instance rotational-joint :init :name :j00
			 :child-link b00 :parent-link b0 :axis :y
			 :min-angle 00 :max-angle 120))
     (setq j01 (instance rotational-joint :init :name :j01
			 :child-link b01 :parent-link b00 :axis :y
			 :min-angle 0 :max-angle 120))
     (setq j10 (instance rotational-joint :init :name :j10
			 :child-link b10 :parent-link b0 :axis :y
			 :min-angle 0 :max-angle 120))
     (setq j11 (instance rotational-joint :init :name :j11
			 :child-link b11 :parent-link b10 :axis :y
			 :min-angle 0 :max-angle 120))
     (setq j20 (instance rotational-joint :init :name :j10
			 :child-link b20 :parent-link b0 :axis :x
			 :min-angle -90 :max-angle 45))
     (setq j21 (instance rotational-joint :init :name :j11
			 :child-link b21 :parent-link b20 :axis :y
			 :min-angle -90 :max-angle 0))
     (setq j22 (instance rotational-joint :init :name :j11
			 :child-link b22 :parent-link b21 :axis :y
			 :min-angle 0 :max-angle 120))
     (send self :assoc b0)
     (send b0 :assoc b00)
     (send b00 :assoc b01)
     (send b0 :assoc b10)
     (send b10 :assoc b11)
     (send b0 :assoc b20)
     (send b20 :assoc b21)
     (send b21 :assoc b22)
     
     (send b00 :rotate 0.14889 :x)

     ;;
     (setq links (list b0 b00 b01 b10 b11 b20 b21 b22))
     (setq joint-list (list j00 j01 j10 j11 j20 j21 j22))

     (send self :init-ending)
     self))
  (:thumb-end-coords () thumb-end-coords)
  (:middle-end-coords () middle-end-coords)
  (:index-end-coords () index-end-coords)
  )


(defun link-descendants (l &optional (r (list l)) rr)
  (let ((cl (send l :child-links))) 
    (unless cl
      (push r rr)
      (return-from link-descendants rr))
    (dolist (ll cl)
      (setq r (append r (list ll)))
      (setq rr (link-descendants ll r rr)))
    rr))

(defun test3 nil
  (let (i r k ln (av0 #f(-10 45 -20 50 -60 -30 40)) av1 av)
    (setq h0 (instance sample-hand :init :name "sample hand"))
    (send h0 :angle-vector av0)
    (setq c0 (make-gdome (make-icosahedron 40)))
    (send c0 :locate #f(60 0 40))
    (send c0 :set-color :green)
    (objects (list h0 c0))
    (setq i 0)
    (do-until-key
	(when (= (mod i 400) 0)
	  (setq av0 (send h0 :angle-vector))
	  (dotimes (i 10)
	    (mapcar
	     #'(lambda (move-coords target-coords)
		 (let ((vel-pos (send move-coords :difference-position target-coords))
		       (vel-rot (send move-coords :difference-rotation target-coords :rotation-axis nil)))
		   (send h0 :move-joints vel-pos vel-rot
			 :move-target move-coords
			 :link-list (send h0 :link-list (send move-coords :parent))
			 :rotation-axis nil :translation-axis t
			 )))
	     (list (send h0 :thumb-end-coords)
		   (send h0 :index-end-coords)
		   (send h0 :middle-end-coords)
		   )
	     (list (send h0 :index-end-coords)
		   (send h0 :thumb-end-coords)
		   (send h0 :thumb-end-coords)
	     )))
	  (setq av1 (send h0 :angle-vector))
	  (send *irtviewer* :draw-objects :flush t)
	  (send h0 :angle-vector av0)
	  (setq av (scale 0.01 (v- av1 av0)))
	  )
      (setq ln nil)
      (dotimes (k (length (send h0 :joint-list)))
	(setq j (elt (send h0 :joint-list) k))
	(setq r
	  (sort
	   (mapcar #'(lambda (l)
		       (pqp-collision-distance l c0))
		   (flatten (link-descendants (send j :child-link))))
	   #'<= #'car))
	(if (evenp (/ i 200))
	    (if (> (caar r) 5)
		(send j :joint-angle (elt av k) :relative t))
	  (send j :joint-angle -0.1 :relative t))
	(push (cdar r) ln)
	)
      (print i)

      (send *irtviewer* :draw-objects :flush nil)
      (send *irtviewer* :viewer :viewsurface :color #f(1 1 1))
      (send *irtviewer* :viewer :viewsurface :line-width 4)
      (dolist (l ln)
	(send* *irtviewer* :draw-line l))
      (send *irtviewer* :flush)
      (incf i)
      )
  ))

;;;
;;;

(warn "(test1) for humanoid~%")
(warn "(test2) for tool usage~%")
(warn "(test3) for hand model~%")


(unless (boundp '*irtviewer*) (make-irtviewer))