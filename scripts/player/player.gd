class_name Player extends CharacterBody2D

#Variables
var cardinal_direction : Vector2 = Vector2.RIGHT
var direction : Vector2 = Vector2.ZERO
var move_speed : float = 75.0

var bullet_scene = preload("res://scenes/player/bullet.tscn")

@onready var sprite : Sprite2D = $Sprite2D



func _process(_delta : float) -> void:
	SetDirection()
	if Input.is_action_just_pressed("Shoot"):
		Shoot()


#movement
func _physics_process(_delta : float) -> void:
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * move_speed
	move_and_slide()


#directions
func SetDirection() -> void:
	var new_dir : Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return

	if direction.x < 0:
		new_dir = Vector2.LEFT
	elif direction.x > 0:
		new_dir = Vector2.RIGHT
	

	cardinal_direction = new_dir
	sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1


#Shooting
func Shoot() -> void:
	var bullet_copy = bullet_scene.instantiate()
	get_parent().add_child(bullet_copy)
	bullet_copy.global_position = global_position
	bullet_copy.direction = cardinal_direction
