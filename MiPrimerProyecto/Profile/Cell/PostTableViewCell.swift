//
//  PostTableViewCell.swift
//  MiPrimerProyecto
//
//  Created by Kevinho Morales on 1/2/25.
//

import UIKit

final class PostTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    static public let CELL_ID = "POST_CELL_ID"
    
    func setUpCell(socialMediaNetwork: String) {
        titleLabel.text = socialMediaNetwork
    }
    
}
