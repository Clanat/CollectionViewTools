//
//  CollectionViewSectionItem.swift
//
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.UICollectionView
import ObjectiveC.runtime

public protocol CollectionViewSectionItem: CollectionViewSiblingSectionItem {

    typealias CellItem = CollectionViewCellItem
    typealias ReusableViewItem = CollectionViewReusableViewItem

    var cellItems: [CellItem] { get set }
    var reusableViewItems: [ReusableViewItem] { get set }
    
    var minimumLineSpacing: CGFloat { get set }
    var minimumInteritemSpacing: CGFloat { get set }
    var insets: UIEdgeInsets { get set }
}

// MARK: - DifferentiableCollectionViewSectionItem

public protocol DifferentiableCollectionViewSectionItem: Differentiable, CollectionViewSectionItem {
    init(sectionItem: Self)
}

// MARK: - CollectionViewSiblingSectionItem

public protocol CollectionViewSiblingSectionItem: AnyObject {
    var collectionView: UICollectionView? { get set }
    var index: Int? { get set }
}

extension CollectionViewSiblingSectionItem {
    public weak var collectionView: UICollectionView? {
        get {
            if let object = objc_getAssociatedObject(self, &AssociatedKeys.collectionView) as? UICollectionView {
                return object
            }
            printContextWarning("We found out that collectionView property for \(self) is nil")
            return nil
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.collectionView, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    public var index: Int? {
        get {
            if let object = objc_getAssociatedObject(self, &AssociatedKeys.index) as? Int {
                return object
            }
            printContextWarning("We found out that index property for \(self) is nil")
            return nil
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.index, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

// MARK: AssociatedKeys

private enum AssociatedKeys {
    static var index = "rsb_index"
    static var collectionView = "rsb_collectionView"
}
