//
//  VendorTVCell.swift
//  AlliantsTest
//
//  Created by Alex Kudlak on 2022-04-04.
//

import UIKit

final class VendorTVCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    static let cellIdentifier = "imageTVCellIdentifier"
    

    var img = UIImage()
    private var liked = false
    private var vendorData: VendorData?
    private weak var pvc: UIViewController?

    func setData(with vendorObjectData: VendorData, vc: UIViewController) {
        vendorData = vendorObjectData
        pvc = vc
        if let url = vendorObjectData.heroImage.url {
            loadImage(with: url)
        }
        namelabel.text = vendorObjectData.displayName
    }
    
    private func loadImage(with posterPath: String) {
        let url = URL(string: posterPath)
        imgView.load(url: url!)
    }
    
    @IBAction func openFullImageVC(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VendorDetailsVC") as? VendorDetailsVC
        vc?.imageData = vendorData
        vc?.modalPresentationStyle = .fullScreen
        vc?.modalTransitionStyle = .crossDissolve
        pvc?.present(vc!, animated: true)
    }
}
