//
//  FieldTableViewCell.swift
//  TableViewCellTest2
//
//  Created by Yuki Shinohara on 2020/06/06.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import UIKit

class FieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    static var idenitfier = "FieldTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "FieldTableViewCell", bundle: nil)
    }

    @IBOutlet var field: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        field.placeholder = "Enter here"
        field.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\(textField.text ?? "")")
        return true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
