Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904067;
	b=y7tEuEfm39oeZXnDZ2/Ey7YIC9yLqItHNwXkDcncDMYo56shsZhOWDunoj7t+PxZdb2r
	 d91xgE6Ees5C5/9F88ocSgfEYGFDtVWiGqwLvLNhMBbrZx4AdsS23CJoGq4i3pvGIn6D2
	 EPUmBRCdy0Xwuro3Pa/X1q7yYO8ajWitMyuYmhHgyX21okq7bfnCEhhqpdPRYkYT/z1JM
	 vWbWN5kwzGSCV85Ngx8k3S8bkkoNvdNQkd3iZUABeC5ZaKIcs05U0Q+fRyLFVCsLaosgq
	 Y6uruyqCDR5qzl+YoQZuq/WcQ9yjSA6nAtmlJdFtMxmI9UW5Kv9oZCiFvEJh+aDZtew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904067;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZjI7KWNJ54cabdi0ZP5V04L0+LspguNONHqe73wuXBs=;
	b=CKRazufRS9PDCrvhQIteFnTE7YLTFOuojAp44akETjuIahOtBBG0OqEx9ErzXRQE7ign
	 GumkVpzd4Kp+sIc/MjKcAtaG7Y0cPFka23iYatQbu6lY1ySANw2DSaaQk4MEE5EO21I5h
	 GQAcTENnAib3MuaaiVo6O6ecpC3iu+SGBo34uoeqZZX15mAS5fYo69cLz+shXV9q+WX/8
	 kPgA5uiSbV2HQfw/fFbXDMB4N6pLFePNAc7V4FN21TbHFEv/DqlcVuAFz8K56Y19gwGBc
	 JjZj0M4GgfKNgtbUZyeIvLGCW3DV8FiQ7hdlnBfYdVkdUKXpehDxaLfO9oBp9FRo0fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q1+1ya2D;
	arc=none smtp.remote-ip=95.215.58.137
Received: from mta1.migadu.com (out-137.mta1.migadu.com [95.215.58.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C246606D811
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C246606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q1+1ya2D
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=722XgLzDCs2QKSSlSsiQWGB561wiO3WhGCQ/qnB0OO4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904064; v=1; x=1794508864;
 b=q1+1ya2DGGGneEzptSs2mpp4eOFK5vtoT0jCGx/7hND/4i66/4ET3s8OKT4BTy6Y7n/hHpl2
 83uCHnVkNUd/Smee+e4nJeCKdhR62eGsD8oyO/eOYzYZbZydZhS+As9L1edEkNw2D0QZjmUaDvP
 cDNbpbGQkgzwdwJPFcd9uiYY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id f66312ce63d0c71f;
	Thu, 05 Nov 2026 18:41:04 +0000
X-Mizu-Trace-ID: f66312ce63d0c71f
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
Subject: [PATCH v9 11/32] mm: make PMD migration-entry splitting explicit
Date: Thu,  5 Nov 2026 10:38:55 -0800
Message-ID: <20261105183940.2236717-12-usama.arif@linux.dev>
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

__split_huge_pmd() and friends take a "freeze" boolean that every caller
has to pass and almost every caller passes as false. The name says nothing
about what it selects, and the one thing it does select - PTE migration
entries instead of PTE mappings - is only ever wanted by the rmap migration
path.

Rename it to to_migration_entries, keep it private to mm/huge_memory.c,
and add split_pmd_to_migration_entries() for try_to_migrate_one(), the only
caller that wants it.

split_pmd_to_migration_entries() is only ever handed a present or
device-private PMD, so assert that in __split_huge_pmd_locked() instead of
silently skipping anything else.

Other than that assertion, no functional change intended.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 include/linux/huge_mm.h | 21 ++++++------
 mm/huge_memory.c        | 74 ++++++++++++++++++++++++++---------------
 mm/memory.c             |  4 +--
 mm/migrate_device.c     |  2 +-
 mm/mprotect.c           |  2 +-
 mm/rmap.c               |  8 ++---
 6 files changed, 65 insertions(+), 46 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 421217aca4ed8..34307bda8071b 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -431,7 +431,7 @@ int folio_memcg_alloc_deferred(struct folio *folio);
 void deferred_split_folio(struct folio *folio, bool partially_mapped);
 
 void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze);
+		unsigned long address);
 
 /**
  * pmd_is_huge() - Is this PMD either a huge PMD entry or a software leaf entry?
@@ -463,12 +463,10 @@ static inline bool pmd_is_huge(pmd_t pmd)
 	do {								\
 		pmd_t *____pmd = (__pmd);				\
 		if (pmd_is_huge(*____pmd))				\
-			__split_huge_pmd(__vma, __pmd, __address,	\
-					 false);			\
+			__split_huge_pmd(__vma, __pmd, __address);	\
 	}  while (0)
 
-void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
-		bool freeze);
+void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address);
 
 void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
 		unsigned long address);
@@ -593,7 +591,9 @@ static inline bool thp_migration_supported(void)
 }
 
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
-			   pmd_t *pmd, bool freeze);
+		pmd_t *pmd);
+void split_pmd_to_migration_entries(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmd);
 bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
 			   pmd_t *pmdp, struct folio *folio);
 void map_anon_folio_pmd_nopf(struct folio *folio, pmd_t *pmd,
@@ -693,12 +693,13 @@ static inline void deferred_split_folio(struct folio *folio, bool partially_mapp
 	do { } while (0)
 
 static inline void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze) {}
+		unsigned long address) {}
 static inline void split_huge_pmd_address(struct vm_area_struct *vma,
-		unsigned long address, bool freeze) {}
+		unsigned long address) {}
 static inline void split_huge_pmd_locked(struct vm_area_struct *vma,
-					 unsigned long address, pmd_t *pmd,
-					 bool freeze) {}
+		unsigned long address, pmd_t *pmd) {}
+static inline void split_pmd_to_migration_entries(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmd) {}
 
 static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
 					 unsigned long addr, pmd_t *pmdp,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e425a5b05aa2e..82a4fa9342672 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2031,7 +2031,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		pte_free(dst_mm, pgtable);
 		spin_unlock(src_ptl);
 		spin_unlock(dst_ptl);
-		__split_huge_pmd(src_vma, src_pmd, addr, false);
+		__split_huge_pmd(src_vma, src_pmd, addr);
 		return -EAGAIN;
 	}
 	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
@@ -2255,7 +2255,7 @@ vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf)
 	folio_unlock(folio);
 	spin_unlock(vmf->ptl);
 fallback:
-	__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
+	__split_huge_pmd(vma, vmf->pmd, vmf->address);
 	return VM_FAULT_FALLBACK;
 }
 
@@ -3176,7 +3176,7 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
 }
 
 static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long haddr, bool freeze)
+		unsigned long haddr, bool to_migration_entries)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct folio *folio;
@@ -3194,6 +3194,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
 
 	VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(*pmd) && !pmd_trans_huge(*pmd));
+	VM_WARN_ON_ONCE(to_migration_entries && !pmd_present(*pmd) &&
+			!pmd_is_device_private_entry(*pmd));
 
 	count_vm_event(THP_SPLIT_PMD);
 
@@ -3277,10 +3279,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		 * folios w.r.t anon exclusive handling. See the comments for
 		 * folio handling and anon_exclusive below.
 		 */
-		if (freeze && anon_exclusive &&
+		if (to_migration_entries && anon_exclusive &&
 		    folio_try_share_anon_rmap_pmd(folio, page))
-			freeze = false;
-		if (!freeze) {
+			to_migration_entries = false;
+		if (!to_migration_entries) {
 			rmap_t rmap_flags = RMAP_NONE;
 
 			folio_ref_add(folio, HPAGE_PMD_NR - 1);
@@ -3330,13 +3332,14 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
 
 		/*
-		 * Without "freeze", we'll simply split the PMD, propagating the
-		 * PageAnonExclusive() flag for each PTE by setting it for
-		 * each subpage -- no need to (temporarily) clear.
+		 * When not splitting to migration entries, we'll simply split
+		 * the PMD and propagate the PageAnonExclusive() flag for each
+		 * PTE by setting it for each page -- no need to (temporarily)
+		 * clear.
 		 *
-		 * With "freeze" we want to replace mapped pages by
-		 * migration entries right away. This is only possible if we
-		 * managed to clear PageAnonExclusive() -- see
+		 * When splitting to migration entries, we want to replace
+		 * mapped pages by migration entries right away. This is only
+		 * possible if we managed to clear PageAnonExclusive() -- see
 		 * set_pmd_migration_entry().
 		 *
 		 * In case we cannot clear PageAnonExclusive(), split the PMD
@@ -3345,10 +3348,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		 * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
 		 */
 		anon_exclusive = PageAnonExclusive(page);
-		if (freeze && anon_exclusive &&
+		if (to_migration_entries && anon_exclusive &&
 		    folio_try_share_anon_rmap_pmd(folio, page))
-			freeze = false;
-		if (!freeze) {
+			to_migration_entries = false;
+		if (!to_migration_entries) {
 			rmap_t rmap_flags = RMAP_NONE;
 
 			folio_ref_add(folio, HPAGE_PMD_NR - 1);
@@ -3373,7 +3376,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (freeze || pmd_is_migration_entry(old_pmd)) {
+	if (to_migration_entries || pmd_is_migration_entry(old_pmd)) {
 		pte_t entry;
 		swp_entry_t swp_entry;
 
@@ -3406,8 +3409,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			/*
 			 * anon_exclusive was already propagated to the relevant
-			 * pages corresponding to the pte entries when freeze
-			 * is false.
+			 * pages corresponding to the pte entries when
+			 * to_migration_entries is false.
 			 */
 			if (write)
 				swp_entry = make_writable_device_private_entry(
@@ -3455,7 +3458,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 	if (!pmd_is_migration_entry(*pmd))
 		folio_remove_rmap_pmd(folio, page, vma);
-	if (freeze)
+	if (to_migration_entries)
 		put_page(page);
 
 	smp_wmb(); /* make pte visible before pmd */
@@ -3463,15 +3466,33 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 }
 
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
-			   pmd_t *pmd, bool freeze)
+		pmd_t *pmd)
 {
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
 	if (pmd_trans_huge(*pmd) || pmd_is_valid_softleaf(*pmd))
-		__split_huge_pmd_locked(vma, pmd, address, freeze);
+		__split_huge_pmd_locked(vma, pmd, address, false);
+}
+
+/**
+ * split_pmd_to_migration_entries() - Split a present or device private PMD into
+ * PTE migration entries.
+ * @vma: The VMA containing the PMD.
+ * @address: The PMD-aligned address the PMD maps.
+ * @pmd: A pointer to the leaf PMD entry.
+ *
+ * For the rmap migration walker, which only ever hands back those two entry
+ * types.  Like split_huge_pmd_locked(), the caller must hold the PMD lock and
+ * must already be inside an mmu_notifier invalidate range.
+ */
+void split_pmd_to_migration_entries(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmd)
+{
+	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
+	__split_huge_pmd_locked(vma, pmd, address, true);
 }
 
 void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze)
+		unsigned long address)
 {
 	spinlock_t *ptl;
 	struct mmu_notifier_range range;
@@ -3481,20 +3502,19 @@ void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
 				(address & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE);
 	mmu_notifier_invalidate_range_start(&range);
 	ptl = pmd_lock(vma->vm_mm, pmd);
-	split_huge_pmd_locked(vma, range.start, pmd, freeze);
+	split_huge_pmd_locked(vma, range.start, pmd);
 	spin_unlock(ptl);
 	mmu_notifier_invalidate_range_end(&range);
 }
 
-void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
-		bool freeze)
+void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address)
 {
 	pmd_t *pmd = mm_find_pmd(vma->vm_mm, address);
 
 	if (!pmd)
 		return;
 
-	__split_huge_pmd(vma, pmd, address, freeze);
+	__split_huge_pmd(vma, pmd, address);
 }
 
 static inline void split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned long address)
@@ -3506,7 +3526,7 @@ static inline void split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned
 	if (!IS_ALIGNED(address, HPAGE_PMD_SIZE) &&
 	    range_in_vma(vma, ALIGN_DOWN(address, HPAGE_PMD_SIZE),
 			 ALIGN(address, HPAGE_PMD_SIZE)))
-		split_huge_pmd_address(vma, address, false);
+		split_huge_pmd_address(vma, address);
 }
 
 void vma_adjust_trans_huge(struct vm_area_struct *vma,
diff --git a/mm/memory.c b/mm/memory.c
index 6fe0b7dab927c..85bd1b08a1a2a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2099,7 +2099,7 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
 		next = pmd_addr_end(addr, end);
 		if (pmd_is_huge(*pmd)) {
 			if (next - addr != HPAGE_PMD_SIZE)
-				__split_huge_pmd(vma, pmd, addr, false);
+				__split_huge_pmd(vma, pmd, addr);
 			else if (zap_huge_pmd(tlb, vma, pmd, addr)) {
 				addr = next;
 				continue;
@@ -6491,7 +6491,7 @@ static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
 
 split:
 	/* COW or write-notify handled on pte level: split pmd. */
-	__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
+	__split_huge_pmd(vma, vmf->pmd, vmf->address);
 
 	return VM_FAULT_FALLBACK;
 }
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 3286bb8a4b73e..1096319aa8166 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -920,7 +920,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
 	unsigned long flags;
 	int ret = 0;
 
-	split_huge_pmd_address(migrate->vma, addr, false);
+	split_huge_pmd_address(migrate->vma, addr);
 	ret = folio_split_unmapped(folio, 0);
 	if (ret)
 		return ret;
diff --git a/mm/mprotect.c b/mm/mprotect.c
index e18d4e12fc341..e0e28bbddbadd 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -530,7 +530,7 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
 		if (pmd_is_huge(_pmd)) {
 			if ((next - addr != HPAGE_PMD_SIZE) ||
 			    pgtable_split_needed(vma, cp_flags)) {
-				__split_huge_pmd(vma, pmd, addr, false);
+				__split_huge_pmd(vma, pmd, addr);
 				/*
 				 * For file-backed, the pmd could have been
 				 * cleared; make sure pmd populated if
diff --git a/mm/rmap.c b/mm/rmap.c
index 1131b76bbbc28..9d6353e98e7c7 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2280,8 +2280,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 * We temporarily have to drop the PTL and
 				 * restart so we can process the PTE-mapped THP.
 				 */
-				split_huge_pmd_locked(vma, pvmw.address,
-						      pvmw.pmd, false);
+				split_huge_pmd_locked(vma, pvmw.address, pvmw.pmd);
 				flags &= ~TTU_SPLIT_HUGE_PMD;
 				page_vma_mapped_walk_restart(&pvmw);
 				continue;
@@ -2506,13 +2505,12 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				/*
-				 * split_huge_pmd_locked() might leave the
+				 * split_pmd_to_migration_entries() might leave the
 				 * folio mapped through PTEs. Retry the walk
 				 * so we can detect this scenario and properly
 				 * abort the walk.
 				 */
-				split_huge_pmd_locked(vma, pvmw.address,
-						      pvmw.pmd, true);
+				split_pmd_to_migration_entries(vma, pvmw.address, pvmw.pmd);
 				flags &= ~TTU_SPLIT_HUGE_PMD;
 				page_vma_mapped_walk_restart(&pvmw);
 				continue;
-- 
2.53.0-Meta

