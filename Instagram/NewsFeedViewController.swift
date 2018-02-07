//
//  NewsFeedViewController.swift
//  Instagram
//
//  Created by Dhriti Chawla on 2/3/18.
//  Copyright © 2018 Dhriti Chawla. All rights reserved.
//

import UIKit
import Parse
import ParseUI 

class NewsFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    var myPhotos: [PFObject]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NewsFeedViewController.didPullToRefresh(_:)), for: .valueChanged)
        
        tableView.insertSubview(refreshControl, at: 0)
       
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        self.viewDidAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "Instagram_logo.svg")
        imageView.image = image
    
        navigationItem.titleView = imageView
    }
    
    override func viewWillAppear(_ animated: Bool) {

        let query = PFQuery(className:"Post")
        query.order(byDescending: "createdAt")
        
        query.includeKey("author")
        query.limit = 20
        print ("YOYOOYOYO")
        
        query.findObjectsInBackground { (myPhotos: [PFObject]?, error: Error?) in
            if let myPhotos = myPhotos {
                self.myPhotos = myPhotos
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
                print(myPhotos)
                
                
                
            } else {
                print(error!.localizedDescription)
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (myPhotos?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let photo = myPhotos![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.instagramPost = photo
        
        return cell
    }
    
    @IBAction func logOutUser(_ sender: Any) {
        
        PFUser.logOut()
        let currentUser = PFUser.current()
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        
        if (segue.identifier == "goToSegue"){
            let cell = sender as! PhotoCell
        
            // print ("-=0=-0-==0-=-=-=--0=0-=0-=")
       
            var indexPath = tableView.indexPath(for: cell)!
            print(indexPath.row)
            let tapViewController = segue.destination as! TapViewController
            var post = myPhotos?[indexPath.row]
            print(post)
            //tapViewController.instagramPost = post!
            // print("hellohyothyothtohytnhy****************")
            // print(myPhotos?[(ind.row)!])
            tapViewController.instagramPost = post!

        }

        
    }
    
}
