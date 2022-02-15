extends KinematicBody2D



func _on_Right_Kicker_body_entered(body:Node):
	if body.is_in_group("marbles"):
		body.apply_central_impulse(Vector2(-100,-100))

    