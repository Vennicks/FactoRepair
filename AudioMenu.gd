extends AudioStreamPlayer


func _ready():
	self.play()


func _on_ButtonStart_pressed():
	self.stop()
