Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5FE48C8D7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849076; cv=none; b=tJNuhAAIzKWd5nwY1S3FrIJRUCqVwfng0jIIXcCn97RawENpRFvQMDyw5Mcs7rKRuR8W6zv9Hb+ECIELziDY2gF1sOrYjFcnTA0o7Z98SSwlCKXMUmJOzAqUCdOE5/7BThrB8878zDoIX8MfLvFi4rXK4fqJ+eNl+uA4lBjAigA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849076; c=relaxed/simple;
	bh=mis7t5NiiX9Q0gCF98X4pR5PBaFhXL0ylYMufFT8C+Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g9vK7SwNxUX0NQXjAAGlT2OPXjYWQRV11QK1MWrT6pdks9ROBbJbEFM1uZqePPgNOcE9C8Lj1Nbk2O5qeBxwREecsgzrIAqQIh6laujsZ+Uj5X6ljOPAvNJaJTFmgYJ4rjcVeGgbcELwSJ/DFsVtCRSBM5EINqb8Z5oyzH090jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nD1HIwLc; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nD1HIwLc"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-482f41ca436so20218f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787849073; x=1788453873; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unrQEc9LN1JZQh7e5YkkcFIaqqsfhvS1fmOT/8/PD+U=;
        b=nD1HIwLcMYg1PFAyi2WpKpScfuWujCkfNAyLu7Sxh1a55XCN+ePfDQsaDdb0GGRSDj
         wOFeRU2yxOytWVRQaEoyWLJFufRgRNlpU1c1M74jtq0QQMUZi6Sh2WjhDP9YJRV1MF7A
         2IVJlxTENiDwQyk5dnS6Nj3lGnoMfysBZPk2wPvjJqh3Ont7TQN10VoAQkuYox+8Onus
         gKklUKhYnGsf/7h2AjrCRvD6wKzf7VDIX7BcKINTaYFcGBWq//8MeeUcBsROLqIssCih
         66Fp7AnOkEz+uwGiVtegUubf+onloWu2ZnQzXpIPESoGsJYtxxMGB8xTq/6ja9fU3ziD
         sUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849073; x=1788453873;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unrQEc9LN1JZQh7e5YkkcFIaqqsfhvS1fmOT/8/PD+U=;
        b=OE3yp99p2c+s34R5ME+GEo/1n3JasplmRCYu6bEzswk0Sv2al7fONpF0si/W4szKmm
         vA97fhyBuzFSUp3CeYrbSTwenWBVs48/ydQznk9/S9NkMXkLQ71+MBk52tqH6JUsZqmy
         Zaf+MGbyvBL8XTbXWu0dyOBn1FSuspymOqNJiJFFgZG3Wmz9mpXa5vBcRA1b7Z7W0jn0
         bSbwHXPoaTiM7KJ29wYlR/OwOlswDovezZ3ki6aWQE7zY0TmGTU/SidgH8JP1kYaAPLg
         csg2qylW+JdtGa/TC6vBgTDSqtGfrC758+ED4hAg7VoCiVXUshicdem/wZacMJgWOwWf
         SqIA==
X-Gm-Message-State: AFuF++kDopApnHJ9KOQU1aVteCOI3CoWNRGJY6IBDWulhVrH80Z5Txev
	LG49hNKCkjMKgBZ964D3hbXaNDhGgPk5sPCvt4Tam5ljqHNKvXbBBnPI/bb3YatySGLR1S8ZcOh
	mwAFLlNiYa7K75K47x98fEQ1GiqRhiTVUTGr4HdwfPMLGehpDWoa7JnvCUoSEg3cPrMF7B4nkhv
	phCuSFKhcA6t/BlzYa/9pUMItSOYg2N6hcYg==
X-Received: from wmlc16.prod.google.com ([2002:a7b:c850:0:b0:495:5edc:795b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f8d:b0:499:621a:2ec2
 with SMTP id 5b1f17b1804b1-49b91c17c41mr4617635e9.3.1787849072790; Thu, 27
 Aug 2026 09:44:32 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:44:12 +0200
In-Reply-To: <20260827164409.3421848-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827164409.3421848-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5363; i=ardb@kernel.org;
 h=from:subject; bh=IXwvq/N/tjoj1rBZtZdDN7mLt+hNS7LMJFa0rm3k0+Y=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWtCZkzKm9Xbn65Wvf1HVXO2m+/z5fPaL7zrsHy43dJ5w
 ddHJXkzO0pZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEjEoY/qk95OHUKhcw3B27
 Rl9VrelVyptFld+fWJ62rI/wquyJf8PIsKV41pJtfLPmrCkyO/FOQzDky5EoqdVnymPfdMWcS5s Uzg4A
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827164409.3421848-8-ardb+git@google.com>
Subject: [RFC PATCH v2 2/4] arm64: mm: Use fault handler to permit
 swapper_pg_dir updates
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Instead of checking the destination of a page table descriptor update
against the virtual address of swapper_pg_dir in the kernel image, and
taking a dedicated path to perform such updates via a fixmap alias,
rely on a fault handler to do so if the plain store faulted.

This is more efficient for the general case, and makes it more
straight-forward to extend this logic to other page tables that may have
been allocated statically in the .rodata region of the kernel image.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/fixmap.h  |  1 +
 arch/arm64/include/asm/pgtable.h | 49 +++++++++-----------
 arch/arm64/mm/mmu.c              | 18 +++----
 3 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 9191125738e9..8db791dcb4cb 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -99,6 +99,7 @@ enum fixed_addresses {
 	FIX_PUD,
 	FIX_P4D,
 	FIX_PGD,
+	FIX_PTVAL,
 
 	__end_of_fixed_addresses
 };
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6000905a2e86..799cd9d52c28 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -35,6 +35,7 @@
 #include <asm/cmpxchg.h>
 #include <asm/fixmap.h>
 #include <asm/por.h>
+#include <asm/uaccess.h>
 #include <linux/mmdebug.h>
 #include <linux/mm_types.h>
 #include <linux/sched.h>
@@ -814,7 +815,7 @@ extern pgd_t idmap_pg_dir[];
 extern pgd_t tramp_pg_dir[];
 extern pgd_t reserved_pg_dir[];
 
-extern void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
+void try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval);
 
 static inline bool in_swapper_pgdir(void *addr)
 {
@@ -824,17 +825,14 @@ static inline bool in_swapper_pgdir(void *addr)
 
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
-#ifdef __PAGETABLE_PMD_FOLDED
-	if (in_swapper_pgdir(pmdp)) {
-		set_swapper_pgd((pgd_t *)pmdp, __pgd(pmd_val(pmd)));
-		return;
-	}
-#endif /* __PAGETABLE_PMD_FOLDED */
-
-	WRITE_ONCE(*pmdp, pmd);
+	__put_kernel_nofault(pmdp, &pmd, pmd_t, fault);
 
 	if (pmd_valid(pmd))
 		queue_pte_barriers();
+	return;
+
+fault:
+	try_set_readonly_ptval(&pmd_val(*pmdp), pmd_val(pmd));
 }
 
 static inline void pmd_clear(pmd_t *pmdp)
@@ -890,15 +888,14 @@ static inline bool pgtable_l4_enabled(void);
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
 {
-	if (!pgtable_l4_enabled() && in_swapper_pgdir(pudp)) {
-		set_swapper_pgd((pgd_t *)pudp, __pgd(pud_val(pud)));
-		return;
-	}
-
-	WRITE_ONCE(*pudp, pud);
+	__put_kernel_nofault(pudp, &pud, pud_t, fault);
 
 	if (pud_valid(pud))
 		queue_pte_barriers();
+	return;
+
+fault:
+	try_set_readonly_ptval(&pud_val(*pudp), pud_val(pud));
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -971,13 +968,12 @@ static inline bool mm_pud_folded(const struct mm_struct *mm)
 
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
-	if (in_swapper_pgdir(p4dp)) {
-		set_swapper_pgd((pgd_t *)p4dp, __pgd(p4d_val(p4d)));
-		return;
-	}
-
-	WRITE_ONCE(*p4dp, p4d);
+	__put_kernel_nofault(p4dp, &p4d, p4d_t, fault);
 	queue_pte_barriers();
+	return;
+
+fault:
+	try_set_readonly_ptval(&p4d_val(*p4dp), p4d_val(p4d));
 }
 
 static inline void p4d_clear(p4d_t *p4dp)
@@ -1099,13 +1095,12 @@ static inline bool mm_p4d_folded(const struct mm_struct *mm)
 
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 {
-	if (in_swapper_pgdir(pgdp)) {
-		set_swapper_pgd(pgdp, __pgd(pgd_val(pgd)));
-		return;
-	}
-
-	WRITE_ONCE(*pgdp, pgd);
+	__put_kernel_nofault(pgdp, &pgd, pgd_t, fault);
 	queue_pte_barriers();
+	return;
+
+fault:
+	try_set_readonly_ptval(&pgd_val(*pgdp), pgd_val(pgd));
 }
 
 static inline void pgd_clear(pgd_t *pgdp)
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9c1aa838e9d5..b97e4bf99ca5 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -63,34 +63,34 @@ static bool rodata_is_rw __ro_after_init = true;
  */
 long __section(".mmuoff.data.write") __early_cpu_boot_status;
 
-static DEFINE_SPINLOCK(swapper_pgdir_lock);
 static DEFINE_MUTEX(fixmap_lock);
 
-void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
+void noinstr try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval)
 {
-	pgd_t *fixmap_pgdp;
+	static DEFINE_SPINLOCK(lock);
+
+	BUG_ON(!in_swapper_pgdir(ptvalp));
 
 	/*
 	 * Don't bother with the fixmap if swapper_pg_dir is still mapped
 	 * writable in the kernel mapping.
 	 */
 	if (rodata_is_rw) {
-		WRITE_ONCE(*pgdp, pgd);
+		WRITE_ONCE(*ptvalp, ptval);
 		dsb(ishst);
 		isb();
 		return;
 	}
 
-	spin_lock(&swapper_pgdir_lock);
-	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
-	WRITE_ONCE(*fixmap_pgdp, pgd);
+	guard(spinlock)(&lock);
+	ptvalp = (ptval_t *)set_fixmap_offset(FIX_PTVAL, __pa_symbol(ptvalp));
+	WRITE_ONCE(*ptvalp, ptval);
 	/*
 	 * We need dsb(ishst) here to ensure the page-table-walker sees
 	 * our new entry before set_p?d() returns. The fixmap's
 	 * flush_tlb_kernel_range() via clear_fixmap() does this for us.
 	 */
-	pgd_clear_fixmap();
-	spin_unlock(&swapper_pgdir_lock);
+	clear_fixmap(FIX_PTVAL);
 }
 
 pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-- 
2.55.0.887.g758fc8c411-goog

