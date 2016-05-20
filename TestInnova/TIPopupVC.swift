//
//  TIPopupVC.swift
//  TestInnova
//
//  Created by ROMAN RESENCHUK on 20.05.16.
//  Copyright © 2016 ROMAN RESENCHUK. All rights reserved.
//

import UIKit

class TIPopupVC: UIViewController {
    
    @IBOutlet weak var btnForever: TIBorderButton!
    @IBOutlet weak var btnForRent: TIBorderButton!
    @IBOutlet weak var pursacheButton: TIBorderButton!
    @IBOutlet weak var activityMerchant: UIActivityIndicatorView!
    @IBOutlet weak var collectionViewPrices: UICollectionView!
    
    let identifier = "PricesCollViewCell"
    var pricesArray: NSArray = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    // MARK: - Actions
    func initUI() {
        self.pursacheButton.applyBorders()
        self.tapPurchaseType(self.btnForever)
    }
    
    @IBAction func tapLeftScroll(sender: AnyObject) {
        let visibleItems: NSArray = self.collectionViewPrices.indexPathsForVisibleItems()
        let currentItem: NSIndexPath = visibleItems.objectAtIndex(0) as! NSIndexPath
        let prevItem: NSIndexPath = NSIndexPath(forRow: currentItem.item - 1, inSection: 0)
        if (prevItem.item >= 0) {
            self.collectionViewPrices.scrollToItemAtIndexPath(prevItem, atScrollPosition: .CenteredHorizontally, animated: true)
        }
    }
    @IBAction func tapRightScroll(sender: AnyObject) {
        let visibleItems: NSArray = self.collectionViewPrices.indexPathsForVisibleItems()
        let currentItem: NSIndexPath = visibleItems.objectAtIndex(0) as! NSIndexPath
        let nextItem: NSIndexPath = NSIndexPath(forRow: currentItem.item + 1, inSection: 0)
        if (nextItem.item < self.pricesArray.count) {
            self.collectionViewPrices.scrollToItemAtIndexPath(nextItem, atScrollPosition: .CenteredHorizontally, animated: true)
        }
    }
    
    @IBAction func tapStartPurchase(sender: AnyObject) {
        self.activityMerchant.startAnimating();
        self.pursacheButton.setTitle("", forState: .Normal)
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC))) // todo
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            
            self.pursacheButton.setTitle("Купить".uppercaseString, forState: .Normal)
            self.activityMerchant.stopAnimating();
            
            self.performSegueWithIdentifier("ShowSuccessPursacheSegue", sender: nil)
        }
    }
    
    @IBAction func tapPurchaseType(sender: AnyObject) {
        
        self.btnForever.removeBorders()
        self.btnForRent.removeBorders()
        let currentBtn = sender as! TIBorderButton
        currentBtn.applyBorders()
        
        if (currentBtn == self.btnForever) {
            self.pricesArray = [["price": "299 $", "type": "DVD качество"],
                                ["price": "399 $", "type": "FullHD качество"],
                                ["price": "429 $", "type": "4k качество"]]
        }
        else if (currentBtn == self.btnForRent) {
            self.pricesArray = [["price": "19 $", "type": "DVD качество"],
                                ["price": "29 $", "type": "FullHD качество"]]
        }
        self.collectionViewPrices.reloadData()
    }
    
    // MARK: - CollectionView
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pricesArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! TIPricesCollViewCell
        let type = self.pricesArray[indexPath.row].objectForKey("type") as? String
        cell.labelType.text = type?.uppercaseString
        cell.labelPrice.text = self.pricesArray[indexPath.row].objectForKey("price") as? String
        
        return cell
    }
    
    
}
