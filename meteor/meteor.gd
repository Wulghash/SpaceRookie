extends Area2D

const SCROLL_SPEED: float = 100.0
@onready var texture_1 = $Texture1

# Called when the node enters the scene tree for the first time.
func _ready():
	generateRandomMeteorProperties()


func generateRandomMeteorProperties() -> void:
	var randomGenerator = RandomNumberGenerator.new()
	var randomNumber: int = randomGenerator.randi_range(0, 3)
	if randomNumber == 0:
		texture_1.texture =  preload("res://assets/Meteors/spaceMeteors_001.png")
		scale = scale * 1.2
	if randomNumber == 1:
		texture_1.texture =  preload("res://assets/Meteors/spaceMeteors_002.png")
		scale = scale * 1.3
	if randomNumber == 2:
		texture_1.texture =  preload("res://assets/Meteors/spaceMeteors_003.png")
		scale = scale * 1.4
	if randomNumber == 3:
		texture_1.texture =  preload("res://assets/Meteors/spaceMeteors_001.png")
		scale = scale * 1.7

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SCROLL_SPEED * delta


func _on_visible_on_screen_notifier():
	queue_free()
