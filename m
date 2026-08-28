Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0833B9DA2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942291; cv=none; b=aaubqVwPvi0Dc1RBo3YU3cOQkGz8gSLjI9s/3tjp9WqHPlpEBxpYmIZvgF4wKZRG43SmKM2Oq9RtxBDTccSUOLSW4RylSzaK4ZCAQNbVSTxquDtoyF0GzhCibyaI5PPkEoojkl7ThHxV0hzxqV25LaNa3fm4ZzkGbtPuy/cEmtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942291; c=relaxed/simple;
	bh=H2giclNVNkGHGU3dGxNEn2Np1ew1ExNFD872nl41krY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DWL3qd6PAXYi513mvMYCkwo1hnJJOeiuCykZ4yPMiuSnxBl4/i/xBHOUX7NIK4BuxrsXIW6RS8JLaA3Ezeii9zfbjWN/5sEGAXcr73LZLImxuhJ6vZHwt0ADQQhf6U6fbMpKD6331B0cERFKmDsJNTNxI3nZ7Zel+C1Q0qLt0Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwnWMhHU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwnWMhHU"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e27035206so1241939b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942289; x=1788547089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvYR8hSj3HruxGRZAeIbxinhDfyfRxH1dMC6OkZYttE=;
        b=NwnWMhHUp98EKb79G6Fs1ZX/AjeNAxFo76NO//p2ubLUlFBI2Fuu2y+gbODTUwAcqI
         jPcPKns+FwgzwQ1PSRLdwrEqP3KuBHmg3527gnlpVsx4lQRMdA3GbyhLenjoG/yJ/Hwb
         4CyQU4SbGAgmiOVCaTT3Uysfo70/vm68m2avOQsg9Ko5amVEPOXq/WlEPUM19UH9Pd6y
         4TV5T1nuvLoNqYZUS9AolsDic81M+ZvHi3hcFT9SKv/Yfeh0+qIQDbn8siZMxv3ZGtBQ
         kLsEaiubH9JfH4m3Am6HK1KKMVrbupT9LgY2QZSJkbUurfhMg0Xcm8COlJNO1Vm9bgCj
         eenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942289; x=1788547089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvYR8hSj3HruxGRZAeIbxinhDfyfRxH1dMC6OkZYttE=;
        b=Po4YPo4gSqy2dO4hS8a2Dh+xOgegssALfBdhEnT4FvwQcB0OSPK5nHyuX9btWj2cRJ
         RfF3j2ocu7KGJiD+2VI1+OTMpQu6RanlDIDXmv4aRIw/GV6Q1Ec9OIO8cQCLStFdRQEb
         DCrR81r1K0z2ccLQ8NVrnnqGqhYerkXSDGpDi9cyPIP7FtkW3bEnMKyeVhRYWhaRfCfc
         Gq2cDhtcaqHqmX9NOeD+j5O3DND93B8TecWSxNc+3yf/RLyKfBsZ7LvG8atynaibTwCG
         4Nm6kUiFs+Ld4G+cJ2a9BiA2zA9Ky8KnmfyIv6NG8MxxEyVixwX4xIoU0TS8+SJ6tUFI
         64UQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1OJY4D2mxDn8zi9XRkAPEzpBcuCi82vcCsJQUGps+D7TX6RLDhwNQFiqiGGPDrn7ZPTk1mnvwrhxbnxI=@vger.kernel.org
X-Gm-Message-State: AFuF++ncX7gkTtYqTqsOrJv2c7inYmP0WRgO7ND1V0YfhqpJMOpyeKGb
	RaEpdjHSlceQIT9gAvkLWSgDPGlHwCCtDpO2GtTimxpej/o4McvEV0vK
X-Gm-Gg: AR+sD13blOIgLBDfORjEA/LB3Y5ihnKgR53syoARok9AAIZA4gTxwILvILwJK9ocasy
	s/BBTcJkHRVw8xpmKUJQjTsax3W9uG2jXoFzlQb1DdKg8vf3lAT/wxwuw+FkeK7mCXO1GoqtvmN
	lBJfbVCCu4SUBv4WTN9Dm+yYDKUEC6bg2tQTLzY7hP0SX4yDSIlzESH/ojwLsxaUwtMO4iKHLSU
	dnrSRq3QR0T5kn1BqApgjHDQlKBISlvhxPx0gMetbMA6fs8Rkkw/2RLAnonDYiEbs7Lhg5LP0rs
	50u5hSsCpsdznSVqXzKcCPAt2Jo3anEcv4iVHONyeIJFB8PC7AYWnyiATAHkvJ2bYgOVPufzqQe
	LZjKkFQRLXytwwVOorX2wzU0f/4qSh4usY2/EOqIft2LbtfqOWNERsJcHOAAyEchEvvZWW7J0/L
	Kv7b2sve/HhZMCDxQWc+M91fhHha24hah0SH1o5FRU14VWCYUTIAIOtjFMj/QK3AHAyaKcSGO9R
	PsP4rrnie+teovYBnvjrYc09yFV
X-Received: by 2002:a05:6a00:414c:b0:848:4754:28e4 with SMTP id d2e1a72fcca58-8562abbefa2mr18993315b3a.15.1787942288449;
        Fri, 28 Aug 2026 11:38:08 -0700 (PDT)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fa3sm844230b3a.37.2026.08.28.11.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:38:07 -0700 (PDT)
From: Yin Tirui <yintirui@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	linux-kernel@vger.kernel.org,
	Yin Tirui <yintirui@gmail.com>
Subject: [PATCH RFC 8/9] mm/huge_memory: split present and non-present huge PMDs separately
Date: Sat, 29 Aug 2026 02:33:18 +0800
Message-Id: <46d6e131bcae6f4f2c8716c480aab87750a52c76.1787941780.git.yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787941780.git.yintirui@gmail.com>
References: <cover.1787941780.git.yintirui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the shared PTE rebuild into split_huge_pmd_to_ptes(), then add
split_present_huge_pmd() and split_non_present_huge_pmd() on top of it to
separate the present and non-present cases in __split_huge_pmd_locked().

No functional change intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Link: https://lore.kernel.org/linux-mm/67a655e3-fa23-4d2a-9685-14e6221d5d26@kernel.org/
Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 334 +++++++++++++++++++++++++----------------------
 1 file changed, 180 insertions(+), 154 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 72e2cd1d7672..fdb751a1e525 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3245,143 +3245,31 @@ static bool split_huge_pmd_anon_rmap(const struct split_pmd_state *state,
 	return false;
 }
 
-static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long haddr, bool freeze)
+/*
+ * Replace an anonymous huge PMD entry with a page table mapping the same
+ * folio at PTE granularity.
+ */
+static void split_huge_pmd_to_ptes(struct vm_area_struct *vma,
+		unsigned long haddr, pmd_t *pmd, struct split_pmd_state *state)
 {
-	const pmd_t old_pmd = *pmd;
-	const bool is_present = pmd_present(old_pmd);
+	/* Present mappings and device private entries hold a PMD-level rmap. */
+	const bool rmapped = state->is_present || state->is_device_private;
 	struct mm_struct *mm = vma->vm_mm;
-	struct split_pmd_state state = {
-		.is_present = is_present,
-		.freeze = freeze,
-	};
-	struct folio *folio;
+	struct page *page = state->page;
 	unsigned long addr;
 	pgtable_t pgtable;
 	pmd_t _pmd;
 	pte_t *pte;
 	int i;
 
-	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
-	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
-	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
-
-	VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(old_pmd) &&
-			!pmd_trans_huge(old_pmd));
-
-	count_vm_event(THP_SPLIT_PMD);
+	if (rmapped)
+		state->freeze = split_huge_pmd_anon_rmap(state, vma, haddr);
 
 	/*
-	 * FIXME: Do we want to invalidate secondary mmu by calling
-	 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
-	 * inside __split_huge_pmd() ?
-	 *
-	 * We are going from a zero huge page write protected to zero small
-	 * page also write protected so it does not seems useful to invalidate
-	 * secondary mmu at this time.
-	 */
-	if (huge_zero_pmd_can_split(vma, old_pmd)) {
-		__split_huge_zero_page_pmd(vma, haddr, pmd);
-		return;
-	}
-
-	folio = normal_or_softleaf_folio_pmd(vma, haddr, old_pmd, is_present);
-
-	/*
-	 * A non-present entry which is neither a migration nor a device
-	 * private entry is corrupt, and pmd_to_softleaf_folio() has already
-	 * warned about it. Leave it alone rather than act on a PFN which
-	 * means nothing.
-	 */
-	if (unlikely(!is_present && !folio))
-		return;
-
-	if (!folio || !folio_test_anon(folio)) {
-		unmap_huge_pmd_entry(vma, haddr, pmd, folio, is_present);
-		return;
-	}
-
-	state.folio = folio;
-
-	if (pmd_is_migration_entry(old_pmd)) {
-		const softleaf_t entry = softleaf_from_pmd(old_pmd);
-
-		state.page = softleaf_to_page(entry);
-
-		state.soft_dirty = pmd_swp_soft_dirty(old_pmd);
-		state.uffd = pmd_swp_uffd(old_pmd);
-
-		state.write = softleaf_is_migration_write(entry);
-		state.anon_exclusive =
-			softleaf_is_migration_read_exclusive(entry);
-		state.young = softleaf_is_migration_young(entry);
-		state.dirty = softleaf_is_migration_dirty(entry);
-	} else if (pmd_is_device_private_entry(old_pmd)) {
-		const softleaf_t entry = softleaf_from_pmd(old_pmd);
-
-		state.is_device_private = true;
-		state.page = softleaf_to_page(entry);
-
-		state.soft_dirty = pmd_swp_soft_dirty(old_pmd);
-		state.uffd = pmd_swp_uffd(old_pmd);
-
-		state.write = softleaf_is_device_private_write(entry);
-		state.anon_exclusive = PageAnonExclusive(state.page);
-
-		/*
-		 * Device private folios are treated the same as regular folios
-		 * w.r.t. anon exclusive handling, see
-		 * split_huge_pmd_anon_rmap().
-		 */
-		state.freeze = split_huge_pmd_anon_rmap(&state, vma, haddr);
-	} else {
-		/*
-		 * Up to this point the pmd is present and huge and userland has
-		 * the whole access to the hugepage during the split (which
-		 * happens in place). If we overwrite the pmd with the not-huge
-		 * version pointing to the pte here (which of course we could if
-		 * all CPUs were bug free), userland could trigger a small page
-		 * size TLB miss on the small sized TLB while the hugepage TLB
-		 * entry is still established in the huge TLB. Some CPU doesn't
-		 * like that. See
-		 * http://support.amd.com/TechDocs/41322_10h_Rev_Gd.pdf, Erratum
-		 * 383 on page 105. Intel should be safe but is also warns that
-		 * it's only safe if the permission and cache attributes of the
-		 * two entries loaded in the two TLB is identical (which should
-		 * be the case here). But it is generally safer to never allow
-		 * small and huge TLB entries for the same virtual address to be
-		 * loaded simultaneously. So instead of doing "pmd_populate();
-		 * flush_pmd_tlb_range();" we first mark the current pmd
-		 * notpresent (atomically because here the pmd_trans_huge must
-		 * remain set at all times on the pmd until the split is
-		 * complete for this pmd), then we flush the SMP TLB and finally
-		 * we write the non-huge version of the pmd entry with
-		 * pmd_populate.
-		 *
-		 * This must also happen before PageAnonExclusive() is read
-		 * below, see folio_try_share_anon_rmap_pmd().
-		 */
-		const pmd_t pmdval = pmdp_invalidate(vma, haddr, pmd);
-
-		state.page = pmd_page(pmdval);
-		state.write = pmd_write(pmdval);
-		state.young = pmd_young(pmdval);
-		state.dirty = pmd_dirty(pmdval);
-		state.soft_dirty = pmd_soft_dirty(pmdval);
-		state.uffd = pmd_uffd(pmdval);
-		state.anon_exclusive = PageAnonExclusive(state.page);
-
-		if (state.dirty)
-			folio_set_dirty(folio);
-
-		VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
-
-		state.freeze = split_huge_pmd_anon_rmap(&state, vma, haddr);
-	}
-
-	/*
-	 * Withdraw the table only after we mark the pmd entry invalid.
-	 * This's critical for some architectures (Power).
+	 * The caller has already invalidated a present entry, and a softleaf
+	 * entry is not present to begin with. Either way the entry is out of
+	 * service before we withdraw the deposited page table, which is
+	 * critical for some architectures (Power).
 	 */
 	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
 	pmd_populate(mm, &_pmd, pgtable);
@@ -3393,33 +3281,34 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (state.freeze || (!state.is_present && !state.is_device_private)) {
+	if (state->freeze ||
+	    (!state->is_present && !state->is_device_private)) {
 		pte_t entry;
 		swp_entry_t swp_entry;
 
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
-			if (state.write)
+			if (state->write)
 				swp_entry = make_writable_migration_entry(
-						page_to_pfn(state.page + i));
-			else if (state.anon_exclusive)
+							page_to_pfn(page + i));
+			else if (state->anon_exclusive)
 				swp_entry = make_readable_exclusive_migration_entry(
-						page_to_pfn(state.page + i));
+							page_to_pfn(page + i));
 			else
 				swp_entry = make_readable_migration_entry(
-						page_to_pfn(state.page + i));
-			if (state.young)
+							page_to_pfn(page + i));
+			if (state->young)
 				swp_entry = make_migration_entry_young(swp_entry);
-			if (state.dirty)
+			if (state->dirty)
 				swp_entry = make_migration_entry_dirty(swp_entry);
 			entry = swp_entry_to_pte(swp_entry);
-			if (state.soft_dirty)
+			if (state->soft_dirty)
 				entry = pte_swp_mksoft_dirty(entry);
-			if (state.uffd)
+			if (state->uffd)
 				entry = pte_swp_mkuffd(entry);
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
-	} else if (state.is_device_private) {
+	} else if (state->is_device_private) {
 		pte_t entry;
 		swp_entry_t swp_entry;
 
@@ -3429,19 +3318,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			 * pages corresponding to the pte entries when freeze
 			 * is false.
 			 */
-			if (state.write)
+			if (state->write)
 				swp_entry = make_writable_device_private_entry(
-						page_to_pfn(state.page + i));
+							page_to_pfn(page + i));
 			else
 				swp_entry = make_readable_device_private_entry(
-						page_to_pfn(state.page + i));
+							page_to_pfn(page + i));
 			/*
 			 * Young and dirty bits are not progated via swp_entry
 			 */
 			entry = swp_entry_to_pte(swp_entry);
-			if (state.soft_dirty)
+			if (state->soft_dirty)
 				entry = pte_swp_mksoft_dirty(entry);
-			if (state.uffd)
+			if (state->uffd)
 				entry = pte_swp_mkuffd(entry);
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
@@ -3449,21 +3338,21 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	} else {
 		pte_t entry;
 
-		entry = mk_pte(state.page, READ_ONCE(vma->vm_page_prot));
-		if (state.write)
+		entry = mk_pte(page, READ_ONCE(vma->vm_page_prot));
+		if (state->write)
 			entry = pte_mkwrite(entry, vma);
-		if (!state.young)
+		if (!state->young)
 			entry = pte_mkold(entry);
 		/* NOTE: this may set soft-dirty too on some archs */
-		if (state.dirty)
+		if (state->dirty)
 			entry = pte_mkdirty(entry);
-		if (state.soft_dirty)
+		if (state->soft_dirty)
 			entry = pte_mksoft_dirty(entry);
-		if (state.uffd)
+		if (state->uffd)
 			entry = pte_mkuffd(entry);
 
 		/* Restore PAGE_NONE so an RWP marker keeps trapping */
-		if (userfaultfd_rwp(vma) && state.uffd)
+		if (userfaultfd_rwp(vma) && state->uffd)
 			entry = pte_modify(entry, PAGE_NONE);
 
 		for (i = 0; i < HPAGE_PMD_NR; i++)
@@ -3473,15 +3362,152 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (state.is_present || state.is_device_private)
-		folio_remove_rmap_pmd(state.folio, state.page, vma);
-	if (state.freeze)
-		put_page(state.page);
+	if (rmapped)
+		folio_remove_rmap_pmd(state->folio, page, vma);
+	if (state->freeze)
+		put_page(page);
 
 	smp_wmb(); /* make pte visible before pmd */
 	pmd_populate(mm, pmd, pgtable);
 }
 
+static void split_present_huge_pmd(struct vm_area_struct *vma,
+		unsigned long haddr, pmd_t *pmd, struct folio *folio,
+		bool freeze)
+{
+	struct split_pmd_state state = {
+		.folio = folio,
+		.is_present = true,
+		.freeze = freeze,
+	};
+
+	/*
+	 * Up to this point the pmd is present and huge and userland has the
+	 * whole access to the hugepage during the split (which happens in
+	 * place). If we overwrite the pmd with the not-huge version pointing
+	 * to the pte here (which of course we could if all CPUs were bug
+	 * free), userland could trigger a small page size TLB miss on the
+	 * small sized TLB while the hugepage TLB entry is still established in
+	 * the huge TLB. Some CPU doesn't like that. See
+	 * http://support.amd.com/TechDocs/41322_10h_Rev_Gd.pdf, Erratum 383 on
+	 * page 105. Intel should be safe but is also warns that it's only safe
+	 * if the permission and cache attributes of the two entries loaded in
+	 * the two TLB is identical (which should be the case here). But it is
+	 * generally safer to never allow small and huge TLB entries for the
+	 * same virtual address to be loaded simultaneously. So instead of
+	 * doing "pmd_populate(); flush_pmd_tlb_range();" we first mark the
+	 * current pmd notpresent (atomically because here the pmd_trans_huge
+	 * must remain set at all times on the pmd until the split is complete
+	 * for this pmd), then we flush the SMP TLB and finally we write the
+	 * non-huge version of the pmd entry with pmd_populate.
+	 *
+	 * This must also happen before PageAnonExclusive() is read below, see
+	 * folio_try_share_anon_rmap_pmd().
+	 */
+	const pmd_t pmdval = pmdp_invalidate(vma, haddr, pmd);
+
+	state.page = pmd_page(pmdval);
+	state.write = pmd_write(pmdval);
+	state.young = pmd_young(pmdval);
+	state.dirty = pmd_dirty(pmdval);
+	state.soft_dirty = pmd_soft_dirty(pmdval);
+	state.uffd = pmd_uffd(pmdval);
+	state.anon_exclusive = PageAnonExclusive(state.page);
+
+	if (state.dirty)
+		folio_set_dirty(folio);
+
+	VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
+
+	split_huge_pmd_to_ptes(vma, haddr, pmd, &state);
+}
+
+static void split_non_present_huge_pmd(struct vm_area_struct *vma,
+		unsigned long haddr, pmd_t *pmd, pmd_t old_pmd,
+		struct folio *folio, bool freeze)
+{
+	const softleaf_t entry = softleaf_from_pmd(old_pmd);
+	struct split_pmd_state state = {
+		.folio = folio,
+		.page = softleaf_to_page(entry),
+		.is_device_private = softleaf_is_device_private(entry),
+		.freeze = freeze,
+		.soft_dirty = pmd_swp_soft_dirty(old_pmd),
+		.uffd = pmd_swp_uffd(old_pmd),
+	};
+
+	if (state.is_device_private) {
+		/*
+		 * Device private folios are treated the same as regular folios
+		 * w.r.t. anon exclusive handling, see
+		 * split_huge_pmd_anon_rmap().
+		 */
+		state.write = softleaf_is_device_private_write(entry);
+		state.anon_exclusive = PageAnonExclusive(state.page);
+	} else {
+		state.write = softleaf_is_migration_write(entry);
+		state.young = softleaf_is_migration_young(entry);
+		state.dirty = softleaf_is_migration_dirty(entry);
+		state.anon_exclusive =
+			softleaf_is_migration_read_exclusive(entry);
+	}
+
+	split_huge_pmd_to_ptes(vma, haddr, pmd, &state);
+}
+
+static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
+		unsigned long haddr, bool freeze)
+{
+	const pmd_t old_pmd = *pmd;
+	const bool is_present = pmd_present(old_pmd);
+	struct folio *folio;
+
+	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
+	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
+	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
+
+	VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(old_pmd) &&
+			!pmd_trans_huge(old_pmd));
+
+	count_vm_event(THP_SPLIT_PMD);
+
+	/*
+	 * FIXME: Do we want to invalidate secondary mmu by calling
+	 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
+	 * inside __split_huge_pmd() ?
+	 *
+	 * We are going from a zero huge page write protected to zero small
+	 * page also write protected so it does not seems useful to invalidate
+	 * secondary mmu at this time.
+	 */
+	if (huge_zero_pmd_can_split(vma, old_pmd)) {
+		__split_huge_zero_page_pmd(vma, haddr, pmd);
+		return;
+	}
+
+	folio = normal_or_softleaf_folio_pmd(vma, haddr, old_pmd, is_present);
+
+	/*
+	 * A non-present entry which is neither a migration nor a device
+	 * private entry is corrupt, and pmd_to_softleaf_folio() has already
+	 * warned about it. Leave it alone rather than act on a PFN which
+	 * means nothing.
+	 */
+	if (unlikely(!is_present && !folio))
+		return;
+
+	if (!folio || !folio_test_anon(folio)) {
+		unmap_huge_pmd_entry(vma, haddr, pmd, folio, is_present);
+		return;
+	}
+
+	if (is_present)
+		split_present_huge_pmd(vma, haddr, pmd, folio, freeze);
+	else
+		split_non_present_huge_pmd(vma, haddr, pmd, old_pmd, folio,
+					   freeze);
+}
+
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 			   pmd_t *pmd, bool freeze)
 {
-- 
2.34.1

