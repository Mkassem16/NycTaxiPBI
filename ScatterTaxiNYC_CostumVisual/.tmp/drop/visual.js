var ScatterTaxiNYC1112;(()=>{"use strict";var e={150:(e,t,r)=>{r.d(t,{Tx:()=>i,Kq:()=>a,ME:()=>s});var n=r(787),o=0;function i(){o=0}function a(e,t){var r=[];if(e&&e.hasChildNodes()){for(var n=e.children,o=0;o<n.length;o++){var i;i="script"===n.item(o).nodeName.toLowerCase()?u(n.item(o)):n.item(o).cloneNode(!0),t.appendChild(i),r.push(i)}return r}}function u(e){for(var t=document.createElement("script"),r=e.attributes,n=0;n<r.length;n++)t.setAttribute(r[n].name,r[n].textContent),"src"===r[n].name.toLowerCase()&&(o++,t.onload=function(){o--});return t.innerHTML=e.innerHTML,t}function s(){var e=n.setInterval((function(){0===o&&(n.clearInterval(e),n.hasOwnProperty("HTMLWidgets")&&n.HTMLWidgets.staticRender&&n.HTMLWidgets.staticRender())}),100)}},363:(e,t,r)=>{function n(e){return(n="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"==typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e})(e)}function o(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function i(e,t){return(i=Object.setPrototypeOf||function(e,t){return e.__proto__=t,e})(e,t)}function a(e,t){return!t||"object"!==n(t)&&"function"!=typeof t?function(e){if(void 0===e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return e}(e):t}function u(e){return(u=Object.setPrototypeOf?Object.getPrototypeOf:function(e){return e.__proto__||Object.getPrototypeOf(e)})(e)}r.d(t,{J:()=>s});var s=function(e){!function(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function");e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,writable:!0,configurable:!0}}),t&&i(e,t)}(s,e);var t,r,n=(t=s,r=function(){if("undefined"==typeof Reflect||!Reflect.construct)return!1;if(Reflect.construct.sham)return!1;if("function"==typeof Proxy)return!0;try{return Boolean.prototype.valueOf.call(Reflect.construct(Boolean,[],(function(){}))),!0}catch(e){return!1}}(),function(){var e,n=u(t);if(r){var o=u(this).constructor;e=Reflect.construct(n,arguments,o)}else e=n.apply(this,arguments);return a(this,e)});function s(){var e;return o(this,s),(e=n.apply(this,arguments)).rcv_script=new c,e}return s}(r(634).U),c=function e(){o(this,e)}},158:(e,t,r)=>{r.d(t,{u:()=>c});var n,o=r(363),i=r(150),a=r(787);function u(e,t){for(var r=0;r<t.length;r++){var n=t[r];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(e,n.key,n)}}!function(e){e[e.Data=2]="Data",e[e.Resize=4]="Resize",e[e.ViewMode=8]="ViewMode",e[e.Style=16]="Style",e[e.ResizeEnd=32]="ResizeEnd",e[e.All=62]="All"}(n||(n={}));var s=[n.Resize,n.ResizeEnd,n.Resize+n.ResizeEnd],c=function(){function e(t){!function(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,e),t&&t.element&&(this.rootElement=t.element),this.headNodes=[],this.bodyNodes=[]}var t,r,n;return t=e,n=[{key:"parseSettings",value:function(e){return o.J.parse(e)}}],(r=[{key:"update",value:function(t){if(t&&t.type&&t.viewport&&t.dataViews&&0!==t.dataViews.length&&t.dataViews[0]){var r=t.dataViews[0];this.settings=e.parseSettings(r);var n=null;r.scriptResult&&r.scriptResult.payloadBase64&&(n=r.scriptResult.payloadBase64),-1===s.indexOf(t.type)?n&&this.injectCodeFromPayload(n):this.onResizing(t.viewport)}}},{key:"onResizing",value:function(e){}},{key:"injectCodeFromPayload",value:function(e){if((0,i.Tx)(),e){var t=document.createElement("html");try{t.innerHTML=a.atob(e)}catch(e){return}if(0===this.headNodes.length){for(;this.headNodes.length>0;){var r=this.headNodes.pop();document.head.removeChild(r)}var n=t.getElementsByTagName("head");if(n&&n.length>0){var o=n[0];this.headNodes=(0,i.Kq)(o,document.head)}}for(;this.bodyNodes.length>0;){var u=this.bodyNodes.pop();this.rootElement.removeChild(u)}var s=t.getElementsByTagName("body");if(s&&s.length>0){var c=s[0];this.bodyNodes=(0,i.Kq)(c,this.rootElement)}(0,i.ME)()}}},{key:"enumerateObjectInstances",value:function(e){return o.J.enumerateObjectInstances(this.settings||o.J.getDefault(),e)}}])&&u(t.prototype,r),n&&u(t,n),e}()},194:(e,t,r)=>{function n(e,t,r){if(!e)return r;var n=e[t];return void 0===n?r:n}r.d(t,{N:()=>n})},463:(e,t,r)=>{r.d(t,{d9:()=>i});var n=r(194);function o(e){return(o="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"==typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e})(e)}function i(e,t,r){var i=function(e,t,r){return e?n.N(e[t.objectName],t.propertyName,r):r}(e,t,r);return i&&i.solid?i.solid.color:null==i||"object"===o(i)&&!i.solid?r:i}},634:(e,t,r)=>{r.d(t,{U:()=>i});var n=r(463);function o(e,t){for(var r=0;r<t.length;r++){var n=t[r];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(e,n.key,n)}}var i=function(){function e(){!function(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,e)}var t,r,i;return t=e,i=[{key:"getDefault",value:function(){return new this}},{key:"createPropertyIdentifier",value:function(e,t){return{objectName:e,propertyName:t}}},{key:"parse",value:function(e){var t,r=this.getDefault();if(!e||!e.metadata||!e.metadata.objects)return r;for(var o in t=r.getProperties())for(var i in t[o]){var a=r[o][i];r[o][i]=n.d9(e.metadata.objects,t[o][i],a)}return r}},{key:"isPropertyEnumerable",value:function(t){return!e.InnumerablePropertyPrefix.test(t)}},{key:"enumerateObjectInstances",value:function(e,t){var r=e&&e[t.objectName];if(!r)return[];var n={objectName:t.objectName,selector:null,properties:{}};for(var o in r)r.hasOwnProperty(o)&&(n.properties[o]=r[o]);return{instances:[n]}}}],(r=[{key:"getProperties",value:function(){var t=this,r={};return Object.keys(this).forEach((function(n){if(e.isPropertyEnumerable(n)){var o=Object.keys(t[n]);r[n]={},o.forEach((function(t){e.isPropertyEnumerable(n)&&(r[n][t]=e.createPropertyIdentifier(n,t))}))}})),r}}])&&o(t.prototype,r),i&&o(t,i),e}();i.InnumerablePropertyPrefix=/^_/},787:e=>{e.exports=Function("return this")()}},t={};function r(n){var o=t[n];if(void 0!==o)return o.exports;var i=t[n]={exports:{}};return e[n](i,i.exports,r),i.exports}r.d=(e,t)=>{for(var n in t)r.o(t,n)&&!r.o(e,n)&&Object.defineProperty(e,n,{enumerable:!0,get:t[n]})},r.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),r.r=e=>{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})};var n={};(()=>{r.r(n),r.d(n,{default:()=>i});var e=r(158),t=r(787).powerbi,o={name:"ScatterTaxiNYC1112",displayName:"ScatterTaxiNYC",class:"Visual",apiVersion:"2.6.0",create:function(t){if(e.u)return new e.u(t);throw"Visual instance not found"},custom:!0};void 0!==t&&(t.visuals=t.visuals||{},t.visuals.plugins=t.visuals.plugins||{},t.visuals.plugins.ScatterTaxiNYC1112=o);const i=o})(),ScatterTaxiNYC1112=n})();
//# sourceMappingURL=visual.js.map