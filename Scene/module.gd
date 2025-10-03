extends Node3D
@onready var level = $"../"


func _process(delta: float) -> void:
	position.x -= Global.SPEED * delta
	if position.x < -7:
		level.spawn(position.x+(level.amount*level.offset))
		queue_free()
		
	
		
		
	
