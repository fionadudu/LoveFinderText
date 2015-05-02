//
//  ViewController.swift
//  LoveFinderText
//
//  Created by babykang on 15/4/6.
//  Copyright (c) 2015年 Fiona. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var name: UITextField!
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var birth: UIDatePicker!
    @IBOutlet var heightNumber: UISlider!
    @IBOutlet var height: UILabel!
    @IBOutlet var hasPropert: UISwitch!
    @IBOutlet var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func heightChange(sender: AnyObject) {
        var slider = sender as UISlider
        var i = Int(slider.value)
        height.text = "\(i)cm"
    }
    
    @IBAction func okTapped(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex == 0 ? "男":"女"
        let propertText = hasPropert.on ? "有房":"没房"
        //get the age
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let components = gregorian?.components(NSCalendarUnit.YearCalendarUnit, fromDate:birth.date, toDate: now, options: NSCalendarOptions(0))
        let age = components?.year
        
        let birthday = birth.date
        
        
        result.text = "姓名\(name.text),性别\(genderText),身高\(height.text!),生日\(birthday), 年龄\(age!),房产\(propertText),"
        println("姓名\(name.text),性别\(genderText),身高\(height.text!),生日\(birthday), 年龄\(age!),房产\(propertText),")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

