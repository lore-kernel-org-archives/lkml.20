Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802456;
	b=CuwooHAZ5cNHrB1aukbn2rc7zNuNCSpv5Ao6F1nhPywjqylc79ufQyllaHbwyW/TWnx2
	 fuE56b7W1q8VaySytTq2P3Z6X9aa+fO4TJkQxHJeHrmlqfXhHKAhMTjk+GPN0C+4hE7uG
	 4A692hbIXqbwZxPK5NHFpY3Ff5yVOVdoyBeHYN1g1TjAP3CuoGgGgzSt1jXqSxK11KTrv
	 vcaJaS5dVOgSWNfCJrwR8dFb5WEOJRvU33rL/biLKe/L27NAnKc8mW966TSY6nSbu71IZ
	 u0f1wK1OvRcE+2zOUkEKNVtxNhYyiwHmw772Xe9S8rlmqHTJ3urVHnIKRSL40S8BBlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802456;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0WXSuykhi7crntvVUGbfsS0MlbCXNDJUgB97cBxBT5A=;
	b=C1VQnyfr4uZLL73jxLk+T3GjNkbQHS4l/HB3H3t71ymvpa7njyBNfW60t64RVBM9aNRq
	 HrZ4XYT03RqtPVgndNFLYpPCWuT91pAzyFFWx/jeHsi+X2LyKmwJ8WHZH/xzrSf8U5pw/
	 jZT8cPWOUU2BZza/CWd8rBoWE41bOERnrfNh1SgS/ibwrOV+Rmxm+KIW0moA22RsRUEh4
	 5x/6GiZrZkZQYIKsZXjntKIMvKaalvFwreIFj6tCJ011GPn7eT4UzzNVtYL64xK+rZKlS
	 CCYrj2hg8/C4irbaix+2HR4APzKhlCYXuttNN36w3ioO8OMQ7TOXPvJuCoCHCeKQevQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D3Q+uqYs;
	arc=none smtp.remote-ip=91.218.175.56
Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E61B606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E61B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D3Q+uqYs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GMgJov71b/Qc03B6uHB28VY1Lt8AhbDmyr+enh6g+Wg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793802453; v=1; x=1794407253;
 b=D3Q+uqYs7tQCJspfbq4QY8YDaQm+UgK5v2+GIOrisFlYRjuq0RDzyMCd3F5QQ1DvPDwjW7gU
 cyW9eiy+tl7XQNX0uKMApHJiJrYrNjGNFS0GNQ4RhUKbb+nwSJ6xsSgG8KaFY1flElWZerhQeK3
 l14P2Y2UriCTGCPySaqV1aGo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 9113668f64b6e1be;
	Wed, 04 Nov 2026 14:27:33 +0000
X-Mizu-Trace-ID: 9113668f64b6e1be
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	jbohac@suse.cz,
	sourabhjain@linux.ibm.com,
	ruanjinjie@huawei.com,
	leitao@debian.org,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH] mm/hugetlb: allow crashkernel to reuse hugetlb CMA memory
Date: Wed,  4 Nov 2026 06:27:27 -0800
Message-ID: <20261104142727.2894800-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
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

crashkernel=size,cma reserves a separate CMA pool. On systems that
already reserve several gigabytes with hugetlb_cma= (which is common in
the Meta fleet), the crash kernel cannot use that existing memory as
part of its working set. With hugetlb_cma=6G, requesting another 2G
with crashkernel=2G,cma brings the total CMA reservation to 8G, none of
which can serve unmovable kernel allocations.

Allow crashkernel=size,hugetlb_cma to reuse existing hugetlb CMA memory.
For example:

  hugetlb_cma=6G crashkernel=256M crashkernel=2G,hugetlb_cma

The full 6G remains available to HugeTLB and movable allocations during
normal operation. After a crash, the capture kernel can use 2G of it
as additional working memory. The conventional reservation is still
required to hold the kernel image and initrd.

Use a separate suffix to make the exclusion of existing HugeTLB
allocations from the vmcore an explicit choice. The capture kernel
can overwrite the selected ranges, including allocated HugeTLB pages.
The dump completeness and pending DMA risks of crashkernel=size,cma
apply here as well.

Register the physical ranges in crashk_cma_ranges[] from an early
initcall, after dedicated crash CMA reservations and before CMA
activation. Use the existing crashkernel CMA code for the capture
kernel's memory map, vmcore exclusion and DMA delay.

Use the remaining slots within the four-range limit, clip the final
range to the page-aligned request and report any shortfall. Reject
sizes that would overflow page rounding.

Suggested-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 .../ABI/testing/sysfs-kernel-kexec-kdump      |  3 ++
 Documentation/admin-guide/kdump/kdump.rst     | 21 ++++++++
 .../admin-guide/kernel-parameters.txt         | 25 ++++++++++
 include/linux/hugetlb.h                       | 12 +++++
 kernel/crash_reserve.c                        | 49 +++++++++++++++++-
 mm/hugetlb_cma.c                              | 50 +++++++++++++++++++
 6 files changed, 158 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
index f59051b5d96d7..b8aa614ddde48 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -58,4 +58,7 @@ Description:	read only
 		the Contiguous Memory Allocator (CMA) area that are allocated
 		to the crash (kdump) kernel. It lists the start and end physical
 		addresses of CMA regions assigned for crashkernel use.
+		This includes existing HugeTLB CMA memory selected with
+		crashkernel=size,hugetlb_cma. These ranges remain usable
+		by the running kernel and are excluded from the vmcore.
 User:		kdump service
diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 7587caadbae1a..44f11ff338766 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -332,6 +332,27 @@ crashkernel syntax
 	less reliable and possibly incomplete kdump is preferable to no kdump at
 	all.
 
+5) crashkernel=size,hugetlb_cma
+
+   Reuse existing HugeTLB CMA memory as additional crash kernel memory after
+   a crash. For example, to reuse 2G of a 6G HugeTLB CMA reservation::
+
+       hugetlb_cma=6G crashkernel=256M crashkernel=2G,hugetlb_cma
+
+   A standard crashkernel reservation is still required for the kernel image
+   and initrd. The selected ranges remain available to HugeTLB and movable
+   allocations during normal operation. After a crash, the capture kernel
+   can overwrite their contents, including allocated HugeTLB pages, and the
+   ranges are excluded from the vmcore. The dump completeness and DMA risks
+   described for crashkernel=size,cma apply here too.
+
+   The kernel selects up to the requested size from the existing hugetlb CMA
+   areas. Both CMA options use the same limit of four physical ranges, with
+   crashkernel=size,cma ranges added first. If there is insufficient memory
+   or too few range slots, the kernel reports the shortfall and reuses the
+   available ranges. Unused pages in contributing CMA areas remain reserved
+   if CMA activation fails.
+
 Boot into System Kernel
 -----------------------
 1) Update the boot loader (such as grub, yaboot, or lilo) configuration
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd94..06b76125b5646 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1121,6 +1121,31 @@ Kernel parameters
 			possibly incomplete kdump is preferable to no kdump at
 			all.
 
+	crashkernel=size[KMG],hugetlb_cma
+			[KNL, X86, ARM64, RISCV, PPC] Use up to the specified
+			amount of existing hugetlb_cma memory as additional crash
+			kernel memory. Requires hugetlb_cma= and a standard
+			crashkernel reservation for the kernel image and initrd.
+			For example:
+			  hugetlb_cma=6G crashkernel=256M crashkernel=2G,hugetlb_cma
+
+			The selected memory remains available to HugeTLB and
+			movable allocations during normal operation. After a
+			crash, the capture kernel can overwrite these pages,
+			including allocated HugeTLB pages. The selected ranges
+			are excluded from the vmcore. The dump completeness
+			and DMA risks described for crashkernel=size,cma also
+			apply to this option.
+
+			Both CMA options use the same limit of four physical
+			ranges, with crashkernel=size,cma ranges added first.
+			If the available hugetlb CMA memory or range slots
+			cannot cover the requested size, the kernel reuses
+			what is available and reports the shortfall. Additional
+			CMA memory is not reserved by this option. Unused pages
+			in contributing CMA areas remain reserved if activation
+			fails.
+
 	cryptomgr.notests
 			[KNL] Disable crypto self-tests
 
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 58f755e70e966..69732e4cc03e2 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -1349,12 +1349,24 @@ static inline spinlock_t *huge_pte_lock(struct hstate *h,
 	return ptl;
 }
 
+struct range;
+
 #if defined(CONFIG_HUGETLB_PAGE) && defined(CONFIG_CMA)
 extern void __init hugetlb_cma_reserve(void);
+unsigned long long __init
+hugetlb_cma_add_crashkernel_ranges(unsigned long long size, struct range *ranges,
+				   int *nr_ranges, int max_ranges);
 #else
 static inline __init void hugetlb_cma_reserve(void)
 {
 }
+
+static inline unsigned long long
+hugetlb_cma_add_crashkernel_ranges(unsigned long long size, struct range *ranges,
+				   int *nr_ranges, int max_ranges)
+{
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
index eee37a11380ce..a03f0a4305a4e 100644
--- a/kernel/crash_reserve.c
+++ b/kernel/crash_reserve.c
@@ -16,6 +16,7 @@
 #include <linux/kmemleak.h>
 #include <linux/cma.h>
 #include <linux/crash_reserve.h>
+#include <linux/hugetlb.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -173,18 +174,20 @@ static int __init parse_crashkernel_simple(char *cmdline,
 #define SUFFIX_HIGH 0
 #define SUFFIX_LOW  1
 #define SUFFIX_CMA  2
-#define SUFFIX_NULL 3
+#define SUFFIX_HUGETLB_CMA 3
+#define SUFFIX_NULL 4
 static __initdata char *suffix_tbl[] = {
 	[SUFFIX_HIGH] = ",high",
 	[SUFFIX_LOW]  = ",low",
 	[SUFFIX_CMA]  = ",cma",
+	[SUFFIX_HUGETLB_CMA] = ",hugetlb_cma",
 	[SUFFIX_NULL] = NULL,
 };
 
 /*
  * That function parses "suffix"  crashkernel command lines like
  *
- *	crashkernel=size,[high|low|cma]
+ *	crashkernel=size,[high|low|cma|hugetlb_cma]
  *
  * It returns 0 on success and -EINVAL on failure.
  */
@@ -519,6 +522,48 @@ void __init reserve_crashkernel_cma(unsigned long long cma_size)
 }
 #endif
 
+/* hugetlb CMA and the dedicated crash CMA reservation are both set up now. */
+static int __init crashk_hugetlb_cma_init(void)
+{
+	unsigned long long size, base;
+#ifdef CRASHKERNEL_CMA
+	unsigned long long reused_size;
+	int cnt = crashk_cma_cnt;
+#endif
+
+	/* The kernel image and initrd still need a dedicated reservation. */
+	if (crashk_res.start >= crashk_res.end)
+		return 0;
+
+	if (__parse_crashkernel(boot_command_line, 0, &size, &base,
+				suffix_tbl[SUFFIX_HUGETLB_CMA]) || !size)
+		return 0;
+
+	if (size > ULLONG_MAX - (PAGE_SIZE - 1)) {
+		pr_warn("crashkernel hugetlb CMA size is too large\n");
+		return 0;
+	}
+	size = roundup(size, PAGE_SIZE);
+
+#ifdef CRASHKERNEL_CMA
+	reused_size = hugetlb_cma_add_crashkernel_ranges(size, crashk_cma_ranges,
+							 &crashk_cma_cnt,
+							 CRASHKERNEL_CMA_RANGES_MAX);
+
+	if (reused_size < size)
+		pr_warn("crashkernel hugetlb CMA reuse failed: %llu MB requested, %llu MB reused in %d ranges\n",
+			size >> 20, reused_size >> 20, crashk_cma_cnt - cnt);
+	else
+		pr_info("crashkernel hugetlb CMA reused: %llu MB in %d ranges\n",
+			reused_size >> 20, crashk_cma_cnt - cnt);
+#else
+	pr_warn("crashkernel hugetlb CMA reuse not supported\n");
+#endif
+
+	return 0;
+}
+early_initcall(crashk_hugetlb_cma_init);
+
 #ifndef HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY
 static __init int insert_crashkernel_resources(void)
 {
diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index cd6a64986278a..cd6f64da31a2c 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -11,6 +11,8 @@
 #include <linux/memblock.h>
 #include <linux/math.h>
 #include <linux/math64.h>
+#include <linux/range.h>
+#include "cma.h"
 #include "internal.h"
 #include "hugetlb_cma.h"
 
@@ -387,6 +389,54 @@ void __init hugetlb_cma_reserve(void)
 		hugetlb_cma_size = 0;
 }
 
+/**
+ * hugetlb_cma_add_crashkernel_ranges - share HugeTLB CMA with the crash kernel
+ * @size: maximum number of bytes to share, aligned to PAGE_SIZE
+ * @ranges: crash kernel memory ranges
+ * @nr_ranges: number of entries already in @ranges, updated on return
+ * @max_ranges: capacity of @ranges
+ *
+ * The shared memory remains available to the HugeTLB allocator until a crash.
+ * Only physical ranges belonging to successfully reserved CMA areas are added.
+ *
+ * Return: number of bytes shared.
+ */
+unsigned long long __init
+hugetlb_cma_add_crashkernel_ranges(unsigned long long size, struct range *ranges,
+				   int *nr_ranges, int max_ranges)
+{
+	unsigned long long shared_size = 0;
+	int nid, i;
+
+	for_each_node_mask(nid, hugetlb_bootmem_nodes) {
+		struct cma *cma = hugetlb_cma[nid];
+
+		if (!cma)
+			continue;
+
+		for (i = 0; i < cma->nranges; i++) {
+			struct cma_memrange *cmr = &cma->ranges[i];
+			unsigned long long range_size;
+			struct range *range;
+
+			if (shared_size == size || *nr_ranges == max_ranges)
+				return shared_size;
+
+			range_size = min_t(unsigned long long,
+					   PFN_PHYS(cmr->count), size - shared_size);
+			range = &ranges[(*nr_ranges)++];
+			range->start = PFN_PHYS(cmr->base_pfn);
+			range->end = range->start + range_size - 1;
+			shared_size += range_size;
+
+			/* Keep shared pages reserved if CMA activation fails. */
+			cma_reserve_pages_on_error(cma);
+		}
+	}
+
+	return shared_size;
+}
+
 bool hugetlb_cma_exclusive_alloc(void)
 {
 	return hugetlb_cma_only;
-- 
2.53.0-Meta

