-- ----------------------------
-- 智能仓储 IWMS 菜单与权限初始化
-- menu_id 从 2000 起，避免与若依默认菜单冲突
-- 通过后台「菜单管理」导入或执行脚本
-- ----------------------------

-- 一级目录：智能仓储
insert into sys_menu values('2000', '智能仓储', '0', '5', 'iwms', null, '', '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', sysdate(), '', null, '智能仓储目录');

-- 二级菜单
insert into sys_menu values('2001', '仓储看板', '2000', '1', 'dashboard', 'iwms/dashboard/index', '', '', 1, 0, 'C', '0', '0', 'iwms:dashboard:view', 'chart', 'admin', sysdate(), '', null, '仓储看板菜单');
insert into sys_menu values('2002', '物料管理', '2000', '2', 'material', 'iwms/material/index', '', '', 1, 0, 'C', '0', '0', 'iwms:material:list', 'product', 'admin', sysdate(), '', null, '物料管理菜单');
insert into sys_menu values('2003', '库存管理', '2000', '3', 'inventory', null, '', '', 1, 0, 'M', '0', '0', '', 'storage', 'admin', sysdate(), '', null, '库存管理目录');
insert into sys_menu values('2006', '出入库管理', '2000', '4', 'stock', null, '', '', 1, 0, 'M', '0', '0', '', 'enter', 'admin', sysdate(), '', null, '出入库管理目录');

-- 库存管理子菜单
insert into sys_menu values('2004', '当前库存', '2003', '1', 'index', 'iwms/inventory/index', '', '', 1, 0, 'C', '0', '0', 'iwms:inventory:list', 'list', 'admin', sysdate(), '', null, '当前库存菜单');
insert into sys_menu values('2005', '库存流水', '2003', '2', 'log', 'iwms/inventory/log', '', '', 1, 0, 'C', '0', '0', 'iwms:inventory:log', 'form', 'admin', sysdate(), '', null, '库存流水菜单');

-- 出入库管理子菜单
insert into sys_menu values('2007', '入库操作', '2006', '1', 'inbound', 'iwms/stock/inbound', '', '', 1, 0, 'C', '0', '0', 'iwms:stock:in', 'download', 'admin', sysdate(), '', null, '入库操作菜单');
insert into sys_menu values('2008', '出库操作', '2006', '2', 'outbound', 'iwms/stock/outbound', '', '', 1, 0, 'C', '0', '0', 'iwms:stock:out', 'upload', 'admin', sysdate(), '', null, '出库操作菜单');
insert into sys_menu values('2009', '操作记录', '2006', '3', 'record', 'iwms/stock/record', '', '', 1, 0, 'C', '0', '0', 'iwms:stock:list', 'edit', 'admin', sysdate(), '', null, '操作记录菜单');

-- ----------------------------
-- 按钮权限（F 类型，menu_id 从 2100 起）
-- ----------------------------

-- 物料管理按钮
insert into sys_menu values('2100', '物料查询', '2002', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'iwms:material:query', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('2101', '物料新增', '2002', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'iwms:material:add', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('2102', '物料修改', '2002', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'iwms:material:edit', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('2103', '物料删除', '2002', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'iwms:material:remove', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('2104', '物料导出', '2002', '5', '#', '', '', '', 1, 0, 'F', '0', '0', 'iwms:material:export', '#', 'admin', sysdate(), '', null, '');

-- 当前库存按钮
insert into sys_menu values('2110', '库存查询', '2004', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'iwms:inventory:query', '#', 'admin', sysdate(), '', null, '');

-- 操作记录按钮
insert into sys_menu values('2120', '记录查询', '2009', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'iwms:stock:query', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('2121', '记录导出', '2009', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'iwms:stock:export', '#', 'admin', sysdate(), '', null, '');

-- ----------------------------
-- 授权给 admin 角色（角色ID=1）
-- ----------------------------
insert into sys_role_menu (role_id, menu_id) values (1, 2000);
insert into sys_role_menu (role_id, menu_id) values (1, 2001);
insert into sys_role_menu (role_id, menu_id) values (1, 2002);
insert into sys_role_menu (role_id, menu_id) values (1, 2003);
insert into sys_role_menu (role_id, menu_id) values (1, 2004);
insert into sys_role_menu (role_id, menu_id) values (1, 2005);
insert into sys_role_menu (role_id, menu_id) values (1, 2006);
insert into sys_role_menu (role_id, menu_id) values (1, 2007);
insert into sys_role_menu (role_id, menu_id) values (1, 2008);
insert into sys_role_menu (role_id, menu_id) values (1, 2009);
insert into sys_role_menu (role_id, menu_id) values (1, 2100);
insert into sys_role_menu (role_id, menu_id) values (1, 2101);
insert into sys_role_menu (role_id, menu_id) values (1, 2102);
insert into sys_role_menu (role_id, menu_id) values (1, 2103);
insert into sys_role_menu (role_id, menu_id) values (1, 2104);
insert into sys_role_menu (role_id, menu_id) values (1, 2110);
insert into sys_role_menu (role_id, menu_id) values (1, 2120);
insert into sys_role_menu (role_id, menu_id) values (1, 2121);
