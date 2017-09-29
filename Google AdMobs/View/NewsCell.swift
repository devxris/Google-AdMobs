//
//  NewsCell.swift
//  Google AdMobs
//
//  Created by Chris Huang on 29/09/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
	
	@IBOutlet var postImageView:UIImageView!
	@IBOutlet var postTitle:UILabel!
	@IBOutlet var postAuthor:UILabel!
	@IBOutlet var authorImageView:UIImageView! {
		didSet {
			authorImageView.layer.cornerRadius = authorImageView.frame.width / 2
			authorImageView.layer.masksToBounds = true
		}
	}
}
