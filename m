Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377214;
	b=wjqhTft2UzdqoVQvTFIZvp2uoluYwAQz+2RAat/B071D4LEvpB5zwbpMYhkEesXbxwiD
	 tXrB+wJ3fSM/CRggIRaMz+KkOcDntVrjk3yI/21fNh1Ie/QqmKBij7OjKG+4/xzaYJx+w
	 DfwKqZIY3jfAR8ynlaKY5TA0wHkMvNXcx3UOQPj20yAtnOV0RsirFKf/xRILWzHH8ESqS
	 Kiv6AIfXrMMiLwoundM2MnyhiMpeTkLqiWKdk22fwd82D4j2RYH/1es5HsyuTAwBOi3CM
	 4pGz8Q/To6RQ9yA5Ex0BBYuLC8xL8J7+L3PBXCcpdzVutFPcu2lu5sXYqxx+mkb5SoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377214;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s92FQZqziYdPkK0Z14gXxUm+Jr8xarhyobVXri/rOeU=;
	b=J4tLv0WijrDV6yeO0HpUHFai2yvf5pz8eLvdS4aoXdMafdwLWC1u4o8QNMnpZcU1FpQd
	 ZXGH6T1Dpcjdbi5p3dMqYMo2JbEpZCLe3o/8d1LHC1n9+WUw/nZgbSC74mZUbhMZQ3dD2
	 WWoEq0vkj17v9QdXUrgEPGMZiFqnhKsIGiNdZSd+7bgPmsJu2NHclI9FkId3kcLa1EDIb
	 dZ/tZa2A26Fq5khDGKGbpzA6ns5P8v1xw9P+sifoKPKiEIIppOcrgXyRiLsmStY6b1UXL
	 9cIm0AYY06jI8mrrWczBOgFAjLv9JFurvpwj+zymFaskLsOfs3iabzYlY6D1HoMYjcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uidMCwNS;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644B4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uidMCwNS
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794377211; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=s92FQZqziYdPkK0Z14gXxUm+Jr8xarhyobVXri/rOeU=;
	b=uidMCwNSaSVuBG5bMvsiok5FwgQ8xHhiWhklCmVazWoRgQZWPtdoLPllntIWOHTeqfgfSUKS8hvmEdi9Qr4FFLFeMAnx1/AQFlGVAxoBVbG31Z+Rp1nMI/3TUg29EVgKYmYb0lXearyfjNM/RZ/DslrHAuj+jxRJvHHcSkiXq5g=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XEXp.ui_1794377209;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEXp.ui_1794377209 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Nov 2026 14:06:50 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	qi.zheng@linux.dev,
	pfalcato@suse.de,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: use memory barriers for non PMD-sized folios to sync
Date: Wed, 11 Nov 2026 14:06:39 +0800
Message-ID: <09736bc2e01bec0ca7436733078c82c7e0cc6627.1794376686.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
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

However, for non PMD-sized folios, the cleared PMD can only come from
PTE table reclaim, which clears the PMD only after the rmaps for the
table have been removed. This is plain message passing, and taking
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

No changes for PMD-sized folios unmapping.

[1] https://lore.kernel.org/all/542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com/
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/internal.h        | 26 ++++++++++++++++++++++----
 mm/memory.c          | 12 ++++++++++--
 mm/page_vma_mapped.c |  2 +-
 3 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index cd3675c044e0..a277bf4841f8 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -592,6 +592,7 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
  * sync_with_folio_pmd_zap - sync with concurrent zapping of folios
  * @mm: The mm_struct.
  * @pmdp: Pointer to the pmd that was found to be pmd_none().
+ * @nr_pages: The number of pages in the folio.
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
+static inline void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp,
+		unsigned int nr_pages)
 {
-	spinlock_t *ptl = pmd_lock(mm, pmdp);
+	if (nr_pages >= HPAGE_PMD_NR) {
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
index fe72e66c9c2e..1ee286cdd3af 100644
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
+						folio_nr_pages(details->single_folio));
 			addr = next;
 			continue;
 		}
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index a931243ca42b..d793ad0c5364 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -295,7 +295,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			pvmw->ptl = NULL;
 		} else if (!pmd_present(pmde)) {
 			if (pvmw->flags & PVMW_SYNC)
-				sync_with_folio_pmd_zap(mm, pvmw->pmd);
+				sync_with_folio_pmd_zap(mm, pvmw->pmd, pvmw->nr_pages);
 
 			goto next_pmd;
 		}
-- 
2.47.3

