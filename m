Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2327D46EF72
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190166; cv=none; b=Vguwu4K/s4tH0i516C9n5NUwA5zrpiGeld/U58kAfGaG0o4XrjfWGo1C/TRlc17Gnn02JFABZ3wsb6gtH6+wS75xdLplIF0nGr9frtGK9P7L740QpIherCNWvL3pOWMJxANJ7j8HxoUoNsiURXNPjQ+4ZjGVg11zljCavP5Jhq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190166; c=relaxed/simple;
	bh=UaUyNhOGBbyGnXyWQ0gRq6d3T2m3l+qhkojJR7RXZqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ApC3tZXGMV1DFxSAWK9BTlvFolj9/w87fhhCjkN3MyJ6RvapSmdNBeCCzckcQAwcp641wJ7nDDUX7SqLLU+cjHM68hp9cYoM5agzROYF1QjMISyA0rL0fAZXWES2P6to7t2UDqVmhc8u1xyIzHmBtsERmy4irGWSSISkTij47fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZXsoPCh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZXsoPCh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so26352065e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788190163; x=1788794963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irCGXXhFVKf83sDiQPQ3gXkYgJ1AJeMIuaHhsWH1YOk=;
        b=gZXsoPChrVhSfrjaLEgxzBcBwy2M60WV6hqLuJm9soS8jWRV5+4544cQr3IoqL1mqv
         fD9R5VyFutTSrUU9rq2gWquznXpjoztp2S+psrzO3ziTIPdIcLk7cFu95v5INpbe4F1l
         y6stRBC0oXTUtyZ8D40QUwWgGKoxa0ix3B+x0InIY5HIRukjWt36t3HYSzO1j/qVTr8Y
         ah7zbY630yiaI4C1HNcAnZrQeX5EvHM2kWir9kPDItlv767zpnmOAE5cuBQu7vcrV3l2
         EBF0q2EGP4LGmftuOM7rCPVW7dUAYy4K/mVWcMuYpS9B9+Aby3e5mpKCkz3qjj7c0zzZ
         5n3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190163; x=1788794963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=irCGXXhFVKf83sDiQPQ3gXkYgJ1AJeMIuaHhsWH1YOk=;
        b=pfL9lJpNXlGVlTem/gQ92Ek4TgHZNOR9qwvmu+fILzCqFeMcG92ziT5Up5Vlqadtfl
         8KrMqVVMbWD3C3Tb7sh96+tFftUZ2ujLgmaqOyW2L8BUvu2PzQKQDazHyqjn+f/XPLwF
         c8TnHTH1j4xuphoWegAEmVq/z081LxSpVSVlB57C16GNDerrld86XN9Pp7umo3xkDdt1
         kr2Ap4On98iLvsMDXPQHIWzFz6aSaWgC1GwrXpIKSPpOVvqIKmK9zzCz2T0RSunxCwOa
         d8+un8xskBG6MPWW6/8ZW2ojChSsX9V8DxtoPAoPwTkYEE05F39v0ElGHTZLejPVbYaM
         TITA==
X-Forwarded-Encrypted: i=1; AHgh+RrPlsOc/8FUSNC17Gej4LyR7iPOb79eBOJekZWGQBfiJJxtb63aojIvuDeeZMbsgZ4LMDiZytXyt8juT50=@vger.kernel.org
X-Gm-Message-State: AFuF++k1iGKpOIWnyTqr3Q3RckaEowg+M5QV0aDpyy0iteK5R0h4d+KU
	Pjc1NoB2tQBIOVAYbwpf1/kTbQDRdfm1sheT1HTpagr9RNCq9LILXJ2G
X-Gm-Gg: AR+sD12zlarfaGzlLA2otQS6CWGZX5m5tlpfhBZz6slIrNsMfUWWHJTgv7ZwvRohftL
	OSiyH8iznq0g82/EY5MjHgQZNLVhPQwBgUSWb2MCRkFGNAVfethGPxkVwuvOgCGLLQ3JoykgL7A
	ThJvhMkrsTgmzFpSMuIsvrIVctqHNHP+r7FZpTR8hGHpZcd72dTMKe46ZdTIKsg+dL+zUTFvZw2
	/hHhvksa3xOf2WVEGS0Hu6e65LPfEquvx6L0G3sjqHGqC4V08gf1qxjUCCJ8K3l1OSEqLzuMSQD
	BbVbdecpLwpNBzv2MDU+l1MDATBVI8N+qvIFAWststADhHA2y04Vo7t4pfvoFvzAjSDCKZbcpwZ
	A6/ztYPM2MHv65ERBIwjQSNJdFD7RcyAwa2tjZNF7GwThHukYmEiFPjF4jyE5kEyE6i3j4BFi4Q
	QvQ784zCiWxA9u9Yn+DMSDDDUhGzPNjfDP8eNNfk/amCRz2rDIpNEv88xUkcmi61Id0/vYwiP3H
	xSLeKmjYMqKADYtBxDYGqcnCCzWe1dEpdipWcKiXEXngtC0jUMK7Wm9sXVWD5+V7Tsht5PT+mTR
	LNp4SfrtSzQnFOrUGUyyskHD9NHrSTEPTakIK9W2ON2e1pHUmSEkoDTkytMlbnNq04/oS0vaNRL
	Eu12M
X-Received: by 2002:a05:600c:524c:b0:49b:9161:db26 with SMTP id 5b1f17b1804b1-49cdc55a9e5mr19869665e9.14.1788190162893;
        Mon, 31 Aug 2026 08:29:22 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20793sm22661828f8f.17.2026.08.31.08.29.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 08:29:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 6.6.y v2] Revert "arm64: mm: Don't remap pgtables for allocate vs populate"
Date: Mon, 31 Aug 2026 17:29:06 +0200
Message-Id: <20260831152906.7000-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <2026083151-mascot-unshaken-5f46@gregkh>
References: <2026083151-mascot-unshaken-5f46@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 54322d95309d9aa4cb77b34ee4b6c8b541f3e21f.

The 6.6.y backport removes the clearing performed by
early_pgtable_alloc(). Its replacement clears allocations made by the
generic page-table walkers, but 6.6's create_idmap() still allocates an
extra root level directly when a sub-48-bit VA kernel is loaded
sufficiently high in physical memory.

memblock_phys_alloc_range() does not zero the returned memory. The direct
caller can therefore publish an uncleared root page. A stale entry can
trip the bad-descriptor BUG_ON or be followed as a page-table descriptor,
preventing the kernel from booting.

Mainline is not affected because commit e6128a8e523c ("arm64: mm: Use
48-bit virtual addressing for the permanent ID map") removed the dynamic
extra level before commit 0e9df1c905d8 ("arm64: mm: Don't remap pgtables
for allocate vs populate") moved page-table initialization out of the
allocator.

Revert the optimization in 6.6.y to restore allocation-time clearing for
all callers.

Fixes: 54322d95309d ("arm64: mm: Don't remap pgtables for allocate vs populate")
Link: https://lore.kernel.org/r/2026083151-mascot-unshaken-5f46@gregkh
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Replace the targeted extra-idmap clear with a full revert of
  54322d95309d (Ard).

 arch/arm64/mm/mmu.c | 58 ++++++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e075792d72257..c49cf99161881 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -106,12 +106,28 @@ EXPORT_SYMBOL(phys_mem_access_prot);
 static phys_addr_t __init early_pgtable_alloc(int shift)
 {
 	phys_addr_t phys;
+	void *ptr;
 
 	phys = memblock_phys_alloc_range(PAGE_SIZE, PAGE_SIZE, 0,
 					 MEMBLOCK_ALLOC_NOLEAKTRACE);
 	if (!phys)
 		panic("Failed to allocate page table page\n");
 
+	/*
+	 * The FIX_{PGD,PUD,PMD} slots may be in active use, but the FIX_PTE
+	 * slot will be free, so we can (ab)use the FIX_PTE slot to initialise
+	 * any level of table.
+	 */
+	ptr = pte_set_fixmap(phys);
+
+	memset(ptr, 0, PAGE_SIZE);
+
+	/*
+	 * Implicit barriers also ensure the zeroed page is visible to the page
+	 * table walker
+	 */
+	pte_clear_fixmap();
+
 	return phys;
 }
 
@@ -153,14 +169,6 @@ bool pgattr_change_is_safe(u64 old, u64 new)
 	return ((old ^ new) & ~mask) == 0;
 }
 
-static void init_clear_pgtable(void *table)
-{
-	clear_page(table);
-
-	/* Ensure the zeroing is observed by page table walks. */
-	dsb(ishst);
-}
-
 static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot)
 {
@@ -203,15 +211,12 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 			pmdval |= PMD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pte_phys = pgtable_alloc(PAGE_SHIFT);
-		ptep = pte_set_fixmap(pte_phys);
-		init_clear_pgtable(ptep);
-		ptep += pte_index(addr);
 		__pmd_populate(pmdp, pte_phys, pmdval);
-	} else {
-		BUG_ON(pmd_bad(pmd));
-		ptep = pte_set_fixmap_offset(pmdp, addr);
+		pmd = READ_ONCE(*pmdp);
 	}
+	BUG_ON(pmd_bad(pmd));
 
+	ptep = pte_set_fixmap_offset(pmdp, addr);
 	do {
 		pgprot_t __prot = prot;
 
@@ -290,15 +295,12 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 			pudval |= PUD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pmd_phys = pgtable_alloc(PMD_SHIFT);
-		pmdp = pmd_set_fixmap(pmd_phys);
-		init_clear_pgtable(pmdp);
-		pmdp += pmd_index(addr);
 		__pud_populate(pudp, pmd_phys, pudval);
-	} else {
-		BUG_ON(pud_bad(pud));
-		pmdp = pmd_set_fixmap_offset(pudp, addr);
+		pud = READ_ONCE(*pudp);
 	}
+	BUG_ON(pud_bad(pud));
 
+	pmdp = pmd_set_fixmap_offset(pudp, addr);
 	do {
 		pgprot_t __prot = prot;
 
@@ -336,15 +338,12 @@ static void alloc_init_pud(pgd_t *pgdp, unsigned long addr, unsigned long end,
 			p4dval |= P4D_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pud_phys = pgtable_alloc(PUD_SHIFT);
-		pudp = pud_set_fixmap(pud_phys);
-		init_clear_pgtable(pudp);
-		pudp += pud_index(addr);
 		__p4d_populate(p4dp, pud_phys, p4dval);
-	} else {
-		BUG_ON(p4d_bad(p4d));
-		pudp = pud_set_fixmap_offset(p4dp, addr);
+		p4d = READ_ONCE(*p4dp);
 	}
+	BUG_ON(p4d_bad(p4d));
 
+	pudp = pud_set_fixmap_offset(p4dp, addr);
 	do {
 		pud_t old_pud = READ_ONCE(*pudp);
 
@@ -426,10 +425,11 @@ void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
 
 static phys_addr_t __pgd_pgtable_alloc(int shift)
 {
-	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
-	void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL & ~__GFP_ZERO);
-
+	void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL);
 	BUG_ON(!ptr);
+
+	/* Ensure the zeroed page is visible to the page table walker */
+	dsb(ishst);
 	return __pa(ptr);
 }
 
-- 
2.39.5 (Apple Git-154)
