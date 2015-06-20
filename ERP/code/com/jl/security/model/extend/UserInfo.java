package com.jl.security.model.extend;

import javax.persistence.DiscriminatorValue;

import com.jl.model.PersonalInfo;
@DiscriminatorValue("2")
public class UserInfo extends PersonalInfo {

}
