Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654339;
	b=WBhpQft3WhEuT+vVG7IZvPdo5NJVyre+f3tMDY+Eif3UILnuetxg66ho68er1mah8zpi
	 NQfSGkZZTkL7HyI4tVT7mybP3LcX9w/u6z3zBL7h3GoiPF+hEHLxNzlphSFQrrpAW6d4M
	 Z1zwqKuum45Mq91RCcGEuk4iCNPLyAD0AQjlDuxluzJjRSYSiCCy9TYaR0e6x2wTWozGu
	 cnZOtgp8KVxqQtfqc3WlBHR9mmU0qwfSLKYinfeaJQm6E7awnI3giGa23cUgr4WFPDcrw
	 PNWkyrl33YDSv7RBEYVW+WU9S06fmCFADQQW61BuNKGmdrEICMtNa8dVI3HOFIznqGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654339;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OKY84GtBJEO93dJsi5l8NJGRKrfH85SpZ6w2If/nF24=;
	b=ZPFw+9oeuKUDe9eHb5Hp6tQQcAs1XsrC6MKDFXdcDhAfOhwir+GnL6ybflJOJZ1dfaBG
	 sYTzKcJXq2XCp+6wg4zdsYHIXedPesMLeTcok0Usz9hPDNw5C0afYK/3/WYLgaQMxR34I
	 UdlzmwDxInZuuXOz5HO+VX6lw2Lwrf4Eo4+SDKZhGO1Nbgul4SEateoS32hHahaMHRopi
	 lppekkaY6edPcy2GJ7Ix1Bn7y6ZEvf3AEaNWjyIPZnWwxkQllz5Xj6SueTEHVEA4m4Hlc
	 omE5hKYM06CtKbDEYWFLI/rCccHoNZoUq0iF9kC1funoYeVOwB8DceyirUSxr9u64Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m954awPx;
	arc=none smtp.remote-ip=95.215.58.159
Received: from mta1.migadu.com (out-159.mta1.migadu.com [95.215.58.159])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0D4606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D0D4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m954awPx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dO/AMwSp9DtusDvZR5ccSKV3L/RJZUjvMTljx8auez8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792654335; v=1; x=1793259135;
 b=m954awPxnvd+KMuYRc9mVoXn+YGH0G0fOZNsslPnTffukbwbHiN2jhkJjT4LWuuOv6eexVp7
 Y3K3RU4s4ggPg3QvTigZ8ygNv0BxjFKR/w7amXnERAUgck+hQNuAil/81VD8/25+vgeBAV2lJyA
 /pAwa/iVyQDULsQa/rFmLAxU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d61fb8701f60aa1c;
	Thu, 22 Oct 2026 07:32:15 +0000
X-Mizu-Trace-ID: d61fb8701f60aa1c
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	david@kernel.org,
	osalvador@suse.de,
	akpm@linux-foundation.org,
	azpijr@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 2/5] mm: hugetlb: group CMA pool and reservation state
Date: Thu, 22 Oct 2026 15:31:46 +0800
Message-ID: <ff8e96b68fc725981bdcd65c1c6e3cff2c0798a4.1792651104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1792651104.git.zhengqi.arch@bytedance.com>
References: <cover.1792651104.git.zhengqi.arch@bytedance.com>
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

From: Qi Zheng <zhengqi.arch@bytedance.com>

The HugeTLB CMA areas, total size, per-node sizes and percentages are
stored in separate singleton variables. Group the runtime areas and
size into a pool, and the temporary reservation inputs into a separate
configuration structure.

Keep one instance of each structure and preserve the existing parsing,
reservation and allocation behavior. This separates the mechanical state
conversion from adding support for multiple page orders.

Assisted-by: LLM
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/hugetlb_cma.c | 163 ++++++++++++++++++++++++++---------------------
 1 file changed, 89 insertions(+), 74 deletions(-)

diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index a17d32fa5ebb3..4f27eb242dc3b 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -16,14 +16,21 @@
 #include "internal.h"
 #include "hugetlb_cma.h"
 
+struct hugetlb_cma_pool {
+	struct cma *cma[MAX_NUMNODES];
+	unsigned long size;
+};
 
-static struct cma *hugetlb_cma[MAX_NUMNODES] __ro_after_init;
-static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initdata;
-static bool hugetlb_cma_only __ro_after_init;
-static unsigned long hugetlb_cma_size __ro_after_init;
+struct hugetlb_cma_config {
+	unsigned long size_in_node[MAX_NUMNODES];
+	unsigned int percent;
+	unsigned int percent_in_node[MAX_NUMNODES];
+};
+
+static struct hugetlb_cma_pool hugetlb_cma __ro_after_init;
+static struct hugetlb_cma_config hugetlb_cma_config __initdata;
 
-static unsigned int hugetlb_cma_percent __initdata;
-static unsigned int hugetlb_cma_percent_in_node[MAX_NUMNODES] __initdata;
+static bool hugetlb_cma_only __ro_after_init;
 
 static char hugetlb_cma_cmdline[COMMAND_LINE_SIZE] __initdata;
 static unsigned int hugetlb_cma_cmdline_len __initdata;
@@ -49,7 +56,9 @@ static phys_addr_t __init memblock_node_memory_size(int nid)
 
 void hugetlb_cma_free_frozen_folio(struct folio *folio)
 {
-	WARN_ON_ONCE(!cma_release_frozen(hugetlb_cma[folio_nid(folio)],
+	struct hugetlb_cma_pool *pool = &hugetlb_cma;
+
+	WARN_ON_ONCE(!cma_release_frozen(pool->cma[folio_nid(folio)],
 					 &folio->page, folio_nr_pages(folio)));
 }
 
@@ -61,8 +70,9 @@ struct folio *hugetlb_cma_alloc_frozen_folio(int order, gfp_t gfp_mask,
 	struct page *page = NULL;
 	const nodemask_t *nmask;
 	unsigned int cpuset_mems_cookie;
+	struct hugetlb_cma_pool *pool = &hugetlb_cma;
 
-	if (!hugetlb_cma_size)
+	if (!pool->size)
 		return NULL;
 
 retry_cpuset:
@@ -73,15 +83,15 @@ struct folio *hugetlb_cma_alloc_frozen_folio(int order, gfp_t gfp_mask,
 		nmask = nodemask;
 	}
 
-	if (hugetlb_cma[nid] && node_isset(nid, *nmask))
-		page = cma_alloc_frozen_compound(hugetlb_cma[nid], order);
+	if (pool->cma[nid] && node_isset(nid, *nmask))
+		page = cma_alloc_frozen_compound(pool->cma[nid], order);
 
 	if (!page && !(gfp_mask & __GFP_THISNODE)) {
 		for_each_node_mask(node, *nmask) {
-			if (node == nid || !hugetlb_cma[node])
+			if (node == nid || !pool->cma[node])
 				continue;
 
-			page = cma_alloc_frozen_compound(hugetlb_cma[node], order);
+			page = cma_alloc_frozen_compound(pool->cma[node], order);
 			if (page)
 				break;
 		}
@@ -101,17 +111,18 @@ struct folio *hugetlb_cma_alloc_frozen_folio(int order, gfp_t gfp_mask,
 
 void * __init hugetlb_cma_alloc_bootmem(struct hstate *h, int nid, bool node_exact)
 {
+	struct hugetlb_cma_pool *pool = &hugetlb_cma;
 	struct cma *cma;
 	void *m;
 	int node;
 
-	cma = hugetlb_cma[nid];
+	cma = pool->cma[nid];
 	m = cma_reserve_early(cma, huge_page_size(h));
 	if (m || node_exact)
 		return m;
 
 	for_each_node_mask(node, hugetlb_bootmem_nodes) {
-		cma = hugetlb_cma[node];
+		cma = pool->cma[node];
 		if (!cma || node == nid)
 			continue;
 		m = cma_reserve_early(cma, huge_page_size(h));
@@ -124,6 +135,8 @@ void * __init hugetlb_cma_alloc_bootmem(struct hstate *h, int nid, bool node_exa
 
 static int __init hugetlb_cma_parse(char *p)
 {
+	struct hugetlb_cma_pool *pool = &hugetlb_cma;
+	struct hugetlb_cma_config *config = &hugetlb_cma_config;
 	int nid, count = 0;
 	unsigned long tmp;
 	char *s = p;
@@ -157,8 +170,8 @@ static int __init hugetlb_cma_parse(char *p)
 				break;
 			nid = array_index_nospec(tmp, MAX_NUMNODES);
 
-			hugetlb_cma_size = 0;
-			hugetlb_cma_percent = 0;
+			pool->size = 0;
+			config->percent = 0;
 
 			s += count + 1;
 			tmp = memparse(s, &next);
@@ -168,12 +181,12 @@ static int __init hugetlb_cma_parse(char *p)
 						tmp, nid);
 					break;
 				}
-				hugetlb_cma_percent_in_node[nid] = tmp;
-				hugetlb_cma_size_in_node[nid] = 0;
+				config->percent_in_node[nid] = tmp;
+				config->size_in_node[nid] = 0;
 				s = next + 1;
 			} else {
-				hugetlb_cma_size_in_node[nid] = tmp;
-				hugetlb_cma_percent_in_node[nid] = 0;
+				config->size_in_node[nid] = tmp;
+				config->percent_in_node[nid] = 0;
 				s = next;
 			}
 
@@ -193,19 +206,19 @@ static int __init hugetlb_cma_parse(char *p)
 				if (tmp > 100) {
 					pr_warn("hugetlb_cma: invalid percentage %lu\n", tmp);
 				} else {
-					hugetlb_cma_percent = tmp;
-					hugetlb_cma_size = 0;
+					config->percent = tmp;
+					pool->size = 0;
 					for (nid = 0; nid < MAX_NUMNODES; nid++) {
-						hugetlb_cma_size_in_node[nid] = 0;
-						hugetlb_cma_percent_in_node[nid] = 0;
+						config->size_in_node[nid] = 0;
+						config->percent_in_node[nid] = 0;
 					}
 				}
 			} else {
-				hugetlb_cma_size = tmp;
-				hugetlb_cma_percent = 0;
+				pool->size = tmp;
+				config->percent = 0;
 				for (nid = 0; nid < MAX_NUMNODES; nid++) {
-					hugetlb_cma_size_in_node[nid] = 0;
-					hugetlb_cma_percent_in_node[nid] = 0;
+					config->size_in_node[nid] = 0;
+					config->percent_in_node[nid] = 0;
 				}
 			}
 			break;
@@ -245,6 +258,8 @@ unsigned int __weak arch_hugetlb_cma_order(void)
 
 void __init hugetlb_cma_reserve(void)
 {
+	struct hugetlb_cma_pool *pool = &hugetlb_cma;
+	struct hugetlb_cma_config *config = &hugetlb_cma_config;
 	unsigned long size, reserved, per_node, order, gigantic_page_size;
 	bool node_specific_cma_alloc = false;
 	bool has_node_specific_param = false;
@@ -257,33 +272,33 @@ void __init hugetlb_cma_reserve(void)
 		hugetlb_cma_parse(p);
 
 	for (nid = 0; nid < MAX_NUMNODES; nid++) {
-		if (hugetlb_cma_size_in_node[nid] || hugetlb_cma_percent_in_node[nid]) {
+		if (config->size_in_node[nid] || config->percent_in_node[nid]) {
 			has_node_specific_param = true;
 			break;
 		}
 	}
 
 	if (has_node_specific_param) {
-		hugetlb_cma_size = 0;
+		pool->size = 0;
 		for (nid = 0; nid < MAX_NUMNODES; nid++) {
-			if (hugetlb_cma_percent_in_node[nid]) {
+			if (config->percent_in_node[nid]) {
 				phys_addr_t node_gfp_mem = memblock_node_memory_size(nid);
 				u64 s;
 
 				s = mul_u64_u32_div((u64)node_gfp_mem,
-						    hugetlb_cma_percent_in_node[nid],
+						    config->percent_in_node[nid],
 						    100);
 
-				hugetlb_cma_size_in_node[nid] = s;
+				config->size_in_node[nid] = s;
 			}
-			hugetlb_cma_size += hugetlb_cma_size_in_node[nid];
+			pool->size += config->size_in_node[nid];
 		}
-	} else if (hugetlb_cma_percent) {
-		hugetlb_cma_size = mul_u64_u32_div((u64)memblock_phys_mem_size(),
-						   hugetlb_cma_percent, 100);
+	} else if (config->percent) {
+		pool->size = mul_u64_u32_div((u64)memblock_phys_mem_size(),
+						   config->percent, 100);
 	}
 
-	if (!hugetlb_cma_size)
+	if (!pool->size)
 		return;
 
 	order = arch_hugetlb_cma_order();
@@ -301,36 +316,36 @@ void __init hugetlb_cma_reserve(void)
 	VM_WARN_ON(order <= MAX_PAGE_ORDER);
 	gigantic_page_size = PAGE_SIZE << order;
 
-	if (hugetlb_cma_percent) {
-		unsigned long orig_size = hugetlb_cma_size;
+	if (config->percent) {
+		unsigned long orig_size = pool->size;
 
-		hugetlb_cma_size = ALIGN_DOWN(hugetlb_cma_size, PAGE_SIZE << order);
-		if (orig_size && !hugetlb_cma_size)
+		pool->size = ALIGN_DOWN(pool->size, PAGE_SIZE << order);
+		if (orig_size && !pool->size)
 			pr_warn("hugetlb_cma: reservation size rounded down to 0 from %lu MiB (%u%%)\n",
-				orig_size / SZ_1M, hugetlb_cma_percent);
+				orig_size / SZ_1M, config->percent);
 	} else if (has_node_specific_param) {
-		hugetlb_cma_size = 0;
+		pool->size = 0;
 		for (nid = 0; nid < MAX_NUMNODES; nid++) {
-			if (hugetlb_cma_percent_in_node[nid]) {
-				unsigned long orig_size = hugetlb_cma_size_in_node[nid];
+			if (config->percent_in_node[nid]) {
+				unsigned long orig_size = config->size_in_node[nid];
 
-				hugetlb_cma_size_in_node[nid] =
-					ALIGN_DOWN(hugetlb_cma_size_in_node[nid],
+				config->size_in_node[nid] =
+					ALIGN_DOWN(config->size_in_node[nid],
 						   PAGE_SIZE << order);
-				if (orig_size && !hugetlb_cma_size_in_node[nid])
+				if (orig_size && !config->size_in_node[nid])
 					pr_warn("hugetlb_cma: reservation size rounded down to 0 from %lu MiB (%u%%) on node %d\n",
 						orig_size / SZ_1M,
-						hugetlb_cma_percent_in_node[nid],
+						config->percent_in_node[nid],
 						nid);
 			}
-			hugetlb_cma_size += hugetlb_cma_size_in_node[nid];
+			pool->size += config->size_in_node[nid];
 		}
 	}
 
 	hugetlb_bootmem_set_nodes();
 
 	for (nid = 0; nid < MAX_NUMNODES; nid++) {
-		size = hugetlb_cma_size_in_node[nid];
+		size = config->size_in_node[nid];
 		if (size == 0)
 			continue;
 
@@ -344,18 +359,18 @@ void __init hugetlb_cma_reserve(void)
 			continue;
 		}
 
-		hugetlb_cma_size -= size;
-		hugetlb_cma_size_in_node[nid] = 0;
+		pool->size -= size;
+		config->size_in_node[nid] = 0;
 	}
 
 	/* Validate the CMA size again in case some invalid nodes specified. */
-	if (!hugetlb_cma_size)
+	if (!pool->size)
 		return;
 
-	if (!IS_ALIGNED(hugetlb_cma_size, gigantic_page_size)) {
+	if (!IS_ALIGNED(pool->size, gigantic_page_size)) {
 		pr_warn("hugetlb_cma: cma area must be a multiple of %lu MiB\n",
 			gigantic_page_size / SZ_1M);
-		hugetlb_cma_size = 0;
+		pool->size = 0;
 		return;
 	}
 
@@ -364,16 +379,16 @@ void __init hugetlb_cma_reserve(void)
 		 * If 3 GB area is requested on a machine with 4 numa nodes,
 		 * let's allocate 1 GB on first three nodes and ignore the last one.
 		 */
-		per_node = DIV_ROUND_UP(hugetlb_cma_size,
+		per_node = DIV_ROUND_UP(pool->size,
 					nodes_weight(hugetlb_bootmem_nodes));
 		per_node = round_up(per_node, gigantic_page_size);
-		if (hugetlb_cma_percent)
+		if (config->percent)
 			pr_info("hugetlb_cma: reserve %lu MiB (%u%%), up to %lu MiB per node\n",
-				hugetlb_cma_size / SZ_1M, hugetlb_cma_percent,
+				pool->size / SZ_1M, config->percent,
 				per_node / SZ_1M);
 		else
 			pr_info("hugetlb_cma: reserve %lu MiB, up to %lu MiB per node\n",
-				hugetlb_cma_size / SZ_1M, per_node / SZ_1M);
+				pool->size / SZ_1M, per_node / SZ_1M);
 	}
 
 	reserved = 0;
@@ -382,12 +397,12 @@ void __init hugetlb_cma_reserve(void)
 		char name[CMA_MAX_NAME];
 
 		if (node_specific_cma_alloc) {
-			if (hugetlb_cma_size_in_node[nid] == 0)
+			if (config->size_in_node[nid] == 0)
 				continue;
 
-			size = hugetlb_cma_size_in_node[nid];
+			size = config->size_in_node[nid];
 		} else {
-			size = min(per_node, hugetlb_cma_size - reserved);
+			size = min(per_node, pool->size - reserved);
 		}
 
 		snprintf(name, sizeof(name), "hugetlb%d", nid);
@@ -398,33 +413,33 @@ void __init hugetlb_cma_reserve(void)
 		 */
 		res = cma_declare_contiguous_multi(size, gigantic_page_size,
 					HUGETLB_PAGE_ORDER, name,
-					&hugetlb_cma[nid], nid);
-		if (res || !cma_validate_zones(hugetlb_cma[nid])) {
+					&pool->cma[nid], nid);
+		if (res || !cma_validate_zones(pool->cma[nid])) {
 			pr_warn("hugetlb_cma: %s: err %d, node %d\n",
 				res ? "reservation failed" : "reserved area spans zones",
 				res, nid);
-			hugetlb_cma[nid] = NULL;
+			pool->cma[nid] = NULL;
 			continue;
 		}
 
 		reserved += size;
-		if (hugetlb_cma_percent_in_node[nid])
+		if (config->percent_in_node[nid])
 			pr_info("hugetlb_cma: reserved %lu MiB (%u%%) on node %d\n",
-				size / SZ_1M, hugetlb_cma_percent_in_node[nid], nid);
+				size / SZ_1M, config->percent_in_node[nid], nid);
 		else
 			pr_info("hugetlb_cma: reserved %lu MiB on node %d\n",
 				size / SZ_1M, nid);
 
-		if (reserved >= hugetlb_cma_size)
+		if (reserved >= pool->size)
 			break;
 	}
 
 	if (!reserved)
 		/*
-		 * hugetlb_cma_size is used to determine if allocations from
+		 * pool->size is used to determine if allocations from
 		 * cma are possible.  Set to zero if no cma regions are set up.
 		 */
-		hugetlb_cma_size = 0;
+		pool->size = 0;
 }
 
 bool hugetlb_cma_exclusive_alloc(void)
@@ -434,12 +449,12 @@ bool hugetlb_cma_exclusive_alloc(void)
 
 unsigned long __init hugetlb_cma_total_size(void)
 {
-	return hugetlb_cma_size;
+	return hugetlb_cma.size;
 }
 
 void __init hugetlb_cma_validate_params(void)
 {
-	if (!hugetlb_cma_size)
+	if (!hugetlb_cma.size)
 		hugetlb_cma_only = false;
 }
 
-- 
2.54.0

