terser custom-menu-wrapper.js -c -m --mangle-props reserved=[constructor,observedAttributes,disconnectedCallback,attributeChangedCallback,connectedCallback,Custommenu,position,direction,mode,closeSubmenusOnClosing,closeSubmenusOnHeadingClick,headingClass,initStateOpen,closingDelay,addItem,deleteItem,menuContent] -o custom-menu-wrapper.min.js

terser custom-menu-wrapper-node.js -c -m --mangle-props reserved=[constructor,observedAttributes,disconnectedCallback,attributeChangedCallback,connectedCallback,Custommenu,position,direction,mode,closeSubmenusOnClosing,closeSubmenusOnHeadingClick,headingClass,initStateOpen,closingDelay,addItem,deleteItem,menuContent] -o custom-menu-wrapper-node.min.js
