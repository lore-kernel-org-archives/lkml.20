Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811026;
	b=gauLRBV2xt+4LBDghQBS3CZrQ1LNrJeYpFzk2gnPmKdxrijr7JAs2PpFLH+kih34qVC5
	 vhk1ZARhF1S3zKjj82IX8errC8YmlrPGmwHCWuulKSHVPfhrJ5Q5MAXHbs3mRLK+ZfSLL
	 hGIu2uTTOyNyaPiuMf7w2suWWJcYEM5H4bOTF+1k84N12nylGFwE9XpYpr/BXmrYNxnsv
	 TIPMgf65jG2PGQfF0DqcjqQT8AioMbs6WBD7qIgVL01oMLpQC0NNIyPHorf7sPqjyODtW
	 aPoxXk98lEZ3cgVqMcbHVrKl1aI5pQPnI16EaC+LHFy1wU0SdSmPudoLk3VY44bz3hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811026;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=/6GFZTwsk8K1yLnVIeqvPcsTES79RyAO3TzYi1kGa5Q=;
	b=c3fve8D5tlnMw5XoYlJSR6MiBUDuLjtLAQRTv/zwHOIjDQPtk2ZyQ6kzhMNW/sqKND7G
	 D8yhMkLaMxEMx+V2Qf9j/a9pdIWKEjcilftaEqpHsDVcgIXrw63LPV5KboexHioYQ/9wb
	 hFSBFQ5GtA1soHb2/+yLMCAZh4xzH1zAi6AiHfY4H0fzVRu5Arj6whME9RelTfXcdCDj6
	 JFogm50phpmBlSC0i0CzMNhd3K5nBmE+Sky7pKf6wh+xypFEo+f8+xad3Wqy93PT4Pqni
	 n3QXfWPWDDBZDuTXLdEqfbrAbOwKlWLGSkJ21zE8sYMMR6d/rGb+avemn6ZVbO3MyXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aeO4DMk9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AE3606D81E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aeO4DMk9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E91D1F00A16;
	Wed,  4 Nov 2026 16:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811026;
	bh=/6GFZTwsk8K1yLnVIeqvPcsTES79RyAO3TzYi1kGa5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aeO4DMk9XPtbQT+GYd1/yOejHvlEsWQ/UgzcpfDeOQ2e2s/9kc9FreNPXKPf6weAs
	 mL7bawIeFKrOcfYYBAyq776eTEnQkA9hB5rlksBtRq1l+00FbMs1zfoXsYh1HIphSW
	 wiH84CQNK4gWj7wdN6vOBM0EDiHrViUvk9ITZfz8zGAeoCygfV8MA9+YB2kO9Tm3HS
	 RF6A5gBQbHOlC8u80oz8VcqxFnq7Y4RXFqi/FyKnFAyfjERJGTip+25X8T+qZMo0WP
	 SRIHzUDKv83T7QmVADSycLJpwAVLMf1dbr4pTsDSztmaExcMyv0rhv7ArtQBAcxwr1
	 ncfYo2Cy1vNXg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 04 Nov 2026 18:50:11 +0200
Subject: [PATCH v2 3/3] kho: fix bootmem sizing
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
Message-Id: <20261104-kho-bootmem-sizing-v2-3-b0d1a834780f@kernel.org>
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

Bootmem areas are sized from overlapping views of the memory reserved in
memblock:

* the global area is sized from all reserved memory, including memory
  allocated on specific nodes, so on NUMA systems everything allocated
  on a node is accounted in both the global area and the area of that
  node.
* per-node sizes are calculated after the lowmem and the global areas
  are reserved. With CONFIG_NUMA=n all memblock regions belong to node 0,
  so the lowmem and the global areas are accounted in the size of node 0
  area and scaled once again.

As a result, bootmem is about twice bigger than it should be on NUMA
systems and about four times bigger with CONFIG_NUMA=n. On small systems
reservation of the bootmem may fail and then KHO gets disabled.

Make the areas cover separate parts of the reserved memory: the lowmem
area covers allocations below ARCH_LOW_ADDRESS_LIMIT, per-node areas
cover allocations above it on each node and the global area covers
allocations that are not bound to any node. Calculate all sizes before
reserving any of the areas.

With CONFIG_NUMA=n the global area becomes empty and it is not reserved.

If ARCH_LOW_ADDRESS_LIMIT covers all memory, as may happen on arm64, any
area can serve lowmem allocations, so don't reserve the lowmem area.

Bootmem sizes in MiB in x86 QEMU VMs, before -> after:

                     CONFIG_NUMA=y     CONFIG_NUMA=n
  1G,  1 node         176 ->   92       320 ->   80
  4G,  1 node         508 ->  332      1264 ->  316
  16G, 2 nodes       1268 ->  704      2944 ->  736
  32G, 4 nodes       2296 -> 1224      5196 -> 1300
  64G, 4 nodes       4344 -> 2248      9664 -> 2420

Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
Reported-by: Kexin Liu <liukexin@kylinos.cn>
Reported-by: George Guo <guodongtai@kylinos.cn>
Closes: https://lore.kernel.org/all/20260904025101.9959-1-dongtai.guo@linux.dev
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Closes: https://lore.kernel.org/all/20260922131217.698809-1-sourabhjain@linux.ibm.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 kernel/liveupdate/kexec_handover.c | 93 ++++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 39 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 5b1797d1289c8..c4b697a612f67 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -685,6 +685,7 @@ static unsigned int bootmem_scale __initdata = 200;
 static phys_addr_t bootmem_size_global __initdata;
 static phys_addr_t bootmem_size_pernode __initdata;
 static phys_addr_t bootmem_size_lowmem __initdata;
+static phys_addr_t bootmem_size_node[MAX_NUMNODES] __initdata;
 
 static int __init kho_parse_bootmem_size(char *p)
 {
@@ -754,29 +755,58 @@ static int __init kho_parse_bootmem_size(char *p)
 }
 early_param("kho_bootmem", kho_parse_bootmem_size);
 
+static phys_addr_t __init reserved_mem_size(phys_addr_t limit, int nid)
+{
+	return memblock_reserved_kern_size(limit, nid) -
+	       memblock_reserved_hugetlb_size(limit, nid);
+}
+
+static phys_addr_t __init bootmem_scale_size(phys_addr_t size)
+{
+	return size * bootmem_scale / 100;
+}
+
+/*
+ * The lowmem area covers allocations below ARCH_LOW_ADDRESS_LIMIT, per-node
+ * areas cover allocations above it on each node and the global area covers
+ * allocations that are not bound to any node.
+ *
+ * The reserved memory on a node and the total reserved memory include
+ * lowmem, so it is subtracted from both.
+ *
+ * If ARCH_LOW_ADDRESS_LIMIT covers all memory, any area can serve lowmem
+ * allocations and there is no lowmem area.
+ *
+ * All sizes must be calculated before any area is reserved, otherwise the
+ * areas reserved first will be accounted in the sizes of the others.
+ */
 static void __init bootmem_size_update(void)
 {
-	/*
-	 * If fixed sizes are not provided via command line, calculate them now.
-	 * Remove HugeTLB allocations from it because they never get allocated
-	 * from bootmem.
-	 */
+	int nid;
+
 	if (bootmem_scale) {
-		phys_addr_t size;
-
-		size = memblock_reserved_kern_size(ARCH_LOW_ADDRESS_LIMIT,
-						   NUMA_NO_NODE);
-		size -= memblock_reserved_hugetlb_size(ARCH_LOW_ADDRESS_LIMIT,
-						       NUMA_NO_NODE);
-		size = size * bootmem_scale / 100;
-		bootmem_size_lowmem = size;
-
-		size = memblock_reserved_kern_size(MEMBLOCK_ALLOC_ANYWHERE,
-						   NUMA_NO_NODE);
-		size -= memblock_reserved_hugetlb_size(MEMBLOCK_ALLOC_ANYWHERE,
-						       NUMA_NO_NODE);
-		size = size * bootmem_scale / 100 - bootmem_size_lowmem;
-		bootmem_size_global = size;
+		phys_addr_t low_limit = ARCH_LOW_ADDRESS_LIMIT;
+		phys_addr_t lowmem, global, size;
+
+		if (low_limit >= memblock_end_of_DRAM() - 1)
+			low_limit = 0;
+
+		lowmem = reserved_mem_size(low_limit, NUMA_NO_NODE);
+		global = reserved_mem_size(MEMBLOCK_ALLOC_ANYWHERE, NUMA_NO_NODE);
+		global -= lowmem;
+
+		for_each_node_state(nid, N_MEMORY) {
+			size = reserved_mem_size(MEMBLOCK_ALLOC_ANYWHERE, nid) -
+			       reserved_mem_size(low_limit, nid);
+			bootmem_size_node[nid] = bootmem_scale_size(size);
+			global -= size;
+		}
+
+		bootmem_size_lowmem = bootmem_scale_size(lowmem);
+		bootmem_size_global = bootmem_scale_size(global);
+	} else {
+		for_each_node_state(nid, N_MEMORY)
+			bootmem_size_node[nid] = bootmem_size_pernode;
 	}
 
 	/*
@@ -785,24 +815,9 @@ static void __init bootmem_size_update(void)
 	 */
 	bootmem_size_lowmem = round_up(bootmem_size_lowmem, BOOTMEM_ALIGNMENT_BYTES);
 	bootmem_size_global = round_up(bootmem_size_global, BOOTMEM_ALIGNMENT_BYTES);
-}
-
-static phys_addr_t __init bootmem_size_node(int nid)
-{
-	phys_addr_t size;
-
-	if (bootmem_scale) {
-		size = memblock_reserved_kern_size(MEMBLOCK_ALLOC_ANYWHERE,
-						   nid);
-		/* Do not count HugeTLB pages. */
-		size -= memblock_reserved_hugetlb_size(MEMBLOCK_ALLOC_ANYWHERE,
-						       nid);
-		size = size * bootmem_scale / 100;
-	} else {
-		size = bootmem_size_pernode;
-	}
-
-	return round_up(size, BOOTMEM_ALIGNMENT_BYTES);
+	for_each_node_state(nid, N_MEMORY)
+		bootmem_size_node[nid] = round_up(bootmem_size_node[nid],
+						  BOOTMEM_ALIGNMENT_BYTES);
 }
 
 bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
@@ -899,7 +914,7 @@ static void __init kho_reserve_bootmem(void)
 	 * memoryless nodes, as we can not allocate bootmem areas there.
 	 */
 	for_each_node_state(nid, N_MEMORY) {
-		if (kho_reserve_bootmem_area(bootmem_size_node(nid),
+		if (kho_reserve_bootmem_area(bootmem_size_node[nid],
 					     MEMBLOCK_ALLOC_ACCESSIBLE, nid)) {
 			pr_err("Failed to reserve nid %d bootmem\n", nid);
 			goto err_free_bootmem_areas;

-- 
2.53.0

