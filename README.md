# @ant-design-rescript/components

ReScript bindings for [antd](https://www.npmjs.com/package/antd)

## Getting Started

1. Add this to your `package.json`:

```
yarn add @ant-design-rescript/components
```

2. Add this to your `rescript.json`

```json
"bs-dependencies": [
  "@rescript/react",
  "@ant-design-rescript/components",
]
```

## Example Usage

### Button

```rescript
open AntDesignRescriptComponents.Components

@react.component
let make = () => {
  <Button loading={Button.BoolOrObject.Object({delay: 1.})}>
    {"Cancel"->React.string}
  </Button>
}
```

### with @ant-design/icons

```
yarn add @ant-design-rescript/icons
```

**bsconfig.json**

```json
"bs-dependencies": [
  "@rescript/react",
  "@ant-design-rescript/components",
  "@ant-design-rescript/icons"
]
```

```rescript
open AntDesignRescriptIcons.Icons
open AntDesignRescriptComponents.Components

@react.component
let make = () => {
  <Button type_=#primary icon={<Outlined.Upload />}>
    {"Upload"->React.string}
  </Button>
}
```

### Locale

```rescript
open AntDesignRescriptComponents.Locales

@react.component
let make = () => {
  <ConfigProvider locale={zh_CN}>
    <App />
  </ConfigProvider>
}
```
