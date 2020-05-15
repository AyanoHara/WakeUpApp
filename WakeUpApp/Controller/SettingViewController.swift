//
//  SettingViewController.swift
//  WakeUpApp
//
//  Created by AYANO HARA on 2020/05/09.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var sleepTimePicker: UIDatePicker!
    @IBOutlet weak var settingButton: UIButton!
    
    let alarm = Alarm()
    
    var datePicker:UIDatePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingButton.layer.cornerRadius = 20.0
        //UIDatePickerを.timeモードにする
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.time
        //現在の時間をDatePickerに表示
        sleepTimePicker.setDate(Date(), animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if alarm.sleepTimer != nil{
            alarm.stopTimer()
        }
    }
    
    @IBAction func settingButtonAction(_ sender: UIButton) {
        alarm.selectedWakeUpTime = sleepTimePicker.date
        alarm.runTimer()
        //        let formatter = DateFormatter()
        //        formatter.dateFormat = "hh:mm"
        let wakeUpVC = self.storyboard?.instantiateViewController(withIdentifier: "setTime") as! WakeUpViewController
        
        wakeUpVC.setTimeLabel.text = self.format(date: datePicker.date)
//        wakeUpVC.setTimeLabel.text = "\(formatter.string(from: datePicker.date))"
        
        
        self.navigationController?.pushViewController(wakeUpVC, animated: true)
    }
    
    func format (date:Date)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        let setTimeString = formatter.string(from: date)
        return setTimeString
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
