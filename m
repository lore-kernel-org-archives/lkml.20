Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8202927CCE0
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986905; cv=none; b=jntPYFoEEMAhOv3qGomnPwHydS6hQI7XwYssJmcXfeu966elj17yvg0cbzDc9qAW9RNEePxBDBf2YoBTwDXgEGLXqn3qpDp6OakObYIcPvu45V8MMvMOA7uZMACxftvm+uCORODKDmLJqHTuM+MSdPxaCrnXfTl4/yHmvxpmKew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986905; c=relaxed/simple;
	bh=rAfaQXXKysrd6wbcyYW2GdUtAm4zXzRaEo6eT8t68Xw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aCtdEUznGWoN5y6LRUCOXwfB8r0CVzHAc5Jbgx9BQ3XljxZ7jkveu2iVoap0dyQQFWf0QGeZYkyo/hcwzIEHkMroN3i1PwaLJg+rAzieAPZCGyhGf4RdmfGAMdAvHUkR3hPhIP0PiDvS6SURGuzRMhOkIoEfmgTQduAiGcYJkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=viJtjTtU; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="viJtjTtU"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso91096a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986899; x=1791591699; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CW0PrPzO/He6EZ9NlACY98E/BL7OIKImRa0WQareyfQ=;
        b=viJtjTtU9Z747yvIqsKPVhTmjCfbKqD2AUMgRLKR1QRNY4Xz/SMfK6/h+WjrqduhS1
         FjFIwi52iOtwG8n7uAUvTOEp2cBFvAehoX/JI47I5AodmrBss1vq22L51PkXchyzB62X
         WfQDI7vr3ncHU4Pntpim6WvIv2He5G0FWv7IC4J/5YU0BWLxtOU+qfqn+7fWcbl0JEBL
         EkJ5zzMipRPaDar6P/K1HTnbmltV+9OeKuZlWo46FGLCAo4B81wYlVHDv+qGru9f0u/e
         +NUXMb+I19cjS6bgmfNyIp0CDjAjiPAN49YNUzW8nOfuMhz//aAniZjD1BcgPyvR54hi
         7V6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986899; x=1791591699;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CW0PrPzO/He6EZ9NlACY98E/BL7OIKImRa0WQareyfQ=;
        b=E1uVNXSjhPUM1aVYRKZfBwlajUKGFUVCOgxDAwtw+hFl8+DHiCWNXd+nmXlrk/LtG4
         op4lFKWKYDwl/uq2Whj96KPMzWMyzIMYWBABi49/rvcP01kEMbzE4Es3Ym5JcHMwtpUd
         Ornv9xiry+LbfYX+sHAc334C/NLmHZsg4fdIbzX8y6HhOP9xLkVu7Z102fmM0gQM2dQe
         oQ4+64BX5kOFWxD40D/a8yvV4ToIuIXwAAZj1EaIjyY/n84fhDhHT0Ehg672FyQiv20d
         horBPqoCnaKK/I9BL5PmbWEsLcL1KTb5SmbddV9+Asmj5ykAR2zf3nptKfZANTFHRYuG
         +Fzg==
X-Forwarded-Encrypted: i=1; AKwUvBwSWCAe65SHayG2vR1etfoiLdUbJP5g0tykgvZ0pM414NdDt1B/UYquf8dEW4D8M8Gp2h7/diZHiHU+ENA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLtoBZvnhCSedyaFw+HaIXGEhkXgr5O8w7FGeNflVcVG8x94OC
	kj4rfRShkgMtTrQihi3eUX4AZ9rHoC6Yu7SZ8IPpuBadgX23Swiwa9+OFmaxH2hBO7qTAlzbIQW
	Gc+CwhXMZMjpOka++MnSryw==
X-Received: from pgby27-n2.prod.google.com ([2002:a05:6a02:651b:20b0:cc7:d8ea:a7b5])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:134c:b0:39e:6a7e:ee1b with SMTP id 98e67ed59e1d1-3a6ce7db233mr2804158a91.39.1790986898532;
 Fri, 02 Oct 2026 17:21:38 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:08 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-6-jthoughton@google.com>
Subject: [PATCH v2 05/20] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
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

set_pte_at() cannot be used to replace in-use vmemmap PTEs on arm64, so
replace it with a more specific routine, try_update_vmemmap_pte().

try_update_vmemmap_pte() is used for modifying page table entries such
that there is a guarantee that no fault will be taken.

For the generic implementation, please note one difference: set_pte()
does not invoke page_table_check_ptes_set(), but set_pte_at(), the call
we are about to replace, does. However, this is a functional no-op
because page_table_check_ptes_set() does nothing for init_mm PTEs, which
vmemmap PTEs are.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/loongarch/include/asm/pgtable.h |  2 +
 arch/riscv/include/asm/pgtable.h     |  2 +
 arch/x86/include/asm/pgtable.h       |  2 +
 include/linux/pgtable.h              | 22 +++++++++++
 mm/hugetlb_vmemmap.c                 | 56 +++++++++++++++++++---------
 5 files changed, 67 insertions(+), 17 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index f87603135131..123eda3f6035 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -633,6 +633,8 @@ static inline long pmd_protnone(pmd_t pmd)
 #define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
 #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 /*
  * We provide our own get_unmapped area to cope with the virtual aliasing
  * constraints placed on us by the cache architecture.
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4c8fc6845503..6cfae7720882 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1165,6 +1165,8 @@ static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 /*
  * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
  * are !pte_none() && !pte_present().
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index ef0252a09c28..f60c09cdf1ec 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1368,6 +1368,8 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 }
 #endif
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static inline pud_t pudp_establish(struct vm_area_struct *vma,
 		unsigned long address, pud_t *pudp, pud_t pud)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b..59ab7ca93548 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -457,6 +457,28 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 #endif
 #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
 
+#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+/*
+ * try_update_vmemmap_pte - Remap PTEs used by the vmemmap.
+ * @addr: Base address of the remapped PTE.
+ * @ptep: Page table pointer to be overwritten.
+ * @pte: Page table entry to write.
+ *
+ * This function is only to be used to update PTEs that map the vmemmap. The
+ * only valid transitions supported by this function are: leaf-level
+ * (PAGE_SIZE), valid-to-valid. The pfn and prot bits may be changed.
+ *
+ * Implementations of this function must ensure that, while the update is taking
+ * place, CPUs will not fault on the remapped virtual address.
+ */
+static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
+					 pte_t pte)
+{
+	set_pte(ptep, pte);
+	return 0;
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pte_t *ptep,
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 90db4d069ff6..3fdb1e4ce1a1 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -33,7 +33,7 @@
  *			operations.
  */
 struct vmemmap_remap_walk {
-	void			(*remap_pte)(pte_t *pte, unsigned long addr,
+	int			(*remap_pte)(pte_t *pte, unsigned long addr,
 					     struct vmemmap_remap_walk *walk);
 
 	unsigned long		nr_walked;
@@ -140,11 +140,13 @@ static int vmemmap_pte_entry(pte_t *pte, unsigned long addr,
 			     unsigned long next, struct mm_walk *walk)
 {
 	struct vmemmap_remap_walk *vmemmap_walk = walk->private;
+	int ret = 0;
 
-	vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
-	vmemmap_walk->nr_walked++;
+	ret = vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
+	if (!ret)
+		vmemmap_walk->nr_walked++;
 
-	return 0;
+	return ret;
 }
 
 static const struct mm_walk_ops vmemmap_remap_ops = {
@@ -196,18 +198,20 @@ static void free_vmemmap_page_list(struct list_head *list)
 		free_vmemmap_page(page);
 }
 
-static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
-			      struct vmemmap_remap_walk *walk)
+static int vmemmap_remap_pte(pte_t *pte, unsigned long addr,
+			     struct vmemmap_remap_walk *walk)
 {
 	struct page *page = pte_page(ptep_get(pte));
 	pte_t entry;
+	bool head;
+	int ret;
+
+	head = walk->nr_walked == 0 && walk->vmemmap_head;
 
 	/* Remapping the head page requires r/w */
-	if (unlikely(walk->nr_walked == 0 && walk->vmemmap_head)) {
+	if (unlikely(head)) {
 		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
 
-		list_del(&walk->vmemmap_head->lru);
-
 		/*
 		 * Makes sure that preceding stores to the page contents from
 		 * vmemmap_remap_free() become visible before the set_pte_at()
@@ -226,17 +230,30 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 		entry = mk_pte(walk->vmemmap_tail, PAGE_KERNEL_RO);
 	}
 
+	ret = try_update_vmemmap_pte(addr, pte, entry);
+	if (ret)
+		return ret;
+
+	/* We successfully overwrote the vmemmap PTE, so we can free
+	 * the vmemmap page that was just unmapped, and if we mapped
+	 * the new head page, remove it from the list so that it
+	 * doesn't get freed later.
+	 */
 	list_add(&page->lru, walk->vmemmap_pages);
-	set_pte_at(&init_mm, addr, pte, entry);
+	if (head)
+		list_del(&walk->vmemmap_head->lru);
+
+	return 0;
 }
 
-static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
-				struct vmemmap_remap_walk *walk)
+static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
+			       struct vmemmap_remap_walk *walk)
 {
 	struct page *src = pte_page(ptep_get(pte)), *dst;
+	int ret;
 
 	if (WARN_ON_ONCE(!walk->vmemmap_tail))
-		return;
+		return -EINVAL;
 
 	/*
 	 * When restoring a partially-HVOed page, keep the copied head page
@@ -244,20 +261,25 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 	 * page.
 	 */
 	if (walk->vmemmap_tail != src)
-		return;
+		return 0;
 
 	VM_WARN_ON_ONCE(PageHead((const struct page *)addr));
 
 	dst = list_first_entry(walk->vmemmap_pages, struct page, lru);
-	list_del(&dst->lru);
 	copy_page(page_to_virt(dst), page_to_virt(src));
 
 	/*
 	 * Makes sure that preceding stores to the page contents become visible
-	 * before the set_pte_at() write.
+	 * before the try_update_vmemmap_pte() write.
 	 */
 	smp_wmb();
-	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
+
+	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	if (ret)
+		return ret;
+
+	list_del(&dst->lru);
+	return 0;
 }
 
 /**
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

