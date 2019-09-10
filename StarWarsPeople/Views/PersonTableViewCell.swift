//
//  PersonTableViewCell.swift
//  StarWarsPeople
//
//  Created by Anan Sadiya on 08/09/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    func setUp(name: String, id: Int) {
        idLabel.text = String(id)
        nameLabel.text = name   
    }
}
