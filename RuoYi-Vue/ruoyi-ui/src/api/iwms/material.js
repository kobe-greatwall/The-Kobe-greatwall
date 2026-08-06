import request from '@/utils/request'

// 查询物料列表
export function listMaterial(query) {
  return request({
    url: '/iwms/material/list',
    method: 'get',
    params: query
  })
}

// 查询物料详细
export function getMaterial(materialId) {
  return request({
    url: '/iwms/material/' + materialId,
    method: 'get'
  })
}

// 新增物料
export function addMaterial(data) {
  return request({
    url: '/iwms/material',
    method: 'post',
    data: data
  })
}

// 修改物料
export function updateMaterial(data) {
  return request({
    url: '/iwms/material',
    method: 'put',
    data: data
  })
}

// 删除物料
export function delMaterial(materialId) {
  return request({
    url: '/iwms/material/' + materialId,
    method: 'delete'
  })
}

// 导出物料
export function exportMaterial(query) {
  return request({
    url: '/iwms/material/export',
    method: 'post',
    data: query
  })
}
