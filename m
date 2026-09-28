Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8604502D77
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633750; cv=none; b=qlicfWSUCOD2gYsO16KUC+u3oIt7U0Ft9YOu3D2tXuoA69hJbfs2elprudl9pU4gC2DBxxZSpqRMzB0ZISo2zdYwnI/eOJbcUzfF1q/Nkvu/Ay5BEPs2cmaKEsczKpZwj0qMP4wQD8DXUz0UeeCWnmkEZHBKZU1Xs0r0IRQgOUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633750; c=relaxed/simple;
	bh=sNszKQchq7cQtxcVzIVlVMf/t28mnexgBL7l5QdwTD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FnwPmfqniOQIuXnYr1WCKR58MHUpMMi31a48iesTYC9AfIIEaFwfbivyXCQiYqGqhqC7wmUjo3WFwpcdUiw0C8algI3V8GDXg4N52A/LDN5HYKLKjz30RpKFxm0a+EABh0CGzZd6M24gBczW1pFA7QGENXNBx/rF8CSRIRk8cA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6ICu5YU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6ICu5YU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633743; x=1822169743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sNszKQchq7cQtxcVzIVlVMf/t28mnexgBL7l5QdwTD8=;
  b=b6ICu5YUcd/RN9b/44G6T/aUroB0uBiRA5uMkOxRFa0wcOOHN9IUkdZo
   xEqoGK+nwREcrAyeQn4uzgw2lRbRl0J92kEsEn/JOHyAUf8nVsZOAz6V9
   UOAS0BBlkzAKyl62I/PsY8y6RnhOsAECOLXnC9mRU3KRzZ89TWAnir5Ao
   1gIOQU80u5Km0Xy50GH3u3uo/k/s8bByKUiWmfJHRV6rTGFgcmELuOSUI
   wmRYsDiuv35snPuxLhr3FBKkXhZJS6C4C3UmKV9efhM/t3U8NYi6In0tQ
   hgVa3GLXHCzAVHJFdMJdsN9K6jlCqwI7Y9vcKjRDP+7s0hOhtegrC0xf6
   A==;
X-CSE-ConnectionGUID: zqlQlaa3Rumz2nbgniUoUQ==
X-CSE-MsgGUID: DaHTNIwCQeqg7Tkl6C3JAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387291"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387291"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:20 -0700
X-CSE-ConnectionGUID: wCu6PmXSTmuqO44FlsoJvg==
X-CSE-MsgGUID: RxHkCz3WQLC20lcfg2FSlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685517"
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
Subject: [PATCH v13 16/25] x86/resctrl: Add PMT registration API for AET enumeration callbacks
Date: Mon, 28 Sep 2026 15:15:00 -0700
Message-ID: <20260928221509.68002-17-tony.luck@intel.com>
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

resctrl is always built-in but needs to call into the pmt_telemetry
code to enumerate Application Energy Telemetry (AET) features. Requiring
CONFIG_INTEL_PMT_TELEMETRY=y allows these calls to work.

In preparation for allowing pmt_telemetry to be built as a module, add
and export register/unregister functions. pmt_telemetry can then supply
and clear the enumeration callbacks as it is loaded and unloaded.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	Rewrote commit message using correct context at this point in the series.
	Use "pmt_telemetry" throughout.
---
 include/linux/intel_vsec.h              | 12 ++++++++++++
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 24 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 843cda8f8644..c04b1d0f3143 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -257,4 +257,16 @@ static inline void
 intel_pmt_put_feature_group(struct pmt_feature_group *feature_group) {}
 #endif
 
+#ifdef CONFIG_X86_CPU_RESCTRL_INTEL_AET
+void intel_aet_register_enumeration(struct module *module,
+				    struct pmt_feature_group *(*get)(enum pmt_feature_id id),
+				    void (*put)(struct pmt_feature_group *p));
+void intel_aet_unregister_enumeration(void);
+#else
+static inline void intel_aet_register_enumeration(struct module *module,
+						  struct pmt_feature_group *(*get)(enum pmt_feature_id id),
+						  void (*put)(struct pmt_feature_group *p)) { }
+static inline void intel_aet_unregister_enumeration(void) { }
+#endif /* CONFIG_X86_CPU_RESCTRL_INTEL_AET */
+
 #endif
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index 4ad6ad78e93e..6c4f0bf3b876 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -17,12 +17,14 @@
 #include <linux/cpumask.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/export.h>
 #include <linux/gfp_types.h>
 #include <linux/init.h>
 #include <linux/intel_pmt_features.h>
 #include <linux/intel_vsec.h>
 #include <linux/io.h>
 #include <linux/minmax.h>
+#include <linux/module.h>
 #include <linux/printk.h>
 #include <linux/rculist.h>
 #include <linux/rcupdate.h>
@@ -291,6 +293,10 @@ static enum pmt_feature_id lookup_pfid(const char *pfname)
 	return FEATURE_INVALID;
 }
 
+static struct module *pmt_module;
+static struct pmt_feature_group *(*get_feature)(enum pmt_feature_id id);
+static void (*put_feature)(struct pmt_feature_group *p);
+
 /*
  * Request a copy of struct pmt_feature_group for each event group. If there is
  * one, the returned structure has an array of telemetry_region structures,
@@ -325,6 +331,24 @@ bool intel_aet_get_events(void)
 	return ret;
 }
 
+void intel_aet_register_enumeration(struct module *module,
+				    struct pmt_feature_group *(*get)(enum pmt_feature_id id),
+				    void (*put)(struct pmt_feature_group *p))
+{
+	get_feature = get;
+	put_feature = put;
+	pmt_module = module;
+}
+EXPORT_SYMBOL_NS_GPL(intel_aet_register_enumeration, "INTEL_PMT");
+
+void intel_aet_unregister_enumeration(void)
+{
+	pmt_module = NULL;
+	get_feature = NULL;
+	put_feature = NULL;
+}
+EXPORT_SYMBOL_NS_GPL(intel_aet_unregister_enumeration, "INTEL_PMT");
+
 void __exit intel_aet_exit(void)
 {
 	struct event_group **peg;
-- 
2.55.0

