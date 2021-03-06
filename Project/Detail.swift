//
//  Detail.swift
//  Project
//
//  Created by student on 2018/2/4.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import Firebase

class Detail: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let profile:[[String]] = [["Female", "Male", "No comment"], ["<18", "18~25", "26~30", "31~35", "36~40", ">40"], ["學生", "管理財經", "行銷業務", "客服支援", "製造工程", "教育傳播", "其他"]]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return profile[0].count
        }
        if pickerView.tag == 1 {
            return profile[1].count
        }
        if pickerView.tag == 2 {
            return profile[2].count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return profile[0][row]
        }
        if pickerView.tag == 1 {
            return profile[1][row]
        }
        if pickerView.tag == 2 {
            return profile[2][row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            gender.text = profile[0][pickerView.selectedRow(inComponent: 0)]
        }
        if pickerView.tag == 1 {
            age.text = profile[1][pickerView.selectedRow(inComponent: 0)]
        }
        if pickerView.tag == 2 {
            education.text = profile[2][pickerView.selectedRow(inComponent: 0)]
        }
    }
    
    var emailCA:String!
    
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var education: UITextField!

    override func viewDidLoad() {
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        super.viewDidLoad()
        
        let pickGender = UIPickerView()
        let pickAge = UIPickerView()
        let pickEducation = UIPickerView()
        
        pickGender.delegate = self
        pickAge.delegate = self
        pickEducation.delegate = self
        
        pickGender.tag = 0
        pickAge.tag = 1
        pickEducation.tag = 2
                
        gender.inputView = pickGender
        age.inputView = pickAge
        education.inputView = pickEducation
        
        // Do any additional setup after loading the view.
    }
    
    func test() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    lazy var ref = Database.database().reference()
    
    @IBAction func disappear(_ sender: Any) {
//        let emailName:String = emailCA.components(separatedBy: "@")[0]
//        let emailTpye:String = emailCA.components(separatedBy: "@")[1].components(separatedBy: ".")[0]
//        if gender.text == "" {
//            gender.text = "Are you a UMA ???"
//        }
//        if age.text == "" {
//            age.text = "你失憶忘記自己的年齡了嗎 ???"
//        }
//        if education.text == "" {
//            education.text = "剛進幼稚園 ???"
//        }
//        let useProfile:[String] = [emailTpye, gender.text!, age.text!, education.text!]
//        self.ref.childByAutoId().setValue([emailName: useProfile])
//        self.ref.setValue([emailName: useProfile])
        self.dismiss(animated: true, completion: nil)
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "createVE") {
//            vc.title = "New Article"C.text = email
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
