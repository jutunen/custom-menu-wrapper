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

The component will change the container display style to flex during component initialization.

Thus container contents should be considered as flex items when styling them.

In the example above, the content is centered as flex items with align-items and justify-content directives.

## Custom attributes

#### mode

Defines how the menu can be toggled.
Menu can be toggled by click or hover.

#### position

Defines initial menu item position in relation to menu heading.

#### direction

Defines menu opening direction.

#### init-state-open

If defined, menu shall be initially displayed in open state.

#### menu-close-timeout

When menu is in hover mode, this value defines how long the menu will be open after the pointer is not above the menu anymore.

#### close-submenus-on-closing

Defines whether the submenus will be set to closed state when the menu is closed by custom event or by losing focus.

#### close-submenus-on-heading-click

Defines whether the submenus will be set to closed state when the menu is closed by heading click.

#### menu-open-class

Defines the name of the class that shall be assigned to the heading when the menu is open.

#### item

Defines new item class name, if the default class name 'item' can not be used.

#### heading

Defines new heading class name, if the default class name 'heading' can not be used.

## Closing the menu

Following events cause menu closing:

 * click outside menu items (click mode only)
 * click on the heading
 * hover outside menu items for longer than menu-close-timeout (hover mode only)
 * menuClose or rootMenuClose event is dispatched from within a menu item

#### Dispatching menuClose event

  menuClose event closes the menu that contains the item from within the event originated from.

  example:

```javascript
  var element = getElementById("elemId")
  element.dispatchEvent(new CustomEvent('menuClose', {bubbles: true}))
```

  In the example above, the element must be a descendant of menu item element.
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
