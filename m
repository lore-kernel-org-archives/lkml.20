Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488214;
	b=tgpVQX1QDI5Qm7gTcrgYwGVJRACIc1TFX7CDYv9VwmQKfVexiDXRZJVVp5KUeY/TE50j
	 vJ6hDQCAtJEEiIwl0+vXCIlBjbwTS266SXm5HtEJfTkkt5NBBuHDilsJ7rGbuWI97DQ74
	 8eq0PVyKOP4r9Gt7kLnkK/cIDbiwL0Cb1y8HXh7r3lfehdjwZ6JDqmDPkHEPc/naJ4xVj
	 +/tyST20324vb8csIsR0Ue4e4yNx0RoweMBld6JBx596qY8cHpqSKt5AtMpiFhgPiNVjV
	 AcSwzAyEATWg16Yp0H5OVOKPVeYZgxv0pGl/Oech4VHqv77nr+Kt1xXzlxoGpZXRWng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488214;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=D/d4ZrZKEqMTH1maihvf8QldnzgMpcXtRE7WhIed8OE=;
	b=kfMrUlIdujNtgzzwS/LKCQRyWT8FW/kO7oBd12RxP81/ZYln568CWw8AJlNAq80vLxGU
	 gTHGvGKKxvSazpa7plWnTefP4o4C1KViPKPSkt4VMze8okK8WmFevGfdVypOTZTMBPQi9
	 EUSN3veyxsV9kKSySZ/dj12+3B2JRgR+p1h+B6SXW09Dq2MuSpanmxDdJWM5Rg6gGSIeK
	 VYeeVNebh0cfJ+xL3U/dPp/fnYEYC47yKCis3UvZ8n6QZUfITnaXXl5PyOoNtjzaCSGnG
	 fCTaiuM77f81QnKjSpXIQxC8YtHR1djC3fTm4R9ls8a6e4hKzx4hQ2cq626PBX/mD8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=sg3vZJ+F;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260AA606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260AA606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=sg3vZJ+F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794488214; x=1826024214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D/d4ZrZKEqMTH1maihvf8QldnzgMpcXtRE7WhIed8OE=;
  b=sg3vZJ+FmDS8xn5mOLDYzdjNIfIhd7D1xiYX2lXS4Xg9U2aNB5Omv+XR
   J34ywtJ3FccmvpdN13cUTy+WZK83OcCgvZx4gyKk0SPc523TdnApwXB4S
   9m1SAsjKXxWCYQz6biWIOr3Y5rwEYvBLhMlPqR78e9nFn2sqgy/hGyrEm
   ej5Gsb5ojbHWuPuGsa144wrr3AbOBKFGUAtAdYxIFqdXeSQi5AGN78syc
   ANNRVwi6hmO5qWItFv/bWx3IxtGGL2g7u+Op9JEdfes/PUr38AAO1ECTI
   AZjJMGKtC5B3nuCB3lRwVa7yrz0s2ljioa9B3zEqnOMIhNZPpjRQGJnHo
   g==;
X-CSE-ConnectionGUID: 0bekGHWISNGLadMSnjM1lQ==
X-CSE-MsgGUID: TIokyFAQTdCLgg1s/P28Uw==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="33728083"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:56:50 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:12720]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.142:2525] with esmtp (Farcaster)
 id 04382821-b0dc-4ada-83da-4360efc3a3c1; Thu, 12 Nov 2026 12:56:50 +0000 (UTC)
X-Farcaster-Flow-ID: 04382821-b0dc-4ada-83da-4360efc3a3c1
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 12:56:50 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 12:56:47 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, David Hildenbrand <david@kernel.org>
CC: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
	<jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 2/4] mm: add vmf_insert_pfn_order() and vmf_pfn_order_ok() helpers
Date: Thu, 12 Nov 2026 12:56:36 +0000
Message-ID: <20261112125638.12209-3-farbere@amazon.com>
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

->fault/->huge_fault handlers of VM_PFNMAP mappings that want huge PFN
mappings open-code the same steps: check that the order-aligned fault
window lies within the VMA and that the pfn is aligned to the order,
then call vmf_insert_pfn(), vmf_insert_pfn_pmd() or vmf_insert_pfn_pud()
depending on the order, guarded by
CONFIG_ARCH_SUPPORTS_{PMD,PUD}_PFNMAP, and fall back to a smaller order
otherwise. vfio-pci has its own is_aligned_for_order() and
vfio_pci_vmf_insert_pfn() for this.

Add vmf_pfn_order_ok() for the window and alignment check, and
vmf_insert_pfn_order() for the order dispatch. The latter also checks
pfn_modify_allowed() for huge orders: the order-0 vmf_insert_pfn() does
this, but vmf_insert_pfn_pmd() and vmf_insert_pfn_pud() do not. The two
are separate so that a driver can apply its own policy (access checks,
device locking) between them.

vmf_insert_pfn_order() passes the fault's write flag to
vmf_insert_pfn_pmd() and vmf_insert_pfn_pud(), as the DAX and DRM
->huge_fault handlers do. With write=false, insert_pmd() leaves a
read-only entry in place and returns VM_FAULT_NOPAGE, so a store to a
mapping that soft-dirty tracking write-protected faults forever;
wp_huge_pmd() splits the entry only when the handler returns
VM_FAULT_FALLBACK. Passing it marks the entry young, dirty and, where
the VMA allows, writable, as wp_page_reuse() does at PTE level. uffd-wp
cannot apply here: vma_can_userfault() rejects a VM_PFNMAP vma at its
mm-backed test.

The order-0 path takes the flag too, so the helper does not behave
differently at different orders. A CPU store does not need it: the
order-0 fault installs a read-only entry and the store faults again,
where do_wp_page() -> wp_pfn_shared() upgrades it. A caller that faults
a page in without retrying the access, fixup_user_fault() from an
->access handler, gets no second fault, and generic_access_phys() takes
its writability from pte_write(); I have not been able to observe that
combination failing on /dev/mem or on either UIO memtype, so this is
consistency rather than a fix for an observed failure. vmf_insert_pfn()
cannot pass the flag, so vmf_insert_pfn_prot() keeps its signature and
its body moves to a static helper that takes mkwrite.

The helper also declines the huge zero folio's pfn, which
vmf_insert_pfn_pmd() refuses with SIGBUS, so that the fault is retried
at PTE order where it maps.

They will be used by the /dev/mem and UIO huge_fault handlers added
later in this series.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v2:
The order-0 path passes the fault's write flag too, so a caller that does
not retry the access, fixup_user_fault() from an ->access handler, is not
left with a read-only pte. vmf_insert_pfn_prot() keeps its signature; its
body moved into a static __vmf_insert_pfn_prot() taking mkwrite. Dropped
the commit message's claim that uffd-wp can write-protect such a mapping;
it cannot. Reported by sashiko-bot.

 include/linux/mm.h |  28 +++++++++++
 mm/memory.c        | 115 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 119 insertions(+), 24 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c11bdee1596a..57437b317709 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5010,6 +5010,34 @@ vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn);
 vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
 		unsigned long addr, unsigned long pfn);
+vm_fault_t vmf_insert_pfn_order(struct vm_fault *vmf, unsigned long pfn,
+				unsigned int order);
+
+/**
+ * vmf_pfn_order_ok - check that a pfn can be mapped at a given fault order
+ * @vmf: The fault being handled.
+ * @pfn: The pfn to map at the start of the order-aligned fault window.
+ * @order: The fault order (0 for a single page).
+ *
+ * For a huge (order > 0) fault, the order-aligned window around @vmf->address
+ * must lie within the VMA and @pfn must be aligned to @order. @pfn is only
+ * looked at once the window is known to lie within the VMA, so a caller may
+ * compute it before calling, even when the window starts below vm_start.
+ *
+ * Return: true if vmf_insert_pfn_order() may map @pfn at @order, false if the
+ * fault should fall back to a smaller order.
+ */
+static inline bool vmf_pfn_order_ok(const struct vm_fault *vmf,
+				    unsigned long pfn, unsigned int order)
+{
+	const struct vm_area_struct *vma = vmf->vma;
+	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
+
+	return !order || (addr >= vma->vm_start &&
+			  addr + (PAGE_SIZE << order) <= vma->vm_end &&
+			  IS_ALIGNED(pfn, 1UL << order));
+}
+
 int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsigned long len);
 
 static inline vm_fault_t vmf_insert_page(struct vm_area_struct *vma,
diff --git a/mm/memory.c b/mm/memory.c
index ab29ec719ae1..2e4bb5af22ce 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2912,6 +2912,36 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 	return VM_FAULT_NOPAGE;
 }
 
+static vm_fault_t __vmf_insert_pfn_prot(struct vm_area_struct *vma,
+					unsigned long addr, unsigned long pfn,
+					pgprot_t pgprot, bool mkwrite)
+{
+	/*
+	 * Technically, architectures with pte_special can avoid all these
+	 * restrictions (same for remap_pfn_range).  However we would like
+	 * consistency in testing and feature parity among all, so we should
+	 * try to keep these invariants in place for everybody.
+	 */
+	BUG_ON(!(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP)));
+	BUG_ON((vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP)) ==
+						(VM_PFNMAP|VM_MIXEDMAP));
+	BUG_ON((vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma));
+	BUG_ON((vma->vm_flags & VM_MIXEDMAP) && pfn_valid(pfn));
+
+	if (unlikely(is_zero_pfn(pfn)))
+		return VM_FAULT_SIGBUS;
+
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	if (!pfn_modify_allowed(pfn, pgprot))
+		return VM_FAULT_SIGBUS;
+
+	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
+
+	return insert_pfn(vma, addr, pfn, pgprot, mkwrite);
+}
+
 /**
  * vmf_insert_pfn_prot - insert single pfn into user vma with specified pgprot
  * @vma: user vma to map to
@@ -2948,30 +2978,7 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn, pgprot_t pgprot)
 {
-	/*
-	 * Technically, architectures with pte_special can avoid all these
-	 * restrictions (same for remap_pfn_range).  However we would like
-	 * consistency in testing and feature parity among all, so we should
-	 * try to keep these invariants in place for everybody.
-	 */
-	BUG_ON(!(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP)));
-	BUG_ON((vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP)) ==
-						(VM_PFNMAP|VM_MIXEDMAP));
-	BUG_ON((vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma));
-	BUG_ON((vma->vm_flags & VM_MIXEDMAP) && pfn_valid(pfn));
-
-	if (unlikely(is_zero_pfn(pfn)))
-		return VM_FAULT_SIGBUS;
-
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
-
-	if (!pfn_modify_allowed(pfn, pgprot))
-		return VM_FAULT_SIGBUS;
-
-	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
-
-	return insert_pfn(vma, addr, pfn, pgprot, false);
+	return __vmf_insert_pfn_prot(vma, addr, pfn, pgprot, false);
 }
 EXPORT_SYMBOL(vmf_insert_pfn_prot);
 
@@ -3002,6 +3009,66 @@ vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 }
 EXPORT_SYMBOL(vmf_insert_pfn);
 
+/**
+ * vmf_insert_pfn_order - insert a pfn mapping of a given fault order
+ * @vmf: The fault being handled.
+ * @pfn: The pfn to map at the start of the order-aligned fault window.
+ * @order: The fault order (0 for a single page).
+ *
+ * Helper for ->fault and ->huge_fault handlers of VM_PFNMAP mappings: maps @pfn
+ * with a PTE for order 0, or with a PMD/PUD for PMD_ORDER/PUD_ORDER where the
+ * architecture supports huge PFN mappings. The caller must have checked the
+ * window and the pfn alignment with vmf_pfn_order_ok().
+ *
+ * vma cannot be a COW mapping.
+ *
+ * A write fault is mapped writable where the VMA allows it, so a first write
+ * does not call ->pfn_mkwrite.
+ *
+ * Return: vm_fault_t value; %VM_FAULT_FALLBACK if @order cannot be mapped, so
+ * that the fault is retried at a smaller order.
+ */
+vm_fault_t vmf_insert_pfn_order(struct vm_fault *vmf, unsigned long pfn,
+				unsigned int order)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	bool write = vmf->flags & FAULT_FLAG_WRITE;
+
+	/*
+	 * Map a write fault writable at order 0 too, as the PMD and PUD paths
+	 * below do. Otherwise the pte comes from vma->vm_page_prot, which is
+	 * read-only while soft-dirty tracking is armed, and a caller that has
+	 * no second fault to upgrade it - fixup_user_fault() from .access, for
+	 * one - is left with a read-only pte.
+	 */
+	if (!order)
+		return __vmf_insert_pfn_prot(vma, vmf->address, pfn,
+					     vma->vm_page_prot, write);
+
+	/*
+	 * vmf_insert_pfn_pmd() refuses the huge zero folio's pfn with SIGBUS,
+	 * while a PTE mapping of it is fine, so fall back to a smaller order.
+	 */
+	if (is_huge_zero_pfn(pfn))
+		return VM_FAULT_FALLBACK;
+
+	/*
+	 * vmf_insert_pfn_pmd()/_pud() don't call pfn_modify_allowed(), unlike
+	 * the order-0 path, so check it explicitly for the L1TF mitigation.
+	 */
+	if (!pfn_modify_allowed(pfn, vma->vm_page_prot))
+		return VM_FAULT_FALLBACK;
+
+	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && order == PMD_ORDER)
+		return vmf_insert_pfn_pmd(vmf, pfn, write);
+
+	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP) && order == PUD_ORDER)
+		return vmf_insert_pfn_pud(vmf, pfn, write);
+
+	return VM_FAULT_FALLBACK;
+}
+EXPORT_SYMBOL_GPL(vmf_insert_pfn_order);
+
 static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn,
 			bool mkwrite)
 {
-- 
2.47.3

