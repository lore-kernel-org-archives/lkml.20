Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8639754B1C5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704375; cv=none; b=KhTlaJoQAIbS0OTjNg4bkFqKRglCqkpYE4/aaQWpOw7sGJ4hf49qC9DoMjtb6si3MQsBk2b8PmU9uKTEQNAGcy39U/0SpVPaj/2TOHgFxDak3EoJcm0qwjrq4IWItbUtoj9XHWXuqxGKcQq2yveaPrV6Sr2tmA7TJnzUcKYcAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704375; c=relaxed/simple;
	bh=wB0XMC/VPIxVRWz6Y+0bhTglmvhHnEq1xJQmoj3EaFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSefoHAQcV13H06hoDIxkJtEtklNtyHYyQnHgCl5MQQPV8DfXOLaJy0eHoyOniHRGifPGnWiHKckx8Xhoc8MVRIL+4v1zCZkZcUMNjPP+1jFdV9+O7O46DR4hJZF11e0+dBQnrBMGC212einidWASJ8bpWmW85GJxZJkKtnba5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzxXNTE5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzxXNTE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790704369; x=1822240369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wB0XMC/VPIxVRWz6Y+0bhTglmvhHnEq1xJQmoj3EaFg=;
  b=GzxXNTE5BvOWrYcE53P4L8VplT0korsakR3OrgOKCRMswIeyj4CGv/Z7
   VFgI0KFy4GZh94g+iu7VM8gVjcK/Q7Cq1N6qsK1pPPxV+wwII2FqAjZDU
   0iOJT7PjVBLGWonuaEXdjy6EmBgVqKNKLdWZujJqI1JTKEqTAenoflJDU
   hKq1j5PgFdwy2iLfpRl804ZQna+3z4inGS10H61VIzK3dBB2F56PotDtB
   4hrmVNQuBEt8KIBQP2Efb9gW5q2kCguWS2hAk/+tC2/Ps52pLg4V2WJ4y
   X9htgZ3lqH+FUhdP1Ke6hUG+CXoHAlnbPyh4SGBqzTjeliDPBk5Wekkpp
   w==;
X-CSE-ConnectionGUID: 5Lxe5/+YRXGVEAV4QN3+Mw==
X-CSE-MsgGUID: vSOYhdyiRm635Oyuxpz0IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90294414"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90294414"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 10:52:49 -0700
X-CSE-ConnectionGUID: fRGLoHpHRO2Z9Ig1i8gfrQ==
X-CSE-MsgGUID: n6DPUhMdS4a0u6E5MjSJxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274649282"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.222.232])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 10:52:49 -0700
From: Tony Luck <tony.luck@intel.com>
To: tony.luck@intel.com
Cc: Dave.Martin@arm.com,
	babu.moger@amd.com,
	david.e.box@intel.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	hch@infradead.org,
	james.morse@arm.com,
	linux-kernel@vger.kernel.org,
	maciej.wieczor-retman@intel.com,
	patches@lists.linux.dev,
	peternewman@google.com,
	reinette.chatre@intel.com,
	x86@kernel.org,
	yu.c.chen@intel.com
Subject: [PATCH v14.1 21/25] x86/resctrl: Export interface to report telemetry unbind/remove
Date: Tue, 29 Sep 2026 10:52:44 -0700
Message-ID: <20260929175244.16599-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928221509.68002-22-tony.luck@intel.com>
References: <20260928221509.68002-22-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux allows devices to be unbound from drivers, even if the modules
cannot be unloaded because of reference counts.

For telemetry this results in teardown of the virtual address mappings
of the MMIO regions which hold the event counters. Subsequent access
to these counters will page fault.

Export intel_aet_invalidate() for the pmt_telemetry module to inform
resctrl when invalidation is about to happen.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	Dropped aet_mmio_lock. Now safe to use aet_lock.
---
 include/linux/intel_vsec.h              |  2 ++
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 27 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index c04b1d0f3143..bcbf4937c71c 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -262,11 +262,13 @@ void intel_aet_register_enumeration(struct module *module,
 				    struct pmt_feature_group *(*get)(enum pmt_feature_id id),
 				    void (*put)(struct pmt_feature_group *p));
 void intel_aet_unregister_enumeration(void);
+void intel_aet_invalidate(u8 package_id);
 #else
 static inline void intel_aet_register_enumeration(struct module *module,
 						  struct pmt_feature_group *(*get)(enum pmt_feature_id id),
 						  void (*put)(struct pmt_feature_group *p)) { }
 static inline void intel_aet_unregister_enumeration(void) { }
+static inline void intel_aet_invalidate(u8 package_id) { }
 #endif /* CONFIG_X86_CPU_RESCTRL_INTEL_AET */
 
 #endif
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 756832f6d51d..f7895adefa73 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -305,6 +305,7 @@ static enum pmt_feature_id lookup_pfid(const char *pfname)
  * Serialises AET's view of pmt_telemetry:
  *   - pmt_module, get_feature, put_feature, pmt_in_use
  *   - every event_group's ->pfg
+ *   - the telemetry_region::addr entries reachable through ->pfg
  *
  * Lock ordering with pmt/telemetry.c's ep_lock is ep_lock -> aet_lock.
  * AET therefore must not call get_feature() (which takes ep_lock) while
@@ -379,6 +380,30 @@ void intel_aet_unregister_enumeration(void)
 }
 EXPORT_SYMBOL_NS_GPL(intel_aet_unregister_enumeration, "INTEL_PMT");
 
+/*
+ * pmt_telemetry driver calls while holding ep_lock. This is for unbind/remove
+ * operations that will invalidate the virtual addresses of MMIO registers
+ * provided by intel_pmt_get_regions_by_feature().
+ */
+void intel_aet_invalidate(u8 package_id)
+{
+	struct event_group **peg;
+
+	guard(mutex)(&aet_lock);
+
+	for_each_event_group(peg) {
+		struct event_group *e = *peg;
+
+		if (!e->pfg)
+			continue;
+		for (int i = 0; i < e->pfg->count; i++) {
+			if (e->pfg->regions[i].plat_info.package_id == package_id)
+				e->pfg->regions[i].addr = NULL;
+		}
+	}
+}
+EXPORT_SYMBOL_NS_GPL(intel_aet_invalidate, "INTEL_PMT");
+
 bool intel_aet_pre_mount(void)
 {
 	struct pmt_feature_group *(*get)(enum pmt_feature_id id);
@@ -454,6 +479,8 @@ int intel_aet_read_event(int domid, u32 rmid, void *arch_priv, u64 *val)
 	void *pevt0;
 	u32 idx;
 
+	guard(mutex)(&aet_lock);
+
 	pevt0 = pevt - pevt->idx;
 	e = container_of(pevt0, struct event_group, evts);
 	idx = rmid * e->num_events;
-- 
2.55.0

