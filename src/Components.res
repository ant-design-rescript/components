module Divider = {
  @module("antd") @react.component
  external make: (
    @as("type") ~type_: string=?,
    ~children: React.element=?,
    ~className: string=?,
    ~style: ReactDOM.style=?,
    ~dashed: bool=?,
  ) => React.element = "Divider"
}

module Modal = {
  @module("antd") @react.component
  external make: (
    ~okType: string=?,
    ~centered: bool=?,
    ~closable: bool=?,
    ~wrapClassName: string=?,
    ~maskClosable: bool=?,
    ~title: string=?,
    @as("open") ~open_: bool,
    ~children: React.element=?,
    ~onOk: unit => unit=?,
    ~onCancel: unit => unit=?,
    ~footer: array<React.element>=?,
    ~forceRender: bool=?,
    ~confirmLoading: bool=?,
    ~destroyOnClose: bool=?,
    ~zIndex: int=?,
  ) => React.element = "Modal"
}

module Button = {
  type shape = [#default | #circle | #round]
  type type_ = [#primary | #ghost | #dashed | #link | #text | #default]
  type size = [#large | #middle | #small]

  module BoolOrObject = {
    type o = {delay: float}
    type rec t = Any('a): t
    type union = Bool(bool) | Object(o)
    let boolean = (v: bool) => Any(v)
    let object = (v: o) => Any(v)
    let make = (Any(v): t): union =>
      Js.typeof(v) == "boolean" ? Bool((Obj.magic(v): bool)) : Object((Obj.magic(v): o))
  }

  @module("antd") @react.component
  external make: (
    @as("type") ~type_: type_=?,
    ~shape: shape=?,
    ~children: React.element=?,
    ~className: string=?,
    ~style: ReactDOM.style=?,
    ~icon: React.element=?,
    ~onClick: ReactEvent.Mouse.t => unit=?,
    ~ref: ReactDOM.Ref.t=?,
    ~loading: BoolOrObject.t=?,
    ~htmlType: string=?,
    ~block: bool=?,
    ~danger: bool=?,
    ~disabled: bool=?,
    ~ghost: bool=?,
    ~href: string=?,
    ~size: size=?,
  ) => React.element = "Button"
}

module Dropdown = {
  type trigger = [#click | #hover | #contextMenu]
  type placement = [#bottom | #bottomLeft | #bottomRight | #top | #topLeft | #topRight]

  @module("antd") @react.component
  external make: (
    ~children: React.element=?,
    ~menu: {..},
    ~autoFocus: bool=?,
    @as("open") ~open_: bool=?,
    ~onOpenChange: bool => unit=?,
    ~trigger: array<trigger>=?,
    ~placement: placement=?,
  ) => React.element = "Dropdown"
}

module Input = {
  @module("antd") @react.component
  external make: (
    ~id: string=?,
    ~value: string=?,
    ~disabled: bool=?,
    ~onPressEnter: ReactEvent.Keyboard.t => unit=?,
    ~prefix: React.element=?,
    ~onChange: ReactEvent.Form.t => unit=?,
    ~maxLength: int=?,
    ~defaultValue: string=?,
    ~addonBefore: React.element=?,
    ~bordered: bool=?,
    ~addonAfter: React.element=?,
    ~status: string=?,
    @as("type") ~type_: string=?,
    ~className: string=?,
    ~placeholder: string=?,
    ~style: ReactDOM.style=?,
  ) => React.element = "Input"

  module TextArea = {
    type resize = {width: int, height: int}

    @scope("Input") @module("antd") @react.component
    external make: (
      ~className: string=?,
      ~placeholder: string=?,
      ~rows: int=?,
      ~columns: int=?,
      ~maxLength: int=?,
      ~allowClear: bool=?,
      ~autoSize: bool=?,
      ~bordered: bool=?,
      ~defaultValue: string=?,
      ~showCount: bool=?,
      ~value: string=?,
      ~onPressEnter: ReactEvent.Keyboard.t => unit=?,
      ~onResize: resize => unit=?,
    ) => React.element = "TextArea"
  }
}

module Select = {
  type placement = [#bottomLeft | #bottomRight | #topLeft | #topRight]

  @module("antd") @react.component
  external make: (
    @as("open") ~open_: bool=?,
    ~allowClear: bool=?,
    ~className: string=?,
    ~bordered: bool=?,
    ~popupClassName: string=?,
    ~placement: placement=?,
    ~placeholder: string=?,
    ~style: ReactDOM.style=?,
    ~defaultValue: array<string>=?,
    ~disabled: bool=?,
    ~onChange: ReactEvent.Form.t => unit=?,
    ~options: array<{..}>=?,
    ~searchValue: string=?,
    ~showArrow: bool=?,
    ~showSearch: bool=?,
    ~virtual: bool=?,
  ) => React.element = "Select"
}

module Radio = {
  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~value: string=?,
    ~children: React.element=?,
  ) => React.element = "Radio"

  module Group = {
    @module("antd/es/radio/group") @react.component
    external make: (
      ~name: string=?,
      ~value: string=?,
      ~onChange: ReactEvent.Mouse.t => unit=?,
      ~children: React.element,
    ) => React.element = "default"
  }
}

module Checkbox = {
  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~onChange: ReactEvent.Mouse.t => unit=?,
    ~children: React.element=?,
    ~disabled: bool=?,
    ~checked: bool=?,
    ~defaultChecked: bool=?,
    ~autoFocus: bool=?,
    ~indeterminate: bool=?,
  ) => React.element = "Checkbox"
}

module ConfigProvider = {
  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~theme: {..}=?,
    ~locale: {..}=?,
    ~children: React.element=?,
  ) => React.element = "ConfigProvider"
}

module Theme = {
  @module("antd")
  external make: {..} = "theme"
  @module("antd/es/theme")
  external useToken: unit => {..} = "useToken"
}

module Menu = {
  type rec menuItem = {
    key: string,
    mutable icon?: React.element,
    mutable children?: array<menuItem>,
    label: React.element,
    @as("type") type_: string,
    mutable expandIcon?: React.element,
    mode: string,
  }

  type onClick = {
    key: string,
    keyPath: array<string>,
    domEvent: ReactEvent.Mouse.t,
  }

  type mode = [#vertical | #horizontal | #inline]
  type theme = [#light | #dark]
  type triggerSubMenuAction = [#hover | #click]

  @module("antd") @react.component
  external make: (
    ~style: ReactDOM.style=?,
    ~selectable: bool=?,
    ~expandIcon: React.element=?,
    ~onClick: onClick => unit=?,
    ~inlineCollapsed: bool=?,
    ~defaultOpenKeys: array<string>=?,
    ~defaultSelectedKeys: array<string>=?,
    ~mode: mode=?,
    ~className: string=?,
    ~inlineIndent: int=?,
    ~items: array<menuItem>=?,
    ~theme: theme=?,
    ~triggerSubMenuAction: triggerSubMenuAction=?,
  ) => React.element = "Menu"
}

module Layout = {
  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~hasSider: bool=?,
    ~style: ReactDOM.style=?,
    ~children: React.element=?,
  ) => React.element = "Layout"

  module Header = {
    @module("antd/es/layout/layout") @react.component
    external make: (~children: React.element=?, ~className: string=?) => React.element = "Header"
  }

  module Content = {
    @module("antd/es/layout/layout") @react.component
    external make: (~children: React.element=?, ~className: ReactDOM.style=?) => React.element =
      "Content"
  }

  module Sider = {
    @module("antd/es/layout/Sider") @react.component
    external make: (
      ~children: React.element=?,
      ~className: ReactDOM.style=?,
      ~collapsed: bool=?,
      ~width: string=?,
      ~collapsible: bool=?,
      ~reverseArrow: bool=?,
      ~theme: string=?,
      ~trigger: React.element=?,
      ~onCollapse: {..} => unit=?,
      ~defaultCollapsed: bool=?,
    ) => React.element = "default"
  }
}

module Breadcrumb = {
  @module("antd") @react.component
  external make: (
    ~children: React.element=?,
    ~className: string=?,
    ~style: ReactDOM.style=?,
    ~theme: string=?,
    ~separator: string=?,
  ) => React.element = "Breadcrumb"

  module Item = {
    @module("antd/es/breadcrumb/BreadcrumbItem") @react.component
    external make: (~children: React.element=?) => React.element = "default"
  }
}

module Pagination = {
  type size = [#default | #small]

  @module("antd") @react.component
  external make: (
    ~total: int,
    ~className: string=?,
    ~style: ReactDOM.style=?,
    ~showSizeChanger: bool=?,
    ~showQuickJumper: bool=?,
    ~pageSizeOptions: array<string>=?,
    ~showLessItems: bool=?,
    ~showTotal: int => React.element=?,
    ~showTitle: bool=?,
    ~simple: bool=?,
    ~onChange: (int, int) => unit=?,
    ~pageSize: int=?,
    ~disabled: bool=?,
    ~hideOnSinglePage: bool=?,
    ~current: int=?,
    ~defaultCurrent: int=?,
    ~defaultPageSize: int=?,
    ~size: size=?,
  ) => React.element = "Pagination"
}

module Drawer = {
  module StringOrNumber = {
    type rec t = Any('a): t
    type union = String(string) | Number(float)
    let str = (v: string) => Any(v)
    let number = (v: float) => Any(v)
    let make = (Any(v): t): union =>
      Js.typeof(v) == "string" ? String((Obj.magic(v): string)) : Number((Obj.magic(v): float))
  }

  @react.component @module("antd")
  external make: (
    ~title: React.element=?,
    ~children: React.element=?,
    ~className: string=?,
    ~rootClassName: string=?,
    ~rootStyle: ReactDOM.style=?,
    ~keyboard: bool=?,
    ~mask: bool=?,
    ~closeIcon: React.element=?,
    ~closable: bool=?,
    ~maskClosable: bool=?,
    ~maskStyle: ReactDOM.style=?,
    ~destroyOnClose: bool=?,
    ~footerStyle: ReactDOM.style=?,
    ~headerStyle: ReactDOM.style=?,
    ~bodyStyle: ReactDOM.style=?,
    ~afterOpenChange: bool => unit=?,
    ~autoFocus: bool=?,
    @as("open") ~open_: bool,
    ~contentWrapperStyle: ReactDOM.style=?,
    ~extra: React.element=?,
    ~forceRender: bool=?,
    ~placement: string=?,
    ~width: StringOrNumber.t=?,
    ~height: float=?,
    ~zIndex: int=?,
    ~onClose: ReactEvent.Mouse.t => unit=?,
    ~footer: React.element=?,
  ) => React.element = "Drawer"
}

module DatePicker = {
  type variant = [#date | #week | #month | #quarter | #year]
  type status = [#error | #warning]
  type placement = [#bottomLeft | #bottomRight | #topLeft | #topRight]
  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~style: ReactDOM.style=?,
    ~picker: variant=?,
    ~status: status=?,
    ~placeholder: string=?,
    ~placement: placement=?,
    ~inputReadOnly: bool=?,
    ~disabled: bool=?,
    ~allowClear: bool=?,
    ~autoFocus: bool=?,
    ~bordered: bool=?,
    ~prevIcon: React.element=?,
    ~nextIcon: React.element=?,
  ) => React.element = "DatePicker"

  module RangePicker = {
    @scope("DatePicker") @module("antd") @react.component
    external make: (
      ~className: string=?,
      ~style: ReactDOM.style=?,
      ~separator: React.element=?,
      ~locale: {..}=?,
      ~nextIcon: React.element=?,
      ~prevIcon: React.element=?,
    ) => React.element = "RangePicker"
  }

  @module("antd/es/date-picker/locale/zh_CN")
  external zh_CN: {..} = "default"
}

module Image = {
  @module("antd") @react.component
  external make: (
    ~alt: string=?,
    ~fallback: string=?,
    ~width: string=?,
    ~height: string=?,
    ~preview: bool=?,
    ~src: string=?,
    ~onError: ReactEvent.Image.t => unit=?,
    ~className: string=?,
    ~style: ReactDOM.style=?,
    ~rootClassName: string=?,
  ) => React.element = "Image"
}

module Progress = {
  type status = [#success | #"exception" | #normal | #active]
  type strokeLinecap = [#round | #butt | #square]
  type success = {percent: float, strokeColor: string}
  type type_ = [#line | #circle | #dashboard]

  @module("antd") @react.component
  external make: (
    @as("type") ~type_: type_=?,
    ~format: (float, float) => unit=?,
    ~strokeLinecap: strokeLinecap=?,
    ~status: status=?,
    ~showInfo: bool=?,
    ~percent: float=?,
    ~className: string=?,
    ~success: success=?,
    ~style: ReactDOM.style=?,
    ~trailColor: string=?,
    ~width: float=?,
    ~strokeWidth: float=?,
    ~strokeColor: string=?,
    ~steps: int=?,
  ) => React.element = "Progress"
}

module Upload = {
  type listType = [#text | #picture | #"picture-card"]
  type progress = {
    steps?: int,
    strokeWidth?: float,
    strokeColor?: string,
  }

  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~accept: string=?,
    ~onChange: {..} => unit=?,
    ~disabled: bool=?,
    ~name: string=?,
    ~action: string=?,
    ~headers: {..}=?,
    ~listType: listType=?,
    ~maxCount: int=?,
    ~fileList: array<{..}>=?,
    ~multiple: bool=?,
    ~progress: progress=?,
    ~withCredentials: bool=?,
    ~itemRender: (React.element, {..}, array<{..}>, {..}) => React.element=?,
    ~children: React.element=?,
  ) => React.element = "Upload"
}
