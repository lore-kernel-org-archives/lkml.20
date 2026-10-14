Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE938D3EB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947367; cv=none; b=YtbrDL6K1qyGbHNv9e71Jj9UGs+yf3tKEPlbWEw6IF/WJy2pSHHNksxjpXEJizbAk1w7o9Y/F6+obnQEl7u1Ab8+0OXzQ+3cLZtAdtAPDwrpYporzcbpkpqo+twIQaYYp9qXpKTFAMUCbSmAu13VJjbk31eu229dNS2Ue1QIfbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947367; c=relaxed/simple;
	bh=S1KFQlb2xQB7cEf9ZWwJz8W4VwevbK2TP4UGl0wIr4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rg0POc30KDh/ZB8Z+Jvu5ESU0JyVhuBNSokX+BdPqJ+ZCAll0cQG76Pv21MIBEIeeG9XKbo+Wsw/8gw8VwqSST0VjuCxu3lZ4Lg5IfcCukoWHg8hbCR9oGwrj0IDhYv0wacT6Jh822IaRDPv1uhh+9aZoMpjXrHsdwiuZuYOq1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GLtrKRAM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLtrKRAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947365; x=1823483365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S1KFQlb2xQB7cEf9ZWwJz8W4VwevbK2TP4UGl0wIr4E=;
  b=GLtrKRAMcf2b733TjpK9eR2ulFC1bits24hJIwweQDJz9/biqRFukHBs
   9Zy9XaUeO+EDEc8LVSOI9B83z7TxupoZXlN4n3e4r+sJOzEBjFfaGMYVZ
   2VxObtLiuoSTiQnsW62gkcjHOrRBNFtdOf3cnFTw5Gdq6Ek1rdufZJOiP
   +pXbjQi7Y8p6d365GSIzwYpEa0dsDBMEjIfg+Fkc8w3CGhLRRBJDzksv5
   4gZQ3sqWbN//2g7Z+VPb4O2YrmnIWgUECMUDIie7xb2GjieSVaiJRErZw
   J5Q/SwgVerQbq0Hm4oeazdWBkwX393gIlZn7zWyMhl6fgJ3G3k9NayWsT
   A==;
X-CSE-ConnectionGUID: xTeveIPRStuyAGt97DT5UA==
X-CSE-MsgGUID: rILAOU6HTP6v3+TVwJTiug==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="676325"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="676325"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:09:24 -0700
X-CSE-ConnectionGUID: XsDg2d5kS+y/Ab4KAk5p/w==
X-CSE-MsgGUID: SQvR/DgUTjW9QLS/JG2uAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1392413"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa006.jf.intel.com with ESMTP; 13 Oct 2026 20:09:21 -0700
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
Subject: [PATCH v9 05/12] x86/resctrl: Attach ACPI ERDT information to L3 mon domain on CPU online
Date: Wed, 14 Oct 2026 10:58:56 +0800
Message-Id: <2d3327d86480b1a41bf1a7c935317f14884a83f9.1791933001.git.yu.c.chen@intel.com>
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

In preparation for MMIO-based LLC occupancy monitoring, link the per-domain
ERDT information to the resctrl L3 monitoring domain, so the MMIO read path
can locate a domain's MMIO registers.

ERDT and CPUID enumerate CPU-to-L3-domain membership independently: CPUID leaf 4
describes the L3 cache topology, while the firmware CACD sub-table lists the
CPUs of each ERDT domain. Both views must agree on a CPU's L3 domain for that
CPU to be monitored safely.

When a CPU comes online, validate that firmware and CPUID agree on its L3 domain
and bind the CPU to its ERDT domain before adding it to any resctrl domain.
Fail the CPU online operation on a mismatch for now. Leaving the CPU
online but outside all resctrl domains is doable, but it would require a
change to cpus_ctrl_write() to reject CPUs that are online but not tracked by
any resctrl group. The current approach is stricter, but simpler.

The ID used to match a resctrl monitoring domain against an ERDT domain is
always the L3 cache ID. ERDT is only enabled when Sub-NUMA Clustering is
disabled, so resctrl keeps the L3 monitoring domains at L3 cache scope
instead of node scope.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v8:
- Reword the changelog that read like a bug fix, and state that the ID
  used for the match is always the L3 cache ID because ERDT is not
  enabled when SNC is enabled. (Reinette Chatre)
- Rename erdt_cpu_valid() to erdt_try_bind_cpu() because the function
  also binds the CPU's ERDT domain to its L3 domain. (Reinette Chatre)
- Attach the ERDT information to the monitoring domain before the domain
  is published on the RCU protected domain list, so that the domain is
  never visible to the resctrl filesystem in a half initialized state.
  (Reinette Chatre, sashiko)
- Move the added comment above the "All writers take this mutex:"
  sentence that introduces domain_list_lock. (Reinette Chatre)
- Move the binding example into the function comment of
  erdt_try_bind_cpu(), refer to @cpu, and fix the mixed tense.
  (Reinette Chatre)
- Drop the @id parameter of erdt_l3_mon_domain_setup() and use hdr->id.
  (Reinette Chatre)
- Drop the comment that duplicated the function comment and the
  hw_dom->d_info check that cannot trigger on a freshly kzalloc()ed
  domain. (Reinette Chatre)
- Use pr_warn_once() for the messages that can be triggered repeatedly
  through CPU hotplug. (Reinette Chatre)
- Move the new prototypes next to the other erdt_*() prototypes in
  internal.h. (Reinette Chatre)

 arch/x86/kernel/cpu/resctrl/core.c     |  11 +++
 arch/x86/kernel/cpu/resctrl/erdt.c     | 109 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |   4 +
 3 files changed, 124 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 0ea888807bd0..9a59643f366c 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -33,6 +33,8 @@
  * The rdt_resource's domain list is updated when this happens. Readers of
  * the domain list must either take cpus_read_lock(), or rely on an RCU
  * read-side critical section, to avoid observing concurrent modification.
+ * This mutex also protects the ERDT domain_info_list, which is modified when a
+ * CPU comes online.
  * All writers take this mutex:
  */
 static DEFINE_MUTEX(domain_list_lock);
@@ -558,6 +560,8 @@ static void l3_mon_domain_setup(int cpu, int id, struct rdt_resource *r, struct
 		return;
 	}
 
+	erdt_l3_mon_domain_setup(&d->hdr);
+
 	err = resctrl_online_mon_domain(r, &d->hdr);
 	if (err) {
 		l3_mon_domain_free(hw_dom);
@@ -742,6 +746,13 @@ static int resctrl_arch_online_cpu(unsigned int cpu)
 	struct rdt_resource *r;
 
 	mutex_lock(&domain_list_lock);
+	/* Refuse to online a CPU whose ERDT and CPUID L3 domain views disagree. */
+	if (!erdt_try_bind_cpu(cpu)) {
+		mutex_unlock(&domain_list_lock);
+		clear_closid_rmid(cpu);
+		return -EINVAL;
+	}
+
 	for_each_capable_rdt_resource(r)
 		domain_add_cpu(cpu, r);
 	mutex_unlock(&domain_list_lock);
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index d94c54617fa1..d4b630358d6d 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -199,6 +199,115 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
 	return false;
 }
 
+/*
+ * erdt_try_bind_cpu() - Validate @cpu's L3 domain against ERDT and bind the
+ * ERDT domain containing @cpu to that L3 domain.
+ *
+ * Find the erdt_domain_info whose CACD lists @cpu, then bind that ERDT domain
+ * to @cpu's L3 id. A CPU whose L3 id does not match the binding of its ERDT
+ * domain cannot be covered by resctrl.
+ *
+ * For example, the CACD sub-tables report:
+ * domain0: CPU0, CPU2, domain1: CPU1, CPU3
+ * while CPUID/cacheinfo reports the L3 cache is shared by:
+ * id0: CPU0, CPU1, id1: CPU2, CPU3
+ * With the CPUs coming online in order:
+ * - CPU0 binds domain0 to L3 id0.
+ * - CPU1 is in the unbound domain1, but L3 id0 is already bound to domain0,
+ *   so CPU1 is not covered by resctrl.
+ * - CPU2 is in domain0, which is bound to L3 id0 rather than CPU2's L3 id1,
+ *   so CPU2 is not covered by resctrl.
+ * - CPU3 binds domain1 to L3 id1.
+ *
+ * Return: true if @cpu can be covered by resctrl, false otherwise.
+ */
+bool erdt_try_bind_cpu(int cpu)
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
+		pr_warn_once(FW_BUG "Can't find L3 id for CPU:%d\n", cpu);
+		return false;
+	}
+
+	list_for_each_entry(d, &domain_info_list, entry) {
+		if (cpumask_test_cpu(cpu, &d->cpu_mask)) {
+			cpu_dom = d;
+			break;
+		}
+	}
+
+	if (!cpu_dom) {
+		pr_warn_once(FW_BUG "Cannot find the ERDT domain which has CPU%d\n", cpu);
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
+	 * skip @cpu instead (CPU2 in the example above).
+	 */
+	if (cpu_dom->dom_id != ERDT_DOMAIN_ID_UNSET) {
+		pr_warn_once(FW_BUG "CPU%d's id=%d not equal to CACD domain(%*pbl) id=%d, skip this CPU\n",
+			     cpu, dom_id, cpumask_pr_args(&cpu_dom->cpu_mask), cpu_dom->dom_id);
+
+		return false;
+	}
+
+	/*
+	 * A possible new binding. Check if another ERDT domain shares the same
+	 * L3 id. If yes, this is a conflict and @cpu should not be considered
+	 * by resctrl (CPU1 in the example above).
+	 */
+	list_for_each_entry(d, &domain_info_list, entry) {
+		if (d == cpu_dom)
+			continue;
+
+		if (d->dom_id == dom_id) {
+			pr_warn_once(FW_BUG "CPU%d's id=%d is already used by CACD domain(%*pbl), skip this CPU\n",
+				     cpu, dom_id, cpumask_pr_args(&d->cpu_mask));
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
+void erdt_l3_mon_domain_setup(struct rdt_domain_hdr *hdr)
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
+		if (d->dom_id == hdr->id) {
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
index 34d29f719076..48aa64c1ff96 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -98,12 +98,14 @@ struct rdt_hw_ctrl_domain {
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
 
 static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
@@ -284,5 +286,7 @@ static inline bool intel_handle_aet_option(bool force_off, char *tok) { return f
 
 void erdt_init(void);
 void erdt_exit(void);
+bool erdt_try_bind_cpu(int cpu);
+void erdt_l3_mon_domain_setup(struct rdt_domain_hdr *hdr);
 
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
-- 
2.43.0

