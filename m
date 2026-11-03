Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706599;
	b=SpTszQU8d95eZhsd17JQFxU+cc86t3IkquW10uomfoEuSy13C9UbzI9B8z8ZaPjPkdK5
	 GV70cLNdgUWnfCWBymUSRmRw43j7ay3xLKdQ4azBHZb/oKghlmdORghQCt8RRYMfS/zrO
	 8lLngmNNKW2aX0lHhhEZRl9uMUGjyiLoFRyq+USxWy4BRVNyUJJtUAtqknFM2DgqJjg5B
	 ANr946TOoZlS/OyS1XEDrcB/T94NpKPNN/6FA45gMnT3g0iYnb+8bXZYS0enX5gizYenK
	 71QVGNY7+nrNp5WXyNfqxlDrTiDg8cK9Jqa+JOTCpCpfNZCUsWN6MU1/c1dmJRJ0NHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706599;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=RWGTnd8ZidzEdipCYzKE95gvRo3h3EOL4P9sMK0ko0A=;
	b=eTYC+bB6oWXe1Q/e//X20BWlMYCygZ+c/qLeOMcfmSsicpqW+fMWF+e81kH7YZ8sFtrt
	 5ClpQCLAKm17QvD4bIuRLEpVsgcad25b8RcbPUS0H1mB/ITbvDnmjrvGtrFMO+6kyP5O1
	 k6bV8pk7GAwxrLNSEJ4ShPaFzGsGAX4X/7WJa+mk3wLnbziI0P92YP9XN0dseDB3NObT1
	 mfaWQ5rrDWfhnNjK/CZ6uu8T44Y2if1CP+Z4yvsvog9UiBqxLOdp0eIVTul/OwrLa/VJF
	 mnrxipkPgW1mS+r0/KY8vICcWS6LIlqrnTxslfII/VOZfZB1PQ+hpLTfvwFbUCnHFxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GfdTNGFn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37050606D824
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GfdTNGFn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AA61F00A02;
	Tue,  3 Nov 2026 11:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706598;
	bh=RWGTnd8ZidzEdipCYzKE95gvRo3h3EOL4P9sMK0ko0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GfdTNGFn0HMpOe8AvhCd2j1aZaNVz68H5nNKxBveUcdY9soH3f+JDh52AHmXHom6W
	 PuimrJhvNrrYP0LNSX+uwodX/q3H5aLF1SQ5SR7HoJBzInc424buwd+htB5fxjsfKP
	 h0m/6Xs1nv1blG5kAfyD20FtoIP5R6I4qJS3f6p8dOcm2Dx06RICbcndZIF7lvkZSn
	 uZhjwPsgeG/2yP29FpLGebEvzUuYgViPZA3POGPmlP7tR8dGtVEMYSLnKC1UzDLap1
	 6QjqF3kkuGDzQs63Zs4RQ+I1qytybEp/QaYs4mKO5OVEvuLUnIPDVTTj5hJQzpoGCx
	 ef3ZcMvr9pMVg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 03 Nov 2026 13:49:49 +0200
Subject: [PATCH 1/2] kho: skip zero-sized lowmem and global bootmem areas
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
Message-Id: <20261103-kho-bootmem-sizing-v1-1-45aa74098f34@kernel.org>
References: <20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org>
In-Reply-To: <20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org>
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
 kernel/liveupdate/kexec_handover.c | 61 ++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 32 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe31819..f268c57413a7e 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -820,6 +820,27 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
 	return false;
 }
 
+static int __init kho_reserve_bootmem_area(int *idx, phys_addr_t size,
+					   phys_addr_t end, int nid)
+{
+	phys_addr_t addr;
+	int i = *idx;
+
+	if (!size)
+		return 0;
+
+	addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES, 0, end,
+					nid, true);
+	if (!addr)
+		return -ENOMEM;
+
+	kho_bootmem[i].addr = addr;
+	kho_bootmem[i].size = size;
+	*idx = i + 1;
+
+	return 0;
+}
+
 /**
  * kho_reserve_bootmem - Reserve a contiguous chunk of memory for kexec
  *
@@ -832,7 +853,7 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
 static void __init kho_reserve_bootmem(void)
 {
 	int nid, i = 0, max_nr_bootmem;
-	phys_addr_t addr, size;
+	phys_addr_t size;
 
 	if (!kho_enable)
 		return;
@@ -852,56 +873,32 @@ static void __init kho_reserve_bootmem(void)
 	 * reserve bootmem area in low memory for lowmem allocations in the
 	 * next kernel
 	 */
-	size = bootmem_size_lowmem;
-	addr = memblock_phys_alloc_range(size, BOOTMEM_ALIGNMENT_BYTES, 0,
-					 ARCH_LOW_ADDRESS_LIMIT);
-	if (!addr) {
+	if (kho_reserve_bootmem_area(&i, bootmem_size_lowmem,
+				     ARCH_LOW_ADDRESS_LIMIT, NUMA_NO_NODE)) {
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
+	if (kho_reserve_bootmem_area(&i, bootmem_size_global,
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
+		if (kho_reserve_bootmem_area(&i, bootmem_size_node(nid),
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
+	/* Areas with zero size were skipped */
 	kho_bootmem_cnt = i;
 
 	return;

-- 
2.53.0

