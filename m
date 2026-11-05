Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874003;
	b=qcQFcOXIUBtOUpHR2ZBDc/HSHV+s02mx84NgAJhTUSpKNiWS+qRtC34680mutIGUwq6M
	 +TjS2WWHh7jdSaLRTb/C8+KHhVaVn1tppg3eswv3Kolaej8jAQ6UxML3jtI10dfEbFkE0
	 YAG9S1406YHuz0RKguYXflY0CTg+Ba3EX+9k0Jt0MzUKy3dVpQMAVoSXl0V5uHaaoIQk1
	 VDCr9IzAro4no22n32kCO1AN+CA5tLV+p9Aoj4lN8svVdwJ340qDBmpJmayu8R8ipHmTY
	 IilUCD4bye3L6MnHLf/ptgwzXPdQg4FcUJx2cRWPHw7k1Bpr4XnnNtXcSXdapPjxO4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874003;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k0TUF0uS174ZQyKvWi4iQj0hBCUiwpLEv2ddgzcFgZc=;
	b=kZPGzmBc9X3WJ/WPczyH+DGoDXDh1d62+nSaFb+IG11GQtz3ZPlOpkovnV8zEEGuA82/
	 ukbUWIuYs4TzVDF7yEDOYLKBt01jF5I7JRzSz69KBDQCt4gjp8fs5dqXOM4g+PDKVCV0U
	 lXn49wG69LtedqbQHjvk/iA/UjW3Xq091BtqlGgD/J85yagWSB5H5vMzudyHDGjvvHK+w
	 gA5+QqxWJGHwkFHeRCxZLaLCEdwQEFWAn28pLa6bYgJkbT7rLQKcj6ifAzyj05IRwx+Be
	 VvezUS63/tpDnpwhzQcC2X3Me15E18uwZmP7hQXXzlBPfejBgHGCPIGa9PzjYQDfhAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FioB+F0B;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218A1606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 218A1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FioB+F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793874003; x=1825410003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fjEPVm6UwVsapdgudDunANb3LUx11D1dqDArwGdF6H8=;
  b=FioB+F0B9li3K/Vij/xeZigm8If9QJbxvoSCkyYRjhUzRp11Tz3sxs+N
   KwMrgW6bN0OlnoYo6PefoD//2PN5eRj67jKfyS8OCR/slybGRPjCIz4mX
   XrOy/tf2jED4OFWIAWeDLN/LRWXwcPmq7NqqOin/drqIgoIhLunj1hARS
   UvyPhc3eFlMoGG+rqlpccb43hFnoQNG9KspOE+Lz2Do86LyFvl6PK+tBt
   Xd5gQ6tdYdKsmLQ3Dkg0aCqhMBgpAFMBDeZcfCpnQzmq811WllrdcrS79
   E/1nr6oSpGJptRZSodIwb++mOw+Kc/C8uP7tPPxNP5JY9kEqR2EasNSN3
   w==;
X-CSE-ConnectionGUID: YixcfpfaSx6jXNzcVJdvsA==
X-CSE-MsgGUID: H266Uwo0RLqAwt0hazkY4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2541015"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2541015"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:20:02 -0800
X-CSE-ConnectionGUID: qZ9qRR5mSKizvWlML6//Bw==
X-CSE-MsgGUID: GfTT27T2TBmMYEzGAxFHWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7095849"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2026 02:19:58 -0800
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
Subject: [PATCH v10 06/12] x86/resctrl: Attach ACPI ERDT information to L3 mon domain on CPU online
Date: Thu,  5 Nov 2026 18:08:58 +0800
Message-Id: <ea099619212cbc4e58dc81b14476cc1af5bda880.1793864720.git.yu.c.chen@intel.com>
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

Each ERDT domain provides MMIO registers to read the monitoring counters of the
CPUs it covers. A monitor read is issued against a resctrl L3 monitoring domain,
so the read path needs the matching ERDT domain to find those MMIO registers.

ERDT and CPUID enumerate CPU-to-L3-domain membership independently. CPUID leaf 4
describes the L3 cache topology, while the firmware CACD sub-table lists the
CPUs of each ERDT domain. An L3 monitoring domain can only be associated with an
ERDT domain if both views agree on the L3 domain of each of its CPUs.

ERDT is not enabled in Sub-NUMA Cluster mode, so the L3 monitoring domains have
L3 cache scope and their IDs are L3 cache IDs.

When a CPU comes online, check that its ERDT domain and its CPUID L3 cache
agree, and bind the ERDT domain to the CPU's L3 cache ID. On a mismatch, keep
the CPU online but out of all resctrl domains. This matches how resctrl handles
a failed domain creation: the CPU still joins the default group so tasks can run
on it with valid CLOSID/RMID values, but it is not added to any domain's CPU
mask.

When an L3 monitoring domain is created, associate it with the ERDT domain bound
to its L3 cache ID.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
---
Changes since v9:
- Do not fail the CPU online operation when ERDT and CPUID disagree on
  the CPU's L3 domain. Keep the CPU online and in the default group, but
  out of all resctrl domains, which matches how resctrl handles a failed
  domain creation. (Reinette Chatre)
- Rename erdt_try_bind_cpu() to erdt_try_bind_domain(). (Reinette Chatre)
- Describe what erdt_try_bind_domain() returns, instead of how the
  caller uses the result, and replace "covered by resctrl" with "added to
  any resctrl domain". (Reinette Chatre)
- Document in the erdt_l3_mon_domain_setup() comment why hw_dom->d_info
  always points to a valid ERDT domain while ERDT is enabled.
  (Reinette Chatre)
- Put the domain_list_lock comment about the ERDT binding in its own
  paragraph, and say that it serializes binding an ERDT domain to an L3
  cache ID (erdt_domain_info::dom_id), not modifying domain_info_list.
  (Reinette Chatre)
- Rewrite the changelog to give the context before describing the
  change, use imperative mood, and make clear what "it" refers to.
  (Reinette Chatre)
- Use kernel-doc format for both function comments, with "Context:
  Caller must hold domain_list_lock.", and reword the "Can't find L3 id"
  warning.

 arch/x86/kernel/cpu/resctrl/core.c     |  14 ++-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 123 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |   6 ++
 3 files changed, 141 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 2b9a13be5975..a2b012c94680 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -33,9 +33,12 @@
  * The rdt_resource's domain list is updated when this happens. Readers of
  * the domain list must either take cpus_read_lock(), or rely on an RCU
  * read-side critical section, to avoid observing concurrent modification.
- * All writers take this mutex:
+ * All writers take this mutex.
+ *
+ * This mutex also serializes binding an ERDT domain to an L3 cache ID
+ * (erdt_domain_info::dom_id) when a CPU comes online.
  */
-static DEFINE_MUTEX(domain_list_lock);
+DEFINE_MUTEX(domain_list_lock);
 
 /*
  * The cached resctrl_pqr_state is strictly per CPU and can never be
@@ -560,6 +563,8 @@ static void l3_mon_domain_setup(int cpu, int id, struct rdt_resource *r, struct
 		return;
 	}
 
+	erdt_l3_mon_domain_setup(&d->hdr);
+
 	err = resctrl_online_mon_domain(r, &d->hdr);
 	if (err) {
 		l3_mon_domain_free(hw_dom);
@@ -744,8 +749,13 @@ static int resctrl_arch_online_cpu(unsigned int cpu)
 	struct rdt_resource *r;
 
 	mutex_lock(&domain_list_lock);
+	/* Keep a CPU out of all domains if its ERDT and CPUID L3 domains conflict. */
+	if (!erdt_try_bind_domain(cpu))
+		goto unlock;
+
 	for_each_capable_rdt_resource(r)
 		domain_add_cpu(cpu, r);
+unlock:
 	mutex_unlock(&domain_list_lock);
 
 	clear_closid_rmid(cpu);
diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
index 2bb187255630..1b07dd734b9b 100644
--- a/arch/x86/kernel/cpu/resctrl/erdt.c
+++ b/arch/x86/kernel/cpu/resctrl/erdt.c
@@ -207,6 +207,129 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
 	return ret;
 }
 
+/**
+ * erdt_try_bind_domain() - Validate @cpu's L3 domain against ERDT and bind the
+ * ERDT domain containing @cpu to that L3 domain.
+ * @cpu: CPU that is coming online
+ *
+ * Find the erdt_domain_info whose CACD lists @cpu, then bind that ERDT domain
+ * to @cpu's L3 id. The binding fails if that ERDT domain is already bound to a
+ * different L3 id, or if another ERDT domain is already bound to @cpu's L3 id.
+ *
+ * For example, the CACD sub-tables report:
+ * domain0: CPU0, CPU2, domain1: CPU1, CPU3
+ * while CPUID/cacheinfo reports the L3 cache is shared by:
+ * id0: CPU0, CPU1, id1: CPU2, CPU3
+ * With the CPUs coming online in order:
+ * - CPU0 binds domain0 to L3 id0.
+ * - CPU1 is in the unbound domain1, but L3 id0 is already bound to domain0,
+ *   so binding fails for CPU1.
+ * - CPU2 is in domain0, which is bound to L3 id0 rather than CPU2's L3 id1,
+ *   so binding fails for CPU2.
+ * - CPU3 binds domain1 to L3 id1.
+ *
+ * Return: true if ERDT is unused, or if the ERDT domain containing @cpu is
+ * bound to @cpu's L3 cache ID, whether that binding already existed or was
+ * created by this call. false if ERDT and CPUID cannot be reconciled into a
+ * one-to-one binding, in which case no binding is modified.
+ */
+bool erdt_try_bind_domain(int cpu)
+{
+	struct erdt_domain_info *d, *cpu_dom = NULL;
+	int dom_id;
+
+	lockdep_assert_held(&domain_list_lock);
+
+	/* Without ERDT there is no firmware topology to disagree with. */
+	if (!erdt_enabled)
+		return true;
+
+	dom_id = get_cpu_cacheinfo_id(cpu, RESCTRL_L3_CACHE);
+	if (dom_id < 0) {
+		pr_warn_once(FW_BUG "Cannot find L3 id for CPU%d\n", cpu);
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
+	 * fail instead (CPU2 in the example above).
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
+	 * L3 id. If yes, this is a conflict (CPU1 in the example above).
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
+/**
+ * erdt_l3_mon_domain_setup() - Associate ERDT table information with an L3
+ * monitoring domain.
+ * @hdr: Header of the L3 monitoring domain being created
+ *
+ * The CPU creating this domain has passed erdt_try_bind_domain(), which bound
+ * an ERDT domain to this CPU's L3 cache ID. Without SNC the L3 monitoring
+ * domain ID is also the L3 cache ID, so a match is always found and
+ * hw_dom->d_info always points to a valid ERDT domain while ERDT is enabled.
+ */
+void erdt_l3_mon_domain_setup(struct rdt_domain_hdr *hdr)
+{
+	struct rdt_hw_l3_mon_domain *hw_dom;
+	struct erdt_domain_info *d;
+
+	lockdep_assert_held(&domain_list_lock);
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
index e081ebdbc5de..deb033155f31 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -99,12 +99,14 @@ struct rdt_hw_ctrl_domain {
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
@@ -180,6 +182,8 @@ extern struct rdt_hw_resource rdt_resources_all[];
 
 extern int snc_nodes_per_l3_cache;
 
+extern struct mutex domain_list_lock;
+
 void arch_mon_domain_online(struct rdt_resource *r, struct rdt_l3_mon_domain *d);
 
 /* CPUID.(EAX=10H, ECX=ResID=1).EAX */
@@ -285,5 +289,7 @@ static inline bool intel_handle_aet_option(bool force_off, char *tok) { return f
 
 void erdt_init(void);
 void erdt_exit(void);
+bool erdt_try_bind_domain(int cpu);
+void erdt_l3_mon_domain_setup(struct rdt_domain_hdr *hdr);
 
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
-- 
2.25.1

