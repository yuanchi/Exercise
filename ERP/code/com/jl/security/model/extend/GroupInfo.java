package com.jl.security.model.extend;

import javax.persistence.DiscriminatorValue;

import com.jl.model.PersonalInfo;

@DiscriminatorValue("1")
public class GroupInfo extends PersonalInfo {

}
