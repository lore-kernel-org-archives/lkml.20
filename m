Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859167;
	b=ub0wjAjdhF26GOcm5xBjyRI9SCqBfsUuWYF7o8eRMCUzGArcBVzVLr6lU27Lhy+DQCY+
	 DLA2ZMY9Nxsq69htZlC28EBp5qofyWUDR+3qt5Fo5BKjMhY/g8lHUZMM8TJIXA6U22rns
	 lQtdiw94zyCiQbUmz2EP5Q5yMhZXEHHkYpMkcsRY8NGP0lIzClosIX9uSXa3PVFFuec/y
	 B5AI34ceuVx5OkIVXUeKbfc1nioz8sQz6FOHF+AmPUUeqzqM5GD+bfRisFE8zS4cnq+o4
	 83fM8c1MJJUy1l3PeXInnW7AD0qQt1gt0UKA3/tN9ShZRTdltG458qHV7cvYUJ1qyaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Fm/jPwX8N/x42opaK4NB2WSpEb6W0SXK/qEq7+UeX8=;
	b=D5zX/whkp6dwowIzwmHRvbgnGWEKGTQKesYj/+GacFnBWD90otmWO1RWv3ZJcRxWTe0K
	 e2QAaBM2QN2V+wi6e6VHIa5RwQGzurqRr0O5h173FM7Yz+pq4vyUeY1SKdIfMMh/wXWS0
	 zFUQ+zAghl6n0JAIZbYDQ3Q8iZtzCGpiYdhj8g5E2G8po/YRmZ5ct6mH4KtdtRv4HBijz
	 Fh47lhn2wGkYkjkKzcORHVQlC0BoIyGyK3b+36hOI6Rq2N4Mq1AfUCT6PuKcdKRdpBw8y
	 z31h2zDdq68Hf9hMKvmTKU1AjuBp3jdYQTNxbCIL25LzWUyPD4bV+UNcC6nnvBUWLjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fGMX2Mq2;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CCF606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09CCF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fGMX2Mq2
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso700678a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859166; x=1794463966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Fm/jPwX8N/x42opaK4NB2WSpEb6W0SXK/qEq7+UeX8=;
        b=fGMX2Mq2fmZ/1/na2MqAGmw2jeaAk/0UU6SQ184FlJkzfXaUCAEq2UyS0ITdGHgiwd
         NEux/8XLDoyjLNEpyNoBp0fDlp0iaiReCH7tXodHlocFxINLQcpL83BLxTZmpP4qqa09
         UaqW/T5KBDLMkdRtXkYCVSyt2iLFvOVi/X9sdJ/2wyJWe4+gIA6QJoTO7BStztds+XLc
         1+dM+PGygPHt4oTVQYXKQ0R/C6MhwYi3HZKEnLV0Z1Qr/AMlZ/VDx8u+ICaGuvEAsAEd
         Ud2PLn4ly1jILYz660aO/Rlydz4o3elgXP7OjSXxYLq8/KGkyZSIBRW1JiRTu+x7cBFW
         R+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859166; x=1794463966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Fm/jPwX8N/x42opaK4NB2WSpEb6W0SXK/qEq7+UeX8=;
        b=T6nlDJb/2sAe6QT3s691HEEcenbYs5Z2ctFB3hJlfsZEJmYYuUQo7tnrsL9F2oAJ6A
         vbV3eyg0zpLlBFfoBYpZjtSKuPx+AezWU4Bh0q8ukOMplIYog1GlB5miKHl98zC4HWw/
         KKMin5onIpZI6cuxnTZIBRnIDEPWYV6rU4/oR6dcnMPfxokE3rGgmGC+TTpwNlPByjST
         yv6B5TiDqWSEImmHN8/gsMPl6PuoDuUu5auo7JSpnrou6/Md1ocZZa9OhwDn2iliu/Wx
         Lgr/7C3WJonCYXtdI3NfIF1gHet3itHxF1sXPPqYFJ4GjEqmsluddQzyTfzV/Ww5aFV8
         qeFw==
X-Forwarded-Encrypted: i=1; AKwUvByHH2H9UlcUBOwNSPsTzyjmjCfGTMcoO3O0l7s6bumg7JsciPzCJKP6SZ/mBduTroX+6S5lhf/BaR+zZWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pxeBruG3813SLvgk9K4U2Yh7iD9ScldNZT8iXDzPiwUNJSy4p
	8rCN4oC1a4Zv1tevSA4K87PG6CWMOlVp5jhgReC/SR0MTRiZm6xh6+ZPuqHKroyPcTftM63PFDx
	tkipP1f4=
X-Gm-Gg: AYBFou0WRBk9COSC5Mh4y8zj1Fvepo7EywLRcvbLMtDEjpqTl4tR3Gz220dm99H8yvI
	IIMGgiwQny/V3uRA2mrHXz90xsIE/f2ZsGlRTziGT6f+3tySP0krll/xV6pXYjxqL2hpciDoJBL
	0JIvyNuU2RiF8oi7iyk/CxMzPxFkSyUmHCVFJu7lw+fqeTjd7p0BytpF78AWXQMZHiwFKoE0QSY
	GrP1XIP1CkTSxiTfPIkqOyFH7QLFb5a+mKf3uA7B+Qh4nGqlhMtpAmrgQniBzcAWvWJfdrmg1+6
	41tBVXLpJfEFstfYy2xZ3Zu7i6u+9DQdNT+jmn9hONUop9tFg6nHgvR7l6PG2KGxPZWye2KhlHF
	CmTPh08uyxXqf2bUngVvELK0nGDBgCzQ8g/sB7FN13N9nqmjW0OEJ3sStwHSeClrv36521PspFI
	Fyiyyt6GeM7/l0vEnayOmzERdBGS9GBZo7FI0zgrfY+yZySlQhk1oYjKxco7zyHkJ29Y4r+rLA7
	IDQjkzbtyXJIRYvBYFFEXYb6UWLBOZtsqa8+Gkth+etmMsxRm7q85t44qPdCcat2czGdpcfsxUb
	pSstIqk6Rux4+/sXsuJaq0JE4QFStfEMwRtyAe3hqZ2IYd27upl/Vb7um2pqyKUlNg==
X-Received: by 2002:a17:90b:17cd:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3ae8987a7bfmr15528967a91.65.1793859166073;
        Wed, 04 Nov 2026 22:12:46 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:45 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 2/5] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Thu,  5 Nov 2026 14:12:14 +0800
Message-ID: <20261105061217.13302-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105061217.13302-1-songmuchun@bytedance.com>
References: <20261105061217.13302-1-songmuchun@bytedance.com>
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

Whether the optimized mapping can be used is now decided in the
architecture-specific vmemmap_populate() path. When PowerPC has to fall
back, such as on Hash MMU, it can disable optimization for the populated
vmemmap range there.

Add section_vmemmap_optimization_disable() to centralize this fallback,
use it in the Hash MMU path, and drop the radix-specific
vmemmap_can_optimize() override.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Add section_vmemmap_optimization_disable() for architecture fallbacks
- Use the helper for the PowerPC Hash MMU path
- Include vmemmap-optimization.h directly (reported by Sashiko)
---
 arch/powerpc/include/asm/book3s/64/radix.h |  5 ----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 10 -------
 arch/powerpc/mm/init_64.c                  |  2 ++
 include/linux/vmemmap-optimization.h       | 31 ++++++++++++++++++++++
 mm/sparse.h                                |  5 ----
 5 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 8452a2714cb1..df67209b0c5b 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -351,10 +351,5 @@ int radix__create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #endif /* CONFIG_MEMORY_HOTPLUG */
-
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-#define vmemmap_can_optimize vmemmap_can_optimize
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-#endif
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2924604fbb38..63f369d296b4 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -978,16 +978,6 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
-{
-	if (radix_enabled())
-		return __vmemmap_can_optimize(altmap, pgmap);
-
-	return false;
-}
-#endif
-
 int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
 {
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 0e777d7dc332..4d6928f717cf 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -24,6 +24,7 @@
 #include <linux/types.h>
 #include <linux/mman.h>
 #include <linux/mm.h>
+#include <linux/vmemmap-optimization.h>
 #include <linux/swap.h>
 #include <linux/stddef.h>
 #include <linux/vmalloc.h>
@@ -282,6 +283,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		return radix__vmemmap_populate(start, end, node, altmap);
 #endif
 
+	section_vmemmap_optimization_disable(start, end);
 	return __vmemmap_populate(start, end, node, altmap);
 }
 
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index 858311a71b0c..5c09da4df4d8 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -57,6 +57,27 @@ static inline void section_set_compound_order_range(unsigned long pfn,
 		section_set_compound_order(__nr_to_section(section_nr + i), order);
 }
 
+static inline bool section_vmemmap_optimizable(const struct mem_section *section)
+{
+	return vmemmap_optimizable_order(section_compound_order(section));
+}
+
+static inline void section_vmemmap_optimization_disable(unsigned long start,
+		unsigned long end)
+{
+	unsigned long pfn = page_to_pfn((struct page *)start);
+	unsigned long nr_pages = (end - start) / sizeof(struct page);
+	struct mem_section *section = __pfn_to_section(pfn);
+
+	if (nr_pages < PAGES_PER_SECTION) {
+		VM_WARN_ON_ONCE(section_vmemmap_optimizable(section));
+		return;
+	}
+
+	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION));
+	section_set_compound_order(section, 0);
+}
+
 static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 {
 	return section_compound_order(__pfn_to_section(pfn));
@@ -79,6 +100,16 @@ static inline void section_set_compound_order_range(unsigned long pfn,
 {
 }
 
+static inline bool section_vmemmap_optimizable(const struct mem_section *section)
+{
+	return false;
+}
+
+static inline void section_vmemmap_optimization_disable(unsigned long start,
+		unsigned long end)
+{
+}
+
 static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 {
 	return 0;
diff --git a/mm/sparse.h b/mm/sparse.h
index fdbc4cacf91d..9b81a549d928 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -46,11 +46,6 @@ static inline size_t mem_section_usage_size(void)
 	return struct_size_t(struct mem_section_usage, pageblock_flags,
 			     BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS));
 }
-
-static inline bool section_vmemmap_optimizable(const struct mem_section *ms)
-{
-	return vmemmap_optimizable_order(section_compound_order(ms));
-}
 #else
 static inline void sparse_init(void) {}
 static inline void sparse_sections_init(void) {}
-- 
2.54.0

