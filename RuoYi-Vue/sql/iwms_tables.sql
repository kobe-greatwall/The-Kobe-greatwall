-- ----------------------------
-- 智能仓储 IWMS 业务表
-- 统一 iwms_ 前缀，公共字段沿用若依 BaseEntity 约定
-- ----------------------------

-- ----------------------------
-- 1. 物料主数据
-- ----------------------------
DROP TABLE IF EXISTS iwms_material;
CREATE TABLE iwms_material (
  material_id     bigint(20)    NOT NULL AUTO_INCREMENT COMMENT '物料ID',
  material_code   varchar(64)   NOT NULL COMMENT '物料编码',
  material_name   varchar(128)  NOT NULL COMMENT '物料名称',
  spec            varchar(128)  DEFAULT '' COMMENT '规格型号',
  unit            varchar(32)   NOT NULL COMMENT '单位',
  category        varchar(64)   DEFAULT '' COMMENT '分类',
  min_stock       decimal(12,2) DEFAULT 0.00 COMMENT '最低库存（预警阈值）',
  status          char(1)       DEFAULT '0' COMMENT '状态（0正常 1停用）',
  create_by       varchar(64)   DEFAULT '' COMMENT '创建者',
  create_time     datetime      DEFAULT NULL COMMENT '创建时间',
  update_by       varchar(64)   DEFAULT '' COMMENT '更新者',
  update_time     datetime      DEFAULT NULL COMMENT '更新时间',
  remark          varchar(500)  DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (material_id),
  UNIQUE KEY uk_iwms_material_code (material_code)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='物料主数据';

-- ----------------------------
-- 2. 当前库存
-- ----------------------------
DROP TABLE IF EXISTS iwms_inventory;
CREATE TABLE iwms_inventory (
  inventory_id    bigint(20)    NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  material_id     bigint(20)    NOT NULL COMMENT '关联物料ID',
  quantity        decimal(12,2) DEFAULT 0.00 COMMENT '当前数量',
  warehouse_code  varchar(32)   DEFAULT 'DEFAULT' COMMENT '仓库编码（预留）',
  location_code   varchar(32)   DEFAULT NULL COMMENT '库位编码（预留CTU）',
  update_by       varchar(64)   DEFAULT '' COMMENT '更新者',
  update_time     datetime      DEFAULT NULL COMMENT '更新时间',
  remark          varchar(500)  DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (inventory_id),
  UNIQUE KEY uk_iwms_inventory_material (material_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='当前库存';

-- ----------------------------
-- 3. 出入库单据主表
-- ----------------------------
DROP TABLE IF EXISTS iwms_stock_bill;
CREATE TABLE iwms_stock_bill (
  bill_id         bigint(20)    NOT NULL AUTO_INCREMENT COMMENT '单据ID',
  bill_no         varchar(64)   NOT NULL COMMENT '单号',
  bill_type       char(1)       NOT NULL COMMENT '类型（1入库 2出库）',
  bill_status     char(1)       DEFAULT '0' COMMENT '状态（0已完成 1已取消）',
  total_qty       decimal(12,2) DEFAULT 0.00 COMMENT '合计数量',
  operator        varchar(64)   DEFAULT '' COMMENT '操作人',
  operate_time    datetime      DEFAULT NULL COMMENT '操作时间',
  source_type     varchar(32)   DEFAULT 'MANUAL' COMMENT '来源（MANUAL/RCS 预留）',
  create_by       varchar(64)   DEFAULT '' COMMENT '创建者',
  create_time     datetime      DEFAULT NULL COMMENT '创建时间',
  update_by       varchar(64)   DEFAULT '' COMMENT '更新者',
  update_time     datetime      DEFAULT NULL COMMENT '更新时间',
  remark          varchar(500)  DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (bill_id),
  UNIQUE KEY uk_iwms_stock_bill_no (bill_no),
  KEY idx_iwms_bill_type_time (bill_type, operate_time)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='出入库单据主表';

-- ----------------------------
-- 4. 出入库单据明细
-- ----------------------------
DROP TABLE IF EXISTS iwms_stock_bill_detail;
CREATE TABLE iwms_stock_bill_detail (
  detail_id       bigint(20)    NOT NULL AUTO_INCREMENT COMMENT '明细ID',
  bill_id         bigint(20)    NOT NULL COMMENT '关联主表ID',
  material_id     bigint(20)    NOT NULL COMMENT '物料ID',
  material_code   varchar(64)   DEFAULT '' COMMENT '物料编码（冗余）',
  material_name   varchar(128)  DEFAULT '' COMMENT '物料名称（冗余）',
  quantity        decimal(12,2) NOT NULL COMMENT '本次数量',
  before_qty      decimal(12,2) DEFAULT 0.00 COMMENT '操作前库存',
  after_qty       decimal(12,2) DEFAULT 0.00 COMMENT '操作后库存',
  PRIMARY KEY (detail_id),
  KEY idx_iwms_detail_bill (bill_id),
  KEY idx_iwms_detail_material (material_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='出入库单据明细';

-- ----------------------------
-- 5. 库存流水
-- ----------------------------
DROP TABLE IF EXISTS iwms_inventory_log;
CREATE TABLE iwms_inventory_log (
  log_id          bigint(20)    NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  material_id     bigint(20)    NOT NULL COMMENT '物料ID',
  change_type     char(1)       NOT NULL COMMENT '变动类型（1入库 2出库 3调整）',
  change_qty      decimal(12,2) NOT NULL COMMENT '变动数量（出库为负）',
  before_qty      decimal(12,2) DEFAULT 0.00 COMMENT '变动前库存',
  after_qty       decimal(12,2) DEFAULT 0.00 COMMENT '变动后库存',
  bill_no         varchar(64)   DEFAULT '' COMMENT '关联单号',
  operator        varchar(64)   DEFAULT '' COMMENT '操作人',
  create_time     datetime      DEFAULT NULL COMMENT '流水时间',
  remark          varchar(500)  DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (log_id),
  KEY idx_iwms_log_material (material_id),
  KEY idx_iwms_log_bill (bill_no)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='库存流水';

-- ----------------------------
-- 预留表（第二阶段 / RCS-2000）
-- ----------------------------

-- 仓库
DROP TABLE IF EXISTS iwms_warehouse;
CREATE TABLE iwms_warehouse (
  warehouse_id    bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '仓库ID',
  warehouse_code  varchar(32)  NOT NULL COMMENT '仓库编码',
  warehouse_name  varchar(64)  NOT NULL COMMENT '仓库名称',
  status          char(1)      DEFAULT '0' COMMENT '状态（0正常 1停用）',
  remark          varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (warehouse_id),
  UNIQUE KEY uk_iwms_warehouse_code (warehouse_code)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='仓库';

-- 库位（CTU 点位）
DROP TABLE IF EXISTS iwms_location;
CREATE TABLE iwms_location (
  location_id     bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '库位ID',
  warehouse_code  varchar(32)  DEFAULT 'DEFAULT' COMMENT '仓库编码',
  location_code   varchar(32)  NOT NULL COMMENT '库位编码',
  location_type   varchar(32)  DEFAULT NULL COMMENT '库位类型（CTU等预留）',
  status          char(1)      DEFAULT '0' COMMENT '状态（0空闲 1占用）',
  remark          varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (location_id),
  UNIQUE KEY uk_iwms_location_code (location_code)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='库位';

-- RCS 调度任务
DROP TABLE IF EXISTS iwms_task;
CREATE TABLE iwms_task (
  task_id         bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  task_no         varchar(64)  NOT NULL COMMENT '任务号',
  task_type       varchar(32)  DEFAULT NULL COMMENT '任务类型',
  task_status     varchar(32)  DEFAULT NULL COMMENT '任务状态',
  start_location  varchar(32)  DEFAULT NULL COMMENT '起始库位',
  end_location    varchar(32)  DEFAULT NULL COMMENT '目标库位',
  bill_no         varchar(64)  DEFAULT NULL COMMENT '关联单据号',
  create_time     datetime     DEFAULT NULL COMMENT '创建时间',
  finish_time     datetime     DEFAULT NULL COMMENT '完成时间',
  remark          varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (task_id),
  UNIQUE KEY uk_iwms_task_no (task_no)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='RCS调度任务';
