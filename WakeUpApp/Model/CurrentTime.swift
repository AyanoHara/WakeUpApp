//
//  CurrentTime.swift
//  WakeUpApp
//
//  Created by AYANO HARA on 2020/05/09.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import Foundation

class CurrentTime{
    
    var timer: Timer?
    var currentTime: String?
    var df = DateFormatter()
    weak var delegate: WakeUpViewController?
    
    init(){
        
        if timer == nil{
            //タイマーをセット、１秒毎にupdateCurrentTimeを呼ぶ
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func updateCurrentTime(){
        //フォーマットの指定
        df.dateFormat = "HH:mm"
        //時刻をUNIXから端末のタイムゾーンにする
        df.timeZone = TimeZone.current
        //現在の時間のフォーマットに従って文字列化を行う
        let timezoneData = df.string(from: Date())
        currentTime = timezoneData
        delegate?.updateTime(currentTime!)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}



