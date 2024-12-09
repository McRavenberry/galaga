extends Area2D

var start_pos: Vector2 = Vector2.ZERO
var speed: int = 0

@onready var screensize = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start(pos):
	speed = 0
	position = Vector2(pos.x, -pos.y)
	start_pos = pos
	await get_tree().create_timer(randf_range(0.25, 0.55)).timeout
	var tween = create_tween().set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "position:y", start_pos.y, 1.4)
	await tween.finished
	$MoveTimer.wait_time = randf_range(5,20)
	$MoveTimer.start()
	$ShootTimer.wait_time = randf_range(4,20)
	$ShootTimer.start()

func _on_move_timer_timeout() -> void:
	pass # Replace with function body.


func _on_shoot_timer_timeout() -> void:
	pass # Replace with function body.
