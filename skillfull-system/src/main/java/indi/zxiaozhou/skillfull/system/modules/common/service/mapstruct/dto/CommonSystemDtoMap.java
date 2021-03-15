// +----------------------------------------------------------------------
// | SkillFull快速开发平台 [ SkillFull ]
// +----------------------------------------------------------------------
// | 版权所有 2020~2021 zxiaozhou
// +----------------------------------------------------------------------
// | 官方网站: https://www.divisu.com
// +----------------------------------------------------------------------
// | 作者: zxiaozhou <z7630853@163.com>
// +----------------------------------------------------------------------
package indi.zxiaozhou.skillfull.system.modules.common.service.mapstruct.dto;

import indi.zxiaozhou.skillfull.coremvc.base.service.mapstruct.BaseDtoMap;
import indi.zxiaozhou.skillfull.system.modules.common.entity.CommonSystemEntity;
import indi.zxiaozhou.skillfull.system.modules.common.service.dto.CommonSystemDto;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

/**
 * 系统表(CommonSystem)Dto与Entity相互转换
 *
 * @author zxiaozhou
 * @since 2020-11-02 09:25:38
 */
@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface CommonSystemDtoMap extends BaseDtoMap<CommonSystemDto, CommonSystemEntity> {
}