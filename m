Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E741A268
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173305; cv=none; b=TsEV6g/NJQx2bNkXgyyYJqdlHCr4iHBZZzZIXjWkj6kunrP7OBpD4JFQWnYVIs28iDkjdc4nwVmkmWh9NRmhWJsqCDgwpc8fIV5++cGsxfHWJvT5hJktXVIrFpt/HrcgfSyG4jbpys4Jy8iegOSIClW7EgQl68TLxi14uXfNgOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173305; c=relaxed/simple;
	bh=QWq25Fc/Rpsi6bFXQe7Ikl93k118o8jBVKBHBNa0+HI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgjb6qGA80rNAOaN2yhV7VEWILsPwvUETDE3/ySVHlV2m+NNBn375TzbMAACckKdDj+bjKp+b83a2tK68rTx7u3dYtn9VRtt8dm/EVaCJ4FluKP+Zvjw6elmB7Era1+NdO67NDhSvgGht6CHIyZK07ASnNlUwpKoF5PzEsbwdCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jh6U8ymT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jh6U8ymT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789173304; x=1820709304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QWq25Fc/Rpsi6bFXQe7Ikl93k118o8jBVKBHBNa0+HI=;
  b=jh6U8ymTAzRuDaLcw6bQRWWTtz/ltI+awuURyLcp9YLqqEw2mtGnUfi6
   okBEBmZTPuTffGyawBgppNMpxRXqV6CKyTsgRPYLlxzDoHjIMsbKN1Iv5
   AnTGM+zVC1MXPty7EcvhnEvwwkH8MMXiNKuh8jmh7ORqOjx7JibfLZ9iQ
   4QTuGysl4lgLbnKRqdvhrxlZcKb+kRqhMML64S+NAvQxJeno4UWzsfyks
   9bxBFZDtzVEyeTgNHCJfHxEIsiwjDdVbomZqOXFbEeWsgUZHaMH6ob+kt
   H9755KOJONx9tQoslN5FxVNeRYzNuTnYeAbHszyRfuYS51e5kXr8IMqKZ
   A==;
X-CSE-ConnectionGUID: RRQZ08awSUiE1l67K6dihw==
X-CSE-MsgGUID: 5eLi2A0jRTGOR5QWmXBmWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115174965"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="115174965"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:35:03 -0700
X-CSE-ConnectionGUID: V67h+lTxTkiSsUV2VQwuXQ==
X-CSE-MsgGUID: 8PNgL13QS0qGwBbDdN/l9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="276217599"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 17:35:03 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	kevin.shu@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH RFC v1 3/8] x86/cpu/topology: Introduce primary core mask
Date: Sat, 12 Sep 2026 00:08:09 +0000
Message-ID: <20260912000815.997720-4-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912000815.997720-1-chang.seok.bae@intel.com>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The microcode loading distinguishes primary SMT threads from sibling
threads to avoid races during updates. Because early loading relies on
this distinction, parallel CPU bringup splits APs into two groups and
brings them up in phases.

Upcoming Intel microcode loading feature expands the loading scope beyond
per-core updates to package-wide or system-wide updates. While CPU0 is
the obvious primary for the system-wide scope, there is currently no
facility to identify per-package primary CPUs for the parallel bringup.

This matters because the parallel bringup logic must determine primary
CPUs before any AP is ever brought up. But topology_logical_package_id()
is not usable at that stage, as logical package IDs are established
during AP bringup itself, as described in:

  7af541cee1e0e ("x86/topology: Don't evaluate logical IDs during early boot")

Unlike cpu_primary_thread_mask, there is also no relevant mask that
tracks one primary CPU per package. Thus, introduce cpu_primary_core_mask
to fill this gap.

The mask intentionally includes all threads of the selected core. This
preserves core-domain granularity and avoids coupling with the lower-
level topology details such as SMT primary selection.

Use the mask for the microcode staging path to simplify staging CPU
selection at the moment. Following changes will address the microcode
loading use.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
Note:
The staging path itself could have continued using topology_logical_package_id()
as the late loading is only relevant. IOW, the cpu_primary_core_mask
introduction was not required for the staging enablement back then.
---
 arch/x86/include/asm/topology.h       |  3 +++
 arch/x86/kernel/cpu/microcode/intel.c | 14 ++++----------
 arch/x86/kernel/cpu/topology.c        | 23 ++++++++++++++++++++---
 arch/x86/kernel/cpu/topology_common.c |  9 +++++++++
 4 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
index 1825691af941..02ad56cfc6f4 100644
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -234,6 +234,9 @@ static inline unsigned int topology_amd_nodes_per_pkg(void) { return 1; }
 extern struct cpumask __cpu_primary_thread_mask;
 #define cpu_primary_thread_mask ((const struct cpumask *)&__cpu_primary_thread_mask)
 
+extern struct cpumask __cpu_primary_core_mask;
+#define cpu_primary_core_mask ((const struct cpumask *)&__cpu_primary_core_mask)
+
 /**
  * topology_is_primary_thread - Check whether CPU is the primary SMT thread
  * @cpu:	CPU to check
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 1142183c950c..4b5feee14712 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -605,7 +605,6 @@ static int do_stage(u64 mmio_pa)
 
 static void stage_microcode(void)
 {
-	unsigned int pkg_id = UINT_MAX;
 	int cpu, err;
 	u64 mmio_pa;
 
@@ -619,15 +618,10 @@ static void stage_microcode(void)
 
 	/*
 	 * The MMIO address is unique per package, and all the SMT
-	 * primary threads are online here. Find each MMIO space by
-	 * their package IDs to avoid duplicate staging.
+	 * primary threads are online here. Find unique MMIO space to
+	 * avoid duplicate staging.
 	 */
-	for_each_cpu(cpu, cpu_primary_thread_mask) {
-		if (topology_logical_package_id(cpu) == pkg_id)
-			continue;
-
-		pkg_id = topology_logical_package_id(cpu);
-
+	for_each_cpu_and(cpu, cpu_primary_core_mask, cpu_primary_thread_mask) {
 		err = rdmsrq_on_cpu(cpu, MSR_IA32_MCU_STAGING_MBOX_ADDR, &mmio_pa);
 		if (WARN_ON_ONCE(err))
 			return;
@@ -635,7 +629,7 @@ static void stage_microcode(void)
 		err = do_stage(mmio_pa);
 		if (err) {
 			pr_err("Error: staging failed (%d) for CPU%d at package %u.\n",
-			       err, cpu, pkg_id);
+			       err, cpu, topology_logical_package_id(cpu));
 			return;
 		}
 	}
diff --git a/arch/x86/kernel/cpu/topology.c b/arch/x86/kernel/cpu/topology.c
index 4913b64ec592..be6f5a3bd54f 100644
--- a/arch/x86/kernel/cpu/topology.c
+++ b/arch/x86/kernel/cpu/topology.c
@@ -75,12 +75,25 @@ bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
 	return phys_id == (u64)cpuid_to_apicid[cpu];
 }
 
+static unsigned int __max_cores_per_package __ro_after_init = 1;
+
 static void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid)
 {
 	if (!(apicid & (__max_threads_per_core - 1)))
 		cpumask_set_cpu(cpu, &__cpu_primary_thread_mask);
 }
 
+/*
+ * Select core 0 of every package and all SMT threads of that core so that the
+ * mask stays at core granularity.
+ */
+static void cpu_mark_primary_core(unsigned int cpu, unsigned int apicid)
+{
+	if (!((apicid >> get_count_order(__max_threads_per_core)) &
+	      (__max_cores_per_package - 1)))
+		cpumask_set_cpu(cpu, &__cpu_primary_core_mask);
+}
+
 /*
  * Convert the APIC ID to a domain level ID by masking out the low bits
  * below the domain level @dom.
@@ -505,13 +518,16 @@ void __init topology_init_possible_cpus(void)
 	pr_info("Max. logical dies:     %3u\n", cntb);
 	pr_info("Max. dies per package: %3u\n", __max_dies_per_package);
 
-	cnta = domain_weight(TOPO_CORE_DOMAIN);
-	cntb = domain_weight(TOPO_SMT_DOMAIN);
+	cntb = domain_weight(TOPO_CORE_DOMAIN);
+	__max_cores_per_package = 1U << (get_count_order(cntb) - get_count_order(cnta));
+	pr_info("Max. cores per package:%3u\n", __max_cores_per_package);
+
+	cnta = domain_weight(TOPO_SMT_DOMAIN);
 	/*
 	 * Can't use order delta here as order(cnta) can be equal
 	 * order(cntb) even if cnta != cntb.
 	 */
-	__max_threads_per_core = DIV_ROUND_UP(cntb, cnta);
+	__max_threads_per_core = DIV_ROUND_UP(cnta, cntb);
 	pr_info("Max. threads per core: %3u\n", __max_threads_per_core);
 
 	firstid = find_first_bit(apic_maps[TOPO_SMT_DOMAIN].map, MAX_LOCAL_APIC);
@@ -545,6 +561,7 @@ void __init topology_init_possible_cpus(void)
 			continue;
 
 		cpu_mark_primary_thread(cpu, apicid);
+		cpu_mark_primary_core(cpu, apicid);
 		set_cpu_present(cpu, test_bit(apicid, phys_cpu_present_map));
 	}
 }
diff --git a/arch/x86/kernel/cpu/topology_common.c b/arch/x86/kernel/cpu/topology_common.c
index 6845e3c63fbb..dc1d96be8ba5 100644
--- a/arch/x86/kernel/cpu/topology_common.c
+++ b/arch/x86/kernel/cpu/topology_common.c
@@ -20,6 +20,15 @@ EXPORT_SYMBOL_GPL(__amd_nodes_per_pkg);
 /* CPUs which are the primary SMT threads */
 struct cpumask __cpu_primary_thread_mask __read_mostly;
 
+/*
+ * CPUs belonging to the primary core of each package
+ *
+ * To preserve core-domain granularity and to avoid the next-level primary
+ * details that cpu_primary_thread_mask can present, the mask includes all
+ * threads of each primary core.
+ */
+struct cpumask __cpu_primary_core_mask __read_mostly;
+
 void topology_set_dom(struct topo_scan *tscan, enum x86_topology_domains dom,
 		      unsigned int shift, unsigned int ncpus)
 {
-- 
2.53.0

