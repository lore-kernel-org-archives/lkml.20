Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C522752ED43;
	Fri,  4 Sep 2026 22:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559912; cv=none; b=HlJS91cmgER51hqaWTuYlBN31hSVfbhOpHz/6Ggks0k6nQG791coIyA9Vv/SGhYIoYWPLbSulxtvGCn/L8AUi2ZFqxX3LK+RWq0bbCa+hLYIvuae9n88T5CY+fyx4rJrqkt8ZFzJBFR4rercFSgKvtOqfVTTjFsubc6K3fL3YT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559912; c=relaxed/simple;
	bh=WuVzEYxX8zvTq7yZTbr8mIA/10Ti0sd0tVToSfAlNp8=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=C0tu1Kvha1ghDrwblrSvZ9g18vmbj4EXvsXs9LWxGcEhXuwKUXLBKOHwQDzezv/fuL1tlu1K6U+DLZSAOe9mShMOSUfYi8OyrnApfDVnrD+PEGvwCc1BN0f5jojAYg2wRLdkUpqmmbTf2Ndkn2Jn39jMLLUbreLe01rxzziISFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qzKHjCXa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OIyK/NAc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qzKHjCXa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OIyK/NAc"
Date: Fri, 04 Sep 2026 22:11:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788559908;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EybQ1OBvF0P7sIpUn2GrCAD9rUtm1ezpLdrapfZPKAw=;
	b=qzKHjCXaNTv+QzTowkcVlViteyV2xbgPGm98kW+Su48Ajppt1WpNKIlqjsHcFMbqTh2xOl
	UvFgs025P9MkUCRGmGkYS05NQpyIWENEKzTN9Jd6WNp+eVpCBzYnm7zTy4MuutPMTgBNLc
	2IS80/bVmmYvkCjke+JtTzeE6FtpILrJ7kPg+3X8rGfkF7Oa6+vmZBlZPhpNQOkiyxGhN9
	H71jBfg/YaDD6QiFPULUUQctdj9WJvJ3UZ7FSASLmAzVCjDeTc+pxig5Oo1p0M9Hu8Q63t
	m3Cj8rbODmt5OfUXEYKdXBEMBSoMGj+A2ayj7eP+QLI0nmLccOZvL63II5Ngrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788559908;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EybQ1OBvF0P7sIpUn2GrCAD9rUtm1ezpLdrapfZPKAw=;
	b=OIyK/NActC2aJXTqZV3zygnjxYrEUDhV7q2dOK5+/Haqa6yeANO1tjURzpGlO5tIgy3cuo
	5bg1ybSzefZUNsDw==
From: "tip-bot2 for Rick Edgecombe" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/tdx] x86/virt/tdx: Add __tdx_pamt_get/put() helpers
Cc: Sean Christopherson <seanjc@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Chao Gao <chao.gao@intel.com>,
 Binbin Wu <binbin.wu@linux.intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Hongyu Ning <hongyu.ning@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904215841.303070-4-rick.p.edgecombe@intel.com>
References: <20260904215841.303070-4-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178855990736.3717435.403521667917902746.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     ad52ce8389d9f3708bfaa301e194550f582eb2b5
Gitweb:        https://git.kernel.org/tip/ad52ce8389d9f3708bfaa301e194550f582=
eb2b5
Author:        Rick Edgecombe <rick.p.edgecombe@intel.com>
AuthorDate:    Fri, 04 Sep 2026 14:58:33 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 04 Sep 2026 15:06:02 -07:00

x86/virt/tdx: Add __tdx_pamt_get/put() helpers

Add helpers to use when allocating or preparing pages that are handed to
the TDX module for use as control/S-EPT pages, and thus need Dynamic PAMT
(DPAMT) adjustments.

The TDX module tracks some state for each page of physical memory that it
might use. It calls this state the PAMT. It includes separate state for
each page size a physical page could be utilized at within the TDX module
(1GB, 2MB, 4KB). In DPAMT, only the 4KB page size state is
allocated dynamically.

KVM will need to hand pages to the TDX module that it will use at 4KB
granularity. So these pages will need DPAMT backing added before they are
used by the TDX module, and removed afterwards.

Create __tdx_pamt_get/put() to handle installing DPAMT 4KB backing for
pages that are already allocated (such as KVM's use of S-EPT page tables
or guest private memory). Have them take a pfn instead of a struct page,
as future changes will want to use these helpers for guest pages which are
tracked by PFN.

Also add __tdx_alloc_control_page() and __tdx_free_control_page() to handle
both page allocation and DPAMT installation. Make them behave like
normal alloc/free functions where allocation can fail in the case of no
memory, but free (with any necessary DPAMT release) always
succeeds. Do this so they can eventually support the existing TDX flows
that require teardowns to succeed.

Don't CLFLUSH the DPAMT pages handed to the TDX module, as is done
for some other SEAMCALLs, as the TDX docs specify that this is only
needed on "TD private memory or TD control structure page".

Since these allocations will be easily user triggerable, account the
memory.

Only one pair of DPAMT pages is required for each 2MB-aligned physical
region, so multiple callers could trip over each other if they try to
manage the shared backing for two separate 4KB pages contained in one.
To build the logic up iteratively, don't do anything to handle pages
from the same 2MB region yet. Functionality to handle this will be added
before DPAMT can be enabled.

AI was used under supervision to collect/apply feedback, split patches,
review code and workshop logs.

Based on a patch originally by Kiryl Shutsemau.

Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Vishal Annapurve <vannapurve@google.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Acked-by: Sohil Mehta <sohil.mehta@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Link: https://patch.msgid.link/20260904215841.303070-4-rick.p.edgecombe@intel=
.com
---
 arch/x86/virt/vmx/tdx/tdx.c | 197 +++++++++++++++++++++++++++++++++++-
 arch/x86/virt/vmx/tdx/tdx.h |   2 +-
 2 files changed, 199 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 54074dd..a9c5b6f 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -46,6 +46,9 @@
 #include "seamcall_internal.h"
 #include "tdx.h"
=20
+/* Number of DPAMT pages to be provided to TDX module per 2MB region of PA */
+#define TDX_DPAMT_ENTRY_PAGE_CNT 2
+
 struct tdx_module_state {
 	bool initialized;
 	bool sysinit_done;
@@ -1996,6 +1999,200 @@ bool tdx_supports_dynamic_pamt(const struct tdx_sys_i=
nfo *sysinfo)
 	return false;
 }
=20
+static int alloc_pamt_array(struct page **pamt_pages)
+{
+	int i, j;
+
+	for (i =3D 0; i < TDX_DPAMT_ENTRY_PAGE_CNT; i++) {
+		pamt_pages[i] =3D alloc_page(GFP_KERNEL_ACCOUNT);
+		if (!pamt_pages[i])
+			goto err;
+	}
+
+	return 0;
+
+err:
+	for (j =3D 0; j < i; j++)
+		__free_page(pamt_pages[j]);
+
+	return -ENOMEM;
+}
+
+static void free_pamt_array(struct page **pamt_pages)
+{
+	int i;
+
+	for (i =3D 0; i < TDX_DPAMT_ENTRY_PAGE_CNT; i++) {
+		/*
+		 * Reset pages unconditionally to cover cases
+		 * where they were passed to the TDX module.
+		 */
+		tdx_quirk_reset_paddr(page_to_phys(pamt_pages[i]), PAGE_SIZE);
+
+		__free_page(pamt_pages[i]);
+	}
+}
+
+/* Helper for building DPAMT seamcall() arguments. */
+static u64 pamt_2mb_arg(kvm_pfn_t pfn)
+{
+	/* Find the 2MB-wide DPAMT region for 'pfn': */
+	unsigned long hpa_2mb =3D ALIGN_DOWN(pfn << PAGE_SHIFT, PMD_SIZE);
+
+	/*
+	 * TDX ABI requires specifying the page level the installed DPAMT
+	 * backing will cover, even though today only 2MB is supported.
+	 */
+	return hpa_2mb | TDX_PS_2M;
+}
+
+/* Add PAMT backing for the 2MB region surrounding the given pfn. */
+static u64 tdh_phymem_pamt_add(kvm_pfn_t pfn, struct page **pamt_pages)
+{
+	struct tdx_module_args args =3D {
+		.rcx =3D pamt_2mb_arg(pfn),
+		.rdx =3D page_to_phys(pamt_pages[0]),
+		.r8  =3D page_to_phys(pamt_pages[1]),
+	};
+
+	return seamcall(TDH_PHYMEM_PAMT_ADD, &args);
+}
+
+/* Remove PAMT backing for the 2MB region surrounding the given pfn. */
+static u64 tdh_phymem_pamt_remove(kvm_pfn_t pfn, struct page **pamt_pages)
+{
+	struct tdx_module_args args =3D {
+		.rcx =3D pamt_2mb_arg(pfn),
+	};
+	u64 ret;
+
+	ret =3D seamcall_ret(TDH_PHYMEM_PAMT_REMOVE, &args);
+	if (ret)
+		return ret;
+
+	/* Copy PAMT pages out of the struct per the TDX ABI */
+	pamt_pages[0] =3D phys_to_page(args.rdx);
+	pamt_pages[1] =3D phys_to_page(args.r8);
+
+	return 0;
+}
+
+/*
+ * Allocate DPAMT memory for the 2MB aligned region  surrounding
+ * the given page.
+ *
+ * Only call this when the pfn is known not to already have Dynamic
+ * PAMT pages in the TDX module for it.
+ *
+ * Effectively it is not (yet) like a get, and more like a manual
+ * manipulation of the DPAMT backing for the 2MB aligned range
+ * covered by the pfn.
+ */
+static int __tdx_pamt_get(kvm_pfn_t pfn)
+{
+	struct page *pamt_pages[TDX_DPAMT_ENTRY_PAGE_CNT];
+	u64 tdx_status;
+	int ret;
+
+	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
+		return 0;
+
+	ret =3D alloc_pamt_array(pamt_pages);
+	if (ret)
+		return ret;
+
+	tdx_status =3D tdh_phymem_pamt_add(pfn, pamt_pages);
+	if (tdx_status !=3D TDX_SUCCESS) {
+		ret =3D -EIO;
+		goto out_free;
+	}
+
+	return 0;
+
+out_free:
+	free_pamt_array(pamt_pages);
+
+	return ret;
+}
+
+/*
+ * Free DPAMT memory for the 2MB aligned region surrounding the
+ * given page. Only call this when the pfn is known to already
+ * have DPAMT pages in the TDX module for it, and no other pfns
+ * in the aligned 2MB physical region still need it.
+ *
+ * Don't make multiple calls concurrently of __tdx_pamt_get/put(),
+ * as there is no protections from races.
+ *
+ * Effectively it is not (yet) like a refcounted put, and more like a
+ * manual manipulation of the DPAMT backing for the 2MB aligned
+ * range covered by the pfn.
+ */
+static void __tdx_pamt_put(kvm_pfn_t pfn)
+{
+	struct page *pamt_pages[TDX_DPAMT_ENTRY_PAGE_CNT] =3D {};
+	u64 tdx_status;
+
+	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
+		return;
+
+	tdx_status =3D tdh_phymem_pamt_remove(pfn, pamt_pages);
+
+	/*
+	 * Don't free pamt_pages as it could hold garbage when
+	 * tdh_phymem_pamt_remove() fails.  Don't panic/BUG_ON(), as
+	 * there is no risk of data corruption, but do yell loudly as
+	 * failure indicates a kernel bug, memory is being leaked, and
+	 * the dangling PAMT entry may cause future operations to fail.
+	 */
+	if (WARN_ON_ONCE(tdx_status !=3D TDX_SUCCESS))
+		return;
+
+	free_pamt_array(pamt_pages);
+}
+
+/*
+ * Return a page that can be gifted to the TDX module for use as a "control"
+ * page, i.e. pages that are used for control structures for a given TDX
+ * guest, and thus obtain TDX protections, including PAMT tracking.
+ *
+ * This function is currently only safe to call once. And not safe to call
+ * if __tdx_pamt_get() is called before or after.
+ */
+static __maybe_unused struct page *__tdx_alloc_control_page(void)
+{
+	struct page *page;
+
+	page =3D alloc_page(GFP_KERNEL_ACCOUNT);
+	if (!page)
+		return NULL;
+
+	if (__tdx_pamt_get(page_to_pfn(page))) {
+		__free_page(page);
+		return NULL;
+	}
+
+	return page;
+}
+
+/*
+ * Free a page that was gifted to the TDX module for use as a control
+ * page. After this, the page is no longer protected by TDX.
+ *
+ * Like __tdx_pamt_put(), this is currently only safe to call this when
+ * a page is already known to have DPAMT pages in the TDX module for
+ * it, and no other pages in the aligned 2MB physical region will
+ * still need the backing.
+ */
+static __maybe_unused void __tdx_free_control_page(struct page *page)
+{
+	if (!page)
+		return;
+
+	__tdx_pamt_put(page_to_pfn(page));
+	__free_page(page);
+}
+
 void tdx_sys_disable(void)
 {
 	struct tdx_module_args args =3D {};
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index bdfd0e1..a886c54 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -48,6 +48,8 @@
 #define TDH_SYS_CONFIG			45
 #define TDH_SYS_SHUTDOWN		52
 #define TDH_SYS_UPDATE			53
+#define TDH_PHYMEM_PAMT_ADD		58
+#define TDH_PHYMEM_PAMT_REMOVE		59
 #define TDH_SYS_DISABLE			69
=20
 /*
