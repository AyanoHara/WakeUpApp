//
//  SoundFile.swift
//  WakeUpApp
//
//  Created by AYANO HARA on 2020/05/09.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile{
    
    var player:AVAudioPlayer?
    
    func playSound(fileName:String,extensionName:String){
        //再生する
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        
        do {
        //効果音を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        } catch {
            print("エラーです！")
        }
    }
}

