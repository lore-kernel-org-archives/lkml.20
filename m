Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA162F1FDF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707698; cv=none; b=hUDhgPBx7vfPwEIgTAOX+tgrSLqM0BoF39LgckFillEQc3yd/8USepgX0qyMpLcqQ6FIevGiRzloY60xXmtRE1TOUxK1z9S9cAeMhw8pfb4mzkSXZK3kdxB6KWOrpiCQbs7PhD7/hb997kddYbQRTQj7NB5LTnGGDE01IZVoAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707698; c=relaxed/simple;
	bh=CnJhrUZO8DVP07la5kQeChxAKJ3RxLbg5ajonUKBR+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pE+N+6KlFyrosg/BfY6RLi4YobXg6EVomYCz7i9YQM8WTp+GVx+RAzR6DgQEM4ejgPf5dmEOr9cqfRJDccKEpmJFlyBL5mt2kqbdDPmxjCEBNoBDianW/lKLcdjoNIb+PfeQM2Uxg6MCc3cc7Zv+wEDWId/3MTPlL+rDJN5i9Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3oMOaPX; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3oMOaPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789707697; x=1821243697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CnJhrUZO8DVP07la5kQeChxAKJ3RxLbg5ajonUKBR+E=;
  b=O3oMOaPXQyJKAhgN8GIgc7azrULYp16ES4fdHIEYttcm7xpn3uguwVlS
   j1nQF39E0WmBHswCG9+DzW8SdxuiMriNXowQr+SW/a+R9emOg5HDw1Pin
   gdgMDJUd3DoN2b4O5IrP49wr+rv1tXNbNy5cBSYGL/b24uXTpsiobMNA3
   0ZP8YJWAzE03EUczrI9e0E1hTplsuX0lO2s1F9dgiMp0jKzmzpm5oi/ja
   CycSeQvZ/hVTcxkhY8dIpW9kJeNXOvML0hzJAoGHnIsFhzP/QSRpYsc/p
   X1Auo+XvpNYEu/ALof4Xkjk8ZSafZJT8meIvPhD4aGAlISeIkp8/yfn4A
   Q==;
X-CSE-ConnectionGUID: j+nQeGVjSeWBrg4h1om1jg==
X-CSE-MsgGUID: 9IAHb7VUTPOkz7C7A36Y1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="704909"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="704909"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 22:01:37 -0700
X-CSE-ConnectionGUID: +7JWQMM4TuS7xz12/tEvWA==
X-CSE-MsgGUID: xJsy1xeqQ5mvvhc++82ykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271542587"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2026 22:01:32 -0700
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
Subject: [PATCH v8 8/9] x86/resctrl: Introduce erdt_cpu_has() and erdt_support()
Date: Fri, 18 Sep 2026 12:51:02 +0800
Message-Id: <b279eaa7bf8b3b0b09532e8b184ba4d410eb6f86.1789705667.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1789705667.git.yu.c.chen@intel.com>
References: <cover.1789705667.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce erdt_cpu_has() to verify if a specific RDT feature is backed by an
ERDT table. erdt_cpu_has() is derived from rdt_cpu_has(), which not only
considers firmware (ERDT table and its sub-tables) support for a feature, but
also considers userspace input like "rdt=!cmt". Similar to rdt_cpu_has(),
erdt_cpu_has() expects an x86 feature flag as parameter.

Introduce erdt_support() as a helper called by erdt_cpu_has() to check whether
the ERDT firmware supports a given feature.

erdt_support() deliberately claims no feature yet and returns false. A feature
may only be reported as ERDT backed once the low level accessors that access
its data via MMIO exist, otherwise callers would take the ERDT path and find no
implementation behind it. Features should be added to erdt_support() as their
MMIO implementations are introduced.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
 arch/x86/include/asm/resctrl.h         |  1 +
 arch/x86/kernel/cpu/resctrl/core.c     | 23 +++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/erdt.c     |  5 +++++
 arch/x86/kernel/cpu/resctrl/internal.h |  1 +
 4 files changed, 30 insertions(+)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 9a32ed418c33..bcfcc8ac1fe6 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -49,6 +49,7 @@ DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
 DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
 DECLARE_STATIC_KEY_FALSE(rdt_mon_enable_key);
 
+bool erdt_cpu_has(int flag);
 unsigned int erdt_get_scale(void);
 
 static inline bool resctrl_arch_alloc_capable(void)
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 3514d73a8056..ca7e67f976d5 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -897,6 +897,29 @@ bool rdt_cpu_has(int flag)
 	return ret;
 }
 
+bool erdt_cpu_has(int flag)
+{
+	struct rdt_options *o;
+	bool ret;
+
+	ret = erdt_support(flag);
+
+	if (!ret)
+		return ret;
+
+	for (o = rdt_options; o < &rdt_options[NUM_RDT_OPTIONS]; o++) {
+		if (flag == o->flag) {
+			if (o->force_off)
+				ret = false;
+			if (o->force_on)
+				ret = true;
+			break;
+		}
+	}
+
+	return ret;
+}
+
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
 {
 	if (!rdt_cpu_has(X86_FEATURE_BMEC))
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index a8a7417c2f82..400973ebf2b8 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -48,6 +48,11 @@ static unsigned int erdt_max_rmid;
  */
 static unsigned int erdt_scale;
 
+bool erdt_support(int flag)
+{
+	return false;
+}
+
 unsigned int erdt_get_max_rmid(void)
 {
 	return erdt_max_rmid;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 26c3e0c546ad..ce037e017fc3 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -287,6 +287,7 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
 static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
 #endif
 
+bool erdt_support(int flag);
 unsigned int erdt_get_max_rmid(void);
 int erdt_init(void);
 void erdt_exit(void);
-- 
2.25.1

