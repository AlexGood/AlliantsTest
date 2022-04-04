//
//  VendorDetailsVC.swift
//  AlliantsTest
//
//  Created by Alex Kudlak on 2022-04-04.
//

import UIKit

final class VendorDetailsVC: UIViewController {
    
    //MARK: private @IBOutlets
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    //MARK: public data
    var imageData: VendorData?
    
    //MARK: private functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setData(with: imageData!)
    }
    
    //MARK: private functions
    private func setData(with data: VendorData) {
        loadPosterImage()
        descriptionLabel.text = data.description
    }
    
    private func loadPosterImage() {
        if let url = imageData?.heroImage.url {
            let url = URL(string: url)
            posterImageView.load(url: url!)
        }
    }
    
    @IBAction func dismissVC(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
