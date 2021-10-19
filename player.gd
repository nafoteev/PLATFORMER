extends KinematicBody2D

var vert_move=0

var speed = 15

var jumpForce = 500
var gravity = 700

var vel = Vector2()

onready var imagePlayer = get_node("player")

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		vel.x -= speed
	if  Input.is_action_pressed("right"):
		vel.x += speed
		
	vert_move =- 300 if Input.is_action_pressed("up")else vert_move+9.6*delta
		
	vel = move_and_slide(vel+Vector2(0,vert_move), Vector2.UP)
	vert_move = vel.y
	
	if vel.x < 0:
		imagePlayer.flip_h = false
	if vel.x > 0:
		imagePlayer.flip_h = true
