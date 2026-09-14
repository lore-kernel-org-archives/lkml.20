Received: from mta0.migadu.com (out-208.mta0.migadu.com [91.218.175.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC6F463B68
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389118; cv=none; b=Y1WzIhP0rz+M18qfGsw1uvlo+X9iH8f1XQStr1T3g2ek0nBix82bOluRSzCc2QknUjAWnke8PPtMDPQetxenFZSapxjwQ4ViQTeSJEkfc4OcH3LOjx+AK6nBZKBdh2wk4HiNC3Wps3Qp0dHjBEj5Q8GH5r6UkPSCIN5S6SIiz+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389118; c=relaxed/simple;
	bh=/ejeggqsmQIRp7dTYKNmiDe/IHY+KtxEWhGqQu4hgx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjk3nqh95EVpsIzhIO6dwvkZRjZbnKgu4uOYm+caBF4sZ0RLh1ax8Dvn3AxU0Bl57mSw6pgS8MQZT1hCtpTTQFWe2mWFoCG5DAVH/tqTUHBgiFyQTW//WwlxzopYL9R0UQbd6yOsIeDWI7to3LEsveOdyNoJenjsElvlPtHqDrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dI59SaSo; arc=none smtp.client-ip=91.218.175.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dI59SaSo"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/ejeggqsmQIRp7dTYKNmiDe/IHY+KtxEWhGqQu4hgx0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389112; v=1; x=1789993912;
 b=dI59SaSo3o3og/j4mLbGKRwOkjr4VqVmEocuL56p277x9h3WBHVhKnC7giJk4KtBdo8e1k3Q
 +RYv3Y6KWkfu+e2FxN9ZOxSYjPaoMsNOzZGNM5hsqPN6M9UfBKxex3hNE48FwZ052p0EURAPZXe
 EHEFA7wNszjB3U0eGAQwCc7g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 00067274d6bc2178;
	Mon, 14 Sep 2026 12:31:51 +0000
X-Mizu-Trace-ID: 00067274d6bc2178
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
Subject: [RESEND v7 19/29] mm/madvise: free PMD swap entries with MADV_FREE
Date: Mon, 14 Sep 2026 05:28:09 -0700
Message-ID: <20260914122950.3283997-20-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914122950.3283997-1-usama.arif@linux.dev>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
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
index 689a1f4286471..5f3d620c64a94 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2447,6 +2447,15 @@ vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
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
@@ -2471,6 +2480,22 @@ bool madvise_free_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
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
@@ -2525,15 +2550,6 @@ bool madvise_free_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
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

