Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C7043DEBC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144929; cv=none; b=gCyzTV/HIKVv+x2ZuGTY72fBZ9wtfd6PzgMiUmyFgaU1PhuDQpGMuHMmwC1I+YpRzZVa0xbt/5KTEfVKG7/XXCiFMxFRGpJpulEyuevmew2Vh3Q+7euGNtJX8xpKobcFbrYekzrp70njxG17hxZkBoiJpjE+RJeV0pm+OZzrg1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144929; c=relaxed/simple;
	bh=TZIuyM87cT1jcfLZCH3Gw/sQ620Bhi+JwxUTofKDHIU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q6UO8y4zqZjByrHkggqKy4r+bVOOQqhU4hbqQVIMdjl7Een28eeiFqphxesryQrhZu2S0+5yJSvpGQkHuMpZvO0rTLjK0XjsUSKhHv8oOu7/hxaJluVxaE/ie9kqykCJ0qRA6bfSpJW+3KZ3PN2pxGunsrjsNQcFNVKBpP1B5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8gJCFBq; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8gJCFBq"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so2352745ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144926; x=1790749726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/fcB7RWsYoduiGVrXMcsoy9SKXwqPZ/B+Usu82ABAo=;
        b=n8gJCFBq66UpQqJLP8pvq8e0uwC93oJwq15KLVHFG7K0xKY7K/CQ9q1tJbhw4PF2mA
         6ATT0wxN6K0TnqdUnBOMriG2MoEDt4ONoK62u7/A0Re4lW/4OYeq6pVpGyvgUJwZjDWG
         jTkw/5vhGWzyISIaN0+MtYYqJy6P/PjZdLfClya38G3hFJnIopTPQB3GeSIU1/Y/uQO1
         6O4r2v1ewk/wi4IsMXVpNW+/x1ddMYbGt1s9Y0rCVFY9clEr0pNhqBveCgfB8R8UH659
         mfsQAm9MZmHy1Vt+4zjohvPCzFc/MeMzdLq48RaHQtmhQWQyEkoj0CjSKGFGp9sfZsfa
         dLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144926; x=1790749726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/fcB7RWsYoduiGVrXMcsoy9SKXwqPZ/B+Usu82ABAo=;
        b=Nb7ga3k4A9zzOOdFgUvEu35NxtgurEmbcBBVgvtKTP5PSSNUI0HHcT5VXxanpeR/KF
         QmMlW7MpCwung/4BRbUSVTggFqC/dWQoD4tZSfrBTRWzbQJRn1pIgKEFkcM9vPg+eORZ
         m0sTMd8hjq4rT1/Ldw83L6+MihWR5UZDWtiN0+hD2N4JPwkansJqMd2LXJ3AtpRpdzez
         PgdqSaW75Audc6762e74qv0qS/HWmdzd9RdO0j4G+A+F9hon+2US+gH7t5fiC44E6EH1
         ZItEC+E6rZhHu2fZ6p4tkt+H65GR+pqBrk3Zq+98ttY2Qg7+ZlUPM1Sh+3jgob9Nxi7C
         S7IQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF4Xir6cPhhLBS+E0zTiTiIN9g/L+awBqytgbF+LmKGANsVla634l2Nopkq5uuxdPCgFvcsjvrrSCIjIs=@vger.kernel.org
X-Gm-Message-State: AFuF++krLSBELToWuHfXD/YvdbWjIIcO9wyCutgGlcyM5jh2d1olqW0z
	u4Q7INlNaHi9c4BnBtguPAdRv7Y2288eSMlKW4yxkvA0CLznYn4oTOB8
X-Gm-Gg: AYBFou0WHM62bjVK4qFKOQlhQvQSt5bmKnh061e6jLxukIA93mz8WK+l6LQPrgKZnAF
	4Cqy0IVTyzKpVZhazcSRF9/7vbjh9AabVTjtlrbP78A960r0/I042WY+KFR/7ebHGOxc53XH6A8
	drZyK2BPTbfxK2qFPizdIRJqJvIJJ3d3Fg1G54nmz+Q9SVh2w2sJ8MsZn0hJwkX/2snHjIa7hV2
	ZXyUZGKlA3LHW7mDfpqS8T3wV0qQ5ZfDF8XPHCBJ34bzS+PQEvJi5tmYaHzPcHJ1eYllh1I5Gl9
	LarcJpSbYOKC39cd5smfDShbWrJrMIT9v15KlOGMCuUAQQtTSTy9+A9h+k2j1qvD8xogAlYhPdc
	8nXJuwLi0J6KWM/RYVh7jqepUevZz7x+yKjs8XXlgypg37X/vNh9vd+9Oluhn6eTaCDJTNlG7JZ
	k6fyIV2witreKEVEqixK0QrPpa5VnNCqvilHzxKP6o9jJd3HKSzXMunt6176uB35pjPHH+nG+q5
	6wCej65mRQ4JpvUdHEtwA==
X-Received: by 2002:a17:902:d2c2:b0:2dd:c0ff:e724 with SMTP id d9443c01a7336-2df69de446amr13040735ad.54.1790144926198;
        Tue, 22 Sep 2026 23:28:46 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:28:45 -0700 (PDT)
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
Subject: [PATCH v9 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
Date: Wed, 23 Sep 2026 14:28:23 +0800
Message-Id: <20260923062832.479455-2-jiangwen6@xiaomi.com>
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
---
 arch/arm64/include/asm/pgtable.h |  6 ++++++
 arch/arm64/mm/mmu.c              | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

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
index 79d90226fd5dc..4a3d084bb7556 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1912,6 +1912,26 @@ int pmd_clear_huge(pmd_t *pmdp)
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

