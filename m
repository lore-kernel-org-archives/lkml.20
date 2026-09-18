Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF593F39E4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707506; cv=none; b=ZBLu2F9GPcLTZioWy8fnu2gQkACRtWc+47Ka/Scv/+AZo82ehzuSFrw98sFGxT6o+zZHJ/C84I/vSvchfgZfixrcxU21Gof8nnMj80r7I6t+kI0tIQqzI/uZmnXeSZgjtoFAhq8MjjQ44srjepOHtUWgQSHduDHQLxjWar3eA8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707506; c=relaxed/simple;
	bh=9y1t0Y30NqREQWFwe2pf01FRD51CZgMGk32bn/ikSeA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I/kXBguPO8Ptn8mIG1PCx0zc96azUAV8IAcxHvtOmSkDgnIcedciQVGq5/UxW+2soIc5vKhHlw4mG98nbefAdWPky4hFDG896mErg/Ne809XRfScxLkRcdPDzfQ6loJWy+jaD5LsXKyZ/dK1kKuNFlXLevl/dln0ovprRP3t8pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3hsIcr3; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3hsIcr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789707504; x=1821243504;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9y1t0Y30NqREQWFwe2pf01FRD51CZgMGk32bn/ikSeA=;
  b=V3hsIcr3gTP5uTsbBe6WmG6g+rVbWccQ6TDoOUZWr2+D9fBAx5qYqHmM
   Bypo0GE0rwaDm0Y1Db6xwnAlY1tPbDhtKCgNKTFlDCaiEI61J3NQsBfoO
   JMbR6nUo7vSY2Skycy8wg2aA3s2+yHidIxOW42No7S7nkIDRA3VzuuQpP
   MqDL/cXbSzVFEkyGetFgm4EiXP58Xa61le7ViyqLjTacQyEGOLAHPRbwu
   F7BrAqGTXJcpUitLFAH7Yr5rxBKcDxNEAnFS3Hg6q6u5dIWafzQmIKcIH
   8xLdLTeVSQd5Grqbx9TFOiaAiD6vVNkfQg1oMtzN+6SvGMqx2XmWtsvQU
   Q==;
X-CSE-ConnectionGUID: t7fNh+EOT0apsmZERrwoRQ==
X-CSE-MsgGUID: EVRTn20+Q6mU4JqqQ9PEAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="691528"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="691528"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 21:58:23 -0700
X-CSE-ConnectionGUID: 65bjca+gSfiZQx+p4yt+VQ==
X-CSE-MsgGUID: bGNZJNrJS4CJLMAtGAOj6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269905565"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2026 21:58:20 -0700
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
Subject: [PATCH v8 0/9] Introduce MMIO-based CMT access for Enhanced RDT
Date: Fri, 18 Sep 2026 12:46:43 +0800
Message-Id: <cover.1789705667.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

V8 has gone through local sashiko review, with false positives left
unaddressed. Also used AI to confirm each review feedback has been
addressed by v6 and v7.

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

Chen Yu (7):
  x86/topology: Export topo_lookup_cpuid() for resctrl use
  x86/resctrl: Parse ACPI ERDT table and save CACD cpumask for RMDD
    domains
  x86/resctrl: Attach ACPI ERDT information to L3 mon domain on CPU
    online
  x86/resctrl: Parse ACPI CMRC table
  x86/resctrl: Refactor the monitor read function
  x86/resctrl: Introduce erdt_cpu_has() and erdt_support()
  x86/resctrl: Add MMIO-based LLC occupancy monitoring support

Tony Luck (2):
  x86/resctrl: Require 64-bit x86 for resctrl support
  fs/resctrl: Do not invoke smp_processor_id() in preemptible context

 arch/x86/Kconfig                       |   4 +-
 arch/x86/include/asm/apic.h            |   1 +
 arch/x86/include/asm/resctrl.h         |  11 +-
 arch/x86/kernel/cpu/resctrl/Makefile   |   1 +
 arch/x86/kernel/cpu/resctrl/core.c     |  60 ++-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 522 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  48 ++-
 arch/x86/kernel/cpu/resctrl/monitor.c  |  40 +-
 arch/x86/kernel/cpu/topology.c         |   2 +-
 fs/resctrl/monitor.c                   |  48 ++-
 10 files changed, 704 insertions(+), 33 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/resctrl/erdt.c

-- 
2.25.1

