//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Büşra Özkan on 3.12.2022.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage

class FeedCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userimageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var documentIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func likeButton(_ sender: Any) {
        let firestoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!){
            let likeStore = ["likes" : likeCount + 1] as [String : Any]
            
            firestoreDatabase.collection("Posts").document(documentIDLabel.text!).setData(likeStore, merge: true)
        }
        
        
        
        
    }
    
}
