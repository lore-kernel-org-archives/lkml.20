Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A46A3DC4A4;
	Fri,  4 Sep 2026 22:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559909; cv=none; b=azvV7fsuzwpy46tpi8KxHUbDLRJPuNQZqzkzaQh8RO/G7p1xbWR487iY4dXLrZGJBHpcYwY2RyhgFF0/oN+Lj7UtKQOKFCt2cjEFyb8ruTin/M18ogm/KaUNdz7iOpc8flewmFyBv/bDd7Y3i6Tje3eGhMcx7dS5bnRMwi879Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559909; c=relaxed/simple;
	bh=wcEfzXz2PcTNmGC3BmhtXiHFQi6xoRBgIy6+X542PTU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=EsXwgHa9iU+lt38g3+uyQdmUa7diq5i58dJLTLfOj4UHGhhzVuaKXRLyVC00fpkaGOO+uk2i5WaVv4J5KsM2ytZIsmW3elYGgkz6Z+CVjtA3dflGW/rxpRXgoRyM84u+ZSNzEvG1/xdl97uPJC2iqujjJ6tmMNMS/ztX/wceU6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Opp0NHcF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=to0wWFed; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Opp0NHcF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="to0wWFed"
Date: Fri, 04 Sep 2026 22:11:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788559904;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DyFMwUha4QkBb+RECa73Gatm5wZJBPYMl+qwnP2pQXg=;
	b=Opp0NHcF64Od/9Qhf/JXSUNYkw/Ojb3AdsIgUbEy7FDDkRd9MUweYv8KOlgLuzu1OJU4LE
	DLM9XhQKaPiqvw9XgYv4BQPuNrd46uX9frV0MjIztY02BwNuRjmGcuzKE7bPHDsTTxPAY2
	5wdAFDVijvU6zFvN3jWwBEFcp/y/Mvf/FjOBgvNn5IJ5eq5cEKvWG/NdDXiH1fSHiXHwqj
	37TeYNJS1jXuBPr/+7cb+Kn+EM8eUZClMswcuqyWj1LcRyREhyMpKEUSOiE7HAzjHENULN
	LuVkC14o+wioKL3CL5I9ABdAIwo2JwxlA//clSiee7UAYxG7DYkS15TFGjZyuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788559904;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DyFMwUha4QkBb+RECa73Gatm5wZJBPYMl+qwnP2pQXg=;
	b=to0wWFedDMZnk0ThIXTAGHiaDadtjaLS+fLesHTiLJTXF2uTEqOvOictz9uqVf9Y8LaVoO
	WrR9s363ni/q/KCw==
From: "tip-bot2 for Kirill A. Shutemov" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/tdx] KVM/TDX: Allocate PAMT memory for TD and vCPU control
 structures
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>,
 Vishal Annapurve <vannapurve@google.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Hongyu Ning <hongyu.ning@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904215841.303070-7-rick.p.edgecombe@intel.com>
References: <20260904215841.303070-7-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178855990317.3717435.3712324168956568224.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     86305da521d1dcf44cb2a61140a3e78f390dd873
Gitweb:        https://git.kernel.org/tip/86305da521d1dcf44cb2a61140a3e78f390=
dd873
Author:        Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
AuthorDate:    Fri, 04 Sep 2026 14:58:36 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 04 Sep 2026 15:06:02 -07:00

KVM/TDX: Allocate PAMT memory for TD and vCPU control structures

Use control page helpers for allocating and freeing TD control structures,
such that these operations can work for Dynamic PAMT.

The TDX module tracks some state for each page of physical memory that it
might use. It calls this state the PAMT. It includes separate state for
each page size a physical page could be utilized at within the TDX module
(1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
allocated dynamically. So the kernel must ensure PAMT backing is installed
for any 4KB page being gifted to the TDX module, and must tear down the
backing when all associated gifted pages are reclaimed.

TD scoped control pages (TDR, TDCS) and vCPU scoped control pages (TDVPR,
TDCX) are all handed to the TDX module at 4KB page size and are therefore
subject to this requirement. Replace the raw alloc_page()/__free_page()
calls for these pages with tdx_alloc/free_control_page().

Switching between special Dynamic PAMT operations or normal page
alloc/free operations is handled internally in
tdx_alloc/free_control_page(). So don't check for Dynamic PAMT around these
calls. Just call them unconditionally. Similarly, drop the NULL checks
before freeing, as tdx_free_control_page() handles NULL internally.

No functional change intended when DPAMT is not in use.

[sean: handle alloc+free+reclaim in one patch]
[rick: enhance log, reviewing, rebase, with help from AI tooling]
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
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
Acked-by: Sean Christopherson <seanjc@google.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Link: https://patch.msgid.link/20260904215841.303070-7-rick.p.edgecombe@intel=
.com
---
 arch/x86/kvm/vmx/tdx.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b272c20..3592596 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -362,7 +362,7 @@ static void tdx_reclaim_control_page(struct page *ctrl_pa=
ge)
 	if (tdx_reclaim_page(ctrl_page))
 		return;
=20
-	__free_page(ctrl_page);
+	tdx_free_control_page(ctrl_page);
 }
=20
 struct tdx_flush_vp_arg {
@@ -589,7 +589,7 @@ static void tdx_reclaim_td_control_pages(struct kvm *kvm)
=20
 	tdx_quirk_reset_paddr(page_to_phys(kvm_tdx->td.tdr_page), PAGE_SIZE);
=20
-	__free_page(kvm_tdx->td.tdr_page);
+	tdx_free_control_page(kvm_tdx->td.tdr_page);
 	kvm_tdx->td.tdr_page =3D NULL;
 }
=20
@@ -2456,7 +2456,7 @@ static int __tdx_td_init(struct kvm *kvm, struct td_par=
ams *td_params,
=20
 	ret =3D -ENOMEM;
=20
-	tdr_page =3D alloc_page(GFP_KERNEL_ACCOUNT);
+	tdr_page =3D tdx_alloc_control_page();
 	if (!tdr_page)
 		goto free_hkid;
=20
@@ -2469,7 +2469,7 @@ static int __tdx_td_init(struct kvm *kvm, struct td_par=
ams *td_params,
 		goto free_tdr;
=20
 	for (i =3D 0; i < kvm_tdx->td.tdcs_nr_pages; i++) {
-		tdcs_pages[i] =3D alloc_page(GFP_KERNEL_ACCOUNT);
+		tdcs_pages[i] =3D tdx_alloc_control_page();
 		if (!tdcs_pages[i])
 			goto free_tdcs;
 	}
@@ -2587,10 +2587,8 @@ static int __tdx_td_init(struct kvm *kvm, struct td_pa=
rams *td_params,
 teardown:
 	/* Only free pages not yet added, so start at 'i' */
 	for (; i < kvm_tdx->td.tdcs_nr_pages; i++) {
-		if (tdcs_pages[i]) {
-			__free_page(tdcs_pages[i]);
-			tdcs_pages[i] =3D NULL;
-		}
+		tdx_free_control_page(tdcs_pages[i]);
+		tdcs_pages[i] =3D NULL;
 	}
 	if (!kvm_tdx->td.tdcs_pages)
 		kfree(tdcs_pages);
@@ -2605,16 +2603,13 @@ free_packages:
 	free_cpumask_var(packages);
=20
 free_tdcs:
-	for (i =3D 0; i < kvm_tdx->td.tdcs_nr_pages; i++) {
-		if (tdcs_pages[i])
-			__free_page(tdcs_pages[i]);
-	}
+	for (i =3D 0; i < kvm_tdx->td.tdcs_nr_pages; i++)
+		tdx_free_control_page(tdcs_pages[i]);
 	kfree(tdcs_pages);
 	kvm_tdx->td.tdcs_pages =3D NULL;
=20
 free_tdr:
-	if (tdr_page)
-		__free_page(tdr_page);
+	tdx_free_control_page(tdr_page);
 	kvm_tdx->td.tdr_page =3D NULL;
=20
 free_hkid:
@@ -2948,7 +2943,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 =
vcpu_rcx)
 	int ret, i;
 	u64 err;
=20
-	page =3D alloc_page(GFP_KERNEL_ACCOUNT);
+	page =3D tdx_alloc_control_page();
 	if (!page)
 		return -ENOMEM;
 	tdx->vp.tdvpr_page =3D page;
@@ -2968,7 +2963,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 =
vcpu_rcx)
 	}
=20
 	for (i =3D 0; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-		page =3D alloc_page(GFP_KERNEL_ACCOUNT);
+		page =3D tdx_alloc_control_page();
 		if (!page) {
 			ret =3D -ENOMEM;
 			goto free_tdcx;
@@ -2990,7 +2985,7 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 =
vcpu_rcx)
 			 * method, but the rest are freed here.
 			 */
 			for (; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-				__free_page(tdx->vp.tdcx_pages[i]);
+				tdx_free_control_page(tdx->vp.tdcx_pages[i]);
 				tdx->vp.tdcx_pages[i] =3D NULL;
 			}
 			return -EIO;
@@ -3018,16 +3013,14 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u6=
4 vcpu_rcx)
=20
 free_tdcx:
 	for (i =3D 0; i < kvm_tdx->td.tdcx_nr_pages; i++) {
-		if (tdx->vp.tdcx_pages[i])
-			__free_page(tdx->vp.tdcx_pages[i]);
+		tdx_free_control_page(tdx->vp.tdcx_pages[i]);
 		tdx->vp.tdcx_pages[i] =3D NULL;
 	}
 	kfree(tdx->vp.tdcx_pages);
 	tdx->vp.tdcx_pages =3D NULL;
=20
 free_tdvpr:
-	if (tdx->vp.tdvpr_page)
-		__free_page(tdx->vp.tdvpr_page);
+	tdx_free_control_page(tdx->vp.tdvpr_page);
 	tdx->vp.tdvpr_page =3D NULL;
 	tdx->vp.tdvpr_pa =3D 0;
=20
