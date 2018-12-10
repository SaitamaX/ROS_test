
(cl:in-package :asdf)

(defsystem "amazing_car-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "my_angle_msg" :depends-on ("_package_my_angle_msg"))
    (:file "_package_my_angle_msg" :depends-on ("_package"))
    (:file "my_gps_state" :depends-on ("_package_my_gps_state"))
    (:file "_package_my_gps_state" :depends-on ("_package"))
    (:file "my_location_msg" :depends-on ("_package_my_location_msg"))
    (:file "_package_my_location_msg" :depends-on ("_package"))
  ))