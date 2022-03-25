# BlissfulBinding

SwiftUI provides a Binding class, which can sometimes be hard to work with when you are dealing with optionals.
BlissfulBinding extends SwiftUI's Binding class with some features allowing you to work with these optionals more easily:.

### Introducing the Coalescing Operator `??`
A familiar operator to Swift. BlissfulBinding allows you to use this operator with SwiftUI's Binding.
This is useful because a lot of SwiftUI modifiers expect unwrapped variables.

```swift
import BlissfulBinding

struct MyView: View {

    @Binding var present: Bool?

    var body: some View {
        Text("Hello, World!")
            .sheet(isPresented: $present ?? false) {
                Text("Hi!")
            }
    }

}
```

### Introducing .notNil function
This allows you to convert an Optional Binding variable to a Boolean Binding variable.
 
```swift
import BlissfulBinding

struct MyView: View {

    @Binding var message: String?

    var body: some View {
        Text("Hello, World!")
            .sheet(isPresented: .notNil($message)) {
                Text(message ?? "")
            }
    }

}
```

