//
//  MyTableViewCell.swift
//  PoqCategoryBrowser
//
//  Created by Zoran Plesko on 14/12/14.
//  Copyright (c) 2014 Masinerija. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myTextLabel: UILabel?
    @IBOutlet weak var containerView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
