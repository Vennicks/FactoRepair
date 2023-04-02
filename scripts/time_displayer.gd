extends RichTextLabel


var s = GLOBAL.s
var m = GLOBAL.m
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	set_text(str(s))
	pass


func _on_Timer_timeout():
	s += 1
	pass # Replace with function body.
