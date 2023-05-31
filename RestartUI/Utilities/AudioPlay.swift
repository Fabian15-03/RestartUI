//
//  AudioPlay.swift
//  RestartUI
//
//  Created by Fabian Gonzales  on 30/05/23.
//

import Foundation
import AVFoundation

var AudioPlayer : AVAudioPlayer?

func playSound(sound: String , type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            AudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            AudioPlayer?.play()
        } catch {
            print("No se encontro el audio.")
        }
    }
}
