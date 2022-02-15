class_name GameWorld
extends Node2D

const FORCE_KICKER : float = 700.0


func _on_LeftKicker_body_entered(body:Node):
	var _bumpVector = Vector2(0.8, -0.6)
	bump(_bumpVector, body, FORCE_KICKER)
	$LeftKicker/AudioStreamPlayer2D.play()
	


func _on_RightKicker_body_entered(body:Node):
	var _bumpVector = Vector2(-0.3, -1)
	print (".")
	bump(_bumpVector, body, FORCE_KICKER)
	$RightKicker/AudioStreamPlayer2D.play()



func bump(bumpVector, toObject, force):
	toObject.apply_central_impulse(bumpVector.normalized() * force)
	

