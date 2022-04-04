//
//  VendorsListVC.swift
//  AlliantsTest
//
//  Created by Alex Kudlak on 2022-04-04.
//

import UIKit

final class VendorsListVC: UIViewController {
    
    //MARK: private @IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: private vars
    private var vendorsVM = VendorsVM()
    
    //MARK: overrided
    override func viewDidLoad() {
        super.viewDidLoad()
        bindings()
        vendorsVM.getData()
    }
    
    //MARK: private functions
    private func bindings() {
        vendorsVM.vendors.bind { [weak self] data in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension VendorsListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let value = vendorsVM.vendors.value else { return 0 }
        return value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VendorTVCell.cellIdentifier, for: indexPath) as? VendorTVCell
        
        let imageObjectData = vendorsVM.vendors.value[safe: indexPath.row]
        
        if let imageObjectData = imageObjectData {
            cell?.setData(with: imageObjectData, vc: self)
        }
        
        return UITableViewCell()
    }
}

extension VendorsListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
