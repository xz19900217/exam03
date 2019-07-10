package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.entity.Invitation;
import com.kgc.entity.InvitationExample;
import com.kgc.mapper.InvitationMapper;
import com.kgc.service.InvitationService;
import com.kgc.utils.InvitationParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvitationServiceImpl implements InvitationService {
    @Autowired
    private InvitationMapper invitationMapper;
    @Override
    public boolean deleteInvitationById(Integer id) {
        return invitationMapper.deleteByPrimaryKey(id)>0?true:false;
    }

    @Override
    public PageInfo<Invitation> getListByPage(Integer pageIndex, Integer pageSize, InvitationParam invitationParam) {
        InvitationExample example=new InvitationExample();
        example.setOrderByClause("id");

        //example是dao曾的实体类，利用createCriteria创建cirteria对象，该对象带有操作数据库的各种方法。

        InvitationExample.Criteria criteria = example.createCriteria();

        if (invitationParam!=null){
            if (invitationParam.getTitle()!=null&&!invitationParam.getTitle().equals("")){
                criteria.andTitleLike("%"+invitationParam.getTitle()+"%");
            }
        }

        PageHelper.startPage(pageIndex,pageSize);
        List<Invitation> invitationsList = invitationMapper.selectByExample(example);

        PageInfo<Invitation> info=new PageInfo<>(invitationsList,4);
        return info;

    }

    @Override
    public List<Invitation> getAllStudent() {
        InvitationExample example=new InvitationExample();
        List<Invitation> list = invitationMapper.selectByExample(example);
        return list;
    }

    @Override
    public PageInfo<Invitation> getListByPage2(Integer page, Integer rows) {
        PageHelper.startPage(page,rows);
        //1.启动分页

        InvitationExample example=new InvitationExample();
        List<Invitation> list = invitationMapper.selectByExample(example);
        //2.调用持久化操作实现查询所有信息
        PageInfo<Invitation> pageInfo=new PageInfo<>(list);
        //3.创建pageinfo对象封装所有分页相关得信息
        return pageInfo;
    }
}
