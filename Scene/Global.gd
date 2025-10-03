extends Node3D
var SPEED :float= 0
var High_Score :int= 0
var Save_path = "user://high_score.save"

func _ready() -> void:
	load_Score()

func _on_play_again_pressed() -> void:
	get_tree().reload_current_scene()

func Save():
	var file = FileAccess.open(Save_path,FileAccess.WRITE)
	file.store_var(High_Score)
func load_Score():
	if FileAccess.file_exists(Save_path):
		var file = FileAccess.open(Save_path,FileAccess.READ)
		High_Score = file.get_var(High_Score)
