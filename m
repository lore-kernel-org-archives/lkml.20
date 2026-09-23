Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB43E332EC5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144935; cv=none; b=d3g60vhqQI75TVXwXiazyEV+HfEByDQrqCMGBd9icVtdDK56Lem0jHtaFGzoq7KhEx2NmfIsgGTiFNRla5aIsBkfs89TOQlv68i+ozR7ir5LpA0rkheLNFeQY1W+OFrf163V+tBVYDEp8el2i3OP9mQ1znw+4XNon66u8y+ocnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144935; c=relaxed/simple;
	bh=eB5nUweJYyasHZvrL5U2pDBzT4tzqm9PVbMd4iLFcz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lMNlEi70WEFd6EH9dwBl1JRQN+Uia0MlVugV01nrJMAuX02q44AoloZxcfsAR2RnNiTR2BzF8r03cxBBV5q8yXsvdo8vlbZEnQfK7xG9wwZwJuZtEK3kUB1cXI/JJ+aZMKeht2Xk2Bc1M1afOkgx6ukqvxW/E57g+MGlkKN03Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppKWw3n9; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppKWw3n9"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4c9d14b8so1832455ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144931; x=1790749731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd05crYEDf1zOBsfrx9KiTFMAUGQioHKS/Nf5VbEp9U=;
        b=ppKWw3n95pJdp2LLRqC+kpaWqsYSL1ZsqmvA5rY3KEOu/M0tigwhbXXPnE1lL7m0jR
         e1B6zlVs0I/K83vDEfbt0RwlnN4jmmQzBQ9TFwsAJXIyjYns7UwstcpBdOjYTVNOE/sq
         BFtpCOtyX2bU8qC6PTKwYuLgcx2Krf6D275U1ScfwdqvCmD+GmHsQIszMRyoMMZ4OtXd
         R1j3jcXhbA9hE1aw6PMRbuqvR6w6cQYf1UbwOn65hxk77qvVGw3gMKh9x/ZS+IxKNP+1
         s7/w7gewobMJ0ZKTTB7KjAocNOgf/M9WmU9zgNiyWhvraidWGBJbiHe3Bn+Arcz3gJ3d
         Fbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144931; x=1790749731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qd05crYEDf1zOBsfrx9KiTFMAUGQioHKS/Nf5VbEp9U=;
        b=YGuUHDdCD31zKTh0ukJs6LcfNThIry5FCMIaD/mC35/EOhMm4m1c2DlILf2ll1bQq0
         fQ0H+y4r1fZ1SWwXyGoeOLfNUjpq/rniyKA1VpUQgVG57+6jR0AA9VFr3UqJhD1MN6Xd
         Sw0x34XjerfLNwQTNdTRLdv3nGKa0H6FwjSY4tINTZr+23dyMTGoPLdehyYMQeK1Nxh3
         W5gathQO1J0Xe3TEXiiuFQGbcUmkLz8ftcJ4yqghwMfxFBUMO64/pKiYLpH/ZKKBRYpO
         LbMWtqBYn1C40EZaqkzsXYtHNehZpfe06l1wO0KranrPyOiw+/XVpTinpUI0CjxV/3sX
         MKIw==
X-Forwarded-Encrypted: i=1; AKwUvBwBsBP8jljAXShl92Up7TaqpJmQtLXqIJiRgwLAJURkmHlNE8/PJUwHr81L/ozVvEDwBHXYPLDHIuXOv54=@vger.kernel.org
X-Gm-Message-State: AFuF++nMWNF55hiW8ujvnaQqJaz0AjzF5RP0QbkW9EZuK1lCgOkchoBL
	KaMDooaQYoTVw6LocD1cRQ0biafxJaWtehKlhT3ikX7/oOxTyQPobQdscjEqkzxR
X-Gm-Gg: AYBFou1s/H8tQBhWAsEzuTwRgII9Saej6mWZ42FHpk/po27Sg6GVD3dcTB0BfOv0v4d
	rV2p5LnQuXcsAr1dSqxUnMTuPOVmAPADBAfgV/WI/MsVi7By3b5yNsk9GWH39U3YxB2EM2o7oqF
	ArrEaaQfpf0jr8wWxaAENRY3oA5+u2XbGTS0RnD500+1ewlkBM9BPT3zWH2L10hXiUsx+yPVMSl
	QyPQz7FKbjAj2xSp7Q+cxSLgj/evhYbOBrXsYzCRqgEr35qy+xXF/e3+NlpDUv/eJJnbKaNnBWR
	F5+P5SnaHcHXb2EJjjKLSimJKrVdiSmYyn+4vjq9Fs7+9vxZlld7tDLj0Q4JI2s9/7Z7G2N+nDE
	Fk8dcsGdy2S7uVic8qORz/xRMkt+cq+MiOT6jGohWdnNRCqUOgonrkE6JrO795D24Xuxf39nngs
	8QOWxCMvnT476JI5smyj8rlozbY5qCJitWW5rxARy5gLBPNStWk9u9lXfvrdeXqXkj/oDRXNCC3
	mSsIM6e4h+5pFn2hqgjKw==
X-Received: by 2002:a17:902:d4cf:b0:2cf:b9f9:18bb with SMTP id d9443c01a7336-2df6987811fmr11433845ad.4.1790144931608;
        Tue, 22 Sep 2026 23:28:51 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:28:51 -0700 (PDT)
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
Subject: [PATCH v9 02/10] powerpc/8xx: add pte_set_huge()
Date: Wed, 23 Sep 2026 14:28:24 +0800
Message-Id: <20260923062832.479455-3-jiangwen6@xiaomi.com>
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

