Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051855;
	b=TfaX5J7210ifF/8c6dz7AVrH0eGjLhzMhG1gx6oMICHB1xz/Jy4nQiiUnYDy1uhX6eX+
	 0ysM0KoQWAiIyjohqVjlf62XLjo864Il38ROSrvhT9AwRkeH5jeN8C64nzluzlusJmDm9
	 b+ezNnDYjCJtSZcLbSxEM0GZxjCJAOAOcQC4sMLBesQV4peGB7mWDOPLBKo4048HrG52v
	 YI2T/A4+vX6EFhrXcr6w9F5ddaLt9X25W9jhTvwGLBLcDOhibJYcu6eQK5m/J620ClMl7
	 CkVAh1ReFe3l+x4BqMauwGEPNxi67H7y5ScKxJtu2FAOadELSLLfa62x0+EwKhGbJwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051855;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xq/cY2dqTe2+WowV+wdjywYwgLH/lWzInjFVQFAPgGU=;
	b=NPOWCB9HbufDyYW4fyNCe0DkDWVKIpgfzKWU8MhNc+3rw1K+qU5QGDQa9mFlzT6idhkH
	 2qRr9r0THWiZKlvBUL3Aj4OvwVS2ydzMQqrHD+qAGWGhR6gPPsLVQw/R7/N1UjVBIcaLI
	 GP5y2xy5pBHG9HWVtTsHfj3y23rvwaOHvA9Hvn8TOBO62MEVDtvQpMxbfnQawci+ys9K5
	 BbEwdUVk6SY7SLi+BFMYjfu5Pf7X67f5nI9vz8oh1yHTBIiKYcuDcA9PFef21geTZYgDe
	 HerL7QkcOcqA/8m/M0gFtgoT3jxvFMDvWPBRr0gleTBVoU8elXCsKfi4JO1736XRUZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kDFrbn5q;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979960A2610
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0979960A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kDFrbn5q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793051853; x=1824587853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bPuHwgxsrDKiutFUs7vyBlZYNJ9A1gxyxtTZCJLxrbY=;
  b=kDFrbn5qzWqRG3KaUIWrszxwT+6W59YCDJQ2atJvPDAcqHmUAArvreHa
   dsU7AJPRt6OZqzN3UwGk5xdn8+BSrm354WeW973DQwcTovNLNFBtcDsib
   WTvlwtJDKoLRPeAOZ1Wt9j94GWxUc0ZSEMcU+0XskNAK2j/LWt3DrzRey
   dRY2uoo0GIS3QJhM0oVVlnOIsT+P0jlqvMpYcuQEz0vHPDWatt2NhD/C1
   30g1zy+/ovBPhWWtlv7jhGS54LGBY3VjRxDIC51JZ6yPfNcZR/BP+F//H
   oGHjOXGHL5CjyLWaj0695W/f7k+GLdWi947x06n38XfZBQkC5b/zJQ3MM
   w==;
X-CSE-ConnectionGUID: MlucVmnnS1SXvcDcDTA2vw==
X-CSE-MsgGUID: Bkq1bxfZRmKequFq5bz54A==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1766425"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1766425"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:57:29 -0700
X-CSE-ConnectionGUID: Xe63udGGQFuEXTgyK73SYg==
X-CSE-MsgGUID: vRnrenWyTSmA4oYbUlN3dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4240283"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.221.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:57:29 -0700
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
Subject: [RFC PATCH 7/8] x86/resctrl: Check for and enable asymmetric L2 cache allocation
Date: Mon, 26 Oct 2026 14:57:17 -0700
Message-ID: <20261026215718.16810-8-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026215718.16810-1-tony.luck@intel.com>
References: <20261026215718.16810-1-tony.luck@intel.com>
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

Systems with asymmetric L2 allocation do not enumerate using CPUID
leaf 0x10, they use leaf 0x28 instead.

Add a check for asymmetric allocation support (and update the check
for symmetric support to use cpu_feature_enabled()).

Enumerate the per-domain cache bit mask length for asymmetric L2
cache implementations. Rename the resource to "L2A" to avoid
confusing legacy code that only understands symmetric L2 cache.

The only asymmetric L2 feature of note is the cache bit mask length.
Other features are assumed to be symmetric.

Flag the resource as asymmetric for use by file system code.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl.h            |  2 ++
 arch/x86/kernel/cpu/resctrl/core.c | 26 ++++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 8ac799d1feff..ef1c96b8f679 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -495,6 +495,7 @@ enum resctrl_ctrl_mode {
  * @mon_domains:	RCU list of all monitor domains for this resource
  * @name:		Name to use in "schemata" file.
  * @cdp_capable:	Is the CDP feature available on this resource
+ * @asymmetric:		Are domains in the resource asymmetric
  * @bw_throttle_mode:	Bandwidth throttling mode when threads request
  *			different memory bandwidths
  * @cache_io_alloc_capable:True if portion of the cache can be configured
@@ -513,6 +514,7 @@ struct rdt_resource {
 	struct list_head		mon_domains;
 	char				*name;
 	bool				cdp_capable;
+	bool				asymmetric;
 	enum membw_throttle_mode	bw_throttle_mode;
 	bool				cache_io_alloc_capable;
 	enum resctrl_ctrl_mode		ctrl_mode;
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index f6b7358e50d7..4e2fdc7e9fe9 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -348,6 +348,16 @@ static __init bool __rdt_get_mem_config_amd(struct rdt_resource *r)
 	return true;
 }
 
+static int rdt_get_l2_asym_cbm_len(void)
+{
+	union cpuid_0x10_1_eax eax;
+	u32 ebx, ecx, edx;
+
+	cpuid_count(CPUID_LEAF_RDT_A_ASYM, 2, &eax.full, &ebx, &ecx, &edx);
+
+	return eax.split.cbm_len + 1;
+}
+
 static void rdt_get_cache_alloc_cfg(int leaf, int idx, struct rdt_resource *r)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
@@ -596,7 +606,10 @@ static void rdt_sync_ctrl_bitmap(struct rdt_resource *r, struct rdt_ctrl_domain
 	for_each_resource_ctrl(ctrl, r) {
 		if (ctrl->type != RESCTRL_CTRL_BITMAP)
 			continue;
-		d->cbm_len = ctrl->bitmap.cbm_len;
+		if (r->asymmetric)
+			d->cbm_len = rdt_get_l2_asym_cbm_len();
+		else
+			d->cbm_len = ctrl->bitmap.cbm_len;
 		break;
 	}
 }
@@ -1073,7 +1086,7 @@ static __init bool get_rdt_alloc_resources(void)
 	if (rdt_alloc_capable)
 		return true;
 
-	if (!boot_cpu_has(X86_FEATURE_RDT_A))
+	if (!cpu_feature_enabled(X86_FEATURE_RDT_A) && !cpu_feature_enabled(X86_FEATURE_RDT_A_ASYM))
 		return false;
 
 	if (rdt_cpu_has(X86_FEATURE_CAT_L3)) {
@@ -1092,6 +1105,15 @@ static __init bool get_rdt_alloc_resources(void)
 		if (rdt_cpu_has(X86_FEATURE_CDP_L2))
 			rdt_get_cdp_l2_config();
 		ret = true;
+	} else if (rdt_cpu_has(X86_FEATURE_ASYM_CAT_L2)) {
+		/* CPUID 0x28.2 fields are same format as 0x10.1 */
+		r = &rdt_resources_all[RDT_RESOURCE_L2].r_resctrl;
+		rdt_get_cache_alloc_cfg(CPUID_LEAF_RDT_A_ASYM, 2, r);
+		if (rdt_cpu_has(X86_FEATURE_ASYM_CDP_L2))
+			rdt_get_cdp_l2_config();
+		r->asymmetric = true;
+		r->name = "L2A";
+		ret = true;
 	}
 
 	if (get_mem_config())
-- 
2.56.0

