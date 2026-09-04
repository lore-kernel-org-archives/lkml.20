Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A182E4EC66B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534643; cv=none; b=HI1ECZmVI+G6qwYrI5rl51vQz/vGm4XR9a8uORWHzOigeAx66vx5UZN3WOeQBlSxvhzDlAJknHaefqwRsNtN3vnqR9B+2dmesNT84HqScYkj0dm1CiHAWT/7rgGcFQUcXDkAM+AayM1JKS97QbbERHCOeDBV2uq/NAQDClpQjjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534643; c=relaxed/simple;
	bh=WdBtMF4isc7/JDB6frBzaI22IARq9/7jAG7UchgoEgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/e0uFlXDnTIbR35eLJYsoBRA5vGx0oTHK51SS6a+pQWsxdI0VfeegzZJOGAuDQzLaO+J94l2cBJwcgel9UzWsZpunKLWReeOpeyxbclJlI0y0oCo/Tx/LuXXqRuTRsThAW0FZKxWfHH1k+sk2lVoO8sFET/CvAFP6hm914RbTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=hgV2KVoQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KGzzt8l1; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="hgV2KVoQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KGzzt8l1"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B8CF914000EA;
	Fri,  4 Sep 2026 11:10:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 04 Sep 2026 11:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788534639; x=
	1788621039; bh=rLA7WGbf/bUqUAdGBfnElNM3zHqju4YnHH35h18Mb0g=; b=h
	gV2KVoQPO2VsLzcoHKArMbkEFSMR3/2iBz7Ox7ti/ffXDO+SSS6/b1bkIZ4Akrng
	OFvD1tfiT5m0A3OgAcYeUdmZzFQ9uSWp1UcWud+KTizuuxx2jh/OV2vpuK2sHjVF
	y9HKKigWYGhNyGxM8lTpbF2yMSqyScXCUiZW/pogdklw8giFDqtWoS4WA0MMRq2L
	c3Zgfg4nekTRKQN/f9Jyz7kUQYds5piJRI4as5YOV7NGEnHrwKpRnDQ8TMdyioAk
	pmV/kQJnOR8tbQGPCjWR8q/PajFO5ZHwjH88g12DnLH+XXuqz3GOg/ad1wIRF7tq
	l2ZdwGHYkA89Ilja7aJwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788534639; x=1788621039; bh=r
	LA7WGbf/bUqUAdGBfnElNM3zHqju4YnHH35h18Mb0g=; b=KGzzt8l1pL6S1EyO0
	i0PNKdSw0JtMFkYulF0YfChV+1ePOoI6CiT6FtW7C11Q6bHJEG/PGIH25boZb+pe
	zjOVZRwfGr3DUEfqtybahHXL99g5FB2I5t4B8pg71h6FZH7G9I3ucyUeH+pk+473
	9sezE/Xn+tSlSXDppUz5iU/3Pdzh8TZWRhFWWQ4TYCnTj6xgUATgr047c7TrCrrP
	YHOw/RAAgyVkXmI7hrUR5DrzV1zF8nXfnjma17FwDjTQZHIUYMzw7X6NX7vZL1jm
	gkVcUA+TwOuQyI1iCoBBkby5S/eH9vXub82bi2Bg8FAU5tn2y7hJLAdzHga7Jw0c
	oZJxA==
X-ME-Sender: <xms:b9-aavijejRF8GoCb2TW21bR3d8-jFf3A-rsmNZ3JzrHO7hUWYNzYQ>
    <xme:b9-aatg8CoMPIop70q-hyk64950FrZjmjmG_LctnW3a_HQGOkblvStQ8msQsoo5qs
    t9Q3zCV0f-DGSfTlW6hSsoU82_sMlfjWkgMuq5PG-MzFyJ2aDotBErS>
X-ME-Received: <xmr:b9-aasvQy4cgZt6dHDGEQgxtnbsAvWiRAbeqY5XjBA4phEWEtgn8HWA1kwE>
X-ME-Proxy-Cause: dmFkZTFdOocfRN4jOpcQf0AqfSai/YCGo+xlO94MLvzn7lqitof50EENUNEgJzLPt2H+RQ
    DWgrwJL5dg2BaLkWQfjz0w8mX09EzID7A24sM1R0CcrzJ0aCsxP+pgO1accdG5RnvXKoNP
    Qi2+ranCgsFBQlrx3RUM64Xgm9l9zr2TPWbzFNtan3mUwkVlJ/gBEGXolzLuuMZ3CJ6e8L
    gmzum6oDDF3av5ecJE/wINba64+XlYa/U9oL8c0Dkr16eu3wp8w8wOsHTRTsCgO4oV0meO
    0fb7rtZliPO8XPlA3k/rGcTv+01JWMnSe6fG3OACTE4UctUjoP9cM2YnBbUckeF0hhckq8
    CrtWwR2uhU2I1JD0k6Cz3GcTQq/ifO5r/VydO+twK6bWOVPlUdwD/E7yEObtvrMuZYO8Qf
    lczd1T9bKgnPs22g/xVjpuS0fzG2XlUxsiH40/4fjjzhQHttmkrWuKguyfBOC69U2jazhH
    /s3PpCy0OVqY4FPMbfCrnujEPoBPv85yS/kdjm2jDKfEaki2L4L89yYh1gE/GbTjrLmg5v
    50BFYNaeK25GWSLYOoPe4/3Wb/yglv7RRIhvSOAVQtAJ0Jt+XHH9Lmc6GlNjy0tHPCQwqq
    dgwKinq6Xf1wvdKZT9MDeaN+vDxTbIV021ed1imjviQLBE9hKuailnlUAMxA
X-ME-Proxy: <xmx:b9-aajv7QYFwGWj3qWnDzoDA0Qvy3MXEO7EAuxlPes9wcGqluwoKfA>
    <xmx:b9-aatOVW7JfdVSzZFmZoAu-MrvKdGNnFlyeNXeB4oAVpvqU1SCZQg>
    <xmx:b9-aald8vZxidBIgHGozdOrGbcJ-HHp4PToGHuVELChw-3brCWayfw>
    <xmx:b9-aakmysm6wdIAVA-0h0zh6L6zIXqS4NJKmOwWfY--yrs6b8MxlfQ>
    <xmx:b9-aagqabEzltBf3okOvDe2Oc1hSrykLReEhk70IFBeMRWWVlwRAtH-U>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 11:10:39 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 05/12] mm/collapse: state what a collapse may do in the policy
Date: Fri,  4 Sep 2026 16:10:19 +0100
Message-ID: <b01681c3cc945a7f7c3c7ca1de502f7cc0e93fe8.1788533997.git.kas@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788533997.git.kas@kernel.org>
References: <cover.1788533997.git.kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

Tests scattered through the collapse path decide what a collapse is
allowed to do by asking whether khugepaged started it.  Between them they
settle:

 - which VMAs are eligible, and how hard to try for a folio;
 - how many empty, swapped-out or shared PTEs a window may contain, and
   whether a sub-PMD window is held to a stricter rule than a PMD;
 - whether a range has to look used, and whether a MADV_FREE'd page is
   left alone;
 - whether the PMD is mapped as part of the request, and whether dirty
   pages are worth writing back and retrying.

None of those is a fact about khugepaged.  Each is something the caller
decided before asking, and the collapse code should not have to look up
who called to find out.

Add struct collapse_policy for the caller to fill: khugepaged from its
own settings, MADV_COLLAPSE from the fact that a user asked explicitly.
Every test becomes a read of a field, and cc->is_khugepaged goes, having
no reader left.

khugepaged fills the policy once per scan pass, MADV_COLLAPSE once per
call.  That is the one change in behaviour.  The max_ptes_* limits and the
defrag setting behind the allocation mask are sampled once per pass rather
than on every table.  A table scanned early in a pass and one scanned late
are then judged alike.

collapse_file() also drops a NULL check on the collapse_control.  It has
one call site, reached only from collapse_single_pmd(), which dereferences
cc unconditionally, so the check was already dead.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/collapse.h   |  40 ++++++++++++++++-
 mm/khugepaged.c | 114 ++++++++++++++++++++++++++----------------------
 2 files changed, 102 insertions(+), 52 deletions(-)

diff --git a/mm/collapse.h b/mm/collapse.h
index 1c40229b9554..05282eed9a35 100644
--- a/mm/collapse.h
+++ b/mm/collapse.h
@@ -48,8 +48,46 @@ enum scan_result {
 	SCAN_PAGE_DIRTY_OR_WRITEBACK,
 };
 
+/* What a collapse is allowed to do, decided by the caller that asks for it */
+struct collapse_policy {
+	/* Limits, stated per PMD; HPAGE_PMD_NR means "no limit" */
+	unsigned int max_ptes_none;
+	unsigned int max_ptes_swap;
+	unsigned int max_ptes_shared;
+
+	/*
+	 * Hold a sub-PMD window to a stricter rule than a PMD: no swapped-out
+	 * and no shared PTEs at all, and max_ptes_none as
+	 * collapse_max_ptes_none() scales it.
+	 */
+	bool strict_sub_pmd;
+
+	/*
+	 * Collapse only where it looks worth doing: require some sign the
+	 * range is in use, and leave clean lazyfree folios for reclaim rather
+	 * than collapsing them into a folio that is not lazyfree.
+	 */
+	bool skip_lazyfree;
+	bool require_referenced;
+
+	/*
+	 * Finish the job rather than leaving it half done for a fault to pick
+	 * up: map the PMD over a file collapse before returning, and write
+	 * dirty pages back and retry once instead of refusing them.  Both cost
+	 * latency the caller has to be willing to pay.
+	 */
+	bool install_pmd;
+	bool writeback_dirty;
+
+	/* How hard to try for a destination folio */
+	gfp_t gfp;
+
+	/* Which VMAs are eligible, as thp_vma_allowable_orders() spells it */
+	enum tva_type tva_type;
+};
+
 struct collapse_control {
-	bool is_khugepaged;
+	struct collapse_policy policy;
 
 	/* Num pages scanned per node */
 	u32 node_load[MAX_NUMNODES];
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 972843c45250..b2ebacfcc0be 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -314,15 +314,12 @@ static bool pte_none_or_zero(pte_t pte)
 static unsigned int collapse_max_ptes_none(struct collapse_control *cc,
 		struct vm_area_struct *vma, unsigned int order)
 {
-	const unsigned int max_ptes_none = khugepaged_max_ptes_none;
+	const unsigned int max_ptes_none = cc->policy.max_ptes_none;
 
 	if (vma && userfaultfd_armed(vma))
 		return 0;
-	/* for MADV_COLLAPSE, allow any empty/shared zeropage PTEs */
-	if (!cc->is_khugepaged)
-		return HPAGE_PMD_NR;
-	/* for PMD collapse, respect the user defined maximum */
-	if (is_pmd_order(order))
+	/* The limit as given, at the PMD order and wherever it is not capped */
+	if (is_pmd_order(order) || !cc->policy.strict_sub_pmd)
 		return max_ptes_none;
 	/*
 	 * for mTHP collapse with the sysctl value set to COLLAPSE_MAX_PTES_LIMIT,
@@ -354,19 +351,12 @@ static unsigned int collapse_max_ptes_shared(struct collapse_control *cc,
 		unsigned int order)
 {
 	/*
-	 * For MADV_COLLAPSE, do not restrict the number of PTEs that map shared
-	 * anonymous pages.
+	 * A sub-PMD window held to the strict rule takes no shared page at all:
+	 * an mTHP is not worth the CoW-breaking.
 	 */
-	if (!cc->is_khugepaged)
-		return HPAGE_PMD_NR;
-	/*
-	 * for mTHP collapse do not allow collapsing anonymous memory pages that
-	 * are shared between processes.
-	 */
-	if (!is_pmd_order(order))
+	if (!is_pmd_order(order) && cc->policy.strict_sub_pmd)
 		return 0;
-	/* for PMD collapse, respect the user defined maximum */
-	return khugepaged_max_ptes_shared;
+	return cc->policy.max_ptes_shared;
 }
 
 /**
@@ -382,16 +372,12 @@ static unsigned int collapse_max_ptes_swap(struct collapse_control *cc,
 		unsigned int order)
 {
 	/*
-	 * For MADV_COLLAPSE, do not restrict the number PTEs entries or
-	 * pagecache entries that are non-present.
+	 * A sub-PMD window held to the strict rule takes nothing non-present:
+	 * reading pages back to build an mTHP is not worth the latency.
 	 */
-	if (!cc->is_khugepaged)
-		return HPAGE_PMD_NR;
-	/* for mTHP collapse do not allow any non-present PTEs or pagecache entries */
-	if (!is_pmd_order(order))
+	if (!is_pmd_order(order) && cc->policy.strict_sub_pmd)
 		return 0;
-	/* for PMD collapse, respect the user defined maximum */
-	return khugepaged_max_ptes_swap;
+	return cc->policy.max_ptes_swap;
 }
 
 int hugepage_madvise(struct vm_area_struct *vma,
@@ -678,7 +664,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		 * If the vma has the VM_DROPPABLE flag, the collapse will
 		 * preserve the lazyfree property without needing to skip.
 		 */
-		if (cc->is_khugepaged && !(vma->vm_flags & VM_DROPPABLE) &&
+		if (cc->policy.skip_lazyfree && !(vma->vm_flags & VM_DROPPABLE) &&
 		    folio_test_lazyfree(folio) && !pte_dirty(pteval)) {
 			result = SCAN_PAGE_LAZYFREE;
 			goto out;
@@ -767,12 +753,12 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		if (folio_test_large(folio))
 			list_add_tail(&folio->lru, compound_pagelist);
 next:
-		if (cc->is_khugepaged &&
+		if (cc->policy.require_referenced &&
 		    folio_pte_referenced(folio, vma, addr, pteval))
 			referenced++;
 	}
 
-	if (unlikely(cc->is_khugepaged && !referenced)) {
+	if (unlikely(cc->policy.require_referenced && !referenced)) {
 		result = SCAN_LACK_REFERENCED_PAGE;
 	} else {
 		result = SCAN_SUCCEED;
@@ -938,9 +924,7 @@ static void khugepaged_alloc_sleep(void)
 	remove_wait_queue(&khugepaged_wait, &wait);
 }
 
-static struct collapse_control khugepaged_collapse_control = {
-	.is_khugepaged = true,
-};
+static struct collapse_control khugepaged_collapse_control;
 
 static bool collapse_scan_abort(int nid, struct collapse_control *cc)
 {
@@ -976,6 +960,36 @@ static inline gfp_t alloc_hugepage_khugepaged_gfpmask(void)
 	return khugepaged_defrag() ? GFP_TRANSHUGE : GFP_TRANSHUGE_LIGHT;
 }
 
+/* khugepaged collapses on its own initiative, so it obeys its own settings */
+static void collapse_policy_khugepaged(struct collapse_policy *p)
+{
+	p->max_ptes_none = READ_ONCE(khugepaged_max_ptes_none);
+	p->max_ptes_swap = READ_ONCE(khugepaged_max_ptes_swap);
+	p->max_ptes_shared = READ_ONCE(khugepaged_max_ptes_shared);
+	p->strict_sub_pmd = true;
+	p->skip_lazyfree = true;
+	p->require_referenced = true;
+	p->install_pmd = false;
+	p->writeback_dirty = false;
+	p->gfp = alloc_hugepage_khugepaged_gfpmask();
+	p->tva_type = TVA_KHUGEPAGED;
+}
+
+/* MADV_COLLAPSE was asked for explicitly, so it is not held to those */
+static void collapse_policy_forced(struct collapse_policy *p)
+{
+	p->max_ptes_none = HPAGE_PMD_NR;
+	p->max_ptes_swap = HPAGE_PMD_NR;
+	p->max_ptes_shared = HPAGE_PMD_NR;
+	p->strict_sub_pmd = false;
+	p->skip_lazyfree = false;
+	p->require_referenced = false;
+	p->install_pmd = true;
+	p->writeback_dirty = true;
+	p->gfp = GFP_TRANSHUGE;
+	p->tva_type = TVA_FORCED_COLLAPSE;
+}
+
 #ifdef CONFIG_NUMA
 static int collapse_find_target_node(struct collapse_control *cc)
 {
@@ -1013,8 +1027,7 @@ static enum scan_result hugepage_vma_revalidate(struct mm_struct *mm, unsigned l
 		struct collapse_control *cc, unsigned int order)
 {
 	struct vm_area_struct *vma;
-	enum tva_type type = cc->is_khugepaged ? TVA_KHUGEPAGED :
-				 TVA_FORCED_COLLAPSE;
+	enum tva_type type = cc->policy.tva_type;
 
 	if (unlikely(collapse_test_exit_or_disable(mm)))
 		return SCAN_ANY_PROCESS;
@@ -1197,8 +1210,7 @@ static enum scan_result __collapse_huge_page_swapin(struct mm_struct *mm,
 static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_struct *mm,
 		struct collapse_control *cc, unsigned int order)
 {
-	gfp_t gfp = (cc->is_khugepaged ? alloc_hugepage_khugepaged_gfpmask() :
-		     GFP_TRANSHUGE);
+	gfp_t gfp = cc->policy.gfp;
 	int node = collapse_find_target_node(cc);
 	struct folio *folio;
 
@@ -1551,7 +1563,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER);
 	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
 	unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma, HPAGE_PMD_ORDER);
-	enum tva_type tva_flags = cc->is_khugepaged ? TVA_KHUGEPAGED : TVA_FORCED_COLLAPSE;
+	enum tva_type tva_flags = cc->policy.tva_type;
 	pmd_t *pmd;
 	pte_t *pte, *_pte, pteval;
 	int i;
@@ -1651,7 +1663,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		 * If the vma has the VM_DROPPABLE flag, the collapse will
 		 * preserve the lazyfree property without needing to skip.
 		 */
-		if (cc->is_khugepaged && !(vma->vm_flags & VM_DROPPABLE) &&
+		if (cc->policy.skip_lazyfree && !(vma->vm_flags & VM_DROPPABLE) &&
 		    folio_test_lazyfree(folio) && !pte_dirty(pteval)) {
 			result = SCAN_PAGE_LAZYFREE;
 			failed_pfn = folio_pfn(folio);
@@ -1717,13 +1729,13 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 			goto out_unmap;
 		}
 
-		if (cc->is_khugepaged &&
+		if (cc->policy.require_referenced &&
 		    folio_pte_referenced(folio, vma, addr, pteval))
 			referenced++;
 	}
-	if (cc->is_khugepaged &&
-		   (!referenced ||
-		    (unmapped && referenced < HPAGE_PMD_NR / 2))) {
+	if (cc->policy.require_referenced &&
+	    (!referenced ||
+	     (unmapped && referenced < HPAGE_PMD_NR / 2))) {
 		result = SCAN_LACK_REFERENCED_PAGE;
 	} else {
 		result = SCAN_SUCCEED;
@@ -2585,11 +2597,11 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	xas_unlock_irq(&xas);
 
 	/*
-	 * Remove pte page tables, so we can re-fault the page as huge.
-	 * If MADV_COLLAPSE, adjust result to call try_collapse_pte_mapped_thp().
+	 * Remove pte page tables, so we can re-fault the page as huge.  A
+	 * caller that wants the PMD mapped now is told to go and do that.
 	 */
 	retract_page_tables(mapping, start);
-	if (cc && !cc->is_khugepaged)
+	if (cc->policy.install_pmd)
 		result = SCAN_PTE_MAPPED_HUGEPAGE;
 	folio_unlock(new_folio);
 
@@ -2780,11 +2792,8 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 retry:
 	result = collapse_scan_file(mm, addr, file, pgoff, cc);
 
-	/*
-	 * For MADV_COLLAPSE, when encountering dirty pages, try to writeback,
-	 * then retry the collapse one time.
-	 */
-	if (!cc->is_khugepaged && result == SCAN_PAGE_DIRTY_OR_WRITEBACK &&
+	/* Dirty pages are worth a writeback and one more try, if asked for */
+	if (cc->policy.writeback_dirty && result == SCAN_PAGE_DIRTY_OR_WRITEBACK &&
 	    !triggered_wb && mapping_can_writeback(file->f_mapping)) {
 		const loff_t lstart = (loff_t)pgoff << PAGE_SHIFT;
 		const loff_t lend = lstart + HPAGE_PMD_SIZE - 1;
@@ -2801,7 +2810,7 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 			result = SCAN_ANY_PROCESS;
 		else
 			result = try_collapse_pte_mapped_thp(mm, addr,
-							     !cc->is_khugepaged);
+							cc->policy.install_pmd);
 		if (result == SCAN_PMD_MAPPED)
 			result = SCAN_SUCCEED;
 		mmap_read_unlock(mm);
@@ -2950,6 +2959,9 @@ static void khugepaged_do_scan(struct collapse_control *cc)
 
 	lru_add_drain_all();
 
+	/* One policy for the whole pass, so every table is judged the same */
+	collapse_policy_khugepaged(&cc->policy);
+
 	cc->progress = 0;
 	while (true) {
 		cond_resched();
@@ -3177,7 +3189,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	cc = kmalloc_obj(*cc);
 	if (!cc)
 		return -ENOMEM;
-	cc->is_khugepaged = false;
+	collapse_policy_forced(&cc->policy);
 	cc->progress = 0;
 
 	lru_add_drain_all();
-- 
2.54.0

