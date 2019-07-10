package com.kgc.mapper;

import com.kgc.entity.Replydetail;
import com.kgc.entity.ReplydetailExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReplydetailMapper {
    long countByExample(ReplydetailExample example);

    int deleteByExample(ReplydetailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Replydetail record);

    int insertSelective(Replydetail record);

    List<Replydetail> selectByExample(ReplydetailExample example);

    Replydetail selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Replydetail record, @Param("example") ReplydetailExample example);

    int updateByExample(@Param("record") Replydetail record, @Param("example") ReplydetailExample example);

    int updateByPrimaryKeySelective(Replydetail record);

    int updateByPrimaryKey(Replydetail record);
}