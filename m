Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488211;
	b=FuqXANhoGY7bhzDsSWhn1MMggNclvMdw53QPmmWRa5goOz/Imyjx4qA9WDjcg1gcAayd
	 3YOAHp4vtfL/yRt7TEEfHA+FCuUCyvGkQtntktwaKzNfl5h88zkhd+aVMR66ky3AxdVhc
	 RRoFFrXhDvQXzuuqu+mWwgFKu+nV/0WuntsKxe12Iz1vQkYYFzoH8aFZnp8L/a43Qeg4H
	 kaaPmZKgXaAXWFgEaCsDS2Y6uW/6dJqml5V8Ne+Wm+hlczRBVBIZz+KosErjzGBKVqc8x
	 RLb8wiNBT3aN7pZVYNrKWjqF0DrPEYmK5pwh6wMuLuwqC3IGVQ6N2JJNAxMMCsrHZKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488211;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=J2tr6CmVJPxgvJcaHtBjGtsKyEj3R3TudMQySxquzWs=;
	b=YTtR5uqTefbwjIpKP/WgyYkgfPNrYUvQTQR7lxB8x8EcnQ8roDG3u/OFiO5OnHjT1PEJ
	 DMC94y1ypr84omQ21rScwS1saCAWXNk9jeuZJpGXaxxcqFcEu8Kx2sUr8KHGcbtX8Ti1C
	 yQ/1fEjh/392d2O6AYr4OHDhxooDzEifsksBDC/q6zsdUe9YHIF3xLXrdAPTgfgSEShdi
	 cZMM1/+W4DV3Sp4MeAy6/Fozrd+yay9VNOFgWIcBoMsWWrw6e7VUx04MOCHeWkbu/9iG8
	 eWS5GnvJ80GH4UCiPQAoO2VstE9UrByM1uO794IAPTCGFp4cbe/TcEPvdI8stZM2ejg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=lTcqWvlj;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA794606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA794606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=lTcqWvlj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794488210; x=1826024210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J2tr6CmVJPxgvJcaHtBjGtsKyEj3R3TudMQySxquzWs=;
  b=lTcqWvljZLeGX7Eg7YmtAAD+KJdCkbs3rxYT1Zj2U9gC5oY5iw73WUnl
   BL+KBDVDMn0VAgWaAknmOxHXWOBcgfq8Da5bAwiWYULQm1FtOqy9Y5oav
   clxtLK3sUqu6VSyq5LTIcbIHundTgJCeolOCwqSqMijjnHXZ0+t6vyn9y
   HP1hXNV7hJ3Xt78UOXCzYr6vCjqxt1mSl4JImxlrufSg8N3Nxczj3KaBQ
   03C8lem6ULWFV85y410YRfmmIEn+3RsU1zPuJJ0KBd7N0v+RCFnEg4QlS
   ZuTk9I49cgUEEmMi3ytS/ikpuNCSEL/NVV+6e9GfDV5ZB1TcKHf7Sqw1p
   w==;
X-CSE-ConnectionGUID: txv+//OAQemCHMTRkhRk8A==
X-CSE-MsgGUID: AnSJ6e6KQEKwCNkr3FxRBQ==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="33788383"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:56:48 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:15137]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.61:2525] with esmtp (Farcaster)
 id 7af3b9b8-e90e-4072-981a-146aa3fd39fb; Thu, 12 Nov 2026 12:56:48 +0000 (UTC)
X-Farcaster-Flow-ID: 7af3b9b8-e90e-4072-981a-146aa3fd39fb
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 12:56:47 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 12:56:45 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, David Hildenbrand <david@kernel.org>
CC: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
	<jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 1/4] mm: add MMAP_PFN_TRACK action and pfn_range_track() for lazy PFN maps
Date: Thu, 12 Nov 2026 12:56:35 +0000
Message-ID: <20261112125638.12209-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112125638.12209-1-farbere@amazon.com>
References: <20261112125638.12209-1-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
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

base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.47.3

