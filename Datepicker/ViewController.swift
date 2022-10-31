//
//  ViewController.swift
//  Datepicker
//
//  Created by Yonghun Roh on 2022/10/31.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        // 사용자가 날짜를 선택하면 액션함수인 changeDatePicker가 호출되면서 sender라는 UIDatePicker 자료형의 인수가 전달된다. 이 sender를 datePickerView 상수에 저장한다.
        
        let formatter = DateFormatter()
        // 날짜를 출력하기 위해 DateFormatter라는 클래스 상수 formatter를 선언.
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        // 상수 formatter에 dateFormat 속성을 설정.
        
        lblPickerTime.text = "선택시간:" + formatter.string(from: datePickerView.date)
        // 사용자가 데이트 피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 속성대로 문자열로 반환한다. "선택시간:" 이라는 문자열 위에서 문자열로 변환한 date 값을 추가하여 lblPickerTime의 text에 넣는다.
        
        
    }
    @objc func updateTime() {
//        lblCurrentTime.text = String(count)
//        count = count + 1
        
        let date = NSDate()
        
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formater.string(from: date as Date)
    }
    
}

