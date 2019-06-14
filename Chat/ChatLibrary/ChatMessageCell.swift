//
//  ChatMessageCell.swift
//  Chat
//
//  Created by Nirav on 14/06/19.
//  Copyright © 2019 Nirav. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    @IBOutlet var messageLabel : UILabel!
    @IBOutlet var timeLabel : UILabel!
    @IBOutlet var bubbleBackgroundView : UIView!
    
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }    
}
