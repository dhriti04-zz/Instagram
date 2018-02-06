//
//  PhotoCell.swift
//  Instagram
//
//  Created by Dhriti Chawla on 2/3/18.
//  Copyright © 2018 Dhriti Chawla. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var uploadImage: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    
    var instagramPost: PFObject! {
        didSet {
           
            self.captionLabel.text = instagramPost["caption"] as? String
            self.userLabel.text = PFUser.current()!.username
            self.uploadImage.file = instagramPost["image"] as? PFFile
            self.uploadImage.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
