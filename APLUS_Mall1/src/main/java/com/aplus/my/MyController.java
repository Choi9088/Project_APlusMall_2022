package com.aplus.my;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aplus.model.MemberVO;
import com.aplus.order.OrderVO;

@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);
	@Autowired
	private MyService myservice;


	/* 마이페이지 메인 */
	@RequestMapping(value = "/mymain", method = RequestMethod.GET)
	public String mymainGET(Model model, HttpSession session, MemberVO vo) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 마이 페이지 진입");

		String memInfo = (String) session.getAttribute("id"); /* 세션 id가져오기 */
		vo = myservice.member(memInfo);// 고객 정보 가져오기
		model.addAttribute("member", vo);

		return "my/myMain";
	}

	/* 회원정보 수정 페이지 */
	@RequestMapping(value = "/myupdate", method = { RequestMethod.GET, RequestMethod.POST })
	public String myupdateGET(Model model, HttpSession session, MemberVO vo) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 정보수정 페이지 진입");

		String memInfo = (String) session.getAttribute("id"); /* 세션 id가져오기 */
		vo = myservice.member(memInfo); /* 고객 정보 가져오기 */
		model.addAttribute("member", vo);

		return "my/myUpdate";
	}

	/* 회원정보 수정 실행 */
	@RequestMapping(value = "/myUpdateAction", method = RequestMethod.POST)
	public String myUpdateAction(String memInfo, MemberVO vo) throws Exception {

		myservice.myUpdate(vo);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 정보수정 실행" + vo);

		return "my/myMain";
	}

	/* 회원탈퇴시 leave 1로 변경 */
	@RequestMapping(value = "/memberLeave", method = { RequestMethod.GET, RequestMethod.POST })

	public String reviewUp(MemberVO vo, Model model, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");

		String memInfo = (String) session.getAttribute("id"); /* 세션 id가져오기 */
		vo = myservice.member(memInfo); /* 고객 정보 가져오기 */

		myservice.memberLeave(vo);

		session.invalidate(); /* 세션 종료 */

		return "redirect:/main";
	}

	/* 주문조회 페이지 */
	@RequestMapping(value = "/myorder", method = { RequestMethod.GET, RequestMethod.POST })
	public String myorderGET(Model model, OrderVO vo, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 주문조회 페이지 진입");

		String id = (String) session.getAttribute("id"); /* 세션 id가져오기 */
		vo.setId(id); /* OrderVO에 세션 id 저장 */
		
		List<OrderVO> orderlist = myservice.myOrder(id);
		model.addAttribute("order", orderlist); /* 로그인 회원 주문정보 가져오기 */

		return "my/myOrder";
	}

	/* 포인트 조회 페이지 */
	@RequestMapping(value = "/mypoint", method = RequestMethod.GET)
	public String mypointGET(Model model, HttpSession session, MemberVO vo) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 포인트 조회 페이지 진입");

		String memInfo = (String) session.getAttribute("id"); /* 세션 id가져오기 */
		vo = myservice.member(memInfo); /* 고객 정보 가져오기 */
		model.addAttribute("member", vo);

		return "my/myPoint";
	}

	/* 포인트 충전 */
	@RequestMapping(value = "/mypointUpdateAction", method = RequestMethod.POST)
	public String mypointUpdateAction(Model model, HttpSession session, MemberVO vo) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 포인트 조회 페이지 진입");

		String memInfo = (String) session.getAttribute("id"); /* 세션 id가져오기 */
		vo = myservice.member(memInfo); /* 고객 정보 가져오기 */
		Integer a = vo.getPoint();
		myservice.pointUpdate(vo);
		Integer b = vo.getPoint();
		Integer pcharge = a + b;
		vo.setPoint(pcharge);
		myservice.pointUpdate(vo);
		return "redirect:/mypoint";
	}

	/* 리뷰관리 페이지 -> ReviewController로 이동 */

	/* 1:1문의 페이지 */
	@RequestMapping(value = "/myqna", method = { RequestMethod.GET, RequestMethod.POST })
	public String myqnaGET(Model model, OrderVO vo, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 큐엔에이 페이지 진입");

		return "my/myQna";
	}
}