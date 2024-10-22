//
//  NewsTableViewCell.swift
//  iosTom
//
//  Created by Hastomi Riduan Munthe on 22/10/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var news = [Post]()
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(post: Post) {
         userIdLabel.text = "\(post.userId)"
         idLabel.text = "\(post.id)"
         titleLabel.text = post.title
         bodyLabel.text = post.body
     }
    
}
