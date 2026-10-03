Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49972C15AC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986918; cv=none; b=SGh1nzq/VttK5zGXjLKSqJfBrm+WchFiSJHh3XTbxDix9RkAyfh4rYlk8i5310Ux5DdtoQp/vyMWQLeiAxzzIS9KCmVPs3tngU+uYD8MkCv9Smql/Z2NJuoCVbq8Wl8YPg+t0Icg6e+a7KQNegHideJFIC4xYzRccek/aa+1u0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986918; c=relaxed/simple;
	bh=4Mz1IcA+CV0S3qNSGmrdZzIXbaOmyFyHSIYuiCMaJa4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lluQNh+VQ3PscdNnM7Uhs22WyY6yzXyqIYrS3KSxPSergwQh8XgyVspXxohNQEzZqYoQ66KptSOp75ndDoIxh83UloC0fhfd3hzoweTSGix6hwkW7gwFhDv8REhQVjCHYPvOqTPUglohpZd04gpnM/k6QfnOI8eiRc4qG6PqirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OiYgSHf9; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OiYgSHf9"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88b686ed759so70130b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986909; x=1791591709; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMiZSMFdM56iT7i//29GA+eRMEhcqKKBOVTZB/kicf8=;
        b=OiYgSHf9aWvsKBpatubre5/6u59DqMkkoAv/pzz8dN68qBS8DoMdTWvjGObI6jnNIM
         GX7dXFYC/SgLe1P1WqOrLPSfa+sIitCx4ix49K1TxWVpgQz7PEa7eKhZBwYBMdCX/Fvj
         Sjj1YsT0QsYquth8tgWgy1qdRgoyy+MeLOLeeW8/bqatgOpD+sCytEEcJhHbmBF5PXvE
         g7U2+UejOJEEvgq/pavOXlZsPoEo4mUZghmEkhLN+XEhy2YVcaInZ/up1oqwiQq6Lrrx
         WdDhPDzkqXKR66V1MgrYqCnHlGKkHO6225xXWhHGGiiAocb9w6RQY1taAm3dvFCtAO9k
         jFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986909; x=1791591709;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMiZSMFdM56iT7i//29GA+eRMEhcqKKBOVTZB/kicf8=;
        b=LDTChDREc/Cshb2g+XJr1kHK7Tqh5AM/9Dzjm2otijSXOcc1+elkOKqwvAp3mbi+IA
         UYgyssw4wbLIQogq0qJ7VlksC8J9E2NWhZZxD9KW+K0AUyCBO/oTvqc0req3pBTGWktF
         LSRFEITqBGw1slIuQ3FdehjLs2UqwvKpH3Lwv91V4ZAy8tUrCTXX3TJfTTfWRgpPJHlJ
         N4ze351z8ineYdxDexYmzwPWhK5//TeE0dubSBxy9fbTD2B0IqxmdU9MJlpvZMhLigIg
         pCU5bdHIWVJC3FCPiPC8OQQ8OHBqQ4G9O9p6YWeImPnVcW45TH8uQCxMk5GtQkp3eF+g
         nycg==
X-Forwarded-Encrypted: i=1; AKwUvBz6l/q63bh7kNG9xrJ+hin/P985bBt15PuB+U2ASE2A30ZabYn0HvFTjwawcbpn7cpHn7M5Mvo5okrLK4k=@vger.kernel.org
X-Gm-Message-State: AFuF++kHeWZ+MsWW56uAOhU6EMoUIpZi0FqaWwxfs6YLIXy7Tebo4tu9
	vPhay4eod8epe6CACwlVJb76Dak3BdQiqF/7ky5QplORXdOsvEVWjJbx26EOdpZAhxyXZoDV9G0
	P28xuwiQsdla6kk2ZWE332A==
X-Received: from pgdo3-n2.prod.google.com ([2002:a05:6a02:6203:20b0:cc7:492f:3ac1])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4327:b0:3e0:df81:23ef with SMTP id adf61e73a8af0-3e0df815706mr74686637.74.1790986908868;
 Fri, 02 Oct 2026 17:21:48 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:19 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-17-jthoughton@google.com>
Subject: [PATCH v2 16/20 DO-NOT-MERGE] hugetlb_vmemmap: Use
 try_populate_vmemmap_pmd for replacing in-use PMDs
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

This routine is to be used for updating in-use, leaf-level PMDs in the
vmemmap without introducing a window where vmemmap accesses might fault.

Because try_populate_vmemmap_pmd() can fail, the split_page() call needs
to be moved to after the PMD update. Because both split_page() and the
PMD update are done under the page table lock, this rearrangement is
safe.

Only leaf-level PMD to non-leaf PMD (mapping the same physical pages) is
the only transition that needs to be supported.

Collapsing a non-leaf PMD to a leaf-level PMD is not used by HVO, so
try_populate_vmemmap_pmd() need not support it.

This patch allows arm64's implementation to replaced with one that does
not require BBML3.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgalloc.h     |  8 ++++++++
 arch/loongarch/include/asm/pgalloc.h |  2 ++
 arch/riscv/include/asm/pgalloc.h     |  2 ++
 arch/x86/include/asm/pgalloc.h       |  2 ++
 include/linux/pgalloc.h              | 21 +++++++++++++++++++++
 mm/hugetlb_vmemmap.c                 | 25 ++++++++++++++-----------
 6 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 1b4509d3382c..0263329fb7b3 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -121,4 +121,12 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 		       PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_PXN);
 }
 
+static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
+					   pte_t *pgtable)
+{
+	/* BBLM3 is required. Its presence has been checked. */
+	pmd_populate_kernel(&init_mm, pmdp, pgtable);
+	return 0;
+}
+
 #endif
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 248f62d0b590..0553addb0afa 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -24,6 +24,8 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t pte)
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
+
 #ifndef __PAGETABLE_PMD_FOLDED
 
 static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 770ce18a7328..b9b4b25fc6f0 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -31,6 +31,8 @@ static inline void pmd_populate(struct mm_struct *mm,
 	set_pmd(pmd, __pmd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
 }
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
+
 #ifndef __PAGETABLE_PMD_FOLDED
 static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 {
diff --git a/arch/x86/include/asm/pgalloc.h b/arch/x86/include/asm/pgalloc.h
index c88691b15f3c..f8d24b97cbf5 100644
--- a/arch/x86/include/asm/pgalloc.h
+++ b/arch/x86/include/asm/pgalloc.h
@@ -82,6 +82,8 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd(((pteval_t)pfn << PAGE_SHIFT) | _PAGE_TABLE));
 }
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
+
 #if CONFIG_PGTABLE_LEVELS > 2
 extern void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd);
 
diff --git a/include/linux/pgalloc.h b/include/linux/pgalloc.h
index 9174fa59bbc5..1dbecb748028 100644
--- a/include/linux/pgalloc.h
+++ b/include/linux/pgalloc.h
@@ -26,4 +26,25 @@
 			arch_sync_kernel_mappings(addr, addr);		\
 	} while (0)
 
+#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
+/*
+ * try_populate_vmemmap_pmd - Populate a PMD that is in use by the vmemmap.
+ * @addr: Base address of the remapped PMD.
+ * @pmdp: Page table pointer to be overwritten.
+ * @pgtable: Pointer to the page table that the new PMD will point to.
+ *
+ * This function is only to be used to update PMDs that map the vmemmap to
+ * point to a page of already-populated PTEs that map the same pages.
+ *
+ * Implementations of this function must ensure that, while the update is taking
+ * place, CPUs will not fault on the remapped virtual address range.
+ */
+static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
+					   pte_t *pgtable)
+{
+	pmd_populate_kernel(&init_mm, pmdp, pgtable);
+	return 0;
+}
+#endif
+
 #endif /* _LINUX_PGALLOC_H */
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 1eca03a3def3..9e0f52474bdb 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -88,6 +88,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 			     struct vmemmap_remap_walk *walk)
 {
 	pmd_t __pmd;
+	int ret;
 	int i;
 	unsigned long addr = start;
 	pte_t *pgtable;
@@ -107,8 +108,15 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		set_pte_at(&init_mm, addr, pte, entry);
 	}
 
+	ret = 0;
 	spin_lock(&init_mm.page_table_lock);
 	if (likely(pmd_leaf(*pmd))) {
+		/* Make pte visible before pmd. See comment in pmd_install(). */
+		smp_wmb();
+		ret = try_populate_vmemmap_pmd(start, pmd, pgtable);
+		if (ret)
+			goto free;
+
 		/*
 		 * Higher order allocations from buddy allocator must be able to
 		 * be treated as independent small pages (as they can be freed
@@ -117,21 +125,16 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		if (!PageReserved(head))
 			split_page(head, get_order(PMD_SIZE));
 
-		/* Make pte visible before pmd. See comment in pmd_install(). */
-		smp_wmb();
-		/*
-		 * On arm64, this requires BBML3. Its support has already been
-		 * checked.
-		 */
-		pmd_populate_kernel(&init_mm, pmd, pgtable);
 		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
-	} else {
-		pte_free_kernel(&init_mm, pgtable);
+		goto out;
 	}
-	spin_unlock(&init_mm.page_table_lock);
 
-	return 0;
+free:
+	pte_free_kernel(&init_mm, pgtable);
+out:
+	spin_unlock(&init_mm.page_table_lock);
+	return ret;
 }
 
 static int vmemmap_pmd_entry(pmd_t *pmd, unsigned long addr,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

