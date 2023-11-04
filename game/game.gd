extends Node2D

@export  var meteor_scene: PackedScene
@onready var meteor_holder = $MeteorHolder

@onready var upper_marker = $UpperMarker
@onready var lower_marker = $LowerMarker
@onready var meteor_spawn_timer = $MeteorSpawnTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_meteors()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
func _physics_process(delta):
	pass
	
func _on_meteor_spawn_timer_timeout():
	spawn_meteors()
		
func spawn_meteors() -> void:
	print("sdfsdf")
	var y_pos = randf_range(upper_marker.position.y, lower_marker.position.y)
	var new_meteor = meteor_scene.instantiate()
	
	new_meteor.position = Vector2(lower_marker.position.x - 1000, y_pos-300)
	print(new_meteor.position)
	meteor_holder.add_child(new_meteor)


