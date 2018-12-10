// Auto-generated. Do not edit!

// (in-package amazing_car.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class my_gps_state {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.location_state = null;
      this.angle_state = null;
    }
    else {
      if (initObj.hasOwnProperty('location_state')) {
        this.location_state = initObj.location_state
      }
      else {
        this.location_state = 0;
      }
      if (initObj.hasOwnProperty('angle_state')) {
        this.angle_state = initObj.angle_state
      }
      else {
        this.angle_state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type my_gps_state
    // Serialize message field [location_state]
    bufferOffset = _serializer.int32(obj.location_state, buffer, bufferOffset);
    // Serialize message field [angle_state]
    bufferOffset = _serializer.int32(obj.angle_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type my_gps_state
    let len;
    let data = new my_gps_state(null);
    // Deserialize message field [location_state]
    data.location_state = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [angle_state]
    data.angle_state = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'amazing_car/my_gps_state';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c597a44bb73f53d7407fbd84dfc626db';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 location_state
    int32 angle_state
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new my_gps_state(null);
    if (msg.location_state !== undefined) {
      resolved.location_state = msg.location_state;
    }
    else {
      resolved.location_state = 0
    }

    if (msg.angle_state !== undefined) {
      resolved.angle_state = msg.angle_state;
    }
    else {
      resolved.angle_state = 0
    }

    return resolved;
    }
};

module.exports = my_gps_state;
