;; Auto-generated. Do not edit!


(when (boundp 'amazing_car::my_angle_msg)
  (if (not (find-package "AMAZING_CAR"))
    (make-package "AMAZING_CAR"))
  (shadow 'my_angle_msg (find-package "AMAZING_CAR")))
(unless (find-package "AMAZING_CAR::MY_ANGLE_MSG")
  (make-package "AMAZING_CAR::MY_ANGLE_MSG"))

(in-package "ROS")
;;//! \htmlinclude my_angle_msg.msg.html


(defclass amazing_car::my_angle_msg
  :super ros::object
  :slots (_yaw ))

(defmethod amazing_car::my_angle_msg
  (:init
   (&key
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _yaw (float __yaw))
   self)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; float32 _yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get amazing_car::my_angle_msg :md5sum-) "2160bf7632f25ad6dc7c5aab561198d4")
(setf (get amazing_car::my_angle_msg :datatype-) "amazing_car/my_angle_msg")
(setf (get amazing_car::my_angle_msg :definition-)
      "float32 yaw

")



(provide :amazing_car/my_angle_msg "2160bf7632f25ad6dc7c5aab561198d4")


