Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766794EC66B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534653; cv=none; b=hOVXlgaG4CaZLxyfB4C0iKcq47wAp6lJ6a76QV1rAjaDaEu/NUP29l2HSdnqQvfSz0hUn6y6HAv7JVpQ6PEbpNAlKYxNrVJUkto2ApQxppg8q0BkFx4Mv8zcCiuZorQCu+stQWxNdIZHfudcpYRz/jBlIIaBvJl3rAiqql/+XvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534653; c=relaxed/simple;
	bh=bzO8l7iY2sS3LRuVxwWLB8LUyo4/Eq3WtuDcZflS43Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGlHIIlyREzIVVQuPAajwCs6grTAxLrUO4o/7sK35N48uEELYuLT8M1PN/hil+I5+kTMuUUVoVjww9ZsxuusKJIvfBDBH7PY8e8cBiNMFlkz3/oRDxudvAXb9X7VmwVxplpEEn2LeUD0ZSkkyrNenDf+xO/Y2jaChr0WbSvEoOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=hQ6Tp+Ke; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U5+vtqbo; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="hQ6Tp+Ke";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U5+vtqbo"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 605FA1400106;
	Fri,  4 Sep 2026 11:10:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 04 Sep 2026 11:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788534650; x=
	1788621050; bh=IyGYt/hGSRRfip2XU7o0oYq5+nS3sb9WHKUu0hUMGJs=; b=h
	Q6Tp+KevTAL6klGeElULZhwBqt2vBtH+Rb+By+1KsAo+tGSTxklPVxEYarT6yx+z
	7MXi1TiarSEFZpUJDrM27bnCV1WJ2bnWqKzcpjFSoQoBxlCOqn98WTk6ZCUmLSvM
	+kkugRC82knUvSVjcidxCAZeIL3CZ+MeZZnpnxkV9RkPBh6qOZtUM62USenPj1Kh
	jBilwgz/krits9LLm1clhkzPHjC2GBwajiXgnBmLtDEh6r4dXB8DHJe/lghz0UYb
	Fd3x+r5A5kktD006Hy/knALpUdbYtmlw6z2KZu1pbp8geZy1tDQEg/tfdEAtb0hJ
	SCxcBrPE38ikwcX0dDdRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788534650; x=1788621050; bh=I
	yGYt/hGSRRfip2XU7o0oYq5+nS3sb9WHKUu0hUMGJs=; b=U5+vtqbocwSs8M5p4
	OfvVBotzWFoSSF3/iNLmjaoVMz7vvALSsIBriEbS4bTyw+JW3BwpYtUYHLoaqA5p
	4xUNhtrKUoN1SS7osx1oMWszSE7fVu6/wByk/ZLPGarmHCeBiKwrViDfnGUvZMCN
	JPsD5veAROMMJeM+qqLmkM6rimBKFDKyY/3dpztrNLw2i+LEQ2VRDbmmZ8+BDDjz
	kaT981QAgQccWfJUxSfIeIfR9xbqzSs1gIpYy6Vh2Zt/Lgft+hufZxNUnzLa+1J6
	5B2UQdrAyq7QK5X9RJJzXJauI283jq6kH47Vs/tgxksjlL1eegARtlmeyu7lzTl+
	cx8kA==
X-ME-Sender: <xms:et-aajqzv8If1Pzex8taJmsTysiTCytnZh2KM-ZC9EVVMH9x6b7vcQ>
    <xme:et-aapkqYvX8PVdDjnFNk21Xx4jFuOE1buAOCrB9CvJrJrti_pZgy_m365l47H-9V
    qyidlrM_pu76oUDdBNOHfenB_enT7awdaCnMCyC_cwAxxa3GHgvF8g8>
X-ME-Received: <xmr:et-aamU1_2IuuG6Vtegnih1LCmsdjOZWNAvD3nkxAcKfjJHx2O_3Hlyw77A>
X-ME-Proxy-Cause: dmFkZTFdOocfRN4jOpcQf0AqfSai/YCGo+xlO94MLvzn7lqitof50EENUNEgJzLPt2H+RQ
    DWgrwJL5dg2BaLkWQfjz0w8mX09EzID7A24sM1R0CcrzJ0aCsxP+pgO1accdG5RnvXKoNP
    Qi2+ranCgsFBQlrx3RUM64Xgm9l9zr2TPWbzFNtan3mUwkVlJ/gBEGXolzLuuMZ3CJ6e8L
    gmzum6oDDF3av5ecJE/wINba64+XlYa/U9oL8c0Dkr16eu3wp8w8wOsHTRTsCgO4oV0meO
    0fb7rtZliPO8XPlA3k/rGcTv+01JWMnSe6fG3OACTE4UctUjoP9cM2YnBbUckeF0hhckL5
    D6MHrUzf167y2omQL0hymJoFC8UpYyFDv/iBC5j4SYdLZ84BhZnQdV7WTJmUex23TQmx1h
    gjgtmvz28+cPVK/JOJqAk+MNlvRziAEZ+CTcq0wtB0tp6LhJcm02nOa/ojCMYITHqb24A7
    QIqUCFztbGQ+NHmwRoRVMAhkTPbFHhTTCa4PD3iaWyXlHN0H6ZMmAvUd2dPwR4gEgwXbGx
    uk8dkf2xdbLJbLQfCbfCYZe81/Gzhlg+sy8BCfAmWyKlKsqP3LRm5mQ7PMvMI7NYBG1G65
    JdoexBRqSTE0TqifcgFHhWz9ADIfHMm6UETnZObymJ+CMf79bNsYA0KDTw5g
X-ME-Proxy: <xmx:et-aatRSZGIxC18fbKpOQEnTEegrLO89PHMh5m5WxthSW0kmgOHpHA>
    <xmx:et-aahBvUUczV1drlHQontNedgfLKdObGLvIfK3llWZ21kXHoM1GOw>
    <xmx:et-aaoRFXWcpwkUvudYLX3NVANRBQg7K-LoENulRAlGXxgfI3Q2lEg>
    <xmx:et-aarRQeqfU4VNefSfp6jTHZ1wCzQIBgHpLDeOPfJ-BlavpBaBC_g>
    <xmx:et-aamhkqVoqDQnd0aN1_PVcEu72_xwDDPPmgmPeHMzVqmdgvZ6PYKJl>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 11:10:49 -0400 (EDT)
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
Subject: [PATCH 11/12] mm/collapse: declare the collapse interface in collapse.h
Date: Fri,  4 Sep 2026 16:10:25 +0100
Message-ID: <3b698ec5d0d8f2fe51a298369778cb7d6a6a1f4b.1788533997.git.kas@kernel.org>
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

A collapse takes four calls:

  - collapse_control_init() - set up the control a caller carries;
  - collapse_scan_pmd() - scan one PTE table, under mmap_lock;
  - collapse_run_pmd() - collapse what the scan found, no mmap_lock;
  - collapse_control_release() - done with the control.

All four are static in khugepaged.c, as are collapse_possible_orders(),
which says what a VMA allows, and the revalidate a caller needs once a
collapse has given the mmap_lock up.  No other file can ask for a collapse
without them.

Declare them in collapse.h, with a comment stating the order they are
called in and who holds the lock over each step.

hugepage_vma_revalidate() becomes collapse_vma_revalidate(): it is part of
what a collapse offers now, not a helper of the daemon.

Preparation for implementing MADV_COLLAPSE in madvise.c.

No functional change.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/collapse.h   | 44 ++++++++++++++++++++++++++++++++++++++++++++
 mm/khugepaged.c | 18 +++++++++---------
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/mm/collapse.h b/mm/collapse.h
index f03cad8ed40e..c5773e273e15 100644
--- a/mm/collapse.h
+++ b/mm/collapse.h
@@ -116,4 +116,48 @@ struct collapse_control {
 	pgoff_t scan_pgoff;
 };
 
+/* Which orders a VMA may collapse to, zero when it may not collapse at all */
+unsigned long collapse_possible_orders(struct vm_area_struct *vma,
+		vm_flags_t vm_flags, enum tva_type tva_flags);
+
+/*
+ * A caller states what it allows in cc->policy and then hands over one PTE
+ * table's worth of a VMA at a time:
+ *
+ *     collapse_control_init(cc)         once, before the first table
+ *     collapse_scan_pmd(vma, addr, ...) per table
+ *     collapse_run_pmd(mm, addr, cc)    when a scan found work
+ *     collapse_control_release(cc)      once, when done with the control
+ *
+ * The caller holds mmap_lock for reading over the scan and passes an address
+ * within @vma, aligned to the PTE table the scan is to judge.
+ *
+ * The scan returns with that lock still held.  It only reads, and almost every
+ * table it is offered has nothing to collapse, so a caller walks a whole VMA
+ * under the one lock it took to get there.  SCAN_SUCCEED means there is
+ * something to collapse; anything else is why there is not.
+ *
+ * The run is called without the lock and returns without it, taking what it
+ * needs in between: what it does -- allocate, isolate, copy, flush -- is slow
+ * enough that a writer would wait behind it.  The caller gives the lock up
+ * first, and with it @vma and anything derived under it, so a caller carrying
+ * on has to look up again with collapse_vma_revalidate().  The run revalidates
+ * for itself rather than trusting what the scan saw.
+ *
+ * A scan that found something has to be run: the file side takes a reference on
+ * the file while it still has the VMA to take it from, and the run is what
+ * gives it back.
+ */
+void collapse_control_init(struct collapse_control *cc);
+void collapse_control_release(struct collapse_control *cc);
+enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
+		unsigned long addr, struct collapse_control *cc,
+		unsigned long orders);
+enum scan_result collapse_run_pmd(struct mm_struct *mm, unsigned long addr,
+		struct collapse_control *cc);
+enum scan_result collapse_vma_revalidate(struct mm_struct *mm,
+		unsigned long address, bool expect_anon,
+		struct vm_area_struct **vmap, struct collapse_control *cc,
+		unsigned int order);
+
 #endif	/* __MM_COLLAPSE_H */
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index f862abb1dbbd..13c4dbf04379 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -498,7 +498,7 @@ void __khugepaged_enter(struct mm_struct *mm)
  * Check what orders are possible based on the vma and collapse type.
  * This is used to determine if mTHP collapse is a viable option.
  */
-static unsigned long collapse_possible_orders(struct vm_area_struct *vma,
+unsigned long collapse_possible_orders(struct vm_area_struct *vma,
 		vm_flags_t vm_flags, enum tva_type tva_flags)
 {
 	unsigned long orders;
@@ -1016,7 +1016,7 @@ static int collapse_find_target_node(struct collapse_control *cc)
  * Returns enum scan_result value.
  */
 
-static enum scan_result hugepage_vma_revalidate(struct mm_struct *mm, unsigned long address,
+enum scan_result collapse_vma_revalidate(struct mm_struct *mm, unsigned long address,
 		bool expect_anon, struct vm_area_struct **vmap,
 		struct collapse_control *cc, unsigned int order)
 {
@@ -1264,7 +1264,7 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
 	}
 
 	mmap_read_lock(mm);
-	result = hugepage_vma_revalidate(mm, pmd_addr, /*expect_anon=*/ true,
+	result = collapse_vma_revalidate(mm, pmd_addr, /*expect_anon=*/ true,
 					 &vma, cc, order);
 	if (result != SCAN_SUCCEED) {
 		mmap_read_unlock(mm);
@@ -1299,7 +1299,7 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
 	 * mmap_lock.
 	 */
 	mmap_write_lock(mm);
-	result = hugepage_vma_revalidate(mm, pmd_addr, /*expect_anon=*/ true,
+	result = collapse_vma_revalidate(mm, pmd_addr, /*expect_anon=*/ true,
 					 &vma, cc, order);
 	if (result != SCAN_SUCCEED)
 		goto out_up_write;
@@ -2754,13 +2754,13 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 	return result;
 }
 
-static void collapse_control_init(struct collapse_control *cc)
+void collapse_control_init(struct collapse_control *cc)
 {
 	cc->progress = 0;
 	cc->scan_file = NULL;
 }
 
-static void collapse_control_release(struct collapse_control *cc)
+void collapse_control_release(struct collapse_control *cc)
 {
 	/* A scan that took a file reference should have been run */
 	if (WARN_ON_ONCE(cc->scan_file)) {
@@ -2769,7 +2769,7 @@ static void collapse_control_release(struct collapse_control *cc)
 	}
 }
 
-static enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
+enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
 		unsigned long addr, struct collapse_control *cc,
 		unsigned long orders)
 {
@@ -2793,7 +2793,7 @@ static enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
 	return SCAN_SUCCEED;
 }
 
-static enum scan_result collapse_run_pmd(struct mm_struct *mm,
+enum scan_result collapse_run_pmd(struct mm_struct *mm,
 		unsigned long addr, struct collapse_control *cc)
 {
 	struct file *file = cc->scan_file;
@@ -3237,7 +3237,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 		if (!vma) {
 			cond_resched();
 			mmap_read_lock(mm);
-			result = hugepage_vma_revalidate(mm, addr, false, &found,
+			result = collapse_vma_revalidate(mm, addr, false, &found,
 							 cc, HPAGE_PMD_ORDER);
 			if (result != SCAN_SUCCEED) {
 				last_fail = result;
-- 
2.54.0

