package com.aplus.item;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aplus.review.ReviewVO;

@Controller
public class ItemController {
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Autowired
	private ItemService itemService;

	/* 상품 리스트 페이지 (카테고리-대분류 */
	@RequestMapping(value = "/itemListL", method = RequestMethod.GET)
	public String itemListL(Model model, HttpServletResponse response, Integer cat) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 리스트 페이지 진입");

		List<ItemVO> list = itemService.itemListL(cat);
		logger.info("---------------글 목록 확인---------" + list);
		model.addAttribute("itemlist", list);

		return "item/itemList";
	}

	/* 상품 리스트 페이지 (카테고리-중분류) */
	@RequestMapping(value = "/itemList", method = RequestMethod.GET)
	public String itemList(Model model, HttpServletResponse response, Integer cat) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 리스트 페이지 진입");

		List<ItemVO> list = itemService.itemList(cat);
		logger.info("---------------글 목록 확인---------" + list);
		model.addAttribute("itemlist", list);

		return "item/itemList";
	}

	/* 상품 목록&상세&리뷰 */
	@RequestMapping(value = "/itemDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String itemDetail(Model model, Integer num, Integer itemnum, HttpServletResponse response) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 상세 페이지 진입");

		//상품정보 불러오기
		ItemVO vo = itemService.itemDetail(num);
		model.addAttribute("detail", vo);
		
		//옵션 불러오기
		List<ItemAttrVO> list = itemService.itemAttr(num);
		model.addAttribute("list1", list);

		//리뷰 불러오기
		List<ReviewVO> review = itemService.itemreviewlist(num);
		model.addAttribute("review", review);
		return "item/itemDetail";
	}

	/* 상품 상세페이지 option 선택 ajax */
	@RequestMapping(value = "/itemOp", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String itemOp(ItemAttrVO vo, Model model, @RequestParam("option") String option,
			@RequestParam("num") Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");
		vo.setItemoption(option);
		vo.setItemnum(num);
		vo = itemService.itemOp(vo);

		Integer cost = vo.getItemcost();
		String to = Integer.toString(cost);

		logger.info("itemOp.cost = " + cost);
		logger.info("vo = " + vo);

		return to;
	}

	/* 상품 상세페이지 구매, 장바구니 ajax용 Controller */
	@RequestMapping(value = "/itemCode", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String itemCodeGET(ItemAttrVO vo, Model model, @RequestParam("option") String option,
			@RequestParam("num") Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");
		vo.setItemoption(option);
		vo.setItemnum(num);

		vo = itemService.itemOp(vo);

		Integer code = vo.getItemcode();
		String to = Integer.toString(code);

		logger.info("itemCode.code" + code);
		logger.info("vo" + vo);

		return to;
	}

}