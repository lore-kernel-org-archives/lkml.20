Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A9C1684B0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887461; cv=none; b=pngVEdUZ5Wj46IWGsp1Lh8s8UoW1CfDy6tvk/Knj6KkYkUg8Y0uIFYaePqGv/NGOsP7eY0dB3EoJr4unfqTdIPC6yZLpICsCZF3mE8BwWwEjozaWKUccYAq5Z+AHD3mc2gTNquKomLQoDoC0WeICxdEvPfoJ/1J2pUCnk7acFQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887461; c=relaxed/simple;
	bh=WxoBaNwzlmidMidksPZrOtcWB6M+YpWBrfneH+aK8zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrAMSsxdLqVyr1uwrvoT9veTN+cg0tNE9EA7/OulwmLBHakknn0i5PxskDTyR5i/Xr3YhC8VWlkTRekKDSOeEIlg5K5x5QX+1nSV8Z6WiINtKNmghu4PLampHyZ5nMHPlwUDSBuR2jyeXc0zIJ4b8BwCJBUtt+Yp4jjcMuZ7EBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxyPgP2D; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxyPgP2D"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so362523241.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787887459; x=1788492259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g2ZzKk07tFRa0Ja9M4tPFlTar0tTPuv50YYhh41aYzE=;
        b=FxyPgP2DZt0KnvboUruqIHixsBEkqu/xWIpS/gSt8aJZJk3EQNB4DszG5QSfje+soU
         dRAs1Lid9YMQHGYBjbWliNgSE+J18/4tzVG7+py+zjwoYU5uaBMZJZEmCA6p39rZBT3D
         Bz5Ox64aL9nLKc0qyq2Vs2EeNMD87kdnoOeVIa2WzOcbLmYQcHwouUiK+omnNslUjJfr
         srR+mAYx91ZyEu6650ONsrPF9c6E/qTRqSWRZ9gkl4JxrwpVg3RLLIjpo7JdhEHwGdXY
         2WmFEhYWC/H1R0t4tqvpBC9GguUwNeD3Fph1BRA9HpLxeOoUk4Yrjtp4VoIJwQaxL/wS
         6v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887459; x=1788492259;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2ZzKk07tFRa0Ja9M4tPFlTar0tTPuv50YYhh41aYzE=;
        b=T8FsxgrSxxz2tFNw5QSvsjo+uXbWcw/TpQhW0pViu6aiLPxZsaL0ncXtKPwhTQ/Q2y
         IvJbBvCMNkeeO3dJi2LUxnXll3eMEzVemiC9NokilDwUvOBpwe0bcAlxBXqlntUl2SFz
         ByyXro24xmaxIITaE3+M5rzOQ1iqaj/w9F38A5uHsZwG7cipvly45qr3k5yYqGoRq2G1
         JW/40Qn35qjVf/vhslrvACt3e9zHXasoVUqteIgssAcPXP7ckG7DtsZhxGT6RvC22Vkv
         8OWAjkhiGEMEMQu9ZsXWR3VL5+xeRgv+1/AGVojL0IY7nqfVHAOjDl629pfyFTrITvNp
         GZxw==
X-Forwarded-Encrypted: i=1; AHgh+RpgPW+97pzsaX3yzdVhgSlQwUPQwc2jOZjLxUiK7MiEEzBkwytJUgo4HqYucAMPTQE7sLI4WwjX8zF5FUw=@vger.kernel.org
X-Gm-Message-State: AFuF++lVvWhDby3tL8Xg0iIRviB4ZjhlKwjcba3x5qa/S5cOgAX/bxwy
	F0A9LAtc2fdWjUr/QdAG6MIwxnx4jlCSU9tTWoToL9r71NLV2Ysij7Ii
X-Gm-Gg: AR+sD11BK6NYO9JwQzBXJpg19aZpE+3eldaTq4DgpYsRzPRmHnOIiSx0OGN9YAIzF9+
	1hiKlaSTeLJpzntx2RuLks5U/BEZ2oEnlxxCK9ESXQ7ahJUGsvFzy3v69EiMyWLV0EH1PlKH3nr
	K5+l0cX/ZpQ1S8JLHRmxNfw2SJE24XL/zOFdK3CxmbV/08hxLOX1NXE1Jk1a6nLMv3KjewL7J7a
	NzySS3yYW86FCu3ZVwT75N76qEApRuviSTwj5SGGiyqAcagOzMExR/BwuBxPdDOHxhYJ0bH1L38
	ivY4tILrFf1tsf8LIsOdXREnTwbQNKBWCShvtM9+Hn7iPrjyrlP2dmx/MDEV026evM2rhraJvKz
	8ts5qZvMopoLD/Y+lKQNqiAQ4mnnlY1U+ug8KZcM1Ik+hYr/c/10C8t8LG+GCB+lJc5DD68ZUCT
	labjGM7H/ObgmLBGUetepMt5UaU5V28t0Vqqd3VeARosHaGjGBv561KGaiieLVG0KIznxVNYXp5
	Ck5LkEUcCn7doJm4BqX47M1o68xDygQuvhprEKi/AwcYg==
X-Received: by 2002:a05:6102:2253:b0:783:c17c:e7de with SMTP id ada2fe7eead31-7841d55ca7bmr2144879137.9.1787887458822;
        Thu, 27 Aug 2026 20:24:18 -0700 (PDT)
Received: from ryzoh.168.0.127 ([2804:14c:5fc8:811e:f302:2f37:278a:ffdf])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e84a55284sm214637241.4.2026.08.27.20.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:24:17 -0700 (PDT)
Date: Fri, 28 Aug 2026 00:24:11 -0300
From: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: david@kernel.org, baolin.wang@linux.alibaba.com, 
	akpm@linux-foundation.org, ljs@kernel.org, ziy@nvidia.com, liam@infradead.org, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	usama.arif@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-stable] mm/khugepaged: avoid unnecessary checking for
 swap entries when collapsing a mTHP
Message-ID: <fle5rdjgidxkdvb45oymjftgy3itbsbmthtmugb77honamcwni@mslpfsykumqe>
References: <d02405a5-1d0d-49d5-9056-1a34ccdeef10@kernel.org>
 <20260827121151.7837-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827121151.7837-1-lance.yang@linux.dev>

On Thu, Aug 27, 2026 at 08:11:51PM +0800, Lance Yang wrote:
>
> On Thu, Aug 27, 2026 at 01:02:14PM +0200, David Hildenbrand (Arm) wrote:
> >On 8/27/26 10:06, Baolin Wang wrote:
> >>
> >>
> >> On 8/26/26 3:24 AM, Pedro Demarchi Gomes wrote:
> >>> mthp_collapse() tries to swap in PTEs when collapsing a mTHP if there are any
> >>> swap PTEs in the PMD range, even if none of those swap PTEs are
> >>> actually part of the mTHP's range.
> >>
> >> Are you sure? I wonder how you tested your patch? Because we never swapin PTEs
> >> for mTHP collapse, see the code in __collapse_huge_page_swapin():
> >
> >I'm confused as well, this doesn't really make sense.
>
> Well ... the change does remove a redundant PTE walk, IIUC ...
>
> I think Pedro's wording is causing the confusion :)

Sorry for the confusion. My patch description was not clear enough.
Thanks for taking the time to clarify the intent of the patch and explain the
code path in more detail.

>
> Yeah, Baolin is right that __collapse_huge_page_swapin() never reaches
> do_swap_page() for a mTHP. For an otherwise eligible lower-order
> candidate, current code still calls it and walks the candidate's PTE range
> when an unrelated swap PTE exists elsewhere in the same PMD :)
>
> Assume an otherwise eligible lower-order candidate has no swap PTE, while
> another subrange in the PMD has one. collapse_scan_pmd() counts unmapped
> over the full PMD and passes that PMD-wide value into mthp_collapse():
>
> static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
> 		struct vm_area_struct *vma, unsigned long start_addr,
> 		bool *lock_dropped, struct collapse_control *cc)
> {
> ...
> 	int node = NUMA_NO_NODE, unmapped = 0;
> ...
> 	for (i = 0; i < HPAGE_PMD_NR; i++) {
> 		_pte = pte + i;
> 		addr = start_addr + i * PAGE_SIZE;
> 		pteval = ptep_get(_pte);
> ...
> 		if (pte_none_or_zero(pteval)) {
> ...
> 			continue;
> 		}
> 		if (!pte_present(pteval)) {
> 			if (++unmapped > max_ptes_swap) {
> ...
> 			}
> ...
> 			if (pte_swp_uffd_any(pteval)) {
> 				result = SCAN_PTE_UFFD;
> 				goto out_unmap;
> 			}
> 			continue;
> 		}
> ...
> 	}
> 	if (cc->is_khugepaged &&
> 		   (!referenced ||
> 		    (unmapped && referenced < HPAGE_PMD_NR / 2))) {
> 		result = SCAN_LACK_REFERENCED_PAGE;
> 	} else {
> 		result = SCAN_SUCCEED;
> 	}
> ...
> 	if (result == SCAN_SUCCEED) {
> ...
> 		result = mthp_collapse(mm, start_addr, referenced,
> 				       unmapped, cc, enabled_orders);
> ...
> 	}
> ...
> 	return result;
> }
>
> unmapped is PMD-wide above. mthp_collapse() then passes the same value to
> every attempted candidate:
>
> static enum scan_result mthp_collapse(struct mm_struct *mm,
> 		unsigned long address, int referenced, int unmapped,
> 		struct collapse_control *cc, unsigned long enabled_orders)
> {
> 	unsigned int nr_occupied_ptes, nr_ptes, max_ptes_none;
> ...
> 	unsigned int order = HPAGE_PMD_ORDER;
>
> 	while (offset < HPAGE_PMD_NR) {
> 		nr_ptes = 1UL << order;
>
> 		if (!test_bit(order, &enabled_orders))
> 			goto next_order;
>
> 		max_ptes_none = collapse_max_ptes_none(cc, NULL, order);
> 		nr_occupied_ptes = bitmap_weight_from(cc->mthp_present_ptes, offset,
> 						      offset + nr_ptes);
>
> 		/*
> 		 * Swap PTEs accepted during the scan are counted in @unmapped,
> 		 * not in the present-PTE bitmap. Account them for the PMD-order
> 		 * candidate.
> 		 */
> 		if (is_pmd_order(order))
> 			nr_occupied_ptes += unmapped;
>
> 		if (nr_occupied_ptes >= nr_ptes - max_ptes_none) {
> 			enum scan_result ret;
>
> 			collapse_address = address + offset * PAGE_SIZE;
> 			ret = collapse_huge_page(mm, collapse_address, referenced,
> 						 unmapped, cc, order);
> ...
> 		}
>
> next_order:
> ...
> 		if (order > KHUGEPAGED_MIN_MTHP_ORDER &&
> 			(enabled_orders & GENMASK(order - 1, 0))) {
> 			order--;
> 			continue;
> 		}
> next_offset:
> ...
> 		offset += nr_ptes;
> 		order = max_order_from_offset(offset);
> 	}
> ...
> }
>
> Once it reaches the lower-order candidate with no swap PTE, unmapped is
> still nonzero and collapse_huge_page() calls the swapin helper:
>
> static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long start_addr,
> 		int referenced, int unmapped, struct collapse_control *cc,
> 		unsigned int order)
> {
> ...
> 	if (unmapped) {
> ...
> 		result = __collapse_huge_page_swapin(mm, vma, start_addr, pmd,
> 						     referenced, order);
> ...
> 	}
> ...
> }
>
> __collapse_huge_page_swapin() only calls do_swap_page() after finding a
> non-present, non-none PTE, and lower orders return before that call:
>
> static enum scan_result __collapse_huge_page_swapin(struct mm_struct *mm,
> 		struct vm_area_struct *vma, unsigned long start_addr,
> 		pmd_t *pmd, int referenced, unsigned int order)
> {
> ...
> 	unsigned long addr, end = start_addr + (PAGE_SIZE << order);
> 	enum scan_result result;
> 	pte_t *pte = NULL;
> 	spinlock_t *ptl;
>
> 	for (addr = start_addr; addr < end; addr += PAGE_SIZE) {
> ...
> 		vmf.orig_pte = ptep_get_lockless(pte);
> 		if (pte_none(vmf.orig_pte) ||
> 		    pte_present(vmf.orig_pte))
> 			continue;
> ...
> 		if (!is_pmd_order(order)) {
> ...
> 			result = SCAN_EXCEED_SWAP_PTE;
> 			goto out;
> 		}
>
> 		vmf.pte = pte;
> 		vmf.ptl = ptl;
> 		ret = do_swap_page(&vmf);
> ...
> 	}
> ...
> 	result = SCAN_SUCCEED;
> out:
> ...
> 	return result;
> }
>
> For the candidate above, the loop only reads its PTEs and returns
> SCAN_SUCCEED. Pedro's bitmap lets mthp_collapse() determine that upfront
> and skip the walk.
>
> Emm ... as I asked before[1], any numbers showing how much the extra scan
> costs?

I tested this on my machine with a 2 MB PMD size. In my measurements, removing
the extra PTE walk did not show a significant reduction in the overall scan
time. Maybe for machines with a bigger PMD size this can make a difference.

>
> [1] https://lore.kernel.org/lkml/20260825192433.3185880-1-pedrodemargomes@gmail.com/
>
> Cheers, Lance
>
