Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527F25013CC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633729; cv=none; b=Jkl73UVp2/MJUjYshoMw8ZWIuLiBW8lGz5+y8Xuk1dsSotzVFg3bq+Dtwo4+8JoFcMO5g3i85VObGeRCkPtVGAajMCE4IeERp9WOAy5/iF5IMpGf5q1OPzkKuHTncwWlect8W8EUrn7bFiJ6VllhtBbagktAup5WqOG7NmLun+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633729; c=relaxed/simple;
	bh=k5h8jG51D1LCqCkTgG/UlLgltohB8PGNOuyQuSnwDBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qj3qJwePrKpGPSB9Y3YAxHPKki/ZBPXpw9N3MA1hrSSqh1tDoYdFk6M08LwOOxUJ+COUET4//5oq5P3YqEJIKqSBHdy8GwzRL8esmRj3IPgksapr36TUspcyz+K390fX+r2vb/OlQ0axz0cG3bxRNSrCdYZxUNqKn7lipuZc+zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGg8LC+G; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGg8LC+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633726; x=1822169726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k5h8jG51D1LCqCkTgG/UlLgltohB8PGNOuyQuSnwDBk=;
  b=PGg8LC+GUWIoGu/+k2jJVW2qY0DvSK1yIlQk0E5JX94o8XuFiJ3YASXM
   XP6nppaXr8pKRA1kOcE0/3WCPEYrxmjr77MkvFyvDmc820E34q7c9xL8D
   SJbagsqRfKW1GTZd0v5mjA2r5slHZfZeRZfxfL2mFD4BE/lJjTs+PkiaX
   m7Nuim5R5yRfI5rxC93imX6+Y4y8OREifNtul7OZcS6HSExEiRfBqty5E
   D5u8cSYbSfGKxadrkAM845QMrYfXRwwcHEVgKYRzGtSvBxZzX8LTt4iCQ
   JC2omzfq8WB/uZ+tEtfNyQmc2fTwPdtpfzXJOzOytZOgCjaQtc7jGEKnU
   Q==;
X-CSE-ConnectionGUID: uCpT7ZzRQJ6QqDCbOCKwRQ==
X-CSE-MsgGUID: zFC/ZyHKR8KXbGCZxb778g==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387197"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:18 -0700
X-CSE-ConnectionGUID: u5h8xWo5Td+aMB6lJ4SKng==
X-CSE-MsgGUID: Fx8uazNhThi0nRYGxuprbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685475"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.222.143])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:17 -0700
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
Subject: [PATCH v13 05/25] x86/resctrl: Apply Intel MBM quirk from rdt_get_l3_mon_config()
Date: Mon, 28 Sep 2026 15:14:49 -0700
Message-ID: <20260928221509.68002-6-tony.luck@intel.com>
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

The Intel quirk to adjust Memory Bandwidth Monitoring (MBM) values on
certain CPUs is applied early, before discovering if MBM is supported.

Move the call into rdt_get_l3_mon_config(), but keep the decision on
whether it is needed in __check_quirks_intel() with all the other
model specific tests.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	Babu:
	s/intel_rdt_mbm_apply_quirk(r->mon.num_rmid)/intel_rdt_mbm_apply_quirk(num_rmid)/

	Reinette:
	Add comment to code describing model specific details of quirk.
---
 arch/x86/kernel/cpu/resctrl/internal.h |  4 +--
 arch/x86/kernel/cpu/resctrl/core.c     |  2 +-
 arch/x86/kernel/cpu/resctrl/monitor.c  | 40 ++++++++++++++++----------
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..086282a82fca 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -151,6 +151,8 @@ static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r
 
 extern struct rdt_hw_resource rdt_resources_all[];
 
+extern bool intel_rdt_mbm_need_quirk;
+
 void arch_mon_domain_online(struct rdt_resource *r, struct rdt_l3_mon_domain *d);
 
 /* CPUID.(EAX=10H, ECX=ResID=1).EAX */
@@ -228,8 +230,6 @@ int rdt_get_l3_mon_config(struct rdt_resource *r);
 
 bool rdt_cpu_has(int flag);
 
-void __init intel_rdt_mbm_apply_quirk(void);
-
 void rdt_domain_reconfigure_cdp(struct rdt_resource *r);
 void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r);
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 34ca3c7cc046..82b27a0157ae 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1011,7 +1011,7 @@ static __init void __check_quirks_intel(void)
 			set_rdt_options("!l3cat");
 		fallthrough;
 	case INTEL_BROADWELL_X:
-		intel_rdt_mbm_apply_quirk();
+		intel_rdt_mbm_need_quirk = true;
 		break;
 	}
 }
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 89b83cc7e800..468e9821f35a 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -37,6 +37,8 @@ bool rdt_mon_capable;
  */
 unsigned int __ro_after_init rdt_l3_mon_scale;
 
+bool __initdata intel_rdt_mbm_need_quirk;
+
 #define CF(cf)	((unsigned long)(1048576 * (cf) + 0.5))
 
 static int snc_nodes_per_l3_cache = 1;
@@ -51,7 +53,7 @@ static int snc_nodes_per_l3_cache = 1;
  * 1. The threshold 0 is changed to rmid count - 1 so don't do correction
  *    for the case.
  * 2. MBM total and local correction table indexed by core counter which is
- *    equal to (x86_cache_max_rmid + 1) / 8 - 1 and is from 0 up to 27.
+ *    equal to num_rmid / 8 - 1 and is from 0 up to 27.
  * 3. The correction factor is normalized to 2^20 (1048576) so it's faster
  *    to calculate corrected value by shifting:
  *    corrected_value = (original_value * correction_factor) >> 20
@@ -421,6 +423,20 @@ static __init int snc_get_config(void)
 	return ret;
 }
 
+static void __init intel_rdt_mbm_apply_quirk(u32 num_rmid)
+{
+	unsigned int cf_index;
+
+	cf_index = num_rmid / 8 - 1;
+	if (cf_index >= ARRAY_SIZE(mbm_cf_table)) {
+		pr_info("No MBM correction factor available\n");
+		return;
+	}
+
+	mbm_cf_rmidthreshold = mbm_cf_table[cf_index].rmidthreshold;
+	mbm_cf = mbm_cf_table[cf_index].cf;
+}
+
 int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
@@ -500,25 +516,19 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 		hw_res->mbm_cntr_assign_enabled = true;
 	}
 
+	/*
+	 * This quirk only applies to Intel Skylake and Broadwell
+	 * CPUs. These don't support Sub-NUMA Cluster. Pass the
+	 * raw number of RMIDs enumerated by CPUID(0xF,0x1).ECX.
+	 */
+	if (intel_rdt_mbm_need_quirk)
+		intel_rdt_mbm_apply_quirk(num_rmid);
+
 	r->mon_capable = true;
 
 	return 0;
 }
 
-void __init intel_rdt_mbm_apply_quirk(void)
-{
-	int cf_index;
-
-	cf_index = (boot_cpu_data.x86_cache_max_rmid + 1) / 8 - 1;
-	if (cf_index >= ARRAY_SIZE(mbm_cf_table)) {
-		pr_info("No MBM correction factor available\n");
-		return;
-	}
-
-	mbm_cf_rmidthreshold = mbm_cf_table[cf_index].rmidthreshold;
-	mbm_cf = mbm_cf_table[cf_index].cf;
-}
-
 static void resctrl_abmc_set_one_amd(void *arg)
 {
 	bool *enable = arg;
-- 
2.55.0

