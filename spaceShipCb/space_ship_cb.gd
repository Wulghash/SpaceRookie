extends CharacterBody2D


@onready var ship_sprite = $ShipSprite
@onready var animation_player = $ShipSprite/AnimationPlayer
var _speed: float = 250.0

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("glow_animation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _physics_process(delta):
	fly()
	move_and_slide()


func fly() -> void:
	if Input.is_action_just_pressed("fly_upward") == true:
		velocity.y = -_speed
		animation_player.play("rotation_up")
	elif Input.is_action_just_pressed("fly_downward") == true:
		velocity.y = _speed
		animation_player.play("rotation_down")
		
	
