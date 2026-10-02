Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B8A470EA4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932212; cv=none; b=LQbXl3/azedOLs9q+2K9z18vPQftonmNxcC4BSGNefMnVDCl5JOIAQP5jwTpU2LZ7JsV7o3Ar/UaPTwIyy1IBEt0dvBO3bDStqmghwpTFEDVGAHL3gr1ithdvamkj2wvnRiGYcElZAGwLc/YQGfeq1azrEW77FBUx+ZDRE0lziI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932212; c=relaxed/simple;
	bh=PuZj+12/JdxOBgoodNGziYlngR0lYlcmACuEwLWlL5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gDuVmLu76Khhy6b3FhagNpgisSnUzkYTPjrzt5iL+7V5DcPpn4WhTJzWpm4B6p5oi3Ku2yKpqWzTmvsvYQ6TCsSZU2l1uu50N7AMbrz3gnVNXj7kwRIQ2dH5DLfDTBHrZmRz4C5zpD+g6fWSWEaEQJyotiN6rPudlOUzdcOUgcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlTNDLdv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlTNDLdv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caced6038eso7696565ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932202; x=1791537002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrNUgiHK76eibcbmJczjwEumW62nZKL7vmCqyjldhkU=;
        b=qlTNDLdvB3zHo8M9u/MIY5c96GpwbucaFSPZIviOwZEt8JLJ7BJdZFXt0pWPrmka19
         liqnRokmaJzdPMMEMB75/f8MPFjBq7XIsCQJ97ccfRX3JZ/65xynqeqTSoNE0glaEdto
         2j+adIU+6Xkn3msi5OODzYn47IBfajRV1zZiAEYx6MSsvf5BGngarS9H1ktCXxLcdQ/h
         NOpisdhEHsCGedjXqmLJpQ8GHHV0gKBugTiqqKHel57TRRXfMkQ70P6Oz10mWjctHlBZ
         nxwAojJsk079KhFsKv7+f8V8g6HkA46NR7Qvr++f/V6yqvGmOra0IbJS5xWKPuO5fxhP
         CzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932202; x=1791537002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrNUgiHK76eibcbmJczjwEumW62nZKL7vmCqyjldhkU=;
        b=Pi2CiA+GMXsCI2ofSBx5ahZ1d/bkNpXBBM/W99o1jAWfsfAg88cZMyIcZAoxaZezd2
         1JEYsPuMxDhUYhJCQ+bNzAeqVva24+QlalbUNiKeaEHl2S23vi7YkI3eatudKvAM7GSt
         g5OKWZX3T3edPoykyWkhk3I8Piy3NSV7l4WD6N695bxVsXgv1JFA65CD5+MshHT/f9Ig
         2Oh8rMkZxt+WrkUH2eG0jBkkVzvwBwK3d7Bu+5Tsat8e5G+RQP57k3TkqiTHTuRZdHgG
         6BavJzFSyRUmfvAGD+Ek4wMtn0oZLfutQMKWZL7kDJRk25/WrpMFP/FmVpxhvKuXvzMy
         cocA==
X-Forwarded-Encrypted: i=1; AKwUvBzLZIOrnv9uGAYu11Fz3RaP1I8lK31M8tDGAV479Zk8R7ZteZ/Ee1TE8cPiJi/TAVb9cc9MdqwJTlqon9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXqTm/iQu8p03qKncPmZV485S+qyGyYVpWRBaWeOtklNF7Hzzj
	LAwRO9a4Ztg/3FAXBMLozqDreu3cJvDsEL+t9WVWwu0NZa+dqeNH9VQz
X-Gm-Gg: AYBFou1+obSCaqQxlgjKoUBftgG65GwSIP2g35Er39cIFUTnfslz20A8q3xk65PEBFU
	0xCQvQr8wOeNghZUFItpVnWioPfJIEH7FYOVGSJDeCe6m/dy4cp8SWzbXdsUGv+TdCM8yhc9Bzw
	2BN8VY6TQ7tBhLphO/xYxwBc6SI2v+Vkj/BMHh/nUCSjvow54LcuwbfJnB+w69zHDB/UEl7YJkR
	7UkrXpEwGxN5msGPpLLbVeduutPGGouH4NKLTndoZxBrA7g1YFj1ZP2xG6Ehlof1bhnHJ6pqkVG
	Q4XzbjiwumseY1MVbK6FoHCYVTlFTe3KOQkxFuZ0vE5pIxMlhZMod8UU6XYkFU6cIw03nm+Z2Sx
	Xv2eQiJ5zoNfq4gnzcpD+KlFnYgevJEWQecVVreQujpMGHmVPg9kWudtean7yEVjL22kVOT6kw/
	NmlqbPQQtjU5Qj62rz/ezSwjSBZXbDywqimozcluoJlxU5kotdfO4Bg56KtYuOrtSeBY2cxEOAm
	tCZslqH5hui7VeKbgFbsIse/3Z4Jv9sIw==
X-Received: by 2002:a17:902:f686:b0:2e1:35ec:e03d with SMTP id d9443c01a7336-2e30029e1cdmr33883955ad.31.1790932201968;
        Fri, 02 Oct 2026 02:10:01 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:00 -0700 (PDT)
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
Subject: [PATCH v10 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
Date: Fri,  2 Oct 2026 17:09:38 +0800
Message-Id: <20261002090947.869220-2-jiangwen6@xiaomi.com>
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

vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
unavailable on CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to
HugeTLB internals it does not otherwise need.

Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
__set_ptes() and __get_and_clear_full_ptes() directly, so they do not
depend on CONFIG_HUGETLB_PAGE.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/pgtable.h |  6 ++++++
 arch/arm64/mm/mmu.c              | 23 +++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6000905a2e865..9b762eb68cff0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1978,6 +1978,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+#define __HAVE_ARCH_PTE_SET_HUGE
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size);
+#define __HAVE_ARCH_PTE_CLEAR_HUGE
+pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_PGTABLE_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5dc..ae2f15618c97d 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1912,6 +1912,29 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size)
+{
+	unsigned long pfn = __phys_to_pfn(phys);
+	pte_t pte = pte_mkcont(pfn_pte(pfn, prot));
+	unsigned int nr = size >> PAGE_SHIFT;
+
+	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
+
+	/* For vmap, there is no valid -> valid transition */
+	VM_WARN_ON(pte_valid(__ptep_get(ptep)));
+
+	__set_ptes(&init_mm, addr, ptep, pte, nr);
+}
+
+pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
+{
+	return __get_and_clear_full_ptes(&init_mm, addr, ptep,
+					 size >> PAGE_SHIFT, 0);
+}
+
 int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 {
 	pte_t *table;
-- 
2.34.1

