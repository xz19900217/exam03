package com.kgc.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Invitation;
import com.kgc.service.InvitationService;
import com.kgc.utils.InvitationParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class InvitationController {
    @Autowired
    private InvitationService invitationService;
    @RequestMapping("/index")
    public String index(@RequestParam(value = "pageIndex",defaultValue = "1")Integer pageIndex,
                        @RequestParam(value = "pageSize",defaultValue = "4")Integer pageSize,
                        InvitationParam invitationParam,
                        Model model){

        PageInfo<Invitation> info = invitationService.getListByPage(pageIndex, pageSize, invitationParam);
        model.addAttribute("info",info);
        model.addAttribute("invitationParam",invitationParam);

        return "index";
    }
   @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String deletd(@PathVariable("id") Integer id){
        if (invitationService.deleteInvitationById(id)){
            return "<script>alert('删除成功');location.href='/index'</script>";
        }else{
            return "<script>alert('删除失败');history.go(-1);</script>";
        }


       }
    @RequestMapping("/getData")
    @ResponseBody
    public List<Invitation> list(){
        List<Invitation> list = invitationService.getAllStudent();
        return list;
    }

@RequestMapping("/getDataByPage")
@ResponseBody
    public Map<String,Object> getListByPage2(Integer page,Integer rows){
    //调用业务查询所有学生
    PageInfo<Invitation> pageInfo = invitationService.getListByPage2(page, rows);
    //创建Map集合
    Map<String,Object> map=new HashMap<>();
    map.put("total",pageInfo.getTotal());
    map.put("rows",pageInfo.getList());

    return map;
    }
}
