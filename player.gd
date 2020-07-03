extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const WALK_SPEED = 100
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
		$Sprite.play("run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		$Sprite.play("run")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
		velocity.x = 0
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = - WALK_SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.y = WALK_SPEED
	else:
		velocity.y = 0
		
	move_and_slide(velocity)
	pass
