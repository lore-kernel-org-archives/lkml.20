Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.83.148.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396663;
	b=2UP9pACfm2wyaQsy6ndVLjrXbgFBE1dZUWgjzMegT+h/5LPpAbVaeMaeRUdqYmaGpwBp
	 6Nm9G5OJWFv7Ej+HZjMcGd1tUAWuEBmJfkYQY+4TlHtRw8ZBgjuG8S+wH+ARRw2kOxhJx
	 jsdTa8NUG0/c70ooSvcJ5fiHAfVACT5Y+8h0dUWfS9W2Dg7QEGOLZfaw938x7j03gKCCU
	 4kUCKf7eJIuH7c4nOfDhYkYzu+8RgWmZIV4kuAyjWi7x3ikm2LeIuhXCIQ6Gk9RJfJ0CU
	 /37OuqUB2EfEUmrW2mw1VyS9g2wNZbnhRdkG0jvwybo0JGWY3Mds4sO6Z+YIsOkNfxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396663;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=FAKrZB3/nEAmJyFWyGs5ZFnmqEiXBaXUDR5gWbLNc64=;
	b=uAkIiz1LR/gyl2dG8AzpPAKTwTmaNk1V2SlEpEojPGQfwsRRmMFa8vU8GRUwa5gAC2cc
	 nhzSwy6kNVnJQoXXHWxoLAlI1889ffQS/SHVSeeYhvqLxPsQiCKf7htv1Mm8grXr4PN7i
	 FLpAxidVkjYh0mknqZF1PWycV3ADMy9l456RzM9UIBNizJvtyi96SgoYTz+1Dl/bVUbLs
	 kS105IhzEQfoYyU8/tKy3BhmyRH8GIwO3pNpeb9YmORekJHv3o14jHH6TFUcr5yL+I+ql
	 I9J+uY9uWBpAge0oaWKJ7tcRXCZQsD4UqRknNCWHvW0OxMJZhqudySYWgV926aVHb2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=dCPuOid3;
	arc=none smtp.remote-ip=35.83.148.184
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AEF606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1AEF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=dCPuOid3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794396662; x=1825932662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FAKrZB3/nEAmJyFWyGs5ZFnmqEiXBaXUDR5gWbLNc64=;
  b=dCPuOid34hZtEU9Gew3vJYpwy7so7diFmmd6nGqCGRNIFvnDUGnMO/8d
   PgfFOkPU5VMjrdtthb08I+XPI/k0XLblAAFXvO3M7w3TKrdDXVJFsP96b
   /GGt3QSo6osvfepQNHD7H3VnjRxO6L5y75nKJeTfpEZqxWIWY7Q3+igug
   3zMRkH9MO6Sw0ebyeGluQYceEftYkp820wbO0RVKHCGKvwK6p16G2kFHn
   TcGtD+I5u0HpevGmFEskULEe0Lkz2ri6EfgoefQjZgfo3VM0igQf4cyna
   jgna0H45mC2MQcreq6zSSnmlQysT4Dyasz8/VqVFTGnY76r/zoJkgKcDl
   A==;
X-CSE-ConnectionGUID: fd9JRxnOQvyRoj4X60JWDQ==
X-CSE-MsgGUID: EgL3/TeyR02TNbdQfWGHBg==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33495673"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 11:30:59 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:20906]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.128:2525] with esmtp (Farcaster)
 id 4ef01655-fd56-435f-8286-fd73de2bff4f; Wed, 11 Nov 2026 11:30:59 +0000 (UTC)
X-Farcaster-Flow-ID: 4ef01655-fd56-435f-8286-fd73de2bff4f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 11:30:59 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 11 Nov 2026
 11:30:56 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato
	<pfalcato@suse.de>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	Eliav Farber <farbere@amazon.com>
Subject: [PATCH 3/4] mm/char-mem: implement huge_fault support for /dev/mem
Date: Wed, 11 Nov 2026 11:30:44 +0000
Message-ID: <20261111113045.35368-4-farbere@amazon.com>
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

/dev/mem is commonly used to map large physical regions (reserved
memory, device memory) into userspace. mmap_mem_prepare() maps the whole
range at mmap() time with 4K PTEs, however large and well aligned it is,
which costs many page-table entries and TLB misses.

Map non-COW mappings on fault instead, as vfio-pci does since commit
f9e54c3a2f5b ("vfio/pci: implement huge_fault support"): request
MMAP_PFN_TRACK rather than an eager remap, so the VMA is set up and its
memory type tracked as before, and add ->fault/->huge_fault handlers
that map the faulting window with vmf_insert_pfn_order(), using a PMD or
PUD where alignment allows. COW mappings cannot be populated by
vmf_insert_pfn*() and stay eager; if revoke_iomem() zaps them, the fault
handler refuses them with SIGBUS, as before.

The handler re-checks range_is_allowed(): with CONFIG_IO_STRICT_DEVMEM,
revoke_iomem() zaps a range once a driver claims it, and a fault must
not map it back in. With CONFIG_STRICT_DEVMEM this costs one
devmem_is_allowed() call per page of the faulting window.
Unlike the eager mapping, a revoke is not permanent: once the driver
releases the range, a fault repopulates the mapping, as a fresh mmap()
of it would.

generic_access_phys() only follows present PTEs, so .access now faults
the page in first; otherwise remote access (ptrace, /proc/pid/mem) to an
untouched page would fail. A mapping that does not permit the fault,
PROT_NONE for example, keeps that gap: fixup_user_fault() refuses it,
where the eager mapping left a present PTE.

Validation at mmap() time is unchanged, except for the L1TF pfn check:
the eager mapping rejected a disallowed pfn with -EAGAIN from mmap(),
where the fault handler now raises SIGBUS on first touch.

vmf_insert_pfn() refuses the zero pfn, where remap_pfn_range() mapped
it, so a page of RAM that happens to be the zero page now SIGBUSes.
That needs /dev/mem access to RAM, i.e. a kernel without
CONFIG_STRICT_DEVMEM.

Without huge PFN mappings, or for small or unaligned mappings, the
range is populated one page per fault, paid only for pages that are
actually touched.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 mm/char-mem.c | 103 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 4 deletions(-)

diff --git a/mm/char-mem.c b/mm/char-mem.c
index c5761ddedbd7..b9ed8473baeb 100644
--- a/mm/char-mem.c
+++ b/mm/char-mem.c
@@ -318,9 +318,92 @@ static inline int private_mapping_ok(struct vm_area_desc *desc)
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
+	 * COW mappings are mapped eagerly at mmap() time and only lose their
+	 * pages to revoke_iomem(); keep them unmapped, as without a fault
+	 * handler. vmf_insert_pfn*() would also BUG_ON them.
+	 */
+	if (vma_is_cow_mapping(vma))
+		return VM_FAULT_SIGBUS;
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
+	 * COW mappings are populated at mmap() time, and a write fault would
+	 * copy the page instead. With unlocked == NULL, fixup_user_fault()
+	 * keeps the mmap lock held and the vma valid.
+	 */
+	if (!vma_is_cow_mapping(vma))
+		fixup_user_fault(vma->vm_mm, addr, fault_flags, NULL);
+
+	return generic_access_phys(vma, addr, buf, len, write);
+}
+#endif
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
 
@@ -356,11 +439,23 @@ static int mmap_mem_prepare(struct vm_area_desc *desc)
 					       desc->page_prot);
 
 	desc->vm_ops = &mmap_mem_ops;
-
-	/* Remap-pfn-range will mark the range with the I/O flag. */
-	mmap_action_remap_full(desc, desc->pgoff);
 	desc->action.error_override = -EAGAIN;
 
+	if (vma_desc_is_cow_mapping(desc)) {
+		/*
+		 * vmf_insert_pfn*() cannot populate COW mappings: map them now.
+		 * Remap-pfn-range will mark the range with the I/O flag.
+		 */
+		mmap_action_remap_full(desc, desc->pgoff);
+		return 0;
+	}
+
+	/*
+	 * Populate on fault (see mmap_mem_huge_fault()). Tracking the PFN range
+	 * keeps its memory type reserved, for PAT conflict detection.
+	 */
+	mmap_action_pfn_track(desc, desc->pgoff);
+
 	return 0;
 }
 
-- 
2.47.3

