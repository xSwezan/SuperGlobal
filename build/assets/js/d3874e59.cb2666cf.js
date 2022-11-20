"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[374],{3905:(e,t,r)=>{r.d(t,{Zo:()=>m,kt:()=>f});var n=r(67294);function a(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function c(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function o(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?c(Object(r),!0).forEach((function(t){a(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):c(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function l(e,t){if(null==e)return{};var r,n,a=function(e,t){if(null==e)return{};var r,n,a={},c=Object.keys(e);for(n=0;n<c.length;n++)r=c[n],t.indexOf(r)>=0||(a[r]=e[r]);return a}(e,t);if(Object.getOwnPropertySymbols){var c=Object.getOwnPropertySymbols(e);for(n=0;n<c.length;n++)r=c[n],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(a[r]=e[r])}return a}var i=n.createContext({}),s=function(e){var t=n.useContext(i),r=t;return e&&(r="function"==typeof e?e(t):o(o({},t),e)),r},m=function(e){var t=s(e.components);return n.createElement(i.Provider,{value:t},e.children)},u={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},p=n.forwardRef((function(e,t){var r=e.components,a=e.mdxType,c=e.originalType,i=e.parentName,m=l(e,["components","mdxType","originalType","parentName"]),p=s(r),f=a,d=p["".concat(i,".").concat(f)]||p[f]||u[f]||c;return r?n.createElement(d,o(o({ref:t},m),{},{components:r})):n.createElement(d,o({ref:t},m))}));function f(e,t){var r=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var c=r.length,o=new Array(c);o[0]=p;var l={};for(var i in t)hasOwnProperty.call(t,i)&&(l[i]=t[i]);l.originalType=e,l.mdxType="string"==typeof e?e:a,o[1]=l;for(var s=2;s<c;s++)o[s]=r[s];return n.createElement.apply(null,o)}return n.createElement.apply(null,r)}p.displayName="MDXCreateElement"},4167:(e,t,r)=>{r.r(t),r.d(t,{HomepageFeatures:()=>v,default:()=>O});var n=r(87462),a=r(67294),c=r(3905);const o={toc:[]};function l(e){let{components:t,...r}=e;return(0,c.kt)("wrapper",(0,n.Z)({},o,r,{components:t,mdxType:"MDXLayout"}))}l.isMDXComponent=!0;var i=r(39960),s=r(52263),m=r(73576),u=r(86010);const p="heroBanner_e1Bh",f="buttons_VwD3",d="features_WS6B",y="featureSvg_tqLR",E=[{title:"Easy To Use",description:"This Library is Easy To Use with straight a forward API"}];function b(e){let{image:t,title:r,description:n}=e;return a.createElement("div",{className:(0,u.Z)("col col--4")},t&&a.createElement("div",{className:"text--center"},a.createElement("img",{className:y,alt:r,src:t})),a.createElement("div",{className:"text--center padding-horiz--md"},a.createElement("h3",null,r),a.createElement("p",null,n)))}function v(){return E?a.createElement("section",{className:d},a.createElement("div",{className:"container"},a.createElement("div",{className:"row"},E.map(((e,t)=>a.createElement(b,(0,n.Z)({key:t},e))))))):null}function g(){const{siteConfig:e}=(0,s.Z)();return a.createElement("header",{className:(0,u.Z)("hero",p)},a.createElement("div",{className:"container"},a.createElement("h1",{className:"hero__title"},e.title),a.createElement("p",{className:"hero__subtitle"},e.tagline),a.createElement("div",{className:f},a.createElement(i.Z,{className:"button button--secondary button--lg",to:"/docs/intro"},"Get Started \u2192"))))}function O(){const{siteConfig:e,tagline:t}=(0,s.Z)();return a.createElement(m.Z,{title:e.title,description:t},a.createElement(g,null),a.createElement("main",null,a.createElement(v,null),a.createElement("div",{className:"container"},a.createElement(l,null))))}}}]);