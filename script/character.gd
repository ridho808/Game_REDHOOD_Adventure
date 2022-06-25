extends KinematicBody2D
var move = 120;
var Velocity = Vector2.ZERO;
var Gravitasi = 10;
var jump = -250;
onready var animation = $Sprite

#funsi Move/Gerak karakter game
func _physics_process(_delta):
	animation.flip_h=false
	Velocity.y = Velocity.y + Gravitasi;
	if(Input.is_action_pressed("Kanan")):
		Velocity.x = move;
		animation.play("Run")
	if(Input.is_action_pressed("Kiri")):
		Velocity.x = -move;
		animation.flip_h=true
		animation.play("Run")
	if(Input.is_action_just_pressed("Atas") and is_on_floor()):
		Velocity.y = jump
	Velocity.x = lerp(Velocity.x,0,0.2);
	Velocity = move_and_slide(Velocity,Vector2.UP);
	UpdateAnimation();
	
func UpdateAnimation():
	if is_on_floor():
		#Move/Jalan
		if Velocity.x < (move * 0.5) and Velocity.x > (-move * 0.5):
			animation.play("Idle")
	else:
		if Velocity.y > 0:
			#Jatuh
			animation.play("Fall")
		else:
			#lompat
			animation.play("Jump")
	animation.flip_h= false
	if Velocity.x < 0 :
		animation.flip_h = true
