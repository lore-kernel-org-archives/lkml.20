Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6663C27144B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947483; cv=none; b=alwe45g+l7HGJ3zQgwTctjAX2RerKhLl+zE9BIph9ri1SNYeKwANdXCA3GJ1IpKcja82GFgvF5YAxfws3Fy5MZC0iSF1WZtNryze27FD88ypTnj81HNXw+fBYfzttiHBeJ08vmQ5anDx9BMyFAqiionqw23Nbt7s/3Yj7ftutqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947483; c=relaxed/simple;
	bh=fQSJ+D03bgIVaqgNBalLKCdFlxwNcYwuMrqTlWh5G+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m4OpON0P+2wdG6VsiiI6auc50omX+NGHpRgI5n8KZFZQbNOdL/ZjFnclzxQdkIZtZybrQrbSCBLbV8uY11KweEBkajbDGu3imgwX/5jI3LRXPIKzIzkU/wZLm1x9S/hlN025GBhV698IdjeLnWHUoEGU+cMy6eD4RNTLCKfcAk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpqcevBG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpqcevBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947483; x=1823483483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQSJ+D03bgIVaqgNBalLKCdFlxwNcYwuMrqTlWh5G+M=;
  b=BpqcevBGIOSCsWsxH7h+N/P/HA9tEmZJusWQAKSPMUUY/TdDBtG4KRtt
   fCWk/2qOGSaRtsAA8aYThm+Ax13JhVBaYlkCPL3R09zpr8plWfMQjSeBC
   cRN8z91a2L1cMac27b6+fF6Z3GhOfVof6Mu1Nnk/sipQCGrF/wikH8JdV
   DXVlcdwYeUZCK1oTbiqi/Z3vhG9KixltraYFxSKb0jDvZWIbZIv67/2pn
   RRJKJ4VvYacZo9EtftNrLKXvZSMTKg0AshkeLkzHRpI/Za3LS174TsIO+
   ZbpHyHjjec/RyJ2O1/SKOdM6WM1sg8p2hJQ0zNjPBzt7nUoB9KTf7NQ4a
   Q==;
X-CSE-ConnectionGUID: +L9Fu7fhT/+fqq5kaiC5XQ==
X-CSE-MsgGUID: K1hpTWEiSvm0t80p+fSGBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="571027"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="571027"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:11:22 -0700
X-CSE-ConnectionGUID: HNuaxpkiRzePL1EGzF6jHQ==
X-CSE-MsgGUID: TxagU6SVQxuqhJWEN8NRpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1345139"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa004.fm.intel.com with ESMTP; 13 Oct 2026 20:11:17 -0700
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
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>,
	Hongyu Ning <hongyu.ning@linux.intel.com>
Subject: [PATCH v9 11/12] x86/resctrl: Introduce erdt_cpu_has() and erdt_support()
Date: Wed, 14 Oct 2026 11:00:52 +0800
Message-Id: <8bd80a7e1746e9312e3ee1b875ec9bb983aeb19c.1791933001.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791933001.git.yu.c.chen@intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce erdt_cpu_has() to verify if a specific RDT feature is backed by an
ERDT table. A feature is only reported as ERDT backed when the CPU enumerates
it via CPUID and firmware describes it in the ERDT table (and its sub-tables).
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
Changes since v8:
- Factor the "rdt=" option handling out of rdt_cpu_has() into
  apply_rdt_options() and build both rdt_cpu_has() and erdt_cpu_has() on
  top of it instead of duplicating the loop. (Reinette Chatre)
- CPUID stays the architectural enumeration mechanism, so erdt_cpu_has()
  now requires boot_cpu_has(flag) in addition to ERDT firmware support.
  (Reinette Chatre)
- Do not add the erdt_cpu_has()/erdt_get_scale() prototypes to
  asm/resctrl.h, they live in the resctrl internal header now that
  resctrl_arch_round_mon_val() is out of line. (Reinette Chatre)
- Reword the changelog: use imperative mood instead of "is derived
  from", and do not imply that rdt_cpu_has() considers ERDT.
  (Reinette Chatre)

 arch/x86/kernel/cpu/resctrl/core.c     | 13 +++++++++++--
 arch/x86/kernel/cpu/resctrl/erdt.c     |  5 +++++
 arch/x86/kernel/cpu/resctrl/internal.h |  2 ++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 9a59643f366c..f8737d9b2e20 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -872,9 +872,8 @@ static int __init set_rdt_options(char *str)
 }
 __setup("rdt", set_rdt_options);
 
-bool rdt_cpu_has(int flag)
+static bool apply_rdt_options(int flag, bool ret)
 {
-	bool ret = boot_cpu_has(flag);
 	struct rdt_options *o;
 
 	if (!ret)
@@ -892,6 +891,16 @@ bool rdt_cpu_has(int flag)
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
index 1e6cfc6dbc38..110e7b9806b4 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -50,6 +50,11 @@ static unsigned int erdt_max_rmid;
  */
 static unsigned int erdt_scale;
 
+bool erdt_support(int flag)
+{
+	return false;
+}
+
 unsigned int erdt_get_scale(void)
 {
 	return erdt_scale;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 0de174df26e9..88fae7a84fc7 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -288,6 +288,8 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
 static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
 #endif
 
+bool erdt_cpu_has(int flag);
+bool erdt_support(int flag);
 unsigned int erdt_get_scale(void);
 void erdt_init(void);
 void erdt_exit(void);
-- 
2.43.0

