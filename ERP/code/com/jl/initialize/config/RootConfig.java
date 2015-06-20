package com.jl.initialize.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.mariadb.jdbc.MySQLDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;

@Configuration
@ComponentScan(basePackages={"com.jl.service"})
public class RootConfig {
	@Bean
	public DataSource dataSource(){
		MySQLDataSource ds = new MySQLDataSource();
		ds.setUrl("jdbc:mariadb://localhost:3306/angrycat");
		ds.setUser("root");
		return ds;
	}
	@Bean
	public LocalSessionFactoryBean sessionFactory(DataSource ds){
		LocalSessionFactoryBean lsfb = new LocalSessionFactoryBean();
		lsfb.setDataSource(ds);
		lsfb.setPackagesToScan("com.jl.model", "com.jl.security.model");
		
		Properties props = new Properties();
		props.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
		props.setProperty("hibernate.show_sql", "true");
		props.setProperty("hibernate.jdbc.batch_size", "100");
		// connection pool: dbcp
		props.setProperty("hibernate.connection.provider_class", "com.mkyong.util.DBCPConnectionProvider");
		props.setProperty("hibernate.dbcp.initialSize", "10");
		props.setProperty("hibernate.dbcp.maxActive", "20");
		props.setProperty("hibernate.dbcp.maxIdle", "20");
		props.setProperty("hibernate.dbcp.minIdle", "10");
		lsfb.setHibernateProperties(props);
		
		return lsfb;
	}
}
