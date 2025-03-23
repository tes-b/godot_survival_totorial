extends CanvasLayer

@onready var panel_container: PanelContainer = %PanelContainer


func _ready() -> void:
	panel_container.pivot_offset = panel_container.size / 2
	var tween = create_tween()
	tween.tween_property(panel_container, "scale",Vector2.ZERO, 0)
	tween.chain()
	tween.tween_property(panel_container, "scale", Vector2.ONE, .4)\
	.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	
	get_tree().paused = true
	%ContinueButton.pressed.connect(on_continue_button_pressed)
	%QuitButton.pressed.connect(on_quit_button_pressed)	
	
	
func play_jingle(defeat:bool = false):
	if defeat:
		$DefeatStreamPlayer2.play()
	else:
		$VictoryStreamPlayer.play()
	
	
func set_defeat():
	%TitleLabel.text = "Defeat"
	%DescriptionLabel.text = "You lost"
	play_jingle(true)
	
	
func on_continue_button_pressed():
	ScreenTransition.transition()
	await ScreenTransition.transitioned_halfway
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/meta_menu.tscn")
	
func on_quit_button_pressed():
	ScreenTransition.transition_to_scene("res://scenes/ui/main_menu.tscn")
	await ScreenTransition.transitioned_halfway
	get_tree().paused = false
