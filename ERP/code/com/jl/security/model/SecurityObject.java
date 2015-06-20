package com.jl.security.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;
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
		this.id = StringUtils.trim(id);
	}
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		if(readonly){
			throw new SecurityRuntimeException();
		}
		this.name = StringUtils.trim(name);
	}
	@Transient
	public boolean isReadonly() {
		return readonly;
	}
	public void setReadonly(boolean readonly) {
		this.readonly = readonly;
	}
	@Override
	public int hashCode(){
		if(this.id == null){
			return 0;
		}
		return this.id.hashCode();
	}
}
