Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443063;
	b=zPHHEfDhDxTkBcGRXhh8uT+ajezBHdvtVt/OIpwEWyL7PIakDcFqBxfvByf0SsOJkN4f
	 wXUlf5pxhgUrfrhzfKr4aIbBSxmR6cpmu4bJkNaA9XWZt+LrLBpNNOEtQO7jIC7RKXrI7
	 9nriQhPTc69zZ14Ovit3x2zge+859EPs8PbKFIAov0F5iE2+ygC045cbKAle6v0j4YMlu
	 0znw2DAOUxmMR4ucpbILfrcbtLtS2oHeDieADlUVGLOkgSUZwuSK/NVEUirm2mYcycCy/
	 vMrCYFvhbsuc0VZEz5TtMgZLZ0zMgpESi1heI50ZAhlw/HxMtKWSrx4DaYDc+Fzsm5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443063;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zLkGwWQlQEBgcI6nvlxYbxsYcppPRwQPeBNFklWYhDY=;
	b=F42CPv0dzEAmEH/pHUyUXtJd5Wm85h+sYTlTHfIbmeRid41joIACKumqjCULR+c41wk8
	 I/blAwMbMOa69QKDjNdRw5vP6CeCLl9PRVUfheFlRFnd3z+DUjTWr8tHwh170tfB6j5gw
	 Uw2mdf0n/z7xQRZy8aeGCu8AVNV6DKTwXwjVpn89zBebOxGoAkTgqq5aK3oG84HuFQwKe
	 gcsfmV7Ot+hA9B7fjMHriZ7ZkKzOrOtDI6XD5bNEX9V2RoZe1m0AI95VGnVHbkW7WyaT4
	 RoTe5MA8r8fFI5+7WN89ozQGAszP8MqhnIKcBT5oj9nebNSg1mJe9yvh+ichFFXI9oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hmk6LV2l;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B52B60A260D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B52B60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hmk6LV2l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443063; x=1823979063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TkSykW4OcbgFiLj6h6Ry5RxKzZ82YyNs/+5LQ/ibGDc=;
  b=hmk6LV2lP92F2fIfuRbhQutjYvFKiYSBIgcqGktPpXB7dJCiW8NwegRH
   DOzJrpoFdF9sb4blHOkX0H3ibr6RjATtFb1AgFME7c4jRN4NlEfsRjojh
   S71RFzYyf7Mt4Tz3WBWMPa8ZRCSyAJtotLFgF9WtJbdNlzIP8E6EXCpF3
   UExM67OgBf0SWaszAL5EVnvrm8iWo96doPiMK82iK1BHW0CfJNdDbojG8
   rPoYcAbcCj9VxN4S0YxwLGQ2AhE4bEtlYl3aZPzhgrMwwJZGWhqjGLrik
   A7izA5oL/cdz2TLRN8Tc+0bAq4tfVp073Mo+V2mS8GV0nphX05vtaV3e9
   A==;
X-CSE-ConnectionGUID: 9kxoRGw4RSyqpqSa1WFHrw==
X-CSE-MsgGUID: IQsr8pzqSbKvruHiqGlMVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131247"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131247"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:50 -0700
X-CSE-ConnectionGUID: ViPiIJ4XSY2vpgtaxMEa/Q==
X-CSE-MsgGUID: Kh5SFARASEyLPMk2SOuRTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008667"
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
Subject: [PATCH v14 15/24] x86/resctrl: Add PMT registration API for AET enumeration callbacks
Date: Mon, 19 Oct 2026 13:50:22 -0700
Message-ID: <20261019205031.16977-16-tony.luck@intel.com>
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

resctrl is always built in and calls into the pmt_telemetry driver to
enumerate Application Energy Telemetry (AET) features. Built-in code cannot
call directly into a module, so AET support requires
CONFIG_INTEL_PMT_TELEMETRY=y.

In preparation for allowing pmt_telemetry to be built as a module, add and
export functions with which pmt_telemetry registers its enumeration
callbacks when it is loaded and unregisters them when it is unloaded.
Record the registering module so that resctrl can hold a reference on it
while it uses the callbacks.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	New commit message.
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
index 9f0829a82cb0..996a7ee544bf 100644
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
@@ -325,6 +327,10 @@ static enum pmt_feature_id lookup_pfid(const char *pfname)
 	return FEATURE_INVALID;
 }
 
+static struct module *pmt_module;
+static struct pmt_feature_group *(*get_feature)(enum pmt_feature_id id);
+static void (*put_feature)(struct pmt_feature_group *p);
+
 /*
  * Request a copy of struct pmt_feature_group for each event group. If there is
  * one, the returned structure has an array of telemetry_region structures,
@@ -359,6 +365,24 @@ bool intel_aet_get_events(void)
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
2.56.0

