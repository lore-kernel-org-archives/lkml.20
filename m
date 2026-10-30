Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369316;
	b=ZVgKGtEK92J37om0eI5qmptJ6CDng/hOCWEun+7lqEccO9nnXzeLtNYXkQA4kaJinKkZ
	 Ncbkf0X4t8JInleShqz9+HLGLA1tDe1MhvtiWxNAGuSn/ItUDbuTPfpHP7CwwOcW+KxGG
	 PhupAwybc8SDWRxAQPfYn9FloZmJksOp1UznlG9Fn1jXtjYXw6zzsnYg5/e5QwtmnmjxN
	 UzeUFhu/8Ie+stew2zSrRLXzXEJi96Dxsq/MAd545D7SRWCPvkIURP8pO8RWZMFMKW83g
	 +wsICOl0tP9fI3tLM035FcFzinmaIHo2Z6WJpkgdohkp9bhVXeY+LuylDkiJsd87JkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
	b=kX5IqrMN4wZmh0ObzuW6M1Ev6ucJxv19sV7Tu1wfWJtHr22htJxQW1Utd7kZBAXnj+fv
	 ey581E2mi05eMbm4muWeQYMI/EB4a7FKVvCEfqAbuHVUplrwA54nSDBuyBvVhZaajn17m
	 7m/3CsaIOr3oqzGgrFeaF7xayMojOeiHpwPhB7oDdI13RGu4IqQxabNIpuJbhFaBqFpqB
	 rOa5/xMi6ILFSN/X9p2Q73c/heJMWsoAfXSCRaB6Fr+qJV5Gf5qNg7fc7/PVxN54lJ6na
	 zCrCw1oTwK+nCMpVssJcALHlII5hnEa5jFUBC2/kwWsn5XGQ+XMK/ptpzU/SyY8D+qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gbSSMoj+;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7A4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gbSSMoj+
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e985106c0cso7144845ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369315; x=1793974115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=gbSSMoj+i+3E3lV5kkiiczjkNZLjr/tmaMTSNaSbzTd4mZAKoNkUe5ffN+kezZM5ts
         YkVFw7JMIjQB2NxlpAFRbBZb3Q0iU5xNLpu0dzXD55wQBzjqU9ffyxGPmbYGdlvnuF1h
         BrGZGQ/1y8SO8JrslKd6dJDwtXp114IM0UqkUI9tYuHHA/aCwFcCKYEa4YJpeH2WsfYe
         Qnzgzuuan7JOt8ba+xvsn2cdiNkCczfKU05jCWFOpJ6tkiPPtWz7h7LDijJaSoSG2yjF
         ccuGEAZmliuDvVE+QUOLjdmwNsqkc1tp/6S0vC1TEGesyF2cQmJmy7Knh41Dfj/C8W/Z
         o7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369315; x=1793974115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=2kksYXHgV5fMLqlFFHTqqmHRw4IORx3aouxiMdlUugPyGjX2zmFaCIxCQ2APHMWBDj
         4iK6Umv0kmQTFV7wCSlxVjUVaBZS8W1oQv9qFU7koXdL3vE+x2pqGIYHAypytAT1Bet9
         QZ+z+IklDIQvksZf/p+eruQyJUXoW7MuzIaoZy3CKrG/6iRDLQ7dR3X7/YMaVdgMlKV5
         Z+qkrA8l3Oyhi81Cp9uBtGNKAGltkpm2ns4dtMsPggaWyG4ebMzL/T2kLQ1eh2t5t3ec
         DXCQ7C67LMTF7xDD4G/EGYxc57uSJoP39EtQjoWAB859w9Dc7YFSAKyPOP7q/MhTuyN+
         HJIA==
X-Forwarded-Encrypted: i=1; AKwUvBySfOjiXZ+tcCBOcoIWddxM465rfoB+F3JYAfn2f5h//Um6zLEiW1y5xv4r9F+5thwARp/lTD196LloOcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYItRyRMF+Uf1s/TbBiwbxU+Dht9Yz6ea8o2Lth67llzOyxeus34
	4u/PMPy59nq1vM/x9MFTWqWBQJJEPR3FMr0WSSDiUrk5fqyaQgRaPzKbsmenVUzm3W0=
X-Gm-Gg: AYBFou0Wt+Dpl0t8zM2XOr4zMf7ohEiRqoCei5jDARxEWj/RL5ugv8pk6QHw5cQQxZ3
	OH5hYJr0lT3VpXOU4p5qOk5R1XIvQ6aLLFT20YAL4PK7u0b2IjT6aHu1IPlWreGU4iHAHZlAfAO
	xw2gLgz93yE9+Czf4Mvhor4khxmhnEjRAP2UFa2IKx83T7vtisiepdJJoEfMNsI0Y1cpeKQ43yk
	VhdUKbQQSbtadGo9vgRP+ZI9iKPi+1LphqFbGNkKyw2q/fg74EYdwqDjeFOPIRexWgtf3XddQNl
	SzBB5mSEf1NIX0Yf+Fp5l44z2aeyO6dPTY0IVNgioXOTMu/3GER6hMr5UPNqn9oIrdIq1BKEjZ2
	mn4q8V5t5IWVKu8yxkiTF5a1Qbpc8sSM+4SLC5Nk4+tY6ReR0eNqaHWcnCaQn5lrrcJoYtr7mSz
	gVVdQpKXYxfHJf9uuni8o/4yxnIDmMy9BL1mZq3O5b0sz2a+MDmrOvcFciRaQYrR5CsYarGNiOg
	e4CXhXozoAPAiylIW1y7mcOy7djvJ2c6qo2Yu2IiiDMMvYcmWMnc45hZcxFkg+kBr+69pdNgetS
	NzzfmI8m04uRk1JhuiYkBoB03j5kobEES4V2q/dLk1FOYGQWGus=
X-Received: by 2002:a17:902:e5c1:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2eb36414ef0mr26789535ad.5.1793369315295;
        Fri, 30 Oct 2026 07:08:35 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:34 -0700 (PDT)
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
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 1/4] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Fri, 30 Oct 2026 22:07:17 +0800
Message-ID: <20261030140720.1256062-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030140720.1256062-1-songmuchun@bytedance.com>
References: <20261030140720.1256062-1-songmuchun@bytedance.com>
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

