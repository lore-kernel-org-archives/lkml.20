Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A9D47D466
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198288; cv=none; b=C05z6lZmxtK853A/s+mySwc2Gn09tMketA8xdlPY2+J1c1VWbvYOoqJ7j6zGFtCiSGWzh1Afxw1ABmXA21Falkw8yy6YSj0DYEw3RGUjYurjpl24zkpb9jBW2XaAfoTBaVAD6o6whJfNl6yTOb69ZxSHHwGsS2jncSABoNikmKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198288; c=relaxed/simple;
	bh=GC4ash3hi3FcpL8wx8YMz8AUPNxuiEaGeUwXu9ujKk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiaIkfKRQR11Vlzdvi3GU78+BaKRaXr0PY5Ai0AONro7sTfO1uNlw43Al3caSSVMR1vlUOzw5/RNNTvZ80hG98bJvHYgN3vQhkn4nJATgTcqGjpkg2GyjlKG+Ap2wI8rDb5wv3ueJntvoTWN+iQKfHYcJpj7F1FjONQadqKMR+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuudS3gh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuudS3gh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788198286; x=1819734286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GC4ash3hi3FcpL8wx8YMz8AUPNxuiEaGeUwXu9ujKk8=;
  b=fuudS3ghdMDFcINRRf8GMiVoxVQUKKKRpM84eGmA5dFA5w5UY5lBnyx+
   L+YmLdplKESPEJTPiYzasc0CXW/mlszzQIF7JFGdji78bk/r+hIJYdKeZ
   zMrfS5uWNznp9OH/RspcgtOh62bnBrH/aAxnM4WoeSfjYoJ/1cJYDf6YC
   UnfHUxpwUWlvyBa0CrOsqnaRgCEfAkmiUQHwBrP/AEM73iG9lkPF+QWTG
   orbBbZQDHzFtv++jRNz/JbEwiwcU0LVqSp2V6QZ4oEzOQCtMF/v2o7SYe
   Beck3MpCidCCqPDX5AFWMMXK2U0vKEmzy3mGwECmmFEG50ooERHam6q7d
   g==;
X-CSE-ConnectionGUID: bl6BG874QLyELiAGT3k8Uw==
X-CSE-MsgGUID: fEXWSw+vTC+aEV5qWBq0Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92480073"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92480073"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:44:41 -0700
X-CSE-ConnectionGUID: otD28rh5RgKzJY20n1ByVw==
X-CSE-MsgGUID: tnmr8b5vQI+ZoNjzAsZ61Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="268907009"
Received: from aherrold-mobl1.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.17])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:44:40 -0700
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
Subject: [PATCH v11 17/23] arm,x86/resctrl: Resolve INTEL_PMT_TELEMETRY symbols at runtime
Date: Mon, 31 Aug 2026 10:44:15 -0700
Message-ID: <20260831174421.13921-18-tony.luck@intel.com>
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

resctrl is always built-in, but INTEL_PMT_TELEMETRY and INTEL_TPMI are
logically independent and should be loadable modules.  Switch AET to use the
function-pointer registration API instead of direct link-time references to
PMT symbols.

Prepare for the file system to call resctrl_arch_pre_mount() on every mount
by moving AET enumeration into resctrl_arch_pre_mount() and cleanup into
resctrl_arch_unmount(). This allows the PMT module to be unloaded whenever
the filesystem is not mounted.

intel_aet_exit() was never called because resctrl is built into the kernel. All
cleanup is now handled in the unmount path. Remove intel_aet_exit().

Note that the Linux file system code does not serialize calls to
fs_context_operations::get_tree(), so there may be arbitrarily many parallel
calls if users invoke mount(2) multiple times.

Zero rdt_resource::resctrl_mon::num_rmid for RDT_RESOURCE_PERF_PKG so
that it will be re-computed next mount.

event_group::num_rmid may be reset (reduced) during enumeration. This is
not worth resetting on unmount because the same reduction would occur on
each subsequent mount.

Place a hold on the pmt_telemetry while enumerating AET events during
pre-mount processing. Release the hold if no events were enabled.
Otherwise keep the hold until the resctrl file system is unmounted.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v11:
	Drop unneeded include of <linux/cleanup.h> from core.c
	Comment on data protected by  aet_register_lock
	Add commit comment on module{get,put} activity

 include/linux/resctrl.h                 |  6 +++
 arch/x86/kernel/cpu/resctrl/internal.h  |  8 ++--
 arch/x86/kernel/cpu/resctrl/core.c      | 24 ++++++++--
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 62 ++++++++++++++++++++++---
 drivers/resctrl/mpam_resctrl.c          |  4 ++
 5 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 4fb06d434c85..0d7fd294b760 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -591,6 +591,12 @@ void resctrl_offline_cpu(unsigned int cpu);
  */
 void resctrl_arch_pre_mount(void);
 
+/*
+ * Architecture hook called when mount fails, or on unmount.
+ * No locks are held.
+ */
+void resctrl_arch_unmount(void);
+
 /**
  * resctrl_arch_rmid_read() - Read the eventid counter corresponding to rmid
  *			      for this resource and domain.
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 27dc27480f6e..4409ee20474d 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -234,17 +234,17 @@ void rdt_domain_reconfigure_cdp(struct rdt_resource *r);
 void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r);
 
 #ifdef CONFIG_X86_CPU_RESCTRL_INTEL_AET
-bool intel_aet_get_events(void);
 void __init intel_aet_init(void);
-void __exit intel_aet_exit(void);
+bool intel_aet_pre_mount(void);
+void intel_aet_unmount(void);
 int intel_aet_read_event(int domid, u32 rmid, void *arch_priv, u64 *val);
 void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resource *r,
 				struct list_head *add_pos);
 bool intel_handle_aet_option(bool force_off, char *tok);
 #else
-static inline bool intel_aet_get_events(void) { return false; }
 static inline void intel_aet_init(void) { }
-static inline void __exit intel_aet_exit(void) { }
+static inline bool intel_aet_pre_mount(void) { return false; }
+static inline void intel_aet_unmount(void) { }
 static inline int intel_aet_read_event(int domid, u32 rmid, void *arch_priv, u64 *val)
 {
 	return -EINVAL;
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 8b763cf638ef..cdcc5611345f 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/cpuhotplug.h>
+#include <linux/mutex.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/cpuid/api.h>
@@ -800,7 +801,7 @@ void resctrl_arch_pre_mount(void)
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_PERF_PKG].r_resctrl;
 	int cpu;
 
-	if (!intel_aet_get_events())
+	if (!intel_aet_pre_mount())
 		return;
 
 	/*
@@ -816,6 +817,25 @@ void resctrl_arch_pre_mount(void)
 	cpus_read_unlock();
 }
 
+void resctrl_arch_unmount(void)
+{
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_PERF_PKG].r_resctrl;
+	int cpu;
+
+	if (!r->mon_capable)
+		return;
+
+	intel_aet_unmount();
+
+	cpus_read_lock();
+	mutex_lock(&domain_list_lock);
+	for_each_online_cpu(cpu)
+		domain_remove_cpu_mon(cpu, r);
+	r->mon_capable = false;
+	mutex_unlock(&domain_list_lock);
+	cpus_read_unlock();
+}
+
 enum {
 	RDT_FLAG_CMT,
 	RDT_FLAG_MBM_TOTAL,
@@ -1160,8 +1180,6 @@ late_initcall(resctrl_arch_late_init);
 
 static void __exit resctrl_arch_exit(void)
 {
-	intel_aet_exit();
-
 	cpuhp_remove_state(rdt_online);
 
 	resctrl_exit();
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index f5007bea8346..c3bd3536c514 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -12,6 +12,7 @@
 #define pr_fmt(fmt)   "resctrl: " fmt
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/compiler_types.h>
 #include <linux/container_of.h>
 #include <linux/cpumask.h>
@@ -25,6 +26,7 @@
 #include <linux/io.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/printk.h>
 #include <linux/rculist.h>
 #include <linux/rcupdate.h>
@@ -293,10 +295,22 @@ static enum pmt_feature_id lookup_pfid(const char *pfname)
 	return FEATURE_INVALID;
 }
 
+/*
+ * Protects pmt_module, get_feature, put_feature against races between module
+ * load/unload of the pmt_telemetry module and mount/unmount of the resctrl
+ * file system. Also protects pmt_in_use.
+ */
+static DEFINE_MUTEX(aet_register_lock);
+
 static struct module *pmt_module;
 static struct pmt_feature_group *(*get_feature)(enum pmt_feature_id id);
 static void (*put_feature)(struct pmt_feature_group *p);
 
+/*
+ * Track whether pmt_telemetry enumeration succeeded during mount for use during unmount.
+ */
+static bool pmt_in_use;
+
 /*
  * Request a copy of struct pmt_feature_group for each event group. If there is
  * one, the returned structure has an array of telemetry_region structures,
@@ -308,7 +322,7 @@ static void (*put_feature)(struct pmt_feature_group *p);
  * struct pmt_feature_group to indicate that its events are successfully
  * enabled.
  */
-bool intel_aet_get_events(void)
+static bool aet_get_events(void)
 {
 	struct pmt_feature_group *p;
 	enum pmt_feature_id pfid;
@@ -317,14 +331,14 @@ bool intel_aet_get_events(void)
 
 	for_each_event_group(peg) {
 		pfid = lookup_pfid((*peg)->pfname);
-		p = intel_pmt_get_regions_by_feature(pfid);
+		p = get_feature(pfid);
 		if (IS_ERR_OR_NULL(p))
 			continue;
 		if (enable_events(*peg, p)) {
 			(*peg)->pfg = p;
 			ret = true;
 		} else {
-			intel_pmt_put_feature_group(p);
+			put_feature(p);
 		}
 	}
 
@@ -346,6 +360,7 @@ void intel_aet_register_enumeration(struct module *module,
 				    struct pmt_feature_group *(*get)(enum pmt_feature_id id),
 				    void (*put)(struct pmt_feature_group *p))
 {
+	guard(mutex)(&aet_register_lock);
 	get_feature = get;
 	put_feature = put;
 	pmt_module = module;
@@ -354,22 +369,55 @@ EXPORT_SYMBOL_NS_GPL(intel_aet_register_enumeration, "INTEL_PMT");
 
 void intel_aet_unregister_enumeration(void)
 {
+	guard(mutex)(&aet_register_lock);
 	pmt_module = NULL;
 	get_feature = NULL;
 	put_feature = NULL;
 }
 EXPORT_SYMBOL_NS_GPL(intel_aet_unregister_enumeration, "INTEL_PMT");
 
-void __exit intel_aet_exit(void)
+bool intel_aet_pre_mount(void)
 {
+	guard(mutex)(&aet_register_lock);
+
+	if (!get_feature || !put_feature)
+		return false;
+
+	if (!try_module_get(pmt_module))
+		return false;
+
+	if (!aet_get_events()) {
+		module_put(pmt_module);
+		return false;
+	}
+
+	pmt_in_use = true;
+
+	return true;
+}
+
+void intel_aet_unmount(void)
+{
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_PERF_PKG].r_resctrl;
 	struct event_group **peg;
 
+	guard(mutex)(&aet_register_lock);
+	if (!pmt_in_use)
+		return;
+
 	for_each_event_group(peg) {
-		if ((*peg)->pfg) {
-			intel_pmt_put_feature_group((*peg)->pfg);
-			(*peg)->pfg = NULL;
+		struct event_group *e = *peg;
+
+		if (e->pfg) {
+			for (int i = 0; i < e->num_events; i++)
+				resctrl_disable_mon_event(e->evts[i].id);
+			put_feature(e->pfg);
+			e->pfg = NULL;
 		}
 	}
+	module_put(pmt_module);
+	pmt_in_use = false;
+	r->mon.num_rmid = 0;
 }
 
 #define DATA_VALID	BIT_ULL(63)
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index a117aa98ae90..51f83d275a62 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -121,6 +121,10 @@ void resctrl_arch_pre_mount(void)
 {
 }
 
+void resctrl_arch_unmount(void)
+{
+}
+
 bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 {
 	return mpam_resctrl_controls[rid].cdp_enabled;
-- 
2.55.0

