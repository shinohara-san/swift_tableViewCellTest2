//
//  ViewController.swift
//  TableViewCellTest2
//
//  Created by Yuki Shinohara on 2020/06/06.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FieldTableViewCell.nib(), forCellReuseIdentifier: FieldTableViewCell.idenitfier)
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        FieldTableViewCell
        if indexPath.row > 5{
            let customCell = tableView.dequeueReusableCell(withIdentifier: FieldTableViewCell.idenitfier, for: indexPath) as! FieldTableViewCell
            return customCell
        }
        
        if indexPath.row > 2{
            let customCell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
            customCell.configure(with: "Custom Cell", imageName: "gear")
            return customCell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "I love you"
        
        //トグルスイッチ
        let mySwitch = UISwitch()
        mySwitch.addTarget(self, action: #selector(didChangeSwitch), for: .valueChanged)
        cell.accessoryView = mySwitch
        
        return cell
    }
    
    @objc func didChangeSwitch(_ sender: UISwitch){
        if sender.isOn{
            print("It is on")
        } else {
            print("It is off")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

