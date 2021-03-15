// +----------------------------------------------------------------------
// | SkillFull快速开发平台 [ SkillFull ]
// +----------------------------------------------------------------------
// | 版权所有 2020~2021 zxiaozhou
// +----------------------------------------------------------------------
// | 官方网站: https://www.divisu.com
// +----------------------------------------------------------------------
// | 作者: zxiaozhou <z7630853@163.com>
// +----------------------------------------------------------------------
package indi.zxiaozhou.skillfull;

import cn.hutool.core.collection.CollectionUtil;
import indi.zxiaozhou.skillfull.process.modules.design.controller.ModelDesignController;
import indi.zxiaozhou.skillfull.process.modules.manage.controller.vo.DeploymentVo;
import indi.zxiaozhou.skillfull.process.modules.manage.service.IDefinitionManageService;
import indi.zxiaozhou.skillfull.process.modules.manage.service.ITaskManageService;
import org.camunda.bpm.engine.FormService;
import org.camunda.bpm.engine.RepositoryService;
import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.engine.TaskService;
import org.camunda.bpm.engine.form.FormField;
import org.camunda.bpm.engine.form.TaskFormData;
import org.camunda.bpm.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.camunda.bpm.engine.repository.DecisionRequirementsDefinition;
import org.camunda.bpm.engine.repository.Deployment;
import org.camunda.bpm.engine.repository.ProcessDefinition;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.camunda.bpm.engine.task.Task;
import org.camunda.bpm.engine.variable.VariableMap;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest
class ApplicationTests {
	@Value("classpath:bpmn/leave.bpmn")
	private Resource resource;
    @Autowired
	private  TaskService taskService;
	@Autowired
	private  FormService formService;
	@Autowired
	private ModelDesignController controller;
	@Autowired
	private  RuntimeService runtimeService;
	@Autowired
	private  RepositoryService repositoryService;
	@Autowired
	private IDefinitionManageService definitionManageService;
	@Autowired
	private ITaskManageService iTaskManageService;


	/**
	 * 创建部署
	 *
	 * @author zxiaozhou
	 * @date 2020-10-14 16:54
	 */
	@Test
	void createDeployment()  {
		DeploymentVo vo = new DeploymentVo();
		vo.setDeploymentName("流程测试");
		vo.setModelId("1316774166734094336");
		definitionManageService.createDeployment(vo);
	}

	@Test
	void deleteDeploy(){
		System.out.println("e87c209f-0e85-11eb-9546-a6102d2472ef".length());
        definitionManageService.deleteDeployment("e87c209f-0e85-11eb-9546-a6102d2472");
	}

	@Test
	void createProcessInstance(){
		String processDefinitionId = "leave:4:20170fbc-11e4-11eb-84fd-fa223f8baeff";
//		ProcessInstance processInstance = runtimeService.startProcessInstanceById(processDefinitionId);
//		System.out.println(processInstance);
//		String processInstance = iTaskManageService.createProcessInstance(processDefinitionId);

//		System.out.println("-----processInstance------"+processInstance);

	}

	@Test
	void queryTask(){
		Task task = taskService.createTaskQuery()
				.processInstanceId("00daf60f-11b3-11eb-a433-aed3a5d663d6")
				.singleResult();
		System.out.println(task);
	}

	@Test
	void queryStartForm(){
		Object renderedStartForm = formService.getRenderedStartForm("leave:2:4f6b5577-11e1-11eb-b6c4-fa223f8baeff");
		System.out.println("----renderedStartForm--1---"+renderedStartForm);
		VariableMap startFormVariables = formService.getStartFormVariables("leave:2:4f6b5577-11e1-11eb-b6c4-fa223f8baeff");
		System.out.println("----startFormVariables--2---"+startFormVariables);
		Object juel = formService.getRenderedStartForm("leave:2:4f6b5577-11e1-11eb-b6c4-fa223f8baeff", "juel");
		System.out.println("-----juel-----"+juel);
	}


	@Test
	void queryTaskForm(){
		Task task = taskService.createTaskQuery()
				.processInstanceId("37b6d303-11ea-11eb-82aa-b6a4cd2e3c7f")
				.singleResult();
		System.out.println("--------"+task.getId());
		TaskFormData taskFormData = formService.getTaskFormData(task.getId());
		System.out.println("----taskFormData-----"+taskFormData);
		Object juel = formService.getRenderedTaskForm(task.getId());
		System.out.println("----juel------"+juel);
		List<FormField> formFields = taskFormData.getFormFields();
		if (CollectionUtil.isNotEmpty(formFields)) {
			for (FormField formField : formFields) {
				System.out.println("---FormField------"+formField);
			}
		}

	}

	@Test
	void taskComplete(){
          Map<String,Object> map=new HashMap<>();
          map.put("day","4");
		map.put("startTime", "15/10/2020");
		map.put("endTime", "18/10/2020");
		map.put("applyName","周玄红");
		map.put("applyUserId","zxiaozhou");
		map.put("group_leader_id","zxiaozhou2");
		Task task = taskService.createTaskQuery()
				.processInstanceId("37b6d303-11ea-11eb-82aa-b6a4cd2e3c7f")
				.singleResult();
		System.out.println("--------taskid---1---" + task.getId());
		System.out.println("--------getAssignee----2--" + task.getAssignee());
		System.out.println("--------getAssignee---222---" + task.getParentTaskId());
		Object renderedTaskForm = formService.getRenderedTaskForm(task.getId());
		System.out.println("--------taskFormData--------"+renderedTaskForm);
		TaskFormData taskFormData = formService.getTaskFormData(task.getId());
		List<FormField> formFields = taskFormData.getFormFields();
		for (FormField formField : formFields) {
			System.out.println("----formField------"+formField);
		}
		List<Task> subTasks = taskService.getSubTasks(task.getParentTaskId());
		System.out.println("----subTasks-----"+subTasks);
		for (Task task1 : subTasks) {
			List<Task> subTasks2 = taskService.getSubTasks(task1.getId());
			System.out.println("-----task1-----"+subTasks2);
		}
//		taskService.complete(task.getId(),map);

	}


	/** 
	 * 部署分页查询
	 *
	
	
	 * @author zxiaozhou
	 * @date 2020-10-14 16:54
	 */
	@Test
	void queryPage(){
		List<Deployment> deployments = repositoryService.createDeploymentQuery()
				.deploymentNameLike("请假流%")
//				.deploymentAfter(new Date())
//				.deploymentBefore(new Date())
				.orderByDeploymentTime().asc()
				.orderByDeploymentName().asc()
				.listPage(1, 10);
		List<ProcessDefinition> list2 = repositoryService.createProcessDefinitionQuery().processDefinitionKey("leave").list();
		for (ProcessDefinition definition : list2) {
			if (definition instanceof ProcessDefinitionEntity) {
				ProcessDefinitionEntity definitionEntity = (ProcessDefinitionEntity)definition;
				System.out.println("-------1-----"+definitionEntity);
				System.out.println("-------1---22--"+definitionEntity.getDeploymentId());
				System.out.println("----getKey---1---22--"+definitionEntity.getKey());
				System.out.println("----getVersion---1---22--"+definitionEntity.getVersion());
				repositoryService.updateProcessDefinitionSuspensionState().byProcessDefinitionId(definitionEntity.getId()).suspend();
			}
		}


		System.out.println("------------ProcessDefinition--list2------"+list2);
		System.out.println("------------deployments--111------"+deployments);
		List<DecisionRequirementsDefinition> list = repositoryService.createDecisionRequirementsDefinitionQuery().listPage(1, 10);
		System.out.println("------------deployments---222-----"+list);
		List<Task> list1 = taskService.createTaskQuery().active().list();


	}

	@Test
	void queryDecisionDefinition(){

		ProcessDefinition definition = repositoryService.createProcessDefinitionQuery().deploymentId("0c2dfd9c-0e82-11eb-a201-a6102d2472ef").singleResult();
		System.out.println("----queryDeployment----"+definition);

	}

	@Test
	void setRuntimeService(){
		List<ProcessInstance> list = runtimeService.createProcessInstanceQuery().list();
		System.out.println("----list-----"+list);
		for (ProcessInstance processInstance : list) {
			System.out.println("-----list---getProcessDefinitionId----" + processInstance.getProcessDefinitionId());
			System.out.println("-----list----getId---" + processInstance.getId());
			System.out.println("-----list----getBusinessKey---" + processInstance.getBusinessKey());
			System.out.println("-----list----getProcessInstanceId---" + processInstance.getProcessInstanceId());
		}
		System.out.println("-------------------------");
		System.out.println(runtimeService.createIncidentQuery().list());
		System.out.println(runtimeService.createNativeProcessInstanceQuery().list());

		ProcessInstance processInstance = runtimeService.startProcessInstanceById("leave:12:2e2b811d-0dfa-11eb-a09f-acde48001122");
//		System.out.println("--processInstance------" + processInstance.getProcessDefinitionId());
//		System.out.println("--processInstance------" + processInstance.getId());
//		System.out.println("--processInstance------" + processInstance.getBusinessKey());
	}


}
