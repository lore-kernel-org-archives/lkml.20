Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443069;
	b=NpGK2iSQucLWiKJnWWubA8Amm7vVBTUnJKJ34HahxtUKcsxuxXiSH9+5vGYwD5/XhoNO
	 lGeOdBYeqkNd3N8cwVsqlYSgtkC5D7cHvt2l/n7cL3owsbiIP9KrlgdN/Wji5hkZxI+DV
	 2xED06MeqKA56CJTGJ6ej17VoHY5wG8o0ohjohLzOrYtuPiruDcVjGZCIc8Wxw1IRw/cf
	 z/5/hJRX6uySN0CRND/AesEFNvzQGqyYaAXTuDKkqfOh+IuYfUGdMcqjUBhDe/ig+6n6Y
	 yLWzfT2UV2oGSj52tlt8Y0ZeXGY/qfBGerWhZza+veAlMuCAJh4IncRvMGNGASap/Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443069;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O8MnCrw/uL1eSqnXleCabfh7IoVpANIESipVjJiTHUo=;
	b=h+UQQpsjW0PbFQmjfRJbmx39AVdcUUQirnLk8HDmMRI7yvc53rGBHL/lReBHdl6ebJvG
	 DFjHuZJdkasUxEEVCCikqAecJsmtr9U3QFRSg/G6RwvIfX25AQvY+1/O2lSqAsu56Rt/H
	 LRFEDKRpxf24+0uOTZYZ2aeGLMkKHSvHQo7OymIdTrKCc+VKNeV58JonOBA4PEBE951lD
	 OANCifDg5r0x+pou3NrSki9Kzx9FA/r1G576j5WcYPsGTd8Bf5Ex965vgmTb6HnF9yrGg
	 g8ymKuakjYG9LV5yy65j2ghxsJfg3MGE/HMI+eWBIey8WrlCpYTem4xn9lPaCZSP3Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RdOpDkb5;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74560A263A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA74560A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RdOpDkb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443064; x=1823979064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z5eVgcyeURbp1EBb6CVVtLj6tX+2DWokVj5q47Fgr0U=;
  b=RdOpDkb5OQAJ0B/3S514EZF3HuwmbmsVD0o+AFKKzhw5GJrlSmLMikx2
   GTTMP3J5ab/gvrUDv55cdvV8hedDavJU59ExJ7JpJF2hqLe8fdSjCezqC
   GOf3lG8rZ5XxZETWXBBBVFwcyq23JP0GC0IDRQIlszdutH69ey5LvwwVl
   pQcJguCRbv/37JR64K66kNeNYHNJ6XYzxCOmWtHtnoKZNx+6iW0snBJTb
   SJjjnkjwCe790knWXZIYN2IacA+yWg04nLk80CAhzMoAW4SC8wdXPYGaU
   s2Z0RZ/FkiWZd0p3ECsLWsUc9oRg8/66LzJlGL1KdJTif00nK5+gPeOfJ
   Q==;
X-CSE-ConnectionGUID: uZvFIoyVQ/CgIITJsSwrpw==
X-CSE-MsgGUID: d/ammBsITwuAyEKI0aFzGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131264"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131264"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:51 -0700
X-CSE-ConnectionGUID: vvV7bJFiQ4O9rkHS0bo/AA==
X-CSE-MsgGUID: 2gwh/8dQR/W5fhNQ3auhRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008674"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:51 -0700
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
Subject: [PATCH v14 17/24] x86/resctrl: Use registered function pointers for AET enumeration
Date: Mon, 19 Oct 2026 13:50:24 -0700
Message-ID: <20261019205031.16977-18-tony.luck@intel.com>
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

resctrl enumerates Application Energy Telemetry (AET) features by calling
pmt_telemetry functions directly. pmt_telemetry now also registers these
functions with resctrl when it is loaded.

Calling them directly requires pmt_telemetry to be built in.

In preparation for pmt_telemetry being built as a loadable module, call the
registered functions instead. Serialize registration and unregistration
against enumeration. Take a reference on the pmt_telemetry module before
enumerating, so that the functions cannot be unregistered while resctrl
uses them.

AET support still requires pmt_telemetry to be built in, so it does not yet
matter that the module reference is never dropped after a successful
enumeration. It must be dropped on unmount before pmt_telemetry can be built
as a module.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	Updates to resolve locking problems reported by Sashiko in v13.

	AET is now going to use a single mutex for both registration
	and in a later patch for device removal. So change the name
	from aet_register_lock to just aet_lock.

	Reverse locking hierarchy between AET and pmt_telemetry.
	No longer OK to call into pmt_telemetry to enumerate
	features with the aet_lock held. Instead, make use of
	module pinning while holding aet_lock.

	New commit message
---
 arch/x86/kernel/cpu/resctrl/internal.h  |  4 +-
 arch/x86/kernel/cpu/resctrl/core.c      |  2 +-
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 59 ++++++++++++++++++++++---
 3 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index c038b7d80ce3..8406addc05f5 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -234,15 +234,15 @@ void rdt_domain_reconfigure_cdp(struct rdt_resource *r);
 void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r);
 
 #ifdef CONFIG_X86_CPU_RESCTRL_INTEL_AET
-bool intel_aet_get_events(void);
 void __exit intel_aet_exit(void);
+bool intel_aet_pre_mount(void);
 int intel_aet_read_event(int domid, u32 rmid, void *arch_priv, u64 *val);
 void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resource *r,
 				struct list_head *add_pos);
 bool intel_handle_aet_option(bool force_off, char *tok);
 #else
-static inline bool intel_aet_get_events(void) { return false; }
 static inline void __exit intel_aet_exit(void) { }
+static inline bool intel_aet_pre_mount(void) { return false; }
 static inline int intel_aet_read_event(int domid, u32 rmid, void *arch_priv, u64 *val)
 {
 	return -EINVAL;
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 0262174df7ad..ac67b4523b2d 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -795,7 +795,7 @@ void resctrl_arch_pre_mount(void)
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_PERF_PKG].r_resctrl;
 	int cpu;
 
-	if (!intel_aet_get_events())
+	if (!intel_aet_pre_mount())
 		return;
 
 	/*
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 996a7ee544bf..26406e18d5ed 100644
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
@@ -327,6 +329,18 @@ static enum pmt_feature_id lookup_pfid(const char *pfname)
 	return FEATURE_INVALID;
 }
 
+/*
+ * Serialises AET's view of pmt_telemetry:
+ *   - pmt_module, get_feature, put_feature
+ *   - every event_group's ->pfg
+ *
+ * Lock ordering with pmt/telemetry.c's ep_lock is ep_lock -> aet_lock.
+ * AET therefore must not call get_feature() (which takes ep_lock) while
+ * holding aet_lock. put_feature() does not take ep_lock and may be
+ * invoked with aet_lock held.
+ */
+static DEFINE_MUTEX(aet_lock);
+
 static struct module *pmt_module;
 static struct pmt_feature_group *(*get_feature)(enum pmt_feature_id id);
 static void (*put_feature)(struct pmt_feature_group *p);
@@ -342,7 +356,8 @@ static void (*put_feature)(struct pmt_feature_group *p);
  * struct pmt_feature_group to indicate that its events are successfully
  * enabled.
  */
-bool intel_aet_get_events(void)
+static bool aet_get_events(struct pmt_feature_group *(*get)(enum pmt_feature_id id),
+			   void (*put)(struct pmt_feature_group *p))
 {
 	struct pmt_feature_group *p;
 	enum pmt_feature_id pfid;
@@ -351,14 +366,16 @@ bool intel_aet_get_events(void)
 
 	for_each_event_group(peg) {
 		pfid = lookup_pfid((*peg)->pfname);
-		p = intel_pmt_get_regions_by_feature(pfid);
+		p = get(pfid);
 		if (IS_ERR_OR_NULL(p))
 			continue;
 		if (enable_events(*peg, p)) {
-			(*peg)->pfg = p;
+			scoped_guard(mutex, &aet_lock) {
+				(*peg)->pfg = p;
+			}
 			ret = true;
 		} else {
-			intel_pmt_put_feature_group(p);
+			put(p);
 		}
 	}
 
@@ -369,6 +386,7 @@ void intel_aet_register_enumeration(struct module *module,
 				    struct pmt_feature_group *(*get)(enum pmt_feature_id id),
 				    void (*put)(struct pmt_feature_group *p))
 {
+	guard(mutex)(&aet_lock);
 	get_feature = get;
 	put_feature = put;
 	pmt_module = module;
@@ -377,19 +395,50 @@ EXPORT_SYMBOL_NS_GPL(intel_aet_register_enumeration, "INTEL_PMT");
 
 void intel_aet_unregister_enumeration(void)
 {
+	guard(mutex)(&aet_lock);
 	pmt_module = NULL;
 	get_feature = NULL;
 	put_feature = NULL;
 }
 EXPORT_SYMBOL_NS_GPL(intel_aet_unregister_enumeration, "INTEL_PMT");
 
+bool intel_aet_pre_mount(void)
+{
+	struct pmt_feature_group *(*get)(enum pmt_feature_id id);
+	void (*put)(struct pmt_feature_group *p);
+	struct module *mod;
+
+	/*
+	 * Snapshot the callbacks and pin the pmt_telemetry module under
+	 * aet_lock. The module reference keeps pmt_telem_exit() from
+	 * running intel_aet_unregister_enumeration() and changing these
+	 * pointers, so the snapshot remains valid after dropping aet_lock.
+	 */
+	scoped_guard(mutex, &aet_lock) {
+		if (!get_feature || !put_feature)
+			return false;
+		if (!try_module_get(pmt_module))
+			return false;
+		mod = pmt_module;
+		get = get_feature;
+		put = put_feature;
+	}
+
+	if (!aet_get_events(get, put)) {
+		module_put(mod);
+		return false;
+	}
+
+	return true;
+}
+
 void __exit intel_aet_exit(void)
 {
 	struct event_group **peg;
 
 	for_each_event_group(peg) {
 		if ((*peg)->pfg) {
-			intel_pmt_put_feature_group((*peg)->pfg);
+			put_feature((*peg)->pfg);
 			(*peg)->pfg = NULL;
 		}
 	}
-- 
2.56.0

