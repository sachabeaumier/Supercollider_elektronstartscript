(
SynthDef(\fm, {
	|freq=200, atk=0.01, decay=0.3, sustain=0.4, rel=0.1
	carratio=1,modratio=1, modindex=1,
	amp=0.2, gate=1, outBus=0|
	var env = EnvGen.kr(Env.adsr(atk, decay, sustain, rel), gate, doneAction:2);
	var mod = SinOsc.ar(freq * modratio);
	var car = SinOsc.ar(freq * carratio + (1 + (mod *modindex)), 0) * amp * env;

	Out.ar(0, car ! 2);
}).add;
)

// how to start the synth with inital values
~fmSynth = Synth.new(\fm, [\freq, 220]);
// how to alter a synth in real time
~fmSynth.set(\freq, 260);
// how to liberate the synth
~fmSynth.free;

/* design notes 
input args are mostly self explainatory: 
 freq controls pitch of carrier and modulator wave
 modratio scales the freq of modulator wave 
 carratio scalese the freq of carrier wave 
 (useful for creating different ratios of FM - carrier:modulator - ex: 1:3, 3:5, 1:9, etc )
 atk, delay, sustain, rel are enelope controls for a typical ADSR envelope 
 modindex controls the intensity of the modulation, bigger values for modindex create more numerous sidebands 
 amp is the amplitude (volume) 
 
 on the line with Out.ar(0, car ! 2) 
   car ! 2 splits the signal in two in order to be stereo 
   
   */
