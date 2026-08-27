Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D1A4503FA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849075; cv=none; b=uzF9YTJjx8uRx1nI31pmjLDC82RjTS5yUyxQeFCPIv24zjKX3OsKrGN4Ov9la28Y8oa/1X5idUsQdlqAAc7AIQNFOqJ8zbHcMU7xSliiBr/8U9yQiqH/D2JfGEPlE2XgCKDj3MJlU92K79Bhljq41p9hks01ODpk85ssAUXtTRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849075; c=relaxed/simple;
	bh=oNUu7Uy4qCZ7ywxZ27PZJHygQFjkapl5eRuKDQ/hMt0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XLyjnt6NSJ1th176+9F29zpPQ/pB13vK7d4gabN91ACQmWErA6B5+9P2A6XOxHShmRq/p7h0VZ4br0UraUjfCev4CYWcS66FMttHv5H6E+MQgZbGWp14saN0GvDVwYdKimkHAw5aQJQg3ZsTnlIaL6WeEM2gg/R80aNUock/GnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ni4rf7L/; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ni4rf7L/"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49b7c1dc61eso6311575e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787849072; x=1788453872; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CyCUbo8ckePbD8MMp0AVVWrvzOSsuGmEZvYz1btlf4=;
        b=ni4rf7L/PCHkxUaxiv3h9g1eFgH6vz3mU+ccXB13M7gyg0eatedBonTZfBBHZYTzu5
         jIuN/HG4eClDHfdVIj6LXwzHuMH+Yvm+ehpM33VdoFOm6bjYNXI9KSiuOnZZv04w+ZWS
         DO2z9MCo0h7rzSoHz/envN41Hazl31wv4NOoPyXqf96dBcLRBV7Z6XvHcICYXAhnR6ZZ
         TTl66eb9OriC3o3t/rclufiDPzN5cXeLdYYd/EOt4Zd6ORf+X01j0chaiFJHb/7l5/Fd
         fe2NOGYaXTCRmNSaVLdAj3p4ECUIyM9uPH56hSAEz35ol6MLSXtNPD1AKY/quqxGbwdy
         GBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849072; x=1788453872;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CyCUbo8ckePbD8MMp0AVVWrvzOSsuGmEZvYz1btlf4=;
        b=R7c21777vkH1YgbN2f+ev1pmp6ncz8L/PRSfgSspXqRK+Ho3qY0MfRo9Ad8PozL/tP
         CIgRLgIg6W69BCD47HOt36Rt5ncvS2QjHqFQxkQ422MSnoZiK98DkyVAxBnIg7N+pS8f
         tcE3VJaFXVN2H/MW5mZWepAsgJHuIsdPl55OzyJnAZd/gWISg80No2uycv0qaGrx8vVk
         k9owJsdb1JOMicIr7R48h8OhoMPFVGb7OLyuPmH0Y5Nt4w/VBY/metkiNdpwO1JSJkhU
         +zwuxgTfMJPchu7RxU8gxhVt6lum/vUOqycxexGoj1o1vN7DievscDYrD7HLjMlH8jo6
         OxPA==
X-Gm-Message-State: AFuF++kpKprAcbeazM/CcRAj13rj6L/kcW7Y5am+D17nBQC7bDJ015n4
	4TgwF4b+8zeFhWEWI44hZ7WGzce330lh0L3YVS8YFce9R6/ZAAM46kKQjYH2qv0Ibt9mZmYGaRk
	RhogbYYFMv/yU/AxGIU3A8PaeuQ9NoVmbcmoZoCaTMmcqndC/EsNn1HwyZFkSFvZZLVF8Pvpghw
	Yytb4gNwQqBlbiubpphR5wjLJTkXzYc7wY+Q==
X-Received: from wmbjq10.prod.google.com ([2002:a05:600c:55ca:b0:499:c422:dc65])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4445:b0:493:e451:a9e1
 with SMTP id 5b1f17b1804b1-49b91c2e150mr4552335e9.2.1787849071663; Thu, 27
 Aug 2026 09:44:31 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:44:11 +0200
In-Reply-To: <20260827164409.3421848-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827164409.3421848-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080; i=ardb@kernel.org;
 h=from:subject; bh=Ad7xQcsBExdRIPTIoeDmAPV3aD58c+p2kqv58VFSn9Q=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWtCZnTXg8WttnEv102d8l2FK3Rr/9F9MrOac9mmRRbMN
 zh05synjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCR3R8ZGV4HN6r+1Xnn9vzl
 15/TlX6wzE6bVrRp4+Z9YhOcTDXmOQoyMhyK2fL8PvNT05AXrElL6hwOTl8j+v/Lg3WbrnpmpMh ttOEFAA==
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827164409.3421848-7-ardb+git@google.com>
Subject: [RFC PATCH v2 1/4] arm64: mm: Map fixmap PTE tables r/o in the linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Without physical KASLR, the fixmap page tables will appear at an a
priori known offset in the physical address space, and due to the lack
of randomization, the linear map carries a writeable alias of the fixmap
PTE pages, which appears at an offset in the kernel VA space that is
also predictable.

Given that the placement of the fixmap area is never randomized either,
a single store to this linear alias region is sufficient to map any
physical page with any permissions at a known offset in the kernel VA
space, including on top of the PTI trampoline.

Avoid this, by remapping the fixmap PTE pages read-only in the linear
map. This is possible because all updates to bm_pte[] occur via the
mapping of the kernel image in the vmap area. A read-only mapping is
still needed for things like ptdump that walk the page tables.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/fixmap.h | 3 +++
 arch/arm64/mm/fixmap.c          | 8 +++++---
 arch/arm64/mm/mmu.c             | 8 ++++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 170c3502d723..9191125738e9 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -112,6 +112,9 @@ enum fixed_addresses {
 
 void __init early_fixmap_init(void);
 
+extern pte_t fixmap_bm_pte[][PTRS_PER_PTE];
+extern const size_t fixmap_bm_pte_size;
+
 #define __early_set_fixmap __set_fixmap
 
 extern void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot);
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index f66a0016dd02..3a8cf6de6a7d 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -31,13 +31,15 @@ static_assert(NR_BM_PMD_TABLES == 1);
 
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
-static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
+pte_t fixmap_bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
 static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
 static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
 
+const size_t fixmap_bm_pte_size = sizeof(fixmap_bm_pte);
+
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
-	return &bm_pte[BM_PTE_TABLE_IDX(addr)][pte_index(addr)];
+	return &fixmap_bm_pte[BM_PTE_TABLE_IDX(addr)][pte_index(addr)];
 }
 
 static void __init early_fixmap_init_pte(pmd_t *pmdp, unsigned long addr)
@@ -46,7 +48,7 @@ static void __init early_fixmap_init_pte(pmd_t *pmdp, unsigned long addr)
 	pte_t *ptep;
 
 	if (pmd_none(pmd)) {
-		ptep = bm_pte[BM_PTE_TABLE_IDX(addr)];
+		ptep = fixmap_bm_pte[BM_PTE_TABLE_IDX(addr)];
 		__pmd_populate(pmdp, __pa_symbol(ptep),
 			       PMD_TYPE_TABLE | PMD_TABLE_AF);
 	}
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..9c1aa838e9d5 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1184,6 +1184,7 @@ static void __init map_mem(void)
 	phys_addr_t init_begin = __pa_symbol(__init_begin);
 	phys_addr_t init_end = __pa_symbol(__init_end);
 	phys_addr_t kernel_end = __pa_symbol(__bss_stop);
+	phys_addr_t fixmap_pte_base = __pa_symbol(fixmap_bm_pte);
 	phys_addr_t start, end;
 	int flags = NO_EXEC_MAPPINGS;
 	u64 i;
@@ -1225,6 +1226,9 @@ static void __init map_mem(void)
 	__map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL),
 		       flags);
 
+	__map_memblock(fixmap_pte_base, fixmap_pte_base + fixmap_bm_pte_size,
+		       pgprot_tagged(PAGE_KERNEL), flags);
+
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
 		/*
@@ -1268,6 +1272,10 @@ void mark_rodata_ro(void)
 			    (unsigned long)_stext - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
 
+	update_mapping_prot(__pa_symbol(fixmap_bm_pte),
+			    (unsigned long)lm_alias(fixmap_bm_pte),
+			    fixmap_bm_pte_size, PAGE_KERNEL_RO);
+
 	/* Map the kernel data/bss as invalid in the linear map */
 	mark_linear_data_alias_valid(false);
 }
-- 
2.55.0.887.g758fc8c411-goog

