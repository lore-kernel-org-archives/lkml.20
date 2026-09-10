Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9663A486639
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041794; cv=none; b=IolgroVEqvTTL5pELDbc41wOvsMUrxAzJMfbyGQmX6l1sQz5HC7pOzadoC7YHj/wLAlyJa860VkPwJg0YSb/0uK/3LQ4sILdJ6dyrm9PK4YcsK0E2pOQ0TmQsO9G4eKrWMFoZZETv0yC8o3C67deaV1O2XTOs3l46BRmv2EpcuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041794; c=relaxed/simple;
	bh=NR/LcEKDkCGT0y0VxK3lPGCDkKuIoiTqcZhAg6L+CaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sb8LbftWDA7G/UneUQWDwbWTHDGL/2ME0WVqnw4YkhYV9lO6RM1ZgaXDKtNtb9NBcUKf9ycELLNyi8Cxy0McWufCRjWDFU0VoSPpHYtOhIfT3/me+Vk3hhvEHKFOQy5J1DsNiZN5AHPT80Zs4ARWcrJ829mo03XzfvwWSHUxsx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=AFLreenn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F0b2S71Y; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="AFLreenn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F0b2S71Y"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 8661C1D0006F;
	Thu, 10 Sep 2026 08:03:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 10 Sep 2026 08:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789041791; x=
	1789128191; bh=q0JyoZbmyblE9u75HKEHqN4ei8zPfvwntibjbDEyo6k=; b=A
	FLreenn/FKiN76vFFDo7ezg7+h5fUlfERrFlbWnzdgZkxHtyZdLuN9UWj/Xo3TR4
	EWI2aVmPgnLHibn9fUnlRdCskXtz4rbSaiJFsRGCdqfBoQus49TX86CZxGN171HS
	BjhATunS8qCehWn0CPlettdJxcIb6ZnW4+W4itlQHRb7rbo2rwP99RyL9HPwTk0G
	DlvlQ0JPmXya79GVdL5gW92o5aQc08qzM2aFD2DojBXgMB/L+oqXusvsL0wogcCd
	o5WeqdNmEpzhBToFHSAYYXN5oBucL5shVq+ZX37ncX0M+iztEAKhYtT0725Ft3Yb
	Q3LChs9ExYiztWAY77UZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789041791; x=1789128191; bh=q
	0JyoZbmyblE9u75HKEHqN4ei8zPfvwntibjbDEyo6k=; b=F0b2S71Y36jbXPMSH
	QFQuddPwPMhuJLoaSOwi6ZKPZ7SZoEvhRJUwWEs+7JWjyJClCCyl28BOmQABc9oO
	IauGAlvOLVF+9BHKVkhURQzEYl/L2dTC2oTYgSwV6cPhvagxjtlGlHVh1owNflId
	MWyU5D0m77KIhm+7VCXauH9CwPZ9waFJOWPfCL/BIWwID1lXthgYcNntHmhZJCSI
	54bH8lNiiIe5+76zcBanpDuA71oFLdrMMc2R+VQzw74wxuutg/eAf/f7avyDzMrU
	D6HI4tsyRppOc6t+pcRNDI/SmVrwod3F47rWrh+8u1HxNOYPzgcZeViw7XFsYUUB
	vKrTw==
X-ME-Sender: <xms:f5yianrlduVRTI_zPt8qvaSKb9pARwjzjmf673xpOrhHA7Orw0bwng>
    <xme:f5yiatkPiCciZaw6-gEGNnWY6yp6nTkzrHCsYbEzNrTdersxTwHbLGPujB_jJaI05
    JGGW8zpy5a0_PSaUiUUYajal4U9NhZtrZBqFXB025nHIPl-0VEPrCJl>
X-ME-Received: <xmr:f5yiaqVRGaCt7lncypYXiKZ0kw2f2lbFdmKK1uiDZMe3AdsM0RZvlOvvH_8>
X-ME-Proxy-Cause: dmFkZTEVCHaom43ud29NDpH2Ao3u7HJ/1ECQvA0KKWbvYxhttLa4TfzKR6zF5UuYx3UdSX
    No90AnuR4y57x1CX4a9AAsMV1JR4eQYCvRkfoTmW6C9Lc6lI8AZbTNwmqz4UTzT3vnk7qg
    ph+TCI1xI7srBtDO6Tg5MLzI4vqgzAzQGVqRHCjhPRmxizMOs2MvZfOp4fytB88FrNmNEM
    gORbCSjN6PT3vgIUt7WNrJZsAWFpVymtt3pMoPYb3jF9rU+m42uK7S67tVqaIc+biyrQXs
    /trDbiCnZfBDKlB4R/Y3z4EcguiWXCyuMp2o4aP4AZn5jbn1xeIsCoHcLAwPh3Pk2CuoKe
    z9gEfZbTx/s1NRbY0jw8R+QgBvZ0u9iB6GeqgbbrprwZ22eKYswqdWvNOA3y2DzUhzgifJ
    L53mMQtzGsi8vSL/IvC+q3HdiZUi9t5dgSeX+YtwXNJa7ADsBMfmglT/I2qmbIDhzGScte
    RJjv3ehRhULU3HZ3XbvpWYtZsWv6O0Zkxn35AopAZA9dvcjzKlmDJv6kdFgXlqwfKUONgk
    7F06cG+mHPizviSr6lePKtukpa6+OGV3R1JWhNCMHndZK+FsrVTG8zWeIbFh0hFzyuoVoq
    FTfk9M6RLNhEUYFvbPZ8zHbCVbtEsAs1dZzM3yRDwyQgKwmEWN0r2/rzs9zg
X-ME-Proxy: <xmx:f5yiahTa42aaScDMyYJi4NIeOdkrbRYuQUZashShlyvREubINww0Kw>
    <xmx:f5yialCFIfTVSOkRnyrbMZM4t6tfPSSA4VN_noe3uLB4iy_X1wbnkw>
    <xmx:f5yiasQ-9PIxVxzRl0OmdOewdChyt-QOO846Q1-rp0iYleW-QTlfhQ>
    <xmx:f5yiavTwsQHbgy4Bwv12nrwC5EovNDJehUtLMBQ2LnB-gQq3wRBDww>
    <xmx:f5yiaqhAxo9QNzwRym1aPC0lWuC588mWhaDJSVK-pxWv-PBkeCMwTQZl>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 08:03:10 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v2 10/12] mm/collapse: work out the orders a VMA allows once per VMA
Date: Thu, 10 Sep 2026 13:02:30 +0100
Message-ID: <20260910120238.2529819-11-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910120238.2529819-1-kirill@shutemov.name>
References: <20260910120238.2529819-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The scan asked collapse_possible_orders() for every PTE table, for an
answer that is a property of the VMA.  Both callers walk a VMA a table at
a time, so let them work it out once and pass the mask in.  It is only
good while the lock that produced it is held, so madvise_collapse() takes
it again after every collapse.

The mask is then sampled once per VMA rather than once per table.  A thp
enabled knob written during a walk takes effect one VMA later, and cannot
widen a collapse: hugepage_vma_revalidate() tests the order again under
the lock the collapse retakes.

Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 9bdf12128357..9e77f71a788d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1551,12 +1551,12 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
 }
 
 static enum scan_result collapse_scan_anon_pmd(struct vm_area_struct *vma,
-		unsigned long start_addr, struct collapse_control *cc)
+		unsigned long start_addr, struct collapse_control *cc,
+		unsigned long enabled_orders)
 {
 	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER);
 	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
 	unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma, HPAGE_PMD_ORDER);
-	enum tva_type tva_flags = cc->policy.tva_type;
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t *pmd;
 	pte_t *pte, *_pte, pteval;
@@ -1567,7 +1567,6 @@ static enum scan_result collapse_scan_anon_pmd(struct vm_area_struct *vma,
 	struct folio *folio = NULL;
 	unsigned long failed_pfn = -1;
 	unsigned long addr;
-	unsigned long enabled_orders;
 	spinlock_t *ptl;
 	int node = NUMA_NO_NODE, unmapped = 0;
 
@@ -1581,8 +1580,6 @@ static enum scan_result collapse_scan_anon_pmd(struct vm_area_struct *vma,
 
 	collapse_scan_reset(cc);
 
-	enabled_orders = collapse_possible_orders(vma, vma->vm_flags, tva_flags);
-
 	/*
 	 * If PMD is the only enabled order, enforce max_ptes_none, otherwise
 	 * scan all pages to populate the bitmap for mTHP collapse. The bitmap
@@ -2762,7 +2759,8 @@ static void collapse_control_release(struct collapse_control *cc)
 }
 
 static enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
-		unsigned long addr, struct collapse_control *cc)
+		unsigned long addr, struct collapse_control *cc,
+		unsigned long orders)
 {
 	enum scan_result result;
 	pgoff_t pgoff;
@@ -2775,7 +2773,7 @@ static enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
 	}
 
 	if (vma_is_anonymous(vma))
-		return collapse_scan_anon_pmd(vma, addr, cc);
+		return collapse_scan_anon_pmd(vma, addr, cc, orders);
 
 	pgoff = linear_page_index(vma, addr);
 	result = collapse_scan_file(vma->vm_mm, addr, vma->vm_file, pgoff, cc);
@@ -2896,15 +2894,17 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 
 	vma_iter_init(&vmi, mm, khugepaged_scan.address);
 	for_each_vma(vmi, vma) {
-		unsigned long hstart, hend;
+		unsigned long hstart, hend, orders;
 
 		cond_resched();
 		if (unlikely(collapse_test_exit_or_disable(mm))) {
 			cc->progress++;
 			break;
 		}
-		if (!collapse_possible_orders(vma, vma->vm_flags,
-					      TVA_KHUGEPAGED)) {
+		/* One mask for the whole VMA */
+		orders = collapse_possible_orders(vma, vma->vm_flags,
+						  cc->policy.tva_type);
+		if (!orders) {
 			cc->progress++;
 			continue;
 		}
@@ -2933,7 +2933,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 			/* move to next address */
 			khugepaged_scan.address += HPAGE_PMD_SIZE;
 
-			*result = collapse_scan_pmd(vma, addr, cc);
+			*result = collapse_scan_pmd(vma, addr, cc, orders);
 			/* Nothing to collapse here, and the lock is still ours */
 			if (*result != SCAN_SUCCEED) {
 				if (cc->progress >= progress_max)
@@ -3217,14 +3217,16 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 {
 	struct collapse_control *cc;
 	struct mm_struct *mm = vma->vm_mm;
-	unsigned long hstart, hend, addr;
+	unsigned long hstart, hend, addr, orders;
 	enum scan_result last_fail = SCAN_FAIL;
 	int thps = 0;
 
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
 
-	if (!collapse_possible_orders(vma, vma->vm_flags, TVA_FORCED_COLLAPSE))
+	orders = collapse_possible_orders(vma, vma->vm_flags,
+					  TVA_FORCED_COLLAPSE);
+	if (!orders)
 		return -EINVAL;
 
 	hstart = ALIGN(start, HPAGE_PMD_SIZE);
@@ -3262,9 +3264,11 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 			}
 			vma = found;
 			hend = min(hend, vma->vm_end & HPAGE_PMD_MASK);
+			orders = collapse_possible_orders(vma, vma->vm_flags,
+							  cc->policy.tva_type);
 		}
 
-		result = collapse_scan_pmd(vma, addr, cc);
+		result = collapse_scan_pmd(vma, addr, cc, orders);
 		/* Nothing to collapse here, and the lock is still ours */
 		if (result != SCAN_SUCCEED)
 			goto tally;
-- 
2.54.0

