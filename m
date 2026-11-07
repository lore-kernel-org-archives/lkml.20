Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059422;
	b=wXF+MS0ZXgPkltYd8QWnp6A7dC1kyAuiH+gFWwOnRd+kDXdlOWNdEbi31IAjwAN8r/aY
	 rxPbS3Y0zoEzWkhOvEaRqP2rpe/L/xvOEom57TUgbNZcH7vYtsfHy+KF1/VJM+PtbphKg
	 BXJJNgeBzsTMfdbaCuzzXS6ts2scVAo4yugECA6MELSlXrFMsmX+7EryyXf/h6lyyE0zg
	 hmXf5VlPebpf64HArgubzEDnEYm9GBIHz2KeRwzIfPDCC8Rv/1wB6teUtxwq65YPxOoWo
	 nc++LGwJu67un1kEBGJTX2/KcWnujOLfxGPxqrwG3aKqNJDeBcIsxXZosZpShqyEFHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0tSO75+dLoTbxUTsccW1GH3+P5H454b2/ssDfpBt7oM=;
	b=nsBOLBycj4CTVCqtPfuqqI/Z6M5+Jno5GG7wfWRY3zGzhLBYYyGG/mJx2g8GXo3r9nNf
	 adXpbZdVF+iSp/SMiMBJ6qMoS5T7EYVgz34P1XA1WXNcfDJV2XTzTdKyiIuLq4CYa80LR
	 Tunkh/OTjtsZ1kvN5VyMR2oSFH10KbaMUS5XjOByk80WQGpSR7owaptNupVCWFKi1eJ5w
	 DH+9ZU8k9vnHDU4EdA2HvOOt0sW7k0pAlyFGPoIrx3VqBC4jcWCDWey6Vwuannidezwtx
	 FYToQPrBHZqBDrd9rUYNo1zzP3LXR9LbJ7yy5+vZdcZKUKaZAFa+G9yHAjmgua3kLDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TfaVshuu;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765E3606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765E3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TfaVshuu
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2543909eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059422; x=1794664222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tSO75+dLoTbxUTsccW1GH3+P5H454b2/ssDfpBt7oM=;
        b=TfaVshuuLPAVF1KMetrqMHoYurySdGXH5gaUR43lO4ROS5qRqwHGLiPjN/PHfuHMtj
         +v+m1tumo+x8SqNPtGBlD4TD8TXLidsSLRcm5MN8bDcuG4qZsCQ/zTUcSCksdfyDmWrb
         nKJMktMFiuLe0tqyhNrg55fvf8j/xWIBBw027RdtpBEzwFoT/UkKr5z4bn723Xi/xLhN
         UZPY4pHzV+UcZ9Rzl1xfBSzjJD9KjcFw+HbPBdgIEZ8atbOwmLba9OPK/8Z3a8u+CtjW
         TpOOTNWgOrcRSm9bGupvUfVcP6oByAG6mD6cpr87f83kr4X0qIk4aUJryCo2VUFLoxGW
         u/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059422; x=1794664222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tSO75+dLoTbxUTsccW1GH3+P5H454b2/ssDfpBt7oM=;
        b=o3WSujEqqe6Qo/8qHOXeEM/Bz7XSPJixpgkipQGgZ0cP18WHRjFcL/rOjlPmJP91Dr
         WHtAm0M7ccrTMHv7U0a63x0ngcCAzFfviAqt/IWlYH8977Ik79aG74d09kAFONNYNQQ4
         GtOXZLXe74XptHVzim7T21WfQnqv0lYKOmz4VjFg7F1nJ9oO4et8M5q+w3GIr6Z30Hef
         BLp7SP41nVMghb8Y8ydzRa4bqC0UFGa4MyQcoG0mFwF/uC5WjPfm38Sp34aYpAMwVv2Y
         CC1t8DZ3dFjdOGvLPZ97apgz5JMsq1H0lQoIy+bIB2Hod4gMjcFh5xYcwVxWqgqj/6yx
         iswA==
X-Forwarded-Encrypted: i=1; AL+hErELKwpbT/78yq5KZ0CFxw+E330+s5sPCHWxpay75VDkHGyeDqc3IizcDzKAiKqM9FSHNJJmziIiEo5sYno=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pTq9uhyKmfMvkFWVGT3hRLfICpkN3AcNmOtyBzrtAfGTA6+6p
	ANDfNGlfS5pOrfYl5TapCSf1xb7pHrqWDxyNoRVquriQ7nBvIVSXpxNf
X-Gm-Gg: AYBFou1rug4xU+z3+WhBK6/Q9bHMoij1YH3JF0TbVjGT5L/3PAkKLoq5oruZ92e7fHq
	TH3nopXW8Yq8YElO78JPSBHHUbq11tssC8HyD/0fLYx3KIhPUPvqmHr6rA77ehKhtRK86ni+0K7
	HYNbGOOWNR52Kfk8RbRAzPxeTQksOoV6rMiNjFGVqWFgecKAVTWXdCxC7PUAWcnDGemTcfdzQ4H
	K3W/hS9G6j1gE8KvS2ehzKD+mj0dotTRCUiEiUBDswkogcImlPgeF0qK891RHpBDUw87q1zBqus
	apw0yy0/zwuHk5p6KyUxtY+piJ/eyhCAOxP2Ltq2nKNhwyr4d7oUf//nVGlHtTsl0gJZLC0AJRk
	9Wxj1oKtLCot3ggnB/x6BbzdnWEAJh6CCaBd0wY1Al2xSjm2S+/ZSYTmVHL5OsrbaB1ASIB9U68
	jIt/mYZYrh9MsUa/1/qXIKdRYif49WYDr3oL9ePyLeZvAYJw0u+nHwglJEOdC/6rJ+Ha6J6aJLk
	YQbn249PbICH91pfOkYzli5Nib+ZAn2LOYIhY9oRZItwTZK0RuyJIj+34/gENIpty1XcPbJR5gJ
	adx6+vbIyqparOBOoe964009YSEtd7OCqwDDhk6Hj42dz4ivI09cAFpNtg==
X-Received: by 2002:a05:7300:c8c2:b0:36a:2289:c599 with SMTP id 5a478bee46e88-36f76522120mr8195640eec.29.1794059421478;
        Sat, 07 Nov 2026 05:50:21 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:21 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 03/10] mm/vmalloc: use vmap_pte_set_huge()/vmap_pte_clear_huge() for PTE-level block mappings
Date: Sat,  7 Nov 2026 21:49:46 +0800
Message-Id: <20261107134953.748622-4-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
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

From: Wen Jiang <jiangwen6@xiaomi.com>

vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.

Now that arm64 and powerpc/8xx provide vmap_pte_set_huge() and
vmap_pte_clear_huge(), add the generic fallbacks next to the existing
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
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
 mm/vmalloc.c            | 19 ++++++-------------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b7..7e62479db5df7 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2204,6 +2204,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 }
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
+/*
+ * PTE-level block mappings for vmap.
+ *
+ * vmap_pte_set_huge() only has to be implemented by architectures whose
+ * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
+ */
+#ifndef __HAVE_ARCH_VMAP_PTE_SET_HUGE
+static inline void vmap_pte_set_huge(pte_t *ptep, unsigned long addr,
+				     phys_addr_t phys, pgprot_t prot,
+				     unsigned long size)
+{
+	BUILD_BUG();
+}
+#endif
+
+/*
+ * Likewise, vmap_pte_clear_huge() only has to be implemented by architectures
+ * whose arch_vmap_pte_range_unmap_size() can return a size other than
+ * PAGE_SIZE.
+ */
+#ifndef __HAVE_ARCH_VMAP_PTE_CLEAR_HUGE
+static inline pte_t vmap_pte_clear_huge(pte_t *ptep, unsigned long addr,
+					unsigned long size)
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
index f7aa4686fe5b9..df37c8490ae7e 100644
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
+			vmap_pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
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
+			ptent = vmap_pte_clear_huge(pte, addr, size);
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

