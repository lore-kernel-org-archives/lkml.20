Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6CD2BE03C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942281; cv=none; b=TA+KZmL19cWfPmbDxg8s4wowOScDp/3a976w/aW7TAwsn3Qtzr61L3mJ+GFY9gp1qgBbY8H+PW32NggGp+mLBuORCQDxbUreyvcafGWyXMNiCohSxp+JUHL/t+3gyRPJ4LbKWNV7DS3rCD2zzuHJ7ABxmPrt65aJnz1tNU6Nxd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942281; c=relaxed/simple;
	bh=ZzKclsIsip5W4tkk6HLyJzigiyvSRlS9zTcT1o8eEH8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MYNRbo9C+b2IzrwRK9WNoyRZKgyaHfMNih25pAfoy5ZFJflHS7KO2ZLPcMQyuljmMvA/dHwGb4pl6rge5GNAW0DnTe9AcLXOuIebUigmz1qvZcCRQGcG0YkRoYCCW6zwxvmNtWN96t9S/qsitaKGn/PzYPS52nkP26lsTUQ1kTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cStLlI0i; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cStLlI0i"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84eb992a881so1296983b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942279; x=1788547079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ohz0fKfBZAA1QqDfzvlZw08AYcaw1ZYCfP9nCow3TI=;
        b=cStLlI0igaZ7Fw0pIJSD1CtljAjE+r2Dft8F+IdAybZ++o/LZtQDPLUmIDsIbWTaLW
         iHc/qWfaOhOCJYcjtd1MbhVtwOyj49Qom/+YYrgADC/v1HRtC2rSZs8ea6TLB/7cNlVz
         bW+V1YxSlI1+/q4mM4i5CYNJtHtUqPxdJPxCcYp4Qz7sAjA1/lHGwNrHa47w0ogy1H17
         JVNtiXVROwv0IfeCjrAF+h2CwkMaknWFYA3tXD8QoLUq1VPJbWzpO14psfFp3LPrbeiK
         uf2LkuLt93qMpjsy3wYLnKJ2fqLXqSgpu1C3Zv7LwTDR3zlAm9Rzi4Bf7t3Ibv/RWDLk
         y3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942279; x=1788547079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ohz0fKfBZAA1QqDfzvlZw08AYcaw1ZYCfP9nCow3TI=;
        b=K2xMEEjR1oiFb0PEd+Dlh0sp1MdYGMdY4hPtKzmSBUwYu+TzRZHeegJuVmlxjHZDCj
         2Bvdge4fwSjqfzmK/S8cVjbFgqWrDxMp6CNFsfjrIZV9AldVi9jdCXj4l5ePft6/5C/D
         tJE6qSTOEZFdCGKsOUId7LERK84YHL3Qp8OzOkcp+jg8dkG1AKvA0CK9gYAqIf+k7HkV
         0W99FhOXG949bjaATvFp/khrU6HAf8LUBapnzmHQz/bCaIPz0WNKr7izxgQ3zEu87ifH
         Q1IpkqmspC5ALQ0RBN/EcY+TXRljK+i5At10HqKjaNHTNLThyFf2ZdpLR5gz2APbuVXJ
         ITDg==
X-Forwarded-Encrypted: i=1; AHgh+RqJpRPYv5TQzlydpSXXVQnxp/SbhMWhckTmGiZQcRGusTi8gTiaCFxsRXLJCUQaXyIZdhrhONaon5TTh1U=@vger.kernel.org
X-Gm-Message-State: AFuF++kLqSBrta6HRGiYn4fz8zbWDiQhramG4tV7WzqVUDUWL3bt0Iac
	bpTXEWwWGygDt0dWxBR1wB5q5/czuDhwxwkkd6zAHROEh5KCRYXDnUQU
X-Gm-Gg: AR+sD12yDvjTaFzUP0qjfPTXUqGE9W5mq2IonlURTnGKEsgTB2luooTNtXr/UqrV76u
	hxIIC4w0BpPvxjEE58TjQEmrP2cuON+7nBfUwzcWXd08n4VTa2QgRAordaroEUHHiP5nW08wMww
	V3wOi1U+o4Dp23kDVBAD2ZNE1wlZNkHtGwZsBF7D+wvWFIots/NLC7rPnCcmdHysSSSv9+SkJiV
	C7v/k31X0ijGz/kJH3e4yx3zydVBQxerT5SNKzPTCV/Ahz8SKbDnEIZ6kDo3Fami2wxAVDWvpkW
	bi2vjwugmCzf4RGXKzaJ9VDMsh3+RdUsxTIKLQQvEbJOS0RkyODikdVdKQQv7xruqeTLen3E6fd
	OwxMbvVeGsyK7ToCa1xxGXwdddz6nP1iiOpf9LNz1m1mSnjL+cB/ql/uPQn1Z0+mUdycnBQewbP
	jBnUCZ16UPDx6rL8kmj0yG26sBnYZ+J1xXOfhbCm0G55/KEOP9hXsKZsmF4V1bw40+F/ndRBU9s
	z1fUawXPHtPiMrPGA==
X-Received: by 2002:a05:6a00:3694:b0:857:7317:cff7 with SMTP id d2e1a72fcca58-8577317d16dmr2447151b3a.24.1787942278878;
        Fri, 28 Aug 2026 11:37:58 -0700 (PDT)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fa3sm844230b3a.37.2026.08.28.11.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:37:58 -0700 (PDT)
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
Subject: [PATCH RFC 7/9] mm/huge_memory: add struct split_pmd_state
Date: Sat, 29 Aug 2026 02:33:17 +0800
Message-Id: <0ef68612bfdbe340e8c7f142c12b7f9998181a54.1787941780.git.yintirui@gmail.com>
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

Put the state read out of the entry being split into one descriptor, so the
read and write paths can be separated without passing a long argument list
between them.

No functional change intended.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 160 ++++++++++++++++++++++++++---------------------
 1 file changed, 88 insertions(+), 72 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e0083a9e89b8..72e2cd1d7672 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3194,6 +3194,20 @@ static void unmap_huge_pmd_entry(struct vm_area_struct *vma,
 		folio_put(folio);
 }
 
+struct split_pmd_state {
+	struct folio *folio;
+	struct page *page;
+	bool is_present;
+	bool is_device_private;
+	bool freeze;
+	bool write;
+	bool young;
+	bool dirty;
+	bool soft_dirty;
+	bool uffd;
+	bool anon_exclusive;
+};
+
 /*
  * Convert the folio's PMD-level anonymous rmap into PTE-level ones.
  *
@@ -3213,37 +3227,38 @@ static void unmap_huge_pmd_entry(struct vm_area_struct *vma,
  *
  * Returns: whether the mapping may still be frozen.
  */
-static bool split_huge_pmd_anon_rmap(struct folio *folio, struct page *page,
-		struct vm_area_struct *vma, unsigned long haddr, bool freeze,
-		bool anon_exclusive)
+static bool split_huge_pmd_anon_rmap(const struct split_pmd_state *state,
+		struct vm_area_struct *vma, unsigned long haddr)
 {
 	rmap_t rmap_flags = RMAP_NONE;
 
-	if (freeze &&
-	    (!anon_exclusive || !folio_try_share_anon_rmap_pmd(folio, page)))
+	if (state->freeze &&
+	    (!state->anon_exclusive ||
+	     !folio_try_share_anon_rmap_pmd(state->folio, state->page)))
 		return true;
 
-	folio_ref_add(folio, HPAGE_PMD_NR - 1);
-	if (anon_exclusive)
+	folio_ref_add(state->folio, HPAGE_PMD_NR - 1);
+	if (state->anon_exclusive)
 		rmap_flags |= RMAP_EXCLUSIVE;
-	folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR, vma, haddr,
-				 rmap_flags);
+	folio_add_anon_rmap_ptes(state->folio, state->page, HPAGE_PMD_NR, vma,
+				 haddr, rmap_flags);
 	return false;
 }
 
 static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long haddr, bool freeze)
 {
-	struct mm_struct *mm = vma->vm_mm;
-	pmd_t old_pmd = *pmd;
+	const pmd_t old_pmd = *pmd;
 	const bool is_present = pmd_present(old_pmd);
+	struct mm_struct *mm = vma->vm_mm;
+	struct split_pmd_state state = {
+		.is_present = is_present,
+		.freeze = freeze,
+	};
 	struct folio *folio;
-	struct page *page;
+	unsigned long addr;
 	pgtable_t pgtable;
 	pmd_t _pmd;
-	bool soft_dirty, uffd_wp = false, young = false, write = false;
-	bool anon_exclusive = false, dirty = false;
-	unsigned long addr;
 	pte_t *pte;
 	int i;
 
@@ -3286,38 +3301,39 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return;
 	}
 
+	state.folio = folio;
+
 	if (pmd_is_migration_entry(old_pmd)) {
-		softleaf_t entry;
+		const softleaf_t entry = softleaf_from_pmd(old_pmd);
 
-		entry = softleaf_from_pmd(old_pmd);
-		page = softleaf_to_page(entry);
+		state.page = softleaf_to_page(entry);
 
-		soft_dirty = pmd_swp_soft_dirty(old_pmd);
-		uffd_wp = pmd_swp_uffd(old_pmd);
+		state.soft_dirty = pmd_swp_soft_dirty(old_pmd);
+		state.uffd = pmd_swp_uffd(old_pmd);
 
-		write = softleaf_is_migration_write(entry);
-		anon_exclusive = softleaf_is_migration_read_exclusive(entry);
-		young = softleaf_is_migration_young(entry);
-		dirty = softleaf_is_migration_dirty(entry);
+		state.write = softleaf_is_migration_write(entry);
+		state.anon_exclusive =
+			softleaf_is_migration_read_exclusive(entry);
+		state.young = softleaf_is_migration_young(entry);
+		state.dirty = softleaf_is_migration_dirty(entry);
 	} else if (pmd_is_device_private_entry(old_pmd)) {
-		softleaf_t entry;
+		const softleaf_t entry = softleaf_from_pmd(old_pmd);
 
-		entry = softleaf_from_pmd(old_pmd);
-		page = softleaf_to_page(entry);
+		state.is_device_private = true;
+		state.page = softleaf_to_page(entry);
 
-		soft_dirty = pmd_swp_soft_dirty(old_pmd);
-		uffd_wp = pmd_swp_uffd(old_pmd);
+		state.soft_dirty = pmd_swp_soft_dirty(old_pmd);
+		state.uffd = pmd_swp_uffd(old_pmd);
 
-		write = softleaf_is_device_private_write(entry);
-		anon_exclusive = PageAnonExclusive(page);
+		state.write = softleaf_is_device_private_write(entry);
+		state.anon_exclusive = PageAnonExclusive(state.page);
 
 		/*
 		 * Device private folios are treated the same as regular folios
 		 * w.r.t. anon exclusive handling, see
 		 * split_huge_pmd_anon_rmap().
 		 */
-		freeze = split_huge_pmd_anon_rmap(folio, page, vma, haddr,
-						  freeze, anon_exclusive);
+		state.freeze = split_huge_pmd_anon_rmap(&state, vma, haddr);
 	} else {
 		/*
 		 * Up to this point the pmd is present and huge and userland has
@@ -3345,22 +3361,22 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		 * This must also happen before PageAnonExclusive() is read
 		 * below, see folio_try_share_anon_rmap_pmd().
 		 */
-		old_pmd = pmdp_invalidate(vma, haddr, pmd);
-		page = pmd_page(old_pmd);
-		if (pmd_dirty(old_pmd)) {
-			dirty = true;
+		const pmd_t pmdval = pmdp_invalidate(vma, haddr, pmd);
+
+		state.page = pmd_page(pmdval);
+		state.write = pmd_write(pmdval);
+		state.young = pmd_young(pmdval);
+		state.dirty = pmd_dirty(pmdval);
+		state.soft_dirty = pmd_soft_dirty(pmdval);
+		state.uffd = pmd_uffd(pmdval);
+		state.anon_exclusive = PageAnonExclusive(state.page);
+
+		if (state.dirty)
 			folio_set_dirty(folio);
-		}
-		write = pmd_write(old_pmd);
-		young = pmd_young(old_pmd);
-		soft_dirty = pmd_soft_dirty(old_pmd);
-		uffd_wp = pmd_uffd(old_pmd);
 
 		VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
 
-		anon_exclusive = PageAnonExclusive(page);
-		freeze = split_huge_pmd_anon_rmap(folio, page, vma, haddr,
-						  freeze, anon_exclusive);
+		state.freeze = split_huge_pmd_anon_rmap(&state, vma, haddr);
 	}
 
 	/*
@@ -3377,33 +3393,33 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (freeze || pmd_is_migration_entry(old_pmd)) {
+	if (state.freeze || (!state.is_present && !state.is_device_private)) {
 		pte_t entry;
 		swp_entry_t swp_entry;
 
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
-			if (write)
+			if (state.write)
 				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
-			else if (anon_exclusive)
+						page_to_pfn(state.page + i));
+			else if (state.anon_exclusive)
 				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
+						page_to_pfn(state.page + i));
 			else
 				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
-			if (young)
+						page_to_pfn(state.page + i));
+			if (state.young)
 				swp_entry = make_migration_entry_young(swp_entry);
-			if (dirty)
+			if (state.dirty)
 				swp_entry = make_migration_entry_dirty(swp_entry);
 			entry = swp_entry_to_pte(swp_entry);
-			if (soft_dirty)
+			if (state.soft_dirty)
 				entry = pte_swp_mksoft_dirty(entry);
-			if (uffd_wp)
+			if (state.uffd)
 				entry = pte_swp_mkuffd(entry);
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
-	} else if (pmd_is_device_private_entry(old_pmd)) {
+	} else if (state.is_device_private) {
 		pte_t entry;
 		swp_entry_t swp_entry;
 
@@ -3413,19 +3429,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			 * pages corresponding to the pte entries when freeze
 			 * is false.
 			 */
-			if (write)
+			if (state.write)
 				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page + i));
+						page_to_pfn(state.page + i));
 			else
 				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page + i));
+						page_to_pfn(state.page + i));
 			/*
 			 * Young and dirty bits are not progated via swp_entry
 			 */
 			entry = swp_entry_to_pte(swp_entry);
-			if (soft_dirty)
+			if (state.soft_dirty)
 				entry = pte_swp_mksoft_dirty(entry);
-			if (uffd_wp)
+			if (state.uffd)
 				entry = pte_swp_mkuffd(entry);
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
@@ -3433,21 +3449,21 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	} else {
 		pte_t entry;
 
-		entry = mk_pte(page, READ_ONCE(vma->vm_page_prot));
-		if (write)
+		entry = mk_pte(state.page, READ_ONCE(vma->vm_page_prot));
+		if (state.write)
 			entry = pte_mkwrite(entry, vma);
-		if (!young)
+		if (!state.young)
 			entry = pte_mkold(entry);
 		/* NOTE: this may set soft-dirty too on some archs */
-		if (dirty)
+		if (state.dirty)
 			entry = pte_mkdirty(entry);
-		if (soft_dirty)
+		if (state.soft_dirty)
 			entry = pte_mksoft_dirty(entry);
-		if (uffd_wp)
+		if (state.uffd)
 			entry = pte_mkuffd(entry);
 
 		/* Restore PAGE_NONE so an RWP marker keeps trapping */
-		if (userfaultfd_rwp(vma) && uffd_wp)
+		if (userfaultfd_rwp(vma) && state.uffd)
 			entry = pte_modify(entry, PAGE_NONE);
 
 		for (i = 0; i < HPAGE_PMD_NR; i++)
@@ -3457,10 +3473,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_is_migration_entry(old_pmd))
-		folio_remove_rmap_pmd(folio, page, vma);
-	if (freeze)
-		put_page(page);
+	if (state.is_present || state.is_device_private)
+		folio_remove_rmap_pmd(state.folio, state.page, vma);
+	if (state.freeze)
+		put_page(state.page);
 
 	smp_wmb(); /* make pte visible before pmd */
 	pmd_populate(mm, pmd, pgtable);
-- 
2.34.1

