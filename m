Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E953C411A0A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950375; cv=none; b=Eluz8Toawb8MzOmTonPbMCVtoXbDXfj85nQbvBaJqDxcya5knfPTuAX+902Og39KYuVKUIyF24HHacowHOjEogRmnHGSpbcrdsh5MOXPPOLCK/cY7gOcTKwp0MFIamIFnwdu0uBqnLVXeBl12qQuJMAymYm9zt2L/w3pTIFeynU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950375; c=relaxed/simple;
	bh=VmhSKYg91t8FaQOY7PLXlCuiEpMdg/PrBe3jC/5xDCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzwMmzb9nZ5OkJiUgoGPZxTzA6kDcaH1SmUf8JD9ferXM6WlrXncPp87Qn7oCD6AYpvwC7gxDHqkwfSDHpnDRxZQHBDrZQAj8alN5jr522cvKpiQ62Bgj+fw9xmdSU1wZo3xZ53U7iMaTACI5rVN0dCjFmZSwQ2J4z1KlgNWUM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kqTZnVp1; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kqTZnVp1"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1530375a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791950373; x=1792555173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaAy9NFbsaWAIqgLcyoOERlKyqqeQpYUYBxUTmvTMEc=;
        b=kqTZnVp15BzlwlEcIFdqDpTLKhQ68pAqOMqfdDbpM1tZP8lGqnJxDxivpVQ4zfYmKh
         lDw0/zH3cZfx9EBO2+UcYKvTc+FBFXM8r+k+TWzOt57h0f/oblx2DBC5bNGPDBcpYAQT
         PV6uwSQdl0MVHLdcHqP4y1He8VKGj1jsBuxpTDggfV2OJ/NLhH2F49bxda/RM+bwbdqa
         bQrrEgK7hallbIXGdgybND/vmm94+gUNSs1QfoMRV8TU7YyrEB0vRdLCUGcIVad8mwdu
         GwbglmgVEAynIeF9xWjs9wsG7rS14gZ/EOj95hcclTXVf4FByVThtUU0QSulLNCe5ZQ4
         aL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950373; x=1792555173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaAy9NFbsaWAIqgLcyoOERlKyqqeQpYUYBxUTmvTMEc=;
        b=dhKSE54GtzpASgdqciLr0b2dw/jl/4fYm59ohVqBM+J8o/Rs6KY1xa/0Y0/cZbNUDp
         Kk2zHS0flIwYM8YlepoUDegwUJmrD6GkPDrEVYX81HxYb6Yuxeyjs4FIgprqOkFQt974
         G/yPOzWQAWNx4pt6+M56eaJOS0iGKhJTvvVzXWmcZ7OSSsW/0Kx1sNfIAML8/0qEgbZr
         7/Iy3I0yEo1jI/eW0G1LAE20Vqk5S+5lTBhMU/AcgZOPv2HfwKdfETWXZSY+RqcE6kgq
         udSj/4ucqtO6g0rdn9r4Ob1M35hVaAc4z4lOKVmI9blyWBFInJZiNBYYK4BUZvaNspdI
         fqkQ==
X-Forwarded-Encrypted: i=1; AKwUvBygIPt7EQRjjJ6rQZhDkJM6RftCQFobEAsn4DKtYRBcdu4Qe9dBh5vL326WowPg9/46yGRNemR5VvUuZDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiQ6UH2FKrj8nMesk8xEm9eCjrDRgw4ZlNkvxHGTYCrAQc4lqL
	xy0G0JCkWrq4b8WOFZPesAWSnJPCMFy1u4BrXblkp8CiF31Yb0WHUpEOXL9+wu5xiaU=
X-Gm-Gg: AYBFou1f2D7/0iehz4lqs4sUJ7zRurvaV1+r9arOlnw8a2b+NWzNPVlFM+/JKPCp9x7
	7fI+OyJAvoC5mfOm7XMVLFsQ4zZ3Ux3fLkyNfFzGeY+erz3USpi6av5g2bjW2Tu4FCBgeh9vqBm
	Z+Vhagn/EsRqXTwSK567xtjCeLcY4Q+OWG+VPii3EiKuTBu1NK3SwgLUxKOMRgOZahQAXwjXNUu
	fb0tA60O1MtTeel3P9XTGvqhDoyP7vBIViA+mpb50le+jJ/bnx67v0wduyzmnFLjXgcRyQS4dyg
	kTJ5fwoLzcXXoIs4btfDyOnPD2b+eJ8X3sf4zsDTtTvJs08lWDp6ERYJqsa7TbSypi8Za/MJbqq
	Tvlpf3PmeYO1fzClU+HSrfcC7ot31PgqCnNIfJm7OmpkAm6D4DddccezNuB6+buisf1/9unGidx
	o8Ga+jT3rENXFGZQYYAJfj7oFz1NGO+NablXNNfpJkfAHp1eiQGvTKorKsXL92/5kZWnIWIZPG8
	YaONVFH15PIFDyLPmcT
X-Received: by 2002:a17:90b:384c:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3ab3ac86fbamr12973731a91.34.1791950373230;
        Tue, 13 Oct 2026 20:59:33 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2492305a91.9.2026.10.13.20.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:59:32 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mm: generalize PUD page table allocation
Date: Wed, 14 Oct 2026 11:59:10 +0800
Message-ID: <20261014035910.687847-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014035910.687847-1-songmuchun@bytedance.com>
References: <20261014035910.687847-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic PUD allocator assumes order-0 page tables and zero-valued empty
entries. MIPS and LoongArch need pud_init() to install their invalid
entries. MIPS also uses PUD_TABLE_ORDER to describe the allocation size.

Default PUD_TABLE_ORDER to zero, honor architecture overrides, and invoke
pud_init() from the generic allocator. MIPS and LoongArch can then drop
their duplicate helpers and use the generic constructor handling and kernel
ptdesc marking.

This also switches their user PUD allocations from GFP_KERNEL to
GFP_PGTABLE_USER, so they are accounted to the active memory cgroup
context. Allocations for init_mm continue to use GFP_PGTABLE_KERNEL.

Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/loongarch/include/asm/pgalloc.h | 16 ----------------
 arch/mips/include/asm/pgalloc.h      | 15 ---------------
 include/asm-generic/pgalloc.h        | 11 +++++++++--
 3 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 1fc9a0751f19..06a36da302d3 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -8,7 +8,6 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm,
@@ -51,21 +50,6 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 #endif
 
 #ifndef __PAGETABLE_PUD_FOLDED
-
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
-{
-	pud_t *pud;
-	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
-
-	if (!ptdesc)
-		return NULL;
-	pagetable_pud_ctor(ptdesc);
-	pud = ptdesc_address(ptdesc);
-
-	pud_init(pud);
-	return pud;
-}
-
 #define __pud_free_tlb(tlb, x, addr)	tlb_remove_ptdesc((tlb), virt_to_ptdesc(x))
 
 #endif /* __PAGETABLE_PUD_FOLDED */
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 2f123455e363..4346802e283f 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -13,7 +13,6 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
@@ -52,20 +51,6 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #ifndef __PAGETABLE_PUD_FOLDED
 
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
-{
-	pud_t *pud;
-	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PUD_TABLE_ORDER);
-
-	if (!ptdesc)
-		return NULL;
-	pagetable_pud_ctor(ptdesc);
-	pud = ptdesc_address(ptdesc);
-
-	pud_init(pud);
-	return pud;
-}
-
 static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 {
 	set_p4d(p4d, __p4d((unsigned long)pud));
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 68e473908758..cc8445e6078d 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -182,24 +182,31 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 
 #if CONFIG_PGTABLE_LEVELS > 3
 
+#ifndef PUD_TABLE_ORDER
+#define PUD_TABLE_ORDER	0
+#endif
+
 static inline pud_t *__pud_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
 {
 	gfp_t gfp = GFP_PGTABLE_USER;
 	struct ptdesc *ptdesc;
+	pud_t *pud;
 
 	if (mm == &init_mm)
 		gfp = GFP_PGTABLE_KERNEL;
 
-	ptdesc = pagetable_alloc_noprof(gfp, 0);
+	ptdesc = pagetable_alloc_noprof(gfp, PUD_TABLE_ORDER);
 	if (!ptdesc)
 		return NULL;
 
 	pagetable_pud_ctor(ptdesc);
+	pud = ptdesc_address(ptdesc);
+	pud_init(pud);
 
 	if (mm == &init_mm)
 		ptdesc_set_kernel(ptdesc);
 
-	return ptdesc_address(ptdesc);
+	return pud;
 }
 #define __pud_alloc_one(...)	alloc_hooks(__pud_alloc_one_noprof(__VA_ARGS__))
 
-- 
2.54.0

