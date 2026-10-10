Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208323672A5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619142; cv=none; b=k1FxK/5EGV018T1mDLelrgxFvD/t9l05YRdi2Fn4S+j+kuJpFMXUpigz31HJYZoX2j/D5MmPhpiaFCS7Mukps6WYw698g0uewD6uiqI/ORAtkl4g3o1gIkvGcG9wBz46z4GWqQtx3vuGXJSTpyFCauTvsVRbQQemivHgfLjEh28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619142; c=relaxed/simple;
	bh=9DthiTR6M3Z39EBsBt09xv03pdIXMcwhhwwTZB169z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nibOM8s5NMVCZtnqIW9xYPfVDjqEg1xzX3mDtzvspXie4YbBpPs2ekJvdI353H+TgrM4shtSF2vSyvjC64MHqYyIHlJp01M5bH2TknyS35YauFBbEU2te/nGTlIIDLvbM5O8atBRmm57FFqHyfrdbZY4SwhBdy53zs4ywZgrm9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=I1dBNNBA; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="I1dBNNBA"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso228412a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791619140; x=1792223940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41VYVIz+zTmPkAQO5l9k2UXneMzLxonPZ50UDfJ1RYo=;
        b=I1dBNNBAz+btikghqQb9+fs+X3X7wFI87ewqvUdytLtDjlhdMamjVl9oXU7V8AHHIx
         al/wQlfEX4Rtd1jjHbfWkTvl71XhdSHZ2XQby2g5dXCLkiNYR2SWESlE6MGbYDJuypA6
         hoaGQtJmRIlWpkDcBOR8ZkxM9vvr08Scw7ACXsVxX/tUllvEObhtR7XvC4aw+MK+bYj7
         pCIjU3uAeJJLYck5lQmnoVMyD67Q3BxB/Zpkq4ASyJ0aeJUjuuS+iFRefW0t8M4iPgg4
         aABmHsj+n6R26wUgqudUyk9gGdaRw1Y2xkoKfrtzj4g4eWIRyFCJ+ybSNVztqZg+HCLY
         88jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791619140; x=1792223940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=41VYVIz+zTmPkAQO5l9k2UXneMzLxonPZ50UDfJ1RYo=;
        b=Q7LRLOe1CdMN1u81r24aQeK8lJUnt4I/1ozdz98KAn05yP0oq0bimyEPK1PDioG5j/
         i0yWGFjQjNf7TuCZCk5wBAAmvpF7YNDcc9WRiZtfCkeZRcQ7fzZT7m8IB4Yzs3N0Hdel
         6PjNOGpGB0f4tR4aBAoN2ht21MQfZ19FaRbtIVBZba+FzYtpLxCU6VAu/EMMsmbAyBUo
         vXGXPG56xdFuI58XNdYOxkCAMfGD/ydvTItkg5/wgnKsbW/ngD8FMizh4rYuBqzI3Dt0
         lKMjMLIdSKOg/ni2RMgQYDxtYzi5ZdeKT+ltalykk2ZrLRB8H7SPYVPv+qTll4GX1oi/
         fiwA==
X-Forwarded-Encrypted: i=1; AKwUvByVJYB91t8AYpZ+WlBZ30Hq3taOp3tiYZ71N5NttWBtqwxf4Wx5wGH/DqMXMXpxB/N5kNFT165JnrHmsiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzm2A4XL4zHp4sHhd9u9Z2ejN14DuiW2SVf+s+vSEHDcV6MS14
	yplmRjcALr/vRUvxItn+z6T7YGIkRZakMp9xD4pfovsQu5yyGlvGds7FR8RjEPrJe5E=
X-Gm-Gg: AYBFou3rFScgTo1rAwBKxUNboFMxKyT2A5VeV6GpZ7HEKedaC35kpo6etey81pKcqYA
	1jQi3/im4qsfMfufSD72DeIO7NB+CxNIPaLA19sSflCDZe00i0plXcF8k/0M4KWBAknFkpv2ZAN
	owWq6a2JP5o+rhqdUhailzEgK4U6EOpELY9r+239dI1ab2EJ0/5XgqJtGtUErbc6btlOJc3w1b9
	hpGlEMICHf6BfK2ao31qJvTGrVnCaR0iAJv8k/UuTlPIS9WywEjhlUQ1i4ZDL+tJLqD8XN4PmQY
	EO9r97ZB1s8e4UHadIq7QHMa8PDMvudbtz3e3M3rN780nZAYqAusmmotL4YXAKRcwDCZOScmX0C
	ew99yOeWc+7tn2Ffil/awdGCAYUfWBxfL9BeFUHJogJQYZ1GZTcrr5tpijyfzl3o9fDuFPm2m6Y
	w9ZVrsBF9GqFwlhar0nNARhOTwqWnRpuM+DRLfy01J475Dmfj7bHNUL7Zls5J0BR/jgRaUKuH/1
	klje4DKeynGIA/DGB78oU9NuTvoqjPL2ESm/Q==
X-Received: by 2002:a17:90a:d604:b0:3aa:f4af:1e12 with SMTP id 98e67ed59e1d1-3ab3a736ac8mr3952987a91.11.1791619140221;
        Sat, 10 Oct 2026 00:59:00 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab57c05724sm3473569a91.4.2026.10.10.00.58.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 00:58:58 -0700 (PDT)
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
	Lance Yang <lance.yang@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v4 4/6] mm/sparse-vmemmap: remove the unused ptpfn argument
Date: Sat, 10 Oct 2026 15:57:53 +0800
Message-ID: <20261010075755.83339-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010075755.83339-1-songmuchun@bytedance.com>
References: <20261010075755.83339-1-songmuchun@bytedance.com>
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
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v4:
- Collect Reviewed-by from Lance Yang

v2:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 270b5def58e1..07188cdf00f6 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -282,7 +282,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 }
 
 static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
-		struct vmem_altmap *altmap, unsigned long ptpfn)
+		struct vmem_altmap *altmap)
 {
 	pte_t *pte = pte_offset_kernel(pmd, addr);
 	unsigned long pfn = page_to_pfn((struct page *)addr);
@@ -353,8 +353,7 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 }
 
 static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
-					      struct vmem_altmap *altmap,
-					      unsigned long ptpfn)
+						  struct vmem_altmap *altmap)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -374,7 +373,7 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 	pmd = vmemmap_pmd_populate(pud, addr, node);
 	if (!pmd)
 		return NULL;
-	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn);
+	pte = vmemmap_pte_populate(pmd, addr, node, altmap);
 	if (!pte)
 		return NULL;
 	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
@@ -384,15 +383,13 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 
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
@@ -403,7 +400,7 @@ static int __meminit vmemmap_populate_range(unsigned long start,
 int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 					 int node, struct vmem_altmap *altmap)
 {
-	return vmemmap_populate_range(start, end, node, altmap, -1);
+	return vmemmap_populate_range(start, end, node, altmap);
 }
 
 /*
-- 
2.54.0

