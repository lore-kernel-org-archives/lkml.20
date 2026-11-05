Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873966;
	b=ba+88wK4fhR0d9KO9NEowMD48x8Z5mpLtaksH7nj4YXrEa6biFUUY7KwGaKhsdFC3Dsa
	 BIZd7CwxVcqvvgu68WKhWar68D+xDRtii6ZCc47JkkFSSbmKlwhvUWeaJGtA7yV3P7Fo5
	 XT5Lp1+eBD9yotanMcEVZQngo0PoVf8swxQ06FKq2M3CVvSV+iCCaisvSyh3Kdc8/q/q8
	 TsCWAIzjyinGRMaJzn8AYLmpO9sHarqS8iefTbVn0LWAedEVb64VYcVijx4IMxda4Lfq4
	 7i8G1dys9nz5awVQIgH/z9E/XAx5SD+nTuj17yCws8C/OX94jrQxy4ZtFtyW/ufoaug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873966;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZuxIddZxkoMEStNXi1wQN6GDmJFWldMSsiqi9WxJVtk=;
	b=bVBpqR1JnodUt5WinDmCBdmxq+94QjlHe0ZgozsoNy+cFdQEdkXCO2WwHXccfONBFfFr
	 6OaEQK7HU4igD+eWbPmUtCMopCiOrGveaR/zkXvVD+68HiHNJyaojICbMMEh/r0cdPpCX
	 06gNqqwXPaishgyLRu08+ppPTEwKldiWha5zYaKJClWsZqL90pFiFXxrAGGli7gWBuc3P
	 i4qR1a3OimSfJ8XPK3OEt+8LDAo/ui0KX4zMHAQRPSWWiolIfIgzkSWU/B/4HyxOaeV5b
	 aUifxnLhbPb9UXZeq8U5il6wArDywj62T6kUGMrCv+0gFDfcOdXosWy2zkTMgxNCdnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RyU3PhnM;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4FD606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B4FD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RyU3PhnM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793873964; x=1825409964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SClvCa2nb4U2zihDSjVgD14Gx79Xt4CvgwQcwdLuc3A=;
  b=RyU3PhnMhvB1BA1nYzdCDfSWkdjvs3XSuYl083dU8HQpP4VuHQLuN5oO
   /kxp4xGsN/KyITm4bkkCuqErOHjzzEXg/sUzEKB4J/x1EQyCEms1sZr6z
   eLCqs9r3lv3S4d2qLzvkm6dwFqWnz/fRP9kvSi1xLdhS/lAUDRuX2ClRS
   IxBvLApiXvqc6CzUmi+/Nvyw7Af0cHINFvSWj2eQL8SO7Gj8+pMNKO4yy
   z0z3i5qZBgw8NShu1VeADN3H7d3hXQgOeKoXapAdPBBJclBdErGzalZtr
   7fC3ATHSbeLdep0PBtdbb9aDPat8NmpsZbHz/R3zK5QwuJ7gJLUdOf4/+
   w==;
X-CSE-ConnectionGUID: GJLfRt7jRAW6ZXU9J8xO9g==
X-CSE-MsgGUID: dVb8noUHRP6gdunX2XXTjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2558365"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2558365"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:19:23 -0800
X-CSE-ConnectionGUID: yydFpciNQQeJvqmVUxV/cw==
X-CSE-MsgGUID: DppOJNqkShu2CaxoJDSO0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8741696"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 02:19:20 -0800
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
Subject: [PATCH v10 02/12] arm,x86,fs/resctrl: Move resctrl_arch_round_mon_val() out of line
Date: Thu,  5 Nov 2026 18:08:20 +0800
Message-Id: <672dbb3622255ee7df0a64ef4e74b4c9b51db02e.1793864720.git.yu.c.chen@intel.com>
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

resctrl_arch_round_mon_val() is an inline function in the x86 and MPAM
architecture headers. It is only called during resctrl initialization and when
user space writes "max_threshold_occupancy", neither of which is a hot path that
benefits from inlining.

Upcoming ERDT support needs resctrl_arch_round_mon_val() to consult
ERDT-specific state. Keeping it inline would force ERDT prototypes into the x86
asm header, fragmenting the ERDT code into a header where it does not belong.

Move resctrl_arch_round_mon_val() into monitor.c and declare it in
include/linux/resctrl.h alongside the other resctrl_arch_*() calls. Move the
MPAM stub from arm_mpam.h into mpam_resctrl.c accordingly.

No functional change.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Acked-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v9:
- Move this patch from the middle of the series to patch 2, right after
  the x86/topology change, so that MPAM maintainers only need to review
  this patch. (Reinette Chatre)
- Change the subject prefix from "x86,fs/resctrl:" to
  "arm,x86,fs/resctrl:" to draw the attention of MPAM maintainers.
  (Reinette Chatre)
- Changelog: say "x86 and MPAM architecture headers" and "x86 asm
  header", and state that keeping the function inline would place ERDT
  code in a header where it does not belong. (Reinette Chatre)
- Since the patch is now ahead of the SNC change, the new function is
  placed after snc_get_config() instead of after the dropped
  resctrl_arch_update_snc(). No code change.
- Add Ben Horgan's Acked-by.

 arch/x86/include/asm/resctrl.h        | 9 ---------
 arch/x86/kernel/cpu/resctrl/monitor.c | 9 +++++++++
 drivers/resctrl/mpam_resctrl.c        | 5 +++++
 include/linux/arm_mpam.h              | 5 -----
 include/linux/resctrl.h               | 1 +
 5 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 8f6edcdcfd87..738de74235bd 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -130,15 +130,6 @@ static inline void __resctrl_sched_in(struct task_struct *tsk)
 	}
 }
 
-static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
-{
-	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
-
-	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
-	val /= scale;
-	return val * scale;
-}
-
 static inline void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid,
 							    u32 rmid)
 {
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3838e0a13d36..97fc60c23958 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -416,6 +416,15 @@ static __init int snc_get_config(void)
 	return ret;
 }
 
+unsigned int resctrl_arch_round_mon_val(unsigned int val)
+{
+	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
+
+	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
+	val /= scale;
+	return val * scale;
+}
+
 int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 {
 	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..3576dde8608e 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -143,6 +143,11 @@ void resctrl_arch_pre_mount(void)
 {
 }
 
+unsigned int resctrl_arch_round_mon_val(unsigned int val)
+{
+	return val;
+}
+
 bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 {
 	return mpam_resctrl_controls[rid].cdp_enabled;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 002f56e15362..f8fcdc7e7a63 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -76,11 +76,6 @@ static inline void resctrl_arch_disable_mon(void) { }
 static inline void resctrl_arch_enable_alloc(void) { }
 static inline void resctrl_arch_disable_alloc(void) { }
 
-static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
-{
-	return val;
-}
-
 /**
  * mpam_register_requestor() - Register a requestor with the MPAM driver
  * @partid_max:		The maximum PARTID value the requestor can generate.
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 10dfdca7f4bf..aa0d41f22293 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -418,6 +418,7 @@ static inline u32 resctrl_get_default_ctrl(struct rdt_resource *r)
 u32 resctrl_arch_get_num_closid(struct rdt_resource *r);
 u32 resctrl_arch_system_num_rmid_idx(void);
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
+unsigned int resctrl_arch_round_mon_val(unsigned int val);
 
 bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,
 			      unsigned int binary_bits, void *arch_priv);
-- 
2.25.1

