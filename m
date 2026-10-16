Received: from mta0.migadu.com (out-192.mta0.migadu.com [91.218.175.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789EA477285
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145312; cv=none; b=EFqxz+bGhcQ35DCq050eRolnDPKHGctgHhKzzbW8r/HoDV2Pr73LcenhyIXwOE29htirTzA0yu7LkqTOe5/Ppz/8/gYGg/UyXN9lgySdFw8s9abPMJPxAu8c6Zau0PQGY8Z+8H4Rzi7Yq+EaZWb68pxJyP605oVvtq7eoOSFmdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145312; c=relaxed/simple;
	bh=VkaQ74nVvNMSjZ0m5Mv4ONFzqQIhNe/gV0/4kSU6DVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kIvl/yvoXiiQfKao2v2t6LxuZccKYi3Oby/kiuILrgEiLnItXLwTyQ9nBfR2tSOFnwu6rlBIKnWPfF7K8kos7QhdfCBkn62koiUf3SUlfTE99hS/WvlMWXHKca0rzFb4VJTnzLw/WSIHGmzuWYE4h9oS5XEBPXjyjipyYhrqlKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MJdy8v8L; arc=none smtp.client-ip=91.218.175.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MJdy8v8L"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VkaQ74nVvNMSjZ0m5Mv4ONFzqQIhNe/gV0/4kSU6DVw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792145308; v=1; x=1792750108;
 b=MJdy8v8L7aMfuySAWzz/3PRWNtxCxaX8NJesYtJuur+vAIUmg0xr6zMABpDAcxlXggiNZbTi
 9s86GBlsvChdsp0mbpOAKVtfsclQpCNWEF8itQ8oRBXFJ3TrFt0js2vZJeCMfrBXdQsN+mYjiR7
 ElxCEhYlb/d5SgR8sgdMQVqY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2bce104875b9a9d6;
	Fri, 16 Oct 2026 10:08:28 +0000
X-Mizu-Trace-ID: 2bce104875b9a9d6
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 4/5] mm: hugetlb: avoid recursive CMA allocation during migration
Date: Fri, 16 Oct 2026 18:07:35 +0800
Message-ID: <d145aeb815b318ddd4dd9058d20038acfe5dc1bb.1792136742.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1792136742.git.zhengqi.arch@bytedance.com>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qi Zheng <zhengqi.arch@bytedance.com>

Contiguous allocation can migrate allocated HugeTLB folios or replace free
HugeTLB folios while holding a CMA allocation mutex. Allocating a
replacement through CMA would recurse into that allocation path once
non-gigantic HugeTLB pages can use CMA.

Add a fresh allocation helper that bypasses CMA, and use it for free folio
replacement. Pass an explicit allow_cma argument through the migration
allocation API and disable it for MR_CONTIG_RANGE. Honor hugetlb_cma_only
by failing fresh allocation when the corresponding size requires CMA.

The existing gigantic migration restriction is unchanged.

Assisted-by: LLM
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/hugetlb.h |  4 ++--
 mm/hugetlb.c            | 45 ++++++++++++++++++++++++++++++++---------
 mm/mempolicy.c          |  2 +-
 mm/migrate.c            |  3 ++-
 4 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 5029c72418631..38612f7b3478f 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -736,7 +736,7 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
 				unsigned long addr, bool cow_from_owner);
 struct folio *alloc_hugetlb_folio_nodemask(struct hstate *h, int preferred_nid,
 				nodemask_t *nmask, gfp_t gfp_mask,
-				bool allow_alloc_fallback);
+				bool allow_alloc_fallback, bool allow_cma);
 struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
 					  nodemask_t *nmask, gfp_t gfp_mask);
 
@@ -1172,7 +1172,7 @@ alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
 static inline struct folio *
 alloc_hugetlb_folio_nodemask(struct hstate *h, int preferred_nid,
 			nodemask_t *nmask, gfp_t gfp_mask,
-			bool allow_alloc_fallback)
+			bool allow_alloc_fallback, bool allow_cma)
 {
 	return NULL;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 9d569eae852c5..218fbaee6f7e5 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1860,8 +1860,7 @@ static struct folio *only_alloc_fresh_hugetlb_folio(struct hstate *h,
 }
 
 /*
- * Common helper to allocate a fresh hugetlb folio. All specific allocators
- * should use this function to get new hugetlb folio
+ * Common helper to allocate a fresh hugetlb folio.
  *
  * Note that returned folio is 'frozen':  ref count of head page and all tail
  * pages is zero, and the accounting must be done in the caller.
@@ -1877,6 +1876,30 @@ static struct folio *alloc_fresh_hugetlb_folio(struct hstate *h,
 	return folio;
 }
 
+/*
+ * Contiguous allocation can replace or migrate hugetlb pages while holding
+ * a CMA allocation mutex. Do not recurse into CMA to allocate replacements.
+ */
+static struct folio *alloc_fresh_hugetlb_folio_nocma(struct hstate *h, gfp_t gfp_mask,
+						     int nid, nodemask_t *nmask)
+{
+	struct folio *folio;
+	unsigned int order = huge_page_order(h);
+
+	if (hugetlb_cma_exclusive_alloc(order))
+		return NULL;
+
+	if (nid == NUMA_NO_NODE)
+		nid = numa_mem_id();
+
+	folio = alloc_buddy_frozen_folio(order, gfp_mask, nid, nmask, NULL);
+	if (folio) {
+		init_new_hugetlb_folio(folio);
+		hugetlb_vmemmap_optimize_folio(h, folio);
+	}
+	return folio;
+}
+
 void prep_and_add_allocated_folios(struct hstate *h,
 				   struct list_head *folio_list)
 {
@@ -2139,14 +2162,17 @@ static struct folio *alloc_surplus_hugetlb_folio(struct hstate *h,
 }
 
 static struct folio *alloc_migrate_hugetlb_folio(struct hstate *h, gfp_t gfp_mask,
-				     int nid, nodemask_t *nmask)
+				     int nid, nodemask_t *nmask, bool allow_cma)
 {
 	struct folio *folio;
 
 	if (hstate_is_gigantic(h))
 		return NULL;
 
-	folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask);
+	if (allow_cma)
+		folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask);
+	else
+		folio = alloc_fresh_hugetlb_folio_nocma(h, gfp_mask, nid, nmask);
 	if (!folio)
 		return NULL;
 
@@ -2219,7 +2245,8 @@ struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
 
 /* folio migration callback function */
 struct folio *alloc_hugetlb_folio_nodemask(struct hstate *h, int preferred_nid,
-		nodemask_t *nmask, gfp_t gfp_mask, bool allow_alloc_fallback)
+		nodemask_t *nmask, gfp_t gfp_mask, bool allow_alloc_fallback,
+		bool allow_cma)
 {
 	struct folio *folio = NULL;
 
@@ -2238,7 +2265,7 @@ struct folio *alloc_hugetlb_folio_nodemask(struct hstate *h, int preferred_nid,
 			gfp_mask |= __GFP_THISNODE;
 
 		folio = alloc_migrate_hugetlb_folio(h, gfp_mask, preferred_nid,
-						    nmask);
+						    nmask, allow_cma);
 	}
 
 	if (folio)
@@ -2722,8 +2749,8 @@ static int alloc_and_dissolve_hugetlb_folio(struct folio *old_folio,
 		if (!new_folio) {
 			spin_unlock_irq(&hugetlb_lock);
 			gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
-			new_folio = alloc_fresh_hugetlb_folio(h, gfp_mask,
-							      nid, NULL);
+			new_folio = alloc_fresh_hugetlb_folio_nocma(h, gfp_mask,
+								    nid, NULL);
 			if (!new_folio)
 				return -ENOMEM;
 			goto retry;
@@ -6333,7 +6360,7 @@ static struct folio *alloc_hugetlb_folio_vma(struct hstate *h,
 	 * consuming a reservation. Set the alloc_fallback to false to indicate
 	 * that breaking the per-node hugetlb pool is not allowed in this case.
 	 */
-	folio = alloc_hugetlb_folio_nodemask(h, node, nodemask, gfp_mask, false);
+	folio = alloc_hugetlb_folio_nodemask(h, node, nodemask, gfp_mask, false, true);
 	mpol_cond_put(mpol);
 
 	return folio;
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 70298fded1b4a..b59b8c73b8ce3 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1471,7 +1471,7 @@ static struct folio *alloc_migration_target_by_mpol(struct folio *src,
 		gfp = htlb_alloc_mask(h);
 		nodemask = policy_nodemask(gfp, pol, ilx, &nid);
 		return alloc_hugetlb_folio_nodemask(h, nid, nodemask, gfp,
-				htlb_allow_alloc_fallback(MR_MEMPOLICY_MBIND));
+				htlb_allow_alloc_fallback(MR_MEMPOLICY_MBIND), true);
 	}
 
 	if (folio_test_large(src))
diff --git a/mm/migrate.c b/mm/migrate.c
index 7bdcdb57652f8..670556bf5de2c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2213,7 +2213,8 @@ struct folio *alloc_migration_target(struct folio *src, unsigned long private)
 		gfp_mask = htlb_modify_alloc_mask(h, gfp_mask);
 		return alloc_hugetlb_folio_nodemask(h, nid,
 						mtc->nmask, gfp_mask,
-						htlb_allow_alloc_fallback(mtc->reason));
+						htlb_allow_alloc_fallback(mtc->reason),
+						mtc->reason != MR_CONTIG_RANGE);
 	}
 
 	if (folio_test_large(src)) {
-- 
2.54.0

