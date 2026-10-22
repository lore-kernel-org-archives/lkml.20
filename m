Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654352;
	b=fF2VNx/w9Hf8bEBWDahpvIKTsJICoQ9FNGpGcOvG/wnPZDUUlXb8IDYdZCzoTWM/fWtY
	 Ilce1IWXspMEI49fEZ6CRYLGNxJSm9QnsUI0IF8K4BlGd2Nu5vtE8h1ip3AkH3SJ8OsDZ
	 t4W/8tl+SU1HgVAG00cu1AS4xT906cgma4GbFoTX3oVMmQ7U7Xjzb6qWMmPvx4hz7rb4D
	 5Ncy/0dFgzcoxti5CDBzSGQm68+8GXZH/L6YQCRZTPO2dkAp9MTBXJbNBQ5JnzGCd+pj7
	 KK0S1qWOT1hND10E0myWRjvmQ2zOq7NG3grxvM0K1k3O4k4xMF0Z5gwXMajZ5QWoHgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654352;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=shS6wb4SxltOTjdgk1Wlp7Kf8IQyAouUieYOJaXFqOM=;
	b=iOBtTUiuySemKaoU+SyjbILE9H7Lb72a2cC1JNmrosD+Y2v5ghigVoQIGYZfRa35kCuY
	 HZVm3q4dMu7oiaqx/CoSdx7O/xwEo9K5KI5Jc+Jzto7k6Z5IoyogaVnvfpRQcwkGxMb9q
	 maQZfY2AZWRb6nTkLesNpx2m4BiMVvsWvx2Y4hc8gpDgbDNQSrG/W5VYVm2eJLVK710Jj
	 5U1YEbg5Xl1Ux9zdN+NJw/YIPKDCE54J1ZrbekY0GexWF5MMhk/3FOuHr66hxlCPScwt6
	 5ftw9X52dtaSnNaUDGEgx+xIYJUT3Tzvh/dTPQ1FOSSueQu6Pv/PJTPXa6ZB28QTaUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bBFKOg2+;
	arc=none smtp.remote-ip=95.215.58.169
Received: from mta1.migadu.com (out-169.mta1.migadu.com [95.215.58.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD4B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bBFKOg2+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4qCDIHcFOvOripPLAZTCjyU1r8ZVx1IqYJGTBjnYmRA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792654349; v=1; x=1793259149;
 b=bBFKOg2+qDahAv1qC389H7IhpDH6QEhO3gi4oe+02KR9WvZclof1JxMmaIdknjrjzkdINb+l
 QEZbl+LGQuRapWfClApfYRKgk7pxeWgeonrNENuREE++FF21+VSGH5JtvK+fVUL334L4A7zyMLh
 2/SfmbQQU/LkjpTXdTcMRChg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5a2389d28bf66d2c;
	Thu, 22 Oct 2026 07:32:29 +0000
X-Mizu-Trace-ID: 5a2389d28bf66d2c
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	david@kernel.org,
	osalvador@suse.de,
	akpm@linux-foundation.org,
	azpijr@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 4/5] mm: hugetlb: avoid recursive CMA allocation during migration
Date: Thu, 22 Oct 2026 15:31:48 +0800
Message-ID: <35120f1e65b135ebc7885a85bb39baab90882820.1792651104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1792651104.git.zhengqi.arch@bytedance.com>
References: <cover.1792651104.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qi Zheng <zhengqi.arch@bytedance.com>

Contiguous allocation can migrate allocated HugeTLB folios or replace free
HugeTLB folios while holding a CMA allocation mutex. Allocating a
replacement through CMA would recurse into that allocation path once
non-gigantic HugeTLB pages can use CMA.

Pass allow_cma through the migration and fresh allocation helpers, and
disable it for MR_CONTIG_RANGE and free folio replacement. Move the CMA
attempt into the common allocation path, retaining the gigantic size
restriction. Honor hugetlb_cma_only even when allow_cma is false.

The existing gigantic migration restriction is unchanged.

Assisted-by: LLM
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/hugetlb.h |  4 +--
 mm/hugetlb.c            | 69 +++++++++++++++++++++--------------------
 mm/mempolicy.c          |  2 +-
 mm/migrate.c            |  3 +-
 4 files changed, 40 insertions(+), 38 deletions(-)

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
index 6b08074d11f52..c1a8d00be11ac 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1362,18 +1362,8 @@ static struct folio *dequeue_hugetlb_folio(struct hstate *h, gfp_t gfp_mask,
 static struct folio *alloc_gigantic_frozen_folio(int order, gfp_t gfp_mask,
 		int nid, nodemask_t *nodemask)
 {
-	struct folio *folio;
-
-	folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, nodemask);
-	if (folio)
-		return folio;
-
-	if (hugetlb_cma_exclusive_alloc(order))
-		return NULL;
-
-	folio = (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
-							  nid, nodemask);
-	return folio;
+	return (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
+							 nid, nodemask);
 }
 #else /* !CONFIG_ARCH_HAS_GIGANTIC_PAGE || !CONFIG_CONTIG_ALLOC */
 static struct folio *alloc_gigantic_frozen_folio(int order, gfp_t gfp_mask, int nid,
@@ -1841,37 +1831,47 @@ static struct folio *alloc_buddy_frozen_folio(int order, gfp_t gfp_mask,
 
 static struct folio *only_alloc_fresh_hugetlb_folio(struct hstate *h,
 		gfp_t gfp_mask, int nid, nodemask_t *nmask,
-		nodemask_t *node_alloc_noretry)
+		nodemask_t *node_alloc_noretry, bool allow_cma)
 {
-	struct folio *folio;
+	struct folio *folio = NULL;
 	int order = huge_page_order(h);
 
 	if (nid == NUMA_NO_NODE)
 		nid = numa_mem_id();
 
-	if (order_is_gigantic(order))
-		folio = alloc_gigantic_frozen_folio(order, gfp_mask, nid, nmask);
-	else
-		folio = alloc_buddy_frozen_folio(order, gfp_mask, nid, nmask,
-						 node_alloc_noretry);
+	if (allow_cma && order_is_gigantic(order))
+		folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, nmask);
+	if (!folio) {
+		if (hugetlb_cma_exclusive_alloc(order))
+			return NULL;
+
+		if (order_is_gigantic(order))
+			folio = alloc_gigantic_frozen_folio(order, gfp_mask, nid, nmask);
+		else
+			folio = alloc_buddy_frozen_folio(order, gfp_mask, nid, nmask,
+							 node_alloc_noretry);
+	}
+
 	if (folio)
 		init_new_hugetlb_folio(folio);
+
 	return folio;
 }
 
 /*
- * Common helper to allocate a fresh hugetlb folio. All specific allocators
- * should use this function to get new hugetlb folio
+ * Common helper to allocate a fresh hugetlb folio. All special allocators
+ * should use this function to get new hugetlb folio.
  *
  * Note that returned folio is 'frozen':  ref count of head page and all tail
  * pages is zero, and the accounting must be done in the caller.
  */
 static struct folio *alloc_fresh_hugetlb_folio(struct hstate *h,
-		gfp_t gfp_mask, int nid, nodemask_t *nmask)
+		gfp_t gfp_mask, int nid, nodemask_t *nmask, bool allow_cma)
 {
 	struct folio *folio;
 
-	folio = only_alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask, NULL);
+	folio = only_alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask, NULL,
+					       allow_cma);
 	if (folio)
 		hugetlb_vmemmap_optimize_folio(h, folio);
 	return folio;
@@ -1911,7 +1911,7 @@ static struct folio *alloc_pool_huge_folio(struct hstate *h,
 		struct folio *folio;
 
 		folio = only_alloc_fresh_hugetlb_folio(h, gfp_mask, node,
-					nodes_allowed, node_alloc_noretry);
+					nodes_allowed, node_alloc_noretry, true);
 		if (folio)
 			return folio;
 	}
@@ -2103,7 +2103,7 @@ static struct folio *alloc_surplus_hugetlb_folio(struct hstate *h,
 		goto out_unlock;
 	spin_unlock_irq(&hugetlb_lock);
 
-	folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask);
+	folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask, true);
 	if (!folio)
 		return NULL;
 
@@ -2139,14 +2139,14 @@ static struct folio *alloc_surplus_hugetlb_folio(struct hstate *h,
 }
 
 static struct folio *alloc_migrate_hugetlb_folio(struct hstate *h, gfp_t gfp_mask,
-				     int nid, nodemask_t *nmask)
+				     int nid, nodemask_t *nmask, bool allow_cma)
 {
 	struct folio *folio;
 
 	if (hstate_is_gigantic(h))
 		return NULL;
 
-	folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask);
+	folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask, allow_cma);
 	if (!folio)
 		return NULL;
 
@@ -2219,7 +2219,8 @@ struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
 
 /* folio migration callback function */
 struct folio *alloc_hugetlb_folio_nodemask(struct hstate *h, int preferred_nid,
-		nodemask_t *nmask, gfp_t gfp_mask, bool allow_alloc_fallback)
+		nodemask_t *nmask, gfp_t gfp_mask, bool allow_alloc_fallback,
+		bool allow_cma)
 {
 	struct folio *folio = NULL;
 
@@ -2238,7 +2239,7 @@ struct folio *alloc_hugetlb_folio_nodemask(struct hstate *h, int preferred_nid,
 			gfp_mask |= __GFP_THISNODE;
 
 		folio = alloc_migrate_hugetlb_folio(h, gfp_mask, preferred_nid,
-						    nmask);
+						    nmask, allow_cma);
 	}
 
 	if (folio)
@@ -2722,8 +2723,8 @@ static int alloc_and_dissolve_hugetlb_folio(struct folio *old_folio,
 		if (!new_folio) {
 			spin_unlock_irq(&hugetlb_lock);
 			gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
-			new_folio = alloc_fresh_hugetlb_folio(h, gfp_mask,
-							      nid, NULL);
+			new_folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid,
+							      NULL, false);
 			if (!new_folio)
 				return -ENOMEM;
 			goto retry;
@@ -3443,13 +3444,13 @@ static void __init hugetlb_hstate_alloc_pages_onenode(struct hstate *h, int nid)
 			gfp_t gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
 
 			folio = only_alloc_fresh_hugetlb_folio(h, gfp_mask, nid,
-					&node_states[N_MEMORY], NULL);
+					&node_states[N_MEMORY], NULL, true);
 			if (!folio && !list_empty(&folio_list) &&
 			    hugetlb_vmemmap_optimizable(h)) {
 				prep_and_add_allocated_folios(h, &folio_list);
 				INIT_LIST_HEAD(&folio_list);
 				folio = only_alloc_fresh_hugetlb_folio(h, gfp_mask, nid,
-						&node_states[N_MEMORY], NULL);
+						&node_states[N_MEMORY], NULL, true);
 			}
 			if (!folio)
 				break;
@@ -6357,7 +6358,7 @@ static struct folio *alloc_hugetlb_folio_vma(struct hstate *h,
 	 * consuming a reservation. Set the alloc_fallback to false to indicate
 	 * that breaking the per-node hugetlb pool is not allowed in this case.
 	 */
-	folio = alloc_hugetlb_folio_nodemask(h, node, nodemask, gfp_mask, false);
+	folio = alloc_hugetlb_folio_nodemask(h, node, nodemask, gfp_mask, false, true);
 	mpol_cond_put(mpol);
 
 	return folio;
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 0884c629670dd..a99ab927cd81a 100644
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

