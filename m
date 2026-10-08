Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D443EC6B2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452500; cv=none; b=ted6oogln8nESl9+pVCQO9ZULdT1jcKJKR91vlMYbxhuDLZjLDUXxas+AcWIpmqUR4ZQKSNJzxPAq6zDvxR3QHWPWpC6dGFkq/Zys242Ed3HqS1UU6f+BY0U/FPlRbOVZf/adgwumFYfjDQYHLMOoi6aEpq97xCnGMYOdQ6Iij8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452500; c=relaxed/simple;
	bh=5xjTaVXwvGB6IRmJzLQNMq+Kd88pusR42nelc0T58pI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=cnHt7dwtoTdrqN28tq7ZzkYzIeNCZIgdWb4hFjfBpNaNYeCUDbW4Sh9wFvun3xGqdXGdbDvZfpGdafp1csb3A3waI5lnldNhRjZhTnWkGY/DqrSaCU9NABjpbYDuU4qGKn4Ct9MFsrtwSwrg2QmZ4xqWGmrcswRagZSpUBDM6sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=eDi4i1wi; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="eDi4i1wi"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261008094130euoutp017625d892f1dcaee4b764f890f99a7e4f~chIx2rfbh2284822848euoutp01e
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:41:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261008094130euoutp017625d892f1dcaee4b764f890f99a7e4f~chIx2rfbh2284822848euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791452490;
	bh=fcj4CJIKTlRP5Sqz8Cj1lm93y+NSog/f4qUrLurHSMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eDi4i1wiaqlSZuvPdDEVLffyOOUZBCTxxOBgp3HcpnWv9yWuRXbJ7UplXtjzVKlEa
	 mCTSnhdTienlIz0svuyFQRHPRMpliZB6B+CECffmczaLHMnCM8Y+u5PslKQs0eRzLP
	 PqGrd+mf4iPaDfCVSw/SEY5lj9YmOPUjKx7aZRDQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261008094130eucas1p1120c66c914aa2b93fa3d7e6e494e7eea~chIxiyNzn0260802608eucas1p1A;
	Thu,  8 Oct 2026 09:41:30 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261008094129eusmtip24bf105f8ff4d5a7d2a5277c3e2437fa7~chIxDISsi0972409724eusmtip2F;
	Thu,  8 Oct 2026 09:41:29 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mike Rapoport
	<rppt@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@kernel.org>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	Wandun <chenwandun1@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/2] of: reserved_mem: allocate and map the reserved_mem
 array early
Date: Thu,  8 Oct 2026 11:41:23 +0200
Message-ID: <20261008094125.3197971-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008094125.3197971-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261008094130eucas1p1120c66c914aa2b93fa3d7e6e494e7eea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261008094130eucas1p1120c66c914aa2b93fa3d7e6e494e7eea
X-EPHeader: CA
X-CMS-RootMailID: 20261008094130eucas1p1120c66c914aa2b93fa3d7e6e494e7eea
References: <20261008094125.3197971-1-m.szyprowski@samsung.com>
	<CGME20261008094130eucas1p1120c66c914aa2b93fa3d7e6e494e7eea@eucas1p1.samsung.com>

Get rid of the static, limited-size reserved_mem array and replace it
with array allocated by memblock_alloc_raw() and accessed through a
temporary early_memremap() mapping. Such mapping is needed for some
architectures (like ARM64), where linear map is not yet available during
early boot scan. Having a single, writeable array with all reserved
regions removes the need to perform two step initialization introduced
by commit 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved
memory regions are processed"), so all regions can be processed
directly during the early scan again.

Suggested-by: Mike Rapoport <rppt@kernel.org>
Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
Assisted-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/of/fdt.c             |   3 -
 drivers/of/of_private.h      |   2 -
 drivers/of/of_reserved_mem.c | 251 ++++++++++++++---------------------
 3 files changed, 96 insertions(+), 160 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ecc923102622..a58efdcbac7f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1283,9 +1283,6 @@ void __init unflatten_device_tree(void)
 {
 	void *fdt = initial_boot_params;
 
-	/* Save the statically-placed regions in the reserved_mem array */
-	fdt_scan_reserved_mem_late();
-
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
 		fdt = (void *) __dtb_empty_root_begin;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..895f868b4cfa 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -9,7 +9,6 @@
  */
 
 #define FDT_ALIGN_SIZE 8
-#define MAX_RESERVED_REGIONS    64
 
 /**
  * struct alias_prop - Alias property in 'aliases' node
@@ -186,7 +185,6 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 #endif
 
 int fdt_scan_reserved_mem(void);
-void __init fdt_scan_reserved_mem_late(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 300fb236ab59..6a5e53243bb7 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -24,12 +24,14 @@
 #include <linux/slab.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#ifdef CONFIG_GENERIC_EARLY_IOREMAP
+#include <asm/early_ioremap.h>
+#endif
 
 #include "of_private.h"
 
-static struct reserved_mem reserved_mem_array[MAX_RESERVED_REGIONS] __initdata;
-static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
-static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
+static struct reserved_mem *reserved_mem __refdata;
+static int total_reserved_mem_cnt;
 static int reserved_mem_count;
 
 static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
@@ -59,56 +61,48 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 }
 
 /*
- * alloc_reserved_mem_array() - allocate memory for the reserved_mem
- * array using memblock
+ * reserved_mem_array_map() - make the freshly allocated reserved_mem array
+ * accessible during early boot
  *
- * This function is used to allocate memory for the reserved_mem
- * array according to the total number of reserved memory regions
- * defined in the DT.
- * After the new array is allocated, the information stored in
- * the initial static array is copied over to this new array and
- * the new array is used from this point on.
+ * On some architectures (i.e. arm64) the linear mapping is not yet usable when
+ * the reserved memory regions are scanned, so the array has to be accessed
+ * through a temporary early mapping.
  */
-static int __init alloc_reserved_mem_array(void)
+static struct reserved_mem * __init reserved_mem_array_map(struct reserved_mem *array,
+							   size_t size)
 {
-	struct reserved_mem *new_array;
-	size_t alloc_size, copy_size, memset_size;
-	int ret;
+#ifdef CONFIG_GENERIC_EARLY_IOREMAP
+	return early_memremap(__pa(array), size);
+#else
+	return array;
+#endif
+}
 
-	if (!total_reserved_mem_cnt)
-		return 0;
+static void __init reserved_mem_array_unmap(struct reserved_mem *map, size_t size)
+{
+#ifdef CONFIG_GENERIC_EARLY_IOREMAP
+	early_memunmap(map, size);
+#endif
+}
 
-	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
-	if (alloc_size == SIZE_MAX) {
-		ret = -EOVERFLOW;
-		goto fail;
-	}
+/*
+ * count_reserved_mem_nodes() - count the nodes that might need an entry in the
+ * reserved_mem array
+ */
+static int __init count_reserved_mem_nodes(const void *fdt, int node)
+{
+	int child, len, count = 0;
 
-	new_array = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
-	if (!new_array) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	fdt_for_each_subnode(child, fdt, node) {
+		if (!of_fdt_device_is_available(fdt, child))
+			continue;
 
-	copy_size = array_size(reserved_mem_count, sizeof(*new_array));
-	if (copy_size == SIZE_MAX) {
-		memblock_free(new_array, alloc_size);
-		ret = -EOVERFLOW;
-		goto fail;
+		/* static regions use 'reg', dynamic ones use 'size' */
+		if ((of_flat_dt_get_addr_size_prop(child, "reg", &len) && len) ||
+		    (of_get_flat_dt_prop(child, "size", &len) && len))
+			count++;
 	}
-
-	memset_size = alloc_size - copy_size;
-
-	memcpy(new_array, reserved_mem, copy_size);
-	memset(new_array + reserved_mem_count, 0, memset_size);
-
-	reserved_mem = new_array;
-	return 0;
-
-fail:
-	pr_err("Failed to allocate memory for reserved_mem array with err: %d", ret);
-	reserved_mem_count = 0;
-	return ret;
+	return count;
 }
 
 static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
@@ -169,6 +163,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 
 	if (size && early_init_dt_reserve_memory(base, size, nomap) == 0) {
 		fdt_fixup_reserved_mem_node(node, base, size);
+		fdt_init_reserved_mem_node(node, uname, base, size);
 		pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
 			 uname, &base, (unsigned long)(size / SZ_1M));
 	} else {
@@ -381,143 +376,89 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
-/**
- * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
- * memory regions.
- *
- * This function is used to scan again through the DT and initialize the
- * "static" reserved memory regions, that are defined using the "reg"
- * property. Each such region is then initialized with its specific init
- * function and stored in the global reserved_mem array.
- */
-void __init fdt_scan_reserved_mem_late(void)
-{
-	const void *fdt = initial_boot_params;
-	phys_addr_t base, size;
-	int node, child;
-
-	if (!fdt)
-		return;
-
-	node = fdt_path_offset(fdt, "/reserved-memory");
-	if (node < 0) {
-		pr_info("Reserved memory: No reserved-memory node in the DT\n");
-		return;
-	}
-
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	if (alloc_reserved_mem_array())
-		return;
-
-	if (__reserved_mem_check_root(node)) {
-		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		return;
-	}
-
-	fdt_for_each_subnode(child, fdt, node) {
-		const __be32 *prop;
-		const char *uname;
-		u64 b, s;
-		int ret;
-		int len;
-
-		if (!of_fdt_device_is_available(fdt, child))
-			continue;
-
-		prop = of_flat_dt_get_addr_size_prop(child, "reg", &len);
-		if (!prop || !len)
-			continue;
-
-		ret = fdt_validate_reserved_mem_node(child, NULL);
-		if (ret && ret != -ENODEV)
-			continue;
-
-		of_flat_dt_read_addr_size(prop, 0, &b, &s);
-		base = b;
-		size = s;
-
-		if (size) {
-			uname = fdt_get_name(fdt, child, NULL);
-			fdt_init_reserved_mem_node(child, uname, base, size);
-		}
-	}
-
-	/* check for overlapping reserved regions */
-	__rmem_check_for_overlap();
-}
 
 /*
  * fdt_scan_reserved_mem() - reserve and allocate memory occupied by
  * reserved memory regions.
  *
- * This function is used to scan through the FDT and mark memory occupied
- * by all static (defined by the "reg" property) reserved memory regions.
- * Then memory for all dynamic regions (defined by size & alignment) is
- * allocated, a region specific init function is called and region information
- * is stored in the reserved_mem array.
+ * This function is used to scan through the FDT and count the number of
+ * reserved memory regions, so the reserved_mem array can be allocated with
+ * the exact size. Then all static (defined by the "reg" property) reserved
+ * memory regions are marked as reserved, memory for all dynamic regions
+ * (defined by size & alignment) is allocated, a region specific init function
+ * is called and region information is stored in the reserved_mem array.
  */
 int __init fdt_scan_reserved_mem(void)
 {
-	int node, child;
-	int dynamic_nodes_cnt = 0, count = 0;
-	int dynamic_nodes[MAX_RESERVED_REGIONS];
+	struct reserved_mem *array, *map;
+	size_t array_bytes;
+	int node, child, cnt;
 	const void *fdt = initial_boot_params;
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
-	if (node < 0) {
-		total_reserved_mem_cnt = 0;
+	if (node < 0)
 		return -ENODEV;
-	}
 
 	if (__reserved_mem_check_root(node) != 0) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		total_reserved_mem_cnt = 0;
 		return -EINVAL;
 	}
 
-	fdt_for_each_subnode(child, fdt, node) {
-		const char *uname;
-		int err;
+	/* First pass: count the entries needed for the reserved_mem array */
+	cnt = count_reserved_mem_nodes(fdt, node);
+	if (!cnt)
+		return 0;
 
-		if (!of_fdt_device_is_available(fdt, child))
-			continue;
+	array_bytes = array_size(cnt, sizeof(*array));
+	array = memblock_alloc_raw(array_bytes, SMP_CACHE_BYTES);
+	if (!array) {
+		pr_err("Failed to allocate memory for reserved_mem array\n");
+		return -ENOMEM;
+	}
 
-		uname = fdt_get_name(fdt, child, NULL);
+	map = reserved_mem_array_map(array, array_bytes);
+	if (!map) {
+		pr_err("Failed to map memory for reserved_mem array\n");
+		memblock_free(array, array_bytes);
+		return -ENOMEM;
+	}
+	memset(map, 0, array_bytes);
 
-		err = __reserved_mem_reserve_reg(child, uname);
-		if (!err)
-			count++;
+	reserved_mem = map;
+	total_reserved_mem_cnt = cnt;
 
-		/*
-		 * Save the nodes for the dynamically-placed regions
-		 * into an array which will be used for allocation right
-		 * after all the statically-placed regions are reserved
-		 * or marked as no-map. This is done to avoid dynamically
-		 * allocating from one of the statically-placed regions.
-		 */
-		if (err != -ENOENT || !of_get_flat_dt_prop(child, "size", NULL))
+	/* Second pass: reserve and initialize the static regions */
+	fdt_for_each_subnode(child, fdt, node) {
+		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
-		if (dynamic_nodes_cnt == MAX_RESERVED_REGIONS) {
-			pr_err("too many defined dynamic regions, skip '%s'\n",
-			       uname);
+		__reserved_mem_reserve_reg(child,
+					   fdt_get_name(fdt, child, NULL));
+	}
+
+	/*
+	 * Allocate the dynamically-placed regions only after all the
+	 * statically-placed regions are reserved or marked as no-map. This
+	 * is done to avoid dynamically allocating from one of the
+	 * statically-placed regions.
+	 */
+	fdt_for_each_subnode(child, fdt, node) {
+		int len;
+
+		if (!of_fdt_device_is_available(fdt, child) ||
+		    (of_flat_dt_get_addr_size_prop(child, "reg", &len) && len))
 			continue;
-		}
 
-		dynamic_nodes[dynamic_nodes_cnt] = child;
-		dynamic_nodes_cnt++;
-	}
-	for (int i = 0; i < dynamic_nodes_cnt; i++) {
-		const char *uname;
-		int err;
-
-		child = dynamic_nodes[i];
-		uname = fdt_get_name(fdt, child, NULL);
-		err = __reserved_mem_alloc_size(child, uname);
-		if (!err)
-			count++;
+		__reserved_mem_alloc_size(child,
+					  fdt_get_name(fdt, child, NULL));
 	}
-	total_reserved_mem_cnt = count;
+
+	/* check for overlapping reserved regions */
+	__rmem_check_for_overlap();
+
+	/* Switch to the permanent address of the array */
+	reserved_mem_array_unmap(map, array_bytes);
+	reserved_mem = array;
 	return 0;
 }
 
-- 
2.43.0

