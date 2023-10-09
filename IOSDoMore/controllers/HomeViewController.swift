//
//  HomeViewController.swift
//  IOSDoMore
//
//  Created by Utkirbek Mekhmonboev on 10/8/23.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let numberOfColumns: CGFloat = 2
    
    var items:Array<Item> = Array()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        
    }

    //MARK: - Methods
    
    func initView(){
        NavigationBar()
        
        collectionView.delegate = self
        collectionView.dataSource = self
       
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        
        if let flowLyout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColumns - 15
            flowLyout.itemSize = CGSize(width: cellWidth, height: cellWidth)
            
            items.append(Item(image: "firstTrip1", name: "My First Trip!"))
            items.append(Item(image: "firstTrip2", name: "My First Trip!"))
            items.append(Item(image: "secondTrip1", name: "My Second Trip!"))
            items.append(Item(image: "secondTrip2", name: "My Second Trip!"))
            items.append(Item(image: "firstTrip1", name: "My First Trip!"))
            items.append(Item(image: "firstTrip2", name: "My First Trip!"))
            items.append(Item(image: "secondTrip1", name: "My Second Trip!"))
            items.append(Item(image: "secondTrip2", name: "My Second Trip!"))
            items.append(Item(image: "firstTrip1", name: "My First Trip!"))
            items.append(Item(image: "firstTrip2", name: "My First Trip!"))
            items.append(Item(image: "secondTrip1", name: "My Second Trip!"))
            items.append(Item(image: "secondTrip2", name: "My Second Trip!"))
        }
        
        
        
    }
    
    func NavigationBar(){
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .darkGray
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        title = "Collection View"
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let scroll = UIImage(named: "ic_scroll")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(rightTapped))
        
    }
    
    func callScrollViewController(){
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: - Actions
    
    @objc func rightTapped(){
        callScrollViewController()
    }

   //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.imageView.image = UIImage(named: item.image)
        cell.textLabel.text = item.name
        
        return cell
    }

    

}
