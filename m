Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.218.115.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396664;
	b=XRz9jbHAL9GrlUsFA1kp+bfMy7CePEh+oQvD9MxwGZqaoERGKFKC2NzD7qPgAoflSjXu
	 GRzsmJE4BtvT10QSjabpn4o0TW3HKR64JzRBlqAIgjqPAgOiysNfShGKZGtLkWcnVi+zg
	 jjDT65uOPhQCSTLqn8GpUDrODN8e6C0h3LbxeSI7SGP+SS1TaZ4dbjo+LNgXHcHD//5Zw
	 i0yZAp3AcPR20W2U0Kkdh7gh/OvsvZ/weeGL3753AxwhTLpGwucDjFfhTywox1xcleZXq
	 CUV0MXxItP2jUqI3FtaSPDo2ti9RaXovLC/WRAtBa+jh+Y0AdfOk3dsSWZzmUPziXbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396664;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=i5hy2lmgZD/5AZxsU8Tl1ILJtqvLvPEUZjJf6dlzk2Y=;
	b=MuuAWayLMP+uQXtqr8L8lPsxu7ewZ09TqU/cdHc+no4jpEpFEMuYkqafSJAbPojZFQkx
	 rVrOmrAd8cqEjebMv/JyFW8kb9wKpZHSzB8BNJecPMtG68h//06VYJ5riqN8LnnyqMssf
	 7DducSwfDxt78mwenRYeRSwcqf9K0mToSKH5z7rzWHud9eOq53ho4cEB+8PJ4EvcE2R/m
	 6dnL0/KxrhWumWEtnBjflfzSYIm4b3rAxykZEzMZaBIbrbI62cXzI2e/2/bXN8V83LCcs
	 1YnoWLp+MVPq/quI0E5Jx4lpcv0Y2WwNYTWpD0+xMoFp93RxJ1fsSpthjHF3CgCPcZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=mWfP4cqK;
	arc=none smtp.remote-ip=34.218.115.239
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF32606A8A7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF32606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=mWfP4cqK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794396659; x=1825932659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i5hy2lmgZD/5AZxsU8Tl1ILJtqvLvPEUZjJf6dlzk2Y=;
  b=mWfP4cqKuWnrWXNaDKIHojYUYubRNqiGyi6Hdl8JE3H3U2CpVNbUAKzn
   bCh9qztEVwVoy/mOcfbVXflfZSdXZqj946pBbpPZ79KfGTefhf3d2iJ5o
   twY24mEYq1WqtjqrBHVestSdNY39Aci9//0IAEinUr7sqs66mUM0EPH2D
   7VuUCtbBrBjWDf0EbS4OYbfZEB4LBhSvKz2B2JZTc1i7OFGK3c/aEWbb1
   zNSZePhm/T/O6XzGZLryzru1MLnPjc2raEKAuUuMWowqnT7HzxUkJD82n
   QeQOQTLIszEyiyDhhgb5LH5C4q92mZs3hvxzboVN+zvQXI1/5IrhfxAqE
   g==;
X-CSE-ConnectionGUID: im2s5TN3Quyoo/lC8X1kdw==
X-CSE-MsgGUID: g4ZRM8JkRxe0XlKxv9bZQQ==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33483459"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 11:30:57 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:1656]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.231:2525] with esmtp (Farcaster)
 id b69e9d91-cb6d-4ce2-b584-d80e29bdc93c; Wed, 11 Nov 2026 11:30:57 +0000 (UTC)
X-Farcaster-Flow-ID: b69e9d91-cb6d-4ce2-b584-d80e29bdc93c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 11:30:56 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 11 Nov 2026
 11:30:54 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato
	<pfalcato@suse.de>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	Eliav Farber <farbere@amazon.com>
Subject: [PATCH 2/4] mm: add vmf_insert_pfn_order() and vmf_pfn_order_ok() helpers
Date: Wed, 11 Nov 2026 11:30:43 +0000
Message-ID: <20261111113045.35368-3-farbere@amazon.com>
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
mapping that mm write-protected for tracking (soft-dirty, uffd-wp)
faults forever; wp_huge_pmd() splits the entry only when the handler
returns VM_FAULT_FALLBACK. Passing it marks the entry young, dirty and,
where the VMA allows, writable, as wp_page_reuse() does at PTE level.
The order-0 path needs nothing: wp_pfn_shared() resolves that fault.

The helper also declines the huge zero folio's pfn, which
vmf_insert_pfn_pmd() refuses with SIGBUS, so that the fault is retried
at PTE order where it maps.

They will be used by the /dev/mem and UIO huge_fault handlers added
later in this series.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 include/linux/mm.h | 28 ++++++++++++++++++++++++++
 mm/memory.c        | 49 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

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
index ab29ec719ae1..0c583442e049 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3002,6 +3002,55 @@ vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
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
+ * Return: vm_fault_t value; %VM_FAULT_FALLBACK if @order cannot be mapped, so
+ * that the fault is retried at a smaller order.
+ */
+vm_fault_t vmf_insert_pfn_order(struct vm_fault *vmf, unsigned long pfn,
+				unsigned int order)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	bool write = vmf->flags & FAULT_FLAG_WRITE;
+
+	if (!order)
+		return vmf_insert_pfn(vma, vmf->address, pfn);
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

