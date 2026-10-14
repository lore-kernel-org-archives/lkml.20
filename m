Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE03AA1BA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947378; cv=none; b=WrpV+kFnMxvD5HWqvv+gbNwA7ooIwn5z0vSJ0YsXFOLIcgzpieVC2FzVoR5AJ1DP95mXU5AmuOAqtYxw9t+Ij7xJ2MSDAFfEqB3xf9HA6KtKr9RJlTUOgy077IWg2c1wTAcGTaW7smyExFd/PCvieVW42TT1iGR6fzao4gELMcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947378; c=relaxed/simple;
	bh=6+J8Nqa7DzPTFNylmToEBLrhgxmYBPDy6yhmi2delAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b3EOHKc76fSTF3x/UK01oyreidTPMZbqtRglw4NL8iBVaWdXptExB+WcPJNfvcUMs5YoyaetrcjpcAOxd2CJbwgzu9bemzVzmlyA9AJW8ZlPFXIA8KJij7P1M5F8PbhcwnhP+gRJ53iF8R3Y3apnh+qhzf6lojRngzNBrM0uMc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YF+pGbgd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YF+pGbgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947377; x=1823483377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6+J8Nqa7DzPTFNylmToEBLrhgxmYBPDy6yhmi2delAI=;
  b=YF+pGbgdElKVVxgBtoXZCM+CXdJrPojYltV4GKi4B+1cNf12LaRfIiKo
   OPyDePtMfJL95XN9fruAtRlBgZRxSo39+vAmd+vWB532ECcp+yiWop9zq
   UYEqxzjepJX/Zt3IKJUytsYjJHl7YS1aPU+9f8SUpcDVOfhvksnYJKjTN
   iRLX7J7mXyK/CnhI2w6J4OBLZlKVRQF49aQlz0umQ1ifn1dxhPvTF/iE/
   16gLt37vBBpASzf9Xg3ABzDQKHa3ivKSEJi4Iks2uQitosuyW9UZRPHcq
   bxij+WhqedR9CAzKCbGBXG9gHcFqlkPNc46q7f8YiRKhnlOKWBwNHfTUg
   g==;
X-CSE-ConnectionGUID: sFjJ3GqmTM+bCVO4/kdIrQ==
X-CSE-MsgGUID: enitfKAuTlSvp+lAwBexPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="562673"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="562673"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:09:36 -0700
X-CSE-ConnectionGUID: 6dfDFF7GSzqcaTIfsgT1hw==
X-CSE-MsgGUID: NwrgIWYJTE6CFknXnr9xxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1283604"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa001.jf.intel.com with ESMTP; 13 Oct 2026 20:09:33 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com
Cc: tglx@kernel.org,
	bp@alien8.de,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	fenghuay@nvidia.com,
	babu.moger@amd.com,
	hongyu.ning@intel.com,
	chen.yu@linux.dev,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>
Subject: [PATCH v9 06/12] x86,fs/resctrl: Move resctrl_arch_round_mon_val() out of line
Date: Wed, 14 Oct 2026 10:59:07 +0800
Message-Id: <e3d614c6c6d9cbcb92e5dcc975cafae4bfb059a6.1791933001.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791933001.git.yu.c.chen@intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resctrl_arch_round_mon_val() is an inline function in the architecture
header. It is only called during resctrl initialization and when user space
writes "max_threshold_occupancy", neither of which is a hot path that
benefits from inlining.

Upcoming ERDT support needs resctrl_arch_round_mon_val() to consult
ERDT-specific state. Keeping it inline would force ERDT prototypes into the
architecture header, fragmenting the ERDT code across files.

Move resctrl_arch_round_mon_val() into monitor.c and declare it in
include/linux/resctrl.h alongside the other resctrl_arch_*() calls. Move the
MPAM stub from arm_mpam.h into mpam_resctrl.c accordingly.

No functional change.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
Changes since v8:
- New patch. v8 added erdt_get_scale() and erdt_cpu_has() prototypes to
  asm/resctrl.h only to keep resctrl_arch_round_mon_val() inline, which
  fragmented the ERDT code. Move the function out of line instead so the
  ERDT prototypes can stay in the resctrl internal header.
  (Reinette Chatre)

 arch/x86/include/asm/resctrl.h        | 9 ---------
 arch/x86/kernel/cpu/resctrl/monitor.c | 9 +++++++++
 drivers/resctrl/mpam_resctrl.c        | 5 +++++
 include/linux/arm_mpam.h              | 5 -----
 include/linux/resctrl.h               | 1 +
 5 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 8f6edcdcfd87..738de74235bd 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -130,15 +130,6 @@ static inline void __resctrl_sched_in(struct task_struct *tsk)
 	}
 }
 
-static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
-{
-	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
-
-	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
-	val /= scale;
-	return val * scale;
-}
-
 static inline void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid,
 							    u32 rmid)
 {
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 6e46f10d8640..e42ee2769a39 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -421,6 +421,15 @@ __init void resctrl_arch_update_snc(void)
 	snc_nodes_per_l3_cache = snc_get_config();
 }
 
+unsigned int resctrl_arch_round_mon_val(unsigned int val)
+{
+	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
+
+	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
+	val /= scale;
+	return val * scale;
+}
+
 int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 {
 	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953a..5799c6bd4f98 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -143,6 +143,11 @@ void resctrl_arch_pre_mount(void)
 {
 }
 
+unsigned int resctrl_arch_round_mon_val(unsigned int val)
+{
+	return val;
+}
+
 bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 {
 	return mpam_resctrl_controls[rid].cdp_enabled;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index f92a36187a52..4c639e9c8e5b 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -76,11 +76,6 @@ static inline void resctrl_arch_disable_mon(void) { }
 static inline void resctrl_arch_enable_alloc(void) { }
 static inline void resctrl_arch_disable_alloc(void) { }
 
-static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
-{
-	return val;
-}
-
 /**
  * mpam_register_requestor() - Register a requestor with the MPAM driver
  * @partid_max:		The maximum PARTID value the requestor can generate.
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index dd09c2ce9a0f..c99561b19e7a 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -418,6 +418,7 @@ static inline u32 resctrl_get_default_ctrl(struct rdt_resource *r)
 u32 resctrl_arch_get_num_closid(struct rdt_resource *r);
 u32 resctrl_arch_system_num_rmid_idx(void);
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
+unsigned int resctrl_arch_round_mon_val(unsigned int val);
 
 bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,
 			      unsigned int binary_bits, void *arch_priv);
-- 
2.43.0

