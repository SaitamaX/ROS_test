; Auto-generated. Do not edit!


(cl:in-package amazing_car-msg)


;//! \htmlinclude my_angle_msg.msg.html

(cl:defclass <my_angle_msg> (roslisp-msg-protocol:ros-message)
  ((yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass my_angle_msg (<my_angle_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <my_angle_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'my_angle_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name amazing_car-msg:<my_angle_msg> is deprecated: use amazing_car-msg:my_angle_msg instead.")))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <my_angle_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader amazing_car-msg:yaw-val is deprecated.  Use amazing_car-msg:yaw instead.")
  (yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <my_angle_msg>) ostream)
  "Serializes a message object of type '<my_angle_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <my_angle_msg>) istream)
  "Deserializes a message object of type '<my_angle_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<my_angle_msg>)))
  "Returns string type for a message object of type '<my_angle_msg>"
  "amazing_car/my_angle_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_angle_msg)))
  "Returns string type for a message object of type 'my_angle_msg"
  "amazing_car/my_angle_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<my_angle_msg>)))
  "Returns md5sum for a message object of type '<my_angle_msg>"
  "2160bf7632f25ad6dc7c5aab561198d4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'my_angle_msg)))
  "Returns md5sum for a message object of type 'my_angle_msg"
  "2160bf7632f25ad6dc7c5aab561198d4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<my_angle_msg>)))
  "Returns full string definition for message of type '<my_angle_msg>"
  (cl:format cl:nil "float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'my_angle_msg)))
  "Returns full string definition for message of type 'my_angle_msg"
  (cl:format cl:nil "float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <my_angle_msg>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <my_angle_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'my_angle_msg
    (cl:cons ':yaw (yaw msg))
))
