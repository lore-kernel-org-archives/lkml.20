Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8B052FE32
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066652; cv=none; b=j4b3Opd4su14/n6wEgrD9BEIUTDl58QrVo0aRreVqFaubiooGkPXC5ocG5kiCClq4yXnSeSzWsCt5vS2EwRiu8CvkM15RW97T/S3KpXA9r2N9qxYQoBOldUDWgT/ExMHWFf+9QTOH7Ogj0xpeoGQWHVDNPuP3vANDcn9v4BhDqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066652; c=relaxed/simple;
	bh=fFnNsey8OSsFtgJfPqC05FAKDGriu+FcnuhksQ5sAVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKLszz9JYv+oA3tmot+T3EHT6mDhkJHREetycrsmmJFhIILVlaliBJllPiOevYGDwpYzmo7xWqiYA08Ow7j7mF6/eIHc1unQbRCQSrJFjDFfpIfpLzdjcxaMRX099lBVvqNAyFEtDYnGc0UzLAUUPJsXNijczpvcDh2MqVgfsF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQqzdKUF; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQqzdKUF"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6f230d1easo4520405ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066650; x=1790671450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrAQfB99bFPUaNh0c5d2OUhMy2tKXocwdCbeEYRe5yE=;
        b=jQqzdKUFur35mns6QtcpKXXzSuKsGzALgNZjAFLQuNcKZiuCjwsX0K5NXuC/2S2wqg
         Mk21X/zJoiB/jn9W06NHL/eXllIm7z2nXDoawtEWUTPB4EwnztqIVn8PtND0ov6yR7ow
         Kew7OS1gMLPy9HsuwSp994DnAIlBlItnwlFXk90a5rAnQslp2bvO9Ndcyj1sBn97szFo
         xhjSPLgomeSPmQN80ln/HbtxaMQxRXDgjb8Jst+zNgP/rPp9Vp84Xx8Gksi8IundAUdt
         vKoob/wWBuz1PucVxvujuz0pa8ufKo/dRu8Pr1394MAZr2ek0Lpusfc8W719aHAARS1f
         BTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066650; x=1790671450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XrAQfB99bFPUaNh0c5d2OUhMy2tKXocwdCbeEYRe5yE=;
        b=0jWcVmknjtOzHO8+rLeJZ8orXHAqlHGPxJp/IhaEEsuZ5U5rmeY1hjV0aqD9Jcu6L/
         4saoYessndZkZA19XF3wxGhrxky7mbQzGRIerArZ2t3MdiotjXVWtgxno4Cg0bklT2X4
         IIa576yrS4+NVwDoBECPoecP+Civ4gwVrM+oiB1AdOFHn/DCVTbsjb8gVVa7NQjS2JGU
         rFsSp0KwJb1GdWy1IHndwVkDI+AU6jeUSPR+D7Eh5X5bfA3h+wlj2GJDEi7LyB1SMufr
         Ve3ttFGMwZqsj9Qycutdq+jZMERWFgMEAA1h1bfLdTdupxuF/uXgFZ0WzYKNdfFx+wv1
         GeIg==
X-Forwarded-Encrypted: i=1; AKwUvBxarlAfyX/5a+yfvmNQy8AiDfPLCArTQQ77hLH1O9/AVdtE//d7XJCVFOUXvEsoY6kqCLSzQGEcJYYR7vo=@vger.kernel.org
X-Gm-Message-State: AFuF++nJvMN7bMvfDBL7YSzp/tqYY/367ycJ7msMLtJx7qZu920RpH0v
	ki87CSdN8tyFCW8rMOTvD2QbGWlasg9cvMqkTM/MVzC8Gd3nQ5MCYBbJ
X-Gm-Gg: AYBFou2mm7Miux6KtSTZSpaxLJeoraGpHDnpJhq3Lqk4LbvXM+iDAAvs1T7DY+6tZSS
	gHCfj9RBzIR1ev7huI0AjdmcPtRoiplx60oj5656vrcim/h5Ax8n7q4p5r3avN0VDQsIcy4S10I
	iBlwMaBVIsGXWfzZRdv1tKgAIbpCj7L4qaLh4YrMnV2xMM6q/AZG3arLjiMWkMb6Xr4N7x3fQti
	EpOeXsHMid9b/Y7ViHN1fcMTkomH8n7uEteJY7a+YGcQ11ufCGAv3OpLfqQEruziGED4roKjYJK
	wLMDQXHB8/jgywcCc/l1qxTIeJb1JHm+PTit3ygIgWmvMZesY9PEND7SoL4MpdRhCjvLwwCwtQD
	bIkhqyL7mV5AZv90P0I14uh+G9VOfy+IdIiBCSjN502HzbVb1/YLDPvRBWGWYSTLfSgXBmpAnRn
	KQm3Hq943EvKd3x3VfaeiFeb70xdPyo1haiaWmemWuyHm/KknoWRPGzOJoqGD11pOooy2QQ3EZS
	WKnvuIg5L8=
X-Received: by 2002:a17:90b:1e4a:b0:39e:4c7e:bc6 with SMTP id 98e67ed59e1d1-3a073666c4dmr246498a91.20.1790066650350;
        Tue, 22 Sep 2026 01:44:10 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:09 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 5/9] memblock: introduce MEMBLOCK_NODUMP flag
Date: Tue, 22 Sep 2026 16:42:52 +0800
Message-ID: <20260922084256.1515554-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add MEMBLOCK_NODUMP to mark regions that should be excluded from
kdump vmcores.

The flag is meant for reserved memory that carries no data useful for
crash analysis. Reusable reserved regions such as CMA may hold useful
data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
patches wire this up for /reserved-memory and /memreserve/ entries.

Regions in /memreserve/ (such as the initrd) may be reserved at the
beginning and freed later, so we also need to clear the flag when
freeing reserved memory.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 43 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index aa845f488327..0126b47bc3c4 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 
@@ -305,6 +309,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_SCRATCH;
 }
 
+static inline bool memblock_is_nodump(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_NODUMP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index ea0de4b5f356..48cabfe5cdf1 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -929,6 +929,8 @@ static unsigned long __free_reserved_area(phys_addr_t start, phys_addr_t end,
 	return pages;
 }
 
+static int memblock_clear_nodump(phys_addr_t base, phys_addr_t size);
+
 unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
 {
 	phys_addr_t start_pa, end_pa;
@@ -949,9 +951,13 @@ unsigned long free_reserved_area(void *start, void *end, int poison, const char
 	}
 
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
-		if (start_pa < end_pa)
+		if (start_pa < end_pa) {
 			memblock_remove_range(&memblock.reserved,
 					      start_pa, end_pa - start_pa);
+
+			if (IS_ENABLED(CONFIG_CRASH_DUMP))
+				memblock_clear_nodump(start_pa, end_pa - start_pa);
+		}
 	}
 
 	pages = __free_reserved_area(start_pa, end_pa, poison);
@@ -995,8 +1001,11 @@ int __init_memblock memblock_phys_free(phys_addr_t base, phys_addr_t size)
 
 	kmemleak_free_part_phys(base, size);
 
-	if (!slab_is_available() || IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
+	if (!slab_is_available() || IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
 		ret = memblock_remove_range(&memblock.reserved, base, size);
+		if (IS_ENABLED(CONFIG_CRASH_DUMP))
+			memblock_clear_nodump(base, size);
+	}
 
 	if (slab_is_available())
 		__free_reserved_area(base, base + size, -1);
@@ -1204,6 +1213,35 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_SCRATCH);
 }
 
+/**
+ * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Mark the region as not to be included in crash dumps.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_NODUMP);
+}
+
+/**
+ * memblock_clear_nodump - Clear a memory region with flag MEMBLOCK_NODUMP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+static int __init_memblock memblock_clear_nodump(phys_addr_t base,
+						 phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 0,
+				    MEMBLOCK_NODUMP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2880,6 +2918,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

