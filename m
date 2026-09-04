Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833743B9D9A;
	Fri,  4 Sep 2026 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559904; cv=none; b=BA31rNaLbvjN8nqlFHJAQu55rnFjMPU+M1k7NDiVumM8uDTKhv3AWtbC5VIOICEGGmbnwm/LS2rFt+EbTm3V10/Iw5Q8aqcVY2pR4YgvuARdjPualyU03JNWdIUetsZX1CYVFA2N08WwgwSxK32Ve0+a6wRJuAUvv6b8KmK11OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559904; c=relaxed/simple;
	bh=je18r1oaf7q7BAQ2ZBvtt0Tq5Zt1/0Rgaqbu1CtRDn8=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=gLBgkd1UCWDEc04iGTfdPSg2zjTIDCAu9+DJI6IywiXENu9skju5gdUacNnxfH9zjWXDosWRHtdme7h5WJTP5G4ogoVf5ZKnEiRG+mZsGjv69Lz2yGyq1vEskrV8hKtamKZEBWncYUnaZb/cW5Z+dwF0bNFA85H6nolphBVnS8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0wP2rzSk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MQP+hagC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0wP2rzSk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MQP+hagC"
Date: Fri, 04 Sep 2026 22:11:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788559900;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cS2+qmGzxD3jTBexW602DePiLxBuTDTC0xy6LFxwKXg=;
	b=0wP2rzSkLrK2FmPMqSzqiLXPAfyFrSbJnQ4CdfuGG5FrHU+XD6e2g/KNyzaKkI4YbAtUmd
	dSOMJABXQBjlthep08o16W7hv+Ej6CfM9ojseIFV0FfdtgV1sb8dgki/JSbFIH71MVqYyL
	DHnN8tZkbo+UP5BcD8uBaQS50zMSbkt9KQlAlJ84NepCl/RKq7bZ6ThVHZ+BW/IMhCkdre
	+OxroRSo5q55ANuRTnlrPy7Sq5R0DXs3uoOi9Xj27O8P3thz5llOpAA9cwxdV38VSiCnLJ
	4rEqoL37N50njlLPqEFWI77Fde8iPqvpHsiIORvO8MhhNFFu2NpFaSDPkVgePg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788559900;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cS2+qmGzxD3jTBexW602DePiLxBuTDTC0xy6LFxwKXg=;
	b=MQP+hagCz/QrxZkxAVnzbDOIQAB9hky3jgw0QcB+tORmbhnbK1eEd2ptjfWYYIPhpMUM8z
	Xk1FFDNFjuiL5FBg==
From: "tip-bot2 for Rick Edgecombe" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/tdx] x86/virt/tdx: Enable Dynamic PAMT
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Hongyu Ning <hongyu.ning@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904215841.303070-10-rick.p.edgecombe@intel.com>
References: <20260904215841.303070-10-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178855989893.3717435.8305554489540579262.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     1e3d7913532723b3cb73cc70d04e7bf7f6430fed
Gitweb:        https://git.kernel.org/tip/1e3d7913532723b3cb73cc70d04e7bf7f64=
30fed
Author:        Rick Edgecombe <rick.p.edgecombe@intel.com>
AuthorDate:    Fri, 04 Sep 2026 14:58:39 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 04 Sep 2026 15:06:02 -07:00

x86/virt/tdx: Enable Dynamic PAMT

The Physical Address Metadata Table (PAMT) holds TDX metadata for
physical memory and must be allocated by the kernel during TDX module
initialization. Dynamic PAMT (DPAMT) is a TDX module feature that can
reduce this memory use by allocating part of the PAMT dynamically.

DPAMT's memory savings are significant enough to make it a good default
configuration. So turn it on whenever the TDX module reports support.

There is a TDX module bug where on unusual BIOS keyid configurations, the
TDX module reports DPAMT as supported even when it can't handle it. Expect
this not to be an issue in practice and don't attempt to work around it on
the kernel side.

The feature increases the kernel size by 2KB (when TDX is configured in the
build).

Based on a patch originally by Kiryl Shutsemau.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Vishal Annapurve <vannapurve@google.com>
Acked-by: Sohil Mehta <sohil.mehta@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Link: https://patch.msgid.link/20260904215841.303070-10-rick.p.edgecombe@inte=
l.com
---
 arch/x86/include/asm/tdx.h  |  1 +
 arch/x86/virt/vmx/tdx/tdx.c | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 8c7839d..e186dfe 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -36,6 +36,7 @@
 /* Bit definitions of TDX_FEATURES0 metadata field */
 #define TDX_FEATURES0_TD_PRESERVING	BIT_ULL(1)
 #define TDX_FEATURES0_NO_RBP_MOD	BIT_ULL(18)
+#define TDX_FEATURES0_DYNAMIC_PAMT	BIT_ULL(36)
=20
 #ifndef __ASSEMBLER__
=20
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index ff00ee6..063574e 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1031,6 +1031,8 @@ static __init int construct_tdmrs(struct list_head *tmb=
_list,
 	return ret;
 }
=20
+#define TDX_SYS_CONFIG_DYNAMIC_PAMT	BIT(16)
+
 static __init int config_tdx_module(struct tdmr_info_list *tdmr_list,
 				    u64 global_keyid)
 {
@@ -1059,6 +1061,12 @@ static __init int config_tdx_module(struct tdmr_info_l=
ist *tdmr_list,
 	args.rcx =3D __pa(tdmr_pa_array);
 	args.rdx =3D tdmr_list->nr_consumed_tdmrs;
 	args.r8 =3D global_keyid;
+
+	if (tdx_supports_dynamic_pamt(&tdx_sysinfo)) {
+		pr_info("Enable Dynamic PAMT\n");
+		args.r8 |=3D TDX_SYS_CONFIG_DYNAMIC_PAMT;
+	}
+
 	ret =3D seamcall_prerr(TDH_SYS_CONFIG, &args);
=20
 	/* Free the array as it is not required anymore. */
@@ -2046,8 +2054,7 @@ EXPORT_SYMBOL_FOR_KVM(tdh_phymem_page_wbinvd_hkid);
=20
 bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo)
 {
-	/* To be enabled when kernel is ready. */
-	return false;
+	return sysinfo->features.tdx_features0 & TDX_FEATURES0_DYNAMIC_PAMT;
 }
 EXPORT_SYMBOL_FOR_KVM(tdx_supports_dynamic_pamt);
=20
