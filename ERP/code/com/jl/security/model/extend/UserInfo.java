package com.jl.security.model.extend;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import com.jl.model.PersonalInfo;

@Entity
@DiscriminatorValue("2")
public class UserInfo extends PersonalInfo {

}
