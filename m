Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4AD50AC28;
	Fri,  4 Sep 2026 22:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559914; cv=none; b=D1vib2B/YKCjXdw420WgicJVTu+5Hksxm05mbdP0kej7tuu0ngdWJ+OtKZbLvIPp6oG39Gr5Py7uXNA5gsa72DG6CyQPfFIXnes3h90t/12nG77O/9kiwfh3DktDHjs9c5UGu0bGkGKqYA/vzTBSwG5rUKoybcszn1qcyixjwBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559914; c=relaxed/simple;
	bh=hUBdpsQkMD3p+XpmEU+7oXPnAQcb+JCOFunM8N/KY6s=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=uSBv/F0wUQC+l1hadxd91NI+p+yBVHYAWlcdMheqkdxIuYLK8kIeQQ1PUGTtMkqrpNkYWm4oO4ISAjwxD4L1whqMjxso8HBvfqS1eJrTagsxgE+VhHZrScz23RVgTVEkfRGftcBhNV1OF2QFhuDK5yT4CJwVtFWEA2XXkTQQF+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AsSlHyFy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=p96PqYok; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AsSlHyFy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p96PqYok"
Date: Fri, 04 Sep 2026 22:11:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788559910;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9td9MJibm/zekcp4s0HUSVy+ENvXv8aFUg0GArE0uKQ=;
	b=AsSlHyFynzy1r9xdZpn9M9k/IBa9y78qlmhq7QUp8ploQfI10gWGwgaWQD4u60Gew7boGK
	3xhTL2DcsEs/Jmms0qq1fRQxbUgEnm4MZt/B2mCB1SBvvoZibswgWTUCiXPA1TK54RecQP
	qFot25MeunIM04QCWh8lAxIG34Hd43pvawHWBhhdb7YFt6EuRzYYNXw9bkjmXLfZiMMXv5
	Q7QIfKiZBEr9T5YUvlgb2mFYKUPy7V9Zw9+fOBYizVpjEoUWJVkwrSk1lP9Cs4gnFJawUi
	H2sSXoHi+0TcwjEjYP5mtX/mry8Jof3pyGtX+/rPe2e0SSLRmM+i5CTNe811hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788559910;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9td9MJibm/zekcp4s0HUSVy+ENvXv8aFUg0GArE0uKQ=;
	b=p96PqYokZwxYKIqXbR5wjfjMNUf5xAFaaK7nbV+/nOfRVnkkw5Upx8oZgWSiJxXU3DuSgV
	gmBm1YNigu/wbCDA==
From: "tip-bot2 for Rick Edgecombe" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/tdx] x86/virt/tdx: Allocate page bitmap for Dynamic PAMT
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Binbin Wu <binbin.wu@linux.intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Hongyu Ning <hongyu.ning@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904215841.303070-3-rick.p.edgecombe@intel.com>
References: <20260904215841.303070-3-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178855990877.3717435.12921436289836247236.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     eadde434aa9da1f43804c7097ba360dda8ccd9ef
Gitweb:        https://git.kernel.org/tip/eadde434aa9da1f43804c7097ba360dda8c=
cd9ef
Author:        Rick Edgecombe <rick.p.edgecombe@intel.com>
AuthorDate:    Fri, 04 Sep 2026 14:58:32 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 04 Sep 2026 15:06:02 -07:00

x86/virt/tdx: Allocate page bitmap for Dynamic PAMT

The TDX Physical Address Metadata Table (PAMT) holds data about the
physical memory used by TDX, and must be allocated by the kernel during
TDX module initialization.

The exact size of the required PAMT memory is determined by the TDX module
and may vary between TDX module versions. Currently it is approximately
0.4% of the system memory. This is a significant commitment, especially if
it is not known upfront whether the machine will run any TDX guests.

Each memory region that the TDX module might use needs three separate PAMT
allocations. One for each supported page size (1GB, 2MB, 4KB). The
TDX module supports a new feature designed to reduce PAMT overhead called
Dynamic PAMT (DPAMT). Under DPAMT the 4KB level is allocated dynamically
during runtime, while the 1GB and 2MB levels remain allocated on TDX
module initialization.

However, in the details, DPAMT still needs some smaller per 4KB page
scoped data (currently it is 1 bit per page). The TDX module exposes the
number of bits as a separate piece of metadata than the 4KB static
allocation for normal PAMT. Although the size is enumerated differently,
it is handed to the TDX module in the same way the 4KB page size PAMT
allocation is for normal PAMT.

Begin to implement DPAMT in the kernel by reading the bits-per-page needed
for DPAMT. Calculate the size needed for the bitmap, and use it instead of
the 4KB size determined for normal PAMT, in the case of DPAMT.

The existing metadata reading code was generated by a script, but the
current plan is to stop generating this code, as the script has continued
to need adjustments. So add manually written code and adjust the comment
about it being autogenerated to be more generic. Start to adopt a more
normal kernel code style without the ternary statements and if
conditionals assignments that the auto generated code has.

AI was used under supervision to collect/apply feedback, review code and
workshop logs.

Based on a patch originally by Kiryl Shutsemau.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Vishal Annapurve <vannapurve@google.com>
Acked-by: Sohil Mehta <sohil.mehta@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Link: https://patch.msgid.link/20260904215841.303070-3-rick.p.edgecombe@intel=
.com
---
 arch/x86/include/asm/tdx.h                  |  2 +-
 arch/x86/include/asm/tdx_global_metadata.h  |  9 ++++--
 arch/x86/virt/vmx/tdx/tdx.c                 | 29 ++++++++++++++++++--
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c | 23 +++++++++++++++-
 4 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 89e97d5..d414064 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -118,6 +118,8 @@ static inline bool tdx_supports_runtime_update(const stru=
ct tdx_sys_info *sysinf
 	return sysinfo->features.tdx_features0 & TDX_FEATURES0_TD_PRESERVING;
 }
=20
+bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo);
+
 int tdx_guest_keyid_alloc(void);
 u32 tdx_get_nr_guest_keyids(void);
 void tdx_guest_keyid_free(unsigned int keyid);
diff --git a/arch/x86/include/asm/tdx_global_metadata.h b/arch/x86/include/as=
m/tdx_global_metadata.h
index 41150d5..8a3cc1a 100644
--- a/arch/x86/include/asm/tdx_global_metadata.h
+++ b/arch/x86/include/asm/tdx_global_metadata.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* Automatically generated TDX global metadata structures. */
-#ifndef _X86_VIRT_TDX_AUTO_GENERATED_TDX_GLOBAL_METADATA_H
-#define _X86_VIRT_TDX_AUTO_GENERATED_TDX_GLOBAL_METADATA_H
+/* TDX global metadata structures. */
+#ifndef _X86_VIRT_TDX_TDX_GLOBAL_METADATA_H
+#define _X86_VIRT_TDX_TDX_GLOBAL_METADATA_H
=20
 #include <linux/types.h>
=20
@@ -21,6 +21,9 @@ struct tdx_sys_info_tdmr {
 	u16 pamt_4k_entry_size;
 	u16 pamt_2m_entry_size;
 	u16 pamt_1g_entry_size;
+
+	/* Optional metadata, if DPAMT is supported */
+	u8  pamt_page_bitmap_entry_bits;
 };
=20
 struct tdx_sys_info_td_ctrl {
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 51b191b..54074dd 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -510,6 +510,18 @@ static __init int fill_out_tdmrs(struct list_head *tmb_l=
ist,
 	return 0;
 }
=20
+static __init unsigned long tdmr_get_pamt_bitmap_sz(struct tdmr_info *tdmr)
+{
+	unsigned long pamt_sz, nr_pamt_entries;
+	int bits_per_entry;
+
+	bits_per_entry =3D tdx_sysinfo.tdmr.pamt_page_bitmap_entry_bits;
+	nr_pamt_entries =3D tdmr->size >> PAGE_SHIFT;
+	pamt_sz =3D DIV_ROUND_UP(nr_pamt_entries * bits_per_entry, BITS_PER_BYTE);
+
+	return PAGE_ALIGN(pamt_sz);
+}
+
 /*
  * Calculate PAMT size given a TDMR and a page size.  The returned
  * PAMT size is always aligned up to 4K page boundary.
@@ -578,9 +590,16 @@ static __init int tdmr_set_up_pamt(struct tdmr_info *tdm=
r,
 	 * Calculate the PAMT size for each TDX supported page size
 	 * and the total PAMT size.
 	 */
-	tdmr->pamt_4k_size =3D tdmr_get_pamt_sz(tdmr, TDX_PS_4K);
-	tdmr->pamt_2m_size =3D tdmr_get_pamt_sz(tdmr, TDX_PS_2M);
 	tdmr->pamt_1g_size =3D tdmr_get_pamt_sz(tdmr, TDX_PS_1G);
+	tdmr->pamt_2m_size =3D tdmr_get_pamt_sz(tdmr, TDX_PS_2M);
+
+	if (tdx_supports_dynamic_pamt(&tdx_sysinfo)) {
+		/* With DPAMT, PAMT_4K is replaced with a bitmap */
+		tdmr->pamt_4k_size =3D tdmr_get_pamt_bitmap_sz(tdmr);
+	} else {
+		tdmr->pamt_4k_size =3D tdmr_get_pamt_sz(tdmr, TDX_PS_4K);
+	}
+
 	tdmr_pamt_size =3D tdmr->pamt_4k_size + tdmr->pamt_2m_size + tdmr->pamt_1g_=
size;
=20
 	/*
@@ -1971,6 +1990,12 @@ u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, kvm_pfn_t pf=
n)
 }
 EXPORT_SYMBOL_FOR_KVM(tdh_phymem_page_wbinvd_hkid);
=20
+bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo)
+{
+	/* To be enabled when kernel is ready. */
+	return false;
+}
+
 void tdx_sys_disable(void)
 {
 	struct tdx_module_args args =3D {};
diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/=
tdx/tdx_global_metadata.c
index e49c300..98ebf17 100644
--- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
+++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Automatically generated functions to read TDX global metadata.
+ * Functions to read TDX global metadata.
  *
  * This file doesn't compile on its own as it lacks of inclusion
  * of SEAMCALL wrapper primitive which reads global metadata.
@@ -33,6 +33,18 @@ static __init int get_tdx_sys_info_features(struct tdx_sys=
_info_features *sysinf
 	return ret;
 }
=20
+static __init int get_tdx_sys_info_tdmr_dpamt(struct tdx_sys_info_tdmr *sysi=
nfo_tdmr)
+{
+	int ret;
+	u64 val;
+
+	ret =3D read_sys_metadata_field(0x9100000000000013, &val);
+	if (!ret)
+		sysinfo_tdmr->pamt_page_bitmap_entry_bits =3D val;
+
+	return ret;
+}
+
 static __init int get_tdx_sys_info_tdmr(struct tdx_sys_info_tdmr *sysinfo_td=
mr)
 {
 	int ret =3D 0;
@@ -129,5 +141,14 @@ static __init int get_tdx_sys_info(struct tdx_sys_info *=
sysinfo)
 	ret =3D ret ?: get_tdx_sys_info_td_ctrl(&sysinfo->td_ctrl);
 	ret =3D ret ?: get_tdx_sys_info_td_conf(&sysinfo->td_conf);
=20
+	/*
+	 * The kernel supports using TDX without DPAMT, so
+	 * avoid reporting failure if it's not supported. Don't
+	 * try to support buggy TDX modules that advertise
+	 * DPAMT but don't expose the metadata.
+	 */
+	if (!ret && tdx_supports_dynamic_pamt(sysinfo))
+		ret =3D get_tdx_sys_info_tdmr_dpamt(&sysinfo->tdmr);
+
 	return ret;
 }
