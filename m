Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.34.181.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396662;
	b=ANnr8Eg7qFgDC/nr4hTX+WXblDZEN3NyoOH5asa2RVRr6bckzq9v3qOE4KBM1lj84EDZ
	 o8YLhh/t6eW3obAnDVNvXRySdtzG32MK/qLtalFCnvbeLFXgdp4F2jnGB+culVXBSI776
	 U5PUzfRoQqCd+5mQvTe+uUDL9KQcYhw6sq9xUf5GG3jZFWP214kSCextq7x5Npi83ROG/
	 WadueAZKtWWs9vkF/chq3iFrR5uAWOy+X883PvlAOXoV4ekFhM8jweus0NgO6KJxVCgnc
	 Ox/1V0Tq+F45QKO+UYVL1rbbXhEm+ZOzrqcaMa3gv1kmSnPquYNrvbtO91MMvCJrrpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396662;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=sX6eALrtU03nkowWrLRijmxpjqh1OdeIRAColfbvybg=;
	b=O9xkW7hWN51uJuhFok8U66phpdn7HePWQVgOMui2OaCkNcW5BwiAp2thuoegsdeCpG0z
	 ycERPCCnYS3YU81xYFjw9vgb3eClNlZ49FZiyxWm7t02Ng49RgHQhC6S44aMA7VFsziK4
	 0xvkIJrsTnM6wJJFsoX3p+P5622/b4cOML9zVqLGZ7UXar+Qa+iND/56vrMXAZhx705py
	 FSfwh65zk/DNQBNUbL1frKKKM6T2tMRUhq6i7LPprfnddW0sI9bLNgG6uOCIhoOW08kXW
	 Yr8WqCkWee/497m7vxKagK5SGyMvaNFo08fDNvTQKkoGA20ZOTQycmIxdILpq1x3+fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=ZxSMeh47;
	arc=none smtp.remote-ip=52.34.181.151
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11465606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11465606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=ZxSMeh47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794396662; x=1825932662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sX6eALrtU03nkowWrLRijmxpjqh1OdeIRAColfbvybg=;
  b=ZxSMeh47t9cTmKy+IcnBWpFjU52CyZfVHX9If1DYjOXwTl4A1XV6+f5s
   q7qIniRmRtHydVtke/qNwQVYbaS2+N4Mmi/R7NV0sZCPZUOWMo7BG7VSb
   qyc2yrFEPKwClcPLKgbTWxUDs4KVhzt8mla/wP9dKqbm8k8JWmbNDyMeX
   OzteZobM1M1sN6T26hM9oHvNua1QjAlFA5WQkoRDoVp+JRXlCTPxsMGoX
   VuxqGUYCDweIZFmS+oUwoMG/2x3f9zdtyWxH3HJP5DksUk/kbdbMc8abq
   JanmMknHL3fFvi/E/zsKJBQJM0yc7iol7jlfuSymI6vfGjqWAQK6UylH3
   w==;
X-CSE-ConnectionGUID: BmL0ADR6TV+zsT/8Lm7iXA==
X-CSE-MsgGUID: XwLUbCzCQeiOQ+ztd+vJPg==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33704167"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 11:31:01 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:5402]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.255:2525] with esmtp (Farcaster)
 id 3ece8912-201c-47b5-8fdf-dff386e184c8; Wed, 11 Nov 2026 11:31:01 +0000 (UTC)
X-Farcaster-Flow-ID: 3ece8912-201c-47b5-8fdf-dff386e184c8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 11:31:01 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 11 Nov 2026
 11:30:59 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato
	<pfalcato@suse.de>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	Eliav Farber <farbere@amazon.com>
Subject: [PATCH 4/4] uio: implement huge_fault support for physical mappings
Date: Wed, 11 Nov 2026 11:30:45 +0000
Message-ID: <20261111113045.35368-5-farbere@amazon.com>
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

UIO physical mappings (UIO_MEM_PHYS, UIO_MEM_IOVA) often expose large
device memory regions to userspace. uio_mmap_physical() maps them at
mmap() time with remap_pfn_range(), i.e. with 4K PTEs, even when the
region and the user address are aligned for huge mappings.

Map non-COW mappings on fault instead, as vfio-pci does since commit
f9e54c3a2f5b ("vfio/pci: implement huge_fault support"): call
pfn_range_track() rather than remap_pfn_range(), so the VMA is set up
and its memory type tracked as before, and add ->fault/->huge_fault
handlers that map the faulting window with vmf_insert_pfn_order(), using
a PMD or PUD where alignment allows. Like uio_vma_fault(), the handlers
take idev->info_lock and fail with SIGBUS once the device is gone. COW
mappings cannot be populated by vmf_insert_pfn*() and stay eager.

vm_pgoff holds the UIO map index, which a fault handler cannot use: a
VMA split (partial munmap(), mprotect(), ...) adds the split offset to
vm_pgoff of the upper part, so the index no longer identifies the map.
Store the base pfn in vm_pgoff instead, as remap_pfn_range() does for
COW mappings; splits then keep it correct. As a side effect,
/proc/<pid>/maps shows the physical address as the offset of such a
mapping, rather than N * PAGE_SIZE.

generic_access_phys() only follows present PTEs, so .access now faults
the page in first; otherwise remote access (ptrace, /proc/pid/mem) to an
untouched page would fail. A mapping that does not permit the fault,
PROT_NONE for example, keeps that gap: fixup_user_fault() refuses it,
where the eager mapping left a present PTE.

Validation at mmap() time is unchanged, except for the L1TF pfn check:
remap_pfn_range() rejected a disallowed pfn with -EACCES from mmap(),
where the fault handler now raises SIGBUS on first touch.

Once the device is unregistered, a page with no present entry gets
SIGBUS, where the eager mapping kept it mapped. Not only untouched
pages: splitting a huge entry with a partial munmap() or mprotect()
zaps it, since __split_huge_pmd_locked() clears a PFN-mapped PMD rather
than converting it to PTEs.

Without huge PFN mappings, or for small or unaligned mappings, the
region is populated one page per fault, paid only for pages that are
actually touched.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/uio/uio.c | 102 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 96 insertions(+), 6 deletions(-)

diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index f8fa20522660..6b4c79340e5c 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -733,9 +733,80 @@ static int uio_mmap_logical(struct vm_area_struct *vma)
 	return 0;
 }
 
+/*
+ * Populate UIO physical mappings on fault, using a PMD or PUD mapping where the
+ * architecture, the fault address and the pfn allow it.
+ */
+static vm_fault_t uio_physical_huge_fault(struct vm_fault *vmf,
+					  unsigned int order)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
+	struct uio_device *idev = vma->vm_private_data;
+	vm_fault_t ret = VM_FAULT_SIGBUS;
+	unsigned long pfn;
+
+	/*
+	 * vm_pgoff is the base pfn of the mapping (see uio_mmap_physical()).
+	 * vmf_pfn_order_ok() ignores pfn if the window starts below vm_start.
+	 */
+	pfn = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+	if (!vmf_pfn_order_ok(vmf, pfn, order))
+		return VM_FAULT_FALLBACK;
+
+	mutex_lock(&idev->info_lock);
+
+	if (idev->info)
+		ret = vmf_insert_pfn_order(vmf, pfn, order);
+
+	mutex_unlock(&idev->info_lock);
+
+	return ret;
+}
+
+static vm_fault_t uio_physical_fault(struct vm_fault *vmf)
+{
+	return uio_physical_huge_fault(vmf, 0);
+}
+
+#ifdef CONFIG_HAVE_IOREMAP_PROT
+/*
+ * generic_access_phys() only follows present PTEs, and a lazily populated
+ * mapping has none for pages the target has not touched yet. Fault the page in
+ * first (through the handlers above, so info_lock is honoured), so that remote
+ * access (ptrace, /proc/pid/mem) keeps working.
+ *
+ * fixup_user_fault() refuses a fault the vma does not permit, so an untouched
+ * page of a mapping without VM_READ stays unreadable, where the eager mapping
+ * left a present PTE.
+ */
+static int uio_physical_access(struct vm_area_struct *vma, unsigned long addr,
+			       void *buf, int len, int write)
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
 static const struct vm_operations_struct uio_physical_vm_ops = {
 #ifdef CONFIG_HAVE_IOREMAP_PROT
-	.access = generic_access_phys,
+	.access = uio_physical_access,
+#endif
+	.fault = uio_physical_fault,
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
+	.huge_fault = uio_physical_huge_fault,
 #endif
 };
 
@@ -767,11 +838,30 @@ static int uio_mmap_physical(struct vm_area_struct *vma)
 	 * So we just do the physical mmap without a page
 	 * offset.
 	 */
-	return remap_pfn_range(vma,
-			       vma->vm_start,
-			       mem->addr >> PAGE_SHIFT,
-			       vma->vm_end - vma->vm_start,
-			       vma->vm_page_prot);
+	if (vma_is_cow_mapping(vma)) {
+		/* COW mappings cannot be populated on fault: map them now. */
+		return remap_pfn_range(vma,
+				       vma->vm_start,
+				       mem->addr >> PAGE_SHIFT,
+				       vma->vm_end - vma->vm_start,
+				       vma->vm_page_prot);
+	}
+
+	/*
+	 * Populate on fault (see uio_physical_huge_fault()). Tracking the PFN
+	 * range keeps its memory type reserved, for PAT conflict detection.
+	 *
+	 * vm_pgoff holds the map index, which the fault handler cannot use:
+	 * splitting the VMA adds the page offset of the split to vm_pgoff of
+	 * the upper part, so uio_find_mem_index() then returns the wrong map,
+	 * or none, and the start of that part would be mapped to mem->addr.
+	 * Store the base pfn instead, as remap_pfn_range() does for COW
+	 * mappings; VMA splits then keep vm_pgoff correct for each part.
+	 */
+	vma->vm_pgoff = mem->addr >> PAGE_SHIFT;
+
+	return pfn_range_track(vma, vma->vm_start, mem->addr >> PAGE_SHIFT,
+			       vma->vm_end - vma->vm_start);
 }
 
 static int uio_mmap_dma_coherent(struct vm_area_struct *vma)
-- 
2.47.3

