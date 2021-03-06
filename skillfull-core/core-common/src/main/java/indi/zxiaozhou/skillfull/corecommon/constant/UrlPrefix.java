// +----------------------------------------------------------------------
// | SkillFull快速开发平台 [ SkillFull ]
// +----------------------------------------------------------------------
// | 版权所有 2020~2021 zxiaozhou
// +----------------------------------------------------------------------
// | 官方网站: https://www.divisu.com
// +----------------------------------------------------------------------
// | 作者: zxiaozhou <z7630853@163.com>
// +----------------------------------------------------------------------
package indi.zxiaozhou.skillfull.corecommon.constant;

/**
 * 模块或服务controller统一请求前缀
 *
 * @author zxiaozhou
 * @date 2021-03-05 12:58
 * @since JDK1.8
 */
public interface UrlPrefix {
    /**
     * auth模块或服务统一controller url前缀
     */
    String AUTH = "/auth";

    /**
     * gen模块或服务统一controller url前缀
     */
    String GEN = "/gen";

    /**
     * job模块或服务统一controller url前缀
     */
    String JOB = "/job";

    /**
     * logging模块或服务统一controller url前缀
     */
    String LOGGING = "/logging";

    /**
     * message模块或服务统一controller url前缀
     */
    String MESSAGE = "/message";

    /**
     * process模块或服务统一controller url前缀
     */
    String PROCESS = "/process";

    /**
     * storage模块或服务统一controller url前缀
     */
    String STORAGE = "/storage";

    /**
     * system模块或服务统一controller url前缀
     */
    String SYSTEM = "/system";
}

