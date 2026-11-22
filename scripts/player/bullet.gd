extends Area2D

#Variables
var speed : float = 200.0
var direction : Vector2 = Vector2.ZERO
var lifetime : float = 5.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	lifetime -= delta
	if lifetime <= 0:
		queue_free()
