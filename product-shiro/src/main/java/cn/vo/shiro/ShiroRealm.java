package cn.vo.shiro;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import cn.vo.pojo.Module;
import cn.vo.pojo.User;
import cn.vo.service.IModuleService;
import cn.vo.service.IUserService;

public class ShiroRealm extends AuthorizingRealm{
	
	@Autowired
	private IUserService iUserService;
	
	@Autowired
	private IModuleService iModuleService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		User user=(User) principals.getPrimaryPrincipal();
		if(user==null){
			return null;
		}
		
		List<Module> modules=null;
		try {
			modules=iModuleService.getByUserId(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		//单独定一个集合对象 
		List<String> moduleList = new ArrayList<String>();
		if(modules.size()>0){
			for(int i=0; i<modules.size();i++){
				//将数据库中的权限标签 符放入集合
				moduleList.add(modules.get(i).getCode());
			}
		}
		//查到权限数据，返回授权信息(要包括 上边的permissions)
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		//将上边查询到授权信息填充到simpleAuthorizationInfo对象中
		simpleAuthorizationInfo.addStringPermissions(moduleList);
		return simpleAuthorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		String loginName=token.getUsername();
		String password=String.valueOf(token.getPassword());
		User user=iUserService.getByLoginName(loginName);
		if(user!=null){
			if(!user.getPassword().equals(password)){
				return null;
			}
			 SimpleAuthenticationInfo simpleAuthenticationInfo = 
					 new SimpleAuthenticationInfo(user, user.getPassword().toString(), this.getName());
			 this.setSession("USER", user);
			 this.setSession("userName", user.getUsername());
			 return simpleAuthenticationInfo;
		}
		return null;
	}
	public void clearCached(){
		PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
        super.clearCache(principals);
	}
	
	private void setSession(Object key, Object value){
		Subject currentUser = SecurityUtils.getSubject();
		if(null!=currentUser){
			Session session=currentUser.getSession();
			if(null!=session){
				session.setAttribute(key, value);
			}
		
		}
	}
}
