package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.MemoVO;

public class MemoDAO {
	public static List<MemoVO> getList(){
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<MemoVO> list = ss.selectList("memo.total");
		ss.close();
		
		return list;
	}
	
	public static void add(MemoVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("memo.add", vo);
		if(cnt>0) {
			ss.commit();
		}else{
			ss.rollback();
		}
		ss.close();
		return;
	}
	
	public static MemoVO view(String idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		MemoVO vo = ss.selectOne("memo.view", idx);
		ss.close();
		return vo;
	}
	
	public static List<MemoVO> search(String type, String value){
		Map<String,String> map = new HashMap<String, String>();
		map.put("searchType", type);
		map.put("searchValue", value);
		SqlSession ss = FactoryService.getFactory().openSession();
		List<MemoVO> list = ss.selectList("memo.search", map);
		ss.close();
		return list;
	}
	
	public static boolean edit(String writer, String w_date, String content, String idx) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("writer", writer);
		map.put("reg_date", w_date);
		map.put("content", content);
		map.put("idx", idx);
		SqlSession ss = FactoryService.getFactory().openSession();
		boolean value = false;
		int cnt = ss.update("memo.edit", map);
		if(cnt > 0) {
			ss.commit();
			value = true;
		}else {
			ss.rollback();
		}
		ss.close();
		return value;
	}
}
