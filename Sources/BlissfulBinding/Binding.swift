import SwiftUI

extension Binding {
    
    public static func notNil<T>(_ optionalBinding: Binding<Optional<T>>) -> Binding<Bool> {
        Binding<Bool> { optionalBinding.wrappedValue != nil } set: { if !$0 { optionalBinding.wrappedValue = nil } }
    }
    
    public static func ??(lhs: Binding<Value?>, rhs: Value) -> Binding<Value> {
        Binding<Value> { lhs.wrappedValue ?? rhs } set: { lhs.wrappedValue = $0 }
    }
    
    public func onChange(_ perform: @escaping (() -> ())) -> Binding<Value> {
        Binding<Value> { wrappedValue } set: {
            wrappedValue = $0
            perform()
        }
    }
    
}

extension Binding where Value == Bool {
    
    public func on(_ value: Bool? = nil, _ perform: @escaping (() -> ())) -> Binding<Value> {
        Binding<Value> { wrappedValue } set: {
            wrappedValue = $0
            if $0 == value {
                perform()
            }
        }
    }
    
}
