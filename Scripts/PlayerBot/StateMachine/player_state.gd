extends Node
class_name PlayerState

var start_time: int
var player
var state_machine: PlayerStateMachine
var animation: AnimationPlayer


func enter():
	start_time = Time.get_ticks_msec()
	
func exit():
	pass
	
func do_checks():
	pass
	
func physics_update(_delta):
	do_checks()

func handle_input(_delta):
	pass
