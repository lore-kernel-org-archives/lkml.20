Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333691;
	b=q8BOl/Rj0q/WLFzm2DizsSOuUBslevx3kMGyH0g/1NKxWQzZ0bsEwFzbnL4u2dIDinxg
	 XmITLUZHjjgm7yclRq3h8Fbxp+4+ow+bL6+3pyYKeUSd2tUbaqHQPsO67UUKUFlgE+tfp
	 GcNs4rkN4jeESv/e37VSq36SXbEp3J0vHNHlMAIWssPBzKu34X3zSSmf/4h4POZAc5yMf
	 grWgF2vm58xyRqjPCjTv9i8psYxBjnNKyGfN6MtY9rtEgAp8eQ8q25Es9w3kgy2QKz7tv
	 2T+g8LxNh1EDlL8pZP/GBwebkcPVuULyZjm5UFpsCNqb70L7Ejdc3OoO29yWAAqLpAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ervt3KHoX6weTgmM3kRzwEYGukf7U2iehUJ+wpCaJjA=;
	b=45vCG+b7EPJ11M8kE8AjSnM7BL8FEWcFUcqvjKCeMuSxhL1osYWRM5+9Vz/jucw31t7U
	 WYScwVbGfFm1KDNtYheGnCs77jSx0PSiVP1DykQiCb3FiMHhSHDwlWP+OnMjkw/CoqGyW
	 LtNFEfMfI+sIRtfhbiecT+vrGVdDFZyH8hsDcSLk8SQQ7tFofAJj1pifJnTWH4QRRvh77
	 6DsVzhgXJzKlLKMQstWWt0q3jujYuHXICkbdHJ/92GHvkq9v52V1CpCnaWgRvbbn5Kvi0
	 bW8cwwJpLzqMoZslNAEGXtlDuP1+CDtPGhd4dYmkBQS68tr5t/lwUVjqN0P8KsimGMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pqzcvm/g";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B898606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B898606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqzcvm/g
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so140221c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333691; x=1794938491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ervt3KHoX6weTgmM3kRzwEYGukf7U2iehUJ+wpCaJjA=;
        b=pqzcvm/gqy/yGgG8w9jlEBdW+4Uc6jHGNhTtTMrhzAsIZQ+y+BSNUsIH24hEFD9pnA
         CM/MHK8Q53z91yZkmEUslq2233L7/qcJRHYpLKzOdZuKHfRlOrARXCsALmdZreE9sLps
         YXrU8A6LKo+GVk7D1QXyHMqEfONeIMjq+UyhhRgVSgH8UOrlJsUr0+o90n0MJR8C0Qeu
         p4gd5+dlvzo7+XUhGjbFg8fhzZFrVdYl1pik0IwM9Ich96UgZBTjvdPYpFlDbBDwNbJf
         KAJDZJ8r6unHwBDeomkn8srCXiysm/amwALMNKSTntBjvfZkY41j0gzjLpll73JZH3iu
         r/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333691; x=1794938491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ervt3KHoX6weTgmM3kRzwEYGukf7U2iehUJ+wpCaJjA=;
        b=KOW+aQtsSYrGllRLg5soDfifw+U+sew8k2Y9yVQvIYPp0FlUO4T1Pp18OSyGY2V5Jb
         718qEGN+eMrRdoyF+U+xcKXnUigPPtS/tgFmsbTQL4dMi20Dskw7ZwkD1irA9H3/2GqM
         ohZXtlVRHVlJsgZyHhQ/vWCZ/TOWbM4qV+X1kUR5X3jBp3NVu9cG41wCn4/zLaEwxDnf
         IjfIUpWg0kut8MOJPfZIRB3tT3VkAWvQDEO0Dc940gp9oFPQfBG0eQxHHG3u74mWWT5T
         LvRRqF1Sk/ixqHAfZRm3KiCfj8sA4Oi6+vlM7mvN74pZn65hT0MFF4PKn7trjJiaFtwh
         wtyA==
X-Forwarded-Encrypted: i=1; AL+hErEhZYEYigVxdv01c8wSbzTTtJfqMeEgBA+drl+i3CQIt+Ak5rFaN2TX5FtTkYSU+lhIjH24+NRnnCrqypA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o7C/Ro3v04dCuPJuOVV+/N0B0l/txJ688JzuqD2rZ1tJjUykM
	QU+qU0LAmwcCYMnT//EKTa0pZU4wCmGecSLWqTjo/p5i512905bjsAFz
X-Gm-Gg: AYBFou2omJhlpcDGtjoZJPbOhSysjoAB2qgWq89KOQLu1kMxYiKdFxc6kA2S2ojpZAa
	gpGVVSl535XdsKScsJn+S7Kx1iXrsLzmgoUguDn7W3ZJH8J79tfxuFRG5HHb+LfKVE2STpTZ0yN
	eOA8FFqaY9MryGwOz3CHYKRoMWxrZ8ui276/n6Z6Pfmmjm+LvgIOfAwwSc4stDjaW8BhIeQ3Zpw
	F/6lKwbty1JwxAt6+Cl726A3213k4rknGmNGFCLYKZ5mhyH/x0Oh7xRyN3+CFN5ykp7OXQ+OxId
	d+8U9hPVMSnh8q0xccF+oRDHZRd07xCT2TRcWFD5sXSPV2NF9/N/uT5TOfZAyszCdCH5OP5PPKc
	aNGFNtI8QqUEhRoKGJnf1ZGWRu9luMQEWr183wIkJO/iZX/NjzDuog+fr9PRplKnLB33jspLFEo
	ISC3yx6CgitTE5DcD/tQJCHh19H4f1NkrZNG8/PIvuqt1DuXFfsijnZnqj1oBFxIFY4+kaJzWtL
	uLkJ973qVm80ECNrxRWL12YA3ArBx+ApDTR4vXWXc2wD52WWU4GVAmwgPh/VHvw/HpLpzaBohxG
	8jDe0VKkS9GNiZcHHqpQmfdHCoiJGeCo+WLLNMM41XlDnlbyT1Foyw8MVqE=
X-Received: by 2002:a05:7022:1181:b0:188:e51:e86a with SMTP id a92af1059eb24-1b3b5f9e98fmr4130814c88.2.1794333690054;
        Tue, 10 Nov 2026 10:01:30 -0800 (PST)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm7624260c88.14.2026.11.10.10.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:01:29 -0800 (PST)
From: Yin Tirui <yintirui@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com
Cc: ljs@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	ryan.roberts@arm.com,
	nico.pache@linux.dev,
	usama.arif@linux.dev,
	liam@infradead.org,
	kas@kernel.org,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	yintirui@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC v2 8/9] mm/huge_memory: split present and non-present huge PMDs separately
Date: Wed, 11 Nov 2026 01:59:23 +0800
Message-Id: <20261110175924.2945538-9-yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110175924.2945538-1-yintirui@gmail.com>
References: <20261110175924.2945538-1-yintirui@gmail.com>
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
index b179dc26dc8d..5eaf8a87f1ba 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3290,143 +3290,31 @@ static bool split_huge_pmd_anon_rmap(const struct split_pmd_state *state,
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
@@ -3438,33 +3326,34 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
 
@@ -3474,19 +3363,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
 			 * Young and dirty bits are not propagated via swp_entry
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
@@ -3494,21 +3383,21 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
@@ -3518,15 +3407,152 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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

