Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D133ED5DA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896570; cv=none; b=aDd/83TSs9sE8NOVYZ8Nhmp9EpJ/RLZSKKE4oZbZKr+dikEXac6SKtZRXt6n9NhwKqL2kIahXigm84OVINv0w76S4qwqPy9bJA2zHX0E16gBnsx0cVsNIOoW6pK3rAduPtOfbGMZfsPiEWfBSiF4/z5gBdp35qXVjSd0/aSHpkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896570; c=relaxed/simple;
	bh=LNR32bo9MZbhwnB9ad4i4/2psJWZcEuINS4tvZdMbDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orqnmsFi0DNehd+ER4WI5qynC1pDl6es0ivPRFya5FO/AETBS491bUvkkTJfEi+MtDCvqr/cUcNtF5kIZQSMH+PDqxFKNK79FmeZWznRsP39VDzzSU2yW42sEW+Vy6xQN/ab9mll7srpQzU71UGonW0TacBgKsJkoWKTCPOpgqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOs8j8z/; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOs8j8z/"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-398da2bdcb9so979627a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789896568; x=1790501368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxtCD6SnNu1NDzEpQGETPXmjrPB6bmHGJKpCRbMz92Y=;
        b=iOs8j8z/8Vx9zaKQW/mh70/dn9Egh7k/D2YDhFH8oDrxtpONMNHZwFvdb8J44jcvTW
         HPymCGdpLkwF0kTRoqALzhGlGFsdDlUrjy9bR01RVA1t1NUOMS//WcRIYXysFqEiwv9f
         fe6keo+OyDuP+PORktbM0eQed7ykCv5l3/aYgkmXu9n8KhqO6aL6zWRyC/OMaSdjc+zy
         wyChcrbVEKpWyy55mI0WRVn1td9l4z/qVB0YZFXtrniaMP0558QGgvJhEluIAGLLiezF
         JaR2W83atZQPcnJy8l/q0Dwg943yLTcm7R7HpzIpTv04QvDWpISY/4QCLnhGoKVBdHPu
         2uPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896568; x=1790501368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxtCD6SnNu1NDzEpQGETPXmjrPB6bmHGJKpCRbMz92Y=;
        b=kZJYiTeoqZxALrX1xUJS1N39FZYYiipoUTGUENY0nM4IZbOaBbaXjPuEtkehHJhjhP
         NiGm18gHggfe8lS75VqxNEzy8Hn4CyrmsctvYKyCMNvtt0Lo4ZKrwbDp1wKs6iAorf7s
         1Z4Dqvc+1EqAaX/VOvFCDMsgMT4fvYyI7Rg4K1fqL6eiHS5qWgx+5Oh+1yQASzIiCYaz
         ARPbO0sGHTcH36iApucKOLIv9DRKUnTHV7rubLPYvdw5lqpLK1tli+XoLnlEo1H+cDLk
         qKiO52qle4al4ATgcgDgjP/8C3b6N63Bx49PWK3Yg3hA4rF/TJbH/NV3UIvqHpYy5/xs
         ZZuw==
X-Forwarded-Encrypted: i=1; AKwUvBwQNHh21AQ4dvBoDI68k8PQ9/joI7YQKa1QjyvSTlHGY6CscsJ3sfg/YeEtDgt4c0bdfxX/5WCuXk3ukyo=@vger.kernel.org
X-Gm-Message-State: AFuF++lfSIW3fwacodG+3MZ58mNMPY6gZv1gR4pEBuzd5t1LvivbZ4wU
	AVBvHSTRMSa1akWp+zev6/cB1lAf16nFbx0zluDgtYyELMQE/nyoYYm+sabo2Nx6
X-Gm-Gg: AYBFou1mKW3HGP6Pl9vXvpsuv1IAihae3P0rQHND9zxO5nySfy60iE+GXaAILb/Fgg0
	fx7atd6xNRWSY1nZFGQkhYEzP/0Jm5o1EIPae7FsGQiYNsFcPYwx0O2W52UGSk/KChQsBHTRBwZ
	+G1E5dVwKdb+yta4bTdu+QwzEKNkwsevKcT64zDVuZJP88/IIY//Y1Ui9M2oAslWDPptdlsRIOu
	Xb807/SmgUtsRQBn9kZLKLZw3wPf05Ler6FppLHhLjFoO247b0aK32gyeWUxW5KjxShg2WcoHmm
	TU5FGSsECO0GsVBnWB5n9YrLxwMIADq0iiYnPMvVhAeDz/9glccu49Ye+4/HAF0Iz3MIxm993Dm
	tJpux/yacpFPRNA+z/Nph+TBQir8kFEpVk9EUJUn0xh8KkwzASkPAib6ZRt0VC8Fv/zXDbl+XfA
	ipJFSNW2K561o8+J2Mt8TG5RB4NjheUSGPGtfwR+yF+N7+sJdzLgqJrdtZL4bOvGMwK3ncj7xnJ
	FpytTjhm/0=
X-Received: by 2002:a17:90b:5787:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39e54ce45c2mr19449286a91.6.1789896568224;
        Sun, 20 Sep 2026 02:29:28 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c64csm8154917a91.10.2026.09.20.02.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:29:27 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v3 4/5] of: reserved_mem: reject static regions overlapping no-map memory
Date: Sun, 20 Sep 2026 17:28:51 +0800
Message-ID: <20260920092852.614973-5-chenwandun1@gmail.com>
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

Static no-map reserved-memory regions are marked in memblock.memory rather
than memblock.reserved. So the reservation overlap check does not reject a
static region that overlaps existing no-map memory.

Both regions can then be initialized and hand the same physical memory to
different reserved-memory drivers. So reject a static no-map region that
overlaps existing reserved no-map memory, and skip a no-map region in
the late scan that overlaps one already reserved.

Sashiko found this issue in [1].

Fixes: 86588296acbf ("fdt: Properly handle "no-map" field in the memory region")
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kernel.org [1]
---
 drivers/of/of_reserved_mem.c | 23 +++++++++++++++++++++--
 include/linux/memblock.h     |  1 +
 mm/memblock.c                | 26 ++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 3a6c6dbfd7b1..8d2057f2ac12 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -131,7 +131,8 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 		 * if the region isn't memory as it won't be mapped.
 		 */
 		if (memblock_overlaps_region(&memblock.memory, base, size) &&
-		    memblock_is_region_reserved(base, size))
+		    (memblock_is_region_reserved(base, size) ||
+		     memblock_overlaps_nomap_region(base, size)))
 			return -EBUSY;
 
 		ret = memblock_mark_nomap(base, size);
@@ -266,6 +267,20 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+static bool __init rmem_overlaps_check(phys_addr_t base, phys_addr_t size,
+				       int start)
+{
+	int i;
+
+	for (i = start; i < reserved_mem_count; i++) {
+		struct reserved_mem *r = &reserved_mem[i];
+
+		if (memblock_addrs_overlap(base, size, r->base, r->size))
+			return true;
+	}
+	return false;
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
@@ -279,7 +294,7 @@ void __init fdt_scan_reserved_mem_late(void)
 {
 	const void *fdt = initial_boot_params;
 	phys_addr_t base, size;
-	int node, child;
+	int node, child, static_reserved_start;
 
 	if (!fdt)
 		return;
@@ -299,6 +314,8 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 	}
 
+	static_reserved_start = reserved_mem_count;
+
 	fdt_for_each_subnode(child, fdt, node) {
 		const __be32 *prop;
 		const char *uname;
@@ -326,6 +343,8 @@ void __init fdt_scan_reserved_mem_late(void)
 			continue;
 
 		nomap = of_get_flat_dt_prop(child, "no-map", NULL) != NULL;
+		if (nomap && rmem_overlaps_check(base, size, static_reserved_start))
+			continue;
 		if (!memblock_is_region_rsrv_rmem(base, size, nomap))
 			continue;
 
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 03613fa0c894..34a695542ab1 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -504,6 +504,7 @@ bool memblock_is_map_memory(phys_addr_t addr);
 bool memblock_is_region_memory(phys_addr_t base, phys_addr_t size);
 bool memblock_is_reserved(phys_addr_t addr);
 bool memblock_is_region_reserved(phys_addr_t base, phys_addr_t size);
+bool memblock_overlaps_nomap_region(phys_addr_t base, phys_addr_t size);
 
 void memblock_dump_all(void);
 
diff --git a/mm/memblock.c b/mm/memblock.c
index d88e926e2ea5..58c9281e729e 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2222,6 +2222,32 @@ bool __init_memblock memblock_is_region_rsrv_rmem(phys_addr_t base,
 	return true;
 }
 
+/**
+ * memblock_overlaps_nomap_region - check if a region intersects no-map memory
+ * @base: base of region to check
+ * @size: size of region to check
+ *
+ * Check if the region [@base, @base + @size) intersects a memory block
+ * marked %MEMBLOCK_NOMAP.
+ *
+ * Return:
+ * True if they intersect, false if not.
+ */
+bool __init_memblock memblock_overlaps_nomap_region(phys_addr_t base,
+						    phys_addr_t size)
+{
+	struct memblock_region *region;
+
+	memblock_cap_size(base, &size);
+	for_each_mem_region(region) {
+		if (memblock_is_nomap(region) &&
+		    memblock_addrs_overlap(base, size, region->base, region->size))
+			return true;
+	}
+
+	return false;
+}
+
 void __init_memblock memblock_trim_memory(phys_addr_t align)
 {
 	phys_addr_t start, end, orig_start, orig_end;
-- 
2.43.0

