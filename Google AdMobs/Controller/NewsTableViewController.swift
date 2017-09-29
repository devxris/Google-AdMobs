//
//  NewsTableViewController.swift
//  Google AdMobs
//
//  Created by Chris Huang on 29/09/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit
import GoogleMobileAds

class NewsTableViewController: UITableViewController {
	
	lazy var adBannerView: GADBannerView = {
		let banner = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
		banner.adUnitID = "ca-app-pub-9021945860330642/3306844640"
		banner.delegate = self
		banner.rootViewController = self
		return banner
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always
		
		// start to request ads
		adBannerView.load(GADRequest())
	}
	
	// MARK: UITableViewDataSource and UITableViewDelegate
	override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 4 }
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
		
		// Configure the cell...
		if indexPath.row == 0 {
			cell.postImageView.image = UIImage(named: "red-lights-lisbon")
			cell.postTitle.text = "Red Lights, Lisbon"
			cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
			cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
		} else if indexPath.row == 1 {
			cell.postImageView.image = UIImage(named: "val-throrens-france")
			cell.postTitle.text = "Val Thorens, France"
			cell.postAuthor.text = "BARA ART (bara-art.com)"
			cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
		} else if indexPath.row == 2 {
			cell.postImageView.image = UIImage(named: "summer-beach-huts")
			cell.postTitle.text = "Summer Beach Huts, England"
			cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
			cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
		} else {
			cell.postImageView.image = UIImage(named: "taxis-nyc")
			cell.postTitle.text = "Taxis, NYC"
			cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
			cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
		}
		
		return cell
	}
}

extension NewsTableViewController: GADBannerViewDelegate {
	
	func adViewDidReceiveAd(_ bannerView: GADBannerView) {
		print("Banner loaded successfully")
		
		// Reposition the banner ad to create a slide down effect
		let translateTransform = CGAffineTransform(translationX: 0, y: -bannerView.bounds.size.height)
		bannerView.transform = translateTransform
		UIView.animate(withDuration: 0.5) {
			self.tableView.tableHeaderView?.frame = bannerView.frame
			bannerView.transform = CGAffineTransform.identity
			self.tableView.tableHeaderView = bannerView
		}
	}
	
	func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
		print("Failed to receive ads: \(error)")
	}
}
