//
//  PhotosViewController.swift
//  Instagram
//
//  Created by Dhriti Chawla on 2/3/18.
//  Copyright © 2018 Dhriti Chawla. All rights reserved.
//

import UIKit
import Parse

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var uploadImage: UIImageView!
    @IBOutlet weak var caption: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    override func viewDidAppear(_ animated: Bool) {
        
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        // 4
        let image = UIImage(named: "Instagram_logo.svg")
        imageView.image = image
        
        // 5
        navigationItem.titleView = imageView
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        uploadImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadNewPhoto(_ sender: Any) {
        let myPicker = UIImagePickerController()
        myPicker.delegate = self
        myPicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPicker, animated: true, completion: nil)
    }
    
    
    @IBAction func logOutUser(_ sender: Any) {
        PFUser.logOut()
        let currentUser = PFUser.current()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pressPostButton(_ sender: Any) {
        
        let image = uploadImage.image
        let cap = caption.text
        Post.postUserImage(image: image, withCaption: cap) { (bool, error) in
            if let error = error {
                print("Error")
                print(error.localizedDescription)
            }else{
               print("No Error")
                
            }
            
            
        }
        
//        let instaPost = PFObject(className: "Post")
//        instaPost["username"] = PFUser.current()!.username
//        instaPost["image"] = uploadImage
//        instaPost["caption"] = caption.text ?? ""
//
//        instaPost.saveInBackground { (success, error) in
//            if success {
//                print("Your picture was saved!")
//
//            } else if let error = error {
//                print("Problem saving message: \(error.localizedDescription)")
//            }
//        }
    }
    
    
   
    

}
