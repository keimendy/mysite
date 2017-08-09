//
//  ViewController.swift
//  to do list
//
//  Created by hukazawa kei on 2017/08/06.
//  Copyright © 2017年 hukazawa kei. All rights reserved.
//




import UIKit


class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
  
    var titleList:[String] = []
    var dateList:[String] = []
    var categoryList:[String] = []
    
    @IBOutlet weak var todolistTable: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checked = tableView.cellForRow(at: indexPath) as? CustomTableViewCell
        var checkmarkType = UserDefaults.standard.object(forKey: "is_checkmark_gray") as? [Bool]
        if checkmarkType?[indexPath.row] == true {
            //画像をグリーンにする
            checked?.leftImageView.image = UIImage(named: "greencheckmark.jpg")
            //checkmark_type[indexPath.row]に"green"を保存する
            checkmarkType?[indexPath.row] = false
            UserDefaults.standard.set(checkmarkType, forKey: "is_checkmark_gray")
        } else {
            //画像をグレーにする
            checked?.leftImageView.image = UIImage(named: "graycheckmark.jpg")
            //checkmark_type[indexPath.row]に"gray"を保存する
            checkmarkType?[indexPath.row] = true
            UserDefaults.standard.set(checkmarkType, forKey: "is_checkmark_gray")
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if UserDefaults.standard.object(forKey: "todoTitle") == nil {
            return 0
        } else {
            let titleText = UserDefaults.standard.object(forKey: "todoTitle") as! [String]
            return (titleText.count)

        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "MyCell")
        let cell = self.todolistTable.dequeueReusableCell(withIdentifier: "todoCell") as! CustomTableViewCell
       
        let titleText = UserDefaults.standard.object(forKey: "todoTitle") as! [String]
        print(titleText)
        cell.todoLabel.text = titleText[indexPath.row]
        
        let dateText = UserDefaults.standard.object(forKey: "todoDate") as! [String]
        print(dateText)
        cell.dateLabel.text = dateText[indexPath.row]
        
        let categoryText = UserDefaults.standard.object(forKey: "todoCategory") as! [String]
        print(categoryText)
        cell.categoryLabel.text = categoryText[indexPath.row]
        
        let checkmarkType = UserDefaults.standard.object(forKey: "is_checkmark_gray") as! [Bool]
        
        if checkmarkType[indexPath.row] == true {
            cell.leftImageView.image = UIImage(named: "graycheckmark.jpg")
        } else {
            cell.leftImageView.image = UIImage(named: "greencheckmark.jpg")
        }
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            var titleText = UserDefaults.standard.object(forKey: "todoTitle") as! [String]
            print(titleText)
            titleText.remove(at: indexPath.row)
            UserDefaults.standard.set(titleText, forKey: "todoList")
            todolistTable.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        todolistTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todolistTable.delegate = self
        todolistTable.dataSource = self
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        todolistTable.register(nib, forCellReuseIdentifier: "todoCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
