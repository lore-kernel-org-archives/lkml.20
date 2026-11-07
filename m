Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025928;
	b=Ye2YN7UjvU2v0PEfFO6WTPBITyl+1PkqOKKwGpfHT7gyU8jJ1rBzWuI1TsxsTtmfJEj8
	 WFPaCFjqt4n1jD2cEapIwC0t3p8cVEAH7ggiIWpKrLOLW1VitWVsa4c4BTDtRpcQyxvea
	 2gclQqOp4kczhwM9uaREM5uwNyT+8d6xLw/hwnDt2Kl2mst1WIjng/HYh7n+sOlWDpexU
	 bPSodynT7PvGZoil+YhWGGNCY9Bx0kbhMBtZrLG2rb0Zs6P/spCb8uqNvPLXP2p5C4VSs
	 q8D++vAtqZZMLrF745xGonoDlqDpSWkjljMK75KEUqxganfvrfnzmtI/mojqTW++N0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K3n9ukDrxII5BXz/7vbmrUFxcX10DGV7r2as+LtHfBI=;
	b=KEYZ7J0LUHmwQ/J0Cl9fJeJt43GkYpNxmnm+UKUCvtD2EXYKpFs4isEIfiq8yUhXfSLZ
	 QSsfZW5aPia6762G0QCZRU36rII/XPl9MMVs5Rcj4s467br5XmBYz9pdAaxICptK0MzjY
	 /ON7X9O6oqcqaWxJ9lWYSqnugWEIBZ3Ju8T/xrRNGhxjMpOca3uV2MH8lbccMRdO3GT/b
	 NZRCm6PVLmZ4LxCaXwLDzVeWRo++b5dxiCUMWQUcxpyQgDcURm6yBfLWOQuJYw0TM07KC
	 y68ObJk2Xcgojx/7hcPF2vtr1e60LofYQ7WStOJ/pdVPJp/7vm9ou/v48lRQVhnehjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gfoL6gbz;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5CC606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE5CC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gfoL6gbz
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so530615a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025926; x=1794630726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3n9ukDrxII5BXz/7vbmrUFxcX10DGV7r2as+LtHfBI=;
        b=gfoL6gbz7sC+4qaUUzZU3F5sKIoW7fiqAv6KRiZYSBWtSgSYfRDkFrOtv+KD5f29IN
         DsaAXTM+KeptHJPCBqWi3utmin35YdsAQ2ImiexJJqwlRvawZvZW22oIPzcBZ89cK+Ld
         o3ySrqHddjsknuvfg8VRVgnVHkZQnRGf+Z4aL2rDfPGatJztN5qCWEOquj34aI0/ETgo
         NxryZentDCQo2RAeVimSoDybXeGHScW9+bF0BN2G9rX3J4UaOHpRbXv8OC3DT3tjjy28
         70RV80ChiyVGHnMB60dp1NZYTa31hWk0cYcUKLVTkK6OcHm4ubfX3k5HLd7fDHcCR34Z
         RRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025926; x=1794630726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3n9ukDrxII5BXz/7vbmrUFxcX10DGV7r2as+LtHfBI=;
        b=w46yOpqGbuF8dgeg6Xvtm6nzCq71EZqy4QSuE2E0cSDRZLMPnKG/BQV++kdb3FVXpF
         3jnQnT/yLGXv1foAKArS0+65zbsMEzGJe5+0lGIXBO5ASpA0GJHm5xTqm1MSY903IVCI
         fZGRYxhLeD1LpZKCVOLZLRt8at3RZJ1/a/qsmCZ0MORPHqnYh0jO/1nsZYKqU50oIY5Q
         7VDqxtom96i1mIFyL8QAzsyDngKFXPDD2RsofD4CuV3vyPyo82YFHfQeDilaliy79q44
         NK8VuIm2V/IQjrnyOW2A3P7LrwFdNBbvm/Quf661/ywSmGJlWt8onoSh27UFC4fRjlGX
         CBSA==
X-Forwarded-Encrypted: i=1; AL+hErGnqoUuq1rRhl9xW7llkCRfcmNptHQhFOL7lhqG4cuK5L9kQohqCqdCdZman1S2eGdrJUtvvUFJ9Pw3gyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f4lCgFfl+WR2WDzs0kvantO/N6nyv4P0fmxxYhWr6Uk5pWFOp
	Qpx1ki5rk41Jyo3WRk6XLKWTKdOqdpJdvLDZmSrKb1y1A9yUMJXue5OK0Z/GQUREYLY=
X-Gm-Gg: AYBFou3+5WKR+VhRtwwZpYdi+KiZxdyuPAfbcLmbeDsaec0jTjT+PHnDMNY012nEC0f
	4WY7WaTz2TPWUhu+KB3h1lMkm9wKOBL6TakhPeebCMP15QInxiRQTemdHlnAmoAEOoUrkSvD2DD
	+4c1ox0wTBrZHNmFGFF0Ov9YY9y+J9N4y6ZBrXaOpiAlPHVGgZuzdWy9G2FadgNDF0jtHzmqVmP
	BSlmeUqLFA/ur0b2Ah+eYq9GXycFXMrMQDOgPeUFaCM6W1A2rBaZ+Yr0YP23rOsP3DpYWqKd//A
	aRTEEuOTnaK0+pfKThkfdjvQ3XbV/W9ixjfj5V6s05rCQoBb8lvyDMEAZZsuroonRNmmVCv7S9+
	ql3QSFGjGncW+RWKFR8keZb81S0Al1UrpoamrNVh716ZrYy1mP7Jj095vnLoqVAKrvw3flgaBk5
	oBoTc8zqvvaF3aStDbK24fgzPHgp0+gFP8Solu38ETlXkZGZzqQfSyvd+KRhY5ebiLISHSgj6nm
	oVJLcKHEKxGBBclOaUUgKy0pNv12nj9wNjyyr8DmCPRp3wi7FTQ1R01yPY09AhOee73qZTnx1EO
	Y2NG493YAR6eMGpbciSnJIan5yixX0PQNn6lda2rk+daT9HkwjXhaMhVWsDl
X-Received: by 2002:a17:90a:c107:b0:3ab:36c4:b4ff with SMTP id 98e67ed59e1d1-3b0db6b8083mr4981632a91.24.1794025926246;
        Fri, 06 Nov 2026 20:32:06 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.31.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:32:04 -0800 (PST)
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
Subject: [PATCH v3 1/5] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Sat,  7 Nov 2026 12:31:18 +0800
Message-ID: <20261107043122.25650-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107043122.25650-1-songmuchun@bytedance.com>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
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
Reviewed-by: Lance Yang <lance.yang@linux.dev>
---
v3:
- Collect Reviewed-by from Lance Yang
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

