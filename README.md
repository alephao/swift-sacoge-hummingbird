# Sacoge Hummingbird

> ⚠️  Work in progress

This package provides a library containing a Hummingbird Middleware to be used in conjunction with [sacoge](https://github.com/alephao/swift-sacoge). 

The middleware checks if there is a file for the existing request, if the file exists, it returns a response with an `immutable` cache policy (or `no-cache` if the application is built with DEBUG flag), otherwise it skips to the next middleware.

The code for the middleware is very lean, you can just copy/paste into your own project if you prefer.

Check the example hummingbird project [here](https://github.com/alephao/swift-sacoge/tree/main/Example).

## Getting Started

1. Add Sacoge and SacogeHummingbird to your dependencies.

```swift
dependencies: [
  // ...
  .package(url: "https://github.com/alephao/swift-sacoge.git", from: "0.1.0"),
  .package(url: "https://github.com/alephao/swift-sacoge-hummingbird.git", from: "0.1.0"),
]
```

2. Configure your target with SacogePlugin and SacogeHummingbird.

```swift
.target(
  name: "MyHummingbirdServer",
  dependencies: [
    // ...
    .product(name: "SacogeHummingbird", package: "swift-sacoge-hummingbird"),
  ],
  plugins: [
    .plugin(name: "SacogePlugin", package: "swift-sacoge"),
  ]
)
```

3. Add a configuration file to the root of your project `.sacoge`

```json
{
  "from": "/",
  "to": "public",
  "structName": "Asset",
  "ignore": [],
  "skipChecksum": []
}
```

4. Add `SacogeMiddleware` to your router

```swift
func buildRouter() -> Router<AppRequestContext> {
  let router = Router(context: AppRequestContext.self)
  // ...
  router.addMiddleware {
    SacogeMiddleware(
      "public",
      externalToInternalMapping: Asset.externalToInternalMapping)
  }
  // ...
  return router
}
```
