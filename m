Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1EF4973A0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590010; cv=none; b=jidrAKLfZmibjMEX/ABgWC5HEK9ucMMvSygsBvme36c9pd8Cc3Qei0v7Pz/qJoZKgyS/kz/uRu8YuRiOSyofiW2VhfEFgmhlzzWAeM/Pfi1EUI6GWVtFepDfkxc2cui0tIA4OVQwrQT9S14i1hsLOQJiJWaFcteriENszpg3yeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590010; c=relaxed/simple;
	bh=jlUmatKGCbfSwE3u4clgay1nIvM2E8QVjy8Ie6HtXOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZMxU1p8nM8potpTyhTcc1wtfMzJlDsQxhuxVOchMrseduo5PFmMjcpgYps7W0ziLTvT4B1RH6SixDs0k2mrEhDEQGjet6jFBKcmGOZAI7eGAdQ37FV2FS1geP/TVR11a1rksBbF68f7FSwl5KOWEzeT4xqi9CAVCos7u2iJ0xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=KSJE7icV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lQcy877x; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="KSJE7icV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lQcy877x"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 0A720EC0177;
	Mon, 28 Sep 2026 06:06:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 28 Sep 2026 06:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790590004; x=
	1790676404; bh=kr5nA2v/e5W+9+TFOSpS/DywY9tBWmBG9I0VL76MYX0=; b=K
	SJE7icVJzcLvbgEt+RV7v4BKZwQUW5D8/L/zgepwsUXhIHcZnwc93n+gkJISti8h
	r7xO0v0ankgFPaWo2uWF5CKi9lv9f1vYrU/hnXI79yHhsORmCSR8QTFS+24MWpOJ
	vf584rI0kFKpYUUD4yRrC8HHZpi5YcP7VPwTaz+gAV4fnTIcTqTOXSg5JszQFw/y
	0xVfqT6JfGs0csDQbshIvMI2QHi4eK3LbRcXPDEpvzpD3NLUvpYRbzHG4+RJ5O5z
	7txDohTTRlpSxrHnZ6a6VVayKVM52/PLn2wGfF997fSsW9sRFYFEu5scVkFPCcW9
	xoxyliIrK8lNR3iv2iWrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790590004; x=1790676404; bh=k
	r5nA2v/e5W+9+TFOSpS/DywY9tBWmBG9I0VL76MYX0=; b=lQcy877xrwawNEhf6
	juK+jaMgODYfwOFIXSrv29IwkOaF+Xa8+uB+gX6iTYO771dBwQBJ1Ko3t1eHZnHQ
	txj7lWxYo2bi/wjcYYUMRXj5aj+3Yfa4MFzu6raNB4+R9yEiQ8/ggrekoMOxuphK
	/bFMyXvWptAre/pbAh8y9l45LgvjTPPZeGWCe3VlA0NhJigvkCi5wxRBRWsdvTFg
	Ae4HOi0PwDJvVaUL4ZqVckUvjntd4V+BNO4u7Lbegamr9O1gG7uUU+C10+MCGo24
	XD2HMa/v1Lm0VyKYX8/AYrIHoADKJheWubO2aDDEQVf+Jv329fNfYFHvoVcujqWK
	IdyqQ==
X-ME-Sender: <xms:Mzy6ah4xjz1u43LakGI6NCTB-I5RqD-QNIEjIwCYv-9JhhhzXrfMAQ>
    <xme:Mzy6aq2cBXFyLZpJ_ggcvyP0fvy-zAs9hQHmIP2g92B37Y8jV1ARXpr-ZXYZAnm8m
    5Ce-TaYPEq9J-MZmBBs6Syv_w1wVFRVU-Al2ilwxfshzlI2bJwFxBM>
X-ME-Received: <xmr:Mzy6aum_hGJWN75tItq5_23LkwwuFEDf6jyxUI2WUO_n5Xarm5EahqdWiN4>
X-ME-Proxy-Cause: dmFkZTGMD42hMgRoykqOjUnjhQtIwxUkbQ7HJUm3r0v8qg4G+w5HsQqCTFJeONZOOlAoTZ
    3cCyUPpxIiSbyZ2Tu7YPa3AAj7sCTCV2iMmUuGeQ9O2nYvFx4pqQgu47FPrepCLtn5mR8Y
    TFpZu0gc0RK5+soBqa17Izn0t8458G4TUOMorf2iUNwoNcvIBqn6qB4EfUoYIj6v0KZGYR
    +H9V2caIQyvUMHhBp6HpDE9LGyk5fDiJXvaKgdPDp7u8Zi3Y25cXOb1RGde0EKV1CRBWLp
    8vgyxTPXFx2P0qBK8gg3C7juaiX7+nTPBAuBcmJzHDM+E8HDEZrS5vhGsuUSQCum3RfeDP
    qPYO2nbRmnQgMNm8Pyf+PUqt96fEBiMBt+NyyFhJ+gtMoMLdb753Sm3wevQjtm+VSa39kQ
    b+rkcmQIFDeZcU+fBHA9ji7Qa+iQ8vOCuHcweWaUeVtMRY21lCAVYK44Rh0TSNYE1urntu
    XvPHg9ECgFe+ymIm+hH3EzlsU11jzVfkpQ5L2ssXCbBMT8XQzoATWJ4HqPk2maENTh+Pvq
    MJ3g0uaXLFhBaFMTJpVadG1ErnleiRi9d2qcznmbkPelNFD2PkNZYsCjOQgpoPkd5cE1pa
    JLs7QKyul8/cFPNJSzmHqJvEDXtJqqkWn/3jvRsNWxOf9bQ5QdA4Wuy2yNqQ
X-ME-Proxy: <xmx:Mzy6agjlYlLuxtwZY7Jf33tQnieZ1upcNru5Z8FPl54W_7Gt-ncteA>
    <xmx:NDy6ajRnAA6EghSgBV4u1FYebtLdvnUJJh0dANYg1iiVVX_LKqRvMA>
    <xmx:NDy6athE_StQJhc9WHz7heFzZMcidGWtTFoDcDi0gg4DgbXVOvBm-Q>
    <xmx:NDy6anh_b1hYup0rPAMTFvT75EYHSTMBVXip8eW9LAiZ22_63B605g>
    <xmx:NDy6al5FeC-reELM-gDniBE7zXe_is-5zE-IZPgMi-KopzswvrDZ9Cei>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 06:06:43 -0400 (EDT)
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
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v4 05/13] mm/collapse: state what a collapse may do in the policy
Date: Mon, 28 Sep 2026 11:06:19 +0100
Message-ID: <20260928100630.21870-6-kirill@shutemov.name>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928100630.21870-1-kirill@shutemov.name>
References: <20260928100630.21870-1-kirill@shutemov.name>
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

The PTE limits come as two sets, one for a PMD-sized window and one for
anything smaller, so that the helpers pick a set for the order and read
it.  khugepaged takes no swapped-out or shared PTE into a sub-PMD window,
and empty PTEs only when the knob says all or nothing; the warning for a
knob value in between moves to where khugepaged fills its policy.  The
fields only one side reads say which: anon_ or file_.  David Hildenbrand
asked for both.

khugepaged fills the policy once per scan pass, MADV_COLLAPSE once per
call.  That is the one change in behaviour.  The max_ptes_* limits and the
defrag setting behind the allocation mask are sampled once per pass rather
than on every table.  A table scanned early in a pass and one scanned late
are then treated alike.

collapse_file() also drops a NULL check on the collapse_control.  It has
one call site, reached only from collapse_single_pmd(), which dereferences
cc unconditionally, so the check was already dead.

Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/collapse.h   |  41 +++++++++++++-
 mm/khugepaged.c | 147 +++++++++++++++++++++++++-----------------------
 2 files changed, 118 insertions(+), 70 deletions(-)

diff --git a/mm/collapse.h b/mm/collapse.h
index b115034d9018..dcd117071955 100644
--- a/mm/collapse.h
+++ b/mm/collapse.h
@@ -45,8 +45,47 @@ enum scan_result {
 	SCAN_PAGE_DIRTY_OR_WRITEBACK,
 };
 
+/* How many PTEs of a window may be missing, swapped out or shared */
+struct collapse_limits {
+	/* Counted over a PMD-sized window; HPAGE_PMD_NR means "no limit" */
+	unsigned int max_ptes_none;
+	unsigned int max_ptes_swap;
+	unsigned int max_ptes_shared;
+};
+
+/* What a collapse is allowed to do, decided by the caller that asks for it */
+struct collapse_policy {
+	/* Limits for a PMD-sized window */
+	struct collapse_limits pmd;
+
+	/*
+	 * Limits for a smaller window.  Its max_ptes_none is either 0 or
+	 * COLLAPSE_MAX_PTES_LIMIT, the latter meaning all but one PTE of the
+	 * window whatever its order; any other value counts as 0.
+	 */
+	struct collapse_limits sub_pmd;
+
+	/* Leave clean lazyfree folios to reclaim rather than collapse them */
+	bool anon_skip_lazyfree;
+
+	/* Refuse an anonymous range with no sign of use */
+	bool anon_require_referenced;
+
+	/* Map the PMD over a file collapse instead of leaving it to a fault */
+	bool file_install_pmd;
+
+	/* Write dirty pages back and retry once instead of refusing them */
+	bool file_writeback_dirty;
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
index 8889f75cf45f..667216ae15dd 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -314,30 +314,17 @@ static bool pte_none_or_zero(pte_t pte)
 static unsigned int collapse_max_ptes_none(struct collapse_control *cc,
 		struct vm_area_struct *vma, unsigned int order)
 {
-	const unsigned int max_ptes_none = khugepaged_max_ptes_none;
+	unsigned int max_ptes_none;
 
 	if (vma && userfaultfd_armed(vma))
 		return 0;
-	/* for MADV_COLLAPSE, allow any empty/shared zeropage PTEs */
-	if (!cc->is_khugepaged)
-		return HPAGE_PMD_NR;
-	/* for PMD collapse, respect the user defined maximum */
 	if (is_pmd_order(order))
-		return max_ptes_none;
-	/*
-	 * for mTHP collapse with the sysctl value set to COLLAPSE_MAX_PTES_LIMIT,
-	 * scale the maximum number of PTEs to the order of the collapse.
-	 */
+		return cc->policy.pmd.max_ptes_none;
+
+	/* Below PMD order: all but one PTE of the window, or none */
+	max_ptes_none = cc->policy.sub_pmd.max_ptes_none;
 	if (max_ptes_none == COLLAPSE_MAX_PTES_LIMIT)
 		return (1 << order) - 1;
-	/*
-	 * For mTHP collapse of values other than 0 or COLLAPSE_MAX_PTES_LIMIT,
-	 * emit a warning and return 0.
-	 */
-	if (max_ptes_none)
-		pr_warn_once("mTHP collapse does not support max_ptes_none"
-		     " values other than 0 or %u, defaulting to 0.\n",
-		     COLLAPSE_MAX_PTES_LIMIT);
 	return 0;
 }
 
@@ -353,20 +340,9 @@ static unsigned int collapse_max_ptes_none(struct collapse_control *cc,
 static unsigned int collapse_max_ptes_shared(struct collapse_control *cc,
 		unsigned int order)
 {
-	/*
-	 * For MADV_COLLAPSE, do not restrict the number of PTEs that map shared
-	 * anonymous pages.
-	 */
-	if (!cc->is_khugepaged)
-		return HPAGE_PMD_NR;
-	/*
-	 * for mTHP collapse do not allow collapsing anonymous memory pages that
-	 * are shared between processes.
-	 */
-	if (!is_pmd_order(order))
-		return 0;
-	/* for PMD collapse, respect the user defined maximum */
-	return khugepaged_max_ptes_shared;
+	if (is_pmd_order(order))
+		return cc->policy.pmd.max_ptes_shared;
+	return cc->policy.sub_pmd.max_ptes_shared;
 }
 
 /**
@@ -381,17 +357,9 @@ static unsigned int collapse_max_ptes_shared(struct collapse_control *cc,
 static unsigned int collapse_max_ptes_swap(struct collapse_control *cc,
 		unsigned int order)
 {
-	/*
-	 * For MADV_COLLAPSE, do not restrict the number PTEs entries or
-	 * pagecache entries that are non-present.
-	 */
-	if (!cc->is_khugepaged)
-		return HPAGE_PMD_NR;
-	/* for mTHP collapse do not allow any non-present PTEs or pagecache entries */
-	if (!is_pmd_order(order))
-		return 0;
-	/* for PMD collapse, respect the user defined maximum */
-	return khugepaged_max_ptes_swap;
+	if (is_pmd_order(order))
+		return cc->policy.pmd.max_ptes_swap;
+	return cc->policy.sub_pmd.max_ptes_swap;
 }
 
 int hugepage_madvise(struct vm_area_struct *vma,
@@ -678,7 +646,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		 * If the vma has the VM_DROPPABLE flag, the collapse will
 		 * preserve the lazyfree property without needing to skip.
 		 */
-		if (cc->is_khugepaged && !(vma->vm_flags & VM_DROPPABLE) &&
+		if (cc->policy.anon_skip_lazyfree && !(vma->vm_flags & VM_DROPPABLE) &&
 		    folio_test_lazyfree(folio) && !pte_dirty(pteval)) {
 			result = SCAN_PAGE_LAZYFREE;
 			goto out;
@@ -767,12 +735,12 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		if (folio_test_large(folio))
 			list_add_tail(&folio->lru, compound_pagelist);
 next:
-		if (cc->is_khugepaged &&
+		if (cc->policy.anon_require_referenced &&
 		    folio_pte_referenced(folio, vma, addr, pteval))
 			referenced++;
 	}
 
-	if (unlikely(cc->is_khugepaged && !referenced)) {
+	if (unlikely(cc->policy.anon_require_referenced && !referenced)) {
 		result = SCAN_LACK_REFERENCED_PAGE;
 	} else {
 		result = SCAN_SUCCEED;
@@ -938,9 +906,7 @@ static void khugepaged_alloc_sleep(void)
 	remove_wait_queue(&khugepaged_wait, &wait);
 }
 
-static struct collapse_control khugepaged_collapse_control = {
-	.is_khugepaged = true,
-};
+static struct collapse_control khugepaged_collapse_control;
 
 static bool collapse_scan_abort(int nid, struct collapse_control *cc)
 {
@@ -976,6 +942,52 @@ static inline gfp_t alloc_hugepage_khugepaged_gfpmask(void)
 	return khugepaged_defrag() ? GFP_TRANSHUGE : GFP_TRANSHUGE_LIGHT;
 }
 
+/* khugepaged collapses on its own initiative, so it obeys its own settings */
+static void collapse_policy_khugepaged(struct collapse_policy *p)
+{
+	p->pmd.max_ptes_none = READ_ONCE(khugepaged_max_ptes_none);
+	p->pmd.max_ptes_swap = READ_ONCE(khugepaged_max_ptes_swap);
+	p->pmd.max_ptes_shared = READ_ONCE(khugepaged_max_ptes_shared);
+
+	/*
+	 * A sub-PMD window takes no swapped-out and no shared PTE: reading
+	 * pages back or breaking CoW is not worth it for an mTHP.  Empty PTEs
+	 * it takes all or nothing, since anything in between would let one
+	 * collapse feed the next.
+	 */
+	p->sub_pmd.max_ptes_none = p->pmd.max_ptes_none;
+	if (p->sub_pmd.max_ptes_none &&
+	    p->sub_pmd.max_ptes_none != COLLAPSE_MAX_PTES_LIMIT)
+		pr_warn_once("mTHP collapse does not support max_ptes_none values other than 0 or %u, defaulting to 0.\n",
+			     COLLAPSE_MAX_PTES_LIMIT);
+	p->sub_pmd.max_ptes_swap = 0;
+	p->sub_pmd.max_ptes_shared = 0;
+
+	p->anon_skip_lazyfree = true;
+	p->anon_require_referenced = true;
+	p->file_install_pmd = false;
+	p->file_writeback_dirty = false;
+	p->gfp = alloc_hugepage_khugepaged_gfpmask();
+	p->tva_type = TVA_KHUGEPAGED;
+}
+
+/* MADV_COLLAPSE was asked for explicitly, so it is not held to those */
+static void collapse_policy_madvise(struct collapse_policy *p)
+{
+	p->pmd.max_ptes_none = HPAGE_PMD_NR;
+	p->pmd.max_ptes_swap = HPAGE_PMD_NR;
+	p->pmd.max_ptes_shared = HPAGE_PMD_NR;
+	/* Never read: MADV_COLLAPSE collapses to PMD order only */
+	p->sub_pmd = p->pmd;
+
+	p->anon_skip_lazyfree = false;
+	p->anon_require_referenced = false;
+	p->file_install_pmd = true;
+	p->file_writeback_dirty = true;
+	p->gfp = GFP_TRANSHUGE;
+	p->tva_type = TVA_FORCED_COLLAPSE;
+}
+
 #ifdef CONFIG_NUMA
 static int collapse_find_target_node(struct collapse_control *cc)
 {
@@ -1013,8 +1025,7 @@ static enum scan_result hugepage_vma_revalidate(struct mm_struct *mm, unsigned l
 		struct collapse_control *cc, unsigned int order)
 {
 	struct vm_area_struct *vma;
-	enum tva_type type = cc->is_khugepaged ? TVA_KHUGEPAGED :
-				 TVA_FORCED_COLLAPSE;
+	enum tva_type type = cc->policy.tva_type;
 
 	if (unlikely(collapse_test_exit_or_disable(mm)))
 		return SCAN_ANY_PROCESS;
@@ -1197,8 +1208,7 @@ static enum scan_result __collapse_huge_page_swapin(struct mm_struct *mm,
 static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_struct *mm,
 		struct collapse_control *cc, unsigned int order)
 {
-	gfp_t gfp = (cc->is_khugepaged ? alloc_hugepage_khugepaged_gfpmask() :
-		     GFP_TRANSHUGE);
+	gfp_t gfp = cc->policy.gfp;
 	int node = collapse_find_target_node(cc);
 	struct folio *folio;
 
@@ -1551,7 +1561,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER);
 	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
 	unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma, HPAGE_PMD_ORDER);
-	enum tva_type tva_flags = cc->is_khugepaged ? TVA_KHUGEPAGED : TVA_FORCED_COLLAPSE;
+	enum tva_type tva_flags = cc->policy.tva_type;
 	pmd_t *pmd;
 	pte_t *pte, *_pte, pteval;
 	int i;
@@ -1651,7 +1661,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		 * If the vma has the VM_DROPPABLE flag, the collapse will
 		 * preserve the lazyfree property without needing to skip.
 		 */
-		if (cc->is_khugepaged && !(vma->vm_flags & VM_DROPPABLE) &&
+		if (cc->policy.anon_skip_lazyfree && !(vma->vm_flags & VM_DROPPABLE) &&
 		    folio_test_lazyfree(folio) && !pte_dirty(pteval)) {
 			result = SCAN_PAGE_LAZYFREE;
 			failed_pfn = folio_pfn(folio);
@@ -1717,13 +1727,13 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 			goto out_unmap;
 		}
 
-		if (cc->is_khugepaged &&
+		if (cc->policy.anon_require_referenced &&
 		    folio_pte_referenced(folio, vma, addr, pteval))
 			referenced++;
 	}
-	if (cc->is_khugepaged &&
-		   (!referenced ||
-		    (unmapped && referenced < HPAGE_PMD_NR / 2))) {
+	if (cc->policy.anon_require_referenced &&
+	    (!referenced ||
+	     (unmapped && referenced < HPAGE_PMD_NR / 2))) {
 		result = SCAN_LACK_REFERENCED_PAGE;
 	} else {
 		result = SCAN_SUCCEED;
@@ -2582,11 +2592,11 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	xas_unlock_irq(&xas);
 
 	/*
-	 * Remove pte page tables, so we can re-fault the page as huge.
-	 * If MADV_COLLAPSE, adjust result to call try_collapse_pte_mapped_thp().
+	 * Remove pte page tables, so we can re-fault the page as huge.  A
+	 * caller that wants the PMD mapped now is told to go and do that.
 	 */
 	retract_page_tables(mapping, start);
-	if (cc && !cc->is_khugepaged)
+	if (cc->policy.file_install_pmd)
 		result = SCAN_PTE_MAPPED_HUGEPAGE;
 	folio_unlock(new_folio);
 
@@ -2773,11 +2783,8 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 retry:
 	result = collapse_scan_file(mm, addr, file, pgoff, cc);
 
-	/*
-	 * For MADV_COLLAPSE, when encountering dirty pages, try to writeback,
-	 * then retry the collapse one time.
-	 */
-	if (!cc->is_khugepaged && result == SCAN_PAGE_DIRTY_OR_WRITEBACK &&
+	/* Dirty pages are worth a writeback and one more try, if asked for */
+	if (cc->policy.file_writeback_dirty && result == SCAN_PAGE_DIRTY_OR_WRITEBACK &&
 	    !triggered_wb && mapping_can_writeback(file->f_mapping)) {
 		const loff_t lstart = (loff_t)pgoff << PAGE_SHIFT;
 		const loff_t lend = lstart + HPAGE_PMD_SIZE - 1;
@@ -2794,7 +2801,7 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 			result = SCAN_ANY_PROCESS;
 		else
 			result = try_collapse_pte_mapped_thp(mm, addr,
-							     !cc->is_khugepaged);
+							cc->policy.file_install_pmd);
 		if (result == SCAN_PMD_MAPPED)
 			result = SCAN_SUCCEED;
 		mmap_read_unlock(mm);
@@ -2943,6 +2950,8 @@ static void khugepaged_do_scan(struct collapse_control *cc)
 
 	lru_add_drain_all();
 
+	collapse_policy_khugepaged(&cc->policy);
+
 	cc->progress = 0;
 	while (true) {
 		cond_resched();
@@ -3170,7 +3179,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	cc = kmalloc_obj(*cc);
 	if (!cc)
 		return -ENOMEM;
-	cc->is_khugepaged = false;
+	collapse_policy_madvise(&cc->policy);
 	cc->progress = 0;
 
 	lru_add_drain_all();
-- 
2.54.0

