Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701047;
	b=BXd4faZS19iYP7KIr0whIy6tQHCdneRjiMg2LIg/33XoDDD7Uw8Gmv9zboOZ4s7h7cVq
	 ++uxN1yxy1PNsmOsWD1i3bBZBcifY4mjZZQ4EHGY2WVckZNoHdNFKGsfoiJMsz8suaQHn
	 hkZDu15Y0HA1O9GYRAc60SdJdcQJCqHcZsANlUoiAd0Iu6bRTTjJuvyP4ynMj9ekMtl/G
	 L9Mz8GgZusUKeLGjqUMh/pGXJVcHPrFgI5Hq3GQlgRo5YmkaRdYYYgk8w5cwnoFwkAfo0
	 GkmVUBjmARFzYgEUH9EQqvhP4+xTV/lqA6HjR9UMGW7fg1vUl3jQg/RuwMRai6hZ1mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+SJoEqsvZ+TRv506SN0uWYqGOCHbvZTF1hg+QTdNQpA=;
	b=vsM4O5/1jRnfAJFp4tb8i5JW1xDnC5u8cqHxQ5YaEJYAs5R3arw/9KpBOYRV+NBQYPWl
	 lVuAZU/BoJL62ajDD2RJFAvZeyc1zzpc9Q07x4mPIqE+/qVLzoU0tkmCsMnFAcdUNhfv8
	 C9J4SUQxHksjwC+1UH2PkXa7QZ0/WoE4hIa9lL7HUqLZfQk6LkYMfloEQGiFhZ9Ez6krq
	 n8eLINZhDNXo+s05JW1i1hDrstJVm5t0Tnb4J6hRQxOyQSw154OvRBMlVT3A57f9zwCcf
	 NEZTMPk9SMQeaLi6TU3uGWVglrEHEN7YhZo8huZqXeKWCls2sFmFkqklSI5h06UifBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyKus2rR;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB861606EEB6
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB861606EEB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyKus2rR
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35c76e9614aso5490810eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701046; x=1794305846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SJoEqsvZ+TRv506SN0uWYqGOCHbvZTF1hg+QTdNQpA=;
        b=pyKus2rR+6OmK5jGHGU+tlEpcfRzVq9k3PAaUvpa+F2wgI1fbonfsmk2YciEaNZjS5
         LPf6Y8X5Av7WVwuPb2dblR3HvtIECtucnGP8uyTCxOtAkAdSD2BOJZGC6HPOygVHfax7
         CWCKF88RAY4gT7iv8hBXOepiqYEqLi1P+34vGEg49jMhvTlT3YrEiQknOl3gkAU0eBS9
         74ipYdDacem2/bO2wEIxZ+eeCnOBknWLBmK3xrybuyNBtEJp3PkuPm5N91CygJMKD5rI
         wa2SiJ5A8beKY3iAkd2y9NKsAV2cPrxxVsN8wkG74J6VZY8gBOmgs8MMX3D7y7fPVeRQ
         ENgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701046; x=1794305846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SJoEqsvZ+TRv506SN0uWYqGOCHbvZTF1hg+QTdNQpA=;
        b=VHhfi+JZdYHcYpviNgxPu2lU2meepFDm9kZy0WwWoErb/9hBstG8W6MDR27c0aSJA0
         8hcYb9/OkzPLInWRz0DDqQ5CpD6v7nMcKt2x7EkxVuRjfxfJWBL73lhCpSUOTpTrky5i
         jeaHz71xP+/ssct6I+F12k5MDaKcxciaGVA8x4nCKqE89/VBGyVn4k+cEmJ1mc9MRAlP
         awN1cnU+pgBmcxcOfe2C2DWMo6M3mX0XJqmI7MPRfK9VfnYSfdkTkjHxzGUlo8EiTIIm
         1vOngtrYnsTuvgoBhRsYpLI+yVlNqDUlZ5BVw5Co1OePnmqL2f1YC96/wqJ/FjW7ZcM+
         JlQw==
X-Forwarded-Encrypted: i=1; AKwUvByWqx80su3UPlMQc5464Q89MBH8B2GjqNFvjTMQoV2KayKGWmcnLQOGxzct7WDi5jt/1w8W/xF0GbdwwfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y4RWYSbisDIJzbOSR7U74msQKl08tqQhA54r++lRqK1qJcQ3/
	DmM3+sIqAcNfpYkWJNzh/iCBX3pyJ3ptlEOFHZYi5A9mtQEU7k0pVFt0
X-Gm-Gg: AYBFou2R14XOrshHfBXn9vrEk3DEaecdbNNjkfsgMCipIaEOk3VxXGoBTpkjSrUj7nA
	g/ApWLXUoBIGb4KHAnw/fFt5mCsCJwqVefLDgVEJV7d5V5eEnqJBIec2SHlpV/5QGqQkzWqJ/LB
	A0sI4LbQa15qaVadYJllDnNv6F7PmWhv7dtVO0C2vAE2S6Jj/SMHmxxjX4sum1eSeVYa1e6Mjmw
	VCLCg8akk4zDSyQPqMN7li8Cg4XDxyRq0vmsDgKI8Q3ZoHOeDeddDxT/OMLD4JjqFS9aPrFEtzx
	7IC3o0BLiTEg1OgRmJzZ1gsVBBx1r/obE86l+jNmMV8yo/hE3bbpqAMSuQWUgL8Ww6hkdpcfrMt
	UHOwEisGvJsymFFUzG5WxX9Fu0XZPz05oKmn69aAbXeCBz3zRK2FhLGDtcY0KSH/KfB/7VRQY4Z
	Se1u4J4pUzyHjdUv3jNd3OQj3m12aCEZ4ApjCy9skMV9FwiWxgTaT07vJi0LQhaemRCcFkSJNj2
	FFHEVpWOpSXthZCNVrMk9VQAZtHzqrkQd8nreajIFDiancTdNX3BO5zl02wy9VNLhpNha16vIKM
	BVauWFrS2aRT0TkOAVAHLyPGziEGaA==
X-Received: by 2002:a05:693c:894e:20b0:368:7c9d:1577 with SMTP id 5a478bee46e88-36a4238420dmr18800136eec.20.1793701045554;
        Tue, 03 Nov 2026 02:17:25 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:25 -0800 (PST)
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
Subject: [PATCH v11 02/10] powerpc/8xx: add vmap_pte_set_huge()
Date: Tue,  3 Nov 2026 18:16:50 +0800
Message-Id: <20261103101658.766905-3-jiangwenxiaomi@gmail.com>
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
index e2ea8ba9f8ca..6ea854d67a2e 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -235,6 +235,10 @@ static inline pte_t ptep_get(pte_t *ptep)
 }
 #endif /* CONFIG_PPC_16K_PAGES */
 
+#define __HAVE_ARCH_VMAP_PTE_SET_HUGE
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size);
+
 #endif
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index a9d3f4729ead..54254182700c 100644
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

