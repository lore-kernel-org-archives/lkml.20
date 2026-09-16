Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A587C4E431B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600433; cv=none; b=qEzUcLo1d7jVd07Fb2/lqP3DA9z/CG06Fpd3h0HBUXPZ1JNftygZjJF1OABkkaF4/ucwL/QUU7GPHyqvasVapZ0N3zjJUS4In1xwOTVYRN2NTMHfHMTW9625NWjxWEqSyyopBHEUqfa3eKFjXmc7PR/0WfzJwcAJIDBS6HAE81g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600433; c=relaxed/simple;
	bh=BvIS2nxcl29o495YCUiPjDgsNeK5VhMEKlCbS6unozM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PyE/L+MOQvNDZdOn/YPZHZJedbydHtK9qWGZyikiQ2jhH+WuG9C+Gl11DYuHlDZHnvkorZq4y7FWN5yti3a9KHj/cdBMNMYIuxj5d3Aip3djFP0P9g6Fobj2Iu3fWnLyhElyaV/IS+o1YNqwiJNVDpufSxl71B2tdFT5jmqiQkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccabOQAQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccabOQAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789600429; x=1821136429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BvIS2nxcl29o495YCUiPjDgsNeK5VhMEKlCbS6unozM=;
  b=ccabOQAQTfpe0C7BdRTB4qoN+zc6eRuWm4k9/aVK1hV7/g/M69xvJGCt
   u3bwKQb0Hx+pURd/yRZMpJ5PYq0/lQkcNQym4uZ9WEhFzfPND3mAcFBTh
   UdmrFXXiUteZvH8BKHi/wouiS0CBG70A0VPNZMZ60Qlv+v1ysiw4KW8sH
   XGy4EA7lTItvSz7Fy8oEBgy5b/B+A6DebdZqPQn+hsk1Ez65yzmFAKVTO
   0eu/xSDeHzxvyP1EWS/kgrR/X09dk0HuulG5uNH/Ocj+z0HpsZEAcDYbp
   gJQEtau/3fTgywZ2fYfS2ooEejumPYWYBn2pWp3m0/Ql5eMem9NFIvf+L
   A==;
X-CSE-ConnectionGUID: e4t4vR6rRySJChS0DtlXug==
X-CSE-MsgGUID: awlTbT0mQLCnD4JLsriluA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93861461"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93861461"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:37 -0700
X-CSE-ConnectionGUID: GTU2xvclQDGq9DD4+h+TIw==
X-CSE-MsgGUID: Tytxpl+0QyWVfrQGT8DS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277231480"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:37 -0700
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
Subject: [PATCH v12 16/25] x86/resctrl: Add PMT registration API for AET enumeration callbacks
Date: Wed, 16 Sep 2026 16:13:11 -0700
Message-ID: <20260916231320.14502-17-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916231320.14502-1-tony.luck@intel.com>
References: <20260916231320.14502-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resctrl is always built-in; INTEL_PMT_TELEMETRY may be a module.  Add, and
export, register/unregister functions so the PMT module can supply/clear
enumeration callback functions when loaded/unloaded.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v12:
	No change
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

