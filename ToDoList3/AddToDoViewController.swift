//
//  AddToDoViewController.swift
//  to do list
//
//  Created by hukazawa kei on 2017/08/06.
//  Copyright © 2017年 hukazawa kei. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController  {
    
    private var toolbar: UIToolbar!
    var todoItem = [String]()
    
    
    
    @IBOutlet weak var itemText1: UITextField!
    @IBOutlet weak var itemText2: UITextField!
    @IBOutlet weak var itemText3: UITextField!
    
    
    
    @IBAction func addItem(_ sender: Any) {

        UserDefaults.standard.set(itemText1.text, forKey: "todoList")
        let itemText = UserDefaults.standard.object(forKey: "todoList") as! String
        print(itemText)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // Do any additional setup after loading the view.
    
    
    
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
    
    
    
  
    
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        itemText1.resignFirstResponder()
        itemText2.resignFirstResponder()
        itemText3.resignFirstResponder()
        return true
    }
}













