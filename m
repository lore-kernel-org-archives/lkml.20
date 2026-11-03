Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740994;
	b=rfNxnfBt4BnbwD2vkuGhE1tO4RoxnR/745X1d4fwEQuH/N+aWk3Ze+vUvW8wBoV5vewB
	 UQpH0YJQRs0rJVxwIcU8F9yy49Gj57wnHP4ra+MHXpVIqV9ae4Vhd5z6AG0OzWUC4k7up
	 +uMlG93AJpv85m4JmwJOlP514+VbW+yrj6oYXq8CUUdvjW2lNbg/MQ05fDiMpItoOOslp
	 p/KygjfmeQ9CW+vF034aOAF2bzffdCJr+DjaHhI1z3O0aCdEbUmNr06y5BDEP+hn9/s0H
	 9aEH+nzkepHnQpZ/4V6LAXjF68TMNoMGn6FvF8reaqNT3Pq9z3SiXx2L+HDZL3k+2Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740994;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=COZEb1Kzpbz/mJMoriRiFCWaYWaw+fxN/ep1AJjrurE=;
	b=1acWe/0rw6bSEU/8YyRRexoWbS9sf+j9K7kPoEpkAtlo7CMILiRcyHtW5jn9aITjn2Yp
	 vNVWSM3+8bn8A+r7A8ZaiBnqZq/7HROrqVv4ZuDq/uckGjn/GOm45IocfPC1QkWaKlo3c
	 dy4NHzHIY2N66r7Ea/TwiMJzF4G8mlNzhC/PeRs1kSOCH1SdhUEOYh+ydI/dmkRLhyWSe
	 1/NurkgwWDCjqvVIAE98g9NQQ+QG2lR4kgBoOTzPMHzXsHeR+or4zD06u01qEUNGRDIG+
	 PamKLaP3qtrD7chU1WsXeiUlttPirrwDGXonLxnxjiDL5dwQcNaKox88SA6D5BHnVRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kIPq+E81;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7316606D806
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7316606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kIPq+E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793740994; x=1825276994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AL8JKJQ8fygYK1WDHRVfmzbFysl+AIFaivzP8SkqoaA=;
  b=kIPq+E81sOWlQW2MJUmtw2o1laRxkdFkgDAD/+Fp1bQkRqR161w23Myy
   UcZ9258nsKlu0SwTZSjfvj4dApMZP/fVWawpeUBnQJTZyNL2g0aVa5BTt
   ykjHcGi9JiqEUqdX7VFjgAWZNzYuMg3eAzp3dmtVlYV02Ny4GELaqOtok
   dWF9XGqcZzdhK3TIet82B3JY8KgvtpejMADybjFNTvVChRY0vpAmEc3pl
   zCsV1WMv2t0rJE7pdnxzX7ptEkvOTvH8Qk7kJPgtfqBtzzTLQHtq+GL9L
   dVQ6YMANclBSWd2mjIbUqnWfct8ldjugvKIX3xDyjaAIKXVO+fLjv9R7P
   Q==;
X-CSE-ConnectionGUID: mgBJIWIZRCSfozTEjLD4Lw==
X-CSE-MsgGUID: dcz3o4BWSn+obHpt204N7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2393495"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2393495"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:23:11 -0800
X-CSE-ConnectionGUID: lI2V0Qu5TQ+2lMNzBPGyUQ==
X-CSE-MsgGUID: iwnGaL9NSVGoydUfwvXdcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6624576"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.124])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:23:08 -0800
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
Subject: [RFC PATCH v2 05/11] x86/resctrl: Handle cache allocation setup failures
Date: Tue,  3 Nov 2026 13:22:48 -0800
Message-ID: <20261103212254.18314-6-tony.luck@intel.com>
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

rdt_get_cache_alloc_cfg() can fail when allocation of its control structure
fails or the CPU vendor is unsupported. The caller currently marks the
resource allocation-capable even when no control was created.

Return the control from rdt_get_cache_alloc_cfg() and mark the resource
allocation-capable only after successful setup. Free the allocated control
when the vendor is unsupported.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/core.c | 42 ++++++++++++++++++------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 0b1de97af17d..6df8e3c03289 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -348,7 +348,7 @@ static __init bool __rdt_get_mem_config_amd(struct rdt_resource *r)
 	return true;
 }
 
-static void rdt_get_cache_alloc_cfg(int idx, struct rdt_resource *r)
+static struct resctrl_ctrl *rdt_get_cache_alloc_cfg(int idx, struct rdt_resource *r)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
 	struct resctrl_hw_ctrl *hw_ctrl;
@@ -361,7 +361,7 @@ static void rdt_get_cache_alloc_cfg(int idx, struct rdt_resource *r)
 	hw_res->num_closid = edx.split.cos_max + 1;
 	hw_ctrl = kzalloc_obj(*hw_ctrl);
 	if (!hw_ctrl)
-		return;
+		return NULL;
 
 	hw_ctrl->r_ctrl.type = RESCTRL_CTRL_BITMAP;
 	hw_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_DEF;
@@ -380,15 +380,14 @@ static void rdt_get_cache_alloc_cfg(int idx, struct rdt_resource *r)
 		__set_bit(RESCTRL_BITMAP_FLAG_SPARSE, hw_ctrl->r_ctrl.bitmap.flags);
 		hw_ctrl->r_ctrl.bitmap.min_cbm_bits = 0;
 	} else {
-		return;
+		kfree(hw_ctrl);
+		return NULL;
 	}
 
 	hw_ctrl->msr_base = idx == 1 ? MSR_IA32_L3_CBM_BASE: MSR_IA32_L2_CBM_BASE;
 	hw_ctrl->msr_update = cat_wrmsr;
 
-	list_add(&hw_ctrl->r_ctrl.entry, &r->controls);
-
-	r->alloc_capable = true;
+	return &hw_ctrl->r_ctrl;
 }
 
 static void rdt_get_cdp_config(int level)
@@ -1054,6 +1053,7 @@ static __init bool get_slow_mem_config(void)
 
 static __init bool get_rdt_alloc_resources(void)
 {
+	struct resctrl_ctrl *ctrl;
 	struct rdt_resource *r;
 	bool ret = false;
 
@@ -1065,20 +1065,28 @@ static __init bool get_rdt_alloc_resources(void)
 
 	if (rdt_cpu_has(X86_FEATURE_CAT_L3)) {
 		r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
-		rdt_get_cache_alloc_cfg(1, r);
-		if (rdt_cpu_has(X86_FEATURE_CDP_L3))
-			rdt_get_cdp_l3_config();
-		if (rdt_cpu_has(X86_FEATURE_SDCIAE))
-			rdt_set_io_alloc_capable(r);
-		ret = true;
+		ctrl = rdt_get_cache_alloc_cfg(1, r);
+		if (ctrl) {
+			if (rdt_cpu_has(X86_FEATURE_CDP_L3))
+				rdt_get_cdp_l3_config();
+			if (rdt_cpu_has(X86_FEATURE_SDCIAE))
+				rdt_set_io_alloc_capable(r);
+			list_add(&ctrl->entry, &r->controls);
+			r->alloc_capable = true;
+			ret = true;
+		}
 	}
 	if (rdt_cpu_has(X86_FEATURE_CAT_L2)) {
-		/* CPUID 0x10.2 fields are same format at 0x10.1 */
+		/* CPUID 0x10.2 fields are same format as 0x10.1 */
 		r = &rdt_resources_all[RDT_RESOURCE_L2].r_resctrl;
-		rdt_get_cache_alloc_cfg(2, r);
-		if (rdt_cpu_has(X86_FEATURE_CDP_L2))
-			rdt_get_cdp_l2_config();
-		ret = true;
+		ctrl = rdt_get_cache_alloc_cfg(2, r);
+		if (ctrl) {
+			if (rdt_cpu_has(X86_FEATURE_CDP_L2))
+				rdt_get_cdp_l2_config();
+			list_add(&ctrl->entry, &r->controls);
+			r->alloc_capable = true;
+			ret = true;
+		}
 	}
 
 	if (get_mem_config())
-- 
2.56.0

