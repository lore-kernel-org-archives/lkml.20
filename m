Received: from mta1.migadu.com (out-145.mta1.migadu.com [95.215.58.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D434468C06
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935032; cv=none; b=IsvqFxNKnoMEzxrs8SJOZpyI5rvwzHhQOoIDjh9USVYVBvgis6lTsb5QEqGdrOr12rtP+Sub6b3xGoN6LMz7RreUHTzCwWu/E4vKAx0ihb6EPBQnxB+NQZsRIVdltvd0CplStgyZgmn2hMC+ovcwpw0b3qdMFtQaKS7rxf2Cz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935032; c=relaxed/simple;
	bh=7cWRiY61ttsBLvX5i9ElmLypjZl7WDBKL9U4yzhj3UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7gwIuf0wY4TZ7eky8AmsFZK0dCbrIlVODwACTN4CmjcHrtCp6/YKt1EuQ0EfVQBKsXbngNIj/6BjnSKr/m4vu8polgQW7vXf32/ObWVrpqxjxC2y+iRPPTFYhpLNOK7AsLpfKj2wFIrt3WFi3eWdFxZx2ZNSdNdDaKuKB+nzRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ms8P+k99; arc=none smtp.client-ip=95.215.58.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ms8P+k99"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7cWRiY61ttsBLvX5i9ElmLypjZl7WDBKL9U4yzhj3UM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790935028; v=1; x=1791539828;
 b=ms8P+k99mL4Xm5d2JSr4KWzr5ADzTLyRHvqnZWLFRi+qbq6LtHEHQzT30/NQsWLysPHSlu2J
 7rcgonHAR8/J27x64Ew1vIUJNQp8XDZttQUq9e0f6Ux4y+Y7Za8D2se7xP2CaKxwaC/wKlt6K7R
 ulCXxjMu8RGSQts99+zniTlA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 0f29b55ffbe886d7;
	Fri, 02 Oct 2026 09:57:08 +0000
X-Mizu-Trace-ID: 0f29b55ffbe886d7
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v8 20/30] mm/madvise: free PMD swap entries with MADV_FREE
Date: Fri,  2 Oct 2026 02:52:34 -0700
Message-ID: <20261002095503.3585565-21-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002095503.3585565-1-usama.arif@linux.dev>
References: <20261002095503.3585565-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

madvise_free_pte_range() only calls madvise_free_huge_pmd() for a present
THP, and its PTE loop cannot descend into a non-present PMD, so MADV_FREE
over a swapped-out THP silently does nothing. Over the same range as PTE
swap entries it frees every slot, which is what userspace gets today.

Free it at PMD granularity when the advice covers the whole PMD, and split
and let the PTE path handle the subrange when it does not.

zap_deposited_table() moves above its new caller; it is otherwise
unchanged.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/huge_memory.c | 34 +++++++++++++++++++++++++---------
 mm/madvise.c     |  2 +-
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 9cf7c4747cac9..c3d37dd84f523 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2424,6 +2424,15 @@ vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 	return 0;
 }
 
+static inline void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
+{
+	pgtable_t pgtable;
+
+	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+	pte_free_defer(mm, pgtable);
+	mm_dec_nr_ptes(mm);
+}
+
 /*
  * Return true if we do MADV_FREE successfully on entire pmd page.
  * Otherwise, return false.
@@ -2448,6 +2457,22 @@ bool madvise_free_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		goto out;
 
 	if (unlikely(!pmd_present(orig_pmd))) {
+		if (pmd_is_swap_entry(orig_pmd)) {
+			softleaf_t entry = softleaf_from_pmd(orig_pmd);
+
+			if (next - addr != HPAGE_PMD_SIZE) {
+				spin_unlock(ptl);
+				__split_huge_pmd(vma, pmd, addr);
+				goto out_unlocked;
+			}
+
+			pmdp_huge_get_and_clear(mm, addr, pmd);
+			zap_deposited_table(mm, pmd);
+			spin_unlock(ptl);
+			swap_put_entries_direct(entry, HPAGE_PMD_NR);
+			add_mm_counter(mm, MM_SWAPENTS, -HPAGE_PMD_NR);
+			return true;
+		}
 		VM_WARN_ON_ONCE(!pmd_is_migration_entry(orig_pmd) &&
 				!pmd_is_device_private_entry(orig_pmd));
 		goto out;
@@ -2502,15 +2527,6 @@ bool madvise_free_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	return ret;
 }
 
-static inline void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
-{
-	pgtable_t pgtable;
-
-	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
-	pte_free_defer(mm, pgtable);
-	mm_dec_nr_ptes(mm);
-}
-
 static void zap_huge_pmd_folio(struct mm_struct *mm, struct vm_area_struct *vma,
 		pmd_t pmdval, struct folio *folio, bool is_present)
 {
diff --git a/mm/madvise.c b/mm/madvise.c
index fbb72ab49aa64..70acb39b8b3dd 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -678,7 +678,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 	int nr, max_nr;
 
 	next = pmd_addr_end(addr, end);
-	if (pmd_trans_huge(*pmd))
+	if (pmd_trans_huge(*pmd) || pmd_is_swap_entry(*pmd))
 		if (madvise_free_huge_pmd(tlb, vma, pmd, addr, next))
 			return 0;
 
-- 
2.53.0-Meta

