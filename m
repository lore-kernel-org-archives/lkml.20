Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B8C47206E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933042; cv=none; b=JVnmURkZECmJhlecOq4jb/DsWnOLP5ail2ElWeJwk8BPy/euxSDO4M4txtaxO7Y7ykUqhCUTbmCgkMycLARvOkIdROdKLHQAQLeqwF/BH4IDmpdcwFONIkpCmBAup/k4RKMr27efcS5e7NVbdZ5ilyyfnhnutBajXD8tfdYm+MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933042; c=relaxed/simple;
	bh=wgzzxsy58BvqCqX/ilqt4T5Q9dkczW+R9c2r7pwHm7M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZDdIkXwnWFYxv8u5NPAl/pbtQ72hZm+vWBafULRDzwOY2W8A+k5i24iTiZQ1Hb94b0F8LrxF14DZmaYJ+t+aQK7MpOx/pIxKG2qNmOKtSjy6v0xolInhTk8iRppfg9fhPHHVrvUM8wBW0mhhsZtzqU/RnFtZUXdciD58k6U0eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=BLkWGEd9; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="BLkWGEd9"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8961cca9193so28158767b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933039; x=1790537839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0WQSV2M4dYwT0nemuMW5I3vbKfQKNkPtdhJ2W+zZzFM=;
        b=BLkWGEd9plcD8ipUKaaRYEGEuDCeuIpJhlWWBYIW/i+MQbBZXwIa9GTAmNKfiJbT+G
         L3IZU4H280isE3pE8wxVp7iyzWeQ3Bck/FcArcWAxUYb8VpOO2eC+dm3jrd8wB9dfV9s
         +KtlaQKJKcLhPLTzl9t24QWZn4UJd0Vr0ItkHRyTABWgiEGFLvMb8HAsxPCyitUokHKg
         FRLtUysbbul4b53uVAVdyx874xF445BmMiqDdguriBa7lGO/sGnx8dCoB5VN4Yc5bm3S
         NeGTyToz7HZULa2JHFqvtdskM83gNa3ckTFH6H6+TTyFIoFcEYe61Erm1OQ+pzZRM26z
         hzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933039; x=1790537839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0WQSV2M4dYwT0nemuMW5I3vbKfQKNkPtdhJ2W+zZzFM=;
        b=OyZ5Sdv4uH8jo+KWi6rcOO0CpPPvKDtBsddgLGZrRenI4t1Zm/3rjSrGowluE1AOj7
         6Okkl5QRCqTA5qr+z7TsaDbiHz0uVVhEIzOIyQ5oHqi8n9JoVPTtHkkOH1MYkpfwjSxE
         hLPLPeJtayd2lPopQ611qJE0ZJQHShkSnztqYaizAKdN6sHq87Ub4IBR8jIhbwzkY9fI
         DxIDPR9YLq//lFX2ZcKEraINCsFZACDciFTjg8rsvALcUNlz3uo36bC1Wwu3vZYMugoS
         YnYKgYmW5rCQuHeoeV8GK2kXN8gtQ/ng4cxGlS5fhn+k9GyRw1izyt3nIGpGdTA8ESaK
         WoQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBLW6MqJypZIObX4culEnTWA/nAYZzavkBOx96qTM6nsFwRXAraEiqxutEhHwjDVAk1CzxEK+v+gWKzFI=@vger.kernel.org
X-Gm-Message-State: AFuF++mpk6394RdtWFeQw52wznDKnUHyHOiEaU3Oovzfbsr+MRYRFgUR
	NSwDhh9CrIAxI9l6QsdOgmS5EQC88aSknh97AyQjg7C9x4Mfb4wl42PSa2DaFxdfl1c=
X-Gm-Gg: AYBFou0BsuqtLpGn9Ezmy3UlNsaXPzGJFPFuN1fCEjf+EA/FcRlIRpzWecvZxcxWe5N
	Vehv+ZiBCTzfgdSlY4/6tHfVKLbKm4pZtcuvEtuZ4qPvPxCTun0NzOMUCi8adr2cJbnQlkPluh8
	d2zCdiOaJGZ2VkgUBZfYvWxPM59BJ7dpUES2t3coZRLIyicQ6ddmfCpNksz3Bd3XuGmtRpSFtt7
	pC42qiT+V65bPu4DWCtmGJChVIuoFwF/V2Guw6VAZQf7H42N2hNvRPfs6DpkIkQ/IWM/VYeGY77
	O1tOVpytUsKdINhyuGc3tb582WHAOeaUYtUtXEitB71bP4fRR0KtDYZKswufDI2WBns2GM7UWzj
	mJ/jglCJZ20KPhXFxVY6dT7Tdr3zeOMet0/3f7ySzoXjdxBWpoVfGmCLIKG3c/iTSlK/HT9ooLD
	INnUt5Lkb9DpHMONN6d6H4bb16rR7E/kfWlTi//Nxj8IVuU6K29sR1LS9AQ1403Z+y55ueNc87y
	zCvEGTEd1b24S6a9v4JuG41NhuMGgcPpA/fSc+Mpd9ZvEHbTqpB9NQylASt6DvEPYYn/QDByVgG
	nwZtUGu37yFOjzvvgRc=
X-Received: by 2002:a05:690c:e1ca:20b0:854:9062:73ae with SMTP id 00721157ae682-89736b3f795mr32929267b3.33.1789933039155;
        Sun, 20 Sep 2026 12:37:19 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a48d99122sm18294247b3.48.2026.09.20.12.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:37:17 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	legion@kernel.org,
	kees@kernel.org,
	will@kernel.org,
	ruanjinjie@huawei.com,
	atomlin@atomlin.com,
	rppt@kernel.org,
	jani.nikula@intel.com,
	hamzamahfooz@linux.microsoft.com,
	joey.gouly@arm.com,
	tglx@kernel.org,
	nsc@kernel.org,
	alexandre.chartre@oracle.com,
	james.morse@arm.com,
	dianders@chromium.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	shuah@kernel.org,
	catalin.marinas@arm.com,
	linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvmarm@lists.linux.dev,
	jaredwhite@microsoft.com,
	johan@kernel.org,
	pbonzini@redhat.com,
	mingo@redhat.com,
	linux-mm@kvack.org,
	seanjc@google.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	tarunsahu@google.com,
	gshan@redhat.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	xur@google.com,
	djbw@kernel.org,
	oupton@kernel.org,
	nogikh@google.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	zengheng4@huawei.com,
	peterz@infradead.org,
	corbet@lwn.net,
	suzuki.poulose@arm.com,
	luto@kernel.org,
	hpa@zytor.com,
	zhangpengjie2@huawei.com,
	x86@kernel.org,
	yuzenghui@huawei.com,
	jic23@kernel.org,
	ardb@kernel.org,
	pasha.tatashin@soleen.com,
	petr.pavlu@suse.com,
	ryan.roberts@arm.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rdunlap@infradead.org,
	kvm@vger.kernel.org,
	fuad.tabba@linux.dev,
	maz@kernel.org,
	mbenes@suse.cz,
	jgross@suse.com,
	seiden@linux.ibm.com,
	pierre.gondois@arm.com,
	song@kernel.org,
	nathan@kernel.org,
	pmladek@suse.com,
	graf@amazon.com,
	chao.gao@intel.com,
	zhenglifeng1@huawei.com,
	arnd@arndb.de,
	sidnayyar@google.com,
	linux-arm-kernel@lists.infradead.org,
	vladimir.murzin@arm.com,
	kas@kernel.org
Subject: [RFC PATCH 04/46] x86/mm/ident_map: Add force_pte to support 4K PTE identity mappings
Date: Sun, 20 Sep 2026 15:36:08 -0400
Message-ID: <20260920193650.3373435-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
References: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend kernel_ident_mapping_init() with ident_pte_init() and a force_pte
flag in struct x86_mapping_info so callers can request 4K PTE leaf
mappings instead of 2M PMD or 1G PUD leaves.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/include/asm/init.h |  3 +-
 arch/x86/mm/ident_map.c     | 72 ++++++++++++++++++++++++++++++++-----
 2 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
index 01ccdd168df0..d9caed494e7d 100644
--- a/arch/x86/include/asm/init.h
+++ b/arch/x86/include/asm/init.h
@@ -6,10 +6,11 @@ struct x86_mapping_info {
 	void *(*alloc_pgt_page)(void *); /* allocate buf for page table */
 	void (*free_pgt_page)(void *, void *); /* free buf for page table */
 	void *context;			 /* context for alloc_pgt_page */
-	unsigned long page_flag;	 /* page flag for PMD or PUD entry */
+	unsigned long page_flag;	 /* page flag for PTE, PMD or PUD entry */
 	unsigned long offset;		 /* ident mapping offset */
 	bool direct_gbpages;		 /* PUD level 1GB page support */
 	unsigned long kernpg_flag;	 /* kernel pagetable flag override */
+	bool force_pte;			 /* force 4K PTE mappings */
 };
 
 int kernel_ident_mapping_init(struct x86_mapping_info *info, pgd_t *pgd_page,
diff --git a/arch/x86/mm/ident_map.c b/arch/x86/mm/ident_map.c
index 5a15bffe6574..83013513ba94 100644
--- a/arch/x86/mm/ident_map.c
+++ b/arch/x86/mm/ident_map.c
@@ -77,24 +77,73 @@ void kernel_ident_mapping_free(struct x86_mapping_info *info, pgd_t *pgd)
 	info->free_pgt_page(pgd, info->context);
 }
 
-static void ident_pmd_init(struct x86_mapping_info *info, pmd_t *pmd_page,
-			   unsigned long addr, unsigned long end)
+static int ident_pte_init(struct x86_mapping_info *info, pte_t *pte_page,
+			  unsigned long addr, unsigned long end)
 {
-	addr &= PMD_MASK;
-	for (; addr < end; addr += PMD_SIZE) {
+	addr &= PAGE_MASK;
+	for (; addr < end; addr += PAGE_SIZE) {
+		pte_t *pte = pte_page + pte_index(addr);
+
+		if (pte_present(*pte))
+			continue;
+
+		set_pte(pte, __pte(((addr - info->offset) | info->page_flag) & ~_PAGE_PSE));
+	}
+
+	return 0;
+}
+
+static int ident_pmd_init(struct x86_mapping_info *info, pmd_t *pmd_page,
+			  unsigned long addr, unsigned long end)
+{
+	unsigned long next;
+	int result;
+
+	for (; addr < end; addr = next) {
 		pmd_t *pmd = pmd_page + pmd_index(addr);
+		pte_t *pte;
 
-		if (pmd_present(*pmd))
+		next = pmd_addr_end(addr, end);
+
+		if (!info->force_pte) {
+			if (pmd_present(*pmd))
+				continue;
+
+			set_pmd(pmd, __pmd(((addr & PMD_MASK) - info->offset) | info->page_flag));
 			continue;
+		}
 
-		set_pmd(pmd, __pmd((addr - info->offset) | info->page_flag));
+		/* if this is already a 2MB page, this portion is already mapped */
+		if (pmd_leaf(*pmd))
+			continue;
+
+		if (pmd_present(*pmd)) {
+			pte = pte_offset_kernel(pmd, 0);
+			result = ident_pte_init(info, pte, addr, next);
+			if (result)
+				return result;
+			continue;
+		}
+
+		pte = (pte_t *)info->alloc_pgt_page(info->context);
+		if (!pte)
+			return -ENOMEM;
+
+		result = ident_pte_init(info, pte, addr, next);
+		if (result)
+			return result;
+
+		set_pmd(pmd, __pmd(__pa(pte) | info->kernpg_flag));
 	}
+
+	return 0;
 }
 
 static int ident_pud_init(struct x86_mapping_info *info, pud_t *pud_page,
 			  unsigned long addr, unsigned long end)
 {
 	unsigned long next;
+	int result;
 
 	for (; addr < end; addr = next) {
 		pud_t *pud = pud_page + pud_index(addr);
@@ -108,7 +157,7 @@ static int ident_pud_init(struct x86_mapping_info *info, pud_t *pud_page,
 			continue;
 
 		/* Is using a gbpage allowed? */
-		use_gbpage = info->direct_gbpages;
+		use_gbpage = info->direct_gbpages && !info->force_pte;
 
 		/* Don't use gbpage if it maps more than the requested region. */
 		/* at the beginning: */
@@ -129,13 +178,17 @@ static int ident_pud_init(struct x86_mapping_info *info, pud_t *pud_page,
 
 		if (pud_present(*pud)) {
 			pmd = pmd_offset(pud, 0);
-			ident_pmd_init(info, pmd, addr, next);
+			result = ident_pmd_init(info, pmd, addr, next);
+			if (result)
+				return result;
 			continue;
 		}
 		pmd = (pmd_t *)info->alloc_pgt_page(info->context);
 		if (!pmd)
 			return -ENOMEM;
-		ident_pmd_init(info, pmd, addr, next);
+		result = ident_pmd_init(info, pmd, addr, next);
+		if (result)
+			return result;
 		set_pud(pud, __pud(__pa(pmd) | info->kernpg_flag));
 	}
 
@@ -189,6 +242,7 @@ int kernel_ident_mapping_init(struct x86_mapping_info *info, pgd_t *pgd_page,
 
 	/* Filter out unsupported __PAGE_KERNEL_* bits: */
 	info->kernpg_flag &= __default_kernel_pte_mask;
+	info->page_flag &= __default_kernel_pte_mask;
 
 	for (; addr < end; addr = next) {
 		pgd_t *pgd = pgd_page + pgd_index(addr);
-- 
2.55.0.1082.g2b9226bbc0-goog

