webpackJsonp([26],{UwNN:function(t,a){},qpvD:function(t,a,n){"use strict";Object.defineProperty(a,"__esModule",{value:!0});var i={data:function(){return{loading:!1,key:null,allExam:null,pagination:{current:1,total:null,size:10}}},created:function(){this.getExamInfo(),this.loading=!0},methods:{getExamInfo:function(){var t=this;this.$axios("/api/exams/"+this.pagination.current+"/"+this.pagination.size).then(function(a){t.pagination=a.data.data,t.loading=!1,console.log(t.pagination)}).catch(function(t){console.log(t)})},handleSizeChange:function(t){this.pagination.size=t,this.getExamInfo()},handleCurrentChange:function(t){this.pagination.current=t,this.getExamInfo()},search:function(){var t=this;this.$axios("/api/exams").then(function(a){if(200==a.data.code){var n=a.data.data.filter(function(a){return a.source.includes(t.key)});t.pagination.records=n}})},toExamMsg:function(t){this.$router.push({path:"/examMsg",query:{examCode:t}}),console.log(t)}}},e={render:function(){var t=this,a=t.$createElement,n=t._self._c||a;return n("div",{attrs:{id:"myExam"}},[n("div",{staticClass:"title"},[t._v("我的试卷")]),t._v(" "),n("div",{staticClass:"wrapper"},[n("ul",{staticClass:"top"},[n("li",{staticClass:"order"},[t._v("试卷列表")]),t._v(" "),n("li",{staticClass:"search-li"},[n("div",{staticClass:"icon"},[n("input",{directives:[{name:"model",rawName:"v-model",value:t.key,expression:"key"}],staticClass:"search",attrs:{type:"text",placeholder:"试卷名称"},domProps:{value:t.key},on:{input:function(a){a.target.composing||(t.key=a.target.value)}}}),n("i",{staticClass:"el-icon-search"})])]),t._v(" "),n("li",[n("el-button",{attrs:{type:"primary"},on:{click:function(a){return t.search()}}},[t._v("搜索试卷")])],1)]),t._v(" "),n("ul",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"paper"},t._l(t.pagination.records,function(a,i){return n("li",{key:i,staticClass:"item"},[n("h4",{on:{click:function(n){return t.toExamMsg(a.examCode)}}},[t._v(t._s(a.source))]),t._v(" "),n("div",{staticClass:"info"},[n("i",{staticClass:"el-icon-loading"}),n("span",[t._v(t._s(a.examDate.substr(0,10)))]),t._v(" "),n("i",{staticClass:"iconfont icon-icon-time"}),null!=a.totalTime?n("span",[t._v("限时"+t._s(a.totalTime)+"分钟")]):t._e(),t._v(" "),n("i",{staticClass:"iconfont icon-fenshu"}),n("span",[t._v("满分"+t._s(a.totalScore)+"分")])])])}),0),t._v(" "),n("div",{staticClass:"pagination"},[n("el-pagination",{attrs:{"current-page":t.pagination.current,"page-sizes":[8,10,20,40],"page-size":t.pagination.size,layout:"total, sizes, prev, pager, next, jumper",total:t.pagination.total},on:{"size-change":t.handleSizeChange,"current-change":t.handleCurrentChange}})],1)])])},staticRenderFns:[]};var s=n("VU/8")(i,e,!1,function(t){n("UwNN")},"data-v-041af1e4",null);a.default=s.exports}});
//# sourceMappingURL=26.3919e0299fca8a95f0f6.js.map