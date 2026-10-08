Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17F83914ED
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452497; cv=none; b=Sb5pK0T3ucYQOGcdK3NXiEysha+pqdf4O66xYlqQOTQfaGy+zGXIOK6BQWQPV/jyhyCZwodrkVjIijLqV1oAaZo1Bk/Te2EYV1NUHgGOhKiXRwJZiBYmI+bzf3qqcqur5Qm90IVxVF59yxOKSHe7iqTyf0Kam2EU313k2wIoi54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452497; c=relaxed/simple;
	bh=GD7+lc13Wlr4p6ZT9k5NWOWaYamzMVeCZ2xVQUgMMUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=pkacUIxZjXQ1XI1dU8t5qX7MmjDPP4gwc5d9FeocX5gGL+eABFaNNe033xcbtQe0Qt5emQ8Ez4dvIPReMUo4mgnEFAZC+INaFE7tGimJk4kPz425MCWGnG0G90D8O+iGD+4MlQCXBbbDgM5n3XWcCCSH3tQjklE7KgG3LmHRijU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Kmp317Qa; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Kmp317Qa"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261008094130euoutp02b9915d2eba5bbe38393d7d1db0a6d818~chIxUBBRp2643026430euoutp02M
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:41:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261008094130euoutp02b9915d2eba5bbe38393d7d1db0a6d818~chIxUBBRp2643026430euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791452490;
	bh=Gh/D/XtcwOEb2lFDL9N6ZsPr2jYj9OKQH3ofJmvD4TU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kmp317QaUkAvKZ2+JrBo8iLqfFliW1fZpLsXSkJ7DyTrnc/kKQ+db5vYX0n2sgioK
	 TeWZyEF0EsgudtixzeJTSgqaJXHZVG3vfyEaah3ZVF6T9lZ8NXyJFrCra/1lqZhL7X
	 Ua+O8BJGyA05ddouIxCWSrFyztIF3CO//ewpiH+M=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261008094129eucas1p1070329b8d0a61d3b7f0cafa9ccaced8c~chIw9yIWR1979819798eucas1p1u;
	Thu,  8 Oct 2026 09:41:29 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261008094129eusmtip25b23f369c0045728ed33f581406eff74~chIwe21NW1207512075eusmtip2K;
	Thu,  8 Oct 2026 09:41:29 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mike Rapoport
	<rppt@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@kernel.org>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	Wandun <chenwandun1@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/2] of: reserved_mem: group allocation helpers together
Date: Thu,  8 Oct 2026 11:41:22 +0200
Message-ID: <20261008094125.3197971-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008094125.3197971-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261008094129eucas1p1070329b8d0a61d3b7f0cafa9ccaced8c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261008094129eucas1p1070329b8d0a61d3b7f0cafa9ccaced8c
X-EPHeader: CA
X-CMS-RootMailID: 20261008094129eucas1p1070329b8d0a61d3b7f0cafa9ccaced8c
References: <20261008094125.3197971-1-m.szyprowski@samsung.com>
	<CGME20261008094129eucas1p1070329b8d0a61d3b7f0cafa9ccaced8c@eucas1p1.samsung.com>

Move __reserved_mem_alloc_in_range() and __reserved_mem_alloc_size() right
after __reserved_mem_reserve_reg(), so the functions that reserve reserved
regions are grouped together and defined before their use.

No functional change.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/of/of_reserved_mem.c | 262 +++++++++++++++++------------------
 1 file changed, 130 insertions(+), 132 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..300fb236ab59 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -178,6 +178,136 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	return 0;
 }
 
+/*
+ * __reserved_mem_alloc_in_range() - allocate reserved memory described with
+ *	'alloc-ranges'. Choose bottom-up/top-down depending on nearby existing
+ *	reserved regions to keep the reserved memory contiguous if possible.
+ */
+static int __init __reserved_mem_alloc_in_range(phys_addr_t size,
+	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
+	phys_addr_t *res_base)
+{
+	bool prev_bottom_up = memblock_bottom_up();
+	bool bottom_up = false, top_down = false;
+	int ret, i;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserved_mem *rmem = &reserved_mem[i];
+
+		/* Skip regions that were not reserved yet */
+		if (rmem->size == 0)
+			continue;
+
+		/*
+		 * If range starts next to an existing reservation, use bottom-up:
+		 *	|....RRRR................RRRRRRRR..............|
+		 *	       --RRRR------
+		 */
+		if (start >= rmem->base && start <= (rmem->base + rmem->size))
+			bottom_up = true;
+
+		/*
+		 * If range ends next to an existing reservation, use top-down:
+		 *	|....RRRR................RRRRRRRR..............|
+		 *	              -------RRRR-----
+		 */
+		if (end >= rmem->base && end <= (rmem->base + rmem->size))
+			top_down = true;
+	}
+
+	/* Change setting only if either bottom-up or top-down was selected */
+	if (bottom_up != top_down)
+		memblock_set_bottom_up(bottom_up);
+
+	ret = early_init_dt_alloc_reserved_memory_arch(size, align,
+			start, end, nomap, res_base);
+
+	/* Restore old setting if needed */
+	if (bottom_up != top_down)
+		memblock_set_bottom_up(prev_bottom_up);
+
+	return ret;
+}
+
+/*
+ * __reserved_mem_alloc_size() - allocate reserved memory described by
+ *	'size', 'alignment'  and 'alloc-ranges' properties.
+ */
+static int __init __reserved_mem_alloc_size(unsigned long node, const char *uname)
+{
+	phys_addr_t start = 0, end = 0;
+	phys_addr_t base = 0, align = 0, size;
+	int i, len;
+	const __be32 *prop;
+	bool nomap;
+	int ret;
+
+	prop = of_get_flat_dt_prop(node, "size", &len);
+	if (!prop)
+		return -EINVAL;
+
+	if (len != dt_root_size_cells * sizeof(__be32)) {
+		pr_err("invalid size property in '%s' node.\n", uname);
+		return -EINVAL;
+	}
+	size = dt_mem_next_cell(dt_root_size_cells, &prop);
+
+	prop = of_get_flat_dt_prop(node, "alignment", &len);
+	if (prop) {
+		if (len != dt_root_addr_cells * sizeof(__be32)) {
+			pr_err("invalid alignment property in '%s' node.\n",
+				uname);
+			return -EINVAL;
+		}
+		align = dt_mem_next_cell(dt_root_addr_cells, &prop);
+	}
+
+	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
+
+	ret = fdt_validate_reserved_mem_node(node, &align);
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	prop = of_flat_dt_get_addr_size_prop(node, "alloc-ranges", &len);
+	if (prop) {
+		for (i = 0; i < len; i++) {
+			u64 b, s;
+
+			of_flat_dt_read_addr_size(prop, i, &b, &s);
+
+			start = b;
+			end = b + s;
+
+			base = 0;
+			ret = __reserved_mem_alloc_in_range(size, align,
+					start, end, nomap, &base);
+			if (ret == 0) {
+				pr_debug("allocated memory for '%s' node: base %pa, size %lu MiB\n",
+					uname, &base,
+					(unsigned long)(size / SZ_1M));
+				break;
+			}
+		}
+	} else {
+		ret = early_init_dt_alloc_reserved_memory_arch(size, align,
+							0, 0, nomap, &base);
+		if (ret == 0)
+			pr_debug("allocated memory for '%s' node: base %pa, size %lu MiB\n",
+				uname, &base, (unsigned long)(size / SZ_1M));
+	}
+
+	if (base == 0) {
+		pr_err("failed to allocate memory for node '%s': size %lu MiB\n",
+		       uname, (unsigned long)(size / SZ_1M));
+		return -ENOMEM;
+	}
+
+	fdt_fixup_reserved_mem_node(node, base, size);
+	fdt_init_reserved_mem_node(node, uname, base, size);
+
+	return 0;
+}
+
 /*
  * __reserved_mem_check_root() - check if #size-cells, #address-cells provided
  * in /reserved-memory matches the values supported by the current implementation,
@@ -316,8 +446,6 @@ void __init fdt_scan_reserved_mem_late(void)
 	__rmem_check_for_overlap();
 }
 
-static int __init __reserved_mem_alloc_size(unsigned long node, const char *uname);
-
 /*
  * fdt_scan_reserved_mem() - reserve and allocate memory occupied by
  * reserved memory regions.
@@ -393,136 +521,6 @@ int __init fdt_scan_reserved_mem(void)
 	return 0;
 }
 
-/*
- * __reserved_mem_alloc_in_range() - allocate reserved memory described with
- *	'alloc-ranges'. Choose bottom-up/top-down depending on nearby existing
- *	reserved regions to keep the reserved memory contiguous if possible.
- */
-static int __init __reserved_mem_alloc_in_range(phys_addr_t size,
-	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
-	phys_addr_t *res_base)
-{
-	bool prev_bottom_up = memblock_bottom_up();
-	bool bottom_up = false, top_down = false;
-	int ret, i;
-
-	for (i = 0; i < reserved_mem_count; i++) {
-		struct reserved_mem *rmem = &reserved_mem[i];
-
-		/* Skip regions that were not reserved yet */
-		if (rmem->size == 0)
-			continue;
-
-		/*
-		 * If range starts next to an existing reservation, use bottom-up:
-		 *	|....RRRR................RRRRRRRR..............|
-		 *	       --RRRR------
-		 */
-		if (start >= rmem->base && start <= (rmem->base + rmem->size))
-			bottom_up = true;
-
-		/*
-		 * If range ends next to an existing reservation, use top-down:
-		 *	|....RRRR................RRRRRRRR..............|
-		 *	              -------RRRR-----
-		 */
-		if (end >= rmem->base && end <= (rmem->base + rmem->size))
-			top_down = true;
-	}
-
-	/* Change setting only if either bottom-up or top-down was selected */
-	if (bottom_up != top_down)
-		memblock_set_bottom_up(bottom_up);
-
-	ret = early_init_dt_alloc_reserved_memory_arch(size, align,
-			start, end, nomap, res_base);
-
-	/* Restore old setting if needed */
-	if (bottom_up != top_down)
-		memblock_set_bottom_up(prev_bottom_up);
-
-	return ret;
-}
-
-/*
- * __reserved_mem_alloc_size() - allocate reserved memory described by
- *	'size', 'alignment'  and 'alloc-ranges' properties.
- */
-static int __init __reserved_mem_alloc_size(unsigned long node, const char *uname)
-{
-	phys_addr_t start = 0, end = 0;
-	phys_addr_t base = 0, align = 0, size;
-	int i, len;
-	const __be32 *prop;
-	bool nomap;
-	int ret;
-
-	prop = of_get_flat_dt_prop(node, "size", &len);
-	if (!prop)
-		return -EINVAL;
-
-	if (len != dt_root_size_cells * sizeof(__be32)) {
-		pr_err("invalid size property in '%s' node.\n", uname);
-		return -EINVAL;
-	}
-	size = dt_mem_next_cell(dt_root_size_cells, &prop);
-
-	prop = of_get_flat_dt_prop(node, "alignment", &len);
-	if (prop) {
-		if (len != dt_root_addr_cells * sizeof(__be32)) {
-			pr_err("invalid alignment property in '%s' node.\n",
-				uname);
-			return -EINVAL;
-		}
-		align = dt_mem_next_cell(dt_root_addr_cells, &prop);
-	}
-
-	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
-
-	ret = fdt_validate_reserved_mem_node(node, &align);
-	if (ret && ret != -ENODEV)
-		return ret;
-
-	prop = of_flat_dt_get_addr_size_prop(node, "alloc-ranges", &len);
-	if (prop) {
-		for (i = 0; i < len; i++) {
-			u64 b, s;
-
-			of_flat_dt_read_addr_size(prop, i, &b, &s);
-
-			start = b;
-			end = b + s;
-
-			base = 0;
-			ret = __reserved_mem_alloc_in_range(size, align,
-					start, end, nomap, &base);
-			if (ret == 0) {
-				pr_debug("allocated memory for '%s' node: base %pa, size %lu MiB\n",
-					uname, &base,
-					(unsigned long)(size / SZ_1M));
-				break;
-			}
-		}
-	} else {
-		ret = early_init_dt_alloc_reserved_memory_arch(size, align,
-							0, 0, nomap, &base);
-		if (ret == 0)
-			pr_debug("allocated memory for '%s' node: base %pa, size %lu MiB\n",
-				uname, &base, (unsigned long)(size / SZ_1M));
-	}
-
-	if (base == 0) {
-		pr_err("failed to allocate memory for node '%s': size %lu MiB\n",
-		       uname, (unsigned long)(size / SZ_1M));
-		return -ENOMEM;
-	}
-
-	fdt_fixup_reserved_mem_node(node, base, size);
-	fdt_init_reserved_mem_node(node, uname, base, size);
-
-	return 0;
-}
-
 extern const struct of_device_id __reservedmem_of_table[];
 static const struct of_device_id __rmem_of_table_sentinel
 	__used __section("__reservedmem_of_table_end");
-- 
2.43.0

