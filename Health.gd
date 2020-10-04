extends Node

signal max_changed(new_max)
signal changed(new_amount)
signal depleted

export(int) var max_amount = 10
onready var current_health = max_amount

function set_max(new_max):
	max_amount = max(1, new_max) #prevents negative hp
	emit_signal("max_changed", max_amount)
	
	
	
func set_current(new_value):
	current_health = clamp(current_health, 0, max_amount)
	emit_signal("changed", current_health)
	
	if current_health =<0:
		emit_signal("depleted")
