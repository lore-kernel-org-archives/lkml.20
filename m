Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564294915BB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633742; cv=none; b=mDQjKa8eMTpQzpBNBoT4Huc9VZ9fBiNJiceJAxes+cpkix+NC3UOCoI4CJE2IFWNmXHXC06iG/E1jVDgPZ6jjI33kfZrHfhmanRIKWQNlmNAhtLq+P+aD3S44XkABAPfzRwYDL312VDnNbzHY10zoTjw1NPAujLOOvu2Rb+1Tak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633742; c=relaxed/simple;
	bh=dADUmwwdWx1ehRE3VhGStKa/NpdSsGkCZbQpDynCcQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcvbATp12J2pF6bgxcuR5CsCzizPEULeAetF4vWchPG/YkOywv4GQXwHhdoWoc/xoWGxiP5Zcre0mt8B3Z2clI4x0QZiQVypzCAZV48FGA/ofZcxbiRtKepNKTsKemnBgyG8E+br2O+bNDenz4MxIM40JUr7x5lbnXoASA0zFUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3nQe5P4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3nQe5P4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633739; x=1822169739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dADUmwwdWx1ehRE3VhGStKa/NpdSsGkCZbQpDynCcQA=;
  b=M3nQe5P48z/v8uXQSKLKZ5L7sbKJu8jXjwfRnJLKqwc6C25P+bZh1lyZ
   PHIi0jxqrJuSjtyDrWwiEXD43kHPvZfcSneJf/ocvWj/k8Y8TX0cmjT8D
   Qtae42QP8LLCxdMcA3KL0uBbLPDqNf14jZ78CJZkswff0Nlt7p5Nd8NNL
   xjVi8zyM5X8hvGW3qPoIIFaNDPWt3RvARQT7nYVdD7fv7dRnQHj5bV3/H
   kEgJHLoGatf52/A9MfvjtGDqhaab8xxuR5bGxMc+mnVxXvI+lIJUmMllt
   S96tIDtLfVswW/JfsHUEd+0N/noEj+eWwMVMJoVZRp1IOdFavwZK9Msus
   w==;
X-CSE-ConnectionGUID: 56u/IpR8QCGLsiA7068KsQ==
X-CSE-MsgGUID: vwqhH3NMQiK296BQVTiAiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90387269"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90387269"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:15:19 -0700
X-CSE-ConnectionGUID: ++Y/U7Z1Sl2AtSk1w27UJA==
X-CSE-MsgGUID: uoTR+DLzTcquOwSBmvzyyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274685504"
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
Subject: [PATCH v13 13/25] arm,x86,fs/resctrl: Allocate maximum needed rmid_ptrs[]
Date: Mon, 28 Sep 2026 15:14:57 -0700
Message-ID: <20260928221509.68002-14-tony.luck@intel.com>
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

resctrl keeps per-RMID state in rmid_ptrs[]. It is allocated on first mount,
sized for the number of RMIDs available at that time, and reused by every
subsequent mount.

Application Energy Telemetry (AET) requires the pmt_telemetry driver to be
built in. Allowing it to be built as a module means the number of RMIDs can
change from one mount to the next, so a later mount may need more entries
than the first mount allocated. Reallocating per mount is not possible because
the limbo handler continues to access rmid_ptrs[] after resctrl is unmounted.

Size rmid_ptrs[] for the maximum number of RMIDs the system can ever need,
so that it is large enough for any future mount. Build the free list
based on the number of RMIDs needed for the current mount cycle.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v13:
	Updated commit message using Reinette suggestion.
	Merged patch 14 "Rebuild free RMID list on each mount" into
	this patch as the split into separate patches didn't work
	as well as I hoped.
---
 include/linux/resctrl.h            |  1 +
 arch/x86/kernel/cpu/resctrl/core.c | 27 +++++++++++++
 drivers/resctrl/mpam_resctrl.c     |  9 +++++
 fs/resctrl/monitor.c               | 64 ++++++++++++++++++++----------
 4 files changed, 79 insertions(+), 22 deletions(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 764c45be2d59..7afeb3bd55d9 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -447,6 +447,7 @@ static inline u32 resctrl_get_default_ctrl(struct rdt_resource *r)
 /* The number of closid supported by this resource regardless of CDP */
 u32 resctrl_arch_get_num_closid(struct rdt_resource *r);
 u32 resctrl_arch_system_num_rmid_idx(void);
+u32 resctrl_arch_system_max_rmid_idx(void);
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
 
 /**
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 2e3b9c16cbda..8702a6da2374 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -45,6 +45,9 @@ static DEFINE_MUTEX(domain_list_lock);
  */
 DEFINE_PER_CPU(struct resctrl_pqr_state, pqr_state);
 
+/* Number of unique RMID values that can be written to MSR_IA32_PQR_ASSOC.RMID */
+static u32 pqr_assoc_num_rmid;
+
 static void mba_wrmsr_intel(struct msr_param *m);
 static void cat_wrmsr(struct msr_param *m);
 static void mba_wrmsr_amd(struct msr_param *m);
@@ -124,6 +127,28 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	return num_rmids == U32_MAX ? 0 : num_rmids;
 }
 
+/**
+ * resctrl_arch_system_max_rmid_idx - Largest possible RMID index
+ *
+ * Return: Largest possible RMID index used for boot time allocations.
+ */
+u32 resctrl_arch_system_max_rmid_idx(void)
+{
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
+	u32 num_rmid = pqr_assoc_num_rmid;
+
+	/*
+	 * If the system is capable of L3 monitoring the maximum RMID value may
+	 * be lower than the system maximum. Either because the L3 monitoring
+	 * feature supports fewer RMIDs, or because SNC (Sub-NUMA Cluster)
+	 * is enabled and divides RMIDs per cluster.
+	 */
+	if (r->mon_capable)
+		num_rmid = r->mon.num_rmid;
+
+	return num_rmid;
+}
+
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
 {
 	if (l >= RDT_NUM_RESOURCES)
@@ -967,6 +992,8 @@ static __init bool get_rdt_mon_resources(void)
 	if (!cpu_feature_enabled(X86_FEATURE_CQM))
 		return false;
 
+	pqr_assoc_num_rmid = cpuid_ebx(0xf) + 1;
+
 	/* Any of the L3 monitoring features? */
 	if (!cpu_feature_enabled(X86_FEATURE_CQM_LLC))
 		return false;
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 7ddee8f5162f..52726f7fd03f 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -257,6 +257,15 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	return (mpam_pmg_max + 1) * (mpam_partid_max + 1);
 }
 
+/*
+ * File system calls this for one-time allocation of structures.
+ * Return the largest possible value.
+ */
+u32 resctrl_arch_system_max_rmid_idx(void)
+{
+	return resctrl_arch_system_num_rmid_idx();
+}
+
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
 {
 	return closid * (mpam_pmg_max + 1) + rmid;
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 2a28fe04284b..ccfb1548fea1 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -75,6 +75,11 @@ static unsigned int rmid_limbo_count;
  */
 static struct rmid_entry	*rmid_ptrs;
 
+/*
+ * @num_rmid_ptrs - The number of elements in rmid_ptrs[].
+ */
+static u32 num_rmid_ptrs;
+
 /*
  * This is the threshold cache occupancy in bytes at which we will consider an
  * RMID available for re-allocation.
@@ -961,45 +966,60 @@ void mbm_setup_overflow_handler(struct rdt_l3_mon_domain *dom, unsigned long del
 
 int setup_rmid_lru_list(void)
 {
-	struct rmid_entry *entry = NULL;
-	u32 idx_limit;
-	u32 idx;
+	struct rmid_entry *entry;
+	u32 cur_idx_limit;
+	u32 rsvd_idx;
 	int i;
 
 	if (!resctrl_mon_capable())
 		return 0;
 
 	/*
-	 * Called on every mount, but the number of RMIDs cannot change
-	 * after the first mount, so keep using the same set of rmid_ptrs[]
-	 * until resctrl_exit(). Note that the limbo handler continues to
-	 * access rmid_ptrs[] after resctrl is unmounted.
+	 * Allocate the largest number of RMIDs that this system will ever
+	 * need. These cannot be freed until resctrl_exit() because the limbo
+	 * handler continues to access rmid_ptrs[] after resctrl is unmounted.
 	 */
-	if (rmid_ptrs)
-		return 0;
+	if (!rmid_ptrs) {
+		num_rmid_ptrs = resctrl_arch_system_max_rmid_idx();
+		rmid_ptrs = kzalloc_objs(struct rmid_entry, num_rmid_ptrs);
+		if (!rmid_ptrs) {
+			num_rmid_ptrs = 0;
+			return -ENOMEM;
+		}
 
-	idx_limit = resctrl_arch_system_num_rmid_idx();
-	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
-	if (!rmid_ptrs)
-		return -ENOMEM;
+		for (i = 0; i < num_rmid_ptrs; i++) {
+			entry = &rmid_ptrs[i];
+			INIT_LIST_HEAD(&entry->list);
 
-	for (i = 0; i < idx_limit; i++) {
-		entry = &rmid_ptrs[i];
-		INIT_LIST_HEAD(&entry->list);
+			resctrl_arch_rmid_idx_decode(i, &entry->closid, &entry->rmid);
+		}
+	}
 
-		resctrl_arch_rmid_idx_decode(i, &entry->closid, &entry->rmid);
-		list_add_tail(&entry->list, &rmid_free_lru);
+	/* Find how many RMIDs are available for this mount */
+	cur_idx_limit = resctrl_arch_system_num_rmid_idx();
+	if (cur_idx_limit > num_rmid_ptrs) {
+		pr_warn_once("RMID count %u exceeds allocation. Limit to %u\n",
+			     cur_idx_limit, num_rmid_ptrs);
+		cur_idx_limit = num_rmid_ptrs;
 	}
 
+	INIT_LIST_HEAD(&rmid_free_lru);
+
 	/*
 	 * RESCTRL_RESERVED_CLOSID and RESCTRL_RESERVED_RMID are special and
 	 * are always allocated. These are used for the rdtgroup_default
 	 * control group, which was setup earlier in rdtgroup_setup_default().
 	 */
-	idx = resctrl_arch_rmid_idx_encode(RESCTRL_RESERVED_CLOSID,
-					   RESCTRL_RESERVED_RMID);
-	entry = __rmid_entry(idx);
-	list_del(&entry->list);
+	rsvd_idx = resctrl_arch_rmid_idx_encode(RESCTRL_RESERVED_CLOSID,
+						RESCTRL_RESERVED_RMID);
+
+	for (i = 0; i < cur_idx_limit; i++) {
+		entry = &rmid_ptrs[i];
+		/* Don't add reserved or busy entries to free list */
+		if (i == rsvd_idx || entry->busy)
+			continue;
+		list_add_tail(&entry->list, &rmid_free_lru);
+	}
 
 	return 0;
 }
-- 
2.55.0

