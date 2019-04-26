//
// Created by Nikita Zatsepilov on 2019-04-26.
// Copyright (c) 2019 Rosberry. All rights reserved.
//

public protocol ContentEquatable {
    func isContentEqual(to other: Any) -> Bool
}

public protocol Differentiable: ContentEquatable {

    typealias DifferenceIdentifier = AnyHashable

    var differenceIdentifier: DifferenceIdentifier { get }

    func isContentEqual(to other: Any) -> Bool
}

extension Differentiable where Self: Hashable {

    public var differenceIdentifier: DifferenceIdentifier {
        return self
    }

    public func isContentEqual(to other: Any) -> Bool {
        return self == other as? Self
    }
}
