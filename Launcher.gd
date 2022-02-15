class_name Launcher
extends MeshInstance2D

const FORCE = 1700
const TORQUE = 2000

onready var marble = preload("res://Marble.tscn")

func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		var _marble = marble.instance()
		add_child(_marble)
		var _launchForce = FORCE + rand_range(0,200)
		_marble.apply_central_impulse(Vector2(0,-_launchForce))
		_marble.apply_torque_impulse(rand_range(-TORQUE, TORQUE))
		print(_launchForce)
