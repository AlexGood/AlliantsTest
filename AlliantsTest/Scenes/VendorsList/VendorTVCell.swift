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

    private var vendorData: VendorData?
    var openDetails: ((_ vendorData: VendorData) -> Void)?

    func setData(with vendorObjectData: VendorData) {
        vendorData = vendorObjectData
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
        guard let data = vendorData else { return }
        openDetails?(data)
    }
}
