Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D9934C98C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707638; cv=none; b=MIONimPkjbbMQ202BLvjsq9osGIgct7skLf0U1xEu2sKI+wXri3JuxEMGRcF3JvYkN1bXLsdeyhbCfS84C+PSNR5bY39HlA6bL9KB7Ik/VyCHWMbSW80mnFpDY7mKUnJYuPZNjJUeVa2XAwwuk6FJbgAt8jBjw7X1JJRwO0zh38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707638; c=relaxed/simple;
	bh=CJbNOXkL5i5iOuj4FQjb8Zr4pzFe7cKFZHXbVN0RM8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CFxJ0L8nCiLvQbnji7PToU2V09L9VNyIndB+UdFvxhnRmayhrY44SiCBhBoxW2CXnHrfEDYqkavoepJ/UTSD9q2tBfDxvB/H1APsLsWJHhFaqpO3cHbvVINsB0aBQUYo572UxFmtPL2qZpjY+ZHobE91oTH41Zrr13AHNIyOp70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzYkECOJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzYkECOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789707636; x=1821243636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CJbNOXkL5i5iOuj4FQjb8Zr4pzFe7cKFZHXbVN0RM8E=;
  b=UzYkECOJcDoRfKX7L1YnihO8lykYJTBynIqU2GKWqdsO5iZwsvbpLRLB
   xAfGoIkiODz6z2mgDhlLTQoG1D7vvKuYVTwxSRzMwUKvJMzUZEX0fcfiJ
   vRugfEqx0rZvGThL4egvgjRiTmoe+hgdF9s1OJ9mSzQ41Zs+yhcl5hjIZ
   IURBGU4aAPW95+XuPYvYPDnDZC1R38a6L0Dt7UVR/La+Aie31OWVkC5yL
   rKDJ44RKMOr6QppQtBAF3BJ6ju1ejwBmSS43qmsZEeMpw08zBW61OknqC
   e8Xq7i3NEXECImqjIk9A2FHdFoW0pZ94YeWgmIfBTnUJueqEABwXN+Omm
   Q==;
X-CSE-ConnectionGUID: O3e9m6UDT6i9NHHeTQ4uwA==
X-CSE-MsgGUID: 9odPqIwVRwmlurPA/ld4Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115722576"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115722576"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 22:00:33 -0700
X-CSE-ConnectionGUID: dGJ0nmibSGe2Aj5zIHiG4g==
X-CSE-MsgGUID: vu5FiOpKQeOgdVSNEbFZ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2395347"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa012.fm.intel.com with ESMTP; 17 Sep 2026 22:00:30 -0700
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
Subject: [PATCH v8 4/9] x86/resctrl: Attach ACPI ERDT information to L3 mon domain on CPU online
Date: Fri, 18 Sep 2026 12:50:03 +0800
Message-Id: <1299d05391a5095a151d6204a459d6ca0f431462.1789705667.git.yu.c.chen@intel.com>
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

Reading LLC occupancy counters via MMIO requires the per-domain ERDT
information, parsed from the ACPI ERDT table, to be reachable from the resctrl
L3 monitoring domain. Nothing links the two yet, so the monitoring code cannot
locate the MMIO registers of a domain.

ERDT and CPUID enumerate CPU-to-L3-domain membership independently: CPUID leaf 4
describes the L3 cache topology, while the firmware CACD sub-table lists the
CPUs of each ERDT domain. Both views must agree on a CPU's L3 domain for that
CPU to be monitored safely.

When a CPU comes online, validate that firmware and CPUID agree on its L3 domain
before adding it to any resctrl domain. Exclude the CPU from all resctrl domains
on a mismatch because a topology inconsistency between ERDT and CPUID indicates
a firmware defect that makes the CPU's domain placement unreliable for any
resource. Otherwise attach the matching ERDT domain information to the L3
monitoring domain so that monitoring data can be read via ERDT and its
sub-tables.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
 arch/x86/kernel/cpu/resctrl/core.c     |  16 ++++
 arch/x86/kernel/cpu/resctrl/erdt.c     | 109 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |   5 ++
 3 files changed, 130 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 54cfdf12dfbb..3514d73a8056 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -34,6 +34,9 @@
  * the domain list must either take cpus_read_lock(), or rely on an RCU
  * read-side critical section, to avoid observing concurrent modification.
  * All writers take this mutex:
+ *
+ * This mutex also protects the ERDT domain_info_list, which is modified when a
+ * CPU comes online.
  */
 static DEFINE_MUTEX(domain_list_lock);
 
@@ -564,6 +567,8 @@ static void l3_mon_domain_setup(int cpu, int id, struct rdt_resource *r, struct
 		return;
 	}
 	list_add_tail_rcu(&d->hdr.list, add_pos);
+
+	erdt_l3_mon_domain_setup(id, &d->hdr);
 }
 
 static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
@@ -742,6 +747,17 @@ static int resctrl_arch_online_cpu(unsigned int cpu)
 	struct rdt_resource *r;
 
 	mutex_lock(&domain_list_lock);
+	/*
+	 * A CPU whose ERDT and CPUID L3 domain views disagree is not added to
+	 * any domain. resctrl_arch_offline_cpu() still tries to remove it when
+	 * it goes offline and warns that no domain contains it. That warning is
+	 * expected.
+	 */
+	if (!erdt_cpu_valid(cpu)) {
+		mutex_unlock(&domain_list_lock);
+		return 0;
+	}
+
 	for_each_capable_rdt_resource(r)
 		domain_add_cpu(cpu, r);
 	mutex_unlock(&domain_list_lock);
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index 0dfe5eda166c..249ba547d7c8 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -209,6 +209,115 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
 	return false;
 }
 
+bool erdt_cpu_valid(int cpu)
+{
+	struct erdt_domain_info *d, *cpu_dom = NULL;
+	int dom_id;
+
+	/* Without ERDT there is no firmware topology to disagree with. */
+	if (!erdt_enabled)
+		return true;
+
+	dom_id = get_cpu_cacheinfo_id(cpu, RESCTRL_L3_CACHE);
+	if (dom_id < 0) {
+		pr_warn(FW_BUG "Can't find L3 id for CPU:%d\n", cpu);
+		return false;
+	}
+
+	/*
+	 * Find the erdt_domain_info that contains this CPU, then bind that ERDT
+	 * domain to this CPU's L3 id. A CPU whose L3 id does not match the binding
+	 * of its ERDT domain cannot be covered by resctrl.
+	 *
+	 * For example, the CACD sub-tables report:
+	 * domain0: CPU0, CPU2, domain1: CPU1, CPU3
+	 * while CPUID/cacheinfo reports the L3 cache is shared by:
+	 * id0: CPU0, CPU1, id1: CPU2, CPU3
+	 * With the CPUs coming online in order, CPU0 binds domain0 to L3 id0 and
+	 * CPU3 binds domain1 to L3 id1, so CPU1 and CPU2 are not covered by
+	 * resctrl.
+	 */
+	list_for_each_entry(d, &domain_info_list, entry) {
+		if (cpumask_test_cpu(cpu, &d->cpu_mask)) {
+			cpu_dom = d;
+			break;
+		}
+	}
+
+	if (!cpu_dom) {
+		pr_warn(FW_BUG "Cannot find the ERDT domain which has CPU%d\n", cpu);
+		return false;
+	}
+
+	/* This ERDT domain is already bound to this CPU's L3 domain. */
+	if (cpu_dom->dom_id == dom_id)
+		return true;
+
+	/*
+	 * This ERDT domain is already bound to a different L3 domain. Rebinding it
+	 * would leave two L3 domains reading the counters of one ERDT domain, so
+	 * skip this CPU instead:
+	 * When CPU2 is brought online, domain0 is found. But then it found that
+	 * domain0's ID is 0, which is not -1(new domain), so CPU2 is ineligible.
+	 */
+	if (cpu_dom->dom_id != -1) {
+		pr_warn(FW_BUG "CPU%d's id=%d not equal to CACD domain(%*pbl) id=%d, skip this CPU\n",
+			cpu, dom_id, cpumask_pr_args(&cpu_dom->cpu_mask), cpu_dom->dom_id);
+
+		return false;
+	}
+
+	/*
+	 * A possible new binding. Check if another ERDT domain shares the same
+	 * L3 id. If yes, this is a conflict and this CPU should not be considered
+	 * by resctrl:
+	 * When CPU1 is brought online, a new domain1 is found. But then it found that
+	 * domain0's ID is 0, which is the same as CPU1's dom_id, so CPU1 is ineligible.
+	 */
+	list_for_each_entry(d, &domain_info_list, entry) {
+		if (d == cpu_dom)
+			continue;
+
+		if (d->dom_id == dom_id) {
+			pr_warn(FW_BUG "CPU%d's id=%d is already used by CACD domain(%*pbl), skip this CPU\n",
+				cpu, dom_id, cpumask_pr_args(&d->cpu_mask));
+
+			return false;
+		}
+	}
+
+	/* Eligible new binding, assign the L3 id. */
+	cpu_dom->dom_id = dom_id;
+
+	return true;
+}
+
+/*
+ * Associate ERDT table information with this domain.
+ */
+void erdt_l3_mon_domain_setup(int id, struct rdt_domain_hdr *hdr)
+{
+	struct rdt_hw_l3_mon_domain *hw_dom;
+	struct erdt_domain_info *d;
+
+	if (!erdt_enabled)
+		return;
+
+	hw_dom = resctrl_to_arch_mon_dom(container_of(hdr, struct rdt_l3_mon_domain, hdr));
+
+	list_for_each_entry(d, &domain_info_list, entry) {
+		if (d->dom_id == id) {
+			/* Assign the ERDT information to hw_dom */
+			if (hw_dom->d_info) {
+				pr_warn(FW_BUG "Duplicated ERDT domains are mapped to an existing L3 domain\n");
+				return;
+			}
+			hw_dom->d_info = d;
+			return;
+		}
+	}
+}
+
 void erdt_exit(void)
 {
 	struct erdt_domain_info *d, *tmp;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 156206088372..2e8fb36ad804 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -97,14 +97,19 @@ struct rdt_hw_ctrl_domain {
  * @arch_mbm_states:	Per-event pointer to the MBM event's saved state.
  *			An MBM event's state is an array of struct arch_mbm_state
  *			indexed by RMID on x86.
+ * @d_info:		ERDT table information of this domain
  *
  * Members of this structure are accessed via helpers that provide abstraction.
  */
 struct rdt_hw_l3_mon_domain {
 	struct rdt_l3_mon_domain	d_resctrl;
 	struct arch_mbm_state		*arch_mbm_states[QOS_NUM_L3_MBM_EVENTS];
+	const struct erdt_domain_info	*d_info;
 };
 
+bool erdt_cpu_valid(int cpu);
+void erdt_l3_mon_domain_setup(int id, struct rdt_domain_hdr *hdr);
+
 static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
 {
 	return container_of(r, struct rdt_hw_ctrl_domain, d_resctrl);
-- 
2.25.1

