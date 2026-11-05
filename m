Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873946;
	b=mszCUTsaGJYsfSsS1YyrnHjbIT1Tl4GUpvnuBc1twYAQwdITuabfjpZPkGO4QX2aEIi4
	 X8V4VtUlXz5SWDRSmfvww2iOxfImq0cxulgEGDI3AndKjsdKCbHkH0Lb265XnuRgOGNJm
	 Ipz4udZ9ORvSjuL2kc2e3FR4lWqLgMgXn/mhUm9t032W4BoeWSlRXAoMErbj+GYRCNCts
	 oLnrx728LyiNtvgiIreWXajAkZN8KYE9M8aJmySSWKpmxBLZY9y69c03020F/tltCw2FU
	 xEqqJH3EcnTIXIPmdIn5JV74zFvKO3s+4WUY4J5VUyU6c/s1PuYqvO2d6/1zHcFWMjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873946;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5OdvKB1o9XnG/sz03v94JbwzOMhxDCPfZ2hyW/qjgT8=;
	b=ongrwKABfFmmLkrtl5lmvYZkcoyhAOGCVs7EtVjg03fxM/Ke3TuHvGX97LcYsloOR3va
	 kp5tlShPjlTjbOo96h0zhNwmQhgYDVlf8o6xlsKAHRdlT7M+O3SeHT9XL4uaaS565dPMl
	 nsIsvtXHW0qV/3zvFpYlDjoKIkK+J4h5f4e769k1V0hdCklP1byP7k0PNCvML/253+O/T
	 cE0Buz9bWhW7OLFIZKJ0rT+bTE7rMieM0ylF+hZq+xvAVfE84zVjmjvv5UYRtcj7zFd84
	 iVRLMzEos7A1azxu4/LuYhCcvlZ8OGT3LBir8VwXhHLBVP3t33X2zeQJLED5jFAloWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mzPprXGt;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389CA606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 389CA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mzPprXGt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793873943; x=1825409943;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UKg+9L52y0QqDp7pNRMWX3aax9w211FOORGZP28ytp8=;
  b=mzPprXGtsmkYN6/N5GXh1ZmAqtAbNtrS0a15yM/eOD/yE4F23qt6tRYp
   7P2D9xG2q4vj8grQ6+Lv7pnLTnJmsqfv/swVEbrkaK5UGlKD2OQzWpsgW
   zmCPXbNqBuEkdVksqTTNik/3v+RPSL/85MzlflNy/rfDxB3qxGsxm+PEy
   3wZEJYKOk6eogJ2IVKeGn+uG593IsgjnkTGs0u2wU89mqpTWCNipKbWTL
   edxBfxyYoe10eyS5N1lNRF0rNuueEHBM1V4pcMx1AmV+w9jKQqzZyQwxW
   FOkDmPwbo/+ZF/qxfbFyeJvhq4lze8H5asdNiM6cVWVBlG1R60aFMxy8W
   Q==;
X-CSE-ConnectionGUID: cGXpIyifSFCANw1s6uJJ7A==
X-CSE-MsgGUID: OYAiKY23SLanHT7d5A6O9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2533826"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2533826"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:19:03 -0800
X-CSE-ConnectionGUID: rppnEQ9yQUWFUK2fY4mT1g==
X-CSE-MsgGUID: GfDtkN6uR1quapgmgo2Xbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7380290"
Received: from chenyu-dev.sh.intel.com ([10.239.62.184])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2026 02:18:59 -0800
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
Subject: [PATCH v10 00/12] Introduce MMIO-based CMT access for Enhanced RDT
Date: Thu,  5 Nov 2026 18:07:59 +0800
Message-Id: <cover.1793864720.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
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

v9: https://lore.kernel.org/lkml/cover.1791933001.git.yu.c.chen@intel.com/
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
CACD, CMRC), prepares the resctrl monitor infrastructure for MMIO-based
reads, and adds initial support for reading L3 occupancy via the CMRC
interface. ERDT is not compatible with Sub-NUMA Cluster (SNC) mode and
stays disabled when SNC is enabled.

Thanks Tony, Reinette, Thomas, Dave, Boris, Peter, Hongyu for your time to
look at this patch set.

Internal sashiko has not reported any issues on the v10. The change history
in the section "Changes since v9" in each patch is generated by AI.

Major changes from V9 to V10:
- Reorder the series (Reinette Chatre):
  - Move "arm,x86,fs/resctrl: Move resctrl_arch_round_mon_val() out of
    line" (renamed from "x86,fs/resctrl: ...") to patch 02 so that MPAM
    maintainers only need to review that patch.
  - Replace v9 "x86/resctrl: Do not enable ERDT when Sub-NUMA Cluster is
    enabled" with the new [PATCH 04/12] "x86/resctrl: Detect Sub-NUMA
    Cluster mode before enumerating resources", and move the ERDT/SNC
    check into [PATCH 05/12].
  - Replace v9 "x86/resctrl: Add a global ERDT monitor scale" with the
    new [PATCH 11/12] "x86/resctrl: Add the ERDT CMT scale", placed after
    the CMRC parsing and erdt_cpu_has() patches. The scale is renamed to
    erdt_cmt_scale/erdt_get_cmt_scale() and is reset in erdt_exit().
- [behavior change] Do not fail the CPU online operation when ERDT and
  CPUID disagree on a CPU's L3 domain. Keep the CPU online and in the
  default group, but out of all resctrl domains. erdt_try_bind_cpu() is
  renamed to erdt_try_bind_domain(). (Reinette Chatre)
- Skip an RMDD that does not list any CPU known to the kernel, e.g. when
  all of them are excluded by nr_cpus=, and map its control registers
  only after it is known to have CPUs. (Reinette Chatre)
- Limit RMIDs by the ERDT max_rmid whenever ERDT is enabled, not only
  when LLC occupancy is read via MMIO, because RMDD max_rmid applies to
  all RMIDs. (Reinette Chatre)
- [bug fix] Fix the truncating u32 cast in the CMRC register size check.
  (Reinette Chatre)

Changes from V8 to V9:
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
  arm,x86,fs/resctrl: Move resctrl_arch_round_mon_val() out of line
  x86/resctrl: Detect Sub-NUMA Cluster mode before enumerating resources
  x86/resctrl: Parse ACPI ERDT table and save CACD cpumask per RMD
  x86/resctrl: Attach ACPI ERDT information to L3 mon domain on CPU
    online
  x86/resctrl: Parse ACPI CMRC table
  x86/resctrl: Refactor the monitor read function
  x86/resctrl: Introduce erdt_cpu_has() and erdt_support()
  x86/resctrl: Add the ERDT CMT scale
  x86/resctrl: Add MMIO-based LLC occupancy monitoring support

Tony Luck (2):
  x86/resctrl: Require 64-bit x86 for resctrl support
  fs/resctrl: Do not invoke smp_processor_id() in preemptible context

 arch/x86/Kconfig                       |   4 +-
 arch/x86/include/asm/apic.h            |   1 +
 arch/x86/include/asm/resctrl.h         |   9 -
 arch/x86/kernel/cpu/resctrl/Makefile   |   2 +-
 arch/x86/kernel/cpu/resctrl/core.c     |  50 ++-
 arch/x86/kernel/cpu/resctrl/erdt.c     | 559 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  51 ++-
 arch/x86/kernel/cpu/resctrl/monitor.c  |  54 ++-
 arch/x86/kernel/cpu/topology.c         |   2 +-
 drivers/resctrl/mpam_resctrl.c         |   5 +
 fs/resctrl/monitor.c                   |  47 ++-
 include/linux/arm_mpam.h               |   5 -
 include/linux/resctrl.h                |   1 +
 13 files changed, 737 insertions(+), 53 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/resctrl/erdt.c

-- 
2.25.1

