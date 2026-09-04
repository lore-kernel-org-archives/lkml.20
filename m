Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4783A466AE1;
	Fri,  4 Sep 2026 22:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559907; cv=none; b=Nd+b086GhEm8BwYZZ+mWOhZUQbqjP81nYMJCUV+xPVhpO+YRD1dZm67DOmolUeLltMTobG9cMN9GDCLMspESDj92VFHyQx+D8aRyvAfvhQUszphWhyavfp+A0PMaO46ZG5ofOrSy+TGHlssBOC4CSbOxwigVkhcBUIK6WYGM/rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559907; c=relaxed/simple;
	bh=OXSrNsDyk6tGltcMQJ2Sf9Am0geOm0v2+npgaBE7eBg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Au9man06Wo4szKtbZxJ4Fb3c7ERb9IVLy6fRH/QaYOJFuIeXcI2KFpCYGzdntvQLUINTlY7OP1DNkqOxWHMysfneocweYwYQK7fLaJnCzgyFJq3bFiohNvCjLjxGNNMvq6xrI9d7jvlzejAneFRa2dQtZvaOhao7NDWJ24WE1+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gWzlH0EB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NfDUPggg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gWzlH0EB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NfDUPggg"
Date: Fri, 04 Sep 2026 22:11:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788559903;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LbQBDFIyQJRCjYQsyFoSnsK9MIUdbiV0GISIfeyOhrg=;
	b=gWzlH0EB2x4R2GUezS5rvI1gV6xIksYmkxbJLHsbjzrrQdYmd2D9UisQO4VX6SAxL2cHLY
	IWTsh0KslDJLmX0phKEtgzmmU2EOOlY77ossaoi3AT5b7JrBD1lpQ5BDu9RMKfXEMQmV2I
	BIwxvU2xRnT3Br7/713+MlameaVg7ByWcCluBUSn8ubMtEdIEBM+zXVp5FG8D9g4cdImLS
	c8YSz4ZhKbOGBh3bZ78LQozyqZeAIAtKvhmvvnuC1nVLZ3pWmhCinLAcngM2lMSLpndCwC
	GeAchWT2QJM/nGM3MKEycwAXHpaIS5Ek83fv16SFSkeqonItGKcgswlH0qAnOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788559903;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LbQBDFIyQJRCjYQsyFoSnsK9MIUdbiV0GISIfeyOhrg=;
	b=NfDUPgggeEFOR4IObzzrhksGwVAD9o1LMFseRZztgX9Ok5SXGS5eNN6DxBq0MJ7fMwHIRb
	d8UAdFPdO0Ot5QDQ==
From: "tip-bot2 for Rick Edgecombe" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/tdx] x86/virt/tdx: Add APIs to support Dynamic PAMT ops
 from KVM's fault path
Cc: Sean Christopherson <seanjc@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Hongyu Ning <hongyu.ning@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904215841.303070-8-rick.p.edgecombe@intel.com>
References: <20260904215841.303070-8-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178855990171.3717435.10143213653217806626.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     2c8ca2ba9bb6aa277ec2af8e532f337ef12eb008
Gitweb:        https://git.kernel.org/tip/2c8ca2ba9bb6aa277ec2af8e532f337ef12=
eb008
Author:        Rick Edgecombe <rick.p.edgecombe@intel.com>
AuthorDate:    Fri, 04 Sep 2026 14:58:37 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 04 Sep 2026 15:06:02 -07:00

x86/virt/tdx: Add APIs to support Dynamic PAMT ops from KVM's fault path

When handling an EPT violation, KVM holds a spinlock while manipulating
the EPT. Before entering the spinlock it doesn't know how many EPT page
tables will need to be installed or whether a huge page will be used. For
this reason it allocates a worst case number of page tables that it might
need as part of servicing the EPT violation.

Under Dynamic PAMT (DPAMT) these pre-allocated pages will potentially need
to have DPAMT backing pages installed for them. KVM already has helpers to
manage topping up page caches before taking the MMU lock, but they cannot
be passed from KVM to arch/x86 code.

The problem of how and when to install the DPAMT backing pages for the
pages given to the TDX module during the fault path has had a lot of
design attempts.
 - Extracting KVM's MMU caches requires too much inlined code added to
   headers.
 - A few varieties of installing DPAMT backing when allocating the
   S-EPT page tables. (see links)
 - Using mempool_t to transfer the pages between KVM and arch/x86 doesn't
   work because the component is designed more around maintaining a pool
   of pages, rather than topping up a continually drained cache.

So don't do these as they all had various problems. Instead just create a
small simple data structure to use for handing a pre-allocated list of
pages between KVM and arch/x86 code. Model this on KVM's existing MMU
memory caches.

Add a tdx_pamt_cache arg to tdx_pamt_get() so it can draw pages from a
cache when needed. Not all DPAMT page installations will happen under
spinlock, for example TD and vCPU scoped control pages. So have
tdx_pamt_get() maintain the existing behavior of allocating from the page
allocator when NULL is passed for the struct tdx_pamt_cache arg. This
prevents excess allocations for cases where it can be avoided.

Export the new helpers for KVM.

AI was used under supervision to review code and workshop logs.

Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Acked-by: Sohil Mehta <sohil.mehta@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Link: https://lore.kernel.org/kvm/aXENNKjAKTM9UJNH@google.com/
Link: https://lore.kernel.org/kvm/20260129011517.3545883-20-seanjc@google.com/
Link: https://lore.kernel.org/kvm/aYW5CbUvZrLogsWF@yzhao56-desk.sh.intel.com/
Link: https://patch.msgid.link/20260904215841.303070-8-rick.p.edgecombe@intel=
.com
---
 arch/x86/include/asm/tdx.h  | 16 ++++++++-
 arch/x86/virt/vmx/tdx/tdx.c | 61 +++++++++++++++++++++++++++++++++---
 2 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index f7442ad..8c7839d 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -120,7 +120,21 @@ static inline bool tdx_supports_runtime_update(const str=
uct tdx_sys_info *sysinf
=20
 bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo);
=20
-int tdx_pamt_get(kvm_pfn_t pfn);
+/* Simple structure for pre-allocating DPAMT pages outside of spinlocks. */
+struct tdx_pamt_cache {
+	struct list_head page_list;
+	int cnt;
+};
+
+static inline void tdx_init_pamt_cache(struct tdx_pamt_cache *cache)
+{
+	INIT_LIST_HEAD(&cache->page_list);
+	cache->cnt =3D 0;
+}
+
+void tdx_free_pamt_cache(struct tdx_pamt_cache *cache);
+int tdx_topup_pamt_cache(struct tdx_pamt_cache *cache, unsigned long npages);
+int tdx_pamt_get(kvm_pfn_t pfn, struct tdx_pamt_cache *cache);
 void tdx_pamt_put(kvm_pfn_t pfn);
=20
 int tdx_guest_keyid_alloc(void);
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index c347600..39865a2 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2050,12 +2050,33 @@ bool tdx_supports_dynamic_pamt(const struct tdx_sys_i=
nfo *sysinfo)
 	return false;
 }
=20
-static int alloc_pamt_array(struct page **pamt_pages)
+static struct page *tdx_alloc_page_pamt_cache(struct tdx_pamt_cache *cache)
+{
+	struct page *page;
+
+	page =3D list_first_entry_or_null(&cache->page_list, struct page, lru);
+	if (page) {
+		list_del(&page->lru);
+		cache->cnt--;
+	}
+
+	return page;
+}
+
+static struct page *alloc_dpamt_page(struct tdx_pamt_cache *cache)
+{
+	if (cache)
+		return tdx_alloc_page_pamt_cache(cache);
+
+	return alloc_page(GFP_KERNEL_ACCOUNT);
+}
+
+static int alloc_pamt_array(struct page **pamt_pages, struct tdx_pamt_cache =
*cache)
 {
 	int i, j;
=20
 	for (i =3D 0; i < TDX_DPAMT_ENTRY_PAGE_CNT; i++) {
-		pamt_pages[i] =3D alloc_page(GFP_KERNEL_ACCOUNT);
+		pamt_pages[i] =3D alloc_dpamt_page(cache);
 		if (!pamt_pages[i])
 			goto err;
 	}
@@ -2132,7 +2153,7 @@ static u64 tdh_phymem_pamt_remove(kvm_pfn_t pfn, struct=
 page **pamt_pages)
 static DEFINE_SPINLOCK(dpamt_lock);
=20
 /* Bump DPAMT refcount for the given pfn and allocate DPAMT backing if neede=
d. */
-int tdx_pamt_get(kvm_pfn_t pfn)
+int tdx_pamt_get(kvm_pfn_t pfn, struct tdx_pamt_cache *cache)
 {
 	struct page *pamt_pages[TDX_DPAMT_ENTRY_PAGE_CNT];
 	atomic_t *dpamt_refcount;
@@ -2142,7 +2163,7 @@ int tdx_pamt_get(kvm_pfn_t pfn)
 	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
 		return 0;
=20
-	ret =3D alloc_pamt_array(pamt_pages);
+	ret =3D alloc_pamt_array(pamt_pages, cache);
 	if (ret)
 		return ret;
=20
@@ -2220,6 +2241,36 @@ out_unlock:
 }
 EXPORT_SYMBOL_FOR_KVM(tdx_pamt_put);
=20
+void tdx_free_pamt_cache(struct tdx_pamt_cache *cache)
+{
+	struct page *page;
+
+	while ((page =3D tdx_alloc_page_pamt_cache(cache)))
+		__free_page(page);
+}
+EXPORT_SYMBOL_FOR_KVM(tdx_free_pamt_cache);
+
+int tdx_topup_pamt_cache(struct tdx_pamt_cache *cache, unsigned long npages)
+{
+	if (WARN_ON_ONCE(!tdx_supports_dynamic_pamt(&tdx_sysinfo)))
+		return 0;
+
+	npages *=3D TDX_DPAMT_ENTRY_PAGE_CNT;
+
+	while (cache->cnt < npages) {
+		struct page *page =3D alloc_page(GFP_KERNEL_ACCOUNT);
+
+		if (!page)
+			return -ENOMEM;
+
+		list_add(&page->lru, &cache->page_list);
+		cache->cnt++;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM(tdx_topup_pamt_cache);
+
 /*
  * Return a page that can be gifted to the TDX module for use as a "control"
  * page, i.e. pages that are used for control structures for a given TDX
@@ -2233,7 +2284,7 @@ struct page *tdx_alloc_control_page(void)
 	if (!page)
 		return NULL;
=20
-	if (tdx_pamt_get(page_to_pfn(page))) {
+	if (tdx_pamt_get(page_to_pfn(page), NULL)) {
 		__free_page(page);
 		return NULL;
 	}
