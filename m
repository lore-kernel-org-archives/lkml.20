Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09765502D65
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633737; cv=none; b=FRzMv01fhZkHzRll7BABRO8k8IYTzeYnSEBH4DjSTtbO02PCSOvj4I8h/SkjefirI8X9QqC30zRdTrEuPirWPNFK87/eRCeQsmA9SjQpIovrSenp5EBfIyMZJZ8FSs+tqt5XfhAyrg5TvV1dTwLl7IxLpcsvObHPfNLz9mQc2MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633737; c=relaxed/simple;
	bh=ORcn5Bqc+X6QEQ4Z9MnWRaiUpiUs1Wz3q6TdqweOMv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFXOQbPWUe6OgsOHyCI299RH3ZdZ7ZMvI8Mt1CmqzO1xJDfuurqaAYnfe0OHIRnY+8GehuTNMFHZDBi1FIRKrdIzFoZr8kyho0oQdC6LG5vNKQuMndqvogcu3bKeoD6nDGbPPuA4yEuqRmB3bIOA71XXWbf9r2zrxXgqyK97G14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwKahoR8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwKahoR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633734; x=1822169734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ORcn5Bqc+X6QEQ4Z9MnWRaiUpiUs1Wz3q6TdqweOMv4=;
  b=mwKahoR8gAmHTPiQh/4ku05c7fCx+rVpqoVLcTHCZmaiZRCtAU+o0esK
   DnkRaEFy6e6y6piyNkw8mVqsy4u7+N+9O3P1SoBwFI3GzdQtEIxp14MzY
   zO4BASCW8SMFEJne0bCIIDJfoMeTLUJ0TqPav3jA1O9BaZfpfaVgOSgs4
   gzzONaIyRUESt463yHZrurvKprkxrU433kW/Leko39wYOqusU2B2JJZNp
   YaFAIeimb/KMVVYASCKgOxBNwkWEifT7MPLJJrogbyAduDME+gX/u0Rf/
   Z+wAuvejGsOVbs4+NR02BYo4yegD4PproQDiUg5DG2NGxO771jkdptjxM
   Q==;
X-CSE-ConnectionGUID: I3awb7+VTEmkN7siOqMf4Q==
X-CSE-MsgGUID: pi/TcpCGRxuilPTg225YVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387235"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387235"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:19 -0700
X-CSE-ConnectionGUID: 5rOpH4jNQjGQT0YF0VmoNQ==
X-CSE-MsgGUID: zLXYvyaeSKWkhz1D+KQysw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685490"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.222.143])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:18 -0700
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
Subject: [PATCH v13 09/25] x86/resctrl: Delete rdt_alloc_capable and rdt_mon_capable
Date: Mon, 28 Sep 2026 15:14:53 -0700
Message-ID: <20260928221509.68002-10-tony.luck@intel.com>
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

These global variables have been replaced with resctrl_alloc_capable() or
resctrl_mon_capable(), delete the global declarations.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	Expand commit message.
---
 arch/x86/include/asm/resctrl.h        |  2 --
 arch/x86/kernel/cpu/resctrl/core.c    | 13 +++----------
 arch/x86/kernel/cpu/resctrl/monitor.c |  6 ------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 9c44a7766631..8c3b51398ddc 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -42,8 +42,6 @@ struct resctrl_pqr_state {
 
 DECLARE_PER_CPU(struct resctrl_pqr_state, pqr_state);
 
-extern bool rdt_alloc_capable;
-extern bool rdt_mon_capable;
 extern unsigned int rdt_l3_mon_scale;
 
 DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index f2bf160d01c1..2e3b9c16cbda 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -45,12 +45,6 @@ static DEFINE_MUTEX(domain_list_lock);
  */
 DEFINE_PER_CPU(struct resctrl_pqr_state, pqr_state);
 
-/*
- * Global boolean for rdt_alloc which is true if any
- * resource allocation is enabled.
- */
-bool rdt_alloc_capable;
-
 static void mba_wrmsr_intel(struct msr_param *m);
 static void cat_wrmsr(struct msr_param *m);
 static void mba_wrmsr_amd(struct msr_param *m);
@@ -781,7 +775,6 @@ void resctrl_arch_pre_mount(void)
 	cpus_read_lock();
 	mutex_lock(&domain_list_lock);
 	r->mon_capable = true;
-	rdt_mon_capable = true;
 	for_each_online_cpu(cpu)
 		domain_add_cpu_mon(cpu, r);
 	mutex_unlock(&domain_list_lock);
@@ -1026,10 +1019,10 @@ static __init void check_quirks(void)
 
 static __init bool get_rdt_resources(void)
 {
-	rdt_alloc_capable = get_rdt_alloc_resources();
-	rdt_mon_capable = get_rdt_mon_resources();
+	bool alloc = get_rdt_alloc_resources();
+	bool mon = get_rdt_mon_resources();
 
-	return (rdt_mon_capable || rdt_alloc_capable);
+	return alloc || mon;
 }
 
 static __init void rdt_init_res_defs_intel(void)
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 468e9821f35a..82a555855c1b 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -26,12 +26,6 @@
 
 #include "internal.h"
 
-/*
- * Global boolean for rdt_monitor which is true if any
- * resource monitoring is enabled.
- */
-bool rdt_mon_capable;
-
 /*
  * Scale factor to convert L3 monitor events to bytes.
  */
-- 
2.55.0

