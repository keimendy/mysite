//
//  AddToDoViewController.swift
//  to do list
//
//  Created by hukazawa kei on 2017/08/06.
//  Copyright © 2017年 hukazawa kei. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController,UITableViewDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var itemText1: UITextField!
    @IBOutlet weak var itemText2: UITextField!
    @IBOutlet weak var itemText3: UITextField!
    
    @IBAction func addItem(_ sender: Any) {
        var titleTextList = UserDefaults.standard.object(forKey: "todoTitle") as? [String]
        if titleTextList == nil {
            UserDefaults.standard.set([itemText1.text], forKey: "todoTitle")
        } else {
            titleTextList?.append(itemText1.text!)
            UserDefaults.standard.set(titleTextList, forKey: "todoTitle")
        }
        
        var dateTextList = UserDefaults.standard.object(forKey: "todoDate") as? [String]
        if dateTextList == nil {
            UserDefaults.standard.set([itemText2.text], forKey: "todoDate")
        } else {
            dateTextList?.append(itemText2.text!)
            UserDefaults.standard.set(dateTextList, forKey: "todoDate")
        }
        
        var categoryTextList = UserDefaults.standard.object(forKey: "todoCategory") as? [String]
        if categoryTextList == nil {
            UserDefaults.standard.set([itemText3.text], forKey: "todoCategory")
        } else {
            categoryTextList?.append(itemText3.text!)
            UserDefaults.standard.set(categoryTextList, forKey: "todoCategory")
        }
        
        var checkmarkTypeList = UserDefaults.standard.object(forKey: "checkmark_type") as? [Bool]
        if checkmarkTypeList == nil {
            UserDefaults.standard.set([true],forKey: "is_checkmark_gray")
        } else {
            checkmarkTypeList?.append(true)
            UserDefaults.standard.set(checkmarkTypeList,forKey: "is_checkmark_gray")
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemText1.delegate = self
        self.itemText2.delegate = self
        self.itemText3.delegate = self
    }
    
    // Do any additional setup after loading the view.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        itemText1.resignFirstResponder()
        itemText2.resignFirstResponder()
        itemText3.resignFirstResponder()
        return true
    }
    
    override func  touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
