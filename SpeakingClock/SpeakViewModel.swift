//
//  SpeakViewModel.swift
//  SpeakingClock
//
//  Created by Eman on 9/20/23.
//
import AVFoundation
import Foundation


class SpeakViewModel {
    
    var finishSpeaking: Bool = false
    
    func speakTime(currentDate: Date) {
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        let minute = calendar.component(.minute, from: currentDate)
        let second = calendar.component(.second, from: currentDate)
        
        if (minute % 3 == 0 && (second == 1 || second == 15 || second == 30 || second == 45))  {
            // var _minute
            let speechText = "\(hour) \(minute)"
            print(speechText)
            
            let utterance = AVSpeechUtterance(string: speechText)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.rate = 0.5
            utterance.volume = 1.0
            let synthesize = AVSpeechSynthesizer()
            synthesize.speak(utterance)
        }
    }
    
    func availLanguage() {
        for voice in AVSpeechSynthesisVoice.speechVoices() {
          let language = NSLocale.init(localeIdentifier: Locale.current.languageCode!)
            print(language.displayName(forKey: NSLocale.Key.identifier, value: voice.language)?.description ?? "")
        }
    }
    
}
