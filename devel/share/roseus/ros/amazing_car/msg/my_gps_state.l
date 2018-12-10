;; Auto-generated. Do not edit!


(when (boundp 'amazing_car::my_gps_state)
  (if (not (find-package "AMAZING_CAR"))
    (make-package "AMAZING_CAR"))
  (shadow 'my_gps_state (find-package "AMAZING_CAR")))
(unless (find-package "AMAZING_CAR::MY_GPS_STATE")
  (make-package "AMAZING_CAR::MY_GPS_STATE"))

(in-package "ROS")
;;//! \htmlinclude my_gps_state.msg.html


(defclass amazing_car::my_gps_state
  :super ros::object
  :slots (_location_state _angle_state ))

(defmethod amazing_car::my_gps_state
  (:init
   (&key
    ((:location_state __location_state) 0)
    ((:angle_state __angle_state) 0)
    )
   (send-super :init)
   (setq _location_state (round __location_state))
   (setq _angle_state (round __angle_state))
   self)
  (:location_state
   (&optional __location_state)
   (if __location_state (setq _location_state __location_state)) _location_state)
  (:angle_state
   (&optional __angle_state)
   (if __angle_state (setq _angle_state __angle_state)) _angle_state)
  (:serialization-length
   ()
   (+
    ;; int32 _location_state
    4
    ;; int32 _angle_state
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _location_state
       (write-long _location_state s)
     ;; int32 _angle_state
       (write-long _angle_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _location_state
     (setq _location_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _angle_state
     (setq _angle_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get amazing_car::my_gps_state :md5sum-) "c597a44bb73f53d7407fbd84dfc626db")
(setf (get amazing_car::my_gps_state :datatype-) "amazing_car/my_gps_state")
(setf (get amazing_car::my_gps_state :definition-)
      "int32 location_state
int32 angle_state

")



(provide :amazing_car/my_gps_state "c597a44bb73f53d7407fbd84dfc626db")


