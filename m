Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9BA463B85
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932214; cv=none; b=RfL6QAngMjJsVcqLBh3ZL7HhIEPNBsVuHwxMECshnXpP4fjWB68y0GVedWT3PgvrCAcvRhxdSEDLXVXiEZTJsGDC1LNYTd7GYcshEhsrkWnv8AuOIMS6EMINsfJ26nyi/S/v6LrxM5tAvKR1yfLYA1PgYZrXo0zBYzGEb5mSdv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932214; c=relaxed/simple;
	bh=eB5nUweJYyasHZvrL5U2pDBzT4tzqm9PVbMd4iLFcz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uj1Kt4EAq4QPi8auuzV/QLRdUPrhTunjDsgoqRGGQGHvIdnZ2QImXlycPJvSFf459L3R6l8zU2f11ZLHh9QEBRJv1Afj2QeuClfgwvUxynUPPkE9FLMB9sRWcKD5FupAtkQvLFsOOMzt/7YFnhVUwB5By59hT6ymFbsCVvJM668=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8HpFP5j; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8HpFP5j"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2e688de2eso25184255ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932208; x=1791537008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd05crYEDf1zOBsfrx9KiTFMAUGQioHKS/Nf5VbEp9U=;
        b=r8HpFP5j91O2tHnggJK8KTivtdAb9b+pL7HKj8cC9EEBA3SmqexkJqvmrRdFXLg7Ya
         5+7hYTxVBwP4CLIrc2sVXMx9I4K1eOOWYbUwNAE4CN5S0EensEwTTKsGKa1Evazmk1Az
         nDeWwZGs7fVD0n3mnQzo4tEGNDN0/dWZsoLjTUKUoGl/z8Z0jx2FnHQfLLpq5A3ZZvza
         JKSgLTyougR+viloFATl47V5c48gG3k+ceUiUny5wx67AdlwMqmI8kjCfA6M1FQY6FXe
         jTa+FvoIlfGVpSGzKJbebNq0URlDRKcKJKDVLYuKRr+vYeZimWIEZdL7ZX8khOEs1src
         C85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932208; x=1791537008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qd05crYEDf1zOBsfrx9KiTFMAUGQioHKS/Nf5VbEp9U=;
        b=WJYcE/1QQ5V7qg0vIbx7YBuu7WzMluXwkSYU3fd9+xeZdWl097XAqTsnL53P8/vhOs
         C6gAFSK8Xi7pdU2narpf8yOeYvu20QE8V2tVRJHlPo7WqDjjjOF9Tyxq9VwaGP+uyZAG
         mxpnKWKOyd5N1msNg70u2EnYJQn6QXnTD4kR4RKTh0REOITUbuQ87Mae2rbkFtdKMXr6
         ALB6IglFq5IPOaF+z67lfo39lUlSPAEHCCYxyHv6lKt7P+1HRrXha7ta2Rk1SDLmBhlR
         ZgHbwVhmclYT8QT3dRdTGm8OrpxCFxAcf0wbH1aAu/qlVP/NGwOfYWXbEFwfETLGyP91
         iutw==
X-Forwarded-Encrypted: i=1; AKwUvBwcdSRaapbHM8VzMTfVaiBhSmcWFbH3bUpQ9cr3zatnYPVy055L2VtoCIGS2uhgffX41DvGfhYoCFTC5A8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxe/Te3tV8cvnfHWAyHii9RYqUgvWkHeMCY7Au2bYOHUnFuRF9
	eKQ0vjRq89HBXIcPhgOi0xmbPc+onnbCsdh4aZeKqglhFQlaVInvKH9P
X-Gm-Gg: AYBFou1ZGtS6Ghw/5mKl3edxPlV9AOXNgdpP+p6kOPVZSh/PeBdnU/Ghki3IVLHsI+R
	JHx9KTvuudV71FpWRfChw+oOGGmD6JztG84/zuQcewOWAaXFiUWecfKfxOSr0NIQKP7K2beQLuY
	P/BVQ4XnLeFP2Gt/cdWNYsSyyA4fflikNiVUM1VgDy6seYzdZbA85sK/R98Td3e8HvfZiI6Tqpo
	i8N+RtytjUH8MUze8U6UnWRuXCcmGG2zy+nVk7B6RoGJHutXAJWUoefjtL5igmkyJNB7U3L0o6e
	3A60ONEmjD4FyHqj3jDJId1vlNUy1D4aWyrWvX7Yw+TMzJq13Uc98kxY4+GYh1ucSGPO3aKrqpa
	LRTV0Z7LL3oSK/8sgaeSQdrEadQr+UBgISYFz0z+7pDKgwG1g1Y4c/C47y0SH1SYyv4Le9OqvKW
	f1jpGXjsaXWfM4APU+adua7TGtvfCnuYxgWnyqlsnL8zbqDp6G301FHSxUUbdp4lPzYFyNW64fn
	W+tpycLeU60zgV8rF3m/w==
X-Received: by 2002:a17:902:dac2:b0:2dd:68a4:170c with SMTP id d9443c01a7336-2e49b612e9emr18357635ad.11.1790932208496;
        Fri, 02 Oct 2026 02:10:08 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:06 -0700 (PDT)
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
Subject: [PATCH v10 02/10] powerpc/8xx: add pte_set_huge()
Date: Fri,  2 Oct 2026 17:09:39 +0800
Message-Id: <20261002090947.869220-3-jiangwen6@xiaomi.com>
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

vmap installs PTE-level block mappings (SZ_16K/SZ_512K on powerpc/8xx)
by reusing set_huge_pte_at(), a HugeTLB helper gated by
CONFIG_HUGETLB_PAGE. This makes the feature silently unavailable on
CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to HugeTLB
internals it does not otherwise need.

Add pte_set_huge() to powerpc/8xx, next to the existing
pmd_clear_huge()/pud_clear_huge() in mm/nohash/8xx.c. It builds the huge
PTE and writes it into the backing cells directly, without going through
set_huge_pte_at(), so it does not depend on CONFIG_HUGETLB_PAGE.

No pte_clear_huge() is needed: 8xx does not implement
arch_vmap_pte_range_unmap_size(), so the vmap unmap path never takes the
PTE-clearing branch.

In practice PPC_8xx selects HUGETLBFS unconditionally, so
CONFIG_HUGETLB_PAGE=n does not occur there today; this is a decoupling
cleanup rather than a new configuration.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |  4 +++
 arch/powerpc/mm/nohash/8xx.c                 | 29 ++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index e2ea8ba9f8cae..1ee3f8f0de974 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -235,6 +235,10 @@ static inline pte_t ptep_get(pte_t *ptep)
 }
 #endif /* CONFIG_PPC_16K_PAGES */
 
+#define __HAVE_ARCH_PTE_SET_HUGE
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size);
+
 #endif
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index a9d3f4729eada..2518d2a6bdb41 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -220,3 +220,32 @@ int pmd_clear_huge(pmd_t *pmd)
 {
 	 return 0;
 }
+
+/*
+ * vmap PTE-level block mapping. Sets a present kernel mapping directly,
+ * so unlike set_huge_pte_at() it needs neither CONFIG_HUGETLB_PAGE nor
+ * set_pte_filter() (a no-op for non-exec kernel mappings).
+ */
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size)
+{
+	pmd_t *pmdp = pmd_off(&init_mm, addr);
+	pte_t pte = pfn_pte(PHYS_PFN(phys), prot);
+	pte_basic_t val;
+	pte_basic_t *entry = (pte_basic_t *)ptep;
+	int num, i;
+
+	pte = arch_make_huge_pte(pte, ilog2(size), 0);
+	val = pte_val(pte);
+
+	/*
+	 * Make sure hardware valid bit is not set. We don't do
+	 * tlb flush for this update.
+	 */
+	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+
+	num = number_of_cells_per_pte(pmdp, val, 1);
+
+	for (i = 0; i < num; i++, entry++, val += SZ_4K)
+		*entry = val;
+}
-- 
2.34.1

