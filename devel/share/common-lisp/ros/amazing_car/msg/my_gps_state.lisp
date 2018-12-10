; Auto-generated. Do not edit!


(cl:in-package amazing_car-msg)


;//! \htmlinclude my_gps_state.msg.html

(cl:defclass <my_gps_state> (roslisp-msg-protocol:ros-message)
  ((location_state
    :reader location_state
    :initarg :location_state
    :type cl:integer
    :initform 0)
   (angle_state
    :reader angle_state
    :initarg :angle_state
    :type cl:integer
    :initform 0))
)

(cl:defclass my_gps_state (<my_gps_state>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <my_gps_state>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'my_gps_state)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name amazing_car-msg:<my_gps_state> is deprecated: use amazing_car-msg:my_gps_state instead.")))

(cl:ensure-generic-function 'location_state-val :lambda-list '(m))
(cl:defmethod location_state-val ((m <my_gps_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader amazing_car-msg:location_state-val is deprecated.  Use amazing_car-msg:location_state instead.")
  (location_state m))

(cl:ensure-generic-function 'angle_state-val :lambda-list '(m))
(cl:defmethod angle_state-val ((m <my_gps_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader amazing_car-msg:angle_state-val is deprecated.  Use amazing_car-msg:angle_state instead.")
  (angle_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <my_gps_state>) ostream)
  "Serializes a message object of type '<my_gps_state>"
  (cl:let* ((signed (cl:slot-value msg 'location_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'angle_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <my_gps_state>) istream)
  "Deserializes a message object of type '<my_gps_state>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'location_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<my_gps_state>)))
  "Returns string type for a message object of type '<my_gps_state>"
  "amazing_car/my_gps_state")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_gps_state)))
  "Returns string type for a message object of type 'my_gps_state"
  "amazing_car/my_gps_state")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<my_gps_state>)))
  "Returns md5sum for a message object of type '<my_gps_state>"
  "c597a44bb73f53d7407fbd84dfc626db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'my_gps_state)))
  "Returns md5sum for a message object of type 'my_gps_state"
  "c597a44bb73f53d7407fbd84dfc626db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<my_gps_state>)))
  "Returns full string definition for message of type '<my_gps_state>"
  (cl:format cl:nil "int32 location_state~%int32 angle_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'my_gps_state)))
  "Returns full string definition for message of type 'my_gps_state"
  (cl:format cl:nil "int32 location_state~%int32 angle_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <my_gps_state>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <my_gps_state>))
  "Converts a ROS message object to a list"
  (cl:list 'my_gps_state
    (cl:cons ':location_state (location_state msg))
    (cl:cons ':angle_state (angle_state msg))
))
