//
//  ZametkiTableViewCell.swift
//  Заметки
//
//  Created by dongr on 14.02.2022.
//

import UIKit

class ZametkiTableViewCell: UITableViewCell {

    
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func set(object: Zametki){
        self.nameLable.text = object.name
        self.descriptionLable.text = object.description
    }


}
