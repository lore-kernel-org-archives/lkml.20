Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059410;
	b=jEuxkG4f+8g4sAN93O3xAaE6DF+xsyLQCHtmjp2aI++famNfdtYFgJRDVU8pr42aUNUm
	 pHzvUV+bGs6tH+KLYlyuJypvz4gQgs1qaIhZ8vX+JtQ11c2p14kxSwsnj/e8K8cXWroSO
	 4dD055XLygB4M+rcMnebDClda8cds70i1L43Y8x8M8veHMM8tEa9vH9Xy5ZM0mxrtkNUb
	 sR5Wdmz34ZNFjl4OwmjTBIqMZnPaiqgoiGUBk17rl15ra7LB6sKWJ1rNIVD9xSp01jI9A
	 sLK0X9hFUAunf8jwRw/9qQAXj/XutwsqAY3WROrUauW4e6jDze67Mzo15afFCGKf4nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1yTgtDF6jEtnEd1/HsYlbR7LkWEKWDRmQNU783tsnwk=;
	b=WR5bRZc1Breb89RTTE42PpOH/2XrDh3HOPWe6P8KXrqaYrPpgbBKt2fH4/NxTNXIfOmF
	 7IM9zeosHo6/Fti82LrBHIkVZ589St9/4TXxJOMsHcLyglLeWxevsxoWA/094LOKVr7WH
	 boeh2AQhs5JCu2iOegBS7HODETgf931HkHFJXmanlIScu06z/u0jvdhmBz6s3oQ+5mA9m
	 NAJCZmNQE0hJSMAYT7W/uYcBwdXEhEXfOAITgwP8W6SmQYRO8iR6Dq3DgfyuzKWA7RLPC
	 cejzEt/VqsAPmu+P64keTMeQnaUJEFHu5ybNcleI6hqt5sPY8qEj9v4spadn6yIYKyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXZMnelT;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34BC606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D34BC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXZMnelT
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3704d30b84fso1210608eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059409; x=1794664209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yTgtDF6jEtnEd1/HsYlbR7LkWEKWDRmQNU783tsnwk=;
        b=nXZMnelTCa5lTzMpUwlZc58aPmxOtYMeSq3Ai2woI+0UdDexYMnw7ZwfEZxLZgx6n7
         1mIz8dgPrrdHnJWnaV0Q6FDVEHLqIVOFfhawbXKYvv2nyeSBL/VMcjvrEMIbgtqKJMtJ
         IErjmR3tOdmXVYdTGogmCHQURoJ2hSm8dQGyhn3g62jPtZJ3iDGnvnJ2n/BzHZQZVNPj
         h/k85znunZt3RQoCDkCvj/bYiGPt3KJhiL1IXXPh1QZ3snvewZGV2FDwfUuslo72Zctx
         Dp6/QVN8KcmA3omeQmBMc7IHfH7oxW6aLBnegz9Czd/djrvp0d+Nptzabj19quRuuYjr
         BSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059409; x=1794664209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yTgtDF6jEtnEd1/HsYlbR7LkWEKWDRmQNU783tsnwk=;
        b=HBj+aeat9lGXl3Qr7YVOwS770k3/6i8hXf7U2Gasf9vNI7/ZdXLvaD2PRwBi+0codM
         sy8yfGy6+1Clo0RbUlFNowir3/9yFLBUsOlC8qycfG0utJvYNQd2qeXgpw87GjZgKgjZ
         hk/pbMu5N///bd7upeb+L5O2+SYyI4P5YicMPWYbIFdnOWqL2MnHPVMLoVk9+YyPSHyY
         eKb0cx5Kc89SBH52J76T7jhB9k9ugOkjGJiiw+Z72+4M7GJOona50+WkyoCiDygTDF0Y
         R4CCyVVIHXQ4qw1lhg600dxzuc9VWrF1jN094t25N5VXhZKUSB/E+6mifQbjH39U9VvZ
         q52w==
X-Forwarded-Encrypted: i=1; AL+hErEBtia/NRslTK6pXKRwfUR4O7sIAZcmgGuHGx/qn7lv8/cqZjb+NELthd4Uq1zwk5gUnXk7+GmqnGIxgdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LqhYqJ7mYnxQ8mI65gAdv+ZH2LZwfPl8VRoFdhovtywC5r8oo
	Ea8cQjZkc3D6CIqeaUivS7WlC40LXoDzjKGmdvBRCSi7xj2sdKh4EcCd
X-Gm-Gg: AYBFou2cgrkkyD7t2h8wRnH77sW5fQVw0YZ6y7RfLaakbIBe/7iY5hkh0xTXea0Huv5
	tE8bLtcbW8OcUh9oziI/HZe72qRiO7F8B0jcO8SrIOykLtmw99X44xp6MNp5PmSsFYIp4a3CyxS
	R95tRr14+JQRhYqKq448vep8lCGKUoNLzHozmiKpljDtz5HmVJLaFAzMyl/coWPeLZ1c2cSN4yE
	aa0ROx4eY3RCctpGw8hauqGhNROfnPnctxlrPjzOcmwmBhZN5oUYf+4DfC0DL9OER/JHRy3a5hF
	eUkk4RZKubLSw0cfvSscXsNpIjn3qs+zg7Yh1YyD1mrC+RCn/iMJIcrojfz2sxZ+d7ZKz8bqAih
	6OSce8WbzMQZukvjnP8PlLc3LGOAqpoXuLYH0eATAtrz+5NNtPbFwiel2OTQc6JZmhvcC5qXRry
	vkkHlx52AboNf4wQDODH4prunvjQtALXePONHkLSAZ3ANEJA29tb48/zzydLDjxHiOilZ6X3Ivn
	Tqzu1Jn1s4DnZksrLKdctkh3+mH9oMPGMs1FU0fw9iMCICNpjsGheRFkIlgZ4pzt6H1PeoEoyhR
	sNrNM3RKWOQ1dD56DiYHly9Ec19WY8Q5TiPQ2j+l6q9NZPVQFAnEHdrcOg==
X-Received: by 2002:a05:7301:70b:b0:36d:4560:dd38 with SMTP id 5a478bee46e88-36f765216bbmr6889124eec.37.1794059408773;
        Sat, 07 Nov 2026 05:50:08 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:08 -0800 (PST)
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
Subject: [PATCH v12 01/10] arm64/mm: add vmap_pte_set_huge() and vmap_pte_clear_huge()
Date: Sat,  7 Nov 2026 21:49:44 +0800
Message-Id: <20261107134953.748622-2-jiangwenxiaomi@gmail.com>
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
 arch/arm64/mm/mmu.c              | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a474c9fb485ad..ce51c1b9be222 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1927,6 +1927,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+#define __HAVE_ARCH_VMAP_PTE_SET_HUGE
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		       pgprot_t prot, unsigned long size);
+#define __HAVE_ARCH_VMAP_PTE_CLEAR_HUGE
+pte_t vmap_pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_PGTABLE_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 140520b351e28..66b23c78f0951 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1912,6 +1912,33 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		       pgprot_t prot, unsigned long size)
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

