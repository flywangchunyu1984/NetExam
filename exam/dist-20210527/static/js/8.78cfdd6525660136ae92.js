webpackJsonp([8],{jyvV:function(t,e){},wP8f:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var o=a("Dd8w"),l=a.n(o),i={data:function(){return{form:{},pagination:{current:1,total:null,size:4},dialogVisible:!1}},created:function(){this.getExamInfo()},methods:{edit:function(t){var e=this;this.dialogVisible=!0,this.$axios("/api/exam/"+t).then(function(t){200==t.data.code&&(e.form=t.data.data)})},handleClose:function(t){this.$confirm("确认关闭？").then(function(e){t()}).catch(function(t){})},submit:function(){var t=this;this.dialogVisible=!1,this.$axios({url:"/api/exam",method:"put",data:l()({},this.form)}).then(function(e){200==e.data.code&&t.$message({message:"更新成功",type:"success"}),t.getExamInfo()})},deleteRecord:function(t){var e=this;this.$confirm("确定删除该记录吗,该操作不可逆！！！","删除提示",{confirmButtonText:"确定删除",cancelButtonText:"算了,留着",type:"danger"}).then(function(){e.$axios({url:"/api/exam/"+t,method:"delete"}).then(function(t){e.getExamInfo()})}).catch(function(){})},getExamInfo:function(){var t=this;this.$axios("/api/exams/"+this.pagination.current+"/"+this.pagination.size).then(function(e){t.pagination=e.data.data}).catch(function(t){})},handleSizeChange:function(t){this.pagination.size=t,this.getExamInfo()},handleCurrentChange:function(t){this.pagination.current=t,this.getExamInfo()}}},n={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"exam"},[a("el-table",{attrs:{data:t.pagination.records,border:""}},[a("el-table-column",{attrs:{fixed:"left",prop:"source",label:"试卷名称",width:"180"}}),t._v(" "),a("el-table-column",{attrs:{prop:"description",label:"介绍",width:"200"}}),t._v(" "),a("el-table-column",{attrs:{prop:"institute",label:"所属学院",width:"120"}}),t._v(" "),a("el-table-column",{attrs:{prop:"major",label:"所属专业",width:"200"}}),t._v(" "),a("el-table-column",{attrs:{prop:"grade",label:"年级",width:"100"}}),t._v(" "),a("el-table-column",{attrs:{prop:"examDate",label:"考试日期",width:"120"}}),t._v(" "),a("el-table-column",{attrs:{prop:"totalTime",label:"持续时间",width:"120"}}),t._v(" "),a("el-table-column",{attrs:{prop:"totalScore",label:"总分",width:"120"}}),t._v(" "),a("el-table-column",{attrs:{prop:"type",label:"试卷类型",width:"120"}}),t._v(" "),a("el-table-column",{attrs:{prop:"tips",label:"考生提示",width:"400"}}),t._v(" "),a("el-table-column",{attrs:{fixed:"right",label:"操作",width:"150"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{type:"primary",size:"small"},on:{click:function(a){return t.edit(e.row.examCode)}}},[t._v("编辑")]),t._v(" "),a("el-button",{attrs:{type:"danger",size:"small"},on:{click:function(a){return t.deleteRecord(e.row.examCode)}}},[t._v("删除")])]}}])})],1),t._v(" "),a("el-pagination",{staticClass:"page",attrs:{"current-page":t.pagination.current,"page-sizes":[4,8,10,20],"page-size":t.pagination.size,layout:"total, sizes, prev, pager, next, jumper",total:t.pagination.total},on:{"size-change":t.handleSizeChange,"current-change":t.handleCurrentChange}}),t._v(" "),a("el-dialog",{attrs:{title:"编辑试卷信息",visible:t.dialogVisible,width:"30%","before-close":t.handleClose},on:{"update:visible":function(e){t.dialogVisible=e}}},[a("section",{staticClass:"update"},[a("el-form",{ref:"form",attrs:{model:t.form,"label-width":"80px"}},[a("el-form-item",{attrs:{label:"试卷名称"}},[a("el-input",{model:{value:t.form.source,callback:function(e){t.$set(t.form,"source",e)},expression:"form.source"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"介绍"}},[a("el-input",{model:{value:t.form.description,callback:function(e){t.$set(t.form,"description",e)},expression:"form.description"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"所属学院"}},[a("el-input",{model:{value:t.form.institute,callback:function(e){t.$set(t.form,"institute",e)},expression:"form.institute"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"所属专业"}},[a("el-input",{model:{value:t.form.major,callback:function(e){t.$set(t.form,"major",e)},expression:"form.major"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"年级"}},[a("el-input",{model:{value:t.form.grade,callback:function(e){t.$set(t.form,"grade",e)},expression:"form.grade"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"考试日期"}},[a("el-col",{attrs:{span:11}},[a("el-date-picker",{staticStyle:{width:"100%"},attrs:{type:"date",placeholder:"选择日期"},model:{value:t.form.examDate,callback:function(e){t.$set(t.form,"examDate",e)},expression:"form.examDate"}})],1)],1),t._v(" "),a("el-form-item",{attrs:{label:"持续时间"}},[a("el-input",{model:{value:t.form.totalTime,callback:function(e){t.$set(t.form,"totalTime",e)},expression:"form.totalTime"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"总分"}},[a("el-input",{model:{value:t.form.totalScore,callback:function(e){t.$set(t.form,"totalScore",e)},expression:"form.totalScore"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"试卷类型"}},[a("el-input",{model:{value:t.form.type,callback:function(e){t.$set(t.form,"type",e)},expression:"form.type"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"考生提示"}},[a("el-input",{attrs:{type:"textarea"},model:{value:t.form.tips,callback:function(e){t.$set(t.form,"tips",e)},expression:"form.tips"}})],1)],1)],1),t._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(e){t.dialogVisible=!1}}},[t._v("取 消")]),t._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.submit()}}},[t._v("确 定")])],1)])],1)},staticRenderFns:[]};var r=a("VU/8")(i,n,!1,function(t){a("jyvV")},"data-v-b1ada0c4",null);e.default=r.exports}});
//# sourceMappingURL=8.78cfdd6525660136ae92.js.map