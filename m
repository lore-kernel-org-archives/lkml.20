Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904081;
	b=A1zOhmQgVE39QRBUBglQrXW5U7jTYVabBGJyJkIM0lqWsO7YKc93KBnwyuW/eRRS+BVE
	 7kufFK1IECSoI+lbPHLDAeEbf+NSCxLP8JrpxxpSGaquOv5W/flixlGrMv5mGJPLwKvoP
	 IoVUCnd2Bq5o9AM58fx6PtO74uw7f5gdcjPS6FyEUaIVweBv+0JFQQDKZjD7sKEKMGow8
	 IsM2Y6Kql5PLWHDSGLT3PFr6iqqfbIhCvaW4Q6C4bi1+cMg3gPG4DwnD8FUDD3wurB79z
	 qHZrO4O5JTyOrIi7V24syrvK14YiKT39mGSp6bR+HisWE5H622qdAtOyzh8yyGljPSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904081;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZAFfAnwseEGYikAGWanBt9opnTjDYu6yWVY0pO5d3Ko=;
	b=sikEeWyU5GT7AKAnak4/i2Na8xabB1zTwC5YD707BkAVAKe3i0i8md0vM0DjFk6mzoYX
	 GwKKtJZ8c32JLMC/B0Cyin5CPjN14/h9XwwGezjP4g6IQiHildiSHcINNr2jelMAh2qwH
	 naoxT2vZy+OdJQvQoewpmu4ggO/lgVpHDS5WTTzpxiqWjWguoEXO1Xo9nPQEGDRmsqTKt
	 chpB3pic+vh5hIdvUn1RKoPYpo27pjfxRZctZ9DeB96TgUEf6MloDu1yzvLdjjyY4NXj6
	 maDHDSGDjs4cwIuSiyYRS81URvF7Y9wH/BRmxq5dY/wAKLiP+LO2XD2JEGAkQs8cHow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ek4fV9pT;
	arc=none smtp.remote-ip=95.215.58.184
Received: from mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379EE606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 379EE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ek4fV9pT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zffeoJLKO7Tl5hUbNbLp+22MEhUyioYGApHq3/JagZE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904079; v=1; x=1794508879;
 b=ek4fV9pTrse/pdqnCxM/rqLQJstM3i6sG+KPosFIhLhjjBJfbTm/17ffDnxdtwMe4GWzVouG
 UKBmgFwGarP+J3zLf9urXFbxBdpou1/Ed540OW6BsCISQvCvCVLq8jKZf0dLjNdxIzE0hEegPtv
 bFnI7aQVeSqGOGiLdoWvcw08=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 86bcf934275d1289;
	Thu, 05 Nov 2026 18:41:18 +0000
X-Mizu-Trace-ID: 86bcf934275d1289
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
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
Subject: [PATCH v9 14/32] mm: handle PMD swap entries in fork path
Date: Thu,  5 Nov 2026 10:38:58 -0800
Message-ID: <20261105183940.2236717-15-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
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
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/huge_mm.h |  3 +-
 mm/huge_memory.c        | 65 ++++++++++++++++++++++++++++++-----------
 mm/memory.c             | 12 +++++++-
 3 files changed, 61 insertions(+), 19 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 34307bda8071b..8597bc52fdc87 100644
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
index 696813776e45d..acb540235e5a9 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1892,7 +1892,7 @@ bool touch_pmd(struct vm_area_struct *vma, unsigned long addr,
 	return false;
 }
 
-static void copy_huge_non_present_pmd(
+static int copy_huge_non_present_pmd(
 		struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
 		struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
@@ -1900,18 +1900,44 @@ static void copy_huge_non_present_pmd(
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
+		/*
+		 * Return -EIO on allocation failure so the caller can retry
+		 * with GFP_KERNEL. Fail the fork on any other error.
+		 */
+		if (err)
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
@@ -1938,19 +1964,21 @@ static void copy_huge_non_present_pmd(
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
@@ -1993,11 +2021,14 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
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
index 85bd1b08a1a2a..dedcec3cfca6e 100644
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

