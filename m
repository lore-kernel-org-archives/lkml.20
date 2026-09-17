Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0EC3A451D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623000; cv=none; b=ZVCp1dbym3E15mjK2jE9O1QzC1rBlQkAsWzVbCWpeGzloljaNf9JYHdbFAJHklHfMgeqltNclMqCQS9Z7dm5ltGOhhLjGoPFv5bMzL26vMnmx3JaK8CEj299tGqierhmc45ix9hqi9+A8guW/zD9vwJfPY6/L9ohZZFvRHZHM5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623000; c=relaxed/simple;
	bh=hQjwjA5LN+z5+t0OFB7/5zJnx8tmmFqbQZ0r7K29ATQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iyETkbUdbv1/eFTFDHrxdOc/Eo1VAI+3aKO8Bf1aTPJa0/HHZ1BM5q07gAG/416bTFk6Q7hA4Mfoe4+VvacIj8PfNIOaGImRwxe8IazSG1MsmwM/iDtCNhahODZJX4lvOkXZwav6InTwg66GU1CGG+szfKaVYXPYwogJEzOSTqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYg/Du7O; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYg/Du7O"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so243754a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789622998; x=1790227798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qf2/Psgvj1EaockCLCoqTAU5YfPvsk9Hzwk+BcXGZSE=;
        b=iYg/Du7OOSA9Te/Isndc4W9+3ELj+aoPZB6QCudY0RoV4QJEKs0CVLP6jWeEombrlm
         AZcOGim7u6RiCZhAzkorZ2a+z2xWlMS7Qj0NWmaU7AY7X7TFodglTYoqD10OkWx/i9PZ
         FjAcSFVk4MDFFr5OhuT13UfZ3dPEtlSMwKDvkHMjptZuj8J7I7Uk6A91DiV9Pmq6tskF
         OEMOcvnJAba63a0ZaYi6v6iA3TzfiK87IfiM738ZoyhDD2rniyJ1IqcTe9TBzhHnS1AK
         cWgrOwWZBcp8xR/lRw0ZY83Fcl8Jlv7ypcVp/R8vSZMPxiBxcpnR4pmRmwBHOP2JGv2e
         pUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789622998; x=1790227798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qf2/Psgvj1EaockCLCoqTAU5YfPvsk9Hzwk+BcXGZSE=;
        b=oQt9+289+szeteNKGmrHACYyChIJlnpuGuYp812YvtH6v4mrfcdvN0fWe2Ra8f1AVm
         WK6TOEx8AkomRajSS7EXD4YkPrvIdcPi8X7UbddP/slBLmHlkLesiWZtlg8FFveTtP+1
         6g9QJYvxF0QUR7j0itxdO0gVJpSzIvUCrudfXW0Y/wBBfyZuC7VO/sEIiGi4tjXmKOyj
         Krd0ooLuujZmP6B9ewBAVAsnW7sUMtFoPSCnr89YWjCTAM7qqs1Mmw/wOFLpu3ZSzc/Q
         EskARjQ7G8G2+geYY0ywnjszV9ZM5hdmIrslRIAQK29vWLoIi1Mt01NuqZLZUkvp0A/e
         dFpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwJH1Pfin7vp2lmkdSHzqq0vMkk6hl0lxZ2RscF7cz4Vi5YjDVShuneuZS7kAwSOl7BNrtCP/EqGZX+Bc=@vger.kernel.org
X-Gm-Message-State: AFuF++n2UqX9byppJYfhfDKVYC/LSSRX8+P7h/l+/U4ZGbaEYtaC90JO
	aaC+psyjLMaJd0kq1/p3n98yoq7fPry/LPZVzqFNdTFueGLTGQ50X0PL
X-Gm-Gg: AYBFou02rkmIALpzt1MFuUH8HcgqKEU6ieh5pU7PbOqIZhMmz+xd+G2Jgkv/W2wqtMO
	CJ4Kt86dg8bBDA3UREqZ5cHSeqXcsV6MSNMlb6F2f5Ay4r2LJ67lv0Exs53hcfYLbxpaSCr2JLS
	ztHy5IwGpAfoJDLNlujyJ9hSwFEXWOZo6nJdzCEm9qF+cQYDemnKCnuiFWk694bGsqOIyyaWWD+
	VimSVMMn9ZtNDtcDeFJexSU7tKQH0IesIzTUwXzRxUBeDSaXFSadqHSsBXIU8ZzgP9fwyJF4B5t
	Z8Djf6zpNuC1Bk2cx2VwQXaTqv+6KWQ4GqadS0zTVCgfvDW+Nvcc2fVpOkQWWCGD13c1GI3beLb
	5a5vHu8Gv33iuyflCDkDACl8HX2OWQgmCMoi03TXzgpNKSHfK9X9Qmd3XIbtgjVBVzHeVgbjD7m
	OYLzypMLxVnXaaQHjlYZAimnu1hnaJyP6LAA4BCJoVpcBlyLAFAG+/l4mDUo19yXRGX3g2tcJQS
	ygkestUjSpaRvsz4DKnxg/35hU=
X-Received: by 2002:a17:90b:53c3:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39e1e48a517mr11683515a91.15.1789622998238;
        Wed, 16 Sep 2026 22:29:58 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:29:57 -0700 (PDT)
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
Subject: [PATCH v8 02/10] powerpc/8xx: add pte_set_huge()
Date: Thu, 17 Sep 2026 13:29:25 +0800
Message-Id: <20260917052933.188679-3-jiangwenxiaomi@gmail.com>
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
block-mapping branch.

In practice PPC_8xx selects HUGETLBFS unconditionally, so
CONFIG_HUGETLB_PAGE=n does not occur there today; this is a decoupling
cleanup rather than a new configuration.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
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

