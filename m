Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701053;
	b=BFioJXvNP77lvlRZP+VYSsEVVm87qW14ZUuXcZCrzjqAWlayoajiqEezHXDLenuGpcbF
	 3fNg9TlRht/cpqMBKrxamZ1Mqc3+TdvHRfVx23XHWeGrMTQVx1SCd+AGwTfk/+m/g/j5u
	 bi93/8xVrkfkv+t6xHWUtlbBWOWSuCdH1rs6aLnPd9slWJLyzUtcgiW+hdElOdhKzaAsD
	 Di1YzXzYwYzqZkc/uJzGSLsuiPDM+tO5+feNvC0iDvx1kf+2gymlrlx2An5smnsRcpkcD
	 cSjtUxKEMp1xlmhLX4RgB5ZYXQmo2Ho6sHLwJ54MJk6X5jXBMjcaEZW5jL95w5jf1rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vHjbXN5GPOj+3N/hZYmdpYePqr3N047W/AZ1HDpQr5U=;
	b=MNl/eJtztcGTf1m2smWxKnSo4h2HAFN36JpOTY06t/EZH7OXLZWEbkInGAozvsjzcv2E
	 G9Z+Xbl2dJlvaztGH++nqS50tmH9OV9m8sA7jRUJfdt8BE30UCzrTdkWxUnXKtHnawurA
	 uDwBKfIyzJBa6txzy+T65ZASf/yS12MQwFW/820/JqI6H4C/1QN503ZoR/pV+6ETYaGtx
	 EizrBV8cnO69GQg4MHdqdPAGoOM/Rssk45C/nNrbYnTDHuYawCtxE5L6qcJqV276oY6IJ
	 BgMuN9LvF1VagYFdH4szUJOT0u+7pyxb65nsHPgRagZKc31CnD4Fmj4A8e/i5KkF6HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OosifgM5;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F9B606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F9B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OosifgM5
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so5936552eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701052; x=1794305852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHjbXN5GPOj+3N/hZYmdpYePqr3N047W/AZ1HDpQr5U=;
        b=OosifgM5FvWdKhFhDFakvDA0YN26lceVPB9LKhZ5G7GrZAqFlUhh0meCkxp7j8NafI
         l558v7VaoTz/E0sgcjdsHatEAX/nsivJ0XmGy3T2FOqpsM43qCtTEJ4hfYpoJcayeFaz
         0U00MxQ3Tiwq5TwfJfSsjJM6pErdEbwq523zT1/NJsbY43YQflQlPlIRPRcSQJ+4SM8i
         dWWN5b/+455+Xv7fod7tiNQnzWLfE4KsuIiCqBgZaFwxd7dbPb7qoGPTqAcU3vybSHOF
         zT0/xhBi79+CoAtIX4OfQRgCEc78SzPdaHaZjkevRtlFs23ohAxg3ztK0MdUyrxfuSP4
         xlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701052; x=1794305852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHjbXN5GPOj+3N/hZYmdpYePqr3N047W/AZ1HDpQr5U=;
        b=chXJAU0DCtetyD0WPkwqkB36EeDnexkFQSTHpk6MezjvCdjvHtPvyAj/BQ3jpqp7me
         gS+op8CDk4aot+tVsqlkSNi7u+Au2B3kDeqOzOOjnHMzaz2c6g0wy88ox4LTI7I/qBhf
         /oU9/zImUl4mlciHHxkhgLacajP+HsslPlH0ZfYdkAZljX9toBQRryUl0w/U7F1OHNqV
         ris02zAxGlQE8IqyzXDhy3+v60FwJK+PwYoGUHMR2S1DjRQejLGkTYfKYWnKpIPHDFQg
         AvnProYT1Z+v1+Rof3Pu+uQibzCz0lSdZl+z53gMg1005qS5a+E370RCZalpEMlamhdO
         tsCg==
X-Forwarded-Encrypted: i=1; AKwUvByqJKsiqvIYgxwZqhmCTbRSN7ejp8xK5dBg99pUmm3A6vSRZp5okKx7bNm11FjyeQEsOTfRwZm26kDf8n0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KWx/OninEdNFRTvoXohiEDdomgiA4sj8/bZiZ3ACDnO+CU5H2
	d2h9gWciqGIzpl1Ra9mTlSoJGpPud+FT3tDVIaIIQzYq/DrNMup/jomR
X-Gm-Gg: AYBFou3wY7OE/s6h8SEVcv3YSiZNbxk5Iolk6SyoHX5jAtl5cdYZRFj99v8lKkI1/LC
	CiDekcpW5j57ncfkKVfdE3JrZsVOPkMG5ibesWKhuBpML+YsnHUFMs6xSuYUM7CUL+9ABfjsCxX
	xvw27neKytyBcRthETEsd/ubdNUXXVNJ9B2rcpUVVQ9mxC1oFtcLxpQ/LJ0UWzMoOk7UXs5TR2V
	TTtOTThbsw3yLrV2AmEU74MNpHWBsSfw7vHngxHRpQxQ3aa474FucAHn6HpOMU289ycbSeBztrR
	WebKZEiAz/oRfSEHmOQztUBlXEuLRz86mI2POFU09ANl3GdS3/pqYyTOrlFHQm7Vc/+yEnmBBDy
	TLomehnUoT0tWQ95GHUmnEE2oYWdlI3CBJYdMaJ4AHm0sIMVcur1XrdgpjqXXVArCHPu+Il/ItH
	L6w226GrhQCfzWoBjdfbsVoFA1uJkMLZqCMgBB86OpU5nh1i01TatKaF5Ajd1FW4ptIPmpavaKH
	fhuloKTy9LXx2/3rlnWXc8qh13/fs1nJhW1wJUvkne/8O8jDCGP4A+hpBN9aDw2mqiA7uYOONjg
	W7EG1mql5Wcf+5zhVEWprGj8Z2wSmnR+8tzBY9EbYbbMgzCL6ZI=
X-Received: by 2002:a05:7300:5b89:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36a424c7b7dmr29521974eec.31.1793701051925;
        Tue, 03 Nov 2026 02:17:31 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:31 -0800 (PST)
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
Subject: [PATCH v11 03/10] mm/vmalloc: use vmap_pte_set_huge()/vmap_pte_clear_huge() for PTE-level block mappings
Date: Tue,  3 Nov 2026 18:16:51 +0800
Message-Id: <20261103101658.766905-4-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
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
index 780fe849ff8b..78689941b637 100644
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
+				phys_addr_t phys, pgprot_t prot,
+				unsigned long size)
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
index f7aa4686fe5b..df37c8490ae7 100644
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

