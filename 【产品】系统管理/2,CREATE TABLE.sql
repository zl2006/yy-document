--1,字典表
CREATE TABLE `TB_USERADMIN_DICTIONARY` (
  `DIC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典ID',
  `DIC_CODE` char(32) NOT NULL COMMENT '字典编码',
  `NAME` char(64) NOT NULL COMMENT '字典名称',
  `VALUE` char(255) NOT NULL COMMENT '字典值',
  `ORDER_NO` int(11) NOT NULL DEFAULT '0' COMMENT '序号',
  `TYPE` char(16) NOT NULL COMMENT '字典类型',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `DESCRIPTION` char(255) DEFAULT NULL COMMENT '描述',
  `CREATE_TIME` timestamp NULL COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL COMMENT '更新时间',
  PRIMARY KEY (`DIC_ID`),
  KEY `AK_TB_USERADMIN_DICTIONARY` (`DIC_CODE`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';



--2,应用系统
CREATE TABLE `TB_USERADMIN_SYSTEM` (
  `SYSTEM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '应用系统ID',
  `SYSTEM_CODE` char(32) NOT NULL COMMENT '应用系统编号',
  `NAME` char(64) NOT NULL COMMENT '应用名称',
  `ICON` char(128) DEFAULT NULL COMMENT '应用图标',
  `URL` char(128) DEFAULT NULL COMMENT '应用URL',
  `DESCRIPTION` char(255) DEFAULT NULL COMMENT '描述',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '状态，0表示无效，1表示有效',
  `CREATE_TIME` timestamp  NULL  COMMENT '创建时间',
  `CREATE_PERSON` int(11) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp  NULL COMMENT '更新时间',
  `UPDATE_PERSON` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`SYSTEM_ID`),
  KEY `AK_TB_USERADMIN_SYSTEM` (`SYSTEM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用系统';



--3,角色
CREATE TABLE `TB_USERADMIN_ROLE` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `SYSTEM_CODE` char(32) DEFAULT NULL COMMENT '应用系统编号',
  `ROLE_CODE` char(32) NOT NULL COMMENT '角色编号',
  `NAME` char(64) NOT NULL COMMENT '角色名称',
  `DESCRIPTION` char(255) DEFAULT NULL COMMENT '角色描述',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '状态:0表示无效，1表示有效',
  `CREATE_TIME` timestamp NULL COMMENT '创建时间',
  `CREATE_PERSON` int(11) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL COMMENT '更新时间',
  `UPDATE_PERSON` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ROLE_ID`),
  KEY `AK_TB_USERADMIN_ROLE` (`ROLE_CODE`),
  KEY `FK_REF_ROLE_SYSTEM` (`SYSTEM_CODE`),
  CONSTRAINT `FK_REF_ROLE_SYSTEM` FOREIGN KEY (`SYSTEM_CODE`) REFERENCES `TB_USERADMIN_SYSTEM` (`SYSTEM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';



--4,日志表
CREATE TABLE `TB_USERADMIN_LOG` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `OPERATOR_ID` int(11) NOT NULL COMMENT '操作者ID',
  `OPER_NAME` char(32) NOT NULL COMMENT '操作者姓名',
  `OPER_TYPE` char(8) NOT NULL COMMENT '操作类型：增、删、改、查、审核等操作',
  `BUSI_DATA_TYPE` char(32) DEFAULT NULL COMMENT '业务数据类型:需求要字典中定义，格式一般为：系统编号_模块编号_业务编号组成',
  `BUIS_DATA_ID` int(11) DEFAULT NULL COMMENT '业务数据ID',
  `REMARK` char(255) DEFAULT NULL COMMENT '描述',
  `CREATE_TIME` timestamp NULL COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL COMMENT '更新时间',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';



--5,组织机构
CREATE TABLE `TB_USERADMIN_ORGAN` (
  `ORGAN_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '组织机构ID',
  `ORGAN_CODE` char(32) NOT NULL COMMENT '组织机构编号',
  `PARENT_ORGAN_CODE` char(32) NOT NULL DEFAULT '-1' COMMENT '父组织机构编号,-1表示顶级组织机构',
  `NAME` char(128) NOT NULL COMMENT '机构名称',
  `SNAME` char(128) DEFAULT NULL COMMENT '机构简称',
  `PRINCIPAL` char(64) DEFAULT NULL COMMENT '负责人',
  `SECOND_PRINCIPAL` char(64) DEFAULT NULL COMMENT '第二负责人',
  `TEL` char(32) DEFAULT NULL COMMENT '电话',
  `FAX` char(32) DEFAULT NULL COMMENT '传真',
  `POST_CODE` char(32) DEFAULT NULL COMMENT '邮编',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '状态 ： 1表示有效，0表示无效',
  `HAS_CHILD` int(11) DEFAULT '0' COMMENT '是否有子节点, 1表示有，0表示没有',
  `DESCRIPTION` char(255) DEFAULT NULL COMMENT '机构描述',
  `CREATE_TIME` timestamp NULL COMMENT '创建时间',
  `CREATE_PERSON` int(11) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL COMMENT '更新时间',
  `UPDATE_PERSON` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ORGAN_ID`),
  KEY `AK_TB_USERADMIN_ORGAN` (`ORGAN_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构';



--6,用户组
CREATE TABLE `TB_USERADMIN_USERGROUP` (
  `USERGROUP_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `GROUP_NAME` char(64) NOT NULL COMMENT '用户组名称',
  `DESCRIPTION` char(255) DEFAULT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '用户组状态:1为有效，0为无效',
  `CREATE_TIME` timestamp NULL  COMMENT '创建时间',
  `CREATE_PERSON` int(11) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL COMMENT '更新时间',
  `UPDATE_PERSON` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`USERGROUP_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户组';



--7,用户信息
CREATE TABLE `TB_USERADMIN_USER` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `LOGIN_ID` char(64) NOT NULL COMMENT '登录ID',
  `USERNAME` char(64) NOT NULL COMMENT '用户姓名',
  `PASSWORD` char(64) NOT NULL COMMENT '密码',
  `EMAIL` char(128) DEFAULT NULL COMMENT '邮箱',
  `TEL` char(32) DEFAULT NULL COMMENT '电话',
  `SEX` char(1) DEFAULT NULL COMMENT '性别:M男,F女',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '状态:1表示有效，0表示无效',
  `ADDRESS` char(255) DEFAULT NULL COMMENT '地址',
  `BIRTHDAY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生日',
  `LATNNO` char(16) DEFAULT NULL COMMENT '所属地市',
  `LOGIN_NUMBER` int(11) DEFAULT NULL COMMENT '登录次数',
  `TOKEN` char(64) DEFAULT NULL COMMENT '访问身份',
  `EXPIRE_DATE` timestamp  NULL  COMMENT '身份失效时间',
  `LAST_LOGIN_TIME` timestamp  NULL COMMENT '最后登录时间',
  `CREATE_TIME` timestamp NULL COMMENT '创建时间',
  `CREATE_PERSON` int(11) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL COMMENT '更新时间',
  `UPDATE_PERSON` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`USER_ID`),
  KEY `AK_TB_USERADMIN_USER` (`LOGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息';



--8,资源模块
CREATE TABLE `TB_USERADMIN_RESOURCE` (
  `RES_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `SYSTEM_CODE` char(32) NOT NULL COMMENT '应用系统编号',
  `PARENT_RES_ID` int(11) NOT NULL COMMENT '父资源ID,-1表示顶级系统资源',
  `NAME` char(64) NOT NULL COMMENT '资源名称',
  `ENAME` varchar(64) DEFAULT NULL,
  `URL` char(128) DEFAULT NULL COMMENT '资源位置',
  `TYPE` char(2) NOT NULL COMMENT '资源类型：0表示菜单（模块 ），1子模块，2表示功能, 3表示数据列表中的权限(按钮)。其中功能与数据列表中的权限都是挂在菜单下。在portal页面中，如果是平台则头部菜单挂系统和模板，左侧导航挂子模块和功能。如果是单个系统时头部菜单挂模块，左侧导航挂子模块和功能',
  `ICON` char(128) DEFAULT NULL COMMENT '资源图标',
  `ORDER_NO` int(11) NOT NULL DEFAULT '0' COMMENT '资源序号',
  `DESCRIPTION` char(255) DEFAULT NULL COMMENT '备注',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '状态, 0表示无效，1表示有效',
  `STYLE` char(128) DEFAULT NULL COMMENT '样式',
  `HAS_CHILD` int(1) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL COMMENT '创建时间',
  `CREATE_PERSON` int(11) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` timestamp NULL COMMENT '更新时间',
  `UPDATE_PERSON` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`RES_ID`),
  KEY `FK_REF_RESOURCE_SYSTEM` (`SYSTEM_CODE`),
  CONSTRAINT `FK_REF_RESOURCE_SYSTEM` FOREIGN KEY (`SYSTEM_CODE`) REFERENCES `TB_USERADMIN_SYSTEM` (`SYSTEM_CODE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='资源模块，主要指菜单资源、功能资源、数据列表操作资源';



--9,用户组角色关系
CREATE TABLE `TB_USERADMIN_GROUPROLEREL` (
  `ROLE_CODE` char(32) NOT NULL COMMENT '角色编号',
  `USERGROUP_ID` int(11) NOT NULL COMMENT '用户组ID',
  `CREATE_TIME` timestamp NULL,
  `UPDATE_TIME` timestamp  NULL,
  PRIMARY KEY (`ROLE_CODE`,`USERGROUP_ID`),
  KEY `FK_REF_ROLE_USERGROUP` (`USERGROUP_ID`),
  CONSTRAINT `FK_GROUPROLEREL_TO_ROLE` FOREIGN KEY (`ROLE_CODE`) REFERENCES `TB_USERADMIN_ROLE` (`ROLE_CODE`),
  CONSTRAINT `FK_REF_ROLE_USERGROUP` FOREIGN KEY (`USERGROUP_ID`) REFERENCES `TB_USERADMIN_USERGROUP` (`USERGROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组角色关系';



--10,角色与资源权限关系
CREATE TABLE `TB_USERADMIN_POPEDOM` (
  `ROLE_CODE` char(32) NOT NULL COMMENT '角色编码',
  `RES_ID` int(11) NOT NULL COMMENT '资源ID',
  `CREATE_TIME` timestamp  NULL,
  `UPDATE_TIME` timestamp  NULL,
  PRIMARY KEY (`ROLE_CODE`,`RES_ID`),
  KEY `FK_REF_ROLE_RES` (`RES_ID`),
  CONSTRAINT `FK_REF_RES_ROLE` FOREIGN KEY (`ROLE_CODE`) REFERENCES `TB_USERADMIN_ROLE` (`ROLE_CODE`),
  CONSTRAINT `FK_REF_ROLE_RES` FOREIGN KEY (`RES_ID`) REFERENCES `TB_USERADMIN_RESOURCE` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与资源权限关系';



--11,用户组与用户关系
CREATE TABLE `TB_USERADMIN_USERGROUPREL` (
  `LOGIN_ID` char(64) NOT NULL COMMENT '登录ID',
  `USERGROUP_ID` int(11) NOT NULL COMMENT '用户组ID',
  `CREATE_TIME` timestamp  NULL ,
  `UPDATE_TIME` timestamp NULL,
  PRIMARY KEY (`LOGIN_ID`,`USERGROUP_ID`),
  KEY `FK_REF_USER_USERGROUP` (`USERGROUP_ID`),
  CONSTRAINT `FK_REF_GROUP_USER` FOREIGN KEY (`LOGIN_ID`) REFERENCES `TB_USERADMIN_USER` (`LOGIN_ID`),
  CONSTRAINT `FK_REF_USER_USERGROUP` FOREIGN KEY (`USERGROUP_ID`) REFERENCES `TB_USERADMIN_USERGROUP` (`USERGROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组与用户关系';



--12,用户组织机构关系
CREATE TABLE `TB_USERADMIN_USERORGANREL` (
  `LOGIN_ID` char(64) NOT NULL COMMENT '登录ID',
  `ORGAN_CODE` char(32) NOT NULL COMMENT '组织机构编号',
  `CREATE_TIME` timestamp  NULL COMMENT '创建时间',
  `UPDATE_TIME` timestamp  NULL COMMENT '更新时间',
  PRIMARY KEY (`ORGAN_CODE`,`LOGIN_ID`),
  KEY `FK_REF_ORGAN_USER` (`LOGIN_ID`),
  CONSTRAINT `FK_REF_ORGAN_USER` FOREIGN KEY (`LOGIN_ID`) REFERENCES `TB_USERADMIN_USER` (`LOGIN_ID`),
  CONSTRAINT `FK_REF_USER_ORGAN` FOREIGN KEY (`ORGAN_CODE`) REFERENCES `TB_USERADMIN_ORGAN` (`ORGAN_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组织机构关系';



--13,用户与角色关系
CREATE TABLE `TB_USERADMIN_USERROLEREL` (
  `LOGIN_ID` char(64) NOT NULL COMMENT '登录ID',
  `ROLE_CODE` char(32) NOT NULL COMMENT '角色编号',
  `CREATE_TIME` timestamp  NULL,
  `UPDATE_TIME` timestamp  NULL,
  PRIMARY KEY (`LOGIN_ID`,`ROLE_CODE`),
  KEY `FK_REF_USER_ROLE` (`ROLE_CODE`),
  CONSTRAINT `FK_REF_ROLE_USER` FOREIGN KEY (`LOGIN_ID`) REFERENCES `TB_USERADMIN_USER` (`LOGIN_ID`),
  CONSTRAINT `FK_REF_USER_ROLE` FOREIGN KEY (`ROLE_CODE`) REFERENCES `TB_USERADMIN_ROLE` (`ROLE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色关系';



