Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443063;
	b=GhFyACK11jEid1qRLp7CtRzIlBRiDzkKRwvSaIYJa4fPLb8rkyG1YcD29ecyCHRlpHzv
	 PrHi1A67NI2DRogvManZGazA6kYO5TnXthR1ZR2dVNS1zSetnWb0a1esZxi2o2DjC7X3o
	 bv/7lifGnHSObLHr7mhx5PMhY5zi4rh/UEKvlJOeJBAlXC/jvYD6/q/Kl5IMt4D14it5T
	 5vxef4SZH7xhFQlSdDRrbuMQne84ce6k/W2XKAeVIsOSh9CHphMCPr86ltOQcMKfAuZYC
	 7/Ii6rsPIvr/vcH2n/WEnMDOLdEwlx+yop7XNslJ8D7fnljMBQLH0CS8yM0OV9+WTOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443063;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5glsYhiJQvTewTue11QClnQyXGe14nbkKIVgpnHFobk=;
	b=G4V7ey31VtWQ44vDWsKnGp/0tjC6nrdv6iL387mKEN0DKbwQeQQ3IwrlSx0ApE6neW/Y
	 RwC4lM3xhNCdSda/Bg1aA4uK/8eH9wlaA9TmrSFmMlQ+/OUcRmi5UmifSODPokDEtC+yl
	 HVWOGnicK0UJNI8OK+8qhU6/OIR8msti2cUT4uRv0IgjIA1hdMRntn0BS4nQvlTVSFivW
	 2CIMpJecjqnLBAI1ZHRnzibwzVHOOhQFdfLk2EBqQhxttVFbIIg/qgyfiF3kyLsgB5E8D
	 /IfXSALZ9aXXcunRd+uEELWr6mWWLcpnZI1nc7aNm1yAmMQFwd4pOB/71JgxRztvieA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iIqiH8Qc;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E342060A2633
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E342060A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iIqiH8Qc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443063; x=1823979063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=coFynmodb4SSI9urQSNuuDWxQ3sofyrL/q0tMcF+blI=;
  b=iIqiH8QcV9SqCsa427mwCmOQpDwcDR/bH4p+BwU/Qdd2XmQbRr6p6BTQ
   NTMn5WsrbQL0QKJOrnzvYOt/WzYVTNIu+KYXTOql5xHHLClF/TtHjgGvB
   sq4CvhYhfVxgesfPYeH3rvpkggLgkSlvHrz9SEsInbaq6N3ksI3BeF6UQ
   xpP6mDlmyKuEeecH/m00sgvL1SbJR0/MGe+H43938vi1KxOxfRTJ23O3r
   akOR5WkorPYUSgJHD0Z4GwNCaszY8BSTOdjyloIEcVzVIlKBAT8l8WvGM
   rGH67Kd9GY+u8UuiTpM4OYjH56B+Dmu342Rgv1US38ghEd0YhEtBpOeDp
   w==;
X-CSE-ConnectionGUID: 4Bjs4cY3QNy0rSQDvAhh6A==
X-CSE-MsgGUID: PWJSAATPS5KMpEnn47vJjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131228"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131228"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:50 -0700
X-CSE-ConnectionGUID: noYXbo5ORu6B1dFqiuvVhw==
X-CSE-MsgGUID: oPLdZMh3SZKefgEuN2eUog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008663"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:50 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>,
	David E Box <david.e.box@intel.com>,
	x86@kernel.org
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v14 14/24] x86,fs/resctrl: Handle systems where AET is the only monitoring feature
Date: Mon, 19 Oct 2026 13:50:21 -0700
Message-ID: <20261019205031.16977-15-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019205031.16977-1-tony.luck@intel.com>
References: <20261019205031.16977-1-tony.luck@intel.com>
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

Application Energy Telemetry (AET) is not enumerated via CPUID. Its presence
is discovered on the first mount of the resctrl file system by querying the
pmt_telemetry driver. resctrl is initialized at boot only if CPUID
enumeration finds allocation or monitoring features.

On a system that supports monitoring (X86_FEATURE_CQM) but no L3 monitoring
features, get_rdt_mon_resources() reports that no monitoring is supported.
If the system also does not support allocation, resctrl is not initialized
and AET can never be used.

Assume that AET may be supported whenever the system supports monitoring.

If AET is not supported either, the mount finds neither allocation nor
monitoring support. rdt_get_tree() then lets the mount succeed with nothing
to allocate or monitor, but does not mark resctrl as mounted. Fail the mount
with an error message instead, before any of the file system is set up.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	New commit message.
---
 arch/x86/kernel/cpu/resctrl/internal.h |  2 +-
 arch/x86/kernel/cpu/resctrl/core.c     | 22 +++++++++++++---------
 arch/x86/kernel/cpu/resctrl/monitor.c  |  4 +---
 fs/resctrl/rdtgroup.c                  |  8 ++++++--
 4 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 086282a82fca..c038b7d80ce3 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -226,7 +226,7 @@ union l3_qos_abmc_cfg {
 
 void rdt_ctrl_update(void *arg);
 
-int rdt_get_l3_mon_config(struct rdt_resource *r);
+void rdt_get_l3_mon_config(struct rdt_resource *r);
 
 bool rdt_cpu_has(int flag);
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index b32fa143283e..0262174df7ad 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -991,7 +991,7 @@ static __init bool get_rdt_alloc_resources(void)
 static __init bool get_rdt_mon_resources(void)
 {
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
-	bool ret = false;
+	bool l3_mon_found = false;
 
 	/* Any monitoring at all? */
 	if (!cpu_feature_enabled(X86_FEATURE_CQM))
@@ -1001,27 +1001,31 @@ static __init bool get_rdt_mon_resources(void)
 
 	/* Any of the L3 monitoring features? */
 	if (!cpu_feature_enabled(X86_FEATURE_CQM_LLC))
-		return false;
+		goto out;
 
 	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
 		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, false, 0, NULL);
-		ret = true;
+		l3_mon_found = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
 		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID, false, 0, NULL);
-		ret = true;
+		l3_mon_found = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
 		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID, false, 0, NULL);
-		ret = true;
+		l3_mon_found = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_ABMC))
-		ret = true;
+		l3_mon_found = true;
 
-	if (!ret)
-		return false;
+	if (l3_mon_found)
+		rdt_get_l3_mon_config(r);
+	else
+		pr_info("CPUID reports L3 monitoring support, but no L3 monitoring features found\n");
 
-	return !rdt_get_l3_mon_config(r);
+out:
+	/* Non-L3 features, e.g. AET, may be supported */
+	return true;
 }
 
 static __init void __check_quirks_intel(void)
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 82a555855c1b..bd45d72d1d05 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -431,7 +431,7 @@ static void __init intel_rdt_mbm_apply_quirk(u32 num_rmid)
 	mbm_cf = mbm_cf_table[cf_index].cf;
 }
 
-int __init rdt_get_l3_mon_config(struct rdt_resource *r)
+void __init rdt_get_l3_mon_config(struct rdt_resource *r)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
 	unsigned int mbm_offset;
@@ -519,8 +519,6 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 		intel_rdt_mbm_apply_quirk(num_rmid);
 
 	r->mon_capable = true;
-
-	return 0;
 }
 
 static void resctrl_abmc_set_one_amd(void *arg)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 79d4ddc3d64d..ecdb5da50179 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3193,6 +3193,11 @@ static int rdt_get_tree(struct fs_context *fc)
 		goto out;
 	}
 
+	if (!resctrl_alloc_capable() && !resctrl_mon_capable()) {
+		ret = invalfc(fc, "No allocation or monitoring features are available or enabled");
+		goto out;
+	}
+
 	ret = setup_rmid_lru_list();
 	if (ret)
 		goto out;
@@ -3251,8 +3256,7 @@ static int rdt_get_tree(struct fs_context *fc)
 	if (resctrl_mon_capable())
 		resctrl_arch_enable_mon();
 
-	if (resctrl_alloc_capable() || resctrl_mon_capable())
-		resctrl_mounted = true;
+	resctrl_mounted = true;
 
 	if (resctrl_is_mbm_enabled()) {
 		r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-- 
2.56.0

