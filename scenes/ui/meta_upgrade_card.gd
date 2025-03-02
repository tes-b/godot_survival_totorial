extends PanelContainer


@onready var name_label: Label = $%NameLabel
@onready var description_label:Label = $%DescriptionLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hover_animation_player: AnimationPlayer = $HoverAnimationPlayer



func _ready() -> void:
	gui_input.connect(on_gui_input)


func select_card():
	animation_player.play("selected")
	

func set_meta_upgrade(upgrade: MetaUpgrade):
	name_label.text = upgrade.name
	description_label.text = upgrade.description
	
func on_gui_input(event:InputEvent):
	
	if event.is_action_pressed("left_click"):
		select_card()	
