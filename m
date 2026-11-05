Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874047;
	b=bAvBPOsiGAGgUorNsTi4DwkD++rac15uEm+Txa8jQScgnRJtJQVyb9fnwe2SCefhyW4J
	 ZKZ8CuTRCG50WA5alvTthKBAm0H1wruKcezHqX94xmPfIJWVd+2zThHzaPIjhPMz404Gx
	 cyZuATgcwj3PREdoTz7nN5z3fSR6l6dTRgxN4pGBMTTpjBE81kJTES87ubmwkX9piAIcM
	 7HLk+VzdJ6CP4e12BGLsZXE+ze5TT40V8b6ZQq1ION8irHchh164YYh+WUeybV19QUmty
	 4vkK/I5SBCR5M2X2kxOIfZlI0Ky3aEzSXkrMkifh+34KkGNCiOBVBrxuGPimhMIOFzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874047;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8aBanT15VsNOxxNDyG0x1qGGvRswfohIN/oJLkopAqQ=;
	b=OVbymSXRTzxXEWSPcv1jF5YtqjfjtECw+DS2kiF1VGloorzs9iWYZHQL3ui8Z+J+DSRJ
	 coAbNstUBjeLeC/gZl+ljxFgdOlr2R1wkUVnOuHbSpIAmqkXnde/4JNzH/FiZKYGHmsyu
	 4fJ2qlRQPcxyeihpiTsg22JqSqWC8lx/M4JEMrZRrt+laru/SNvBWssUw1KekPg41vnYM
	 unm9+rr1cz8xEFrdFcOuFAXztgmtbm72xAOYcc1RNxpeckADYFQcTXBcq6aOo8PvATD7S
	 61Z+7EmFtxFGlRPMpzq26WalNMc6asfDeBDPR7jQMGqVX1jBVTYpGmpjzAIO3+853VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iYrcPyOS;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17AB606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F17AB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iYrcPyOS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793874047; x=1825410047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RuKdJwX/5y4/FXp7Qkne8H8JiYcuzXFsKHBoI57TM28=;
  b=iYrcPyOS+MTHTKfVGvZhTw3qa9mMDSWmqCG1y83We4MKWOGXzJo7gHgC
   YYVUvFoqrJaDFwnVPZ7Xycjlnmv4mD2gnnS6ecpGYLKlJGAvRT5wAyHyQ
   scJUKB8KpD/NBK1uTE3itVIKrSmNBDUZURr6aMw0N1RfZ58DzmYVPKZoQ
   a/O4TE9AopV8isSCEPMRfrE68QCtP3Z8lHpOYsqyBBOKeZK3aiEaMYDn3
   Vdxh81x0PZbYPyJ/cRyrsTv4d5Mg8SzH/Kh5kzeWq1frQa8tKeFWLvI+/
   lqhpq9QVLT/4yY5vvgaP8juX6yOIfuG93c4Dh1Tn2W1v10xC8mpoeZPHU
   A==;
X-CSE-ConnectionGUID: 5gB5ZUq2TIqBGD56EKdh2A==
X-CSE-MsgGUID: rLpQD54cSPWVOZfdeAqUEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2530319"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2530319"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:20:47 -0800
X-CSE-ConnectionGUID: B3p/LI5ZSZGcE5d6KaC5UQ==
X-CSE-MsgGUID: oLyT6AGyQzGOLHiToW6PgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7143796"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2026 02:20:43 -0800
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 10/12] x86/resctrl: Introduce erdt_cpu_has() and erdt_support()
Date: Thu,  5 Nov 2026 18:09:43 +0800
Message-Id: <45db038115288e78f20d88b286a9afcbab0d8848.1793864720.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793864720.git.yu.c.chen@intel.com>
References: <cover.1793864720.git.yu.c.chen@intel.com>
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

Introduce erdt_cpu_has() to verify if a specific RDT feature is backed by an
ERDT table. A feature is only reported as ERDT backed when the CPU enumerates it
via CPUID and firmware describes it in the ERDT table (and its sub-tables).
erdt_cpu_has() also considers userspace input like "rdt=!cmt". Similar to
rdt_cpu_has(), erdt_cpu_has() expects an x86 feature flag as parameter.

Introduce erdt_support() as a helper called by erdt_cpu_has() to check whether
the ERDT firmware supports a given feature.

erdt_support() deliberately claims no feature yet and returns false. Features
should be added to erdt_support() as their MMIO implementations are introduced.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v9:
- Drop the erdt_get_scale() context: the ERDT scale is now introduced
  after this patch by "x86/resctrl: Add the ERDT CMT scale". No code
  change. (Reinette Chatre)

 arch/x86/kernel/cpu/resctrl/core.c     | 13 +++++++++++--
 arch/x86/kernel/cpu/resctrl/erdt.c     |  5 +++++
 arch/x86/kernel/cpu/resctrl/internal.h |  2 ++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index a2b012c94680..c71d6626c330 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -873,9 +873,8 @@ static int __init set_rdt_options(char *str)
 }
 __setup("rdt", set_rdt_options);
 
-bool rdt_cpu_has(int flag)
+static bool apply_rdt_options(int flag, bool ret)
 {
-	bool ret = boot_cpu_has(flag);
 	struct rdt_options *o;
 
 	if (!ret)
@@ -893,6 +892,16 @@ bool rdt_cpu_has(int flag)
 	return ret;
 }
 
+bool rdt_cpu_has(int flag)
+{
+	return apply_rdt_options(flag, boot_cpu_has(flag));
+}
+
+bool erdt_cpu_has(int flag)
+{
+	return apply_rdt_options(flag, boot_cpu_has(flag) && erdt_support(flag));
+}
+
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
 {
 	if (!rdt_cpu_has(X86_FEATURE_BMEC))
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index ef7f51fde838..107d599bf586 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -36,6 +36,11 @@ static u16 first_rmdd_domain_id;
 /* Largest RMID that is valid in every ERDT domain. */
 static unsigned int erdt_max_rmid;
 
+bool erdt_support(int flag)
+{
+	return false;
+}
+
 static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
 {
 	void __iomem *addr;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 527e3ac91b26..fe8a4c1dd46b 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -291,6 +291,8 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
 static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
 #endif
 
+bool erdt_cpu_has(int flag);
+bool erdt_support(int flag);
 void erdt_init(void);
 void erdt_exit(void);
 bool erdt_try_bind_domain(int cpu);
-- 
2.25.1

