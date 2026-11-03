Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701040;
	b=qz1vzAF3P9UwVfDTR/TL3xVIZ6TLKpLI/BEslL3SG7WwCuChfsX6P96VXda6GZJQjBLg
	 eAn1SxDcnrBFrHKtgOsJt7J/Xn705HOAEMwi65mpneOkyiqjNIAOQWir0Irb2d3vjaBjH
	 gMhIk4pJnbSm6HG662NtlvChi/LyhfjAxI3e1/0AA7ateO+SPvj44rIq+08nAqcW9cAXu
	 bzYDQOKgqilEJkt1DUtj3zzD18nk4bhsJF574AFBg1mQgNaAJjKHNX29pMXRB9a7bbYYD
	 V+1ShgQ7HNlmGZl+//VIzkWstnrSFCGDOo5x+C0oFIEALvmZMDUle5d0vCXHfjhMKQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iIqgn31oqWqTiWXF2IW0vHwpw1vMj9WhwN7adf+gUg0=;
	b=n9Lzkp6ak9DNZ/0q75fKX7JFEIPGywJhIjFYz2wsRUR+ujQEGcgEX26lLLs+Yi+/pP+R
	 RuMcWacCJjUQKMiQZ9lEBYFL6XLbeG4kOTln26EtWvCvSYEtN0LIdGtaifKI2XVG9Ikmh
	 kHwI731QJa2DhJPLTIXIQTxk10QXJ7M0RWpBr4oPCnYf5ols2wUsOEEfzncJl9nE8dYX7
	 qAY3pWd01tlfRoEjX2K1iYeWVnY93uMWr5RWezhT0UHfxlLZ/9P8YjDAfvTYeBzFB3kqJ
	 ExqxCUS3Fxy7oJwVPf2DTkUwapNFje9hFB2V7w3i/CTA6dxQtCaVkQ55SdhdMkZxQfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=REe41fIl;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980B606B10F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2980B606B10F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=REe41fIl
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3869403eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701039; x=1794305839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIqgn31oqWqTiWXF2IW0vHwpw1vMj9WhwN7adf+gUg0=;
        b=REe41fIlYP6iEawO4fIS9TFrTlLe3b9yeYqmG07dZ+jgT6eqhkcjjJwN0tmi0L/Bgz
         qzN0lFUkntSc7Vy5/xKoaZxLbhALxR7S/ZQ8WNY74vATmLyxMI5igbdmtH0BKdbPzA+I
         0pHT5c90HARIuCplctnY0peSvAvGhYmBWBATCkHihLGdGzLMhAw6zH1FbrR427z/SPCI
         lu+bGwUUVX1RwLQWJO0kJPdscekcdjJaBdmOc0Na02060VpxxQAg64KMEp44nwvy8lVs
         81i/o1MIevHNDcM+8eGky+aYaUhTZeTZ0wK5O367ZaLkudNsEVf9zFs94chEbdWz8pP6
         GD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701039; x=1794305839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIqgn31oqWqTiWXF2IW0vHwpw1vMj9WhwN7adf+gUg0=;
        b=Is/749TmKpV8esDciUp72HogP4w5hDwxBnjGiGYK2o95YDOdygNOXUBvpWiaTUSR0r
         DJoiqDN23mnkGR/CLepymRqKvUEYzllIhmganXrSor3HT4IL9T9FTMAhaWXo1LEA8U6E
         lhutjDQfOnzOfslpLWrZkvHoXc8l5EGrwxItD3/D5YinPvsSP/QDq0DfxAFtKyOwrs07
         6bN7aepW8rU8xOB+7d25iFtnD0qHaoSLnU+J2yegducDJEUoA5DmTPyed+EqkOQxyayu
         Bm9257OTs38zXxY1LXH+/zF5XSUoyMKdM9I+sBG/MBdzJWq0NdPAfulciKVR55Sgw9gE
         yUKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/tVnpuWJUXbuxL/9ONhUB4ZFKMJjNxLY2H4bNE8S22Tu5eOYClHmLx0bElMqCAAFGS7ow4BCV6jSj0iE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uawFfkzIVvpJOnNW6CA2OUiGfpXjdb7A11GNIT1FtEsReLHtR
	RXpNE8mN+msqPJtlCeJE/WGjW9VieDa9OSCrWMbCNftAVrM3KYCK1mNC
X-Gm-Gg: AYBFou0OdVIXssWhMQprouQB/s/I0gKEFLsD/gl/AZ3hp4B8Q3UPDUo4Zd7LZvU5nO5
	pcWio204Ik5UICL8OjuykPvHtQg0EtbHB6SGzT4a2skUG7Cej+J5WDzrWG7qnqopQkDhc90MnKy
	K9qJ3WxW1BTVbod9DpXdYRDj0esIJ8OfYEjEwA79er33M3+QpHMAoOtam559ZkWhqusLwFil6SB
	IRnxROwd/engGjfBZlMt1kPb1cvv4LZ9PDvmZzTsbKzsoIEmqPBTE4iJN5LAOoEa0qcM9DtArxA
	QHvgSVFUSxf6xtP48ZwXg3AhnFk7JLHrkfNTKb08mcjaEU7b0fI10h21zkO0LOr8oxl5Xy+Xdxw
	yB19f5jzYBjxqA83dcrW/HgU8ZVv6Jeo4ZXEJC/2ms4puhFZnxUejC+FuXk40c6EjFz3b75D4dD
	siyGxqjclCWfbQ0doINgTcVEJ4u7dVC898oBS/iCcnnz4d0yjWiuTGJF1b8zSIjPvm1AwITiPd3
	vvBSeyQOanDOGa5XKQ38uMwRw2REAL8lnQZqr+1HQEMfvQvNpPNaexz0MaEi52Vb4hDs/UemSx8
	20pTf9eTrvqLQ3HFUu5UHqWUQioXjw==
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36a4232cda7mr18277051eec.6.1793701038947;
        Tue, 03 Nov 2026 02:17:18 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:18 -0800 (PST)
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
Subject: [PATCH v11 01/10] arm64/mm: add vmap_pte_set_huge() and vmap_pte_clear_huge()
Date: Tue,  3 Nov 2026 18:16:49 +0800
Message-Id: <20261103101658.766905-2-jiangwenxiaomi@gmail.com>
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

vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
unavailable on CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to
HugeTLB internals it does not otherwise need.

Add vmap_pte_set_huge()/vmap_pte_clear_huge() to arm64, joining the
existing pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
__set_ptes() and __get_and_clear_full_ptes() directly, so they do not
depend on CONFIG_HUGETLB_PAGE.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/pgtable.h |  6 ++++++
 arch/arm64/mm/mmu.c              | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a474c9fb485a..fe138590972a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1927,6 +1927,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+#define __HAVE_ARCH_VMAP_PTE_SET_HUGE
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size);
+#define __HAVE_ARCH_VMAP_PTE_CLEAR_HUGE
+pte_t vmap_pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_PGTABLE_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 140520b351e2..2929bec8821c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1912,6 +1912,34 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
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
+pte_t vmap_pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
+{
+	/* Kernel mappings only */
+
+	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
+
+	return __get_and_clear_full_ptes(&init_mm, addr, ptep,
+					 size >> PAGE_SHIFT, 0);
+}
+
 int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 {
 	pte_t *table;
-- 
2.34.1

