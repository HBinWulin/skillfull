// +----------------------------------------------------------------------
// | SkillFull快速开发平台 [ SkillFull ]
// +----------------------------------------------------------------------
// | 版权所有 2020~2021 zxiaozhou
// +----------------------------------------------------------------------
// | 官方网站: https://www.divisu.com
// +----------------------------------------------------------------------
// | 作者: zxiaozhou <z7630853@163.com>
// +----------------------------------------------------------------------
package indi.zxiaozhou.skillfull.auth.modules.rbac.service.mapstruct.dto;

import indi.zxiaozhou.skillfull.auth.modules.rbac.entity.RbacRoleEntity;
import indi.zxiaozhou.skillfull.auth.modules.rbac.service.dto.RbacRoleDto;
import indi.zxiaozhou.skillfull.coremvc.base.service.mapstruct.BaseDtoMap;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

/**
 * 角色表(RbacRole)Dto与Entity相互转换
 *
 * @author zxiaozhou
 * @since 2020-10-08 13:44:04
 */
@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface RbacRoleDtoMap extends BaseDtoMap<RbacRoleDto, RbacRoleEntity> {
}