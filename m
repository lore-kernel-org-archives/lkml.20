Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488214;
	b=jgXuSrnpuZ1cG8OfK/GMQC+zR2UGmCRws2UbIVTZ3RuOOiypDYxBwq5GKA47R9nNj/hx
	 MUNhaQhbFFbCLZc9QBQt4ZP8maV4Z/oaRDhMger/lgZsnY9xBluBJWMrGGfCsGJxZd7uw
	 /FLzeBlicT6S2u4ZXiW9raqbnquEadrg5DfglbBN23kPRL/3ybxE4GgstS85QCtNEw1yP
	 NUcyEDtrg2jiut3HrrTV1o1jZ6SELIdAPTMhhemWXwEWPx0Q5HlqvaniW0PFOaWj4JRZB
	 k5JwlZfGlBmI7yBmDeYkmKszA6EnjpFWkYNm5vIPhJj4OY+aRbxcTUyLnHaebow5ZPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488214;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=6Gt83+fxMlROkzHsSkTZbFg0XGnf3ZdikmYRaQBMHvc=;
	b=kBlMHlB60CEaRV2eRXFwOUJGO6+NWThOyZ+b5gULJQjIYheQBmrheaeiL1CDLIRSiXq7
	 nYkq/Omt29kxYb4GD3bi+7yLvR8k5X5VCo1eJY75pecKBCUER86jhezbcKbFhfDuRTljI
	 1TsdNzsSq2TiqU0PfozdQrkA+6Nh+blvdbG0JzI06+jNRH4m4w9JeH5dA0kEcpmvfc5D3
	 BzxtCNSoJqlLrp6F+K2HWOg6bg2wwED8p9MCUxU0oebit5GKh6enMDbScZaVX98NEfbtr
	 gZhALdqem4sx00AGkyso6y14ZZXpTNUjrWJYalkOzQbglCZ667BL7AA9gL26pyby5Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=WGQtNDBw;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67BE606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67BE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=WGQtNDBw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794488213; x=1826024213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Gt83+fxMlROkzHsSkTZbFg0XGnf3ZdikmYRaQBMHvc=;
  b=WGQtNDBwQyIUMNAYY3NcXjlOA2disVwLF7HcU+B6WhZJ7c4X9UEaOq2h
   mj0pWv52D+nE16NKEQ4qgHoPCatoN+sxmxy5JZcRlGEOS70itCphorEKq
   KyUDdakvMFnEWNOGzPpZtZFhutFcPncF7rOkzMLyKJE9i88rQBSBZ9urQ
   02Zr6+1YMXDD2KeM6mwg2n+X/mFdp8q4L1hVZUvPJswXcdrOdcEo7gtWw
   7mq4QMQpTxws6r+Tlypb1EPOKY+Bi66KsRMqUGlzA/TPSyaZq9nPDYOQy
   VuuV9ucKM/qIdi5HHgSrGNVHuMC5jKPcfZ4wzRrfwcldT8avLWd9lXooV
   w==;
X-CSE-ConnectionGUID: 1QyHUlQgTrakZbRh7HeLzg==
X-CSE-MsgGUID: yoSc2calRBWdh6F3k2s9/w==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="33728090"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:56:52 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:31229]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.250:2525] with esmtp (Farcaster)
 id d063ba05-e049-4b16-a1e0-ffebd400aeab; Thu, 12 Nov 2026 12:56:52 +0000 (UTC)
X-Farcaster-Flow-ID: d063ba05-e049-4b16-a1e0-ffebd400aeab
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 12:56:52 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 12:56:49 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, David Hildenbrand <david@kernel.org>
CC: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
	<jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 3/4] mm/char-mem: implement huge_fault support for /dev/mem
Date: Thu, 12 Nov 2026 12:56:37 +0000
Message-ID: <20261112125638.12209-4-farbere@amazon.com>
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

/dev/mem is commonly used to map large physical regions (reserved
memory, device memory) into userspace. mmap_mem_prepare() maps the whole
range at mmap() time with 4K PTEs, however large and well aligned it is,
which costs many page-table entries and TLB misses.

Map non-COW mappings on fault instead, as vfio-pci does since commit
f9e54c3a2f5b ("vfio/pci: implement huge_fault support"): request
MMAP_PFN_TRACK rather than an eager remap, so the VMA is set up and its
memory type tracked as before, and add ->fault/->huge_fault handlers
that map the faulting window with vmf_insert_pfn_order(), using a PMD or
PUD where alignment allows.

COW mappings cannot be populated by vmf_insert_pfn*(), which BUG_ON()s
a COW VM_PFNMAP vma, so they stay eager and keep a vm_ops without
fault handlers. do_fault() then rechecks a pte it found cleared under
the page table lock, and refuses it with SIGBUS only once it is really
gone, as after revoke_iomem(); a PMD-aligned COW mapping is also not
reported as THP eligible in smaps.

The handler re-checks range_is_allowed(): with CONFIG_IO_STRICT_DEVMEM,
revoke_iomem() zaps a range once a driver claims it, and a fault must
not map it back in. With CONFIG_STRICT_DEVMEM this costs one
devmem_is_allowed() call per page of the faulting window.
Unlike the eager mapping, a revoke is not permanent: once the driver
releases the range, a fault repopulates the mapping, as a fresh mmap()
of it would.

Without CONFIG_IO_STRICT_DEVMEM the re-check still changes behaviour. A
driver can take an IORESOURCE_EXCLUSIVE region at any time, which makes
devmem_is_allowed() refuse those pages, and revoke_iomem() is a no-op
in that configuration. The eager mapping therefore kept serving them,
while a fault now returns SIGBUS for any page not already touched.

generic_access_phys() only follows present PTEs, so .access now faults
the page in first; otherwise remote access (ptrace, /proc/pid/mem) to an
untouched page would fail. A mapping that does not permit the fault,
PROT_NONE for example, keeps that gap: fixup_user_fault() refuses it,
where the eager mapping left a present PTE.

Validation at mmap() time is unchanged, except for the L1TF pfn check.
remap_pfn_range() rejected a disallowed pfn at mmap() time, which
error_override turned into -EAGAIN, so an unprivileged mmap(PROT_NONE)
of a pfn above l1tf_pfn_limit() failed. It now succeeds. Nothing fails
later instead: pfn_modify_allowed() only denies a prot that needs PTE
inversion, i.e. a non-present one, and no pte is installed for an
inaccessible vma.

vmf_insert_pfn() refuses the zero pfn, where remap_pfn_range() mapped
it, so a page of RAM that happens to be the zero page now SIGBUSes.
That needs /dev/mem access to RAM, i.e. a kernel without
CONFIG_STRICT_DEVMEM.

Without huge PFN mappings, or for small or unaligned mappings, the
range is populated one page per fault, paid only for pages that are
actually touched.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v2:
COW mappings get their own vm_operations_struct defining only .access,
instead of a COW test inside the fault handler, which was not enough:
installing ->fault at all skips do_fault()'s recheck of a pte cleared under
the page table lock. Corrected the L1TF claim in the commit message -
mmap(PROT_NONE) above l1tf_pfn_limit() now succeeds, and nothing fails
later - and documented what the fault-time range_is_allowed() re-check
changes without CONFIG_IO_STRICT_DEVMEM. Reported by sashiko-bot.

 mm/char-mem.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 104 insertions(+), 4 deletions(-)

diff --git a/mm/char-mem.c b/mm/char-mem.c
index c5761ddedbd7..99f02d6a8b07 100644
--- a/mm/char-mem.c
+++ b/mm/char-mem.c
@@ -318,9 +318,95 @@ static inline int private_mapping_ok(struct vm_area_desc *desc)
 }
 #endif
 
+#ifdef CONFIG_MMU
+/*
+ * Populate /dev/mem mappings on fault, using a PMD or PUD mapping where the
+ * architecture, the fault address and the pfn allow it.
+ */
+static vm_fault_t mmap_mem_huge_fault(struct vm_fault *vmf, unsigned int order)
+{
+	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long pfn;
+
+	/*
+	 * vm_pgoff is the base pfn of the mapping. vmf_pfn_order_ok() ignores
+	 * pfn if the window starts below vm_start.
+	 */
+	pfn = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+	if (!vmf_pfn_order_ok(vmf, pfn, order))
+		return VM_FAULT_FALLBACK;
+
+	/*
+	 * Access was checked at mmap() time, but with CONFIG_IO_STRICT_DEVMEM
+	 * revoke_iomem() zaps the mapping once a driver claims part of the
+	 * range. Re-check here so a revoked page is not faulted back in. Like
+	 * the mmap()-time check, it is not serialised against revoke_iomem(),
+	 * so a fault that passed it can still install a page revoked right
+	 * after.
+	 */
+	if (!range_is_allowed(pfn, PAGE_SIZE << order))
+		return order ? VM_FAULT_FALLBACK : VM_FAULT_SIGBUS;
+
+	return vmf_insert_pfn_order(vmf, pfn, order);
+}
+
+static vm_fault_t mmap_mem_fault(struct vm_fault *vmf)
+{
+	return mmap_mem_huge_fault(vmf, 0);
+}
+#endif /* CONFIG_MMU */
+
+#ifdef CONFIG_HAVE_IOREMAP_PROT
+/*
+ * generic_access_phys() only follows present PTEs, and a lazily populated
+ * mapping has none for pages the target has not touched yet. Fault the page in
+ * first, so that remote access (ptrace, /proc/pid/mem) keeps working.
+ *
+ * fixup_user_fault() refuses a fault the vma does not permit, so an untouched
+ * page of a mapping without VM_READ stays unreadable, where the eager mapping
+ * left a present PTE.
+ */
+static int mmap_mem_access(struct vm_area_struct *vma, unsigned long addr,
+			   void *buf, int len, int write)
+{
+	unsigned int fault_flags = FAULT_FLAG_REMOTE;
+
+	if (write)
+		fault_flags |= FAULT_FLAG_WRITE;
+
+	/*
+	 * With unlocked == NULL, fixup_user_fault() keeps the mmap lock held
+	 * and the vma valid.
+	 */
+	fixup_user_fault(vma->vm_mm, addr, fault_flags, NULL);
+
+	return generic_access_phys(vma, addr, buf, len, write);
+}
+#endif
+
+/*
+ * COW mappings are mapped eagerly by remap_pfn_range() and cannot be populated
+ * on fault: vmf_insert_pfn*() BUG_ON() a COW VM_PFNMAP vma. Leave them without
+ * fault handlers, so that do_fault() rechecks a pte it found cleared under the
+ * page table lock, and fails only once the pte is really gone, as after
+ * revoke_iomem(), and so that they are not reported as THP eligible in smaps.
+ */
+static const struct vm_operations_struct mmap_mem_cow_vm_ops = {
+#ifdef CONFIG_HAVE_IOREMAP_PROT
+	.access = generic_access_phys,
+#endif
+};
+
 static const struct vm_operations_struct mmap_mem_ops = {
+#ifdef CONFIG_MMU
+	.fault = mmap_mem_fault,
+#endif
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
+	.huge_fault = mmap_mem_huge_fault,
+#endif
 #ifdef CONFIG_HAVE_IOREMAP_PROT
-	.access = generic_access_phys
+	.access = mmap_mem_access,
 #endif
 };
 
@@ -355,11 +441,25 @@ static int mmap_mem_prepare(struct vm_area_desc *desc)
 					       size,
 					       desc->page_prot);
 
+	desc->action.error_override = -EAGAIN;
+
+	if (vma_desc_is_cow_mapping(desc)) {
+		/*
+		 * vmf_insert_pfn*() cannot populate COW mappings: map them now.
+		 * Remap-pfn-range will mark the range with the I/O flag.
+		 */
+		desc->vm_ops = &mmap_mem_cow_vm_ops;
+		mmap_action_remap_full(desc, desc->pgoff);
+		return 0;
+	}
+
 	desc->vm_ops = &mmap_mem_ops;
 
-	/* Remap-pfn-range will mark the range with the I/O flag. */
-	mmap_action_remap_full(desc, desc->pgoff);
-	desc->action.error_override = -EAGAIN;
+	/*
+	 * Populate on fault (see mmap_mem_huge_fault()). Tracking the PFN range
+	 * keeps its memory type reserved, for PAT conflict detection.
+	 */
+	mmap_action_pfn_track(desc, desc->pgoff);
 
 	return 0;
 }
-- 
2.47.3

