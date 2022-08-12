package com.exam.controller;

import com.exam.entity.*;
import com.exam.serviceimpl.FillQuestionServiceImpl;
import com.exam.serviceimpl.JudgeQuestionServiceImpl;
import com.exam.serviceimpl.MultiQuestionServiceImpl;
import com.exam.serviceimpl.PaperServiceImpl;
import com.exam.util.ApiResultHandler;
import com.exam.util.GetRandomInt;
import com.exam.util.Md5Hash;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class PaperController {

    @Autowired
    private PaperServiceImpl paperService;

    @Autowired
    private JudgeQuestionServiceImpl judgeQuestionService;

    @Autowired
    private MultiQuestionServiceImpl multiQuestionService;

    @Autowired
    private FillQuestionServiceImpl fillQuestionService;
    
    @Value("${netexamquestioncount}")
    private String QuestionCount;//������Ŀ����
    
    @GetMapping("/papers")
    public ApiResult<PaperManage> findAll() {
       ApiResult res =  ApiResultHandler.buildApiResult(200,"����ɹ�",paperService.findAll());
       return  res;
    }

    @GetMapping("/paper/{paperId}")
    public Map<Integer, List<?>> findById(@PathVariable("paperId") Integer paperId) {
        List<MultiQuestion> multiQuestionRes = multiQuestionService.findByIdAndType(paperId);   //ѡ������� 1
        List<FillQuestion> fillQuestionsRes = fillQuestionService.findByIdAndType(paperId);     //�������� 2
        List<JudgeQuestion> judgeQuestionRes = judgeQuestionService.findByIdAndType(paperId);   //�ж������ 3
        List<MultiQuestion> multiQuestionRes_res = new ArrayList<MultiQuestion>();
        Integer  QuestionCountloacl = Integer.valueOf(QuestionCount);
        Map<Integer, List<?>> map = new HashMap<>();
        if (multiQuestionRes.size() > QuestionCountloacl){
        	int[] arr = GetRandomInt.getRandomInt(QuestionCountloacl, multiQuestionRes.size());
        	
        	for (int i = 0; i < arr.length; i++) {
        		multiQuestionRes_res.add(multiQuestionRes.get(arr[i]));
            }
        	map.put(1,md5Convert(multiQuestionRes_res));
        }else {
        	map.put(1,md5Convert(multiQuestionRes));
        }
             
        map.put(2,fillQuestionsRes);
        map.put(3,judgeQuestionRes);
        return  map;
    }

    @PostMapping("/paperManage")
    public ApiResult add(@RequestBody PaperManage paperManage) {
        int res = paperService.add(paperManage);
        if (res != 0) {
            return ApiResultHandler.buildApiResult(200,"��ӳɹ�",res);
        }
        return ApiResultHandler.buildApiResult(400,"���ʧ��",res);
    }
    
    public List<MultiQuestion> md5Convert(List<MultiQuestion> multiQuestionTmp) {
    	List<MultiQuestion> multiQuestion_out = new ArrayList<MultiQuestion>();
    	for (MultiQuestion multiQuestion : multiQuestionTmp) {
			//multiQuestion.setRightAnswer(Md5Hash.convertMD5(multiQuestion.getRightAnswer()));
			multiQuestion.setRightAnswer(Md5Hash.getStringMD5(multiQuestion.getRightAnswer()));
    		multiQuestion_out.add(multiQuestion);
        }
    	return multiQuestion_out;
    }
}
