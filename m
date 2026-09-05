Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CD038E8B4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616953; cv=none; b=reOZnYC9k8i9HQj3+8doBaR48E2XfFZnp33rWKG920vK3hsX9NOjnLq6WKdXcUWd5SmDCTMAjbm+FCRATFJXlxRs/J/JVlZCT12u3y0WWLpIT/R7Wax1DAuzcLFoyrnGksxTkaO299Mj8ThV5VQ5K4g4ax/EVGG6VZXMLtkvwqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616953; c=relaxed/simple;
	bh=XYa/sNO0rkEa/2+8FJLR+KN9FCWceJLtMiHEoyXNxqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMDdHrOIOW9jszkkJJFl1URkXUtPOcewFOkrD4q78TrV2NI64K4PFYVqeIeDMWhHP33mpXVIMBkjWli16jizbb1tWpRhmgpUCCwCtK6W9u4jNmNCWScAYeolVBN5r+QIE0b5/lVLlYypuV+ZIlBa5FtzPt5FZCuLnZs5XsK/yIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVTmcyka; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVTmcyka"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-483960225ccso630196f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616941; x=1789221741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAVqgBHrMqJB3BSpfl35IypQuNVtfirpz6pazsL02KQ=;
        b=EVTmcykaSU1FRZcFYRZd03FJBIySZvbcWt2oTXrQhHDgzfmHpP5m7QcpmZnViEgKkR
         J29mtBFmylGBP2xjQhHHEFwjzDwhepVS6KqyccJg/XH0io1FmPP3MXmRTjIm9PpzSlUZ
         gWz1a5C+5tI0KxZncAoio2zgch8++j6WBVkvc7UAJ8rSYUfTcJR8Q/7Przjl4L/lAsvQ
         sv8WX05vwnomK7TYf9ekGzcRRPRbIkSaNsYdx7HTELKhGnlmBMqyBmQhzgd+g8XlcsSX
         F8NtuA6KwmkxNpjCx8cLpEGJ/BnpItegv8+FOYwqdN+ZejuKzoxwfufm7aF5ofva1py5
         UmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616941; x=1789221741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAVqgBHrMqJB3BSpfl35IypQuNVtfirpz6pazsL02KQ=;
        b=C07TLNJOIMZfdBoMMML4Qp5CJuysNY6I/8nYSqwFNoFZ+W45LCHaSEVNnUIEscgoG4
         bgGgTLln5cs3xZQ0ie2OUNEaR0BUm0K4V/tLRzpEqdXnO6yDa3SiVBA90dLrtBvzXhJi
         kwaE+gMB1E7I+ZW/TUZOyooOTOdb7RSXKOGNX4xV6aG9MfyaF1trNzTOzLDvNug7HJ6o
         5MBIg1oNIR2me8X9yvXnLBLgtkNreO33m4h4+3ZemtPeelMVjgcYBfwz7U6jm1Ajtiic
         Q+ehAhj7EyBSUD2/5sGRCU0g+3eqhzr2xaz3qk53Qr025rGwZibMiLFgWWk5nM6E+2wD
         IOaQ==
X-Forwarded-Encrypted: i=1; AKwUvByHsTFLvvJExb+o6+bd2w0LoI/xvUR6hx3BbqcFcW/fB9vFaOfF/mbbi8rFwHxDFQsxyTR7Y5sr3XrZlcs=@vger.kernel.org
X-Gm-Message-State: AFuF++lLBFB7HjfCVZjrdY+152417gPLproNyFgHYIbDZ8B2ARUPgt+O
	E6R/T+4XsI2ec0s6JnmXw1gjwow9S3pxJJz+1Qj8PyamhYLo+cG1QmCt
X-Gm-Gg: AYBFou0OMX/QD1DV7DB/hh+FuH6p559yDarS8avRf5kY8aDTgfkGaenVOotiGiDhuk0
	ssoFbfDZpI7AY7vQjFblBqv0cnkcl49v3w5P86WpAcw53SGWYTWlbOl1VzYazIkL9ENM7G/RClV
	Hfr1X6fQHRehLb1j1LBytyJhZT0PiERUC43M9H2PNlZRrbGpuabRSE0c2Hc/WS3Yw+yXTcIgZ6R
	YTcVOw8JaGn5vNePBb4WFEeZZcg5HfPV8DtyPgPLadBnFUTahiSWn33LLFb0uSbNADWmaFvb5Jr
	3OG6aDA6VCgh29nFRkajEGFj9rEByeexl/YU9oXRze5YveQJfm8mEJCI1nxWX1HlsOGmfAhnJVF
	OXBVANKsmpL6W22XPlC32DgtybSZCMZmW23cS8rG98N5HVH/V6E16SbDKXYFjGa86ZvqjGJWwkr
	7Ezgz64YcGRJSEoxhHR+9bYWfwKJByxCvJOGE1b7BlswKSl6kshHLoHrWF7dtuywHUnliIRru8S
	vEdAdhyA6wH6ezEF8ic5+PnOEEk4Q==
X-Received: by 2002:a05:600c:4f83:b0:49d:91:274 with SMTP id 5b1f17b1804b1-49d00910374mr51848155e9.10.1788616941497;
        Sat, 05 Sep 2026 07:02:21 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:84ac:4417:9f37:a496])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm149866765e9.0.2026.09.05.07.02.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 07:02:21 -0700 (PDT)
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	ljs@kernel.org,
	hannes@cmpxchg.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	mhocko@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Christos Skarlos <christosskarlos.kernel@gmail.com>
Subject: [PATCH 3/3] mm/hugetlb: fix various coding style warnings.
Date: Sat,  5 Sep 2026 17:01:40 +0300
Message-ID: <20260905140140.60792-5-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905140140.60792-1-christosskarlos.kernel@gmail.com>
References: <20260905140140.60792-1-christosskarlos.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve coding style issues flagged by the checkpatch.pl script. Specifically:
- Fix block comment formatting to keep tailing '*/' on a separate line.
- Add missing blank lines after variable declarations.
- Remove anecessary braces {} from single statement blocks.

No functional changes where introduced.

Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
---
 mm/hugetlb.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4f6f58bf3db6..ec8e799e356e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -145,7 +145,8 @@ static inline void unlock_or_release_subpool(struct hugepage_subpool *spool,
 
 	/* If no pages are used, and no other handles to the subpool
 	 * remain, give up any reservations based on minimum size and
-	 * free the subpool */
+	 * free the subpool
+	 */
 	spin_unlock_irqrestore(&spool->lock, irq_flags);
 
 	if (free_subpool) {
@@ -3700,6 +3701,7 @@ static void try_to_free_low(struct hstate *h, unsigned long count,
 	for_each_node_mask(i, *nodes_allowed) {
 		struct folio *folio, *next;
 		struct list_head *freel = &h->hugepage_freelists[i];
+
 		list_for_each_entry_safe(folio, next, freel, lru) {
 			if (count >= h->nr_huge_pages)
 				goto out;
@@ -3764,6 +3766,7 @@ static int set_max_huge_pages(struct hstate *h, unsigned long count, int nid,
 	unsigned long allocated;
 	struct folio *folio;
 	LIST_HEAD(page_list);
+
 	NODEMASK_ALLOC(nodemask_t, node_alloc_noretry, GFP_KERNEL);
 
 	/*
@@ -4188,9 +4191,9 @@ void __init hugetlb_add_hstate(unsigned int order)
 	struct hstate *h;
 	unsigned long i;
 
-	if (size_to_hstate(PAGE_SIZE << order)) {
+	if (size_to_hstate(PAGE_SIZE << order))
 		return;
-	}
+
 	BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
 	BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
 	WARN_ON(order > MAX_FOLIO_ORDER);
@@ -4832,11 +4835,11 @@ static pte_t make_huge_pte(struct vm_area_struct *vma, struct folio *folio,
 	pte_t entry = folio_mk_pte(folio, vma->vm_page_prot);
 	unsigned int shift = huge_page_shift(hstate_vma(vma));
 
-	if (try_mkwrite && (vma->vm_flags & VM_WRITE)) {
+	if (try_mkwrite && (vma->vm_flags & VM_WRITE))
 		entry = pte_mkwrite_novma(pte_mkdirty(entry));
-	} else {
+	else
 		entry = pte_wrprotect(entry);
-	}
+
 	entry = pte_mkyoung(entry);
 	entry = arch_make_huge_pte(entry, shift, vma->vm_flags);
 
@@ -4919,6 +4922,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 	last_addr_mask = hugetlb_mask_last_page(h);
 	for (addr = src_vma->vm_start; addr < src_vma->vm_end; addr += sz) {
 		spinlock_t *src_ptl, *dst_ptl;
+
 		src_pte = hugetlb_walk(src_vma, addr, sz);
 		if (!src_pte) {
 			addr |= last_addr_mask;
@@ -6321,6 +6325,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 		folio = alloc_hugetlb_folio(dst_vma, dst_addr, false);
 		if (IS_ERR(folio)) {
 			pte_t *actual_pte = hugetlb_walk(dst_vma, dst_addr, PMD_SIZE);
+
 			if (actual_pte) {
 				ret = -EEXIST;
 				goto out;
-- 
2.55.0

