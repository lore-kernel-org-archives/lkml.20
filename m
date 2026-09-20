Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D453ED13F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896565; cv=none; b=Fdvpaj+z6CiZR5QbU08h3IN2YSXPNFN/K9czutnCwl9GYn+jcuEaH/1Y2lIRYTur6JcpDP54l5DS4CQ55ZOBMlYbXRSQ+N43y3iQ1ciLo/tMJ/zVI2WPToTqNyYrn6r6LAoIievxOY4iSg/v3fylaz7kjQyc2T3H60pDu4wDVCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896565; c=relaxed/simple;
	bh=BubAOpyWa9dplLnoG7syB3zPhW4qUYlyZ3mH75IAhEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QPVervPvr8Wd3P9CKLkzbV6l0H46wzt0puT8UYsnP082Ib8n36uiP+ys1yGfua2HXiPZ+yOixTCr3PIJCQkDMUZx9bVdFqF9OkNy7Md3oIX5abeS/LA6YtKC1I5ogVtjPn34+LsrXp5iuXsmssKiq620ph9mlsu1LAb6BBdMhg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T23oQ3vK; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T23oQ3vK"
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3965683e9e9so1587823a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789896562; x=1790501362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqWx8mKAaudoHgwpRkE/5/zADaw3qTiUOzjXR8usL9g=;
        b=T23oQ3vKWxZqrWI4iMUF66JK2shJ/TH6eHC4LBkKeC2j5qaiuWduWqJLHP9tMWZN9A
         cyR1/67+abAUEh5B42uxj/DttasHeAVpjnqn9jcczT0T78uOeq2EC4G6yEuYpPHanjuf
         jV+sFTdZc6Br9SYb8woG/u1Rke0pSLRQ994Ttj3mUDXkhhACDyu3V2r/x+unc87HUKgs
         8vfiXP5BZMKXz9H9loEzv0HtyWl3PhurSKdVG1MJkjZW+5Sco2DbY6Vt3CGYvYP+tLr+
         +zTgrXFHaY76R9eSNSQ4I4X0Gp6RlYNoWvHZ1vwSLBmix2G4ks0Lu99749ch24/5KW0z
         2bHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896562; x=1790501362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fqWx8mKAaudoHgwpRkE/5/zADaw3qTiUOzjXR8usL9g=;
        b=wPEeCv4xsSGLZb82aEC+nPNCXHqKZyO1zQqakxdOvppuEyeoK+feqxZ7qQ5Zlc7cyP
         j5otupiDlVUF0de+6F7+6jhl/NRhbIs6D+eflES4rj2TceluZ07LunTZQ05+9U0CI1uP
         4jp8xZ8z9I1eX16h9OrcjbU/wHliYYt8InisaWTxFw4qVI/WfpFptPW3nUIoaYikP4yc
         gP5mpPsRMH+o6AQdt2o4OkxGvgW71Qb4CeGMWt1x6XAiZvcA1CjNShuePrgRgk7K9A92
         kEp2ttyk3C8Vgrdz43BE3/RIF/PpetmPlX2G7kUo4koVnDLCJsjbpLe+DYsfRd6zgSTp
         H8aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNYnjyHtkaR/8mkfuZHXSSuWcynJArmT43hQ0BrfzZ5wRdUYjvQHygT+ddtdGfqackSHGJ/tWkmToM6kg=@vger.kernel.org
X-Gm-Message-State: AFuF++lpacvCXoHf4HIFMY3Oznolwa87JgDEoWkxCqJrPFzdHM2KpGej
	Ki9X0Ef4kcCd/Gl9I4V303sPMX7ximX2Vj05OsGOdYzjnjZWf3rJpsYk
X-Gm-Gg: AYBFou1GKLkdA/PZTF5KodlxZcjX28wAB+EGJYDGFKqxsBN2iV+p8WgUraO0g0Du5QD
	lg/oc+OA08UVjABD3o4MZbOcSlN3R8+WhnyiBVD0Y8elRa0fqw/jOfxmG1ykKFZ55dUXpROGs/G
	yI9qHx6I6z7msmsa7cyd0U7Hv2jfKsy7AWLUjtdMmBN/33KE+SXZaOyHMc4rQ8Fg9G4FAH/+B0C
	AUlaNBLQC48yuagRbmOCDHxEt/mSiw67Z/AUPUYCvY9tZjTq0g6ehNj0UsYV0bMw3n2s2txYvhD
	mxWAKx9tp/ZZgTPxowS6p33pxoc+gghdQHJ/efmdsCw4bjGX9caTb27N7kfP9Y7IyW8Nc2a8kFk
	K1Opfu1Md0yLxO98ns7lipWwzd5dRSmxvhwSIG6HH1pS5goHyMU4DRaRZQBCElhViDhGWm+7TS/
	deYRRSbpJ6/N1FTkLBeVYKozo8oLpolWKygu1gT7orVsSIkQMqeAJFZDUW5zv2+7monM5noQA33
	A+8QfpqPo4=
X-Received: by 2002:a17:90b:4b85:b0:3a0:42a9:9c73 with SMTP id 98e67ed59e1d1-3a042a99fd2mr465493a91.38.1789896561858;
        Sun, 20 Sep 2026 02:29:21 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c64csm8154917a91.10.2026.09.20.02.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:29:21 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v3 3/5] of: reserved_mem: skip init for regions whose early reservation failed
Date: Sun, 20 Sep 2026 17:28:50 +0800
Message-ID: <20260920092852.614973-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920092852.614973-1-chenwandun1@gmail.com>
References: <20260920092852.614973-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

__reserved_mem_reserve_reg() discards the error from
early_init_dt_reserve_memory() and returns 0 unconditionally, so the
caller counts the node in total_reserved_mem_cnt and the late scan
initializes it without checking whether the early reservation actually
succeeded. A region whose reservation failed is then handed to a
device assuming the memory is protected.

Tag each region in memblock with MEMBLOCK_RSRV_RMEM when its early
reservation succeeds, so the late scan can check whether the node's own
reservation succeeded and skip those that failed.

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 46 ++++++++++++++++++------
 include/linux/memblock.h     |  6 ++++
 mm/memblock.c                | 69 ++++++++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+), 11 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 2c64d85cabc6..3a6c6dbfd7b1 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -122,6 +122,8 @@ static int fdt_fixup_reserved_mem_node(unsigned long node,
 static int __init early_init_dt_reserve_memory(phys_addr_t base,
 					       phys_addr_t size, bool nomap)
 {
+	int ret;
+
 	if (nomap) {
 		/*
 		 * If the memory is already reserved (by another region), we
@@ -132,9 +134,16 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 		    memblock_is_region_reserved(base, size))
 			return -EBUSY;
 
-		return memblock_mark_nomap(base, size);
+		ret = memblock_mark_nomap(base, size);
+		if (!ret)
+			memblock_mark_rsrv_rmem(base, size);
+		return ret;
 	}
-	return memblock_reserve(base, size);
+
+	ret = memblock_reserve(base, size);
+	if (!ret)
+		memblock_mark_rsrv_rmem(base, size);
+	return ret;
 }
 
 /*
@@ -168,14 +177,19 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	base = b;
 	size = s;
 
-	if (size && early_init_dt_reserve_memory(base, size, nomap) == 0) {
-		fdt_fixup_reserved_mem_node(node, base, size);
-		pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
-			 uname, &base, (unsigned long)(size / SZ_1M));
-	} else {
+	if (!size)
+		return -EINVAL;
+
+	err = early_init_dt_reserve_memory(base, size, nomap);
+	if (err) {
 		pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
 		       uname, &base, (unsigned long)(size / SZ_1M));
+		return err;
 	}
+
+	fdt_fixup_reserved_mem_node(node, base, size);
+	pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
+		 uname, &base, (unsigned long)(size / SZ_1M));
 	return 0;
 }
 
@@ -288,6 +302,7 @@ void __init fdt_scan_reserved_mem_late(void)
 	fdt_for_each_subnode(child, fdt, node) {
 		const __be32 *prop;
 		const char *uname;
+		bool nomap;
 		u64 b, s;
 		int ret;
 		int len;
@@ -307,10 +322,15 @@ void __init fdt_scan_reserved_mem_late(void)
 		base = b;
 		size = s;
 
-		if (size) {
-			uname = fdt_get_name(fdt, child, NULL);
-			fdt_init_reserved_mem_node(child, uname, base, size, false);
-		}
+		if (!size)
+			continue;
+
+		nomap = of_get_flat_dt_prop(child, "no-map", NULL) != NULL;
+		if (!memblock_is_region_rsrv_rmem(base, size, nomap))
+			continue;
+
+		uname = fdt_get_name(fdt, child, NULL);
+		fdt_init_reserved_mem_node(child, uname, base, size, false);
 	}
 
 	/* check for overlapping reserved regions */
@@ -662,8 +682,12 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 
 		if (dynamic && nomap)
 			memblock_clear_nomap(rmem->base, rmem->size);
+
 		if (dynamic || !nomap)
 			memblock_phys_free(rmem->base, rmem->size);
+
+		if (!dynamic)
+			memblock_clear_rsrv_rmem(rmem->base, rmem->size);
 		return;
 	} else {
 		phys_addr_t end = rmem->base + rmem->size - 1;
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index aa845f488327..03613fa0c894 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,7 @@ extern unsigned long long max_possible_pfn;
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_RSRV_RMEM: memory reserved by a static /reserved-memory node
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +64,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_RSRV_RMEM	= 0x100, /* static /reserved-memory node */
 };
 
 /**
@@ -160,6 +162,10 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
+int memblock_mark_rsrv_rmem(phys_addr_t base, phys_addr_t size);
+int memblock_clear_rsrv_rmem(phys_addr_t base, phys_addr_t size);
+bool memblock_is_region_rsrv_rmem(phys_addr_t base, phys_addr_t size,
+				  bool nomap);
 
 void memblock_free(void *ptr, size_t size);
 
diff --git a/mm/memblock.c b/mm/memblock.c
index ea0de4b5f356..d88e926e2ea5 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1204,6 +1204,39 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_SCRATCH);
 }
 
+/**
+ * memblock_mark_rsrv_rmem - Mark a region reserved by a static /reserved-memory node
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Only called for statically placed reserved-memory regions (those defined
+ * by a "reg" property), so the late scan can later tell such a region apart
+ * from one reserved by unrelated code.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_rsrv_rmem(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_RSRV_RMEM);
+}
+
+/**
+ * memblock_clear_rsrv_rmem - Clear the static /reserved-memory node tag
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Only called for statically placed reserved-memory regions whose late
+ * initialization failed, to undo the tag set by memblock_mark_rsrv_rmem().
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_rsrv_rmem(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 0,
+				    MEMBLOCK_RSRV_RMEM);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2154,6 +2187,41 @@ bool __init_memblock memblock_is_region_reserved(phys_addr_t base, phys_addr_t s
 	return memblock_overlaps_region(&memblock.reserved, base, size);
 }
 
+/**
+ * memblock_is_region_rsrv_rmem - check if a range is tagged by MEMBLOCK_RSRV_RMEM
+ * @base: the base phys addr of the range
+ * @size: the size of the range
+ * @nomap: the expected no-map state of the range
+ *
+ * A range with no overlap in memblock.memory lies entirely outside
+ * declared system memory, where the tag could never be applied, so it is
+ * treated as reserved. Otherwise, every overlapping region must carry the
+ * %MEMBLOCK_RSRV_RMEM tag and match @nomap.
+ *
+ * Return: true if the range is reserved, false otherwise.
+ */
+bool __init_memblock memblock_is_region_rsrv_rmem(phys_addr_t base,
+						  phys_addr_t size, bool nomap)
+{
+	phys_addr_t end = base + memblock_cap_size(base, &size);
+	unsigned long i;
+
+	for (i = 0; i < memblock.memory.cnt; i++) {
+		struct memblock_region *r = &memblock.memory.regions[i];
+
+		if (r->base >= end)
+			break;
+		if (!memblock_addrs_overlap(base, size, r->base, r->size))
+			continue;
+		if (!(r->flags & MEMBLOCK_RSRV_RMEM))
+			return false;
+		if (memblock_is_nomap(r) != nomap)
+			return false;
+	}
+
+	return true;
+}
+
 void __init_memblock memblock_trim_memory(phys_addr_t align)
 {
 	phys_addr_t start, end, orig_start, orig_end;
@@ -2880,6 +2948,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_RSRV_RMEM)] = "RSV_RMEM",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

