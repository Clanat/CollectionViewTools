//
// Created by Nikita Zatsepilov on 2019-04-26.
// Copyright (c) 2019 Rosberry. All rights reserved.
//

import UIKit.UICollectionView

open class GeneralDifferentiableCollectionViewSectionItem: DifferentiableCollectionViewSectionItem {

    public var differenceIdentifier: DifferenceIdentifier {
        // FIXME: correct
        return ""
    }

    open var cellItems: [CellItem]
    open var reusableViewItems: [ReusableViewItem]

    public var minimumLineSpacing: CGFloat = 0
    public var minimumInteritemSpacing: CGFloat = 0
    public var insets: UIEdgeInsets = .zero

    public init(cellItems: [CellItem] = [], reusableViewItems: [ReusableViewItem] = []) {
        self.cellItems = cellItems
        self.reusableViewItems = reusableViewItems
    }

    public required init(sectionItem: GeneralDifferentiableCollectionViewSectionItem) {
        cellItems = sectionItem.cellItems
        reusableViewItems = sectionItem.reusableViewItems
        minimumLineSpacing = sectionItem.minimumLineSpacing
        minimumInteritemSpacing = sectionItem.minimumInteritemSpacing
        insets = sectionItem.insets
    }

    public func isContentEqual<Object>(to other: Object) -> Bool {
        return false
    }
}
