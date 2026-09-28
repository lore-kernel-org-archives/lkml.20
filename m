Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF17502D55
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633747; cv=none; b=WF/4+G/aZfRe2GvI+IreNccYiIY+totAt/Ikx+aXrg2nP03/w1eE7MprcjuzyfUaCFUqtYCQeEc/s6oy2+INAkZYAQgtqg/XGy3kah1VV9KPLCBgQRpjwqSa/a0mkzzi9KGclbSC9opP1UHQDGgDdw8Pg2vp/SJ0ENnR+3B2o8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633747; c=relaxed/simple;
	bh=KABOF9h49MMn0eD/9SVEpUQsHECZ7vqOTtWvMhMIQ2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqWFxg8JaSRfYi88C0/ghPdMtyZYZ5ZJGv+PWVxECG+SX7phblWuh3Tx3FzL8jVeR+DiW3KbZb7IRB8UC266dwQIVcRvU7H65ZoUx6TTHcFrVDD0qjA+Dq5+qk8IyCGh1SndbIOJkT5L7P5UMbSEXbj0qka0W1eAnEeWO5Dugws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNrm29W9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNrm29W9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633738; x=1822169738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KABOF9h49MMn0eD/9SVEpUQsHECZ7vqOTtWvMhMIQ2M=;
  b=WNrm29W9opaw1zQL0PQhphuGGzN9EGw3LxS2j+J3gIgeb+f3JauDlfem
   IBFui5WcJOnm8Upuj/4fUJcpLY7sKNS+ROEA+981ESfcHaYckh7L0Ps8y
   rpDX0NJf8L4TzHptWc3bmv5thZqoRRMYcLzapwHsLi2USINBGO5k7+PpN
   zuvOc0YIghCFLLeDrJ02i/UqyiG+EmRGCAXzA+OjtwJHbIhWUDsBJj3em
   26LLLQWJlq03w6nRzph2UmH2jkpXxGn8i1XTaIutErTnjkXhBQ2tesfLl
   dzSVOFyeDaZ4kXTLjX35II1Az73TS6m9K4zyfR3ambQL2h5uecSHwZnZU
   w==;
X-CSE-ConnectionGUID: DfljD768S7OiGyIy+eq5TA==
X-CSE-MsgGUID: pJtwbQzCRZuy/FEeKnPA1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387283"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387283"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:20 -0700
X-CSE-ConnectionGUID: 58VhuNDyRj2Fn71cwUUG3A==
X-CSE-MsgGUID: i0uDuGjhSk6gmXFbRrSUPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685514"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.222.143])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:19 -0700
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
Subject: [PATCH v13 15/25] x86,fs/resctrl: Handle systems where AET is the only resource
Date: Mon, 28 Sep 2026 15:14:59 -0700
Message-ID: <20260928221509.68002-16-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928221509.68002-1-tony.luck@intel.com>
References: <20260928221509.68002-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Application Energy Telemetry (AET) is not enumerated by CPUID its
presence/absence is discovered at file system mount time by querying the
pmt_telemetry driver. This results in two issues:

1) On a platform with no L3 monitoring features rdt_get_l3_mon_config()
   will report that the system does not support any monitoring at all.

   Handle this by optimistically assuming that AET may be supported.

2) If this optimism is unfounded, rdt_get_tree() may find that neither
   allocation, nor monitoring is supported. In this case it allows the
   mount to succeed, but does not set "resctrl_mounted".

   Move the feature test earlier and fail the mount with a diagnostic
   message to the console.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	Add a pr_info() if no L3 features are enabled on a
	"X86_FEATURE_CQM_LLC" system.

	Add a comment for the "return true" from get_rdt_mon_resources()

	Rewrite commit message with context for the change.
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
2.55.0

