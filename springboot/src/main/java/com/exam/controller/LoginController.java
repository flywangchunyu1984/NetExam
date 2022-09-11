package com.exam.controller;

import com.exam.entity.*;
import com.exam.serviceimpl.LoginServiceImpl;
import com.exam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class LoginController {

    @Autowired
    private LoginServiceImpl loginService;

    @PostMapping("/login")
    public ApiResult login(@RequestBody Login login) {

//    	Integer username = login.getUsername();
    	String email = login.getEmail();
        String password = login.getPassword();
        Admin adminRes = loginService.adminLogin(email, password);
        if (adminRes != null) {
            return ApiResultHandler.buildApiResult(200, "请求成功", adminRes);
        }

        Teacher teacherRes = loginService.teacherLogin(email,password);
        if (teacherRes != null) {
            return ApiResultHandler.buildApiResult(200, "请求成功", teacherRes);
        }

        Student studentRes = loginService.studentLogin(email,password);
        if (studentRes != null) {
            return ApiResultHandler.buildApiResult(200, "请求成功", studentRes);
        }

        return ApiResultHandler.buildApiResult(400, "请求失败", null);
    }
}
