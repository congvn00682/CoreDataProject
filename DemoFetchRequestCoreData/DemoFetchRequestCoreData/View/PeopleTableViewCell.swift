//
//  PersonTableViewCell.swift
//  DemoFetchRequestCoreData
//
//  Created by Vu Ngoc Cong on 5/4/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
