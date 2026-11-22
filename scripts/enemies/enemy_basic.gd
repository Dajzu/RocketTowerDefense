extends CharacterBody2D

var health : float = 5
var direction : Vector2 = Vector2.LEFT
var move_speed : float = 0.0


func _physics_process(_delta: float) -> void:
	velocity = direction * move_speed
	move_and_slide()

func take_damage(amount : float) -> void:
	health -= amount
	if health <= 0:
		queue_free()
	
