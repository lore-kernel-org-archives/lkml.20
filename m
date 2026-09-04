Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84E3DC4A4;
	Fri,  4 Sep 2026 22:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559915; cv=none; b=AkkD9bMEFVbHQ7jvmKADms+1h1ZOY5w3cM04ZWpTlUuD30p5PFGabcJEh0AtuRYxDpRaohRhh24mLsWJBdJKhrm23gZyX22y9rCSKcu5Y5Bl57Z1IK7YCjvW8Xupx7CTUxB3LHWSo7yK8858ApFY+0CCFf7jSWCQFBzRW/PE40k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559915; c=relaxed/simple;
	bh=GPLVAGIvhMWzQoAlRiY4aYPdoYTU9biAAMlCLbOkeVk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ZiyTRBzQg63dGnGx7KS/RBElLJlTxbMX4QpOZd3aRSHPGsjYn21zAvPIJCa8DdwDcxS4nyISbhX6DgU7mEsd3xIc270DVq1UxrKwwIjEBLfrZ+lp+Ftd1jlF8jfELwRjgw4ceoYZQV8izWr+qd4988Se+9KuQ8690m0rVAVLeGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3K3zFhu8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0b6HL3IT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3K3zFhu8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0b6HL3IT"
Date: Fri, 04 Sep 2026 22:11:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788559911;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXSu23VTooUwWr9uidNJttBr+4o+BEajcMQfda5y/AI=;
	b=3K3zFhu8QpSd/v7gYjewUU7w+wZ/VNP4S6k8r5d7BBMomneAU7mGGlxxCkKe2fVkm8g0/h
	Q7yGR7gPc4nVutU5QkozUE5Q+MfvoZkNqCLs8IvsUJswjEZNODclvQ0MTbAAFpX4U6EUDj
	PBGMPo1/uXYwMQG/EiMRwhsl8Za7pJ8UG3ctm4YA8VlZ0kIHboG02LuMS1zEFiJ+PW6vPw
	jdZ3SaWA/AfxX3Wi3OmrBiCs4JQhRiUwTpol1ePVljG9QrbSi8xLMIE20SZaaFYp5x2kHg
	V+/0Z2Aow71ldnZRA6Gr9Nrt9fzAxD8kU60N7a3Ob2mSggEa9tukHTCJnB30cA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788559911;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXSu23VTooUwWr9uidNJttBr+4o+BEajcMQfda5y/AI=;
	b=0b6HL3ITymZL74BYOIraCsm/jK6QLKtKu9FFkwlQqZgEkqjovmfOQ5bFXe1T47o82z2jk9
	CWuSnfvBzhPHEgCA==
From: "tip-bot2 for Rick Edgecombe" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/tdx] x86/virt/tdx: Simplify PAMT layout calculation
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Binbin Wu <binbin.wu@linux.intel.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Chao Gao <chao.gao@intel.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Hongyu Ning <hongyu.ning@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904215841.303070-2-rick.p.edgecombe@intel.com>
References: <20260904215841.303070-2-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178855991014.3717435.3954795212564161553.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     01a43c55ae5f00601ef7877dd86b873770b9efe9
Gitweb:        https://git.kernel.org/tip/01a43c55ae5f00601ef7877dd86b873770b=
9efe9
Author:        Rick Edgecombe <rick.p.edgecombe@intel.com>
AuthorDate:    Fri, 04 Sep 2026 14:58:31 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 04 Sep 2026 15:06:01 -07:00

x86/virt/tdx: Simplify PAMT layout calculation

For each memory region that the TDX module might use (called TDMR), three
separate traditional PAMT allocations are needed. There is one for each
supported page size (1GB, 2MB, 4KB). These store information on each page
in the TDMR. In Linux, they are allocated out of one physically contiguous
block, in order to more efficiently use some internal TDX module
bookkeeping resources. So some simple math is needed to break the single
large allocation into three smaller allocations for each page size.

There are some commonalities in the math needed to calculate the base and
size for each smaller allocation, and so an effort was made to share logic
across the three. Unfortunately doing this turned out unnaturally tortured,
with a loop iterating over the three page sizes, only to call into a
function with case statements for each page size. In the future Dynamic
PAMT will add more logic that is special to the 4KB page size, making the
benefit of the math sharing even more questionable.

Three is not a very high number, so get rid of the loop and just duplicate
the small calculation three times. In doing so, setup for future Dynamic
PAMT changes.

Since the loop that iterates over it is gone, further simplify the code by
dropping the array of intermediate size and base storage. Just store the
values to their final locations.

AI was used under supervision to collect/apply feedback, review code and
workshop logs.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Vishal Annapurve <vannapurve@google.com>
Acked-by: Sohil Mehta <sohil.mehta@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Link: https://patch.msgid.link/20260904215841.303070-2-rick.p.edgecombe@intel=
.com
---
 arch/x86/virt/vmx/tdx/tdx.c | 88 +++++++++++-------------------------
 1 file changed, 27 insertions(+), 61 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 1b9ff74..51b191b 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -514,31 +514,21 @@ static __init int fill_out_tdmrs(struct list_head *tmb_=
list,
  * Calculate PAMT size given a TDMR and a page size.  The returned
  * PAMT size is always aligned up to 4K page boundary.
  */
-static __init unsigned long tdmr_get_pamt_sz(struct tdmr_info *tdmr, int pgs=
z,
-					     u16 pamt_entry_size)
+static __init unsigned long tdmr_get_pamt_sz(struct tdmr_info *tdmr, int pgs=
z)
 {
 	unsigned long pamt_sz, nr_pamt_entries;
+	const int tdx_pg_size_shift[TDX_PS_NR] =3D { PAGE_SHIFT, PMD_SHIFT, PUD_SHI=
FT };
+	const u16 pamt_entry_size[TDX_PS_NR] =3D {
+		tdx_sysinfo.tdmr.pamt_4k_entry_size,
+		tdx_sysinfo.tdmr.pamt_2m_entry_size,
+		tdx_sysinfo.tdmr.pamt_1g_entry_size,
+	};
=20
-	switch (pgsz) {
-	case TDX_PS_4K:
-		nr_pamt_entries =3D tdmr->size >> PAGE_SHIFT;
-		break;
-	case TDX_PS_2M:
-		nr_pamt_entries =3D tdmr->size >> PMD_SHIFT;
-		break;
-	case TDX_PS_1G:
-		nr_pamt_entries =3D tdmr->size >> PUD_SHIFT;
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		return 0;
-	}
+	nr_pamt_entries =3D tdmr->size >> tdx_pg_size_shift[pgsz];
+	pamt_sz =3D nr_pamt_entries * pamt_entry_size[pgsz];
=20
-	pamt_sz =3D nr_pamt_entries * pamt_entry_size;
 	/* TDX requires PAMT size must be 4K aligned */
-	pamt_sz =3D ALIGN(pamt_sz, PAGE_SIZE);
-
-	return pamt_sz;
+	return PAGE_ALIGN(pamt_sz);
 }
=20
 /*
@@ -576,15 +566,11 @@ static __init int tdmr_get_nid(struct tdmr_info *tdmr, =
struct list_head *tmb_lis
  * within @tdmr, and set up PAMTs for @tdmr.
  */
 static __init int tdmr_set_up_pamt(struct tdmr_info *tdmr,
-				   struct list_head *tmb_list,
-				   u16 pamt_entry_size[])
+				   struct list_head *tmb_list)
 {
-	unsigned long pamt_base[TDX_PS_NR];
-	unsigned long pamt_size[TDX_PS_NR];
-	unsigned long tdmr_pamt_base;
 	unsigned long tdmr_pamt_size;
 	struct page *pamt;
-	int pgsz, nid;
+	int nid;
=20
 	nid =3D tdmr_get_nid(tdmr, tmb_list);
=20
@@ -592,12 +578,10 @@ static __init int tdmr_set_up_pamt(struct tdmr_info *td=
mr,
 	 * Calculate the PAMT size for each TDX supported page size
 	 * and the total PAMT size.
 	 */
-	tdmr_pamt_size =3D 0;
-	for (pgsz =3D TDX_PS_4K; pgsz < TDX_PS_NR; pgsz++) {
-		pamt_size[pgsz] =3D tdmr_get_pamt_sz(tdmr, pgsz,
-					pamt_entry_size[pgsz]);
-		tdmr_pamt_size +=3D pamt_size[pgsz];
-	}
+	tdmr->pamt_4k_size =3D tdmr_get_pamt_sz(tdmr, TDX_PS_4K);
+	tdmr->pamt_2m_size =3D tdmr_get_pamt_sz(tdmr, TDX_PS_2M);
+	tdmr->pamt_1g_size =3D tdmr_get_pamt_sz(tdmr, TDX_PS_1G);
+	tdmr_pamt_size =3D tdmr->pamt_4k_size + tdmr->pamt_2m_size + tdmr->pamt_1g_=
size;
=20
 	/*
 	 * Allocate one chunk of physically contiguous memory for all
@@ -606,25 +590,17 @@ static __init int tdmr_set_up_pamt(struct tdmr_info *td=
mr,
 	 */
 	pamt =3D alloc_contig_pages(tdmr_pamt_size >> PAGE_SHIFT, GFP_KERNEL,
 			nid, &node_online_map);
-	if (!pamt)
-		return -ENOMEM;
=20
 	/*
-	 * Break the contiguous allocation back up into the
-	 * individual PAMTs for each page size.
+	 * tdmr->pamt_4k_base is still zero so the error
+	 * path of the caller will skip freeing the PAMT.
 	 */
-	tdmr_pamt_base =3D page_to_pfn(pamt) << PAGE_SHIFT;
-	for (pgsz =3D TDX_PS_4K; pgsz < TDX_PS_NR; pgsz++) {
-		pamt_base[pgsz] =3D tdmr_pamt_base;
-		tdmr_pamt_base +=3D pamt_size[pgsz];
-	}
+	if (!pamt)
+		return -ENOMEM;
=20
-	tdmr->pamt_4k_base =3D pamt_base[TDX_PS_4K];
-	tdmr->pamt_4k_size =3D pamt_size[TDX_PS_4K];
-	tdmr->pamt_2m_base =3D pamt_base[TDX_PS_2M];
-	tdmr->pamt_2m_size =3D pamt_size[TDX_PS_2M];
-	tdmr->pamt_1g_base =3D pamt_base[TDX_PS_1G];
-	tdmr->pamt_1g_size =3D pamt_size[TDX_PS_1G];
+	tdmr->pamt_4k_base =3D page_to_phys(pamt);
+	tdmr->pamt_2m_base =3D tdmr->pamt_4k_base + tdmr->pamt_4k_size;
+	tdmr->pamt_1g_base =3D tdmr->pamt_2m_base + tdmr->pamt_2m_size;
=20
 	return 0;
 }
@@ -655,10 +631,7 @@ static __init void tdmr_do_pamt_func(struct tdmr_info *t=
dmr,
 	tdmr_get_pamt(tdmr, &pamt_base, &pamt_size);
=20
 	/* Do nothing if PAMT hasn't been allocated for this TDMR */
-	if (!pamt_size)
-		return;
-
-	if (WARN_ON_ONCE(!pamt_base))
+	if (!pamt_base)
 		return;
=20
 	pamt_func(pamt_base, pamt_size);
@@ -684,14 +657,12 @@ static __init void tdmrs_free_pamt_all(struct tdmr_info=
_list *tdmr_list)
=20
 /* Allocate and set up PAMTs for all TDMRs */
 static __init int tdmrs_set_up_pamt_all(struct tdmr_info_list *tdmr_list,
-					struct list_head *tmb_list,
-					u16 pamt_entry_size[])
+					struct list_head *tmb_list)
 {
 	int i, ret =3D 0;
=20
 	for (i =3D 0; i < tdmr_list->nr_consumed_tdmrs; i++) {
-		ret =3D tdmr_set_up_pamt(tdmr_entry(tdmr_list, i), tmb_list,
-				pamt_entry_size);
+		ret =3D tdmr_set_up_pamt(tdmr_entry(tdmr_list, i), tmb_list);
 		if (ret)
 			goto err;
 	}
@@ -968,18 +939,13 @@ static __init int construct_tdmrs(struct list_head *tmb=
_list,
 				  struct tdmr_info_list *tdmr_list,
 				  struct tdx_sys_info_tdmr *sysinfo_tdmr)
 {
-	u16 pamt_entry_size[TDX_PS_NR] =3D {
-		sysinfo_tdmr->pamt_4k_entry_size,
-		sysinfo_tdmr->pamt_2m_entry_size,
-		sysinfo_tdmr->pamt_1g_entry_size,
-	};
 	int ret;
=20
 	ret =3D fill_out_tdmrs(tmb_list, tdmr_list);
 	if (ret)
 		return ret;
=20
-	ret =3D tdmrs_set_up_pamt_all(tdmr_list, tmb_list, pamt_entry_size);
+	ret =3D tdmrs_set_up_pamt_all(tdmr_list, tmb_list);
 	if (ret)
 		return ret;
=20
