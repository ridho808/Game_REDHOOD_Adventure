extends Node2D


#Fallzone
func _on_FallZone_body_entered(body):
	if body.name == "Character":
		get_tree().change_scene("res://Map/level-1.tscn")
