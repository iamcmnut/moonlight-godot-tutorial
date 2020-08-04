extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const WALK_SPEED = 200
const GRAVITY = 2000
const JUMP_FORCE = 750
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	velocity.y += GRAVITY * delta

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
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP_FORCE

	velocity = move_and_slide(velocity, Vector2(0, -1))
	pass
