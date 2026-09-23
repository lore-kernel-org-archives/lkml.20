Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A10343D4EF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144944; cv=none; b=qGrzkH6pdIAhkLWy9qCyZTbz2FnLPzI6VfpQYEMQcqyryvEUINWn1iF9gI1v+u/b7t4UCHO5x3JonYtJjdWaZjoCPU3/zIgViVi8sf0CsaOAD0qYGrNkiAJz8zeoBZhoI8DDfFI8hiP1giRPkxDnQu8wMRYW9M5ISRz0fGhZZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144944; c=relaxed/simple;
	bh=P3n/0wgc3upMk0hBSxFRBopoPCpanSNn6Oaz90YMgOc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UVggjRrlnsZsegKTGeQ4EmHzRUOeUOwaQoCPnfgQPgbBEh1NADMbyyVqCdZMa0CiUaSdC5GDzwTupMiocXuhkE239SeBIZmqDFZzXgZTrOIhC+CzIDUqSdXHgVPm5eV1EvfH94vYdlfj8yGEHODRPR+6yo9vjlnl84AVfu/j2Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJkXotoz; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJkXotoz"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0135fso3966455ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144937; x=1790749737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFifGOrpSVWAs42j7AiNSWIOQBImLaH7pX+Uvfxk6V4=;
        b=nJkXotozYLtP5Plot6l+WBktZ0ny5fJ2QSa45lA0DGH6th33kdF17JbDObaPG6VhPx
         jki88w/D2Mftucc7yBQ5XPfIIGOfpRiXDF0kgI3HrvHbWK9iXbEpvhdpU3wFi6Ff+MQH
         bDy+M5vTBtor/MQ+iZZpb72Q3qS3l7SJjZQyU8thtWxBBxmDzI94RoPiKIWEXVfdjxMK
         V2MFSl7Ssr6AYOhhpzNMfe/I06sLQ7rDLjn/6/wErDNDW7CkyWeulWp+VVhwvGhmFBPu
         i344SuxiSCDdJUXMIWzwFjW73FvdKHyzwTbeX3Nf+bYCpsL5nvZBMDFGGKsxnPZwvYjp
         RKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144937; x=1790749737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFifGOrpSVWAs42j7AiNSWIOQBImLaH7pX+Uvfxk6V4=;
        b=mmQf2nWvZ/y5Kc3JScNzE9f+nm3aA3K2WYAZZ1lRGeG7iFtabqujxhKbaOz6DuWjRO
         n3J9HUMhCFZwek/TUF7Cq26FncidHvDWF0DLw3hC96BALlONsN9I23RbfvIWo1hiARpC
         WZZ/1ttDrCBhFTSL2VBK4Emms4N+CwPahv8jwxMZTdnqbzSGbHStXbvhQSNrTfYCXPwn
         MQyRa258GUr6PMfNUPavQAYB/hCYDBYJlxYoMNBzv4yzqBhZBco4m1JdiuGnGwA5VKOL
         JRvT714xXay3mWbzp0epkgrxyNsglurK35EMWIilAehRaO8PMlFVjCCspDKCxcqUbvSw
         kaQw==
X-Forwarded-Encrypted: i=1; AKwUvBysHVC4bppF+tKtO/DMNwOR0HeGiHnHUa/Hoy68w0v+9iNg+25aIro64bv8TsvfsKxwHfl4s3fJO57PBWw=@vger.kernel.org
X-Gm-Message-State: AFuF++muUqvyShnyDDKI5mIEe7a7vekU3YwmGin2NeH8/yqupDbs8kQn
	o8BGwy0SCFBuZxF1CU1QQWx7Vs5d758e9w6vmRraqbtj35LuNcn4y67K
X-Gm-Gg: AYBFou2HBF0VIJa8T7uePpWjJPr3dJPIBBWYLOjn84gPzxQP02wNnde4Yxzj9BPWkKC
	f+HbzTysZPBoR1eC4vvssrUtlCO1mHmbEMTitUUHXNQ3Tb/IKXqezgvTwh/jp/SgJpQW24jtrx3
	92wKzXsxKvPGwdBI6Tf0JWUcWop8+7vFNP+t6rp1Kh+d2Rm3Y0aTSbcQtHTUovJ90WR/o156TFg
	xLONtCeC9daSnAleDoXYECTYHXZxBssNrTzvFT7SRKy+82secbHsJrFSbjjIzREVoY3RS3jP8Fh
	HDcmPH5jeVG5NRzi0EayxEshthGpkZor3gJjRwgKEaSu1BJG/wZDbIQs2JxkQPmLZZWSRBwmyg4
	Vac3aWpK8GifBViIA8iOBq9/cXSoMNmXUv5HLi8uddVRhTuZV1a3ppSD+rA05jeI3EQKJpAgoO+
	TlvL42iEoM3hd7Me6PRryeWU3rAIKvwlrzWjZurhXKq1b+FdUzhMq/fbeVTDJbI3btLMumWX23D
	YfBjazd0fTPbADbAnnxVnyI5XVk5BgG
X-Received: by 2002:a17:903:3904:b0:2dd:c100:9435 with SMTP id d9443c01a7336-2df69e02500mr15989755ad.51.1790144936998;
        Tue, 22 Sep 2026 23:28:56 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:28:56 -0700 (PDT)
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
Subject: [PATCH v9 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge() for PTE-level block mappings
Date: Wed, 23 Sep 2026 14:28:25 +0800
Message-Id: <20260923062832.479455-4-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
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

