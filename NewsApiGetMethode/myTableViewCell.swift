//
//  myTableViewCell.swift
//  NewsApiGetMethode
//
//  Created by Asaithambi on 01/09/2023.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var DescrptionLabel: UILabel!
    @IBOutlet weak var NewsImage: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
