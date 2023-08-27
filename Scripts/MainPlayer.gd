extends KinematicBody

var velocity = Vector3(0,0,0)
const SPEED = 6
const HALT_SPEED = 0
const ROTATION = 5.8

func _ready():
	 pass

func _physics_process(delta):    
	if Input.is_action_pressed("ui_right") and Input.is_action_just_pressed("ui_left"):
		velocity.x = HALT_SPEED
	elif Input.is_action_pressed("ui_right"):
		$CollisionShape/MeshInstance.rotate_z(deg2rad(-ROTATION))
		velocity.x = SPEED 
	elif Input.is_action_pressed("ui_left"):
		$CollisionShape/MeshInstance.rotate_z(deg2rad(ROTATION))
		velocity.x = -SPEED 
	else:
		velocity.x = lerp(velocity.x,0,0.1)
		
		
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_up"):
		velocity.z = HALT_SPEED
	elif Input.is_action_pressed("ui_down"):
		$CollisionShape/MeshInstance.rotate_x(deg2rad(ROTATION))
		velocity.z = SPEED
	elif Input.is_action_pressed("ui_up"):
		$CollisionShape/MeshInstance.rotate_x(deg2rad(-ROTATION))
		velocity.z = -SPEED
	else:
		velocity.z = lerp(velocity.z,0,0.1)
		
	move_and_slide(velocity)
	

func _on_enemy_body_entered(body):
	if body.name == "MainPlayer":
		get_tree().change_scene("res://Assets/GameOver.tscn")
