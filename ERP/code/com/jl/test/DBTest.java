package com.jl.test;

import java.util.List;
import java.util.function.Consumer;

import org.hibernate.Session;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;

import com.jl.initialize.config.RootConfig;
import com.jl.security.model.Group;
import com.jl.security.model.Role;
import com.jl.security.model.User;
import com.jl.security.model.extend.GroupInfo;
import com.jl.security.model.extend.UserInfo;

public class DBTest {
	public static void main(String[]args){
		insertSecurity();
	}
	public static void insertSecurity(){
		executeSession(s->{
			int roleCount = 10;
			for(int i = 0; i < roleCount; i++){
				Role role = new Role();
				role.setName("ROLE_Test_" + (i+1));
				s.save(role);
			}
			s.flush();
			
			GroupInfo groupInfo = new GroupInfo();
			groupInfo.setCode("System");
			groupInfo.setName("系統管理");
			groupInfo.setNameEng("System Manager");
			s.save(groupInfo);
			s.flush();
			
			Group group = new Group();
			group.setInfo(groupInfo);
			s.save(group);
			s.flush();
			
			List<Role> roles = s.createCriteria(Role.class).list();
			group.getRoles().addAll(roles);
			s.flush();
			
			UserInfo userInfo = new UserInfo();
			userInfo.setCode("System_root");
			userInfo.setName("系統管理員");
			userInfo.setNameEng("System manager");
			s.save(userInfo);
			s.flush();
			
			User user = new User();
			user.setUserId("root");
			user.setPassword("sysmanager");
			user.setDefaultGroup(group);
			user.setInfo(userInfo);
			s.save(user);
			s.flush();
		});
		
		
		
		
		
	}
	public static void executeSession(Consumer<Session>c){
		AnnotationConfigApplicationContext acac = new AnnotationConfigApplicationContext(RootConfig.class);
		Session s = null;
		try{
			s = acac.getBean(LocalSessionFactoryBean.class).getObject().openSession();
			c.accept(s);
		}catch(Throwable e){
			e.printStackTrace();
		}finally{
			
			if(s !=null && s.isOpen()){
				s.close();
			}
			acac.close();
		}
	}
}
