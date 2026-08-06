package com.ruoyi.iwms.domain;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 物料主数据 iwms_material
 *
 * @author ruoyi
 */
public class IwmsMaterial extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 物料ID */
    @Excel(name = "物料ID", cellType = ColumnType.NUMERIC)
    private Long materialId;

    /** 物料编码 */
    @Excel(name = "物料编码")
    private String materialCode;

    /** 物料名称 */
    @Excel(name = "物料名称")
    private String materialName;

    /** 规格型号 */
    @Excel(name = "规格型号")
    private String spec;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 分类 */
    @Excel(name = "分类")
    private String category;

    /** 最低库存（预警阈值） */
    @Excel(name = "最低库存", cellType = ColumnType.NUMERIC)
    private java.math.BigDecimal minStock;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public Long getMaterialId()
    {
        return materialId;
    }

    public void setMaterialId(Long materialId)
    {
        this.materialId = materialId;
    }

    @NotBlank(message = "物料编码不能为空")
    @Size(min = 0, max = 64, message = "物料编码长度不能超过64个字符")
    public String getMaterialCode()
    {
        return materialCode;
    }

    public void setMaterialCode(String materialCode)
    {
        this.materialCode = materialCode;
    }

    @NotBlank(message = "物料名称不能为空")
    @Size(min = 0, max = 128, message = "物料名称长度不能超过128个字符")
    public String getMaterialName()
    {
        return materialName;
    }

    public void setMaterialName(String materialName)
    {
        this.materialName = materialName;
    }

    @Size(min = 0, max = 128, message = "规格型号长度不能超过128个字符")
    public String getSpec()
    {
        return spec;
    }

    public void setSpec(String spec)
    {
        this.spec = spec;
    }

    @NotBlank(message = "单位不能为空")
    @Size(min = 0, max = 32, message = "单位长度不能超过32个字符")
    public String getUnit()
    {
        return unit;
    }

    public void setUnit(String unit)
    {
        this.unit = unit;
    }

    @Size(min = 0, max = 64, message = "分类长度不能超过64个字符")
    public String getCategory()
    {
        return category;
    }

    public void setCategory(String category)
    {
        this.category = category;
    }

    public java.math.BigDecimal getMinStock()
    {
        return minStock;
    }

    public void setMinStock(java.math.BigDecimal minStock)
    {
        this.minStock = minStock;
    }

    @NotNull(message = "状态不能为空")
    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("materialId", getMaterialId())
            .append("materialCode", getMaterialCode())
            .append("materialName", getMaterialName())
            .append("spec", getSpec())
            .append("unit", getUnit())
            .append("category", getCategory())
            .append("minStock", getMinStock())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
