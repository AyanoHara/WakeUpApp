//
//  WakeUpViewController.swift
//  WakeUpApp
//
//  Created by AYANO HARA on 2020/05/09.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit


class WakeUpViewController: UIViewController {
    //インスタンスを生成
    var currentTime = CurrentTime()
    var alarm = Alarm()
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var setTimeLabel: UILabel!
    @IBOutlet weak var stopTimeButton: UIButton!
    var datepicker:UIDatePicker = UIDatePicker()
    
    //    let dateString = stringFromDate(date: , format: "yyyy年MM月dd日 HH時mm分ss秒 Z")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTime.delegate = self
//        setTimeLabel.text = 
        stopTimeButton.layer.cornerRadius = 20.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func stopTimeAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateTime(_ time:String){
        timeLabel.text = time
    }
    
    //    class func stringFromDate(date: Date, format: String) -> String {
    //        let formatter: DateFormatter = DateFormatter()
    //        formatter.calendar = Calendar(identifier: .gregorian)
    //        formatter.dateFormat = format
    //        return formatter.string(from: date)
    //    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
