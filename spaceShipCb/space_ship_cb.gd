extends CharacterBody2D


@onready var ship_sprite = $ShipSprite
@onready var animation_player = $ShipSprite/AnimationPlayer
var Bullet = preload("res://missile/missile.tscn")
signal shoot(bullet, direction, location)


var _speed: float = 250.0

# Called when the node enters the scene tree for the first time.
func _ready():
	shoot.connect(_on_player_shoot)
	animation_player.play("glow_animation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	

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
		

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			shoot.emit(Bullet, rotation, position)
			
			
func _on_player_shoot(Bullet, direction, location):
	var spawned_bullet = Bullet.instantiate()
	get_parent().add_child(spawned_bullet)
	spawned_bullet.position = Vector2(position.x+ 30, position.y)
	spawned_bullet.rotation = direction
	
	
	
	

	


		
	
