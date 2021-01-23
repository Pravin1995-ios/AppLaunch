//
//  ViewController.swift
//  AppLaunchTask
//
//  Created by Praveenkumar on 22/01/21.
//  Copyright © 2021 praveenkumar. All rights reserved.
//

import UIKit

//TableView
class TableViewCell: UITableViewCell {
    
}

//CollectionView
class SlideShowCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideShowImageView: UIImageView!
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tabbar: UITabBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var musicCollectionView: UICollectionView!
    @IBOutlet weak var musicCollectionViewTwo: UICollectionView!
    @IBOutlet weak var musicCollectionViewThree: UICollectionView!
    @IBOutlet weak var slideShowCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabbar.selectedItem = tabbar.items![0]
        
        self.musicCollectionView.register(UINib(nibName:"MusicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellIdentifier")

        self.musicCollectionView.delegate = self
        self.musicCollectionView.dataSource = self
        
        self.musicCollectionViewTwo.register(UINib(nibName:"MusicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellIdentifierTwo")
        
        self.musicCollectionViewThree.register(UINib(nibName:"MusicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellIdentifierThree")
        
    }

    
    let slideShowImagesArray = ["poster1","poster2","poster3","poster4"]
    let musicImagesArrayOne = ["Music1","Music2","Music3","Music4","Music5"]
    let musicImagesArrayTwo = ["Music6","Music7","Music8","Music9","Music10"]
    let musicImagesArrayThree = ["Music11","Music12","Music13","Music14","Music15"]
    
    //CollectionView methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == self.slideShowCollectionView) {
            return slideShowImagesArray.count
        } else if (collectionView == self.musicCollectionView) {
            return musicImagesArrayOne.count
        } else if (collectionView == self.musicCollectionViewTwo) {
            return musicImagesArrayTwo.count
        } else {
            return musicImagesArrayThree.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == self.slideShowCollectionView) {
            let cell = slideShowCollectionView.dequeueReusableCell(withReuseIdentifier: "SlideShowCollectionViewCell", for: indexPath) as! SlideShowCollectionViewCell
            cell.slideShowImageView.image = UIImage(named: slideShowImagesArray[indexPath.row])
            return cell
        }
        else if (collectionView == self.musicCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! MusicCollectionViewCell
            cell.musicImageView.image = UIImage(named: musicImagesArrayOne[indexPath.row])
            return cell
        } else if (collectionView == self.musicCollectionViewTwo){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifierTwo", for: indexPath) as! MusicCollectionViewCell
            cell.musicImageView.image = UIImage(named: musicImagesArrayTwo[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifierThree", for: indexPath) as! MusicCollectionViewCell
            cell.musicImageView.image = UIImage(named: musicImagesArrayThree[indexPath.row])
            return cell
        }
    }
    
    //to make collection view cell size
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        print("came inside size for row at index")
//        let height = view.frame.size.height
//        let width = view.frame.size.width
//        // in case you you want the cell to be 40% of your controllers view
//        return CGSize(width: width * 0.4, height: height * 0.4)
//    }

    
//  TableView  methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

