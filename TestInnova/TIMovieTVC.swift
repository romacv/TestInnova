//
//  TIMovieTVC.swift
//  TestInnova
//
//  Created by ROMAN RESENCHUK on 20.05.16.
//  Copyright © 2016 ROMAN RESENCHUK. All rights reserved.
//

import UIKit

class TIMovieTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 2 // todo
        self.tableView.backgroundView = UIImageView.init(image: UIImage.init(named: "Flattened_Image"))
    }

    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    @IBAction func tapTrailer(sender: AnyObject) {
        // todo
        let youtubeMovieCode = "NftSKKqZE0M" as String
        var url = NSURL(string:"youtube://\(youtubeMovieCode)")!
        if UIApplication.sharedApplication().canOpenURL(url)  {
            UIApplication.sharedApplication().openURL(url)
        } else {
            url = NSURL(string:"https://www.youtube.com/watch?v=\(youtubeMovieCode)")!
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func closePopup(segue: UIStoryboardSegue) {
        
    }
    // MARK: - Navigation

}
