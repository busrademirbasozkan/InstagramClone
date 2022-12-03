//
//  FeedViewController.swift
//  InstagramClone
//
//  Created by Büşra Özkan on 2.12.2022.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage


class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var emailArray = [String]()
    var commentArray = [String]()
    var likeArray = [Int]()
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromFirebase()
        
    }
    
    func getDataFromFirebase(){
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Posts").addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                if snapshot?.isEmpty != true {
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        
                        if let postedBy = document.get("postedBy") as? String{
                            self.emailArray.append(postedBy)
                        }
                        if let postComment = document.get("postComment") as? String{
                            self.commentArray.append(postComment)
                        }
                        if let likes = document.get("likes") as? Int{
                            self.likeArray.append(likes)
                        }
                        if let imageUrl = document.get("imageUrl") as? UIImage{
                            self.imageArray.append(imageUrl)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.emailLabel.text = emailArray[indexPath.row]
        cell.commentLabel.text = commentArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.userimageView.image = UIImage(named: "select.png")
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }

}
