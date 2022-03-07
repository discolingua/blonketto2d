class_name Launcher
extends MeshInstance2D

const FORCE = 1700
const TORQUE = 200

onready var marble = preload("res://Marble.tscn")

func _ready() -> void:
	pass

func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):

		var b = get_node("/root/GameWorld").ballsRemaining

		if b > 0:
			get_node("/root/GameWorld").set_ballsRemaining(-1)
			launchMarble()
			# keep sound out of the main launch loop
			# for flexibility in testing
			$AudioStreamPlayer2D.play()

func launchMarble():
	var _marble = marble.instance()
	add_child(_marble)
	var _launchForce = FORCE + rand_range(0,200)
	_marble.apply_central_impulse(Vector2(0,-_launchForce))
	_marble.apply_torque_impulse(rand_range(-TORQUE, TORQUE))
		# print(_launchForce)
