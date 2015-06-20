package com.jl.security.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.GenericGenerator;

@MappedSuperclass
public abstract class SecurityObject {
	private String id;
	private String name;
	private boolean readonly;
	@Id
	@GenericGenerator(strategy="com.jl.ds.TimeUID", name="security_id")
	@GeneratedValue(generator="security_id")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		if(readonly){
			throw new SecurityRuntimeException();
		}
		this.id = id;
	}
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		if(readonly){
			throw new SecurityRuntimeException();
		}
		this.name = name;
	}
	public boolean isReadonly() {
		return readonly;
	}
	public void setReadonly(boolean readonly) {
		this.readonly = readonly;
	}
}
