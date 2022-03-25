import SwiftUI

extension Binding {
    
    static func notNil<T>(_ optionalBinding: Binding<Optional<T>>) -> Binding<Bool> {
        Binding<Bool> { optionalBinding.wrappedValue != nil } set: { if !$0 { optionalBinding.wrappedValue = nil } }
    }
    
    static func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
        Binding<T> { lhs.wrappedValue ?? rhs } set: { lhs.wrappedValue = $0 }
    }
    
}
