package am.dao;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import am.factory.FactoryService;
import am.vo.EmpVO;
public class EmpDAO {
	//원하는 Mapper를 호출하여 각 메서드들을 정의
	//public static EmpVO searchNo(int no){ //int type으로 받는 경우
	//	String n = String.valueOf(no); //mapper의 parameterType과 맞춰야한다.
	public static EmpVO getSearchEmpno(String empno){
		SqlSession ss = FactoryService.getFactory().openSession();
		EmpVO vo = ss.selectOne("Emp.searchEmpno",empno);
		ss.close();
		return vo;
	}
	
	//동적쿼리를 활용하는 메서드
	public static List<EmpVO> search(String type, String value){
		//MyBatis환경으로 인자를 2개 이상을 보낼 때는 한번에 보내야 한다.
		//이때 보편적으로 많이 사용되는 것이 바로 Map구조다.
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", type);// "searchType" ----> "0/1/2"
		map.put("searchValue", value);// "searchValue" ----> "input입력값"
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<EmpVO> list = ss.selectList("Emp.search", map);
		ss.close();
		return list;
	}
	
	public static void edit(String no, String name, String job, String sal){
		Map<String, String> map = new HashMap<String, String>();
		map.put("ename", name);
		map.put("job", job);
		map.put("sal", sal);
		map.put("empno", no);
		SqlSession ss = FactoryService.getFactory().openSession(true);
		ss.update("Emp.edit", map);
		ss.close();
		return;
	}
	
	//선생님 코드
	public static boolean edit1(String empno, String ename, String job, String sal) {
		//MyBatis의 Mapper를 호출하기 위해 Map구조를 준비! parameterType이 Map
		//Map<key=변수명, value=값> - value에는 객체들이 들어갈수 있다(map, list, vo 등등 다 가능)
		Map<String, String> map = new Hashtable<String, String>();
		
		int count = 0; //Map구조에 값이 저장되는 수
		
		/*EmpVO vo = EmpDAO.getSearchEmpno(empno);
		String num = vo.getEmpno();
		if(num != null) {}*/
		
		//empno는 유효성 검사를 했다는 전제 하에 입력을 해야만 넘어오기때문에 if문을 넣지않아도 된다.
		if(empno != null && empno.trim().length()>0) {
			map.put("empno", empno);
		}
		//인자인 ename이 비어있지 않다면 map에 추가한다.
		if(ename != null && ename.trim().length()>0) {
			map.put("ename", ename);
			count++;
		}
		if(job != null && job.trim().length()>0) {
			map.put("job", job);
			count++;
		}
		if(sal != null && sal.trim().length()>0) {
			map.put("sal", sal);
			count++;
		}
		boolean value = false;
		SqlSession ss = FactoryService.getFactory().openSession();
		//사번을 제외한 나머지 값들 중 하나라도 Map에 저장되었을 때만 MyBatis의 Mapper를 호출한다.
		if(count > 0) {
			//update의 반환형 int : 바뀐 행의 갯수 반환
			int cnt = ss.update("Emp.edit", map);
			if(cnt > 0) {
				//DB의 내용을 적용하고 새로운 트랜잭션을 생성하라는 의미의 commit을 수행한다.
				ss.commit();//DB적용!
				//ss.close();
				//return true;
				value = true;
			} /*else {
				ss.close();
				return false;
			}*/
		} /*else {
			return false;
		}*/
		ss.close();
		return value;
	}
	
	public static boolean add(EmpVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("Emp.add", vo);
		boolean value = false;
		//cnt가 0보다 크다는 것은 1개의 레코드가 추가완료 됐다는 뜻이다.
		//이때만 value의 값을 true로 변경하여 완료의 의미를 가지도록 한다.
		if(cnt > 0) {
			ss.commit();
			value = true;
		}else {
			ss.rollback();//DB에서의 모든 작업을 실행 취소한 후 트랜잭션(기록지)을 새롭게 생성(시작)한다.
		}
		ss.close();
		return value;
	}
}
