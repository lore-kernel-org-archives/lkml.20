Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059416;
	b=MfvLOdy3F8NYOxi+Q7VLUI2IEMixKT+oYPFutozrXZtHVDfR0YbnE/YyNoK1NyjGI2el
	 PgGruvD4ADutw3AbJFtCChPyxXAxDZC70FPDshhFqkBlI/hxk1dCljjNnSKBaUWTeLROh
	 5OQ+AI/fa2ctrOsGaQUwacM9NIhx7LzZ49fcGUyLG1mGHnwqJ+tRpO/ntpJI4P9QcOm87
	 MxK5nvwgjTC5bEcRPI9SWnBm8uCHZNL0ownlNMmS7qtFyd7YAwlVDA9pium3+0uGcsZdW
	 uqsobZlIwWx4bAUFtSGN8zEd+RxSwVSK0iQYENVB22eCRANTm4gExp3n6et7koGu3JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aqN7aZ8iVALpTxJjSlPOIKNge5VZrwlYvXTmPXr+N8o=;
	b=sK69HKcDOKRYgCJ7cgt1byWeZfmzEN92TFGPiy6EGZgzK0j/ouVLac8T8taA7Xvw9Qoh
	 VCCstq14S1/fPI6pNaDhgr/bhMkVllYugPEHMwqprtm4BNfeHpd0KuC2K4O0TNS1Wbrdo
	 5eN2sSiIKT2OYc5L8hIF3JjwEQu93EHWyGB4uSthYNMx9q4rmXDPBO9tH5VyK7D2LYj1A
	 hhGjF5taOYkCjkyTvwR7wEbTvivlElpXJxkXAd9S3tzmhEqbMI4tt2B+tsltuQsGmGvDk
	 tLaW6ILVnXrzWxRO96UJISBto2kMsPVMyctgk4rGie8nQ8jNPUEMP+ycgjxORX8uOMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeYqzfV6;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D84606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D84606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeYqzfV6
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37071c0f42aso2118622eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059415; x=1794664215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqN7aZ8iVALpTxJjSlPOIKNge5VZrwlYvXTmPXr+N8o=;
        b=FeYqzfV6Yh2zWFctgM5kGUUcoN/lxboo+wKhL68D2unPaU8WEZSITJcZF1RCfnK23I
         Z4Xi5kHmkwVy+qXMEpc2ncIelZedVelteaj/4c8r+4+jc4KstJLfnHS9jE5JPfB/EXvN
         yTLnvPxWvqMZBzKwCAdw1/6C/axbdOVSrQw6Nl0DacWicI3kj85sdSk4veE/kanqtJ3y
         SIXuK6anOqj4iUQIaE8nKrdK/3UsxDR65Z6ULq+09hAv6aPh2D/NWL36YPvRI7CcI15U
         nZh81g3aKOGG7K34oXCEKwzhFSuiQAId7yIZgS/wlGRwZUCKbI7xXZ5bUtKH9C+veagr
         W72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059415; x=1794664215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqN7aZ8iVALpTxJjSlPOIKNge5VZrwlYvXTmPXr+N8o=;
        b=sCvIKE0iFeynBtzFo4j7f+w6GNs/RJLalBUQzzu3fmCq/Hu76jzAclMaBLUhb7SMiF
         cS9K7XYd/4oHyne5s35uNAwgwiJUoHqyYGbKppokRgCqEeM6DoLi+3nxMGmPNsGZhLDm
         nL8uXeVWE4sT9b5/DSmi9vPlASgXX/z1KVJfgkyBCFlStP9tCDHIga4unoLYU9Kz3BY1
         iwDeE09IbCHxE8GpzUvLdNmk6Eir3ZIWBMcPpQ/5YbF61b0GU8vvCFK7I/izcc2g6Gx9
         TLA0WJlu4L8y7wJQDls4usv4fElyQgnhPrr1SdlbnyrWayMoiTvQgH3U2//V5utf9/OJ
         XKtg==
X-Forwarded-Encrypted: i=1; AL+hErHcwbBN5p0KVmWnQD2tPmZNH7SsuNAHtnXmy3dI5axT8ya2WsJo+d3UgJ2vi5/V3Pra7vAf001EN8lqTMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jPkxjCCgv3ySu6uViQG+Ai4QXhmUAMCJw7o1X6Ngeoz3fj30J
	bFEFAydBk9Xt8gwaW1sXLeIlqONmGpEuCX1LopEPkpU3rvNto1LuXHCF
X-Gm-Gg: AYBFou2pM7GBnpo0+g8caa57SHJSAmlKpcUw7iSoiGDuE0F7YqPSs3xq5q6o34aZqN4
	d8phaGj6xvdzRYZFO/Dv34puAAhT4L3SueVfdvvAwtjkt9RQR5uCWuTFPiba5xl+QnWsYmZx/lz
	WLVTXLv0yK8Ua0zMEYUWoGDlfd4uqBvA+qDebU2LMNAG3aNrAhKjJ2vfmVRzIA1yJUuFSxZpgAm
	uUsVUFrKsqahEc+J0Pmw5iZ5xDLrC9pUJDbVmEqfD9KTt4/6dVwN5Y1FD72FATKEtCpGzHLTSRX
	5agJ40NchZJO4wVKq6jH4Jd90YiMXQyNoDw5U/7pCtuvuxICR8hulbhSO++0eoa3/MBbdsbF8Mb
	y92Qyp4/Qqueg3DuPTKPccCC6nzaIXIQeCMY6MFAu/tNdVT4B12Hkt39X9nyOCwMdha2CUj0RQo
	xNK+6akX8O+jydgM++I/tE+hPhZa+/hkGxumHMrJSNx+nJfpvZ98QIphbSCpb8km3j/pF8PrVF9
	qe0v42Af0YeWe/6iHtyzTgDlhNaJr3vgwFeDjVlu+ab8RSTGJ58Quz6pCZmzSybRBX6XrzjB4on
	fcO8RnbrOqU1U/LTBpnEab2u3Z/+tAMp4F+SK7issYMudkAG0nGTMnWjUQ==
X-Received: by 2002:a05:693c:20c8:10b0:36a:30b:5dc0 with SMTP id 5a478bee46e88-36f75838341mr7149731eec.24.1794059415250;
        Sat, 07 Nov 2026 05:50:15 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:14 -0800 (PST)
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
Subject: [PATCH v12 02/10] powerpc/8xx: add vmap_pte_set_huge()
Date: Sat,  7 Nov 2026 21:49:45 +0800
Message-Id: <20261107134953.748622-3-jiangwenxiaomi@gmail.com>
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

vmap installs PTE-level block mappings (SZ_16K/SZ_512K on powerpc/8xx)
by reusing set_huge_pte_at(), a HugeTLB helper gated by
CONFIG_HUGETLB_PAGE. This makes the feature silently unavailable on
CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to HugeTLB
internals it does not otherwise need.

Add vmap_pte_set_huge() to powerpc/8xx, next to the existing
pmd_clear_huge()/pud_clear_huge() in mm/nohash/8xx.c. It builds the huge
PTE and writes it into the backing cells directly, without going through
set_huge_pte_at(), so it does not depend on CONFIG_HUGETLB_PAGE.

No vmap_pte_clear_huge() is needed: 8xx does not implement
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
index e2ea8ba9f8cae..141336d30cc76 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -235,6 +235,10 @@ static inline pte_t ptep_get(pte_t *ptep)
 }
 #endif /* CONFIG_PPC_16K_PAGES */
 
+#define __HAVE_ARCH_VMAP_PTE_SET_HUGE
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		       pgprot_t prot, unsigned long size);
+
 #endif
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index a9d3f4729eada..b12e2829c08ed 100644
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
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		       pgprot_t prot, unsigned long size)
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

