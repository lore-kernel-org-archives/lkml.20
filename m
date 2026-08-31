Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFD747FB16
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198292; cv=none; b=GTodK2G9eyeq99q+p8BpDgyUo3TohRQsQ+lLDTkN7IlgjDIumkVzY4FnwVmMjqpxhjFr7a7jazkwnVipo4MCh++R0deacb0GCjRwEW/FXLQqH8CgqjYSsMY4U2+wixzwtW8sHWAp/mnoa3RZfR58rpRGWiMdaUxkgKe0O6YuAjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198292; c=relaxed/simple;
	bh=gTVpu+SVk+l61/McWJ0wIc0Ewu4AX96KjxEgWsJK59I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5dg0lSi8vrQly9aldX+YGmQn2JK2dVxAq13ms/zJV8wQlGp3LxpkWUpd+yUJWxURTE+itJDfjLOmlmU/AhO1FoAeTO0E05TEKrwhHEciQm1PgAOQRSzVeY0T9WoOBUYlOQgLLnL0jUNruQcrD9WMWIXcbKMPgBMoCCUS2m96jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiyrLKxU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiyrLKxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788198290; x=1819734290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gTVpu+SVk+l61/McWJ0wIc0Ewu4AX96KjxEgWsJK59I=;
  b=YiyrLKxUATUxYQ7LfiXRDqsweYuKj+UF0K+5yrQ978m6TsATHeLJV3xW
   jpCUkdcxztLrvOozxAeQMAVg5AjhlDeFkqN9VEZWNLwJvnwI3cS0doxN7
   vQJBiuB014bmE5dG/pXwqpbiDiQz8fxeELNu8u56wDGlf58mATn3cLzUa
   TaSEcihnLkGGWrhK9STV46bYf8m8j9HH9Aw7ft9uugOksw2gLsphf7Nxo
   QjGAf5XETniXKcFjaBqcGEX2/XDBauT/oPNl5Hwq1bBlkshSebrqmxesG
   H//7dnMWqOzFk3hrJwX9a6WLNvO252x4cISHbpGg0oJI9fpgjbw5Nnyiw
   A==;
X-CSE-ConnectionGUID: vvXM+PLXSWSfMN4GWEuvow==
X-CSE-MsgGUID: a1t7jLKhQnCWEQFRXbd3IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92480120"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92480120"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:44:44 -0700
X-CSE-ConnectionGUID: D1iupUh/R56lW4EyKmHFHQ==
X-CSE-MsgGUID: OfAbCW4DR9yb3gRROGKXsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="268907032"
Received: from aherrold-mobl1.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.17])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:44:43 -0700
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
Subject: [PATCH v11 22/23] x86/resctrl: Simplify Kconfig options for resctrl
Date: Mon, 31 Aug 2026 10:44:20 -0700
Message-ID: <20260831174421.13921-23-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831174421.13921-1-tony.luck@intel.com>
References: <20260831174421.13921-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus Torvalds complained[1] about Kconfig complexity making it too
hard for "random people to build their own kernels".

CONFIG_X86_CPU_RESCTRL_INTEL_AET has been causing problems since it was
first added as it required other config options to be set to "built-in".

AET now resolves PMT symbols at runtime via the registration API,
so INTEL_PMT_TELEMETRY no longer needs to be built-in. This means
that AET can be included unconditionally as part of X86_CPU_RESCTRL.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Link: https://lore.kernel.org/all/CAHk-=whigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk+XDssHU0A@mail.gmail.com # 1
---
v11:
	Drop the intel_aet*() stubs from internal.h

 include/linux/intel_vsec.h             |  4 ++--
 arch/x86/kernel/cpu/resctrl/internal.h | 14 --------------
 arch/x86/Kconfig                       | 13 -------------
 arch/x86/kernel/cpu/resctrl/Makefile   |  2 +-
 4 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index bcbf4937c71c..885f8e3ab057 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -257,7 +257,7 @@ static inline void
 intel_pmt_put_feature_group(struct pmt_feature_group *feature_group) {}
 #endif
 
-#ifdef CONFIG_X86_CPU_RESCTRL_INTEL_AET
+#ifdef CONFIG_X86_CPU_RESCTRL
 void intel_aet_register_enumeration(struct module *module,
 				    struct pmt_feature_group *(*get)(enum pmt_feature_id id),
 				    void (*put)(struct pmt_feature_group *p));
@@ -269,6 +269,6 @@ static inline void intel_aet_register_enumeration(struct module *module,
 						  void (*put)(struct pmt_feature_group *p)) { }
 static inline void intel_aet_unregister_enumeration(void) { }
 static inline void intel_aet_invalidate(u8 package_id) { }
-#endif /* CONFIG_X86_CPU_RESCTRL_INTEL_AET */
+#endif /* CONFIG_X86_CPU_RESCTRL */
 
 #endif
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 4409ee20474d..d88f9f82c9cb 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -233,7 +233,6 @@ bool rdt_cpu_has(int flag);
 void rdt_domain_reconfigure_cdp(struct rdt_resource *r);
 void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r);
 
-#ifdef CONFIG_X86_CPU_RESCTRL_INTEL_AET
 void __init intel_aet_init(void);
 bool intel_aet_pre_mount(void);
 void intel_aet_unmount(void);
@@ -241,18 +240,5 @@ int intel_aet_read_event(int domid, u32 rmid, void *arch_priv, u64 *val);
 void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resource *r,
 				struct list_head *add_pos);
 bool intel_handle_aet_option(bool force_off, char *tok);
-#else
-static inline void intel_aet_init(void) { }
-static inline bool intel_aet_pre_mount(void) { return false; }
-static inline void intel_aet_unmount(void) { }
-static inline int intel_aet_read_event(int domid, u32 rmid, void *arch_priv, u64 *val)
-{
-	return -EINVAL;
-}
-
-static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resource *r,
-					      struct list_head *add_pos) { }
-static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
-#endif
 
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 06b5d0c4633e..47f92613434e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -539,19 +539,6 @@ config X86_CPU_RESCTRL
 
 	  Say N if unsure.
 
-config X86_CPU_RESCTRL_INTEL_AET
-	bool "Intel Application Energy Telemetry"
-	depends on X86_CPU_RESCTRL && CPU_SUP_INTEL && INTEL_PMT_TELEMETRY=y && INTEL_TPMI=y
-	help
-	  Enable per-RMID telemetry events in resctrl.
-
-	  Intel feature that collects per-RMID execution data
-	  about energy consumption, measure of frequency independent
-	  activity and other performance metrics. Data is aggregated
-	  per package.
-
-	  Say N if unsure.
-
 config X86_FRED
 	bool "Flexible Return and Event Delivery"
 	depends on X86_64
diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
index 273ddfa30836..97ceb4e44dfa 100644
--- a/arch/x86/kernel/cpu/resctrl/Makefile
+++ b/arch/x86/kernel/cpu/resctrl/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_X86_CPU_RESCTRL)		+= core.o rdtgroup.o monitor.o
 obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o
-obj-$(CONFIG_X86_CPU_RESCTRL_INTEL_AET)	+= intel_aet.o
+obj-$(CONFIG_X86_CPU_RESCTRL)		+= intel_aet.o
 obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
 
 # To allow define_trace.h's recursive include:
-- 
2.55.0

