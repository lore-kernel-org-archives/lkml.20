Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96D2175A9D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789622994; cv=none; b=iAKlTiuzoApzmV5osX/r9Ya8Qa2Dj7GRFB4pfoKua77vRSPHR6kktPYCBLgIKntFu6xsJTfN1yZYr3qXMna8kZwnm8ydsf5sZdZOIuy8bpBiq9eTXiUNNqburBm5/RMYrxyDwagc36RUxvpHniML6lXYM4u3ojz4/PMsyK8mGdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789622994; c=relaxed/simple;
	bh=/nwSN6IrgrPDyhmpZwP1Nze8+BBC/+n6X5U6gITRzfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UjNnZmOlWesl8znz3ANXj/xUKT5/pB8tHVPbAa0eFirnSehGqmwGh3eNYyBhfGTJ4XtCUBkoS1K7dly2u3zdlHAmjlhxE1nPadwk53g5xWAQ/8W81sa9+o015C9/PlVtkyKDU+gPs8ouTUsDanmvcfl0kWweExtEnVmh5EgWGyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZn6jqX6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZn6jqX6"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso348790a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789622992; x=1790227792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMxiXZ3VjT6yairvAxeBbjdHvNVDdfswnxYz1hMIZxE=;
        b=QZn6jqX674K6IjgxmSQAyAq9f9KhX+xp9FyBfNY7s3vnCO4z3WoK3RnZ7XoDWUXaLt
         Ap8WnY2dMYI0UxH5yRWKWeH9+Xmj26CXkU33tHSvR5F/QjMfTaPIaUuxIBkVxszj4uxU
         w1+e+xynoZUMVDxfpC7p3oiKa0xCiGaAnLZu6H6HhKynqljZQT7b1UEStxFxqxMyKfET
         yv+FSPHiQbDHlxvzLYMQ0wlWVUFMXDBqrdT6IYmzG6+wFcuh7AZ+/y5U+uTdoYyqlsNH
         kQSdB+K46PrWE4aW4dYl0uyEi0vkFViBd91tn8k0cuKgY7fgyyG/nLw8jl09/r5SbAZb
         1kLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789622992; x=1790227792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMxiXZ3VjT6yairvAxeBbjdHvNVDdfswnxYz1hMIZxE=;
        b=u+iBhVRGClLPEfNTudGTEzGlSw2TSOaUio2cMO9Xo2wRj2i+Omnjpb9xGm3KYWzIX/
         prAX9VphpPN2nOatEtZq0b221/3FTtpw8+uaHtsbnGPBBgZ2mfoiGim6Y22OmDQA8VtY
         6CS9RqJtV6cJwmFP0pHfD4RTk3qwTT2lTth5L05Gwjc433I2Yegl/njc3BaAVdIwOV9a
         QvaTv5A43bz03hCKsvGEIZgFlr7gAYrEsyv5cpYZZIPsQeWZTZVq+JJQ49Kw7HJPmjHR
         c5npKpvTp4ocG830a/sqN3C3yqwV/RvzbBrc4Xh+OFr+F0EDUqqU3PhKZSyGxRN143sf
         hn/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXcOFtd/J1DN8dtVtK5rxrtWYM5gzI105tqE1a6g7D5S3bmhLEEbRvDKlqxXoPHrJUipsmSSU6J4ZVhbE=@vger.kernel.org
X-Gm-Message-State: AFuF++nnD8ZEVWbBzPP51fZpQvf3KZkA9e+HAPl6WvO1Rz4MddD62fy2
	8OVb1FgJuCM3YiRTd5/PBI37H3kNKb1dJQyhOEybTN+mJg7aDVyFO9GN
X-Gm-Gg: AYBFou1kOqP/u4TwT5xCKWdrUAyPj89nMQs4asVndsKwxwwFgGiqUnrALiURbnZ+knk
	A6OoeV1EuUeGLClLM2OnUjwVN/L1uVoFxmvH2PaL4osQL7db3qOe8gMtN7KCSVEPHiPqCIH+rkX
	IN3Em1xR5qOyEDFiSSEwH/q2ZswnqhijpPdc1OeO8T203rdOpoB9Tl1VuENgaWDA9kpihq5nfGh
	xkhSnkekuJYvD+k+FtfcJwxF+NkM0fRkYMt3otjy+u4RoapXlrlmcVj06WsKhY2FrkekVoEr4m8
	miihZC2jVTwwgxIShNi3BL0SwqdbkRzvLgWeTjT/eDicbw+CFO99fQ8tC0YJwVKbNGurB3jPs/e
	35vHtgIGBpsFj2LvEGIgRtw6DxerA8dPKYgybNrjm2Vpob64ovan9vkok+AVwTcSoS/lmxTUP7Y
	7FtOzpHNqrHGJQaF1oWaqCXHQkxqGTlXOr+ezKsxVUTr3FrthEApUdE0zwbl61vPCowsKk/mDej
	2EpFH3yB4ahP3VYVNeiWajkX8w=
X-Received: by 2002:a17:90b:3b91:b0:39d:ec43:3cc3 with SMTP id 98e67ed59e1d1-39e1e2f3e9fmr11172449a91.10.1789622992190;
        Wed, 16 Sep 2026 22:29:52 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:29:51 -0700 (PDT)
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
Subject: [PATCH v8 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
Date: Thu, 17 Sep 2026 13:29:24 +0800
Message-Id: <20260917052933.188679-2-jiangwenxiaomi@gmail.com>
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
 arch/arm64/mm/mmu.c              | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4dfa42b7d0535..6ee1522fac78f 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1949,6 +1949,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
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
index 92fedf4db9278..93b602a6c68a6 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1872,6 +1872,25 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size)
+{
+	unsigned long pfn = __phys_to_pfn(phys);
+	pte_t new_pte = pte_mkcont(pfn_pte(pfn, prot));
+	unsigned int nr = size >> PAGE_SHIFT;
+
+	VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
+	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+
+	__set_ptes(&init_mm, addr, ptep, new_pte, nr);
+}
+
+pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
+{
+	return __get_and_clear_full_ptes(&init_mm, addr, ptep,
+					 size >> PAGE_SHIFT, 0);
+}
+
 static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr,
 			       bool acquire_mmap_lock)
 {
-- 
2.34.1

