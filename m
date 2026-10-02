Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24C647D92E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935005; cv=none; b=H4xEsuwu5bx1UiQMXhlgtDC1VYhJI7AspMUWZQUcvhPvZK11/B/eWETUdaVKtKpwqUZjwWjoq3ZP+UFTduHDasRPX964W8JBG/gYwDFRvdENj9imaovTSMT9s9m5GRTZx59K14Yf67YaAiUm3aRipwOQUZtU91MJSdhE1iw+/KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935005; c=relaxed/simple;
	bh=EMYauajS0/Wg0tgt9O+VKGttuIkXp1Z6Wvo4EvxsiGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gy1ud2eXZ9BLyCEnicW7hP6S1P0NjiyzqKPx1HMmVU2Opl+ce9D0Cv1G0tCiU8yFxAl91kHn70+kI5uBAaJKY+919JBLlXe6AxfD/GW1d1BR1g1sFEKLnwiLpWDyQMOLVsaR1lnrunbHtLkiPCfPw4zEf3PWscDwvkvx5MmY0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WFWX2zgH; arc=none smtp.client-ip=91.218.175.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WFWX2zgH"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EMYauajS0/Wg0tgt9O+VKGttuIkXp1Z6Wvo4EvxsiGE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790935002; v=1; x=1791539802;
 b=WFWX2zgH474A2A4gT713WDcJXj/wL8YAt5m4RmpBYWBZg0HLKh3ihMmodyOYj+EuJq4gv6NI
 JlT0h5R+9aSGbWNWav3SikHZNLLAfBN32uLWQm6CS31+v2poh0AhV3SOf9N/1teiTeEWbaP0yWz
 jiXrfqRYG5lO88SMcVA/obwQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 1f41b4e95de95ad8;
	Fri, 02 Oct 2026 09:56:41 +0000
X-Mizu-Trace-ID: 1f41b4e95de95ad8
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
Subject: [PATCH v8 13/30] mm: handle PMD swap entries in fork path
Date: Fri,  2 Oct 2026 02:52:27 -0700
Message-ID: <20261002095503.3585565-14-usama.arif@linux.dev>
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

copy_huge_pmd() only knows about migration and device-private PMDs, so a
PMD swap entry would fall through to the present-PMD path and fork() would
duplicate it without taking a reference on the slots it points at.

Copy it the way copy_nonpresent_pte() copies a PTE swap entry: duplicate
the swap references, clear the exclusive marker on the source, put the
destination mm on mmlist, and account the child's slots to MM_SWAPENTS.

The GFP_ATOMIC extend-table allocation inside the dup can fail. Report that
as -EIO and let copy_pmd_range() retry with GFP_KERNEL, as
copy_nonpresent_pte() and copy_pte_range() already do for a PTE swap entry.
copy_huge_pmd() hands the entry back so the caller knows which range to
allocate for.

Only -ENOMEM is reported that way. The other failures mean the entry itself
is bad, and swap_retry_table_alloc_nr() returns 0 for those, so collapsing
them into -EIO as the PTE path does would spin in the caller's retry rather
than failing the fork.

While here, move the mm counter update into each entry-type arm, as the PTE
version does, so the swap arm can account MM_SWAPENTS instead of
MM_ANONPAGES.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 include/linux/huge_mm.h |  3 +-
 mm/huge_memory.c        | 62 ++++++++++++++++++++++++++++++-----------
 mm/memory.c             | 12 +++++++-
 3 files changed, 58 insertions(+), 19 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 8205e83f27771..7aa63d982af07 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -10,7 +10,8 @@
 vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf);
 int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
-		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma);
+		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
+		  softleaf_t *entryp);
 bool huge_pmd_set_accessed(struct vm_fault *vmf);
 int copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 24d116ae1fc30..80d18ca972ecf 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1894,7 +1894,7 @@ bool touch_pmd(struct vm_area_struct *vma, unsigned long addr,
 	return false;
 }
 
-static void copy_huge_non_present_pmd(
+static int copy_huge_non_present_pmd(
 		struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
 		struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
@@ -1902,18 +1902,41 @@ static void copy_huge_non_present_pmd(
 {
 	softleaf_t entry = softleaf_from_pmd(pmd);
 	struct folio *src_folio;
+	int err;
 
 	VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(pmd));
 
-	if (softleaf_is_migration_write(entry) ||
-	    softleaf_is_migration_read_exclusive(entry)) {
-		entry = make_readable_migration_entry(swp_offset(entry));
-		pmd = softleaf_to_pmd(entry);
-		if (pmd_swp_soft_dirty(*src_pmd))
-			pmd = pmd_swp_mksoft_dirty(pmd);
-		if (pmd_swp_uffd(*src_pmd))
-			pmd = pmd_swp_mkuffd(pmd);
-		set_pmd_at(src_mm, addr, src_pmd, pmd);
+	if (softleaf_is_swap(entry)) {
+		/*
+		 * A PMD swap entry only exists under CONFIG_THP_SWAP, where
+		 * SWAPFILE_CLUSTER == HPAGE_PMD_NR, and it is cluster aligned,
+		 * so these HPAGE_PMD_NR slots are exactly one cluster - which
+		 * is what swap_dup_entries_direct() requires.
+		 */
+		err = swap_dup_entries_direct(entry, HPAGE_PMD_NR);
+		if (err)
+			/* Only -ENOMEM is worth a GFP_KERNEL retry. */
+			return err == -ENOMEM ? -EIO : -ENOMEM;
+
+		mm_prepare_for_swap_entries(dst_mm);
+		/* Mark the swap entry as shared. */
+		if (pmd_swp_exclusive(pmd)) {
+			pmd = pmd_swp_clear_exclusive(pmd);
+			set_pmd_at(src_mm, addr, src_pmd, pmd);
+		}
+		add_mm_counter(dst_mm, MM_SWAPENTS, HPAGE_PMD_NR);
+	} else if (softleaf_is_migration(entry)) {
+		if (softleaf_is_migration_write(entry) ||
+		    softleaf_is_migration_read_exclusive(entry)) {
+			entry = make_readable_migration_entry(swp_offset(entry));
+			pmd = softleaf_to_pmd(entry);
+			if (pmd_swp_soft_dirty(*src_pmd))
+				pmd = pmd_swp_mksoft_dirty(pmd);
+			if (pmd_swp_uffd(*src_pmd))
+				pmd = pmd_swp_mkuffd(pmd);
+			set_pmd_at(src_mm, addr, src_pmd, pmd);
+		}
+		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	} else if (softleaf_is_device_private(entry)) {
 		/*
 		 * For device private entries, since there are no
@@ -1940,19 +1963,21 @@ static void copy_huge_non_present_pmd(
 		 */
 		folio_try_dup_anon_rmap_pmd(src_folio, &src_folio->page,
 					    dst_vma, src_vma);
+		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	}
 
-	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	mm_inc_nr_ptes(dst_mm);
 	pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
 	if (!userfaultfd_protected(dst_vma))
 		pmd = pmd_swp_clear_uffd(pmd);
 	set_pmd_at(dst_mm, addr, dst_pmd, pmd);
+	return 0;
 }
 
 int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
-		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
+		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
+		  softleaf_t *entryp)
 {
 	spinlock_t *dst_ptl, *src_ptl;
 	struct page *src_page;
@@ -1995,11 +2020,14 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	ret = -EAGAIN;
 	pmd = *src_pmd;
 
-	if (unlikely(thp_migration_supported() &&
-		     pmd_is_valid_softleaf(pmd))) {
-		copy_huge_non_present_pmd(dst_mm, src_mm, dst_pmd, src_pmd, addr,
-					  dst_vma, src_vma, pmd, pgtable);
-		ret = 0;
+	if (unlikely(pmd_is_valid_softleaf(pmd))) {
+		ret = copy_huge_non_present_pmd(dst_mm, src_mm, dst_pmd, src_pmd,
+						addr, dst_vma, src_vma, pmd,
+						pgtable);
+		if (ret) {
+			*entryp = softleaf_from_pmd(pmd);
+			pte_free(dst_mm, pgtable);
+		}
 		goto out_unlock;
 	}
 
diff --git a/mm/memory.c b/mm/memory.c
index 477d7e359b447..c0ad446d0cea4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1437,11 +1437,21 @@ copy_pmd_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	do {
 		next = pmd_addr_end(addr, end);
 		if (pmd_is_huge(*src_pmd)) {
+			softleaf_t entry = softleaf_mk_none();
 			int err;
 
 			VM_BUG_ON_VMA(next-addr != HPAGE_PMD_SIZE, src_vma);
+again:
 			err = copy_huge_pmd(dst_mm, src_mm, dst_pmd, src_pmd,
-					    addr, dst_vma, src_vma);
+					    addr, dst_vma, src_vma, &entry);
+			if (err == -EIO) {
+				VM_WARN_ON_ONCE(!entry.val);
+				if (swap_retry_table_alloc_nr(entry,
+							      HPAGE_PMD_NR,
+							      GFP_KERNEL) < 0)
+					return -ENOMEM;
+				goto again;
+			}
 			if (err == -ENOMEM)
 				return -ENOMEM;
 			if (!err)
-- 
2.53.0-Meta

