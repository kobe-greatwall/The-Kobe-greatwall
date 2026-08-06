package com.ruoyi.iwms.service;

import java.util.List;
import com.ruoyi.iwms.domain.IwmsMaterial;

/**
 * 物料主数据 Service接口
 *
 * @author ruoyi
 */
public interface IIwmsMaterialService
{
    /**
     * 查询物料数据集合
     *
     * @param material 物料信息
     * @return 物料数据集合
     */
    public List<IwmsMaterial> selectIwmsMaterialList(IwmsMaterial material);

    /**
     * 通过物料ID查询物料信息
     *
     * @param materialId 物料ID
     * @return 物料信息
     */
    public IwmsMaterial selectIwmsMaterialById(Long materialId);

    /**
     * 新增物料信息
     *
     * @param material 物料信息
     * @return 结果
     */
    public int insertIwmsMaterial(IwmsMaterial material);

    /**
     * 修改物料信息
     *
     * @param material 物料信息
     * @return 结果
     */
    public int updateIwmsMaterial(IwmsMaterial material);

    /**
     * 批量删除物料信息
     *
     * @param materialIds 需要删除的物料ID
     * @return 结果
     */
    public int deleteIwmsMaterialByIds(Long[] materialIds);

    /**
     * 删除物料信息
     *
     * @param materialId 物料ID
     * @return 结果
     */
    public int deleteIwmsMaterialById(Long materialId);

    /**
     * 校验物料编码是否唯一
     *
     * @param material 物料信息
     * @return 结果
     */
    public boolean checkMaterialCodeUnique(IwmsMaterial material);
}
