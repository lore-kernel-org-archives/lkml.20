Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443069;
	b=IL7DV4R52+4VRtKS6v/0H4J6daQ2h1fMWqHPW/P5SKLu1CnDcqkCR+cZImZAypaV3i6P
	 21WdMfo6NAfWy+/m2SIV5C5zkycNN2qDU7Ae+mXDS+qLg+eNdEG1dQtYbZWbfogGyPST1
	 rHC/WCLsFAtJBkH6jIcSALMHsHQU56l+NK0Tnb94MlK3xPhdxUtfRicNIz3ihXePcQbe1
	 90a5o+sIh95BrBvTnnUlRiijpt7wySy0DPrmjtVI46D+JSgTOS0bo+xlRad/WGI4A7FrR
	 Lx5Vi1K9nSctPk9y+oOxR9XmuEACzzEIFSWhnNZYPno9Gw6JUnErmJd3VBWOkQRbsbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443069;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jzcC2Eofur3/gHRUHWU0aImbOTkzsRIbkow1EacurcQ=;
	b=UUxy8dUE4tHtCSGS2nJGlrOLOMt7K5tAhf2yNLgIR3syPOX3BQhJZO5gouSfTQ5Gi+3m
	 jpkqG7EDvCPXXr7/TzuVj3FMtSNehR+FyC73tmpRACddAfJBvHvIoBBm6QukSa6s0U047
	 BUHg4ftLwLL25fqKhCWJzQgoE1aFDnegc80qH4IGpTgAeCjwpSdRJa0G7P0ib1Hb6YX/l
	 oTBGyy+hCKoAntRd20c5p9ZdRYwM4gaxyiUPaaBUmnu+FB/jrvlW+jC87OVsMdiyyDqdg
	 kMvyEme5+T89Oj0Er2O1PYRSTv1lvVAvj34hLvdvHUiQz2v8VwXDYBhlNCHJlsnorHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DOb7sSOQ;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B797F60A381E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B797F60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DOb7sSOQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443069; x=1823979069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v0WJ9AQWvBfYKzr/Znts6idoP+yJW0SsETXRqNBk0mQ=;
  b=DOb7sSOQvOdg/eEoDBg40cAVfyFHOky6Fo8GmlFgBrcNsMigqgk0qWV5
   IXAKsQJZ2BqHxXB6b9eAf86446s0dtuy/7OxbyxbM6V9we6wAQaCcNWtG
   B90adrFj1qF+1MoVCrr1FTmxwgomXf2MpX9/9D3xt2xBv/18vuAtt4G5E
   1mxCvlyoTBHdRbi6kqNGKJPqoPNnfzZwx9p+0sNh0DhKHqJz73nW+mvCR
   CFrU9A7QEoZPPoevUAHYSd/YJwgZz1gysQLbqp1YgtohSEKPxpGi4JDDC
   swxTgLO6bKiPpztqo+L+o3CLFovc12p0/z0+AEYq9amFPlgZFEnG4FcXw
   g==;
X-CSE-ConnectionGUID: 2knI/+TrR3+xrXpyndJAXA==
X-CSE-MsgGUID: w4V1MV4cTFeh5w9TYGAcAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131290"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131290"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:51 -0700
X-CSE-ConnectionGUID: 6kOhtl5XRpSAr4b6VNq5BQ==
X-CSE-MsgGUID: pz22+bNSSFKkYTYLnfrcLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008685"
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
Subject: [PATCH v14 20/24] x86/resctrl: Export interface to report telemetry unbind/remove
Date: Mon, 19 Oct 2026 13:50:27 -0700
Message-ID: <20261019205031.16977-21-tony.luck@intel.com>
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

resctrl obtains the addresses of the telemetry MMIO regions from the
pmt_telemetry driver at mount time and holds a reference on the module
until unmount, so the module cannot be unloaded while resctrl may read
the counters.

The module reference does not prevent a telemetry device from being
unbound from the driver, or removed. Either tears down the MMIO mappings
that hold the event counters, and a subsequent read of an event by
resctrl faults on the stale address.

Provide an interface for pmt_telemetry to report that the mappings for a
package are about to be torn down. Stop using the regions of that package
and serialize event reads with the notification so that no read uses an
address once it has been reported. Events of the affected package then
read "Unavailable".

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	Dropped aet_mmio_lock. Now safe to use aet_lock.
	New commit message
	Add code comment noting that per-package may be over-reaction.
---
 include/linux/intel_vsec.h              |  2 ++
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 30 +++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

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
index 5c88236d850f..3facb852f22b 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -339,6 +339,7 @@ static enum pmt_feature_id lookup_pfid(const char *pfname)
  * Serialises AET's view of pmt_telemetry:
  *   - pmt_module, get_feature, put_feature, pmt_in_use
  *   - every event_group's ->pfg
+ *   - the telemetry_region::addr entries reachable through ->pfg
  *
  * Lock ordering with pmt/telemetry.c's ep_lock is ep_lock -> aet_lock.
  * AET therefore must not call get_feature() (which takes ep_lock) while
@@ -413,6 +414,33 @@ void intel_aet_unregister_enumeration(void)
 }
 EXPORT_SYMBOL_NS_GPL(intel_aet_unregister_enumeration, "INTEL_PMT");
 
+/*
+ * pmt_telemetry driver calls while holding ep_lock. This is for unbind/remove
+ * operations that will invalidate the virtual addresses of MMIO registers
+ * provided by intel_pmt_get_regions_by_feature(). This simple interface may
+ * be overly broad if there are multiple telemetry devices per-package. An
+ * unbind/remove operation on one device will stop resctrl from reading
+ * event counters from all devices on the same package.
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
@@ -488,6 +516,8 @@ int intel_aet_read_event(int domid, u32 rmid, void *arch_priv, u64 *val)
 	void *pevt0;
 	u32 idx;
 
+	guard(mutex)(&aet_lock);
+
 	pevt0 = pevt - pevt->idx;
 	e = container_of(pevt0, struct event_group, evts);
 	idx = rmid * e->num_events;
-- 
2.56.0

