Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3544F81AA8
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983586; cv=none; b=AiYqhoRmVL5IzDfExQ5mpuJgx9mydl09K/s9+vb1u/ROqCOnLN+wbUjpg98DnClCFDidJhubviayPXiONRsqLGsXHiwxj0MaUATLI/2P/jRQHLFRSA3o3q0yIshs5y4kSViSrcR/xoAnbcwMfR9MVPSdr0MRoU/eh823ApV8fo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983586; c=relaxed/simple;
	bh=tRXmeR3iy4rsst5L/oFh1PpUuYUMV/Q+k9wbKFOdnns=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qb8+mToXb7srpQ4pfZe7OSQ60bMtx2N1ru/zhcSRJgJJf8BRSPJN6j7XzdfNiLsalioi8sSfTZ9vwi1VzPOBc51cEo1mFPBgNgaUdBhpGZRzCCbymNp8VZ74WQUP3tEW/yyYQmqGCNG7/UaoklBYahfIGbCYDxvDyBsXjqmxBMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haWXPLgQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haWXPLgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787983584; x=1819519584;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tRXmeR3iy4rsst5L/oFh1PpUuYUMV/Q+k9wbKFOdnns=;
  b=haWXPLgQxxK6KJ/T1wrOw87N6bTNNQqguj3Lm/TdWK07mt221t3Vf0bQ
   DnXc4NKVxQt35yPLC/TMJubvokMfX0IDKylyWKd+E+394iRyKp3m4kh+8
   FWYVF66SAIY6lwum1iVRKtAHwAPaYMRLYcaBX2blCF4Bq/Cb+dFMavKy8
   HNTTkrnFfoauMABmvk3BfGM1b9+5PN+rnTsgX4F04GNwRlqsB8su7esiK
   CTq41dGSiRIEYGaerhSjbwj7C7PaS9MSN7PJi7Vq8yNXgQcQmMUySUrfS
   zeYj/81rkZF29SHke81InryrhTjF6AS138J5yxUv0stmPQBJXZ0rlN1u8
   A==;
X-CSE-ConnectionGUID: moYBvIXHRVmM0WWW9zky4Q==
X-CSE-MsgGUID: OvdEAsU+RqGJRSbsziydvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="98819492"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="98819492"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 23:06:23 -0700
X-CSE-ConnectionGUID: 0aDIHcLiRMSWKks7KEoXww==
X-CSE-MsgGUID: PL7cXvZ+QY+DyuZat0nmVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="262246968"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2026 23:06:19 -0700
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
Subject: [PATCH v7 0/9] Introduce MMIO-based CMT access for Enhanced RDT
Date: Sat, 29 Aug 2026 13:55:53 +0800
Message-Id: <cover.1787976868.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v6: https://lore.kernel.org/lkml/cover.1784968626.git.yu.c.chen@intel.com/
v5: https://lore.kernel.org/lkml/cover.1782866200.git.yu.c.chen@intel.com/
v4: https://lore.kernel.org/lkml/cover.1781332698.git.yu.c.chen@intel.com/
v3: https://lore.kernel.org/lkml/cover.1780710620.git.yu.c.chen@intel.com/
v2: https://lore.kernel.org/lkml/cover.1780587063.git.yu.c.chen@intel.com/
v1: https://lore.kernel.org/lkml/cover.1779872016.git.yu.c.chen@intel.com/

Intel Enhanced Resource Director Technology (ERDT) extends the existing
RDT framework with two major capabilities:

  1. MMIO-based access to monitoring and allocation registers, replacing
     the legacy MSR-based interface.
  2. Region-aware RDT for fine-grained control over different tiers of
     memory (e.g., CXL.mem, DDR).

This is described in the Intel RDT Architecture Specification:
https://cdrdv2-public.intel.com/789566/356688-intel-rdt-arch-spec.pdf

This patch set focuses on the first part: enabling MMIO-based access for
Cache Monitoring Technology (CMT), while CAT/MBM/MBA are still using MSR.
The platform advertises the MMIO register layout through the ACPI ERDT
(Enhanced Resource Director Technology) table, which contains sub-tables
describing per-domain register regions for monitoring and allocation.

With ERDT, L3 cache occupancy counters are read via MMIO rather than
MSR, allowing the reads to be performed from any CPU without requiring
cross-CPU IPIs. This series parses the relevant ACPI sub-tables (RMDD,
CMRC), prepares the resctrl monitor infrastructure for MMIO-based reads,
and adds initial support for reading L3 occupancy via the CMRC interface.

kselftest of CMT and L3_CAT has passed with minor adjustment at
https://lore.kernel.org/lkml/20260523101715.3964456-1-yu.c.chen@intel.com/.

Thanks Tony, Reinette, Thomas, Dave, Boris, Peter, Hongyu for your time to
look at this patch set.

V7 has gone through local sashiko review, with false positives left
unaddressed.

Changes from V6 to V7:
- Let get_rdt_resources() clean up its own state on failure and drop the
  asymmetric __resctrl_arch_late_init() wrapper. (Reinette Chatre)
- Make erdt_max_rmid and num_ids unsigned and use a plain min(), match
  erdt_ioremap() argument types to ioremap(), and reset erdt_max_rmid in
  erdt_exit(). (Reinette Chatre)
- Run erdt_cpu_valid() once in resctrl_arch_online_cpu(), and match an
  ERDT domain to a resctrl monitoring domain by domain id rather than by
  cpumask. Warn on an invalid dom_id and on a duplicate ERDT-to-resctrl
  domain mapping. (Reinette Chatre)
- Fix the silent truncation of the 64-bit CMRC up_scale: reject an
  out-of-range value with a FW_BUG warning and fail closed instead of
  using max_t(int, ...). (Reinette Chatre, Tony Luck)
- Keep the original resctrl_arch_rmid_read() parameter order (resource
  first) and drop the unused closid/arch_priv arguments. (Reinette Chatre)
- Keep a single erdt_cpu_has() declaration in asm/resctrl.h, required by
  the inline resctrl_arch_round_mon_val(). (Reinette Chatre)
- Use switch() in erdt_support(), clamp max_rmid with min_t() so MSR-based
  MBM events are not handed the ERDT RMID, and divide the ERDT scale by
  snc_nodes_per_l3_cache under SNC. (Reinette Chatre)

Changes from V5 to V6:
- Reorder the series so that the x86/topology change, which touches a
  different subsystem, comes first. (Reinette Chatre)
- Drop the v5 "x86/resctrl: Replace 'msr' in monitoring data identifiers"
  patch. None of the renamed identifiers are used by the MMIO code.
  (Reinette Chatre)
- Split the domain setup into erdt_cpu_valid() and
  erdt_l3_mon_domain_setup(). Validation now happens in
  domain_add_cpu_mon() before the CPU is added to the domain cpumask,
  and attaching ERDT data to a freshly created domain (Reinette Chatre)
- Drop the SNC special case and the new resctrl_disable_mon_event().
  (Reinette Chatre)
- resctrl_arch_round_mon_val() now rounds to the ERDT scale instead of
  returning the value unchanged (Reinette Chatre)
- Make erdt_get_max_rmid() a global value instead of a per-CPU lookup.
  (Reinette Chatre)
- Use struct cpumask instead of cpumask_var_t, list_for_each_entry()
  instead of open coded container_of(), and document every member of
  struct erdt_domain_info. (Reinette Chatre)

Thanks Tony, Reinette, Thomas, Hongyu for your time to look at this patch set.

Changes from V4 to V5:
There are some major changes since v4:
- (biggest change) Eliminate the xarray for runtime lookups; embed
  struct erdt_domain_info directly in rdt_hw_l3_mon_domain and assign
  during l3_mon_domain_setup().
- Separate CPUID and ACPI enumeration cleanly. Do not use CPUID feature
  flags to gate MMIO-based monitoring. Use ACPI table presence (e.g., CMRC table)
  to determine event enablement.
- Use ACPI RMDD's own "Max RMID" field for MMIO access instead of relying
  on CPUID's max RMID (which applies to MSR).
- Enforce the SNC constraint in code rather than burying it behind a comment
  WARN. Disable mon_capable in rdt_get_l3_mon_config() when ERDT is
  enabled and snc_nodes_per_l3_cache > 1.
- Split non-resctrl changes (topology.c, apic.h) into a separate preparatory
  patch prefixed with x86/topology.
- Move the "depends on X86" to "X86_64" adjustment to a separate patch with explicit
  justification in its changelog.

Changes from V3 to V4:
- Remove the redundant table length check in subtbl_valid() (Thomas Gleixner)
- Reuse subtbl_valid() for all the table iteration (Thomas Gleixner)
- Refine the commit log of [PATCH 5/6] to state that this change is a
  preparation for [PATCH 6/6] rather than fixing an existing issue
  (Thomas Gleixner, Reinette Chatre, Tony Luck)
- Fix if CACD lists all CPUs in the LLC domain (sashiko)
- Deal with a corner case that if there is no valid RMDD tables,
  the erdt_enabled_flag should remain false.(sashiko)
- Add Thomas's Reviewed-by and Hongyu's Tested-by.

Changes from V2 to V3:
- Wrap __resctrl_arch_late_init() to avoid the goto logic. (Thomas Gleixner)
- Make the variables in struct erdt_domain_info tabular format (Thomas Gleixner)
- Remove tail comments (Thomas Gleixner)
- Make the name of erdt_enabled() and variable in it consistent and
  comprehensible. (Thomas Gleixner)
- Use topo_lookup_cpuid() to search the CPU id according to the x2apic id
  (Thomas Gleixner)
- Fix kernel doc comment format (Thomas Gleixner)
- Use brackets for multiple lines "if" case. (Thomas Gleixner)
- Let the parameter for cacd_init() to fully utilize 100 characters.
  (Thomas Gleixner)
- Variables are reordered in reverse fir-tree.(Thomas Gleixner)
- Added a named constant and use it in the rmdd->flags check.
  (Thomas Gleixner)
- Introduce helper functions to make the code readable when iterating
  the RMDD tables. (Thomas Gleixner)
- Make the macros tabular format. (Thomas Gleixner)

Changes from V1 to V2:
- Add #include <linux/cleanup.h> to follow the "include-what-you-use" best
  practice (Tony Luck)
- Fix 3 issues reported by:
  https://sashiko.dev/#/patchset/cover.1779872016.git.yu.c.chen%40intel.com
  Remove the variable of cacd in struct erdt_domain_info as it will
  never be used after initialization.
  Invoke erdt_exit() to avoid resource leak if rdt_alloc_capable and
  rdt_mon_capable are both false.
  Adjust the comments suggested by sashiko.

Chen Yu (8):
  x86/topology: Export topo_lookup_cpuid() for resctrl use
  x86/resctrl: Require 64-bit x86 for resctrl support
  x86/resctrl: Parse ACPI ERDT table and save CACD cpumask for RMDD
    domains
  x86/resctrl: Attach ACPI ERDT information to L3 mon domain on CPU
    online
  x86/resctrl: Parse ACPI CMRC table
  x86/resctrl: Refactor the monitor read function
  x86/resctrl: Introduce erdt_cpu_has() and erdt_support()
  x86/resctrl: Add MMIO-based LLC occupancy monitoring support

Tony Luck (1):
  fs/resctrl: Do not invoke smp_processor_id() in preemptible context

 arch/x86/Kconfig                       |   4 +-
 arch/x86/include/asm/apic.h            |   1 +
 arch/x86/include/asm/resctrl.h         |  11 +-
 arch/x86/kernel/cpu/resctrl/Makefile   |   1 +
 arch/x86/kernel/cpu/resctrl/core.c     |  61 ++-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 518 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  50 ++-
 arch/x86/kernel/cpu/resctrl/monitor.c  |  38 +-
 arch/x86/kernel/cpu/topology.c         |   2 +-
 fs/resctrl/monitor.c                   |  44 ++-
 10 files changed, 702 insertions(+), 28 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/resctrl/erdt.c

-- 
2.25.1

