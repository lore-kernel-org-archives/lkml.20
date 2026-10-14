Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EE43B71BB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947268; cv=none; b=sPuFRxhRgIUbejho4Rw59LOCN8ruQ0sslKc0ncN4voVz38cIv1/GQM1YAV2MTiEvjNYV7D0W7e7jV1ethraxPfEFTjEyfgqGUVPbIILLAh71Qlv9zGktc/tl0/HQ3tno7Zaa/MXGpkZcR2s/zy1ctv9yNFTwO2Gx5eVGbsUsEVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947268; c=relaxed/simple;
	bh=k36YUgdQP7P5sUNGR1OWPZK1ydfiDrMr2SflrBR3wSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OnIE4VOSS7EPk7bEW1wTDD7yqqMHV46x65DPX6k0b3Zsvc4X7MMIKNN6v0K/J4SLInh7cmT5pOgT+MEC7vF3v0DeCUPRmpAT78Rz3XiRKKu9NiS5Lsps5CjLGndWVv+lnPRRttuuQNci9VzJ2KspTGt1XJQmE7JQPqzn7hwReH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FN9U2X9B; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FN9U2X9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947266; x=1823483266;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k36YUgdQP7P5sUNGR1OWPZK1ydfiDrMr2SflrBR3wSQ=;
  b=FN9U2X9B0oyJNNfPyCUpg1WBzQmIS8qz5aNVAo6iEfgc409eaXc7Vdx1
   NIywsZxxSMygL96XXVhvA0ho9UHyWuHupg+tAjphD7AtbbIwEqu/StHwG
   3fS+JzWLgFdtTBCBlloB1RM/voaKp+samGBTQyHqhT0mMeCw6WRRYF2ga
   7TAqJfNYyXHo/OiHKHpMvrfriqKEihlxpyOYrdEQlCRhtRT0F75McmcnC
   ODW//UD0jAy2IUKlnf7VaPPfoevbFr1fmqbu/msMaM0Kj9Q/bh97/8lLi
   KcMqghKpIwA9s84LyhJC1NnZTJoZxO1Rjyuq03ofK+a2NYYVAoyb4uZum
   A==;
X-CSE-ConnectionGUID: jDAZb55/Qzmvw9gusApG+A==
X-CSE-MsgGUID: XDxKLu1sQuKuaYTWPi0u6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="692593"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="692593"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:07:32 -0700
X-CSE-ConnectionGUID: SUSDyK4nQaydvrQ4oBQYJQ==
X-CSE-MsgGUID: vE9lCSn7QOGh8E/MnhZY/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1395097"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa003.fm.intel.com with ESMTP; 13 Oct 2026 20:07:27 -0700
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
	Chen Yu <yu.c.chen@intel.com>
Subject: [PATCH v9 00/12] Introduce MMIO-based CMT access for Enhanced RDT
Date: Wed, 14 Oct 2026 10:56:57 +0800
Message-Id: <cover.1791933001.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v8: https://lore.kernel.org/lkml/cover.1789705667.git.yu.c.chen@intel.com/
v7: https://lore.kernel.org/lkml/cover.1787976868.git.yu.c.chen@intel.com/
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

V9 has gone through local sashiko review, with false positives left
unaddressed. Also used AI to confirm each review feedback has been
addressed by v9. The change history in the section "Changes since v8"
in each patch is generated by AI.

Major functional changes from V8 to V9:
- Do not enable ERDT when Sub-NUMA Cluster (SNC) is enabled.
  New patch [PATCH 04/12]. (Reinette Chatre, Tony Luck, sashiko)
- CPUID remains the architectural enumeration mechanism: erdt_cpu_has()
  now requires boot_cpu_has(flag) in addition to ERDT firmware support.
  (Reinette Chatre, Tony Luck)
- [bug fix] Attach the ERDT information to the L3 monitoring domain before the
  domain is published on the RCU protected domain list.
  (Reinette Chatre, sashiko)
- Do not discard the whole ERDT table when a CACD x2APIC ID has no
  logical CPU, e.g. (Reinette Chatre, sashiko)

Changes from V7 to V8:
- Rebased on latest x86/cache branch
  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
- git commit log revisement
- pick Tony's x86_64 dependency patch from AET patch set and replaced
  mine.
- No other code logic changes

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

Chen Yu (10):
  x86/topology: Export topo_lookup_cpuid() for resctrl use
  x86/resctrl: Parse ACPI ERDT table and save CACD cpumask per RMD
  x86/resctrl: Do not enable ERDT when Sub-NUMA Cluster is enabled
  x86/resctrl: Attach ACPI ERDT information to L3 mon domain on CPU
    online
  x86,fs/resctrl: Move resctrl_arch_round_mon_val() out of line
  x86/resctrl: Add a global ERDT monitor scale
  x86/resctrl: Parse ACPI CMRC table
  x86/resctrl: Refactor the monitor read function
  x86/resctrl: Introduce erdt_cpu_has() and erdt_support()
  x86/resctrl: Add MMIO-based LLC occupancy monitoring support

Tony Luck (2):
  x86/resctrl: Require 64-bit x86 for resctrl support
  fs/resctrl: Do not invoke smp_processor_id() in preemptible context

 arch/x86/Kconfig                       |   4 +-
 arch/x86/include/asm/apic.h            |   1 +
 arch/x86/include/asm/resctrl.h         |   9 -
 arch/x86/kernel/cpu/resctrl/Makefile   |   1 +
 arch/x86/kernel/cpu/resctrl/core.c     |  45 ++-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 525 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  45 +++
 arch/x86/kernel/cpu/resctrl/monitor.c  |  60 ++-
 arch/x86/kernel/cpu/topology.c         |   2 +-
 drivers/resctrl/mpam_resctrl.c         |   5 +
 fs/resctrl/monitor.c                   |  47 ++-
 include/linux/arm_mpam.h               |   5 -
 include/linux/resctrl.h                |   1 +
 13 files changed, 703 insertions(+), 47 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/resctrl/erdt.c

-- 
2.43.0

