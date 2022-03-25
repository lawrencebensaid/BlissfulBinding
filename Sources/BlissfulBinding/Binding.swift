import SwiftUI

extension Binding {
    
    public static func notNil<T>(_ optionalBinding: Binding<Optional<T>>) -> Binding<Bool> {
        Binding<Bool> { optionalBinding.wrappedValue != nil } set: { if !$0 { optionalBinding.wrappedValue = nil } }
    }
    
    public static func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
        Binding<T> { lhs.wrappedValue ?? rhs } set: { lhs.wrappedValue = $0 }
    }
    
}
