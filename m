Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4BA3C3792
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660024; cv=none; b=rdOSnJpOFCbpEDgwH/8wgzIsb7DHH/EwVQB66eIG5Ml2dkUf8ioj5GptR+j2AiWh+tgL40+gSvhnYJ/WGIw4UULa02ecexnueNRCzre+AqbdMJTs4NydaRckbxcycYaH4zw4hX6j4A22Ngra+AwnfdoGQUoSxbXP2naLnCqwl3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660024; c=relaxed/simple;
	bh=5a7uupD8uJa9QtfZfd3o7fCvQvdeqG39Zf7YLTYcQ20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzyV1FFVHRkEYBwlBLb73xRA4jgdpdlDdTLIkQuyWc5kClCkGzB7lEOIOsgjyk9LYDaN/PxSLi+4O0qiSnBYdo8NxSn+TGOC5cUE2nziE9XlNkaQ73Gbu2UJ3KMRo07M+ujsArRuEI02n3LnMFkTUPg2s3CY/ipc3WGHhi1ZSEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ev3LSZdV; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ev3LSZdV"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so15073075ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790660022; x=1791264822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJAndcCm6vhI/WUnYbFErakp824Wpkra2IAgLjHGuUY=;
        b=ev3LSZdV1U3FPCRWjaq1Sjck4x6gbY1qREzpXclshB3Mq92PfZldRh20anz7eP9x3O
         eMhDPgLGg6BOb/OeqSutbAxyTv4y3f08uajl+BeEUstSSKri1VzIlZtrpeRJP4XEdgMG
         VjVzq/LCLBywslPKknn7keEzoLqeMCPsr0qXQpj6uj64+RYjXXn/9D9wBuRCxHv0Q6Hk
         S3xyo8Te8Cbf63y8qdkLyrE+Tw9YQt9GM7vS6TgQV2o48Di03flhvRWhS/HVxRHQ5oOS
         MiKoOS95MkPF3K/45EoRwLWE0Ty/b4F4el+F6cn/5/Uh16w5ry50qsPou+Oqyg8UFgEJ
         ixQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660022; x=1791264822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJAndcCm6vhI/WUnYbFErakp824Wpkra2IAgLjHGuUY=;
        b=ezjMVHquXM9vIFvAiMw1f0jfj9S7p15+BSRATLxKEAusQVbYaMxumAS9KZ5DwoUkMO
         UqeEv+XKZmOmDDKXSyE8qqITvx5Rp69iHzR0Zl8IWhPVDHTXCOcO5sz6V1MzCpmCuCTT
         cq4Emcr/pDO5yXdhhgsf/boW0ZkbunOaIlAMmIGAK2X6k6DmvD60n157Vifr3zSIjGDa
         dkJDrKU2uNB1qv27YylQlFGko4QU03SRR0j9vkhMje7pIyyJMfU3+k7YufsyePyYa7lR
         7LS42I+8HyU/HQnO8MEYs2ebMHhu61SLWylxJC0O0Oxqqt1fLBGpRckKgJiEOEbuXest
         ZsBA==
X-Forwarded-Encrypted: i=1; AKwUvBzanerUAUCPVJKtllX6/N4M7rti9n49Hj+mWupxZUXu/w5bk/a39iJHLuMDWiNXuZ3obxWdtBlHMCJI8Ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc4748a7ZRQwrZlfGgtkoxYxqT35ecnkvwhM/0vsILGSonmxbY
	ewN4GtZ1A6V+0RAVD2RYaGpLzPFsJgCES+tCtSjYRJanu0g8rzwnTr4CVQbEbcujatQ=
X-Gm-Gg: AYBFou2ZVlqmOTo0bm+gl1jRe60QwfLe11HjgozQ6SN8yyzA2ercxD0MhkCay4Uv+fT
	7pnT5C955zEFKFwQXaCYiwtEm0utSI7T/kpvq3ARttMqs+NBMuH2gbsjKflSpbXD2IBWBXRgwTz
	UBBX3cTNu/b+IdByc026bh9O8EA4yZ4mnmknuWIHmsg806pu6n25tebRbop5SMv4pTB/nGAbIvX
	zzmOzcqf+vD53zWxwQLUbNCBRM6UzAFsL2MAz88CAVT+drklxcuA6HFdpogsFdZlHhH8Z1BdqOw
	glyMOX2M9NS7qh2GPKPpDzEWLMgspcjcHLNyUwZjEZt2kolGz0QJTLAKoJoc3Bj5sMUaCdLHii9
	yTYrZoHKwvApmzyYtuDb8Zl/txyiQto9if/sg92oyyqgmxsPT3RsDI4gCnY+NRWmbysb3D3Lr3s
	pRzhHFOmcsc2lzMsxMLqjSwmZ9IpuD100dHNBT4AhdwJeoCkul3jgln5fAIdgWCsxOaSeEiavt7
	LO083VDjPT/mfLWkZ8=
X-Received: by 2002:a17:902:d54f:b0:2dd:c100:7ccd with SMTP id d9443c01a7336-2df7dd8bb87mr125260505ad.73.1790660022267;
        Mon, 28 Sep 2026 22:33:42 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bafesm49251765ad.51.2026.09.28.22.33.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 22:33:41 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
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
Subject: [PATCH v3 4/6] mm/sparse-vmemmap: remove the unused ptpfn argument
Date: Tue, 29 Sep 2026 13:32:29 +0800
Message-ID: <20260929053231.66085-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929053231.66085-1-songmuchun@bytedance.com>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmemmap_pte_populate() no longer uses ptpfn as an input. Drop the
argument to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index dee95e520376..5fd2df2b516f 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -278,7 +278,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 }
 
 static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
-		struct vmem_altmap *altmap, unsigned long ptpfn)
+		struct vmem_altmap *altmap)
 {
 	pte_t *pte = pte_offset_kernel(pmd, addr);
 	unsigned long pfn = page_to_pfn((struct page *)addr);
@@ -349,8 +349,7 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 }
 
 static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
-					      struct vmem_altmap *altmap,
-					      unsigned long ptpfn)
+						  struct vmem_altmap *altmap)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -370,7 +369,7 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 	pmd = vmemmap_pmd_populate(pud, addr, node);
 	if (!pmd)
 		return NULL;
-	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn);
+	pte = vmemmap_pte_populate(pmd, addr, node, altmap);
 	if (!pte)
 		return NULL;
 	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
@@ -380,15 +379,13 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 
 static int __meminit vmemmap_populate_range(unsigned long start,
 					    unsigned long end, int node,
-					    struct vmem_altmap *altmap,
-					    unsigned long ptpfn)
+					    struct vmem_altmap *altmap)
 {
 	unsigned long addr = start;
 	pte_t *pte;
 
 	for (; addr < end; addr += PAGE_SIZE) {
-		pte = vmemmap_populate_address(addr, node, altmap,
-					       ptpfn);
+		pte = vmemmap_populate_address(addr, node, altmap);
 		if (!pte)
 			return -ENOMEM;
 	}
@@ -399,7 +396,7 @@ static int __meminit vmemmap_populate_range(unsigned long start,
 int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 					 int node, struct vmem_altmap *altmap)
 {
-	return vmemmap_populate_range(start, end, node, altmap, -1);
+	return vmemmap_populate_range(start, end, node, altmap);
 }
 
 /*
-- 
2.54.0

