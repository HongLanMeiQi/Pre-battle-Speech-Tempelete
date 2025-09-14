-- Register the behaviour
behaviour("PrebattleSpeech")

function PrebattleSpeech:Start()
	-- Run when behaviour is created
	self.volume = self.script.mutator.GetConfigurationRange("volume")
	self.DoExchangeTeam = self.script.mutator.GetConfigurationBool("DoExchangeTeam")
	self.SpeechMap = self.script.mutator.GetConfigurationDropdown("SpeechMap")
	self.targets.AudioSource.SetOutputAudioMixer(AudioMixer.Master)
	self.targets.AudioSource.volume = self.volume / 100

	if not self.DoExchangeTeam then
		WaitForSeconds(3)
		if Player.actor.team == Team.Blue then
			self.targets.EagleSpeechBank.PlaySoundBank(self.SpeechMap)
			print("Eagle Speech Played")
		end
		if Player.actor.team == Team.Red then
			self.targets.RavenSpeechBank.PlaySoundBank(self.SpeechMap)
			print("Raven Speech Played")
		end
	end
	if self.DoExchangeTeam then
		WaitForSeconds(3)
		if Player.actor.team == Team.Blue then
			self.targets.RavenSpeechBank.PlaySoundBank(self.SpeechMap)
			print("Raven Speech Played")
		end
		if Player.actor.team == Team.Red then
			self.targets.EagleSpeechBank.PlaySoundBank(self.SpeechMap)
			print("Eagle Speech Played")
		end
	end
end

function PrebattleSpeech:Update()
	-- Run every frame
	
end
