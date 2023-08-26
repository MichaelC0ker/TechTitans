extends Area

signal coinCollected

func _ready():
	pass

func _physics_process(delta):
	#delta ensures below functions are called 60 times per second
	rotate_y(deg2rad(3))

func _on_coin_body_entered(body):
	if body.name == "MainPlayer":
		print("HIT FOR SOME REASON")
		$AnimationPlayer.play("bounce")
		$Timer.start()
		
func _on_Timer_timeout():
	emit_signal("coinCollected")
	queue_free()   #remove coin from screen
