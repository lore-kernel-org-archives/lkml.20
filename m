Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA842471423
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932217; cv=none; b=Tt+KJ+xi2tD/Fmed8k3HhVEdoHcI3FNrUfxAh4GyBKlPrb8wLTHAQYb2Ul6vTGUXhuVMjdc5ZGqtUzSuLrHxDL3ShmsUCob8aRaqW1xYRjZONY2988H9FGvrsyn7DJjFmqiwVAnWP+DHo1lUaL3lqmlX18hMVotKuFdlLCoYXt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932217; c=relaxed/simple;
	bh=khvlwVT541aFNEC0trW82cURmxSP+ddRrYYdp4GzYxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tuZ0ccBxszCwmLKohAPeZKa9fixVT3pZNbyOmZ6kOv5Tnw3S20K8nJuDTDAkZGtV9ui4aDPMx+wqd/bvNlW4Ihe9Q0YFAQqtx37bhJyBJTVAWYfatfYl/nbJKCB04vFZ4ZlF0VWaPZNfBrru84K1BpSLOCeymeScHG+FEMcAUn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdy8zSep; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdy8zSep"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so33796975ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932214; x=1791537014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACN8gkcsm61w/Jlh0ZvQ88AVu95ak6D5T7q+jQbcfkQ=;
        b=cdy8zSepY6jW8TmwNPMTlzB6OHc4djdK044YJRgly161NtDEA1qsrHclxejOYcHbXe
         K6Q6LHlXBDM/JLMstICAYyhBDZUNjQgffwrH3agT/hIB+DMDG9cuY5fC9ZFoeXonphXh
         ROnMg3qfDUtSaGnTwziOmCiI1XYKSwobJXwXG3T+kvx7dS72hzS/uIR1oS2jqc+jEDSv
         0aDuh+NvOAldB7ez3XoBmNaOH2H/x72pV8do35Q3quvM0Iov4hl/wkNg6+HfdAGYicIk
         BAKnl01Y8TIKJ6BpMxkpySbAY8pHuixr2lGwbTF4/Ye2BXJfuAYkhSHpH2helYGa8uXE
         84EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932214; x=1791537014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACN8gkcsm61w/Jlh0ZvQ88AVu95ak6D5T7q+jQbcfkQ=;
        b=fdIAomTqsDrBV67RNemxj/VD+h3aPWQxTKL2Aclp5WWbY47UU0dnDpx3mkagspY/nf
         xMkMED+Sh980owPwrWNmVBcn5xk+y7CNlhZSW1fQPq55RoaPR4FDF8H4etSeE1tuSZLz
         M4zcxDmmpaxeyvKf92PD+QRfuLgKYVnnxpCiy/L0IdLhk2Asg9Tg9eEycTV1byEjLtGN
         AQ5B7Gu6etErpwUhdDYRUKOnVV6zr1YMvw7YdUSTP/naTJw+gyvvo5UUZzkf068tJVl+
         fOri7LcfNyX+p6sserw6KEwBek/rQCDTAUN5kxRvH79/5TLpuwoEOOQ53JEmf/54ggR0
         8rUw==
X-Forwarded-Encrypted: i=1; AKwUvBwYS7UZmymIWD0kr71t9ke9CRN3Z8PJDCJsF1mPISogy7F+CwmAHIUGUGjDmSa3gZ2DJ5V3UpYdg3287nI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ23jtOQcIM80eOi2fT5IagtoNB0QWl7Xi+iASFczK55fpSX8Ni
	tEB8lpwE7w9g3vQDdAtPyIymlKH0pEO+eSAy0ymCOxWeNYXT9uwHcVOX
X-Gm-Gg: AYBFou30ka8kh0MQUs1XeqSdp/KSYQybqGzU8M0vavlbU8iTjOe+qqUabEET+Tl0Kgs
	IWWWhOIRMj8VWPDeVTOqyw5eSEP4+Ec911QBl9XpoOa5VTIdmFRAH2gsTAc3bTo5atfx3BKPTFM
	SynOJvprQzL2Bydhg47SLg+MJQ/qHkCLiO/4W3by4b08vq6j90zZK3j+LHGK7FXeOA7lE7hED8M
	rxNzKMdZjlgWcmOB8QkzM5oJDULKvc0PiNT4VtLL2qbAmNZ+7poVjxOficTKmVsLtGTsE0Cz8Ko
	yJ2aZPHnbYTpZrCXdw8FOd4wjEJU9SWG12NoIxrx3+A/v3oUt1i8uAQ+fm56L2HYeM4GvzHysHf
	WqITUabm29t14toJ6VQTJDBIKvChZESxsdT4TmqF+GzdLtlnpOPEEx9ihv/fm61v5FyHCqwt0dT
	cSArp7Z07sq2ffGlkYHeRFg4NiedqFQCsMZKeXguo/y52TGzFbvIkmThxrberdeAlY18p2jnDoi
	oWP57O9jk+ndQ7kqo1EgA==
X-Received: by 2002:a17:902:d98c:b0:2dd:ad73:c987 with SMTP id d9443c01a7336-2e49b609901mr19907135ad.31.1790932213843;
        Fri, 02 Oct 2026 02:10:13 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:13 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
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
Subject: [PATCH v10 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge() for PTE-level block mappings
Date: Fri,  2 Oct 2026 17:09:40 +0800
Message-Id: <20261002090947.869220-4-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
which requires an arch implementation. BUILD_BUG() makes that
explicit rather than silently doing nothing.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
---
 include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
 mm/vmalloc.c            | 19 ++++++-------------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 8c093c119e5a8..a7fd51fec8a17 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2204,6 +2204,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
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
+	BUILD_BUG();
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
+	BUILD_BUG();
+	return __pte(0);
+}
+#endif
+
 #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e74..fb757d95bde25 100644
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
@@ -100,7 +99,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte_t *pte;
 	u64 pfn;
 	struct page *page;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -121,17 +120,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
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
@@ -391,25 +385,24 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
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

