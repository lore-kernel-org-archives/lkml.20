Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488215;
	b=B6g158Vuf2rwImwhnPzGkD0BCq/1FjOfD80z0kMdynAyIUIblOKiFABUXpr5DYjnjYsh
	 gyuvMxPXB0u/005jmEh3mkz3tKs5fNCh6rZIQI2xWa3/d6YT07+ta1e+pkjge8LS6VnGs
	 R2zRfsTf79/7M8W7h+hty2qv3LVIB+B7dXkr2l//CjQFzOtcvHUEE51WdyM9FtjubjlKD
	 W+gG9AWX0tdLhSrwGD3nOyzZPUCdp91JSpenzeHiy8cUZZ1kG72trPgA8rvESRsxnFErX
	 8akryQ0GrZIQBE4OK386Hyg5zqfTFGS05uEfQl7bnpwMaswWZ8vBYYi3HijEtI10ivA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488215;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=BHCZgy5CRTPHvK8BqsQtFsJ376YRfs3ZCftnvP8cvm4=;
	b=Z/QvQLuF89rnc5v4/3NV2iUU8dQ31YT2HjkoTemE6jpbUFf9rlnX+VQ1Y+nkfx7GvheI
	 mqA/+gVgAgzmQeWI+CFUsuXsgJy0jL+6Qc/tENiWEq1V3+GLLzGU5/w+IJFg56NemiQKm
	 DPfMYsjhf3+Qvbe4axWzwq5WwacaFp3fi+KOvn1mEnwpGC4sDZTUVzlbZydfuSVZ/2s5+
	 +KIiNfBtiiYon6wFVxBq0DVYzfrMfqVUrQZfNcBAXiN6fHqM61SS5KAIXM5/79RKiKXXI
	 yJU8xK+JyEH8FNhLJsixPoDYhvWZv2kmguQwo05F2R0nNffHX0UVtVq6m5ChWOXVRAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=QD498Od6;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDAC606A893
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BDAC606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=QD498Od6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794488215; x=1826024215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BHCZgy5CRTPHvK8BqsQtFsJ376YRfs3ZCftnvP8cvm4=;
  b=QD498Od6V4lZO2mvM0kNw9fu6mfumKxHf5WmxHSr9kNkybm9SRclaLzq
   T9mJSspETMcubLnDcbL8jXEF/IMWYBFa1dNqSVxFlX3Vfs5ZYOCvm+19k
   giVjQkl3pE+k/Sf77ZXhw6BfXEZgDDqWLgeMFXd27n1B4WqJlmedwveUa
   Cx9L57Xv6RjUXya7s78C8EI+sqMKmsCwOaOfMQuwPrhxp8oo8XkMqD2SG
   Qd253twnn3JcQa6RezuwNjZZfUuxn99wU5h9fR2q3MKnlVv2YkSTOP2A0
   xQTQqZ39Onrn9zqhr60ylg/XZVjMbyCug9VfQlPSJJom6uw2YjT2MjXYO
   Q==;
X-CSE-ConnectionGUID: AtKDJ2DOR8abEGQziXIkcQ==
X-CSE-MsgGUID: Tkd/Vo62QM6lGtcrLabdig==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="33728096"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:56:55 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:18634]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.141:2525] with esmtp (Farcaster)
 id 1b3fcdea-2d1b-4f10-9575-dcf019735ad2; Thu, 12 Nov 2026 12:56:54 +0000 (UTC)
X-Farcaster-Flow-ID: 1b3fcdea-2d1b-4f10-9575-dcf019735ad2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 12:56:54 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 12:56:52 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, David Hildenbrand <david@kernel.org>
CC: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
	<jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 4/4] uio: implement huge_fault support for physical mappings
Date: Thu, 12 Nov 2026 12:56:38 +0000
Message-ID: <20261112125638.12209-5-farbere@amazon.com>
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
take idev->info_lock and fail with SIGBUS once the device is gone.

COW mappings cannot be populated by vmf_insert_pfn*(), which BUG_ON()s
a COW VM_PFNMAP vma, so they stay eager and keep a vm_ops without
fault handlers. do_fault() then rechecks a pte it found cleared under
the page table lock, which is what a transient clearing by
wp_page_copy() needs; a PMD-aligned COW mapping is also not reported
as THP eligible in smaps.

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

Validation at mmap() time is unchanged, except for the L1TF pfn check.
remap_pfn_range() rejected a disallowed pfn with -EACCES from mmap(),
so an unprivileged mmap(PROT_NONE) of a pfn above l1tf_pfn_limit()
failed. It now succeeds. Nothing fails later instead:
pfn_modify_allowed() only denies a prot that needs PTE inversion, i.e.
a non-present one, and no pte is installed for an inaccessible vma.

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
v2:
COW mappings get their own vm_operations_struct defining only .access; with
->fault installed, a COW vma could reach the BUG_ON in vmf_insert_pfn*(),
reproduced as a kernel BUG at mm/memory.c:2989. Corrected the L1TF claim in
the commit message: mmap(PROT_NONE) above l1tf_pfn_limit() now succeeds,
and nothing fails later. Reported by sashiko-bot.

 drivers/uio/uio.c | 118 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 111 insertions(+), 7 deletions(-)

diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index f8fa20522660..7c038e3b107c 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -733,12 +733,94 @@ static int uio_mmap_logical(struct vm_area_struct *vma)
 	return 0;
 }
 
-static const struct vm_operations_struct uio_physical_vm_ops = {
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
+ * page table lock, and fails only once the pte is really gone, and so that they
+ * are not reported as THP eligible in smaps.
+ */
+static const struct vm_operations_struct uio_physical_cow_vm_ops = {
 #ifdef CONFIG_HAVE_IOREMAP_PROT
 	.access = generic_access_phys,
 #endif
 };
 
+static const struct vm_operations_struct uio_physical_vm_ops = {
+#ifdef CONFIG_HAVE_IOREMAP_PROT
+	.access = uio_physical_access,
+#endif
+	.fault = uio_physical_fault,
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
+	.huge_fault = uio_physical_huge_fault,
+#endif
+};
+
 static int uio_mmap_physical(struct vm_area_struct *vma)
 {
 	struct uio_device *idev = vma->vm_private_data;
@@ -754,7 +836,6 @@ static int uio_mmap_physical(struct vm_area_struct *vma)
 	if (vma->vm_end - vma->vm_start > mem->size)
 		return -EINVAL;
 
-	vma->vm_ops = &uio_physical_vm_ops;
 	if (idev->info->mem[mi].memtype == UIO_MEM_PHYS)
 		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
@@ -767,11 +848,34 @@ static int uio_mmap_physical(struct vm_area_struct *vma)
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
+		vma->vm_ops = &uio_physical_cow_vm_ops;
+
+		return remap_pfn_range(vma,
+				       vma->vm_start,
+				       mem->addr >> PAGE_SHIFT,
+				       vma->vm_end - vma->vm_start,
+				       vma->vm_page_prot);
+	}
+
+	vma->vm_ops = &uio_physical_vm_ops;
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

