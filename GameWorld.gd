class_name GameWorld
extends Node2D

const FORCE_KICKER : float = 700.0

var mainScore : int = 0 setget set_mainScore


func _ready():
	set_mainScore(0)


func set_mainScore(value:int):
	mainScore += value
	$Control/MainScoreDisplay.text = ("%010d" % mainScore)
	# update scoreboard



func _on_LeftKicker_body_entered(body:Node):
	var _bumpVector = Vector2(0.8, -0.6)
	bump(_bumpVector, body, FORCE_KICKER)
	$LeftKicker/AudioStreamPlayer2D.play()
	


func _on_RightKicker_body_entered(body:Node):
	var _bumpVector = Vector2(-0.3, -1)
	bump(_bumpVector, body, FORCE_KICKER)
	$RightKicker/AudioStreamPlayer2D.play()



func bump(bumpVector, toObject, force):
	toObject.apply_central_impulse(bumpVector.normalized() * force)
	

# scoring slots =================================================
# set_mainScore has to be called directly because setters/getters
# have to be called explicitly in the class where they are defined

func _on_BaseSlot1_body_entered(body:Node):
	set_mainScore(10)
	print(mainScore)
	body.queue_free()


func _on_BaseSlot7_body_entered(body:Node):
	set_mainScore(10)
	body.queue_free()


func _on_BaseSlot6_body_entered(body:Node):
	set_mainScore(50)
	body.queue_free()


func _on_BaseSlot5_body_entered(body:Node):
	set_mainScore(100)
	body.queue_free()


func _on_BaseSlot4_body_entered(body:Node):
	set_mainScore(1000)
	$BaseSlotBank/BaseSlot4/AudioStreamPlayer2D.play()
	body.queue_free()


func _on_BaseSlot3_body_entered(body:Node):
	set_mainScore(100)
	body.queue_free()

func _on_BaseSlot2_body_entered(body:Node):
	set_mainScore(50)
	body.queue_free()
