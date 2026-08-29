Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A5D349B15
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983996; cv=none; b=ZgRv/eRkO9/JWdwivCE97knYHeNopnu1i6CRKjevHAvDETCMx8q7M6onJERTtOHpcfi/8FORxgL6t32Ty6fdRMfrey5IxlrlmtU+f7jWwK0s4WTdKwo7eoRE76aGYWJMoWP1u3M8f9ulYQdtZ67RtBnkjUwpSynJuAKKkNVKsX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983996; c=relaxed/simple;
	bh=vhXY30NSfuFYopcDoAyccMFXgNETkDPYFEJX9Kk5cBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iQIybhXZ/XBaT3iiXxrOWo5/SoXf7YXLYVAKEvaU9YkvIEHqgcuBZySsCQzjC4uQNZjSwhphuyuGH6rnLqwg60fWICDyz221GoxoTk49CdSOlhZms6WvA6ugOsZcMwPLDV4WirnFxwdesRxzssBwkhZRjuBHUM0ILO4H6sxUqgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9BAD/0/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9BAD/0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787983995; x=1819519995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vhXY30NSfuFYopcDoAyccMFXgNETkDPYFEJX9Kk5cBQ=;
  b=m9BAD/0/alpcmTpRJnyiHTXcgXqfB/PIBL8r/6nSfCihYOctB8wqkV5T
   Gys7TWwoyOCNBWD4jeuvohiMoHt/L87WuryCCGcuM0tmRbVrKP5lSbUHr
   UTqSPepoH4NgLQ6SnLeN5SPzE6EbMzZqtRAPYgpshwDIJQVsZoHc2UIDn
   wYhyKNx5zpMzN7fe7/g6OVGfyGIWGPXyFMKXUoy9XaWWH7tjM2SOawCTN
   /Bm1uMH73NJJr7RSL9Zx8CJA4fTFK9WeQELSoGOZSSu8SDc7DTsljTCAb
   8FvBvz2x9hHISp+pQIIWNLHfmP6dxm/OPCCvLr2xgjwNTi0zRxZdHgq9w
   A==;
X-CSE-ConnectionGUID: u55NUn1BTiaFVAbfbgGKkw==
X-CSE-MsgGUID: kgW2jK2vSziYc9eA0kYe+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88507879"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="88507879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 23:13:14 -0700
X-CSE-ConnectionGUID: GadOqvdxTMGOPn2re3Pu4w==
X-CSE-MsgGUID: xhdUyVRRQN+IsKVBcPuz9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="271860803"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa003.jf.intel.com with ESMTP; 28 Aug 2026 23:13:12 -0700
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
	chen.yu@linux.dev,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 8/9] x86/resctrl: Introduce erdt_cpu_has() and erdt_support()
Date: Sat, 29 Aug 2026 14:02:46 +0800
Message-Id: <50bc766fe30604a09eac2ac0fc3ad0bef525551d.1787976868.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1787976868.git.yu.c.chen@intel.com>
References: <cover.1787976868.git.yu.c.chen@intel.com>
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

erdt_support() deliberately claims no feature yet and returns false. A
feature may only be reported as ERDT backed once the low level accessors
that read its monitoring data via MMIO exist, otherwise callers would
take the ERDT path and find no implementation behind it. Features
should be added to erdt_support() as their MMIO implementations are
introduced.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
v6->v7:
    Reword "an event" to "a feature", since the check is not
    monitoring-only. (Reinette Chatre)
    Reword "are added" to "should be added". (Reinette Chatre)
    Remove the duplicate erdt_cpu_has() declaration, keeping only the one
    in asm/resctrl.h required by the inline resctrl_arch_round_mon_val().
    (Reinette Chatre)
---
 arch/x86/include/asm/resctrl.h         |  1 +
 arch/x86/kernel/cpu/resctrl/core.c     | 23 +++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/erdt.c     |  5 +++++
 arch/x86/kernel/cpu/resctrl/internal.h |  1 +
 4 files changed, 30 insertions(+)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 4225a518fada..a8dfaca5c6f8 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -49,6 +49,7 @@ DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
 DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
 DECLARE_STATIC_KEY_FALSE(rdt_mon_enable_key);
 
+bool erdt_cpu_has(int flag);
 unsigned int erdt_get_scale(void);
 
 static inline bool resctrl_arch_alloc_capable(void)
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 51185a8770bf..2db9c71bf1f0 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -895,6 +895,29 @@ bool rdt_cpu_has(int flag)
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
index 1c477e35d044..e6eba4067348 100644
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
index 160174c25792..bb7a902b5b9d 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -289,6 +289,7 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
 static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
 #endif
 
+bool erdt_support(int flag);
 unsigned int erdt_get_max_rmid(void);
 int erdt_init(void);
 void erdt_exit(void);
-- 
2.25.1

