//
//  Alarm.swift
//  WakeUpApp
//
//  Created by AYANO HARA on 2020/05/09.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class Alarm:UIViewController{
    
    var selectedWakeUpTime:Date?
    var audioPlayer:AVAudioPlayer!
    var sleepTimer:Timer?
    var seconds = 0
    var soundFile = SoundFile()
//    var datePicker:UIDatePicker = UIDatePicker()
    
    //アラーム/タイマーを開始
    func runTimer(){
        //calculateIntervalにユーザーが入力した日付を渡す、返り値をsecondsに代入
        seconds = calculateInterval(userAwakeTime: selectedWakeUpTime!)
        
        if sleepTimer == nil{
            //タイマーをセット、１秒毎にupdateCurrenrTimeを呼ぶ
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    //１秒毎にsleepTimerに呼ばれる
    @objc private func updateTimer(){
        if seconds != 0{
            //secondsから-1する
            seconds -= 1
        }else{
            //タイマーを止める
            sleepTimer?.invalidate()
            //タイマーにnilを代入
            sleepTimer = nil
            //TODO:音を鳴らす
        }
        
        if seconds != 0{
            seconds -= 1
            print(seconds)
            
        }else{
            sleepTimer?.invalidate()
            sleepTimer = nil
            let secondFilePath = Bundle.main.path(forResource: "alarm", ofType: "mp3")!
            let sound:URL = URL(fileURLWithPath: secondFilePath)
            do {
                //AVAudioPlayerを作成
                audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint: nil)
                soundFile.playSound(fileName: "alarm", extensionName: "mp3")
                // バックグラウンドでもオーディオ再生可能にする
                try AVAudioSession.sharedInstance().setCategory(.playback,mode: .default,options: [])
                try AVAudioSession.sharedInstance().setActive(true)
            }catch{
                print("Cannot load file")
            }
            //再生
            audioPlayer.play()
            print(audioPlayer.isPlaying)
        }
    }
    
    func stopTimer(){
        if sleepTimer != nil{
            sleepTimer?.invalidate()
            sleepTimer = nil
        }
    }
    
    private func calculateInterval(userAwakeTime:Date)-> Int{
        var interval = Int(userAwakeTime.timeIntervalSinceNow)
        if interval < 0{
            interval = 86400 - (0 - interval)
        }
        let calendar = Calendar.current
        let seconds = calendar.component(.second, from: userAwakeTime)
        return interval - seconds
    }
//
//    func showWakeUpTime(_: String){
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "hh:mm"
//
//
//    }
    
  
}

