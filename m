Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E83399899
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789288856; cv=none; b=T/etfIzacb8rQ2VAyJyFHawiLIWahDPfNEeQbjd8TOIGSOPcNcUzjX49SYewrsiqUybvSUVpYMZLDXkaoHyxZCmI8OPMuaOYv5kuf2OPEJ2XHACxAfo8F+mB8Tnk12xZpKFSC03E3b7M9grBBHSSYoNr4gGb0tcjNlhG4wugVCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789288856; c=relaxed/simple;
	bh=/8FgzHcTZ/464WLDLVtJ3/FReb0i6ycqD70HvC5SVjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgCvm1ODvWjIyhi5lZfOJ3qy06qe96jdpoIxCtyvx9INot+eealFxYUXWGgGZfT9bhd5icMS792NEEAspXMy5T74o17aY4d51VvIKbBMnbzmxH4gEAxbhgQH7Eq5i5uQG+7Po681xllVK9tB4IzI8/BNxAQ/KtoLkhWp2Dpekns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ng1TavRG; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ng1TavRG"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so1673491b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789288854; x=1789893654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHX0G+rfBcj3IGbPNWjgGAyawAROo7044LYJmYZedOU=;
        b=Ng1TavRGn0VMfqPz+E6W3dTa8vriED6Ndnlc0C4W1Z5xCah9KYlwzFMprBKGSjPDQn
         0fSGEzO2Gp+jx63lXx119AzeodA6Q7uylZUQYAtqPTmpwdsixbGyDykd7GnjAbldkOVB
         LNEN+NrxYdsbvTxrcXHtNwg27+cT1trds58cUeGjTEgX8lEHMehKEA0SQFanDEJnJBEa
         0i7fTdMTlugrQr+0X+s6KSKn+DTEV05+k8v8v5dKot48NOZTFLJqhKcPWLCHvrscl0Vk
         K/wC2GKuwb9yjnRDRGNY7B7Niv480853punZuQ+1sa557/k+tIPQEcH5ma9QoFsvHen4
         NzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789288854; x=1789893654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kHX0G+rfBcj3IGbPNWjgGAyawAROo7044LYJmYZedOU=;
        b=Pd6BDB2JCR3WwckLlvWexhg0fEdY9qzpJnUlbRPpb/uQZPffx5hPzWezHu8fr5H4ck
         bLE1n+H9sVG8hNNV5SEO7+xHzzCh0kEog1smpahG7zIntnv720zMcx7jCuJP3UZ9xV0n
         RnAq9cWqzK89J3gcJeKbKFY+PI/aXuIWh47cwp9AkDdFU6K3RdWBOPUby/F/7xhM7MUS
         jSzu/KYqHCFLHBs3fGp+6JQ7wFGsFAogNTHmUQUUZKTAwMY0pCnbiBgRFHCoaw0Z+UXA
         WUqhNK4xQmutj3xSnWLP8QIq0hAOrUosiiHuJG+ogRtNkzfl3MF6jfblMXNnt+g2evYD
         amqA==
X-Forwarded-Encrypted: i=1; AKwUvBxHEZ624bWLxOZQRv5DRjdopdTyOOrDCi7Ue0iwM6NzIhBv5q5KCDY8yW3a/aqUDjvP5kvHfqz9G+iTVwI=@vger.kernel.org
X-Gm-Message-State: AFuF++mp1ePYLE4/GDEwIQPyCDf2l1KmgvJxD6Tgqw84904Lln+PoQtW
	cwGj2nczw3sNA2u6h1jLLz1WX3QQpW53gW6Bxf3MzSrw51MzGJme8NmXIAJzpW7TNms=
X-Gm-Gg: AYBFou1L/XQmpHNCzY/l0xUBuBv6niYJj28+c5tqmhoc8rFIgG68RnHhOfZf8Xj16dN
	4fl2bLEjFvEkyUu7ojmu8MohoFtnU27KqDWVF8HCnPMhSo74wA1z2FYJMoUuXLeN0K3CEz70pfq
	DcGknNwHzQbPjgZiwqrrf6tFAYC57QOOeaGNos8c/4SxU9KlVTzX0VDbV3ampBv8+6WTsNsnGf0
	5snYOFrhHgTLRj7xrKstA/ULk7i7uMvnqO/x50VIEmVNXOG9feM8HNi/dVcgutcQdxllH7W2JgI
	erCD+LVWIl4/UU2szYwQNDFZnIecsV0HuKwcpwl7ZyHGCtK4lzmiorjE8YLHDesanZAmUJ5uFJy
	SMXR2oRBRyyfY4S/epNnNYdIX/D7gDROBgTaaM6AUZKy/hLQYnSeDCp11kZgg6fNXZfjR+uStnR
	9T5Aw3X1kJ2OrFTXUfi3aeTrQAcLVMB2zrIqiOy0LQE65XgXAmH6BqKD1U04hP1lasbNiS2HDQV
	3ZM3jpwqhoxqxVufEIidSJJE8s=
X-Received: by 2002:aa7:9304:0:b0:86a:9be:6bf3 with SMTP id d2e1a72fcca58-86b31704588mr20617548b3a.23.1789288853781;
        Sun, 13 Sep 2026 01:40:53 -0700 (PDT)
Received: from G6L4RL2QG9 ([2409:8a00:1832:cf0:5137:990:100e:cc7e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb0d3sm3070531b3a.42.2026.09.13.01.40.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 01:40:53 -0700 (PDT)
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
Subject: [PATCH 4/6] mm/sparse-vmemmap: remove the unused ptpfn argument
Date: Sun, 13 Sep 2026 16:37:32 +0800
Message-ID: <20260913083734.86802-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913083734.86802-1-songmuchun@bytedance.com>
References: <20260913083734.86802-1-songmuchun@bytedance.com>
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
---
 mm/sparse-vmemmap.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 028f844c90f5..8b4904d9c65e 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -233,7 +233,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 }
 
 static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
-		struct vmem_altmap *altmap, unsigned long ptpfn)
+		struct vmem_altmap *altmap)
 {
 	pte_t *pte = pte_offset_kernel(pmd, addr);
 	unsigned long pfn = page_to_pfn((struct page *)addr);
@@ -304,8 +304,7 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 }
 
 static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
-					      struct vmem_altmap *altmap,
-					      unsigned long ptpfn)
+						  struct vmem_altmap *altmap)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -325,7 +324,7 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 	pmd = vmemmap_pmd_populate(pud, addr, node);
 	if (!pmd)
 		return NULL;
-	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn);
+	pte = vmemmap_pte_populate(pmd, addr, node, altmap);
 	if (!pte)
 		return NULL;
 	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
@@ -335,15 +334,13 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 
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
@@ -354,7 +351,7 @@ static int __meminit vmemmap_populate_range(unsigned long start,
 int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 					 int node, struct vmem_altmap *altmap)
 {
-	return vmemmap_populate_range(start, end, node, altmap, -1);
+	return vmemmap_populate_range(start, end, node, altmap);
 }
 
 /*
-- 
2.54.0

