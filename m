Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.34.181.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396657;
	b=lxR3bbkIS0sulj7MKTxLIL4XV/mVfcDDVb3iFHQOl3SeA3qb7RyEynM4eYPSzEooylKU
	 rKuZkHpIcXhQTHM03idiB4OCevgPgU9EmTmgRUhImNoUvC5R7yIbCDiyPtc9AxmqiEIOT
	 OBkqGX6z3niUkznlEiU4F+8fn889xQU6DD2UBKgemmOOd5jmG0gsYMS1QrgRagD6nrT5R
	 UiJ7vaeLoednCsvvvswATA0npzfmKH5MhnCJrOK1fGhySA1hYnCcP9GA1J4MJWrdwi3MM
	 nUdMfOExJEGjNbNNB6V8Sjlq1oITOsFNaEdwfqQ0k8u/l16BqCLtZxquQrgcHWDSngA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396657;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=RBMjWezikr45NoJ66aB47iMoKkdotttd3ck0karoe8g=;
	b=AO5dlRG8lfs6L6BDnliGSv2C3qyS5JlqpASoXozzgY9Ra6FhJInRsZMOC5kJPsYNgeZZ
	 ckkZPG4eLe96COwaCD5EwAVENN4OwLs4JY4946hb3uwSeD65lPi7KS9OT8exDtTS1xwKL
	 D11tUAyO9GHhcQZ4Mt0eE8nhdnnMT3wHnp1NhF9Av1xEyAOCtbe3aHxBNzR8DCqawNg03
	 DFvTuL7+xE28+a3+I1/7/WzEc1sZ2FqLZPWHOU8DcREIYKHphQu5tt1C7gu5IMtqQA49x
	 SULq4R9cMioZTjHY1t+t/HAiZZra8w0x7OCkip9l9oiLMQizUdNw3k9D46+mWQMbG0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Crhq5tzM;
	arc=none smtp.remote-ip=52.34.181.151
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3F7606A888
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3F7606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Crhq5tzM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794396657; x=1825932657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RBMjWezikr45NoJ66aB47iMoKkdotttd3ck0karoe8g=;
  b=Crhq5tzMQRX7s5GfiBPGWTIKk7I1U3n4rgfBnC4Thq0vSDt06RM+6eTl
   m/wd7YyD2K30xbyyWMl3NGdYoEmqV/9gERYfiMG35XvNICxixCqq0OzhJ
   xh9CGMBsNVUWCNvMc3znjSMJNT3loH48R4jq0WKxOOCMzz861k7Eh0jiB
   WVKU82Pxb3ivORcdJ5SG6WkF7trvUiwY4/U9CcyMwIP7Qi/P8h3L5nTv6
   K4qjvndsakZ/1YR8PhSdPXR518lGEXVm8MW79+uO0TKFMmk1OsE728UDq
   NA+idnH9BBdMKQZ4Kc27zo7kzV3bWqRNh4pmevUrJkHGOHtxpKuviapOz
   Q==;
X-CSE-ConnectionGUID: 7WZUimJ7SEqG4s0iEl+c0Q==
X-CSE-MsgGUID: 4wT+xqG7TnaeYfLrx8kMhg==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33704163"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 11:30:55 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:23569]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.128:2525] with esmtp (Farcaster)
 id 4ba67a46-d01e-48b2-92a7-4753eaddb340; Wed, 11 Nov 2026 11:30:54 +0000 (UTC)
X-Farcaster-Flow-ID: 4ba67a46-d01e-48b2-92a7-4753eaddb340
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 11:30:54 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 11 Nov 2026
 11:30:52 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato
	<pfalcato@suse.de>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	Eliav Farber <farbere@amazon.com>
Subject: [PATCH 1/4] mm: add MMAP_PFN_TRACK action and pfn_range_track() for lazy PFN maps
Date: Wed, 11 Nov 2026 11:30:42 +0000
Message-ID: <20261111113045.35368-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111113045.35368-1-farbere@amazon.com>
References: <20261111113045.35368-1-farbere@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Drivers that expose a physical PFN range to userspace have traditionally
used remap_pfn_range(), which both populates the page tables eagerly and,
on x86, reserves the range's memory type in the PAT memtype tree via
pfnmap_track() -> reserve_pfn_range() -> memtype_reserve(). That
reservation is what lets the kernel detect and reject a second mapping of
the same physical range with a conflicting cache attribute (e.g. WB vs
UC/WC), which can otherwise cause data corruption or inconsistent cache
state.

Drivers that instead populate a PFN mapping lazily from a fault handler
(via vmf_insert_pfn()/vmf_insert_pfn_pmd()/vmf_insert_pfn_pud(), e.g. to
obtain huge PFN mappings on fault) get no such reservation: those helpers
only call pfnmap_setup_cachemode_pfn(), a lookup-only wrapper that never
reserves. Such mappings are therefore never registered in the PAT memtype
tree and conflicting mappings go undetected.

Add pfn_range_track(): it sets up the VMA exactly as remap_pfn_range()
would (VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP flags), reserves
and tracks the whole VMA's PFN range for its lifetime by attaching a
pfnmap_track_ctx to the VMA (released automatically on VMA teardown),
but does not populate any page tables - population is left to the
caller's fault handler. COW mappings are rejected, as the fault-driven
vmf_insert_pfn*() helpers cannot populate them.

On architectures without PFN tracking (!__HAVE_PFNMAP_TRACKING) the
reservation is a no-op, matching remap_pfn_range()'s notrack path; the
VMA flag setup still happens.

For drivers that use ->mmap_prepare, where no VMA exists yet, add an
MMAP_PFN_TRACK mmap action and a mmap_action_pfn_track() helper. It sets
up the VMA like MMAP_REMAP_PFN, and on completion tracks the range like
pfn_range_track() instead of populating it. Mirror the new action type
in the tools/testing/vma copy of the enum.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 include/linux/mm.h              | 19 +++++++
 include/linux/mm_types.h        |  1 +
 mm/internal.h                   |  3 ++
 mm/memory.c                     | 93 +++++++++++++++++++++++++++++++++
 mm/util.c                       |  7 +++
 tools/testing/vma/include/dup.h |  1 +
 6 files changed, 124 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6af3b7008f1a..c11bdee1596a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4752,6 +4752,23 @@ static inline void mmap_action_ioremap_full(struct vm_area_desc *desc,
 	mmap_action_ioremap(desc, desc->start, start_pfn, vma_desc_size(desc));
 }
 
+/**
+ * mmap_action_pfn_track - helper for mmap_prepare hook to specify that the PFN
+ * range backing the entirety of a VMA should be tracked, but not mapped.
+ * @desc: The VMA descriptor for the VMA.
+ * @start_pfn: The first PFN in the range.
+ *
+ * The VMA is set up as for mmap_action_remap_full(), but no page tables are
+ * populated: the mapping is populated on demand from the driver's fault
+ * handler. Must not be used for a COW mapping. See pfn_range_track().
+ */
+static inline void mmap_action_pfn_track(struct vm_area_desc *desc,
+					 unsigned long start_pfn)
+{
+	mmap_action_remap_full(desc, start_pfn);
+	desc->action.type = MMAP_PFN_TRACK;
+}
+
 /**
  * mmap_action_simple_ioremap - helper for mmap_prepare hook to specify that the
  * physical range in [start_phys_addr, start_phys_addr + size) should be I/O
@@ -4973,6 +4990,8 @@ struct vm_area_struct *find_extend_vma_locked(struct mm_struct *,
 		unsigned long addr);
 int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
 		    unsigned long pfn, unsigned long size, pgprot_t pgprot);
+int pfn_range_track(struct vm_area_struct *vma, unsigned long addr,
+		    unsigned long pfn, unsigned long size);
 
 int vm_insert_page(struct vm_area_struct *, unsigned long addr, struct page *);
 int vm_insert_pages(struct vm_area_struct *vma, unsigned long addr,
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1ed35d258d2e..b4dfc1b12c2e 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -821,6 +821,7 @@ enum mmap_action_type {
 	MMAP_SIMPLE_IO_REMAP,		/* I/O remap with guardrails. */
 	MMAP_KERNEL_PAGES,		/* Map kernel page range from array. */
 	MMAP_DISCONTIG_KERNEL_PAGES,	/* Map kernel discontig page range. */
+	MMAP_PFN_TRACK,			/* Track PFN range, map on fault. */
 };
 
 enum discontig_kernel_page_action {
diff --git a/mm/internal.h b/mm/internal.h
index e3f92883bf23..58a81f6041a9 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1546,6 +1546,9 @@ int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm);
 int remap_pfn_range_prepare(struct vm_area_desc *desc);
 int remap_pfn_range_complete(struct vm_area_struct *vma,
 			     struct mmap_action *action);
+int pfn_range_track_prepare(struct vm_area_desc *desc);
+int pfn_range_track_complete(struct vm_area_struct *vma,
+			     struct mmap_action *action);
 int simple_ioremap_prepare(struct vm_area_desc *desc);
 int map_kernel_pages_prepare(struct vm_area_desc *desc);
 int map_kernel_pages_complete(struct vm_area_struct *vma,
diff --git a/mm/memory.c b/mm/memory.c
index ec3d9d99ccee..ab29ec719ae1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3420,6 +3420,99 @@ int remap_pfn_range_complete(struct vm_area_struct *vma,
 	return do_remap_pfn_range(vma, start, pfn, size, prot);
 }
 
+#ifdef __HAVE_PFNMAP_TRACKING
+static int do_pfn_range_track(struct vm_area_struct *vma, unsigned long pfn,
+			      unsigned long size)
+{
+	pgprot_t prot = vma->vm_page_prot;
+	struct pfnmap_track_ctx *ctx;
+
+	if (vma->pfnmap_track_ctx)
+		return -EINVAL;
+
+	/*
+	 * prot only receives the reserved cachemode here; the fault-time
+	 * vmf_insert_pfn*() helpers look it up again via
+	 * pfnmap_setup_cachemode_pfn().
+	 */
+	ctx = pfnmap_track_ctx_alloc(pfn, PAGE_ALIGN(size), &prot);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	vma->pfnmap_track_ctx = ctx;
+	return 0;
+}
+#else
+static int do_pfn_range_track(struct vm_area_struct *vma, unsigned long pfn,
+			      unsigned long size)
+{
+	/* No PFN tracking on this arch; cachemode is left as-is. */
+	return 0;
+}
+#endif
+
+/**
+ * pfn_range_track - reserve and track a PFN range for a VMA without populating
+ * @vma: user vma to track the range for
+ * @addr: target page aligned user address to start at
+ * @pfn: page frame number of kernel physical memory address
+ * @size: size of mapping area
+ *
+ * Reserves the PFN range's memory type (PAT on x86) and attaches a tracking
+ * context to @vma for its lifetime, so that conflicting cache-attribute
+ * mappings of the same physical range are detected, but does not create any
+ * page table entries. Intended for drivers that populate the mapping lazily
+ * from a fault handler (e.g. via vmf_insert_pfn()), where the fault helpers
+ * only look up the cachemode and do not perform the reservation themselves. The
+ * VMA flags remap_pfn_range() would have set are set here too.
+ *
+ * Must cover the whole VMA. Must not be a COW mapping: the fault-driven
+ * vmf_insert_pfn*() helpers cannot populate one. Must be called with the mmap
+ * lock held for writing: it sets VMA flags and attaches the tracking context.
+ *
+ * Return: %0 on success, negative error code otherwise.
+ */
+int pfn_range_track(struct vm_area_struct *vma, unsigned long addr,
+		    unsigned long pfn, unsigned long size)
+{
+	int err;
+
+	if (vma_is_cow_mapping(vma))
+		return -EINVAL;
+
+	if (addr != vma->vm_start || addr + PAGE_ALIGN(size) != vma->vm_end)
+		return -EINVAL;
+
+	err = remap_pfn_range_prepare_vma(vma, addr, pfn, size);
+	if (err)
+		return err;
+
+	return do_pfn_range_track(vma, pfn, size);
+}
+EXPORT_SYMBOL_GPL(pfn_range_track);
+
+int pfn_range_track_prepare(struct vm_area_desc *desc)
+{
+	const struct mmap_action *action = &desc->action;
+
+	/* See pfn_range_track(). */
+	if (vma_desc_is_cow_mapping(desc))
+		return -EINVAL;
+
+	if (action->remap.start != desc->start ||
+	    action->remap.size != vma_desc_size(desc))
+		return -EINVAL;
+
+	return remap_pfn_range_prepare(desc);
+}
+
+int pfn_range_track_complete(struct vm_area_struct *vma,
+			     struct mmap_action *action)
+{
+	return do_pfn_range_track(vma, action->remap.start_pfn,
+				  action->remap.size);
+}
+
 static int __simple_ioremap_prep(unsigned long vm_len, pgoff_t vm_pgoff,
 				 phys_addr_t start_phys, unsigned long size,
 				 unsigned long *pfnp)
diff --git a/mm/util.c b/mm/util.c
index 80f6c714844f..5332030ed370 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1546,6 +1546,8 @@ int mmap_action_prepare(struct vm_area_desc *desc)
 		return 0;
 	case MMAP_REMAP_PFN:
 		return remap_pfn_range_prepare(desc);
+	case MMAP_PFN_TRACK:
+		return pfn_range_track_prepare(desc);
 	case MMAP_IO_REMAP_PFN:
 		return io_remap_pfn_range_prepare(desc);
 	case MMAP_SIMPLE_IO_REMAP:
@@ -1583,6 +1585,9 @@ int mmap_action_complete(struct vm_area_struct *vma,
 	case MMAP_REMAP_PFN:
 		err = remap_pfn_range_complete(vma, action);
 		break;
+	case MMAP_PFN_TRACK:
+		err = pfn_range_track_complete(vma, action);
+		break;
 	case MMAP_KERNEL_PAGES:
 		err = map_kernel_pages_complete(vma, action);
 		break;
@@ -1611,6 +1616,7 @@ int mmap_action_prepare(struct vm_area_desc *desc)
 	case MMAP_SIMPLE_IO_REMAP:
 	case MMAP_KERNEL_PAGES:
 	case MMAP_DISCONTIG_KERNEL_PAGES:
+	case MMAP_PFN_TRACK:
 		WARN_ON_ONCE(1); /* nommu cannot handle these. */
 		break;
 	}
@@ -1633,6 +1639,7 @@ int mmap_action_complete(struct vm_area_struct *vma,
 	case MMAP_SIMPLE_IO_REMAP:
 	case MMAP_KERNEL_PAGES:
 	case MMAP_DISCONTIG_KERNEL_PAGES:
+	case MMAP_PFN_TRACK:
 		WARN_ON_ONCE(1); /* nommu cannot handle this. */
 
 		err = -EINVAL;
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index dc4927d26296..7bb7392c7fb5 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -455,6 +455,7 @@ enum mmap_action_type {
 	MMAP_SIMPLE_IO_REMAP,		/* I/O remap with guardrails. */
 	MMAP_KERNEL_PAGES,		/* Map kernel page range from array. */
 	MMAP_DISCONTIG_KERNEL_PAGES,	/* Map kernel discontig page range. */
+	MMAP_PFN_TRACK,			/* Track PFN range, map on fault. */
 };
 
 /*
-- 
2.47.3

