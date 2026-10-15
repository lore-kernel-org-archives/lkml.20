Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA0F4AF16C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052624; cv=none; b=Cp9lz2iCTqJ54c/dGYpYx294Utt0rBEmIf8i8LlOKno6qRrJ5G0lJggbwRrTuSgaL5rJti23PtaeQEKYpuZ7dSMloWWV1At/VhDqWh8OTWfd+FS5IQ7R2VCq73U6B4G7ytvOVHZJWI3PeN3/u5jauI1pK/ZQ9sYM6+xyD2wITtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052624; c=relaxed/simple;
	bh=RO2V9D3lDs10AqXnBd69Cli0KQw+tcYEQAu4QppztAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=XcPh6FzAMP3XPREGGGM9LNpzoNpTCr18UFasHcMRBMRDsUuTjSV8HheA7OtwU8+MOViGK/tevsu2eAMIHphx0fP9CPa6BxakdJNk0ugaI/tfNyzMleyA4EN5yyqy+/abqP+vMnCTyfI1BTX5/GiGPTw3bZvuitWfttbkMTyZnt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IUHo+M1A; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IUHo+M1A"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261015082335euoutp02235e442edb7a32c3a9711b3bd790b2c3~eplvv4q101380213802euoutp02N
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:23:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261015082335euoutp02235e442edb7a32c3a9711b3bd790b2c3~eplvv4q101380213802euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792052615;
	bh=T+uMgy6CwOY6sZg5J8GocyYqnUc0PenC+Wgmxlcn8xA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IUHo+M1A6ViQ3rhe0E/CYeTupEeVNwjUvzSkMzP7moKmw0nu/J/+pEtumWymKFYHR
	 tFcGkR4BWHDTdehe6Ofu0OIJR8Y0Juz0lHItMBE6rqeTb54xhOBg700nHoAE1SQYqH
	 RP1aaGJB959Vc6mQG3dqd8qLa/4uxqIORHN+WfA8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6~eplu1ssOo1043310433eucas1p2R;
	Thu, 15 Oct 2026 08:23:34 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261015082334eusmtip1cad8d9f099bdfef53598821b6e123448~epluVdhex0605006050eusmtip1J;
	Thu, 15 Oct 2026 08:23:33 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mike Rapoport
	<rppt@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@kernel.org>, Oreoluwa Babatunde
	<oreoluwa.babatunde@oss.qualcomm.com>, Wandun <chenwandun1@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 2/2] of: reserved_mem: allocate and map the reserved_mem
 array early
Date: Thu, 15 Oct 2026 10:23:12 +0200
Message-ID: <20261015082315.56876-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015082315.56876-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6
X-EPHeader: CA
X-CMS-RootMailID: 20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6
References: <20261015082315.56876-1-m.szyprowski@samsung.com>
	<CGME20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6@eucas1p2.samsung.com>

Get rid of the static, limited-size reserved_mem array and replace it
with array allocated by memblock_alloc_raw() and accessed directly or
through a temporary early_memremap() mapping (depending on the
architecture support). Such mapping is needed for some architectures
(like ARM64), where linear map is not yet available during early boot
scan. The array is allocated from the bottom of RAM to avoid placing it
in highmem area, because some architectures (e.g. Xtensa, C-SKY, MIPS32)
set the memblock limit to the end of lowmem only after the early scan.
The early mapping is not used on PPC64, where the scan is done before
early_ioremap_setup(), but the memory allocated by memblock is already
accessible at that point.

Having a single, writeable array with all reserved regions removes the
need to perform two step initialization introduced by commit
8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
regions are processed"), so all regions can be processed during the
early scan again.

The reserved_mem array is allocated only after all static (defined by
the 'reg' property) regions are marked as reserved or no-map, so it
cannot be placed in any of them. Errors of the early reservations are
not recorded per region, only the fact that some of them failed is
stored and a message asking to fix the device-tree is printed. The
region specific init functions for the static regions are then called
in a separate pass, once the array is available. Then all dynamically
allocated reserved regions are processed.

Suggested-by: Mike Rapoport <rppt@kernel.org>
Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/of/fdt.c             |   3 -
 drivers/of/of_private.h      |   2 -
 drivers/of/of_reserved_mem.c | 277 ++++++++++++++++-------------------
 3 files changed, 123 insertions(+), 159 deletions(-)

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
index 300fb236ab59..0fd1683cba01 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -27,10 +27,10 @@
 
 #include "of_private.h"
 
-static struct reserved_mem reserved_mem_array[MAX_RESERVED_REGIONS] __initdata;
-static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
-static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
+static struct reserved_mem *reserved_mem __refdata;
+static int total_reserved_mem_cnt;
 static int reserved_mem_count;
+static bool reserved_mem_reserve_failed __initdata;
 
 static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
@@ -59,57 +59,28 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 }
 
 /*
- * alloc_reserved_mem_array() - allocate memory for the reserved_mem
- * array using memblock
- *
- * This function is used to allocate memory for the reserved_mem
- * array according to the total number of reserved memory regions
- * defined in the DT.
- * After the new array is allocated, the information stored in
- * the initial static array is copied over to this new array and
- * the new array is used from this point on.
+ * On some architectures (e.g. ARM64) the linear mapping is not yet usable
+ * during the early reserved memory scan, so the array has to be accessed
+ * through a temporary early mapping. PPC64 runs the scan before early_ioremap
+ * is initialized, but the memory returned by memblock is already accessible.
  */
-static int __init alloc_reserved_mem_array(void)
+#if defined(CONFIG_GENERIC_EARLY_IOREMAP) && !defined(CONFIG_PPC64)
+#include <asm/early_ioremap.h>
+static inline void *early_array_map(void *array, size_t size)
 {
-	struct reserved_mem *new_array;
-	size_t alloc_size, copy_size, memset_size;
-	int ret;
-
-	if (!total_reserved_mem_cnt)
-		return 0;
-
-	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
-	if (alloc_size == SIZE_MAX) {
-		ret = -EOVERFLOW;
-		goto fail;
-	}
-
-	new_array = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
-	if (!new_array) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	copy_size = array_size(reserved_mem_count, sizeof(*new_array));
-	if (copy_size == SIZE_MAX) {
-		memblock_free(new_array, alloc_size);
-		ret = -EOVERFLOW;
-		goto fail;
-	}
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
+	return early_memremap(__pa(array), size);
+}
+static inline void early_array_unmap(void *map, size_t size)
+{
+	early_memunmap(map, size);
+}
+#else
+static inline void *early_array_map(void *array, size_t size)
+{
+	return array;
 }
+static inline void early_array_unmap(void *map, size_t size) {}
+#endif
 
 static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
 				       phys_addr_t base, phys_addr_t size);
@@ -174,10 +145,42 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	} else {
 		pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
 		       uname, &base, (unsigned long)(size / SZ_1M));
+		reserved_mem_reserve_failed = true;
 	}
 	return 0;
 }
 
+/*
+ * __reserved_mem_init_reg() - initialize a static reserved memory region
+ * described in the first entry in 'reg' property
+ */
+static int __init __reserved_mem_init_reg(unsigned long node,
+					  const char *uname)
+{
+	phys_addr_t base, size;
+	const __be32 *prop;
+	int len, err;
+	u64 b, s;
+
+	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
+	if (!prop || !len)
+		return -ENOENT;
+
+	err = fdt_validate_reserved_mem_node(node, NULL);
+	if (err && err != -ENODEV)
+		return err;
+
+	of_flat_dt_read_addr_size(prop, 0, &b, &s);
+	base = b;
+	size = s;
+
+	if (!size)
+		return -ENOENT;
+
+	fdt_init_reserved_mem_node(node, uname, base, size);
+	return 0;
+}
+
 /*
  * __reserved_mem_alloc_in_range() - allocate reserved memory described with
  *	'alloc-ranges'. Choose bottom-up/top-down depending on nearby existing
@@ -381,143 +384,109 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
-/**
- * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
- * memory regions.
+/*
+ * fdt_scan_reserved_mem() - reserve and allocate memory occupied by
+ * reserved memory regions.
  *
- * This function is used to scan again through the DT and initialize the
- * "static" reserved memory regions, that are defined using the "reg"
- * property. Each such region is then initialized with its specific init
- * function and stored in the global reserved_mem array.
+ * This function is used to scan through the FDT, mark all static (defined by
+ * the "reg" property) reserved memory regions as reserved or no-map. Then
+ * the reserved_mem array is allocated and a region specific init function
+ * is called for each static region. Finally, memory for all dynamic regions
+ * (defined by size & alignment) is allocated and their init functions are
+ * called. Region information is stored in the reserved_mem array.
  */
-void __init fdt_scan_reserved_mem_late(void)
+int __init fdt_scan_reserved_mem(void)
 {
+	struct reserved_mem *array, *map;
+	bool bottom_up = memblock_bottom_up();
+	size_t array_bytes;
+	int node, child, cnt = 0;
 	const void *fdt = initial_boot_params;
-	phys_addr_t base, size;
-	int node, child;
-
-	if (!fdt)
-		return;
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
-	if (node < 0) {
-		pr_info("Reserved memory: No reserved-memory node in the DT\n");
-		return;
-	}
-
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	if (alloc_reserved_mem_array())
-		return;
+	if (node < 0)
+		return -ENODEV;
 
-	if (__reserved_mem_check_root(node)) {
+	if (__reserved_mem_check_root(node) != 0) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		return;
+		return -EINVAL;
 	}
 
+	/* First pass: reserve the statically-placed regions */
 	fdt_for_each_subnode(child, fdt, node) {
-		const __be32 *prop;
-		const char *uname;
-		u64 b, s;
-		int ret;
 		int len;
 
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
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
+		/* static regions use 'reg', dynamic ones use 'size' */
+		if ((of_flat_dt_get_addr_size_prop(child, "reg", &len) && len) ||
+		    (of_get_flat_dt_prop(child, "size", &len) && len))
+			cnt++;
 
-		if (size) {
-			uname = fdt_get_name(fdt, child, NULL);
-			fdt_init_reserved_mem_node(child, uname, base, size);
-		}
+		__reserved_mem_reserve_reg(child,
+					   fdt_get_name(fdt, child, NULL));
 	}
 
-	/* check for overlapping reserved regions */
-	__rmem_check_for_overlap();
-}
+	if (reserved_mem_reserve_failed)
+		pr_err("Some reserved memory regions could not be reserved, system might be unstable. Please fix the device-tree.\n");
 
-/*
- * fdt_scan_reserved_mem() - reserve and allocate memory occupied by
- * reserved memory regions.
- *
- * This function is used to scan through the FDT and mark memory occupied
- * by all static (defined by the "reg" property) reserved memory regions.
- * Then memory for all dynamic regions (defined by size & alignment) is
- * allocated, a region specific init function is called and region information
- * is stored in the reserved_mem array.
- */
-int __init fdt_scan_reserved_mem(void)
-{
-	int node, child;
-	int dynamic_nodes_cnt = 0, count = 0;
-	int dynamic_nodes[MAX_RESERVED_REGIONS];
-	const void *fdt = initial_boot_params;
+	if (!cnt)
+		return 0;
 
-	node = fdt_path_offset(fdt, "/reserved-memory");
-	if (node < 0) {
-		total_reserved_mem_cnt = 0;
-		return -ENODEV;
+	array_bytes = array_size(cnt, sizeof(*array));
+	/*
+	 * Allocate bottom-up, as some architectures (e.g. Xtensa, C-SKY,
+	 * MIPS32) don't limit memblock to lowmem yet at this point.
+	 */
+	memblock_set_bottom_up(true);
+	array = memblock_alloc_raw(array_bytes, SMP_CACHE_BYTES);
+	memblock_set_bottom_up(bottom_up);
+	if (!array) {
+		pr_err("Failed to allocate memory for reserved_mem array\n");
+		return -ENOMEM;
 	}
 
-	if (__reserved_mem_check_root(node) != 0) {
-		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		total_reserved_mem_cnt = 0;
-		return -EINVAL;
+	map = early_array_map(array, array_bytes);
+	if (!map) {
+		pr_err("Failed to map memory for reserved_mem array\n");
+		memblock_free(array, array_bytes);
+		return -ENOMEM;
 	}
+	memset(map, 0, array_bytes);
 
-	fdt_for_each_subnode(child, fdt, node) {
-		const char *uname;
-		int err;
+	reserved_mem = map;
+	total_reserved_mem_cnt = cnt;
 
+	/* Second pass: initialize the static regions */
+	fdt_for_each_subnode(child, fdt, node) {
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
-		uname = fdt_get_name(fdt, child, NULL);
-
-		err = __reserved_mem_reserve_reg(child, uname);
-		if (!err)
-			count++;
+		__reserved_mem_init_reg(child, fdt_get_name(fdt, child, NULL));
+	}
 
-		/*
-		 * Save the nodes for the dynamically-placed regions
-		 * into an array which will be used for allocation right
-		 * after all the statically-placed regions are reserved
-		 * or marked as no-map. This is done to avoid dynamically
-		 * allocating from one of the statically-placed regions.
-		 */
-		if (err != -ENOENT || !of_get_flat_dt_prop(child, "size", NULL))
-			continue;
+	/*
+	 * Allocate the dynamically-placed regions only after all the
+	 * statically-placed ones are reserved, to avoid overlapping with them.
+	 */
+	fdt_for_each_subnode(child, fdt, node) {
+		int len;
 
-		if (dynamic_nodes_cnt == MAX_RESERVED_REGIONS) {
-			pr_err("too many defined dynamic regions, skip '%s'\n",
-			       uname);
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
+	/* Check for overlapping reserved regions */
+	__rmem_check_for_overlap();
+
+	/* Switch to the permanent address of the array */
+	early_array_unmap(map, array_bytes);
+	reserved_mem = array;
 	return 0;
 }
 
-- 
2.43.0

