//
//  TIMovieTVC.swift
//  TestInnova
//
//  Created by ROMAN RESENCHUK on 20.05.16.
//  Copyright © 2016 ROMAN RESENCHUK. All rights reserved.
//

import UIKit

class TIMovieTVC: UITableViewController {
    
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelShortCut: UILabel!
    @IBOutlet weak var labelIMDB: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelAgeRating: UILabel!
    @IBOutlet weak var labelTextDescription: UILabel!
    
    var youtubeMovieCode = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 43
        self.tableView.backgroundView = UIImageView.init(image: UIImage.init(named: "Flattened_Image"))
        self.fillMovieContent()
    }
    
    // MARK: - TableView
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: - Actions
    @IBAction func tapTrailer(sender: AnyObject) {
        // todo
        var url = NSURL(string:"youtube://\(youtubeMovieCode)")!
        if UIApplication.sharedApplication().canOpenURL(url)  {
            UIApplication.sharedApplication().openURL(url)
        } else {
            url = NSURL(string:"https://www.youtube.com/watch?v=\(youtubeMovieCode)")!
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func closePopup(segue: UIStoryboardSegue) {
        print("Popup closed")
    }

    func fillMovieContent() {
        let movieModel = TIMovieModel.createMock()
        self.youtubeMovieCode = movieModel.trailerYoutubeCode!
        imageViewPoster.image = UIImage.init(named: movieModel.imageName!)
        labelName.text = movieModel.name
        labelShortCut.text = movieModel.shortcut
        labelIMDB.text = movieModel.imdb!.stringValue
        labelRating.text = movieModel.rating!.stringValue
        labelAgeRating.text = movieModel.ageRating!.stringValue + "+"
        labelTextDescription.text = movieModel.textDescription
    }
}
