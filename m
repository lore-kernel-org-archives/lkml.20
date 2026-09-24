Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575C63D0919
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236711; cv=none; b=NDMpDRiPNyQjIozLjnDh3coxge9uMuzDURJG5jQIwfwPnpIKlAeO9Yvbcy0IYJg1/pI5K5WXtyFmtv6JZdSjg4zuHGgFk5XEAtG06/bxo6dNh9FqeWNc1mvVW8FnH0JUH9aabgQU/BcOvsutTe9YZ3Raup31y08qR8XBj9DdqeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236711; c=relaxed/simple;
	bh=w9n4ef3NCBXWc1DpGUKI/TCXbHtusJ1IfeRhwnKuQ5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kn7W7yrELRSA/8LK8WZHt/x0lMRlmH2qYFrCo6t/6xA2XANoZnYsCf1X/xiX+6BfR5hw+iL8yX54k1bPsG78D6mkw5BKAg9B3Uk/yuAXMgZVJb1rrJ9FJR6mu/ahr13x1jLkWzbLc9PvoHTR65uukO/KFw4a5d3tzEuHpKzrjus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=apwa4PMP; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="apwa4PMP"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso876016a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790236708; x=1790841508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olGfWlX6xVbhFK+fX2D0BitKwIFHB7YuSmffyiYh0rE=;
        b=apwa4PMPQX9k0r1KdrWPu3LCz134Nn2yDQwy6alClA00EGhKo6WxOqNi0O9Qh1rCQY
         mytFoZI9/myBYWAZtpVkwbGL1BOvzLQ6N1wsMfuBRC5qXTWDjoLsbfWLCjplXP31YDuZ
         noDxXwNEyWalZ1iB4XTaop5miJvZzN74E4ryk3SUfkhkS4/wnHwP9Lvt2PRcSBWdepqu
         Svw8Q2ejrFBqW/81nnlmq/IQKNxP2We3Hb84jMO/QSuqLXsVTGvQKcdG0qNXFa25tsUF
         RNO3bl2JSaYOj7WriqTGcaabIDz7DwiLGM0t53kX4k1D7/Wx7+kaavkhNBR6W+61fp2G
         RnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236708; x=1790841508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=olGfWlX6xVbhFK+fX2D0BitKwIFHB7YuSmffyiYh0rE=;
        b=Z29aQK1evIpYi8XofXWYUeUp+pNH7a7vFR6GJFJ7ZdCWwL+vmby7LXXlTpc1ItEUW0
         BtvC6lNHlWmrUocWETttL7BYQSSOC0+kdhnojxXwmz5S2vHI3xhea8KScH5hL4pflr97
         xq8C8en1myG/udxWn4Iz+ldGem3wG8sizS9rvsz1dLuZHQvb6AsPPSbnUBp4GYzjmIi0
         0s8MHwSxwtJkW21vqVb3FfOAM8e3AN+MVQNG1eXYwYU/dmsxqCuNSP4oG7v6a6eqF6o7
         3w3afKSj1ff9xE4R17NNoYpdwGXTQWo3vD+LAXJAA9mABhRe3YoWOqsYtKPCBpqtVtwC
         UrVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrRcgiDu3fUjnFvl+Rb/kbifFOPRIv4SAg61AfhFVi1mxTch79BQmS5t0khqT3UcWz0jSP+RLVnZEQeUA=@vger.kernel.org
X-Gm-Message-State: AFuF++m4LgApqerTcxxiAQ3zsMVVSE0DjrrvHIU6HkEmbCAtCtM+ikNz
	uqvVRGI8kmv9Li0clAN3ILR5LyBC5PVuj+yrq4HH0cT6zP2UYoY9tDMYN4D241gKVao=
X-Gm-Gg: AYBFou1kEbHMaEdYJrkD4w/jB8YpndmwmX68sPpzIYW5LqhylSpDOMr5paNa85nAbgp
	nZJ3n+rvLqBBUYAfywFIYfAup31xW0MYam9u5PNkh/Dj3m1mH/kVI5nkQb0m66oGOvV+YjJI6D6
	o4OiqjXv5Ov5p9mUG1KlcQ5wJ66UTaHnZy7q/Lx03rIysJWfCKc7ZyXjcOaJbuS5v+2461qg1B1
	AUAkH4JoesFj6+/eeS5NypDyW253beW4Y73d79W25TTWeypSzOJiVkrfI0+JNURRxCXTWl1F6hC
	w8jpU3lXOrfUIe2mG+6mYbiL1Kd69sQRVzb1BBbnyrXZ3B4T39vR6tzz74ptuAe0rfeoTpLlcGm
	8HWTNQHQiVg4OcUgpCVwlHnGxvepHGrhWN6sExhtdxGNJ3yUKYioG5T9kXBzIw3Fweeg3jDaVfr
	YnpWnApyrkpTYof3CCU+TTz1vRP/5MgRL+Q+fTgZgAWyFbqYr2VQnhmcCMEEn+bb1/R5PzVf6CG
	wy9eh8XTrHw7fvZB2I=
X-Received: by 2002:a17:90a:2ce6:b0:3a0:a055:1741 with SMTP id 98e67ed59e1d1-3a0a0552127mr324523a91.27.1790236708461;
        Thu, 24 Sep 2026 00:58:28 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972eec92sm3575622a91.7.2026.09.24.00.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:58:28 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v2 5/6] mm/sparse-vmemmap: open-code vmemmap_populate_address()
Date: Thu, 24 Sep 2026 15:52:58 +0800
Message-ID: <20260924075259.2013039-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924075259.2013039-1-songmuchun@bytedance.com>
References: <20260924075259.2013039-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmemmap_populate_address() no longer has any callers that need the
returned PTE.  Its only remaining user, vmemmap_populate_range(), only
checks whether population succeeded.

Open-code vmemmap_populate_address() directly in
vmemmap_populate_basepages(), remove the now-redundant range helper,
and return -ENOMEM directly on failure.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 54 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index a5b47e496322..f5364c1cafe5 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -315,8 +315,8 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 	return pgd;
 }
 
-static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
-						  struct vmem_altmap *altmap)
+int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
+					 int node, struct vmem_altmap *altmap)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -324,48 +324,28 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 	pmd_t *pmd;
 	pte_t *pte;
 
-	pgd = vmemmap_pgd_populate(addr, node);
-	if (!pgd)
-		return NULL;
-	p4d = vmemmap_p4d_populate(pgd, addr, node);
-	if (!p4d)
-		return NULL;
-	pud = vmemmap_pud_populate(p4d, addr, node);
-	if (!pud)
-		return NULL;
-	pmd = vmemmap_pmd_populate(pud, addr, node);
-	if (!pmd)
-		return NULL;
-	pte = vmemmap_pte_populate(pmd, addr, node, altmap);
-	if (!pte)
-		return NULL;
-	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
-
-	return pte;
-}
-
-static int __meminit vmemmap_populate_range(unsigned long start,
-					    unsigned long end, int node,
-					    struct vmem_altmap *altmap)
-{
-	unsigned long addr = start;
-	pte_t *pte;
-
-	for (; addr < end; addr += PAGE_SIZE) {
-		pte = vmemmap_populate_address(addr, node, altmap);
+	for (unsigned long addr = start; addr < end; addr += PAGE_SIZE) {
+		pgd = vmemmap_pgd_populate(addr, node);
+		if (!pgd)
+			return -ENOMEM;
+		p4d = vmemmap_p4d_populate(pgd, addr, node);
+		if (!p4d)
+			return -ENOMEM;
+		pud = vmemmap_pud_populate(p4d, addr, node);
+		if (!pud)
+			return -ENOMEM;
+		pmd = vmemmap_pmd_populate(pud, addr, node);
+		if (!pmd)
+			return -ENOMEM;
+		pte = vmemmap_pte_populate(pmd, addr, node, altmap);
 		if (!pte)
 			return -ENOMEM;
+		vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
 	}
 
 	return 0;
 }
 
-int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
-					 int node, struct vmem_altmap *altmap)
-{
-	return vmemmap_populate_range(start, end, node, altmap);
-}
-
 /*
  * Write protect the mirrored tail page structs for HVO. This will be
  * called from the hugetlb code when gathering and initializing the
-- 
2.54.0

