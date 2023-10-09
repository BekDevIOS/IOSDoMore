//
//  ScrollViewController.swift
//  IOSDoMore
//
//  Created by Utkirbek Mekhmonboev on 10/8/23.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       initView()
        
    }
    
    //MARK: - Methods
    
    func initView(){
       
        NavigationBar()
        
    }
    
    func NavigationBar(){
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .darkGray
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        title = "Scroll View"
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let back = UIImage(named: "ic_back")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(leftTapped))
        
    }
    
    
    //MARK: - Actions
    
    @objc func leftTapped(){
        navigationController?.popViewController(animated: true)
    }

  

}
