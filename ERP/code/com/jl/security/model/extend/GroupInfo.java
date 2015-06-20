package com.jl.security.model.extend;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import com.jl.model.PersonalInfo;

@Entity
@DiscriminatorValue("1")
public class GroupInfo extends PersonalInfo {

}
