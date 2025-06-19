//
//  AnimeTableViewCell.swift
//  Anime-API
//
//  Created by iroid on 19/06/25.
//

import UIKit

class AnimeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleEng: UILabel!
    @IBOutlet weak var animeCoverimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
