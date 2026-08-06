package com.ruoyi.iwms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.iwms.domain.IwmsMaterial;
import com.ruoyi.iwms.mapper.IwmsMaterialMapper;
import com.ruoyi.iwms.service.IIwmsMaterialService;

/**
 * 物料主数据 服务层处理
 *
 * @author ruoyi
 */
@Service
public class IwmsMaterialServiceImpl implements IIwmsMaterialService
{
    @Autowired
    private IwmsMaterialMapper materialMapper;

    /**
     * 查询物料信息集合
     *
     * @param material 物料信息
     * @return 物料信息集合
     */
    @Override
    public List<IwmsMaterial> selectIwmsMaterialList(IwmsMaterial material)
    {
        return materialMapper.selectIwmsMaterialList(material);
    }

    /**
     * 通过物料ID查询物料信息
     *
     * @param materialId 物料ID
     * @return 物料信息
     */
    @Override
    public IwmsMaterial selectIwmsMaterialById(Long materialId)
    {
        return materialMapper.selectIwmsMaterialById(materialId);
    }

    /**
     * 新增物料信息
     *
     * @param material 物料信息
     * @return 结果
     */
    @Override
    public int insertIwmsMaterial(IwmsMaterial material)
    {
        return materialMapper.insertIwmsMaterial(material);
    }

    /**
     * 修改物料信息
     *
     * @param material 物料信息
     * @return 结果
     */
    @Override
    public int updateIwmsMaterial(IwmsMaterial material)
    {
        return materialMapper.updateIwmsMaterial(material);
    }

    /**
     * 批量删除物料信息
     *
     * @param materialIds 需要删除的物料ID
     * @return 结果
     */
    @Override
    public int deleteIwmsMaterialByIds(Long[] materialIds)
    {
        return materialMapper.deleteIwmsMaterialByIds(materialIds);
    }

    /**
     * 删除物料信息
     *
     * @param materialId 物料ID
     * @return 结果
     */
    @Override
    public int deleteIwmsMaterialById(Long materialId)
    {
        return materialMapper.deleteIwmsMaterialById(materialId);
    }

    /**
     * 校验物料编码是否唯一
     *
     * @param material 物料信息
     * @return 结果
     */
    @Override
    public boolean checkMaterialCodeUnique(IwmsMaterial material)
    {
        Long materialId = StringUtils.isNull(material.getMaterialId()) ? -1L : material.getMaterialId();
        IwmsMaterial info = materialMapper.checkMaterialCodeUnique(material.getMaterialCode());
        if (StringUtils.isNotNull(info) && info.getMaterialId().longValue() != materialId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }
}
