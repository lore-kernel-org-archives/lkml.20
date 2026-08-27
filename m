Received: from mta1.migadu.com (out-226.mta1.migadu.com [95.215.58.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39D43E4B0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832720; cv=none; b=FHZc+EL/eopZFrKOfz/M8zU6sAG46zF29fhQxxQJItilBvShT1Jz7/yN1mJxlRsbhDgGvwoGZSS2ItwGlpTutTlQt/Hx3/A+2blPn7RMaQ2hu04kN2uMVBTu4gWN8VLpm0klytoc79UXFmaIEDA6uofBMpllRjT2H2rbm2pex6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832720; c=relaxed/simple;
	bh=OmZ4HMNJEKn5n8PIiCPbESGHuRzCDj7TC5nRy66T5lU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R4aKhgKiQdcW0G+qMxcHMP3+F/HAuRhMM6TCY8ooWEg8Zr403t4xh4duv2FEdOiqN63edlpUUtVjvDnZcgUPo1Qmelp14XNLXwkCNc8IWavK9OeKoDiydZiXsvrJ2E5yt95QVMKGauMK1CdYxiTkWNJMXnsAmRacbadNolr1xJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sghyhz76; arc=none smtp.client-ip=95.215.58.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sghyhz76"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OmZ4HMNJEKn5n8PIiCPbESGHuRzCDj7TC5nRy66T5lU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787832716; v=1; x=1788437516;
 b=sghyhz76ZGQ1HyGNO4mpw7Wuj33xXQly/O+AM/JrD3r07379EZYipF+0lEbXN9QV1uK02byQ
 ahUMrm/rxCXIm+hlkLYX2lrCvs3Qf/qiq/ZFNm5XSXTYlSla9raOOh49GujPhLGOwfP93ABdo5m
 v5YsGQwDhgDnRBgxu8sKBNeQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a5aa79f41822b67a;
	Thu, 27 Aug 2026 12:11:55 +0000
X-Mizu-Trace-ID: a5aa79f41822b67a
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org,
	baolin.wang@linux.alibaba.com,
	pedrodemargomes@gmail.com
Cc: akpm@linux-foundation.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-stable] mm/khugepaged: avoid unnecessary checking for swap entries when collapsing a mTHP
Date: Thu, 27 Aug 2026 20:11:51 +0800
Message-Id: <20260827121151.7837-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <d02405a5-1d0d-49d5-9056-1a34ccdeef10@kernel.org>
References: <d02405a5-1d0d-49d5-9056-1a34ccdeef10@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Aug 27, 2026 at 01:02:14PM +0200, David Hildenbrand (Arm) wrote:
>On 8/27/26 10:06, Baolin Wang wrote:
>> 
>> 
>> On 8/26/26 3:24 AM, Pedro Demarchi Gomes wrote:
>>> mthp_collapse() tries to swap in PTEs when collapsing a mTHP if there are any
>>> swap PTEs in the PMD range, even if none of those swap PTEs are
>>> actually part of the mTHP's range.
>> 
>> Are you sure? I wonder how you tested your patch? Because we never swapin PTEs
>> for mTHP collapse, see the code in __collapse_huge_page_swapin():
>
>I'm confused as well, this doesn't really make sense.

Well ... the change does remove a redundant PTE walk, IIUC ...

I think Pedro's wording is causing the confusion :)

Yeah, Baolin is right that __collapse_huge_page_swapin() never reaches
do_swap_page() for a mTHP. For an otherwise eligible lower-order
candidate, current code still calls it and walks the candidate's PTE range
when an unrelated swap PTE exists elsewhere in the same PMD :)

Assume an otherwise eligible lower-order candidate has no swap PTE, while
another subrange in the PMD has one. collapse_scan_pmd() counts unmapped
over the full PMD and passes that PMD-wide value into mthp_collapse():

static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
		struct vm_area_struct *vma, unsigned long start_addr,
		bool *lock_dropped, struct collapse_control *cc)
{
...
	int node = NUMA_NO_NODE, unmapped = 0;
...
	for (i = 0; i < HPAGE_PMD_NR; i++) {
		_pte = pte + i;
		addr = start_addr + i * PAGE_SIZE;
		pteval = ptep_get(_pte);
...
		if (pte_none_or_zero(pteval)) {
...
			continue;
		}
		if (!pte_present(pteval)) {
			if (++unmapped > max_ptes_swap) {
...
			}
...
			if (pte_swp_uffd_any(pteval)) {
				result = SCAN_PTE_UFFD;
				goto out_unmap;
			}
			continue;
		}
...
	}
	if (cc->is_khugepaged &&
		   (!referenced ||
		    (unmapped && referenced < HPAGE_PMD_NR / 2))) {
		result = SCAN_LACK_REFERENCED_PAGE;
	} else {
		result = SCAN_SUCCEED;
	}
...
	if (result == SCAN_SUCCEED) {
...
		result = mthp_collapse(mm, start_addr, referenced,
				       unmapped, cc, enabled_orders);
...
	}
...
	return result;
}

unmapped is PMD-wide above. mthp_collapse() then passes the same value to
every attempted candidate:

static enum scan_result mthp_collapse(struct mm_struct *mm,
		unsigned long address, int referenced, int unmapped,
		struct collapse_control *cc, unsigned long enabled_orders)
{
	unsigned int nr_occupied_ptes, nr_ptes, max_ptes_none;
...
	unsigned int order = HPAGE_PMD_ORDER;

	while (offset < HPAGE_PMD_NR) {
		nr_ptes = 1UL << order;

		if (!test_bit(order, &enabled_orders))
			goto next_order;

		max_ptes_none = collapse_max_ptes_none(cc, NULL, order);
		nr_occupied_ptes = bitmap_weight_from(cc->mthp_present_ptes, offset,
						      offset + nr_ptes);

		/*
		 * Swap PTEs accepted during the scan are counted in @unmapped,
		 * not in the present-PTE bitmap. Account them for the PMD-order
		 * candidate.
		 */
		if (is_pmd_order(order))
			nr_occupied_ptes += unmapped;

		if (nr_occupied_ptes >= nr_ptes - max_ptes_none) {
			enum scan_result ret;

			collapse_address = address + offset * PAGE_SIZE;
			ret = collapse_huge_page(mm, collapse_address, referenced,
						 unmapped, cc, order);
...
		}

next_order:
...
		if (order > KHUGEPAGED_MIN_MTHP_ORDER &&
			(enabled_orders & GENMASK(order - 1, 0))) {
			order--;
			continue;
		}
next_offset:
...
		offset += nr_ptes;
		order = max_order_from_offset(offset);
	}
...
}

Once it reaches the lower-order candidate with no swap PTE, unmapped is
still nonzero and collapse_huge_page() calls the swapin helper:

static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long start_addr,
		int referenced, int unmapped, struct collapse_control *cc,
		unsigned int order)
{
...
	if (unmapped) {
...
		result = __collapse_huge_page_swapin(mm, vma, start_addr, pmd,
						     referenced, order);
...
	}
...
}

__collapse_huge_page_swapin() only calls do_swap_page() after finding a
non-present, non-none PTE, and lower orders return before that call:

static enum scan_result __collapse_huge_page_swapin(struct mm_struct *mm,
		struct vm_area_struct *vma, unsigned long start_addr,
		pmd_t *pmd, int referenced, unsigned int order)
{
...
	unsigned long addr, end = start_addr + (PAGE_SIZE << order);
	enum scan_result result;
	pte_t *pte = NULL;
	spinlock_t *ptl;

	for (addr = start_addr; addr < end; addr += PAGE_SIZE) {
...
		vmf.orig_pte = ptep_get_lockless(pte);
		if (pte_none(vmf.orig_pte) ||
		    pte_present(vmf.orig_pte))
			continue;
...
		if (!is_pmd_order(order)) {
...
			result = SCAN_EXCEED_SWAP_PTE;
			goto out;
		}

		vmf.pte = pte;
		vmf.ptl = ptl;
		ret = do_swap_page(&vmf);
...
	}
...
	result = SCAN_SUCCEED;
out:
...
	return result;
}

For the candidate above, the loop only reads its PTEs and returns
SCAN_SUCCEED. Pedro's bitmap lets mthp_collapse() determine that upfront
and skip the walk.

Emm ... as I asked before[1], any numbers showing how much the extra scan
costs?

[1] https://lore.kernel.org/lkml/20260825192433.3185880-1-pedrodemargomes@gmail.com/

Cheers, Lance
