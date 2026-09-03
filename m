Received: from mta1.migadu.com (out-208.mta1.migadu.com [95.215.58.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C901B4257
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404512; cv=none; b=b94ES95La2uDu6rbSmEGz0SRGcTg+qiOi41bITkT6TRvQiMOKLp8Fh7/YkJz7TtqwP9zomia27orRDKPSiGRqt91mqy+s+O4CnWDEjEZnRuuTbfb+EGaV/wxGdDVhxrqdBu7yL4QWTKfZVcv2Z4irdYN1//LqRQNAIXm702wYT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404512; c=relaxed/simple;
	bh=TkSdh57Swo1DoNq0az2nIVsOJeaHu9kVpMvm44mAYIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJo+Jo2hotfrqbv8V/N+RCtusJeHAC3Hvdo7ub160qbzEXZtul2mbOvFTd5oaoLUseJfq6Ds3zsD9W5dTpTVoltZWT7mJzsx5/MYz1REMZaN+5XqmGlp6uEOh5RsBO7XXOwVYwz0IcIJcfUoHxQPuBKWCW7ORmFi0Ofb7jAWeIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Khe4o3CY; arc=none smtp.client-ip=95.215.58.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Khe4o3CY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TkSdh57Swo1DoNq0az2nIVsOJeaHu9kVpMvm44mAYIs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788404507; v=1; x=1789009307;
 b=Khe4o3CYUb90K0OfbXxFn/vQFlOszibWcruJX46pjYUGfWKSSr1K5UwSJTVrvoGt7i5KRsfQ
 cvS59/nXV+bZQKFXM7i3lJWYgrkF93DKHzE3+1r12ccLpMwZh6LuMVGRpmMrp7DqpKfeo2SfHaF
 dXpHH/UVIi9xuHNE1QOe56U8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9f817857e9b42d3f;
	Thu, 03 Sep 2026 03:01:47 +0000
X-Mizu-Trace-ID: 9f817857e9b42d3f
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	vivek.kasireddy@intel.com
Cc: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH v2] mm/memfd: fix hugetlb reservation accounting in error paths
Date: Thu,  3 Sep 2026 11:01:34 +0800
Message-ID: <20260903030134.7407-1-hongfu.li@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongfu Li <lihongfu@kylinos.cn>

If hugetlb_add_to_page_cache() in memfd_alloc_folio() fails with
-EEXIST, a concurrent fault has already instantiated the folio in the
page cache, and the reservation now belongs to that folio. Calling
hugetlb_unreserve_pages() in that case incorrectly removes the region
backing the cached folio. A later truncate or inode eviction then passes
a negative (chg - freed) into hugepage_subpool_put_pages(), corrupting
subpool and resv_huge_pages accounting.

Hold the hugetlb fault mutex from hugetlb_reserve_pages() until the
error-path unreserve completes to make the reserve, allocate and
instantiate steps atomic against concurrent faults.  With the mutex held
from the start, a concurrent fault can no longer consume the reservation
between reserve and allocate/instantiate. If a fault completed before the
mutex was taken, it has already added the region for that index, so
hugetlb_reserve_pages() returns 0 and the error path leaves the region
in place.

Fixes: 717cf9357325 ("mm/memfd: reserve hugetlb folios before allocation")
Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
v2:
- Take the hugetlb fault mutex before hugetlb_reserve_pages() and hold
  it until the error-path unreserve completes.
- Update commit message
- Link to v1: https://lore.kernel.org/all/20260831090631.29227-1-hongfu.li@linux.dev/ 
---
 mm/memfd.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/mm/memfd.c b/mm/memfd.c
index c708d92533f4..0f6fff004f5e 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -82,22 +82,31 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 		struct hstate *h = hstate_file(memfd);
 		int err = -ENOMEM;
 		long nr_resv;
+		u32 hash;
 
 		gfp_mask = htlb_alloc_mask(h);
 		gfp_mask &= ~(__GFP_HIGHMEM | __GFP_MOVABLE);
 		idx >>= huge_page_order(h);
 
+		/*
+		 * Serialize hugepage allocation and instantiation to prevent
+		 * races with concurrent allocations, as required by all other
+		 * callers of hugetlb_add_to_page_cache().
+		 */
+		hash = hugetlb_fault_mutex_hash(memfd->f_mapping, idx);
+		mutex_lock(&hugetlb_fault_mutex_table[hash]);
+
 		nr_resv = hugetlb_reserve_pages(inode, idx, idx + 1, NULL, EMPTY_VMA_FLAGS);
-		if (nr_resv < 0)
-			return ERR_PTR(nr_resv);
+		if (nr_resv < 0) {
+			err = nr_resv;
+			goto out_unlock;
+		}
 
 		folio = alloc_hugetlb_folio_reserve(h,
 						    numa_node_id(),
 						    NULL,
 						    gfp_mask);
 		if (folio) {
-			u32 hash;
-
 			/*
 			 * Zero the folio to prevent information leaks to userspace.
 			 * Use folio_zero_user() which is optimized for huge/gigantic
@@ -112,20 +121,9 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 			 */
 			__folio_mark_uptodate(folio);
 
-			/*
-			 * Serialize hugepage allocation and instantiation to prevent
-			 * races with concurrent allocations, as required by all other
-			 * callers of hugetlb_add_to_page_cache().
-			 */
-			hash = hugetlb_fault_mutex_hash(memfd->f_mapping, idx);
-			mutex_lock(&hugetlb_fault_mutex_table[hash]);
-
 			err = hugetlb_add_to_page_cache(folio,
 							memfd->f_mapping,
 							idx);
-
-			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
-
 			if (err) {
 				folio_put(folio);
 				goto err_unresv;
@@ -133,11 +131,14 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 
 			hugetlb_set_folio_subpool(folio, subpool_inode(inode));
 			folio_unlock(folio);
+			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 			return folio;
 		}
 err_unresv:
 		if (nr_resv > 0)
 			hugetlb_unreserve_pages(inode, idx, idx + 1, 0);
+out_unlock:
+		mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 		return ERR_PTR(err);
 	}
 #endif
-- 
2.54.0

