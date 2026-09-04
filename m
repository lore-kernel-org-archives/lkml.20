Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E352D4CA287;
	Fri,  4 Sep 2026 22:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559910; cv=none; b=oAE3Cc1PpiefeizEG1gDoyNURFF7fzSWVU46cSL5UVmK7qNw+keokBtkqB8rDGXAAfUqoduxwqiM7RZGCvY1o3wUk2ggewSBqC8cvsEuEex8nU1lEuEKWvBb2/v1lPDaKuinMMQMB15o+gCrfKHi0VJBvijirlCgHsAF6rxBwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559910; c=relaxed/simple;
	bh=R1GQdcwi9lvRi5i9K7JJjtWIZWWMiNLi+UstaT7EBUw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=cuzVnf4rcoh3c+p++qcCb64+bTJFSz7pgKCJ/D0XozUqhhNrwOu25tTk2LaOi8LBsBWB9hEfqTV8alogHp0m4TEQTIaKCRsGwqD4x/k/YsuH6/HSJsoAPD0M/WxpCVp2Ii9a1d1+ideFO1qJza+oguV0o6PTxMpfc2tSAKbN+3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qQIYaNHW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q4zqWOmY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qQIYaNHW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q4zqWOmY"
Date: Fri, 04 Sep 2026 22:11:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788559906;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Crn5Z9PmGUlQcj0xUGvCmWj+25w106Co3loYso6WqJw=;
	b=qQIYaNHW4rAjB90r2UnGf9km7SpJUPnI2E2vHkh97M169cDyFV0X6VSKw8MBpWNjULakoX
	VIV06Dgimt7dpQsKTiEWRm+ZaHIRKPgBJHf3ywmU+IZAoVtQ4AH1s3cH9yMgvDKflJNRr+
	rnJhxmdvrnRrCiuvjfn2MZevXxCaPSgXRNSbvW21PpfjhEbtlVBhvKHTKq+Xo/F/JGeky/
	4uxMV6NJ8qfVRQatRfPLj7B5AiQy/Mm9FHB+NwgrOwwTKPvfg1Pz+gpbw7BAWBgKgALE+s
	4mwMwO5rwRUFFHjnsKBNVVVr38lIXVCiV/cJQ+zYpsyHE8R5NclpL/YHCiH9vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788559906;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Crn5Z9PmGUlQcj0xUGvCmWj+25w106Co3loYso6WqJw=;
	b=q4zqWOmYsb4s4ZHbWANB+/eh6xZnzGL/DaCPE1cu6gunofRNlEIssZ3sO+FuxZVus/Azpv
	0BbLtFKA4V/DKaDA==
From: "tip-bot2 for Rick Edgecombe" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/tdx] x86/virt/tdx: Handle multiple callers in tdx_pamt_get/put()
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>,
 Vishal Annapurve <vannapurve@google.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Hongyu Ning <hongyu.ning@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904215841.303070-6-rick.p.edgecombe@intel.com>
References: <20260904215841.303070-6-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178855990463.3717435.10504891139010833890.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     eca9d4a3f1f820439453f07ce700d316c398520e
Gitweb:        https://git.kernel.org/tip/eca9d4a3f1f820439453f07ce700d316c39=
8520e
Author:        Rick Edgecombe <rick.p.edgecombe@intel.com>
AuthorDate:    Fri, 04 Sep 2026 14:58:35 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 04 Sep 2026 15:06:02 -07:00

x86/virt/tdx: Handle multiple callers in tdx_pamt_get/put()

__tdx_pamt_get()/__tdx_pamt_put() unconditionally add or remove Dynamic
PAMT (DPAMT) backing for the 2MB region covering the passed page. However,
multiple callers can add or remove 4KB pages that fall within the same 2MB
region and in that scenario only a single PAMT entry is required.

Make the helpers handle only adding/removing DPAMT backing when required,
by refcounting each 2MB range. Gate the actual DPAMT add and remove on
refcount transitions (0->1 and 1->0). Serialize the refcount check and
SEAMCALL with a global spinlock so the read-decide-act sequence is atomic.
This also avoids TDX module BUSY errors, as the DPAMT add and remove
SEAMCALLs take internal TDX module locks for the 2MB ranges of the
specified PFN and the PAMT page pair PFNs. So simultaneous attempts on
the same 2MB ranges of the PFNs would otherwise encounter an error, which
would not be handleable in the put case.

The lock is global and heavyweight. Use simple conditional logic to keep
correctness obvious. This will be optimized in a later change.

The dpamt_refcounts[] are atomic_t's. They do not strictly need to be
because all access is protected by pamt_lock. The overhead of an atomic_t
in this situation is minuscule compared to the global lock. Leave the
atomic_t in place to enable future optimization with minimal churn.

Since the DPAMT helpers are broadly functional now, drop the "__"
to rename them tdx_pamt_get/put() and tdx_alloc/free_control_page().
Export them for use in KVM in subsequent changes.

AI was used under supervision to collect/apply feedback, split patches,
review code and workshop logs.

Based on a patch originally by Kiryl Shutsemau.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Vishal Annapurve <vannapurve@google.com>
Acked-by: Sohil Mehta <sohil.mehta@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Link: https://patch.msgid.link/20260904215841.303070-6-rick.p.edgecombe@intel=
.com
---
 arch/x86/include/asm/tdx.h  |   6 ++-
 arch/x86/virt/vmx/tdx/tdx.c | 102 +++++++++++++++++++----------------
 2 files changed, 63 insertions(+), 45 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index d414064..f7442ad 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -120,12 +120,18 @@ static inline bool tdx_supports_runtime_update(const st=
ruct tdx_sys_info *sysinf
=20
 bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo);
=20
+int tdx_pamt_get(kvm_pfn_t pfn);
+void tdx_pamt_put(kvm_pfn_t pfn);
+
 int tdx_guest_keyid_alloc(void);
 u32 tdx_get_nr_guest_keyids(void);
 void tdx_guest_keyid_free(unsigned int keyid);
=20
 void tdx_quirk_reset_paddr(unsigned long base, unsigned long size);
=20
+struct page *tdx_alloc_control_page(void);
+void tdx_free_control_page(struct page *page);
+
 struct tdx_td {
 	/* TD root structure: */
 	struct page *tdr_page;
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 305289b..c347600 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -292,7 +292,7 @@ static __init void free_dpamt_refcounts(void)
 	dpamt_refcounts =3D NULL;
 }
=20
-static __maybe_unused atomic_t *tdx_find_dpamt_refcount(unsigned long pfn)
+static atomic_t *tdx_find_dpamt_refcount(unsigned long pfn)
 {
 	/* Find which PMD a PFN is in. */
 	unsigned long index =3D pfn >> (PMD_SHIFT - PAGE_SHIFT);
@@ -2097,7 +2097,7 @@ static u64 pamt_2mb_arg(kvm_pfn_t pfn)
 	return hpa_2mb | TDX_PS_2M;
 }
=20
-/* Add PAMT backing for the 2MB region surrounding the given pfn. */
+/* Add DPAMT backing for the 2MB region surrounding the given pfn. */
 static u64 tdh_phymem_pamt_add(kvm_pfn_t pfn, struct page **pamt_pages)
 {
 	struct tdx_module_args args =3D {
@@ -2109,7 +2109,7 @@ static u64 tdh_phymem_pamt_add(kvm_pfn_t pfn, struct pa=
ge **pamt_pages)
 	return seamcall(TDH_PHYMEM_PAMT_ADD, &args);
 }
=20
-/* Remove PAMT backing for the 2MB region surrounding the given pfn. */
+/* Remove DPAMT backing for the 2MB region surrounding the given pfn. */
 static u64 tdh_phymem_pamt_remove(kvm_pfn_t pfn, struct page **pamt_pages)
 {
 	struct tdx_module_args args =3D {
@@ -2128,20 +2128,14 @@ static u64 tdh_phymem_pamt_remove(kvm_pfn_t pfn, stru=
ct page **pamt_pages)
 	return 0;
 }
=20
-/*
- * Allocate DPAMT memory for the 2MB aligned region  surrounding
- * the given page.
- *
- * Only call this when the pfn is known not to already have Dynamic
- * PAMT pages in the TDX module for it.
- *
- * Effectively it is not (yet) like a get, and more like a manual
- * manipulation of the DPAMT backing for the 2MB aligned range
- * covered by the pfn.
- */
-static int __tdx_pamt_get(kvm_pfn_t pfn)
+/* Serializes adding/removing DPAMT memory */
+static DEFINE_SPINLOCK(dpamt_lock);
+
+/* Bump DPAMT refcount for the given pfn and allocate DPAMT backing if neede=
d. */
+int tdx_pamt_get(kvm_pfn_t pfn)
 {
 	struct page *pamt_pages[TDX_DPAMT_ENTRY_PAGE_CNT];
+	atomic_t *dpamt_refcount;
 	u64 tdx_status;
 	int ret;
=20
@@ -2152,41 +2146,59 @@ static int __tdx_pamt_get(kvm_pfn_t pfn)
 	if (ret)
 		return ret;
=20
+	dpamt_refcount =3D tdx_find_dpamt_refcount(pfn);
+
+	spin_lock(&dpamt_lock);
+
+	/*
+	 * If the DPAMT entry is already added (i.e. refcount >=3D 1),
+	 * then just increment the refcount.
+	 */
+	if (atomic_inc_not_zero(dpamt_refcount))
+		goto out_free;
+
+	/* Try to add the PAMT page and take the refcount 0->1. */
 	tdx_status =3D tdh_phymem_pamt_add(pfn, pamt_pages);
-	if (tdx_status !=3D TDX_SUCCESS) {
+	if (WARN_ON_ONCE(tdx_status !=3D TDX_SUCCESS)) {
 		ret =3D -EIO;
 		goto out_free;
 	}
=20
+	atomic_set(dpamt_refcount, 1);
+	spin_unlock(&dpamt_lock);
 	return 0;
=20
 out_free:
+	spin_unlock(&dpamt_lock);
 	free_pamt_array(pamt_pages);
=20
 	return ret;
 }
+EXPORT_SYMBOL_FOR_KVM(tdx_pamt_get);
=20
-/*
- * Free DPAMT memory for the 2MB aligned region surrounding the
- * given page. Only call this when the pfn is known to already
- * have DPAMT pages in the TDX module for it, and no other pfns
- * in the aligned 2MB physical region still need it.
- *
- * Don't make multiple calls concurrently of __tdx_pamt_get/put(),
- * as there is no protections from races.
- *
- * Effectively it is not (yet) like a refcounted put, and more like a
- * manual manipulation of the DPAMT backing for the 2MB aligned
- * range covered by the pfn.
- */
-static void __tdx_pamt_put(kvm_pfn_t pfn)
+/* Drop DPAMT refcount for the given pfn and free DPAMT backing if needed. */
+void tdx_pamt_put(kvm_pfn_t pfn)
 {
 	struct page *pamt_pages[TDX_DPAMT_ENTRY_PAGE_CNT] =3D {};
+	atomic_t *dpamt_refcount;
 	u64 tdx_status;
=20
 	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
 		return;
=20
+	dpamt_refcount =3D tdx_find_dpamt_refcount(pfn);
+
+	spin_lock(&dpamt_lock);
+	/*
+	 * If there is more than 1 reference on the DPAMT entry, don't
+	 * remove it yet. Just decrement the refcount.
+	 */
+	if (atomic_read(dpamt_refcount) > 1) {
+		atomic_dec(dpamt_refcount);
+		goto out_unlock;
+	}
+
+	/* Try to remove the pamt page and take the refcount 1->0. */
 	tdx_status =3D tdh_phymem_pamt_remove(pfn, pamt_pages);
=20
 	/*
@@ -2194,23 +2206,26 @@ static void __tdx_pamt_put(kvm_pfn_t pfn)
 	 * tdh_phymem_pamt_remove() fails.  Don't panic/BUG_ON(), as
 	 * there is no risk of data corruption, but do yell loudly as
 	 * failure indicates a kernel bug, memory is being leaked, and
-	 * the dangling PAMT entry may cause future operations to fail.
+	 * the dangling DPAMT entry may cause future operations to fail.
 	 */
 	if (WARN_ON_ONCE(tdx_status !=3D TDX_SUCCESS))
-		return;
+		goto out_unlock;
=20
+	atomic_set(dpamt_refcount, 0);
+	spin_unlock(&dpamt_lock);
 	free_pamt_array(pamt_pages);
+	return;
+out_unlock:
+	spin_unlock(&dpamt_lock);
 }
+EXPORT_SYMBOL_FOR_KVM(tdx_pamt_put);
=20
 /*
  * Return a page that can be gifted to the TDX module for use as a "control"
  * page, i.e. pages that are used for control structures for a given TDX
- * guest, and thus obtain TDX protections, including PAMT tracking.
- *
- * This function is currently only safe to call once. And not safe to call
- * if __tdx_pamt_get() is called before or after.
+ * guest, and thus obtain TDX protections, including DPAMT tracking.
  */
-static __maybe_unused struct page *__tdx_alloc_control_page(void)
+struct page *tdx_alloc_control_page(void)
 {
 	struct page *page;
=20
@@ -2218,31 +2233,28 @@ static __maybe_unused struct page *__tdx_alloc_contro=
l_page(void)
 	if (!page)
 		return NULL;
=20
-	if (__tdx_pamt_get(page_to_pfn(page))) {
+	if (tdx_pamt_get(page_to_pfn(page))) {
 		__free_page(page);
 		return NULL;
 	}
=20
 	return page;
 }
+EXPORT_SYMBOL_FOR_KVM(tdx_alloc_control_page);
=20
 /*
  * Free a page that was gifted to the TDX module for use as a control
  * page. After this, the page is no longer protected by TDX.
- *
- * Like __tdx_pamt_put(), this is currently only safe to call this when
- * a page is already known to have DPAMT pages in the TDX module for
- * it, and no other pages in the aligned 2MB physical region will
- * still need the backing.
  */
-static __maybe_unused void __tdx_free_control_page(struct page *page)
+void tdx_free_control_page(struct page *page)
 {
 	if (!page)
 		return;
=20
-	__tdx_pamt_put(page_to_pfn(page));
+	tdx_pamt_put(page_to_pfn(page));
 	__free_page(page);
 }
+EXPORT_SYMBOL_FOR_KVM(tdx_free_control_page);
=20
 void tdx_sys_disable(void)
 {
