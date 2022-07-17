package com.exam.util;

import java.util.Random;

public class GetRandomInt {
	public static int[] getRandomInt(int arrLen, int randomLen) {
        Random random1=new Random();
        int[] arr=new int[arrLen];//默认每个元素为0

        //给数组全部赋默认值-1
        for (int i = 0; i < arr.length; i++) {
            arr[i]=-1;
        }

        //下标从0开始到4结束，一共循环5次
        int index=0;
        while (index<arr.length){
            int num=random1.nextInt(randomLen);
            //如果没有找到这个num则继续往里面存
            if(PanDuan(arr,num)){
                arr[index]=num;
                index++;
            }
        }

        //遍历数组
        //for (int i = 0; i < arr.length; i++) {
            //System.out.print(arr[i]+" ");
        //}
        return arr;
    }
    public static boolean PanDuan(int[] arr,int num){
        //for循环查找这个随机数
        for (int i = 0; i < arr.length; i++) {
            //若找到了 返回false
            if(num==arr[i])
                return false;
        }
        //找不到 返回true
        return true;
    }
}
