Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811023;
	b=mIyCAZHAof77wGTuTx/Xr2ZACwPGrBLXckWNmImtXiHZE8rYm3duQb8zkd7u2ICFf/8E
	 GFgBwOiOZUiJv3ZPth91j/RldFHGgUkrJgKk75vOstCIQHhHVktdtY7mC+vJtyZ0hVT3e
	 nYoMSVTpkrvubqy5qTdESH16jbtST9VEJXCNfEjlEubfdirrU6+pezQcErwXNPRvOWZu+
	 rmmfi4khPqjt+MfeigmKqw8KFuh2wIYFyF07ixxhqa/99IOz7sRDH/8Ha//HfuQgQplJY
	 0wNj1aFwmivAZAPT9rSQckHp1vBFBeJA8ZnmVkcvg0yUfzEWwBw7oOuhTsu/Zbsn1xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811023;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Og6DL/XuMfc+HEcGtspUv6YSe8N3e770jx9UfiUFD4A=;
	b=Pr8uB945duCR6HZhUBQswHZTVDevt3F9yNIc4RZWD3VdB8tLQkRMyb9QXPgvr7SlS/RH
	 a3SJvM8dCrLsmvXdSDnmZtDEMVdXMx5sReJ/WDWY10I4jpBkVtzyazif9sAS05D/Dda6L
	 fA8qEes/DsE7RH2JueV3Yu5RaA9NQhvRgRziy2JXUSAD9RzJABi2CSARYiuVLdsPd4Mj+
	 qjJ7VPW6vqLpgnRXG/oFJEhUn6qPGS2AvXofMvpTJDC7flhYa/EO7SPfrZ9hAIy2rmU+k
	 KqviMA5d5IS7kq+ZnPovVVA8tgqIVc9l+JJKUoZuZ4CjkHKLk7RQi3hJ9BXPT1flgxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mn1ozcrf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4098B6082BED
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mn1ozcrf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A201F0093A;
	Wed,  4 Nov 2026 16:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811023;
	bh=Og6DL/XuMfc+HEcGtspUv6YSe8N3e770jx9UfiUFD4A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Mn1ozcrfbB74kUJLwIRXRLl6Q+s1pUFhT36GwRuOEzoCaZFwhSv+h+zuN5BDmf9qF
	 ZtGBf952ZuwVhX6OyaO1+Zj1L93iLrN5Nmd4+KJj27+BVwZWw8NsCucDMHEVb8Sb/S
	 1NiOGu7hTF/LbjwmmTNXWDhWQuN2Jipom1/nmo0c2puVYzTsNxwVcwpVW2La3BmsQw
	 oU8hqQwJJqibpZhabMTQoOMmFfm8SqBBR3+PE2bsO/cYB9pAStnoQv21IsN6F6GAiT
	 bw7Cj3PrxLNiG+/zGg6sSraBo7Hyvb+sKLIhSC5/AF1gSA67qfzYb2ts2Pk62lHTCj
	 ZzmedIlaafuEQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 04 Nov 2026 18:50:10 +0200
Subject: [PATCH v2 2/3] kho: skip zero-sized lowmem and global bootmem
 areas
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-kho-bootmem-sizing-v2-2-b0d1a834780f@kernel.org>
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
In-Reply-To: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
To: Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>, 
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.16.1-dev

The lowmem and the global bootmem areas can have zero size, for example
when none or all of the memory is below ARCH_LOW_ADDRESS_LIMIT, or when
either of those areas is explicitly set to zero with kho_bootmem=.

For a zero-sized allocation memblock returns an address without reserving
anything, and that empty area is recorded in kho_bootmem. If there is no
memory below ARCH_LOW_ADDRESS_LIMIT, allocation of the empty lowmem area
fails and KHO gets disabled.

Extract a helper that checks for zero size and allocates memory from
memblock, and use it to skip empty areas the same way as empty per-node
areas are skipped.

Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
Reported-by: Chen Pei <cp0613@linux.alibaba.com>
Closes: https://lore.kernel.org/all/20261026131851.9942-1-cp0613@linux.alibaba.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 kernel/liveupdate/kexec_handover.c | 66 +++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 36 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 2ac5d94f33fd4..5b1797d1289c8 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -829,6 +829,26 @@ static int __init kho_bootmem_cmp(const void *_a, const void *_b)
 	return cmp_int(a->addr, b->addr);
 }
 
+static int __init kho_reserve_bootmem_area(phys_addr_t size, phys_addr_t end,
+					   int nid)
+{
+	phys_addr_t addr;
+
+	if (!size)
+		return 0;
+
+	addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES, 0, end,
+					nid, true);
+	if (!addr)
+		return -ENOMEM;
+
+	kho_bootmem[kho_bootmem_cnt].addr = addr;
+	kho_bootmem[kho_bootmem_cnt].size = size;
+	kho_bootmem_cnt++;
+
+	return 0;
+}
+
 /**
  * kho_reserve_bootmem - Reserve a contiguous chunk of memory for kexec
  *
@@ -840,8 +860,8 @@ static int __init kho_bootmem_cmp(const void *_a, const void *_b)
  */
 static void __init kho_reserve_bootmem(void)
 {
-	int nid, i = 0, max_nr_bootmem;
-	phys_addr_t addr, size;
+	int nid, max_nr_bootmem;
+	phys_addr_t size;
 
 	if (!kho_enable)
 		return;
@@ -861,66 +881,40 @@ static void __init kho_reserve_bootmem(void)
 	 * reserve bootmem area in low memory for lowmem allocations in the
 	 * next kernel
 	 */
-	size = bootmem_size_lowmem;
-	addr = memblock_phys_alloc_range(size, BOOTMEM_ALIGNMENT_BYTES, 0,
-					 ARCH_LOW_ADDRESS_LIMIT);
-	if (!addr) {
+	if (kho_reserve_bootmem_area(bootmem_size_lowmem, ARCH_LOW_ADDRESS_LIMIT,
+				     NUMA_NO_NODE)) {
 		pr_err("Failed to reserve lowmem bootmem\n");
 		goto err_free_bootmem_desc;
 	}
 
-	kho_bootmem[i].addr = addr;
-	kho_bootmem[i].size = size;
-	i++;
-
 	/* reserve large contiguous area for allocations without nid */
-	size = bootmem_size_global;
-	addr = memblock_phys_alloc(size, BOOTMEM_ALIGNMENT_BYTES);
-	if (!addr) {
+	if (kho_reserve_bootmem_area(bootmem_size_global,
+				     MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_NODE)) {
 		pr_err("Failed to reserve global bootmem\n");
 		goto err_free_bootmem_areas;
 	}
 
-	kho_bootmem[i].addr = addr;
-	kho_bootmem[i].size = size;
-	i++;
-
 	/*
 	 * Loop over nodes that have both memory and are online. Skip
 	 * memoryless nodes, as we can not allocate bootmem areas there.
 	 */
 	for_each_node_state(nid, N_MEMORY) {
-		size = bootmem_size_node(nid);
-		if (!size)
-			continue;
-
-		addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES,
-						0, MEMBLOCK_ALLOC_ACCESSIBLE,
-						nid, true);
-		if (!addr) {
+		if (kho_reserve_bootmem_area(bootmem_size_node(nid),
+					     MEMBLOCK_ALLOC_ACCESSIBLE, nid)) {
 			pr_err("Failed to reserve nid %d bootmem\n", nid);
 			goto err_free_bootmem_areas;
 		}
-
-		kho_bootmem[i].addr = addr;
-		kho_bootmem[i].size = size;
-		i++;
 	}
 
-	/*
-	 * Nodes that needed no bootmem were skipped, so fewer areas than
-	 * initially estimated may have been reserved.
-	 */
-	kho_bootmem_cnt = i;
-
 	sort(kho_bootmem, kho_bootmem_cnt, sizeof(*kho_bootmem),
 	     kho_bootmem_cmp, NULL);
 
 	return;
 
 err_free_bootmem_areas:
-	for (i--; i >= 0; i--)
+	for (int i = kho_bootmem_cnt - 1; i >= 0; i--)
 		memblock_phys_free(kho_bootmem[i].addr, kho_bootmem[i].size);
+	kho_bootmem_cnt = 0;
 err_free_bootmem_desc:
 	memblock_free(kho_bootmem, max_nr_bootmem * sizeof(*kho_bootmem));
 err_disable_kho:

-- 
2.53.0

