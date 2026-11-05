Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873983;
	b=Ejw641s1fTPaMrnnXi/9llVsaNPp2S9lJDdZyubmTnu8FZPX8wqFnqdzG6YvtAx65kWK
	 nF31iwPWCzAhtfu3D9EGe8MmqTVmkJ3wfcgpD6KdD+mktHs3wwRjqslJee9/TgDGY6v0t
	 DD6V0SvcgdPeAy5iQs+G3J79n7hGyRAXN4H3yC2lWNTLyV8gEkvOuydr1KY4oLlkO3qhR
	 QZ+frJg1KsmYl8gW8nyPKCcVhb5CiwFqX3hwY+PzdZstHuUDQiT6wJX5yCag4HKjUwhiS
	 4nW7x3L5SHDohJ/WfSaKUMV++kW73QBCxtB8pvHCEni/4EtTAn1tNCvtgi75hse7XHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873983;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S2Je5tLUQl8Ta/mKz1l5FjwdSY9wwNZbSMxWf29A1LA=;
	b=khLJr2o5ial6k204hmn8+WwKmk4gspXI6OsaGVqz13RW2OpJGUc1yqkTCv9CIYG5GBT9
	 84oZSaJqYvUysPDeV7TfY0bohnwYE84zmT3QDVJpbSak/hY8we13tnjKwxadCHow8FfzL
	 r2487rMHbhXZKzYTi8jlLUO8eKWFbvw/vE/B7/nC4rci1vJ4/8atPKbYIn5K3H7AWqtxH
	 bmDuFpCobALQCxfnRkizHO83b1A3oBFQePJ2BWWRT0WA+rJCJEBpAutXOfOoewVrnKTSG
	 7kA+d4A90HGPZwqGk/CucuSu2s2nKPS6FKbmLcRuVCVnZJULBTsuRFi7aWqbmf9n4kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="gl+mgS/H";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A406606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A406606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gl+mgS/H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793873983; x=1825409983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XIljHmROc+k7lQTXM56dExK2xtoZJxQv5GjZohdRl30=;
  b=gl+mgS/HVRdzcYiHX4mO9NqXwh4NyiyYtLF8NMn07NNQEdPFRiSi3G6I
   o1+dVUoDlrr9VxRwY2YdaIRB/umLBbU8r9CT6k0YsHikIdcCX2R2GTwUe
   dc/rQKdFD4KJlz2Wmqzp4+EQ0KyV6DYJRfrgaHYa2y+cALuINuSiflpft
   gswjjN4frgdqX7BZJWuuVWpzssAsmzx0Fzv4g3SiVbMqhxC9Qpra3w+rM
   Pdw3i/AArg+DQbZlzIWfHW6/jBruCMY5WjwJASOmAdABTGnYzrXTh2zyJ
   lxolfc8l3R4Prn11FBKs5Wt5KymfyJZ/iMy9vPYb3xYybhMgS/DodRM2F
   Q==;
X-CSE-ConnectionGUID: LRv4acBCRZieCbdemBJxDg==
X-CSE-MsgGUID: oKhxRr76TKeYUFWYzFXXYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2671562"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2671562"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:19:42 -0800
X-CSE-ConnectionGUID: DEfy3VInRnOwxqtNFBZ2Ag==
X-CSE-MsgGUID: OSvGg3WfQNuhUzaa1Ui43Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8835096"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa013.fm.intel.com with ESMTP; 05 Nov 2026 02:19:39 -0800
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
Subject: [PATCH v10 04/12] x86/resctrl: Detect Sub-NUMA Cluster mode before enumerating resources
Date: Thu,  5 Nov 2026 18:08:39 +0800
Message-Id: <d9c9ff67609cbca8dc840c680425d90191c4a1dd.1793864720.git.yu.c.chen@intel.com>
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

The Sub-NUMA Cluster (SNC) configuration is currently detected only while
setting up L3 monitoring, so it is unknown to code that runs earlier during
resctrl initialization. Upcoming Enhanced RDT (ERDT) support needs to know
whether SNC is enabled while parsing its ACPI table, before the monitoring
resources are set up.

Detect SNC once at the start of resource enumeration so that its configuration
is available to all of resctrl initialization. SNC is now also detected on
systems without L3 monitoring, which is harmless because only monitoring
depends on the SNC configuration.

Suggested-by: Tony Luck <tony.luck@intel.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v9:
- New patch, split out of v9 "x86/resctrl: Do not enable ERDT when
  Sub-NUMA Cluster is enabled". It only moves SNC detection to the start
  of resource enumeration. The ERDT/SNC check itself moves into
  "x86/resctrl: Parse ACPI ERDT table and save CACD cpumask per RMD".
  (Reinette Chatre)
- Drop the resctrl_arch_update_snc() helper: the resctrl_arch_ prefix is
  reserved for the functions declared in include/linux/resctrl.h. Move
  the definition of snc_nodes_per_l3_cache to core.c, declare it in
  internal.h, and open code its initialization in get_rdt_resources().
  Existing users in monitor.c are unchanged. (Reinette Chatre)
- Describe the change at a high level in the changelog instead of
  narrating the code. (Reinette Chatre)

 arch/x86/kernel/cpu/resctrl/core.c     | 3 +++
 arch/x86/kernel/cpu/resctrl/internal.h | 3 +++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 6 +-----
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 55214d6fdc49..b5a86e5aa4e3 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -51,6 +51,8 @@ DEFINE_PER_CPU(struct resctrl_pqr_state, pqr_state);
  */
 bool rdt_alloc_capable;
 
+int snc_nodes_per_l3_cache = 1;
+
 static void mba_wrmsr_intel(struct msr_param *m);
 static void cat_wrmsr(struct msr_param *m);
 static void mba_wrmsr_amd(struct msr_param *m);
@@ -1016,6 +1018,7 @@ static __init void check_quirks(void)
 
 static __init bool get_rdt_resources(void)
 {
+	snc_nodes_per_l3_cache = snc_get_config();
 	rdt_alloc_capable = get_rdt_alloc_resources();
 	rdt_mon_capable = get_rdt_mon_resources();
 
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..4436b976aedf 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -151,6 +151,8 @@ static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r
 
 extern struct rdt_hw_resource rdt_resources_all[];
 
+extern int snc_nodes_per_l3_cache;
+
 void arch_mon_domain_online(struct rdt_resource *r, struct rdt_l3_mon_domain *d);
 
 /* CPUID.(EAX=10H, ECX=ResID=1).EAX */
@@ -225,6 +227,7 @@ union l3_qos_abmc_cfg {
 void rdt_ctrl_update(void *arg);
 
 int rdt_get_l3_mon_config(struct rdt_resource *r);
+__init int snc_get_config(void);
 
 bool rdt_cpu_has(int flag);
 
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 97fc60c23958..a30444dd638a 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -34,8 +34,6 @@ bool rdt_mon_capable;
 
 #define CF(cf)	((unsigned long)(1048576 * (cf) + 0.5))
 
-static int snc_nodes_per_l3_cache = 1;
-
 /*
  * The correction factor table is documented in Documentation/filesystems/resctrl.rst.
  * If rmid > rmid threshold, MBM total and local values should be multiplied
@@ -384,7 +382,7 @@ static const struct x86_cpu_id snc_cpu_ids[] __initconst = {
 	{}
 };
 
-static __init int snc_get_config(void)
+__init int snc_get_config(void)
 {
 	int ret;
 
@@ -432,8 +430,6 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 	unsigned int threshold;
 	u32 eax, ebx, ecx, edx;
 
-	snc_nodes_per_l3_cache = snc_get_config();
-
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
 	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
 	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
-- 
2.25.1

