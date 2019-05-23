//
//  ViewController.swift
//  WhatToEat
//
//  Created by Paul Ter on 5/20/19.
//  Copyright © 2019 Paul Ter. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController,GADBannerViewDelegate,GADInterstitialDelegate {
    
    var fastFood = [[String:Any]]()
    var restauraunts = [[String:Any]]()
    var all = [[String:Any]]()
    @IBOutlet weak var foodplaceLabel: UILabel!
    @IBOutlet weak var foodplaceImage: UIImageView!
    var bview = GADBannerView()
    var interstitial: GADInterstitial!

    var count = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        restauraunts = [["Cheesecake Factory":"cheesecakeFactory.jpg"],[" Hooters":"hooters.jpg"],[" Rubio's":"rubios.jpg"],[" PF Changs":"pfchangs.jpg"],[" Waffle House":"waffleHouse"],[" Outback Steakhouse":"outbackSteakhouse.jpg"],[" Applebees":"applebees.jpg"],[" Red Lobster":"redLobster.jpg"],[" Buffalo Wild Wings":"bdubs.jpg"],[" Texas Roadhouse":"texasRoadhouse.jpg"],[" IHop":"ihop.jpg"],[" Wingstop":"wingstop.jpg"],[" Perkins":"perkins.jpg"],[" Olive Garden":"oliveGarden.jpg"],[" TGIFridays":"tgif.jpg"],[" Long John Silvers":"longJohnSilvers.jpg"],[" Longhorn Steakhouse":"longHornSteakhouse.jpg"],[" Famous Daves":"famousDaves.jpg"],[" Denny's":"dennys.jpg"],[" Ruby Tuesdays":"rubyTuesdays.jpg"]]
        
         fastFood = [["Arby's":"arbys.jpg"],["Baskin Robins":"baskinRobins.jpg"],["Burger King":"burgerKing.jpg"],["Checkers":"checkers.jpg"],["Chick-Fil-A ":"chicfila.jpg"],["Chipotle":"chipotle.jpg"],[" Church's Chicken":"churchsChicken.jpg"],["Culver's":"culvers.jpg"],["Dairy Queen":"dairyQueen.jpg"],["Dominos":"dominos.jpg"],[" Five Guys":"fiveGuys.jpg"],[" Hardee's":"hardees.jpg"],[" In N Out":"innout.jpg"],[" Jack in the Box":"jackInTheBox.jpg"],["Jimmy Johns":"jimmyJohns.jpg"],["KFC":"kfc.jpg"],["Little Caesars":"littleCaesars.jpg"],["McDonalds":"mcdonalds.jpg"],[" Noodles Co.":"noodleco.jpg"],["Panda Express":"pandaExpress.jpg"],["Papa Johns":"papaJohns.jpg"],["Papa Murphy's":"papaMurphys.jpg"],["Pizza Hut":"pizzaHut.jpg"],["Popeyes":"popeyes.jpg"],["QDoba":"qdoba.jpg"],["Sonic":"sonic.jpg"],["Subway":"subway.jpg"],["Taco Bell":"tacoBell.jpg"],["Wendy's":"wendys.jpg"],["Whataburger":"whataburger.jpg"]]
        
        all.append(contentsOf: restauraunts)
        all.append(contentsOf: fastFood)
         bview = GADBannerView()
        bview.frame = CGRect(x: 0, y: self.view.frame.maxY - 50, width: 320, height: 50)
        bview.delegate = self
        bview.rootViewController = self
        bview.adUnitID = "ca-app-pub-1666211014421581/9870634594"
        bview.load(GADRequest())
        
        self.interstitial = createAndLoadInterstitial()
        self.interstitial.delegate = self

        self.view.addSubview(bview)

        
        
    }
    
    @IBAction func findRandomFromAll(_ sender: Any) {
        let dict = self.all.randomElement()
        let originalx = self.foodplaceImage.frame.origin.x

        UIView.animate(withDuration: 0.5) {
            if let image = dict?.first?.value as? String{
                print("Found value of image")
                print(dict?.first?.key)
                print(dict?.first?.value)
                self.foodplaceImage.center = CGPoint(x: 0, y: self.foodplaceImage.frame.origin.y)
                
                self.foodplaceImage.image = UIImage(named: image)
                self.foodplaceImage.center = CGPoint(x: originalx, y: self.foodplaceImage.frame.origin.y)
                self.foodplaceLabel.text = dict?.first?.key
                
            }else{
                print(dict?.first?.key)
                print(dict?.first?.value)
            }
            
            
        }
        count = count + 1
        
        bview.load(GADRequest())
        if(count % 5 == 0){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)

            } else {
                print("Ad wasn't ready")
            }
            interstitial = createAndLoadInterstitial()

        }

        
    }
    
    
    @IBAction func findRandomFastFood(_ sender: Any) {
        let dict = self.fastFood.randomElement()
        
        UIView.animate(withDuration: 0.5) {
            let originalx = self.foodplaceImage.frame.origin.x
            if let image = dict?.first?.value as? String{
                print("Found value of image")
                print(dict?.first?.key)
                print(dict?.first?.value)
                self.foodplaceImage.center = CGPoint(x: 0, y: self.foodplaceImage.frame.origin.y)
                
                self.foodplaceImage.image = UIImage(named: image)
                self.foodplaceImage.center = CGPoint(x: originalx, y: self.foodplaceImage.frame.origin.y)
                self.foodplaceLabel.text = dict?.first?.key
                
            }else{
                print(dict?.first?.key)
                print(dict?.first?.value)
            }
            
            
        }
        count = count + 1
        
        bview.load(GADRequest())
        if(count % 5 == 0){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
            } else {
                print("Ad wasn't ready")
            }
            interstitial = createAndLoadInterstitial()

        }

    }
    
    

    @IBAction func findRandomRestaurant(_ sender: Any) {
        let dict = self.restauraunts.randomElement()
        
        UIView.animate(withDuration: 0.5) {
            let originalx = self.foodplaceImage.frame.origin.x
            if let image = dict?.first?.value as? String{
                print("Found value of image")
                print(dict?.first?.key)
                print(dict?.first?.value)
               self.foodplaceImage.center = CGPoint(x: 0, y: self.foodplaceImage.frame.origin.y)

                self.foodplaceImage.image = UIImage(named: image)
                self.foodplaceImage.center = CGPoint(x: originalx, y: self.foodplaceImage.frame.origin.y)
                self.foodplaceLabel.text = dict?.first?.key

            }else{
                print(dict?.first?.key)
                print(dict?.first?.value)
            }
            
            
        }
        count = count + 1

        bview.load(GADRequest())
        if(count % 5 == 0){
            if interstitial.isReady {
                print("interstitial ready")
                interstitial.present(fromRootViewController: self)
            } else {
                print("Ad wasn't ready")
            }
            interstitial = createAndLoadInterstitial()

        }
        }

    
    
    func createAndLoadInterstitial() -> GADInterstitial {
        print("creating interstitial")
         interstitial = GADInterstitial(adUnitID: "ca-app-pub-1666211014421581/9020409741")
        interstitial.load(GADRequest())
        return interstitial
    }
    
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
    
    
    //interstitial delegate
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("interstitialDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that an interstitial will be presented.
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        print("interstitialWillPresentScreen")
    }
    
    /// Tells the delegate the interstitial is to be animated off the screen.
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        print("interstitialWillDismissScreen")
    }
    
    /// Tells the delegate the interstitial had been animated off the screen.
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("interstitialDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app
    /// (such as the App Store), backgrounding the current app.
    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
        print("interstitialWillLeaveApplication")
    }
    
}

