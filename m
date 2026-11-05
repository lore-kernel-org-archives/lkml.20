Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859160;
	b=m2ivN+GE5x9F3viIoBtosYFLxa13OP4LmaQUMk+jJPL4cCJ9DZTn+rtM4JJcvSf+CNPP
	 vMroPkorKkIOMb5AJ/n9aDnIdirqo6zIv3q3N4T8RTTcb0Fs/ie3uAuUwUOEVAnTinOUg
	 nLbiuxrhQ/vazpCSvhvJrk7cq1UkXaHzqX+3AxuIgeTxDcnJEAXerZMeCqo8MSr2EBU3m
	 Lk8oKs8eL1F6KlYzCocubCp8gCkAwPPrjMpVS/ky2LSR5hARGBz0gvoMSKkWtspfC33LC
	 NoBP3DWbSAQFGOFz0sOOSeElEM81oqEnSwMsYdeey7Patxb8NskJb1FP7lty1qP01ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
	b=5oMuSk/e2I5O3K90oe6b6TGcbk926Q/C12QqTxsXDoCVf1WO3YznmTvZEe10zo0waQTs
	 IDavVX9TGdXMBrGf6lMMeM5f7FGcHc5HGYZhTwDdpT266vk378fff+ZtNWS9hs8VSCt/f
	 xXbw4t+p56/zZR17q0asCXxcUFx24wVErVvk5+jJrVGmgx4lBThxyy8JuSm3lfm5AemOm
	 iZMQ55dG/MLDJA4ynLZQgS24ZQwT+6ztx9iXJflWmWhaCtpjBl06dcSICrSnznuXiitYT
	 NiGJhxdWNdo6mwiRgTkRZYK2EQnfD1g7v3L7dU74QhWV5Utzdy+HU9WByYKtsTkAq/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=O8eB4jY3;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328F606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2328F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=O8eB4jY3
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1328676a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859159; x=1794463959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=O8eB4jY3AAk9OylRQlWvKWbFC3ooLJA2QNQBz22YQQ+cOlTr8iXjVUDwnvvJw7q9yv
         NY+vGrOmCZTUPIvkfR/ak1fLivYmB9P4fJ1FCWO6dWlrP290BwAL3NDueu3WcGhh/fnq
         Jz9uSTMouw+FL44T5eMuHEpV0/s+prhf3vSmAAKhwelTjgOlpnUkub/yvarAGqnYRd/G
         mVMf0EWQJdzav/yY7Zyy6BWvwT5vWMlcN/lG+aLMMQeaNQiX8mhcpyjJP8u+UIeg9ck1
         hazTu3hJbJ7de2EFbsS/y4sdmzUYmuAL2ZU8VNee7VLMF/xaui6Vdi9878+udFkdjrWc
         OmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859159; x=1794463959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=efVbnr1SgF4mFYHMMXCbKRYpHvycTigO6P+pG7ZZzFWPJGv4NhvZKhZ2XzLwKKFdwx
         3Je+LzHoT0nuRms+3hiucSPua14luoPYupFEJDWl+qvEdKWZGWhvKCTpaDDLN4znVqwC
         zamwEqCW6AqgVwJ9rHYHINFdCZducSB8uhGD0fGrpLTzk0Z0pnzUR3V+yBgoC81O8DJE
         XUzlKuk+doTdliqUZ4GsnElGN9E6ZDcCUfAO3YT52mwV1qE87E+BX3JvLGF2N/9DFFdF
         3qfF3H95X59VRORIked8QU7B0+ulcmHt8HH6wjAr88ys4OaMG9qT5t77TKBFm0gtVzlf
         RSyQ==
X-Forwarded-Encrypted: i=1; AKwUvBz67ZhAM7AoNWVCG7E643WrvR3dcVMTZo3xFc5zgv++JvmXdraO5Jevz4tIUWL2Jj/ezegBCe+xCs9ZSYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XBtmXJc4rFsLxkbz52NpfUZlMWcfGQkEK9bdamkHkrDbVsykB
	Z1BZD7vKdNhbZIjpiUU8uAGc6Dn+VTAJlJVg2Y6KJbuuB/YZgEoAicAuQR7bSmiMewU=
X-Gm-Gg: AYBFou2kXaa4+gSHkjrkRiBcCT8nw5Jl8kSRsJTj+63E/UzP9tjYC7/JX0NHreJDuY9
	8lSe1UVcQeQTvDxKtjGO5lnHVgcUlA4v0gO0TFF0YkndpTgRllJwYS5IHCDnIEecgu3Dl89w/a+
	bV/iZ0YQax9DUsln8F6Iyf0lZbE6Ku0T6FN4tg6ABDJu/OQKfvc6V5wZ3lTuKWo4E+OtvSho+Vx
	4O6NnWC3whZP/sOXFgHeR6rbaOGFDKxomeNDyNT5r0c2Kes6Xbl4wzCZT5W2dRCL7Ar2YRF6Dl6
	Ydc7U9IEQDP3tISxfKTgRc6kpHJVjvuzYfWVBuhf9jayUsPCReqEEsFtbn27lebJwKXGP9nPr8M
	yUte9ZZGPSF+g0NPcWkgC5aJNovvY9pRV58ty53E5ujlNt68W2xnOOznsLYJ+XMYghB/oVf6KFn
	G4EW9FlVUHXWMPned+N3tYbdb7I796PVkGchEEQqAex83ejTDdEHSt+LzC6PFev/ITks6FGONSr
	GpCWzc6NBE+xOQiafSJh9OdrVv8G43lgrZI0it2Zp5HydYTVM6pp3G7f/YAteDteyekggcLZDx0
	5jEGwsYjJtTWMvaUXZQtAj0fMz3J6JKyj4CTyN8G4pfhdjI06RuWz0v+897t5FJoOg==
X-Received: by 2002:a17:90b:3d4b:b0:3ad:eb4c:26fb with SMTP id 98e67ed59e1d1-3ae897c87acmr15846459a91.23.1793859159284;
        Wed, 04 Nov 2026 22:12:39 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:38 -0800 (PST)
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
Subject: [PATCH v2 1/5] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Thu,  5 Nov 2026 14:12:13 +0800
Message-ID: <20261105061217.13302-2-songmuchun@bytedance.com>
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

vmemmap_populate_compound_pages() is no longer used outside
radix_pgtable.c.

Make it static and drop the unused dev_pagemap argument from
its only remaining caller to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  6 ------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index da954e779744..8452a2714cb1 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -356,11 +356,5 @@ int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #define vmemmap_can_optimize vmemmap_can_optimize
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
 #endif
-
-#define vmemmap_populate_compound_pages vmemmap_populate_compound_pages
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap);
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ebac5f9058f6..2924604fbb38 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1117,7 +1117,9 @@ static inline pte_t *vmemmap_pte_alloc(pmd_t *pmdp, int node,
 	return pte_offset_kernel(pmdp, address);
 }
 
-
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node);
 
 int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, int node,
 				      struct vmem_altmap *altmap)
@@ -1132,7 +1134,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	unsigned long pfn = page_to_pfn((struct page *)start);
 
 	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
+		return vmemmap_populate_compound_pages(pfn, start, end, node);
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
@@ -1228,10 +1230,9 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	return 0;
 }
 
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap)
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node)
 {
 	/*
 	 * we want to map things as base page size mapping so that
-- 
2.54.0

