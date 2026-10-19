Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443052;
	b=Pq/8Or+owiSo12PJnQBxbUhQeH2goq+BDzdAwn1NpUgy/D9F6WgaIGYCDrEiP4VG8zi+
	 7M9kH0IkIGdy9uqvboEh1okCxoePUjVOLeE5Kr7/o4NkyfGjFkQ4Zq8oFM7oBMvfmdajY
	 GAlGjyjzOAqxQnZe0gwD/6QoR6InZk3V1ng5Y++GX2Xi0V9AkqX3nJhB2OMoQMDzgkNYJ
	 I4PhlWqqS0FYJNDd8fwl0C1IuGgPourimxDBgVJ3gQrIAAEebc4wB9JplAXkp97e4jOqg
	 v782w1KTOu5S++b+5/V8VfBoOksCbCasDB8i4BmMy0l8Ubc+eRUooNWDXx7ZAA1nSDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443052;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZlcnTP9NCmOYQmkP6qv39jnHp0Gbnbyxz6cPJdg3beg=;
	b=xVZpV7PCd9bbjdqEzla94B6QmoE7PojD508SKTd2tb3Xkn0xnit2C8uGEParhF57miRR
	 VQvr5S9jwB+F+Q2aFtlE9dApeiHA869yAtQqnOJ9fpPrmypuYMoihlCPc/4UeJp/tYSet
	 uQc/zme7QE6GewF81PFVtuNswo+xMcJruvrF5Mq4s891aRUkKuRRi1t4Lz+a7vADH7se6
	 t0sUOavsKqZMg63b4LHNontvQZlXW8+qAkqwWOZ7dmd7LmNAkYvbHHAgJhliz3n2dEwl8
	 c/fQdsPGDr/ILCQsW2VblwLBlBklCddJQZFF9PuNphhylnycndvTd+xqm1WCVsTw//Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NlO9LSQE;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1D6606A327
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1D6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NlO9LSQE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443051; x=1823979051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8P5Fn/oOhkAE4W5HxVESCMwNc296C4ZxIDEXRsnfMrw=;
  b=NlO9LSQEQhmhoXn2ms0PmFy4868ebd097Oz8THpax2YZsL2MdrBBADYe
   TMxdx2bwUwqzjKirj8ARpSjzXFveoVAp1b5WRIhk6bsyHcEB+qZTKTSh7
   W2eKISh79dvYPiBlFiL2atpW/xqxB1KUmNFyaeNQBMrZkWFFT3m3nxBOe
   VwKu5IaGU/P6AosfufmPN18hLrR+anZQlH3+iO0S4xW4r9ECL1ADtsc+h
   w326749HdyhqW80eSQ7zwCkbvlXybs7EfuUH5aO6JFAZzZj5YkSoVySH/
   QQ3A/K+wZogccPYVYyuyvl5P0Q/0JNyb456TnU+cn6B1AnOIBz/+TzRi8
   A==;
X-CSE-ConnectionGUID: DvpCGOdyRMujvYGfchhwQQ==
X-CSE-MsgGUID: cyogGgZGTr21fwGA6FD7Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131141"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131141"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:48 -0700
X-CSE-ConnectionGUID: khTl5oEKQG6tgbQ5/ifWTA==
X-CSE-MsgGUID: Gdr+E4fWQTaYGvonpUgzdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008628"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:49 -0700
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
Subject: [PATCH v14 04/24] x86/resctrl: Apply Intel MBM quirk from rdt_get_l3_mon_config()
Date: Mon, 19 Oct 2026 13:50:11 -0700
Message-ID: <20261019205031.16977-5-tony.luck@intel.com>
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

The Intel MBM correction factor quirk is applied during CPU model checks
that precede resctrl feature enumeration, using the RMID count from
cpuinfo_x86::x86_cache_max_rmid. It is the last reader of the resctrl fields
in struct cpuinfo_x86 now that monitoring feature enumeration is contained
within resctrl.

This lone reader prevents those fields from being removed, and applies
MBM specific setup before resctrl has established that MBM is supported.

Apply the quirk during monitoring feature enumeration in preparation
for removing the resctrl fields from struct cpuinfo_x86.
Keep the decision on whether the quirk is needed with the other model
specific tests to avoid scattering quirk handling.

No functional change intended.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	Replaced commit message with Reinette suggestion from v12 review.
	Two tweaks suggested by AI commit review:
		Be more specific that "early" enumeration is simply
		before resctrl.
		s/consumer/reader/g
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
2.56.0

