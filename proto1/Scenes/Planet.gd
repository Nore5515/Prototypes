extends Spatial


var spinSpeed = 0.15

# frames per letter
var letterDelay
var letterDelayMax = 5

# frames per line
var lineDelay
var lineDelayMax = 20

var stuff = "21XX\nSERIA IV\nCLASS C GAS GIANT\nHIGH ARGON COUNT"


func _ready():
	letterDelay = letterDelayMax
	lineDelay = lineDelayMax


func _process(delta):
	$sphere.rotate(Vector3(0,1,0), spinSpeed * delta)
	
	
	if stuff.length() > 0:
		
		if letterDelay > 0:
			letterDelay -= 1
		else:
			if stuff.begins_with("\n"):
				
				if lineDelay > 0:
					lineDelay -= 1
				else:
					lineDelay = lineDelayMax
					letterDelay = letterDelayMax
					$CanvasLayer/planetOpenTerran.text += stuff.substr(0,2)
					stuff = stuff.substr(2)
					$textSound.stop()
					$textSound.play()
	
			else:
				$CanvasLayer/planetOpenTerran.text += stuff.substr(0,1)
				stuff = stuff.substr(1)
				letterDelay = letterDelayMax
				$textSound.stop()
				$textSound.play()
