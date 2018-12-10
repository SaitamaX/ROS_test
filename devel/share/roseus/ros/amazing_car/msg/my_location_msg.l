;; Auto-generated. Do not edit!


(when (boundp 'amazing_car::my_location_msg)
  (if (not (find-package "AMAZING_CAR"))
    (make-package "AMAZING_CAR"))
  (shadow 'my_location_msg (find-package "AMAZING_CAR")))
(unless (find-package "AMAZING_CAR::MY_LOCATION_MSG")
  (make-package "AMAZING_CAR::MY_LOCATION_MSG"))

(in-package "ROS")
;;//! \htmlinclude my_location_msg.msg.html


(defclass amazing_car::my_location_msg
  :super ros::object
  :slots (_x _y ))

(defmethod amazing_car::my_location_msg
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get amazing_car::my_location_msg :md5sum-) "209f516d3eb691f0663e25cb750d67c1")
(setf (get amazing_car::my_location_msg :datatype-) "amazing_car/my_location_msg")
(setf (get amazing_car::my_location_msg :definition-)
      "float64 x
float64 y

")



(provide :amazing_car/my_location_msg "209f516d3eb691f0663e25cb750d67c1")


