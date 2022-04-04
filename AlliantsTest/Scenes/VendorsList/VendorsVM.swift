//
//  VendorsVM.swift
//  AlliantsTest
//
//  Created by Alex Kudlak on 2022-04-04.
//

import Foundation

struct VendorsVM {
    var vendors = Bindable<Array<VendorData>>()
    
    func getData() {
        DataService.getData() { result in
            self.vendors.value = result
        }
    }
}
