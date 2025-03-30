SuperDirt.stop

MIDIClient.init;

~midiOut = MIDIOut.newByName("Elektron Digitone", "Elektron Digitone");\

// substitute your own device here ie Syntakt or Digitone 2 etcetc

~midiOut = MIDIOut.newByName("Elektron Digitakt", "Elektron Digitakt");

//substitute with alternative name 
~dirt.soundLibrary.addMIDI(\dgtone, ~midiOut);
~dirt.soundLibrary.addMIDI(\dtakt, ~midiOut);



~midiOut.latency = 0.45;

