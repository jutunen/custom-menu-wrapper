# custom-menu-wrapper
A web component that wraps HTML elements and forms a drop-down menu out of them.

## Features
Custom menu component is a standalone vanilla JS web component that does not use shadow DOM.

Component features include:
- content agnostic: menu items should be able to contain any HTML
- nestable: allows creating of versatile menu-submenu structures
- menu "drop" directions: down or right
- initial menu positions: bottom or right
- menu toggling methods: click or hover

## Usage
- create a menu heading container by assigning a heading class to it
- create menu item containers by assigning item classes to them
- add style to container classes
- add content inside the containers
- wrap the containers inside a custom menu component
- dispatch menuClose events from within the menu items if necessary

HTML Example:

 ```html
     <custom-menu-wrapper>
        <div class='heading'> Menu </div>
        <div class='item'> 1st item </div>
        <div class='item'> 2nd item </div>
        <div class='item'> 3rd item </div>
     </custom-menu-wrapper>    
 ```
 
 Style example:
 
 ```css
   .item, .heading {
    background-color: lightblue;
    display: none;
    width: 150px;
    height: 60px;
    align-items: center;
    justify-content: center;
  }

  .item:hover {
    background: white;
    cursor: default;
  }

  .heading {
    background-color: #63b4cf;
  }
 ```
Value none should be assigned as an initial display style for the containers.

Component will change the container display style to flex during component initialization.

Container contents should be considered as flex items when styling them.

In the example above, the content is centered as flex items with align-items and justify-content directives.

## Including the component to an HTML file

1. Import polyfill, this is not needed for modern browsers:

    ```html
    <script src="https://cdnjs.cloudflare.com/ajax/libs/custom-elements/1.2.4/custom-elements.min.js"></script>
    ```

2. Import custom element:

    ```html
    <script defer src='custom-menu-wrapper.min.js'></script>
    ```

3. Start using it!

    ```html
     <custom-menu-wrapper>
        <div class='heading'> Menu </div>
        <div class='item'> 1st item </div>
     </custom-menu-wrapper>    
    ```
## Including the component from NPM

1. Install and import polyfill, this is not needed for modern browsers:

   See https://www.npmjs.com/package/@webcomponents/custom-elements

2. Install custom-menu-wrapper NPM package:

    ```console
    npm i custom-menu-wrapper
    ```

3. Import custom element:

    ```javascript
    import 'custom-menu-wrapper'
    ```

4. Start using it:

   ```javascript
   var menu = document.createElement('custom-menu-wrapper')
   var heading = document.createElement('div')
   var item = document.createElement('div')
   heading.innerHTML = 'Menu'
   item.innerHTML = 'Item 1'
   heading.classList.add('heading')
   item.classList.add('item')
   menu.appendChild(menu)
   menu.appendChild(heading)
   document.body.appendChild(menu)
   ```


## Custom attributes

#### mode

Defines how the menu can be toggled.

Menu can be toggled by clicking or hovering on it.

Attribute value must be either 'click' or 'hover'.

Default value is 'click'.

HTML example:

    ```html
     <custom-menu-wrapper mode='hover'>
    ```

#### position

Defines initial menu item position in relation to menu heading.

Attribute value must be either 'bottom' or 'right'.

Default value is 'bottom'.

HTML example:

    ```html
     <custom-menu-wrapper position='right'>
    ```

#### direction

Defines menu opening direction.

Attribute value must be either 'down' or 'right'.

Default value is 'down'.

HTML example:

    ```html
     <custom-menu-wrapper direction='right'>
    ```

#### init-state-open

If defined, menu shall be initially displayed in open state.

This attribute is a boolean attribute, also known as a valueless attribute.

HTML example:

    ```html
     <custom-menu-wrapper init-state-open>
    ```

#### closing-delay

This attribute applies only when menu is in hover mode.

Attribute value defines how long the menu will be open after the pointer is not above the menu anymore.

Attribute's unit is milliseconds and default value is 500.

HTML example:

    ```html
     <custom-menu-wrapper closing-delay='0'>
    ```

#### close-submenus-on-closing

Defines whether the submenus will be closed when the menu is closed by custom event or by losing focus.

#### close-submenus-on-heading-click

Defines whether the submenus will be closed when the menu is closed by heading click.

#### heading-class

Defines the name of the class that shall be assigned to the heading when the menu is open.

#### item

Defines new item class name, if the default class name 'item' can not be used.

#### heading

Defines new heading class name, if the default class name 'heading' can not be used.

## Closing the menu

Following events cause menu closing:

 * click outside menu items (on click mode only)
 * click on the heading (on click mode only)
 * hover outside menu items or heading for longer than menu-close-timeout (on hover mode only)
 * menuClose or rootMenuClose event is dispatched from menu item or its descentant

#### Dispatching menuClose event

  menuClose event closes the menu that contains the item from within the event originated from.

  example:

```javascript
  var element = getElementById("elemId")
  element.dispatchEvent(new CustomEvent('menuClose', {bubbles: true}))
```

  In the example above, the element must be a menu item or its descentant.
  Remember to set the 'bubbles:true' object parameter on CustomEvent.

#### Dispatching rootMenuClose event

  rootMenuClose event closes the root menu that contains the submenu that contains the item from within the event originated from.

  rootMenuClose event closes the menu also if it there are no submenus at all.

example:

```javascript
  var element = getElementById("elemId")
  element.dispatchEvent(new CustomEvent('rootMenuClose'))
```

  In the example above, the element must be a descendant of menu item element. Unlike in the case of menuClose event, there is no need for second parameter on CustomEvent. 
