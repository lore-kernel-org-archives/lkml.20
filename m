Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592CD47DD5F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934990; cv=none; b=irsBfsa0y2Eh+7SA48hzVOR+bwJwJpkjCHf4dZTR3BzC51Rx5MMAzC9vs8IdjIGGHq9FVmG4iJmg8zQBp9NEzpbBy2Tdo5XYUX/Wgupo515WtdAmaP1849VULqYigOPx89jhTzx3Sr7FwKLq1VQUL+ke0slCEJs6+2awL335AOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934990; c=relaxed/simple;
	bh=RdJTYr6OKJbLWLNbx2o8CV3+A/Nml1b19Dh5ux2PFP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFAbqjlzL+zQj/rYrIFoZnBj1LWVaKc2Vnyhuqqxlu1GPBrqfDlITM3MRIL8HOKrw0wxZslYB7Kg/MF7zqBk0A4pDJDx5crzXta6YEtDIrlBftL/Q55M4BQPn8peLY5vvzCAaMd0XYn6czYuCV5LBbSMXawIc6AcwIsmVwOCa5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GujSCMly; arc=none smtp.client-ip=91.218.175.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GujSCMly"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RdJTYr6OKJbLWLNbx2o8CV3+A/Nml1b19Dh5ux2PFP0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790934986; v=1; x=1791539786;
 b=GujSCMlyoLHXlIOPMhpkqqLm2+CTlX/+YbGwUh2qv/O/Dd5jICCSOhiPlgVfrKqB9UMqlzrE
 Y8f8NMWS4eEfor+gGyDL3/t6/sp317DEo9zT49Ni+5STreN6dvtvWcoP5fjqMzaomBSBkfK9Aam
 j+doKELlZ4II81gGT1ZOrbpI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 048a65e94bd5d350;
	Fri, 02 Oct 2026 09:56:25 +0000
X-Mizu-Trace-ID: 048a65e94bd5d350
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
Subject: [PATCH v8 10/30] mm: make PMD migration-entry splitting explicit
Date: Fri,  2 Oct 2026 02:52:24 -0700
Message-ID: <20261002095503.3585565-11-usama.arif@linux.dev>
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

__split_huge_pmd() and friends take a "freeze" boolean that every caller
has to pass and almost every caller passes as false. The name says nothing
about what it selects, and the one thing it does select - PTE migration
entries instead of PTE mappings - is only ever wanted by the rmap migration
path.

Rename it to to_migration_entries, keep it private to mm/huge_memory.c,
and add split_pmd_to_migration_entries() for try_to_migrate_one(), the only
caller that wants it.

migrate_vma_split_unmapped_folio() also passed freeze=true, but only ever
runs on a PMD that is already a migration entry, which the generic helper
expands into PTE migration entries either way. Its folio_get() only existed
to balance the put_page() that freeze=true performs, so both go.

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
 mm/migrate_device.c     |  7 +---
 mm/mprotect.c           |  2 +-
 mm/rmap.c               |  8 ++---
 6 files changed, 65 insertions(+), 51 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 8ca0fa3be2acb..8205e83f27771 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -430,7 +430,7 @@ int folio_memcg_alloc_deferred(struct folio *folio);
 void deferred_split_folio(struct folio *folio, bool partially_mapped);
 
 void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze);
+		unsigned long address);
 
 /**
  * pmd_is_huge() - Is this PMD either a huge PMD entry or a software leaf entry?
@@ -462,12 +462,10 @@ static inline bool pmd_is_huge(pmd_t pmd)
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
@@ -590,7 +588,9 @@ static inline bool thp_migration_supported(void)
 }
 
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
-			   pmd_t *pmd, bool freeze);
+		pmd_t *pmd);
+void split_pmd_to_migration_entries(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmd);
 bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
 			   pmd_t *pmdp, struct folio *folio);
 void map_anon_folio_pmd_nopf(struct folio *folio, pmd_t *pmd,
@@ -690,12 +690,13 @@ static inline void deferred_split_folio(struct folio *folio, bool partially_mapp
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
index ee8d46827ffdc..1df4f619620b4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2033,7 +2033,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		pte_free(dst_mm, pgtable);
 		spin_unlock(src_ptl);
 		spin_unlock(dst_ptl);
-		__split_huge_pmd(src_vma, src_pmd, addr, false);
+		__split_huge_pmd(src_vma, src_pmd, addr);
 		return -EAGAIN;
 	}
 	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
@@ -2257,7 +2257,7 @@ vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf)
 	folio_unlock(folio);
 	spin_unlock(vmf->ptl);
 fallback:
-	__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
+	__split_huge_pmd(vma, vmf->pmd, vmf->address);
 	return VM_FAULT_FALLBACK;
 }
 
@@ -3190,7 +3190,7 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
 }
 
 static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long haddr, bool freeze)
+		unsigned long haddr, bool to_migration_entries)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct folio *folio;
@@ -3208,6 +3208,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
 
 	VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(*pmd) && !pmd_trans_huge(*pmd));
+	VM_WARN_ON_ONCE(to_migration_entries && !pmd_present(*pmd) &&
+			!pmd_is_device_private_entry(*pmd));
 
 	count_vm_event(THP_SPLIT_PMD);
 
@@ -3291,10 +3293,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
@@ -3344,13 +3346,14 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
@@ -3359,10 +3362,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
@@ -3387,7 +3390,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (freeze || pmd_is_migration_entry(old_pmd)) {
+	if (to_migration_entries || pmd_is_migration_entry(old_pmd)) {
 		pte_t entry;
 		swp_entry_t swp_entry;
 
@@ -3420,8 +3423,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
@@ -3469,7 +3472,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 	if (!pmd_is_migration_entry(*pmd))
 		folio_remove_rmap_pmd(folio, page, vma);
-	if (freeze)
+	if (to_migration_entries)
 		put_page(page);
 
 	smp_wmb(); /* make pte visible before pmd */
@@ -3477,15 +3480,33 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
@@ -3495,20 +3516,19 @@ void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
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
@@ -3520,7 +3540,7 @@ static inline void split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned
 	if (!IS_ALIGNED(address, HPAGE_PMD_SIZE) &&
 	    range_in_vma(vma, ALIGN_DOWN(address, HPAGE_PMD_SIZE),
 			 ALIGN(address, HPAGE_PMD_SIZE)))
-		split_huge_pmd_address(vma, address, false);
+		split_huge_pmd_address(vma, address);
 }
 
 void vma_adjust_trans_huge(struct vm_area_struct *vma,
diff --git a/mm/memory.c b/mm/memory.c
index 926276d419202..477d7e359b447 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2096,7 +2096,7 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
 		next = pmd_addr_end(addr, end);
 		if (pmd_is_huge(*pmd)) {
 			if (next - addr != HPAGE_PMD_SIZE)
-				__split_huge_pmd(vma, pmd, addr, false);
+				__split_huge_pmd(vma, pmd, addr);
 			else if (zap_huge_pmd(tlb, vma, pmd, addr)) {
 				addr = next;
 				continue;
@@ -6382,7 +6382,7 @@ static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
 
 split:
 	/* COW or write-notify handled on pte level: split pmd. */
-	__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
+	__split_huge_pmd(vma, vmf->pmd, vmf->address);
 
 	return VM_FAULT_FALLBACK;
 }
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 0c437004329d9..4a0b61d50d222 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -918,12 +918,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
 	unsigned long flags;
 	int ret = 0;
 
-	/*
-	 * take a reference, since split_huge_pmd_address() with freeze = true
-	 * drops a reference at the end.
-	 */
-	folio_get(folio);
-	split_huge_pmd_address(migrate->vma, addr, true);
+	split_huge_pmd_address(migrate->vma, addr);
 	ret = folio_split_unmapped(folio, 0);
 	if (ret)
 		return ret;
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 2888ee638d872..ee33bbb421008 100644
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
index 5332c52909be1..b762eb85915ea 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2289,8 +2289,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 * We temporarily have to drop the PTL and
 				 * restart so we can process the PTE-mapped THP.
 				 */
-				split_huge_pmd_locked(vma, pvmw.address,
-						      pvmw.pmd, false);
+				split_huge_pmd_locked(vma, pvmw.address, pvmw.pmd);
 				flags &= ~TTU_SPLIT_HUGE_PMD;
 				page_vma_mapped_walk_restart(&pvmw);
 				continue;
@@ -2515,13 +2514,12 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 
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

