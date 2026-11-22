extends Area2D

#Variables
var speed : float = 200.0
var direction : Vector2 = Vector2.ZERO
var lifetime : float = 5.0
var acceleration : float = 150.0
var max_speed : float = 500.0
var damage : float = 1.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	
	lifetime -= delta #Time until disappear
	
	speed += acceleration * delta #Making speed continuously faster
	
	speed = min(speed, max_speed) #Speed cap
	

	if lifetime <= 0:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()
	
