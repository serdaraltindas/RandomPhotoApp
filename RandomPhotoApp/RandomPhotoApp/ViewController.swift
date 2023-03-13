//
//  ViewController.swift
//  RandomPhotoApp
//
//  Created by Serdar Altındaş on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private let ButtonClicked : UIButton = {
        let ButtonClicked = UIButton()
        ButtonClicked.backgroundColor = .black
        ButtonClicked.setTitle("RANDOM PHOTO", for: UIControl.State.normal)
        ButtonClicked.setTitleColor(UIColor.white, for: UIControl.State.normal)
        return ButtonClicked
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(ButtonClicked)
        getRandomPhoto()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ButtonClicked.frame = CGRect(x: 50, y: view.frame.size.height-200-view.safeAreaInsets.bottom,width: view.frame.size.width - 100, height:40)
        ButtonClicked.addTarget(self, action:#selector(didTapButton) , for: UIControl.Event.touchUpInside)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
    }
    
    func getRandomPhoto(){
        
        let urlString =
        "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
        
        
    }
}
