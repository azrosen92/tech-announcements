// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
import showdown from "showdown"
// import SimpleMDE from "simplemde"

var converter = new showdown.Converter(),
    text      = '#hello, markdown!',
    html      = converter.makeHtml(text);

document.querySelectorAll(".announcement-content").forEach((element) => {
  var text = element.innerHTML;
  var newHTML = converter.makeHtml(text);
  element.innerHTML = newHTML;
})

// document.querySelectorAll(".markdown-input").forEach((element) => {
//   // var simplemde = new SimpleMDE({ 
//   //   element: element,
//   //   autoFocus: true,
//   //   hideIcons: true 
//   // });
// })
