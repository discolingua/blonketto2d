class_name GameWorld
extends Node2D

const FORCE_KICKER : float = 700.0
const TEST_MODE : bool = false
const TEST_SHOTS : int = 1000
const TEST_TIME : float = 0.5

var mainScore : int = 0 setget set_mainScore
var testShotCounter : int = 0
var testBin1 : int = 0
var testBin2 : int = 0
var testBin3 : int = 0
var testBin4 : int = 0
var testBin5 : int = 0
var testBin6 : int = 0
var testBin7 : int = 0


# show or hide diagnostic counters
func _ready():
	set_mainScore(0)
	$Control/BinCounter.visible = TEST_MODE

# if TEST_MODE is set, track the individual bin counters and fire
# TEST_SHOTS marbles 
func _process(_delta):
	if TEST_MODE:
		updateBinCounters()
		if testShotCounter < TEST_SHOTS:
			runTest()
	

			
func runTest():
	if $Launcher/Timer.is_stopped():
		$Launcher/Timer.start()
		$Launcher.launchMarble()
		testShotCounter += 1



func set_mainScore(value:int):
	mainScore += value
	$Control/MainScoreDisplay.text = ("%010d" % mainScore)
	# update scoreboard


func updateBinCounters():
	$Control/BinCounter.text = ("%d %d %d %d %d %d %d" % [ testBin1, testBin2, testBin3, testBin4,
														testBin5, testBin6, testBin7])


func _on_LeftKicker_body_entered(body:Node):
	var _bumpVector = Vector2(0.8, -0.6)
	bump(_bumpVector, body, FORCE_KICKER)
	if not TEST_MODE:
		$LeftKicker/AudioStreamPlayer2D.play()
	


func _on_RightKicker_body_entered(body:Node):
	var _bumpVector = Vector2(-0.3, -1)
	bump(_bumpVector, body, FORCE_KICKER)
	if not TEST_MODE:
		$RightKicker/AudioStreamPlayer2D.play()



func bump(bumpVector : Vector2, toObject : Node, force):
	toObject.apply_central_impulse(bumpVector.normalized() * force)
	

# scoring slots =================================================
# set_mainScore is called directly 
# because setters/getters have to be called explicitly in the 
# class where they are defined

func _on_BaseSlot1_body_entered(body:Node):
	set_mainScore(10)
	if not TEST_MODE:
		$BaseSlotBank/BaseSlot1/AudioStreamPlayer2D.play()
	testBin1 += 1
	body.queue_free()



func _on_BaseSlot7_body_entered(body:Node):
	set_mainScore(10)
	if not TEST_MODE:
		$BaseSlotBank/BaseSlot7/AudioStreamPlayer2D.play()
	testBin7 += 1	
	body.queue_free()


func _on_BaseSlot6_body_entered(body:Node):
	set_mainScore(50)
	if not TEST_MODE:
		$BaseSlotBank/BaseSlot6/AudioStreamPlayer2D.play()
	testBin6 += 1
	body.queue_free()


func _on_BaseSlot5_body_entered(body:Node):
	set_mainScore(100)
	if not TEST_MODE:
		$BaseSlotBank/BaseSlot5/AudioStreamPlayer2D.play()
	testBin5 += 1
	body.queue_free()


func _on_BaseSlot4_body_entered(body:Node):
	set_mainScore(1000)
	if not TEST_MODE:
		$BaseSlotBank/BaseSlot4/AudioStreamPlayer2D.play()
	testBin4 += 1
	body.queue_free()


func _on_BaseSlot3_body_entered(body:Node):
	set_mainScore(100)
	if not TEST_MODE:
		$BaseSlotBank/BaseSlot3/AudioStreamPlayer2D.play()
	testBin3 += 1
	body.queue_free()

func _on_BaseSlot2_body_entered(body:Node):
	set_mainScore(50)
	if not TEST_MODE:
		$BaseSlotBank/BaseSlot2/AudioStreamPlayer2D.play()
	testBin2 += 1
	body.queue_free()
