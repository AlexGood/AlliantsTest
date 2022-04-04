//
//  Collection+Additions.swift
//  AlliantsTest
//
//  Created by Alex Kudlak on 2022-04-04.
//

import Foundation

public extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
