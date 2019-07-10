package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.entity.Invitation;
import com.kgc.utils.InvitationParam;

import java.util.List;

public interface InvitationService {
    public boolean deleteInvitationById(Integer id);
    public PageInfo<Invitation> getListByPage(Integer pageIndex, Integer pageSize, InvitationParam invitationParam);
    public List<Invitation> getAllStudent();
    public PageInfo<Invitation> getListByPage2(Integer page,Integer rows);
}
