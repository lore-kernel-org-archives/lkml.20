Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069553FC5AE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623006; cv=none; b=KXigmdjzTJ7DG/pnM6Tja8ODnrHplI2Tzs0X7lkMyqh0z+cJ6VjxE+2ozpa0JzCNGqY4DeRy4Tvbn/DQ6Rnrc9WH9Sp0l1wIIYXfSu+t986Aa4PgIse4dmirWvXnOzC3hLlVOHYu4aIG8Ut2cfEOqv0IaABVa4bCNuA5yPp+2fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623006; c=relaxed/simple;
	bh=FqU9mUdoHISvILuaEFO8CBOPURlTl+emi5lOdPZslEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q3LJgizVYFjE+DJWQ2Zeec5CGv4B61dkm/zUKIK/hzbSecN3AwPVSP4g/WToHHSg6bZGr/wxyiukAbbbBkdcJ4jVBTMtmau170rQCSmxL+iqhB+KiYL3ztQvX9p6ZBnQpAERb1qb1ei3rhj6WHocaksDFx2lfWURzD4F9JFEw4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UniWIrpX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UniWIrpX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso146878a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623004; x=1790227804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iHoeiOn8M1Js0lz6hY05jc0JjGSYBNXCmk3v6q8ZOE=;
        b=UniWIrpXeSOyqGqapZUcH8UxfxtJWvLAUQUZ/al1VIj8e5vd7rAkcPZWn5g2wNu4zq
         PoSsigtUKE2X2YhGoAZriHCHcDtnR0Ru/a158E+pgSkSG68XrC8986IjOl2IwkQexBYy
         4Zv7f+flA/q0Z4UjXsco9WZdbTpXWzkWtMLRddb521ZOoRmVmTY4Zaf2cQCF/thgGtEv
         ad/Cjn5d0KOlh2eiM55LA4aPHDIBf8UNOe39tmRDt7Otwp/lFv4pDmqe9dxgmzTjrLJk
         I6NdKHTTRe+0fZRJu8jGSPuDBijNpFaTEI+BhQNBMdNb9c+rzN31//lTeWEdyfKJIha9
         GaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623004; x=1790227804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iHoeiOn8M1Js0lz6hY05jc0JjGSYBNXCmk3v6q8ZOE=;
        b=ip9BYqkgP0WvOOPbzHmovOJAyAhVjAEXoV3ptnb0LAu8OVDrUik2R9Ot+RqVkcmtJd
         /ySii8IlbToVPJ9bE5EqFmbzHfsyNL5NBfOu2pUnNbBnPR3W1eRm53c6KBq+eW76qbLQ
         rU2a/3YHDBwPwGGuY9a351dwkKksOoqvYDA96fDTX1uweGA0WbbXWJ3DJVfCLVbZZQ+y
         Bqj2WXsapCBT9k0XSdv1k1Thyv3ub5CU34Tymq5wWL75ysi0QFjKmgPS6ajH3YWEuJMs
         LWxcXg3VKgSHzo2igMRst5S/XlMRD8g8vzzDONwjsyf2JUU/CWBMLo4LSqot6rTkmKD5
         ezog==
X-Forwarded-Encrypted: i=1; AKwUvBxLxqzGHBP/3QiE1RlX/PhZhwXChO/4nbIjqv543O9e7z9nQ0FJ2vmyIkYgJDu4BUo4BJNhAG+y2/ijFIk=@vger.kernel.org
X-Gm-Message-State: AFuF++ndyPw7//4HHVUxH4fmzXCwq8PfFMEsUmjIaeGcf4BMhUY29pFq
	z+JhUEDxplMeJKVQbz/rwHmeIDk4ZYh2HhGlyj+jBsmV7DpHHsAY2iZd
X-Gm-Gg: AYBFou3XyODzCDhsUw0WdUcLhyOG35BpUWirDjXd47JRRr64rRZ0r/G77pz9Et/UbtD
	WYeRMoOVl+mPGxY3ScPUquycdz7O7J7PgUkThpdRNcsB100D5iM8U9Vj2F0vSOvAEIgKZNvwRRN
	4f0BVmAbn3+1hwVPCZnvLZPDkovmHG7UWhssyyiGXbkv29JDL0DioR/MvZIVVEaZM9ebRmvzt2Q
	t7umTMKrGzQNmRwzMk03RM186qCzsQNB7otiaEwwM0kRM+6Vcj0s4I0GkC9POYe+puZXanfQiHY
	6fHQ4bc+ktC1rLc72wZkXWLsCXvLIniUYX09pOqy9urlT7zCku8xv1uouK9DbqaegvPvFgeVkQ+
	sWaUq/BiUc7k3XGHr1BVjtkJxabdawyYAoL/0R1ytUvoi0dDf4hEepRXAQ0/rgdeZvqTPNbZFM0
	L7kaFhKsP0C2hCnubXlMWLco8XXxfTTHuaTNCcnYw7aUhmPqrh8J48PAl6BtG7EPbByNYVuCYEr
	+Cu0cdfvI2o5B+UZ5ZdGdGeAOQ=
X-Received: by 2002:a17:90b:5484:b0:39d:b57e:b47d with SMTP id 98e67ed59e1d1-39e35f809c5mr2777472a91.8.1789623004300;
        Wed, 16 Sep 2026 22:30:04 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:03 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge() for PTE-level block mappings
Date: Thu, 17 Sep 2026 13:29:26 +0800
Message-Id: <20260917052933.188679-4-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wen Jiang <jiangwen6@xiaomi.com>

vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.

Now that arm64 and powerpc/8xx provide pte_set_huge() and
pte_clear_huge(), add the generic fallbacks next to the existing
pmd/pud_set_huge() family and convert vmap_pte_range() and
vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
around the block-mapping paths are dropped, so PTE-level block mappings
now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
longer includes <linux/hugetlb.h>.

The fallbacks exist only to keep the build working on architectures
without PTE-level block mapping support. They are unreachable there:
the callers only run when arch_vmap_pte_range_map_size() or
arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
which requires an arch implementation. WARN_ON_ONCE() makes that
explicit rather than silently doing nothing.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
---
 include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
 mm/vmalloc.c            | 19 ++++++-------------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index cdd68ed3ae1a9..349ced999f959 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 }
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
+/*
+ * PTE-level block mappings for vmap.
+ *
+ * pte_set_huge() only has to be implemented by architectures whose
+ * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
+ */
+#ifndef __HAVE_ARCH_PTE_SET_HUGE
+static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
+				phys_addr_t phys, pgprot_t prot,
+				unsigned long size)
+{
+	WARN_ON_ONCE(1);
+}
+#endif
+
+/*
+ * Likewise, pte_clear_huge() only has to be implemented by architectures
+ * whose arch_vmap_pte_range_unmap_size() can return a size other than
+ * PAGE_SIZE.
+ */
+#ifndef __HAVE_ARCH_PTE_CLEAR_HUGE
+static inline pte_t pte_clear_huge(pte_t *ptep, unsigned long addr,
+				   unsigned long size)
+{
+	WARN_ON_ONCE(1);
+	return __pte(0);
+}
+#endif
+
 #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bb6ae08d18f58..025b3a848d564 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -38,7 +38,6 @@
 #include <linux/rbtree_augmented.h>
 #include <linux/overflow.h>
 #include <linux/pgtable.h>
-#include <linux/hugetlb.h>
 #include <linux/sched/mm.h>
 #include <asm/tlbflush.h>
 #include <asm/shmparam.h>
@@ -98,7 +97,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte_t *pte;
 	u64 pfn;
 	struct page *page;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -119,17 +118,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-#ifdef CONFIG_HUGETLB_PAGE
 		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
 		if (size != PAGE_SIZE) {
-			pte_t entry = pfn_pte(pfn, prot);
-
-			entry = arch_make_huge_pte(entry, ilog2(size), 0);
-			set_huge_pte_at(&init_mm, addr, pte, entry, size);
+			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
 			pfn += PFN_DOWN(size);
 			continue;
 		}
-#endif
 		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
 		pfn++;
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
@@ -368,25 +362,24 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 {
 	pte_t *pte;
 	pte_t ptent;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
 
 	pte = pte_offset_kernel(pmd, addr);
 	lazy_mmu_mode_enable();
 
 	do {
-#ifdef CONFIG_HUGETLB_PAGE
 		size = arch_vmap_pte_range_unmap_size(addr, pte);
 		if (size != PAGE_SIZE) {
 			if (WARN_ON(!IS_ALIGNED(addr, size))) {
 				addr = ALIGN_DOWN(addr, size);
 				pte = PTR_ALIGN_DOWN(pte, sizeof(*pte) * (size >> PAGE_SHIFT));
 			}
-			ptent = huge_ptep_get_and_clear(&init_mm, addr, pte, size);
+			ptent = pte_clear_huge(pte, addr, size);
 			if (WARN_ON(end - addr < size))
 				size = end - addr;
-		} else
-#endif
+		} else {
 			ptent = ptep_get_and_clear(&init_mm, addr, pte);
+		}
 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
 
-- 
2.34.1

