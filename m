Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898853;
	b=pgUnfaE0vGbxLVZkN6c34zjrDp6xRlT/2pLtdikhKEfDbTvV/DgzOXgxPp13QNuROQ43
	 o2316Xrtc6VGSIsoIl04SPT83BR8wpFMm94Y37vU8Rn/X1i2WiAiOSVH7wEqpRD+jfMTm
	 9yJ+6D2t0N8h0sbPPD6Ie+6CNrY+MUg/ovcUCcuKOnWH5H3GwJIihoMay5MdpZzTJlVtH
	 qgQ61SJGu5ao6tFPWEj5iy9/kPk0NuqjIK6nmX/sn8+vYOO8TLqWNWo0Tile+uN3kZEPl
	 XTNRnsNPHRUj8Bgb3Vqb/QyNfhXGbDXEWaY9EPxi0WTs7ggcYX7c+tLMcY1fRXXXtjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898853;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1YXPcLXzICaGPRz8rHCfa6s3tChPEmNKPoNy40HFGsk=;
	b=HNLBmUC9vfIN/u5FlvkgnEDWkEFwt4Idy4A80VcOeGTyLapsFKrUal1NwWSyjWYjYmvK
	 hZTfCq8W2sp+b8uwQc4EpUl6W+kARhuzFT//zNfRgsEEPYg3yGjhyIuHXBVqaC9WmNmF/
	 i02tGiu1a760jzn6PmsOX6l43gSaTvbBjJdezkG7MsMDEDxFj8Ar3AJgX+0bO5WRa42m4
	 0rqY6/rkitYB57QL7gvZi3glMMtHrtRskRSI2lQ2wctptbsMZmsEyXYZ4LnyGd1f6SIdy
	 zQOuRZuYnJ9RC0gkqJk0N3O1rnKUwYlvXaAwoc0qw/qY4xExUEDw5zCTTtliJfx66vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Wz293g4Y;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523AE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 523AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Wz293g4Y
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794898849; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=1YXPcLXzICaGPRz8rHCfa6s3tChPEmNKPoNy40HFGsk=;
	b=Wz293g4YeWfkJzWjAfGhc3WtyR93RApz0uJjlZ9fQYHqvRbpV5uLU78rV42OCarL53yXXKiuOIHW0YikKevBIgwfk+LpSuIBkZElnkS9CdGhJWDCxenypmUc1mYii39J2W9xbSAWfgTLxhk2jptN+IH7BWMI0XuSXzGveT58VO4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R791e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XEyG6TV_1794898846;
Received: from localhost.localdomain(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEyG6TV_1794898846 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 17 Nov 2026 15:00:48 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm: use memory barriers for non PMD-sized folios to sync
Date: Tue, 17 Nov 2026 15:00:30 +0800
Message-ID: <6274e62645b9f176dd10d7a79e86b900a39cec5f.1794898535.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
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

Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped folios")
uses PMD lock via sync_with_folio_pmd_zap() to synchronize when a cleared
PMD is found while unmapping a folio.

However, for non PMD-sized folios, the only PMD clear that can race with
this unmap is PTE table reclaim, which clears the PMD only after the rmaps
for the table have been removed. This is plain message passing, and taking
the PMD lock is more than needed, like I did in the previous patch[1].

Without barriers, the walker can observe the cleared PMD but a stale
mapcount on weakly ordered architectures:

CPU 0 (unmap folio)                 CPU 1 (MADV_DONTNEED, full PMD)
================================    ================================
folio_lock()
                                    lock(ptl)
                                    clear PTEs
                                    remove rmaps   /* W mapcount */
[mapcount load satisfied early,
 folio still mapped]
                                    pmd_clear()    /* W pmd */
                                    unlock(ptl)
pmdp_get_lockless() -> none         /* R pmd */
skip the PMD
folio_mapped() -> true              /* R mapcount, stale */
unmapping assumed to have failed

Pairing an smp_wmb() before the PMD clear with an smp_rmb() after the
PMD read forbids this outcome:

CPU 0 (unmap folio)                 CPU 1 (MADV_DONTNEED, full PMD)
================================    ================================
                                    remove rmaps   /* W mapcount */
                                    smp_wmb()
                                    pmd_clear()    /* W pmd */
pmdp_get_lockless() -> none         /* R pmd */
smp_rmb()
folio_mapped()                      /* R mapcount */

If R pmd observes W pmd, R mapcount must observe W mapcount, so
folio_mapped() no longer reports the removed mappings.

Pass a 'folio' parameter to sync_with_folio_pmd_zap(), allowing us to
skip those pfn walkers: pfn_mkclean_range and mapping_wrprotect_range,
which don't need synchronization.

Similarly, skip sync for page_mapped_in_vma() since the subsequent
operations don't check the folio's mapcount.

No changes for PMD-sized folios unmapping.

[1] https://lore.kernel.org/all/542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com/
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
Changes from v1:
 - Pass in a folio for sync_with_folio_pmd_zap(), per David.
---
 include/linux/rmap.h |  2 ++
 mm/internal.h        | 26 ++++++++++++++++++++++----
 mm/memory.c          | 12 ++++++++++--
 mm/page_vma_mapped.c |  4 ++--
 4 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 74cca0e3c726..62e7341de179 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -862,6 +862,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 #define PVMW_PGTABLE_CROSSED	(1 << 16)
 
 struct page_vma_mapped_walk {
+	struct folio *folio;
 	unsigned long pfn;
 	unsigned long nr_pages;
 	pgoff_t pgoff;	/* Only meaningful if nr_pages > 1 and not a KSM walk */
@@ -876,6 +877,7 @@ struct page_vma_mapped_walk {
 
 #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
 	struct page_vma_mapped_walk name = {				\
+		.folio = _folio,					\
 		.pfn = folio_pfn(_folio),				\
 		.nr_pages = folio_nr_pages(_folio),			\
 		.pgoff = folio_pgoff(_folio),				\
diff --git a/mm/internal.h b/mm/internal.h
index cd3675c044e0..ad7e051cb198 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -592,6 +592,7 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
  * sync_with_folio_pmd_zap - sync with concurrent zapping of folios
  * @mm: The mm_struct.
  * @pmdp: Pointer to the pmd that was found to be pmd_none().
+ * @folio: The folio being zapped.
  *
  * When we find a pmd_none() while unmapping a folio without holding the PTL,
  * zap_huge_pmd() may have cleared the PMD but not yet updated the folio
@@ -600,13 +601,30 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
  * against later mapcount reads. Skipping the PMD without synchronization
  * could make folio unmapping code assume that unmapping failed.
  *
- * Wait for concurrent zapping to complete by grabbing the PTL.
+ * Wait for concurrent zapping to complete by grabbing the PTL for PMD-sized
+ * folios, otherwise smp_rmb() is sufficient.
  */
-static inline void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
+static inline void sync_with_folio_pmd_zap(struct mm_struct *mm,
+		pmd_t *pmdp, struct folio *folio)
 {
-	spinlock_t *ptl = pmd_lock(mm, pmdp);
+	if (folio_test_pmd_mappable(folio)) {
+		spinlock_t *ptl = pmd_lock(mm, pmdp);
 
-	spin_unlock(ptl);
+		spin_unlock(ptl);
+		return;
+	}
+
+	/*
+	 * For non PMD-sized folios zapping, concurrent zap_empty_pte_table()
+	 * may clear the PMD after the rmaps for the table have been removed,
+	 * but later mapcount reads could still be observed before the PMD
+	 * read, making the folio appear to be still mapped after unmapping.
+	 * Order the PMD read before later mapcount reads, so that observing
+	 * the cleared PMD implies observing the rmap removals.
+	 *
+	 * Pairs with smp_wmb() in zap_pte_range().
+	 */
+	smp_rmb();
 }
 
 struct zap_details;
diff --git a/mm/memory.c b/mm/memory.c
index 529a9189e426..dcf205175f71 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2054,8 +2054,15 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 	 * Clear the PMD after the rmaps for the table have been removed, in case
 	 * an incorrect mapcount is observed after unmapping the folio.
 	 */
-	if (can_reclaim_pt && direct_reclaim && addr == end)
+	if (can_reclaim_pt && direct_reclaim && addr == end) {
+		/*
+		 * rmap changes need to be observed before page tables get zapped.
+		 *
+		 * Pairs with smp_rmb() in sync_with_folio_pmd_zap().
+		 */
+		smp_wmb();
 		direct_reclaim = zap_empty_pte_table(mm, pmd, ptl, &pmdval);
+	}
 	pte_unmap_unlock(start_pte, ptl);
 
 	/*
@@ -2110,7 +2117,8 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
 			/* fall through */
 		} else if (pmd_none(*pmd)) {
 			if (details && details->single_folio)
-				sync_with_folio_pmd_zap(tlb->mm, pmd);
+				sync_with_folio_pmd_zap(tlb->mm, pmd,
+							details->single_folio);
 			addr = next;
 			continue;
 		}
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index a931243ca42b..9b72ac408c70 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -294,8 +294,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			spin_unlock(pvmw->ptl);
 			pvmw->ptl = NULL;
 		} else if (!pmd_present(pmde)) {
-			if (pvmw->flags & PVMW_SYNC)
-				sync_with_folio_pmd_zap(mm, pvmw->pmd);
+			if ((pvmw->flags & PVMW_SYNC) && pvmw->folio)
+				sync_with_folio_pmd_zap(mm, pvmw->pmd, pvmw->folio);
 
 			goto next_pmd;
 		}
-- 
2.47.3

