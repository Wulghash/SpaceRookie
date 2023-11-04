extends Area2D


const SCROLL_SPEED: float = 500.0

 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position += transform.x * SCROLL_SPEED * delta
	
func _physics_process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
