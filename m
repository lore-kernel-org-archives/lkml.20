Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740997;
	b=uTT2R61PKpUl4pB+2oAxuTCzttxxwBHYzs2S5SPDmt0PVdTJsvIz/1bUcOm2Q3q0ZbZF
	 GYH2QFDYkEH7JUslv/Am+B07UGFX8j3k+kFF7dO/KP0gC82tOPN0oqu4KXZ0qiUlE4MKi
	 nu3Mu/MCMySzWE+Deetb2DEvpgFqk8/QPMpjwctLLyBdmMyaoLxjk9pnoxapqJ6Cctyf2
	 szMaPJD7DoqTxLDlbqWkDHgAvVMCRA9ak2aQ0p6VXMogBRCa5YToT1HG7YQpIqof8pCUo
	 D8/X6ga2j48wpjnjC2mtsr8Nclm7UyGW9gZk3wpvV1vVpxcQt3zp+SIayHo1PXZIKIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740997;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZHrbkvUMdfe23G9jULDI9t9fp+7KH5+pQxGowwvaQmE=;
	b=AZYTkjzxmnmFCuI9YLJEnmuFMzLQsKjl2zRQ6zLRlCW9RDy9EtG+CdORPXFdjTUd/iHF
	 AIcEmjToNp1Xpu+XFRlE6i3ZVYuIEmHQ87JFeAw4UOts4E4dOrU8ARFoVACuMurPA/U+L
	 hYxc6rz4SV1pgO7N02gvz1I4s2sevMdQE/PRQUAIMDawPCze+eTWvSfN+LfC35BaRkz12
	 tvLWH4V12wppON45EKFjNmcA+sidSyQ5G49oDSj+AwAFxLEF3F+0nNqLtonTBc1UnnLk5
	 2GOuwqo11bDBkZw+AjLxjB6ARUiuasha3tNvDEyO7/kbzZyQX4CpMdzYEsftG2s7TjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WsqMrscO;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B782606D81D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B782606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WsqMrscO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793740998; x=1825276998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ivZ1WNWkxMY8v8vjeIyrJKO/xi7/ef5r8YNc8UE03Kc=;
  b=WsqMrscOOOu7NUMVQstPrRK/rxbcXLfY/wwxbBwmLagKgjPFDdiK4YgH
   6houbjVX+mHGBNrz0IvX43dUoHRvywKGA6PIamfb4Y/Lmu2VA8hCSOdY5
   ecEneyPl0UO5GddHzljdBHdlHwD9lDPuacuw6M+ikj+AOnb3BSLOGS8pY
   bZBffV3QsfqjvM6OtvsAUL4mLzlZvCLwPA1eqAYvNpENmJsiXJ/h+itrJ
   +jqdb/HrKBRdPBOPFlG97bgRoynJi8SKdheAs7cj8IclASte92TipY45x
   MN+ICdXdXCdj9dflHJgJ9vc53DeRWrRRXfuOZc/BNIfA4JwuFBMVoXQoa
   A==;
X-CSE-ConnectionGUID: 2QBPJSslQzmiU3Ij6GMWhw==
X-CSE-MsgGUID: gPZAnGN7TfiaZ4eep2du0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2393535"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2393535"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:23:12 -0800
X-CSE-ConnectionGUID: WtsdN4TEQRSQw/qKWgbpJQ==
X-CSE-MsgGUID: vmsZq278R7idpFdMuzAFmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6624595"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.124])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:23:10 -0800
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [RFC PATCH v2 10/11] x86/resctrl: Enable asymmetric CAT from CPUID leaf 0x28
Date: Tue,  3 Nov 2026 13:22:53 -0800
Message-ID: <20261103212254.18314-11-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103212254.18314-1-tony.luck@intel.com>
References: <20261103212254.18314-1-tony.luck@intel.com>
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

Asymmetric CAT parameters are enumerated by CPUID leaf 0x28.
resctrl cannot represent per-domain shareable bits, so it cannot use this
enumeration when shareable bits are reported.

Enumerate the per-domain CBM lengths and enable asymmetric L2 CAT when the
feature is supported and has no shareable bits. Use the minimum domain CBM
length for the control's common view, and enable asymmetric CDP when available.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl.h            |  2 ++
 arch/x86/kernel/cpu/resctrl/core.c | 49 ++++++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 8ac799d1feff..efaddd7c5270 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -420,6 +420,7 @@ enum resctrl_ctrl_name {
  *		Specifically, "rdt_resource_final::name"_"resctrl_ctrl::name".
  *		For example, with resource name "MB" and control name "MAX" the
  *		schema entry will be "MB_MAX".
+ * @asymmetric:	This control may have different per-domain parameters.
  * @bitmap:	Bitmap control properties. Used by cache allocation.
  * @scalar:	Scalar control properties. Valid when @type == RESCTRL_CTRL_SCALAR.
  *		Used by memory bandwidth allocation.
@@ -436,6 +437,7 @@ struct resctrl_ctrl {
 	struct list_head	domains;
 	enum resctrl_ctrl_type	type;
 	enum resctrl_ctrl_name	name;
+	bool			asymmetric;
 	union {
 		struct resctrl_ctrl_bitmap	bitmap;
 		struct resctrl_ctrl_scalar	scalar;
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index aa0bb32d191e..93d1b153614f 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -348,6 +348,28 @@ static __init bool __rdt_get_mem_config_amd(struct rdt_resource *r)
 	return true;
 }
 
+static int rdt_get_cache_asym_cbm_len(enum resctrl_res_level rid)
+{
+	union cpuid_0x10_1_eax eax;
+	u32 ebx, ecx, edx;
+	int subleaf;
+
+	switch (rid) {
+	case RDT_RESOURCE_L3:
+		subleaf = 1;
+		break;
+	case RDT_RESOURCE_L2:
+		subleaf = 2;
+		break;
+	default:
+		pr_info("Unexpected resource %d\n", rid);
+		return 0;
+	}
+	cpuid_count(CPUID_LEAF_RDT_A_ASYM, subleaf, &eax.full, &ebx, &ecx, &edx);
+
+	return eax.split.cbm_len + 1;
+}
+
 static struct resctrl_ctrl *rdt_get_cache_alloc_cfg(int leaf, int idx, struct rdt_resource *r)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
@@ -625,8 +647,14 @@ static void domain_add_cpu_ctrl(int cpu, struct rdt_resource *r,
 	d->hdr.rid = r->rid;
 	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
 
-	if (ctrl->type == RESCTRL_CTRL_BITMAP)
-		d->cbm_len = ctrl->bitmap.cbm_len;
+	if (ctrl->type == RESCTRL_CTRL_BITMAP) {
+		if (ctrl->asymmetric) {
+			d->cbm_len = rdt_get_cache_asym_cbm_len(r->rid);
+			ctrl->bitmap.cbm_len = min(ctrl->bitmap.cbm_len, d->cbm_len);
+		} else {
+			d->cbm_len = ctrl->bitmap.cbm_len;
+		}
+	}
 
 	rdt_domain_reconfigure_cdp(r);
 
@@ -1091,6 +1119,23 @@ static __init bool get_rdt_alloc_resources(void)
 			r->alloc_capable = true;
 			ret = true;
 		}
+	} else if (rdt_cpu_has(X86_FEATURE_CAT_L2_ASYM)) {
+		/* CPUID 0x28.2 fields are same format as 0x10.1 */
+		r = &rdt_resources_all[RDT_RESOURCE_L2].r_resctrl;
+		ctrl = rdt_get_cache_alloc_cfg(CPUID_LEAF_RDT_A_ASYM, 2, r);
+		if (ctrl) {
+			if (ctrl->bitmap.shareable_bits) {
+				pr_info("No support for asymmetric L2 with shareable bits\n");
+				kfree(container_of(ctrl, struct resctrl_hw_ctrl, r_ctrl));
+			} else {
+				if (rdt_cpu_has(X86_FEATURE_CDP_L2_ASYM))
+					rdt_get_cdp_l2_config();
+				list_add(&ctrl->entry, &r->controls);
+				r->alloc_capable = true;
+				ctrl->asymmetric = true;
+				ret = true;
+			}
+		}
 	}
 
 	if (get_mem_config())
-- 
2.56.0

