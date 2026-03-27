class_name PlayerController

extends CharacterBody3D

enum ControlDevice
{
	Keyboard,
	Controller,
	XR,
	Touch
}

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const ROTATE_SPEED = -1

@export var camera:Camera3D 

@export var control_device:ControlDevice