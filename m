Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078E3470EB9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780053; cv=none; b=GV80Ag3Add142QTTVtoxjA/dSheiapTcVSHgzb8eAP7SUHZ1nM2wgNvl8GOrPyDsPQCIImHgyriqAa7EMdwvosrPNMTcDM7hoRrDcTiCUhfu5DbV2XZA5iM4iDKSSGhxtoxRQmo0hsEMRMTMGe5IMEcuAnfjmjliPBenU2kDHC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780053; c=relaxed/simple;
	bh=uoIPZGFm3zXWz2GbMWdQ70qp9JBZ/Du6pZ496mbDYJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYmoqHqagye+7u+rj8zhqVsR4nMwW/sNlzXds9STm7LPWjMVg76saSLSttge7nJLs9yoF7bL+e5NH5Xb5efbEfdDY+pHZ29T12jpXMY+87wIkED1inhFHZdgQDGlMFgBVQGAkL3bZE2dHE3cU92ZkqyZQAnxBNxurlFPYEodWqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vwcQeaXc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vwcQeaXc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA7FA1476;
	Mon,  7 Sep 2026 04:20:42 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FEA23F7D8;
	Mon,  7 Sep 2026 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788780046; bh=uoIPZGFm3zXWz2GbMWdQ70qp9JBZ/Du6pZ496mbDYJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vwcQeaXcCn6EDJOx6OcevTDewdridqP6uJr0fmeNCavhFG27qAuFdgO3aKY3ctSzF
	 7j2NBGt7EDp+HMlRTjCn3+n/aJWKcwrjC2A/bhSQsVL9RR4MiiCIj0zl65EUH5Mj22
	 pNnqLYBTX56DhCxAKsO7w1MeUo5WPe+qg1vyam+U=
Message-ID: <9d2f589a-7d10-44ee-a7a4-7d75d860e988@arm.com>
Date: Mon, 7 Sep 2026 12:20:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 00/19] arm,fs/resctrl: ARM MPAM MB_NODE support
To: Fenghua Yu <fenghuay@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Tony Luck
 <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Dave Martin <Dave.Martin@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>, Chen Yu <yu.c.chen@intel.com>,
 Babu Moger <babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>,
 Vikram Sethi <vsethi@nvidia.com>, Shanker Donthineni
 <sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>,
 Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Fenghua,

On 31/08/2026 18:22, Fenghua Yu wrote:
> This series enables MBA bandwidth control emulation on ARM MPAM when the
> default MB control is disabled, using a node-scoped MB_NODE control as
> the native backend.  It extends memory-bandwidth monitoring and
> control to memory-level MSCs or CPU-less NUMA nodes, and adds
> documentation and tests.
> 
> Background
> 
> On x86, MBA bandwidth control is typically associated with the L3 cache:
> schemata lines use L3 cache ids and monitor domains appear as mon_L3_XX.
> On some ARM MPAM systems the MBA control is backed by a memory-level MSC
> rather than the L3 cache MSC.  A memory-level MSC is represented as a
> NUMA node, and that node commonly has no CPUs of its own (a memory-only
> node that still participates in bandwidth control).  For such a resource
> the control scope is NODE, schemata identifiers are NUMA node ids,
> monitor domains are named mon_NODE_XX, and a node-scoped MB_NODE control
> may be the only control with usable bandwidth hardware.
> 
> Because the memory-level MSC lives on a CPU-less NUMA node, the driver
> must handle nodes with no local CPUs.  mpam_ris_get_affinity() derives
> affinity from the component's NUMA node id, so a memory-only node would
> otherwise end up with an empty CPU mask and never be registered.  When
> the derived mask is empty, the driver falls back to cpu_possible_mask
> (masked by MSC accessibility) so the node still gets a resctrl domain.
> The borrowed affinity is kept out of class->affinity: those CPUs already
> contribute through CPU-ful nodes in the class, and subtracting the
> borrowed mask on teardown would remove CPUs that other live nodes still
> depend on.  Domain setup iterates all MSC components per CPU (keyed by
> component), so each component — including these CPU-less memory nodes —
> gets its own control and monitor domain.
> 
> Examples of NODE and emulation interfaces on MPAM.
> 
> ** On platform with CPU-less nodes, by default, control_mode is legacy.
> 1. By default, MB is emulated by MB_NODE in schemata.
> info/
> ├── MB
> │   ├── bandwidth_gran
> │   ├── control_mode        # [legacy] native
> │   └── schemata
> │       └── MB
> │           ├── MB_NODE     # emulated by "MB_NODE"
> 
> schemata: Only show MB, which is emulated by MB_NODE. domain id is numa
> id
> MB:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
> L3:1=ffff;2=ffff
> 
> 2. root can switch to native by writing "native" to "control_mode":
> info/
> ├── MB
> │   ├── bandwidth_gran
> │   ├── control_mode        # legacy [native]
> │   └── schemata
> │       └── MB
> │           ├── MB_NODE     # no emulation, native mode
> 
> schemata: Only show MB_NODE. No "MB:" is emulated.
> MB_NODE:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
>      L3:1=ffff;2=ffff
> 
> 3. llc_occupancy in mon_L3_x where x is cache id
>    mbm_total_bytes in mon_NODE_y where y is numa id
> mon_data/
> mon_L3_01  mon_NODE_00  mon_NODE_02  mon_NODE_18  mon_NODE_34
> mon_L3_02  mon_NODE_01  mon_NODE_10  mon_NODE_26  mon_NODE_35
> 
> mon_data/mon_L3_01/llc_occupancy
> mon_data/mon_NODE_01/mbm_total_bytes
> 
> ** On legacy machine which only has L3 MSCs. No NODE scope in schemata
>    or mon_data
> schemata: MB's domain id is cache id, not numa node id
> MB:1=100;2=100
> L3:1=ffff;2=ffff
> 
> mon_data/
> mon_L3_01 mon_L3_02
> 
> mon_data/mon_L3_01/llc_occupancy
> mon_data/mon_L3_01/mbm_total_bytes
> mon_data/mon_L3_02/llc_occupancy
> mon_data/mon_L3_02/mbm_total_bytes
> 
> The patches can be compiled but not tested on x86 yet.
> 
> The 19 patches are grouped as follows:
> 
> 1. Memory bandwidth monitoring and control on memory-level MSCs
>    (patches 1–10, 12)
> 
>    Generalise the monitor infrastructure beyond hard-wired L3 paths:
>    de-hardcode L3 monitor plumbing, expose MBA MBM counter assignment,
>    name node-scoped monitor domains mon_NODE_<id>, add a node-scope MBM
>    total event, and make MBM handling resource-aware.
> 
>    On the ARM MPAM side, add memory-level MSC and ABMC support, refine
>    L3 topology and class selection, refactor domain setup to iterate all
>    MSC components per CPU (keyed by component), and handle CPU-less NUMA
>    memory nodes that have no local CPUs but still participate in MPAM
>    bandwidth control. Memory hotplug locking and notifier are added.
> 
> 4. MB_NODE emulates MB (patch 11) [1]
> 
>    Wire MB_NODE as the native backend that emulates a MB control
>    in the ARM MPAM driver.
> 
>    If emulation is unnecessary, this patch can be removed.
> 
> 5. Documentation (patches 14–17)
> 
>    Document memory-level MB control and NUMA nodes in the arm64 MPAM
>    guide (patch 19), NODE-scoped MBA domains and mon_NODE_* monitoring
>    in the resctrl documentation (patch 20), and an MB_NODE emulation
>    example on ARM MPAM (patch 21).
> 
> 6. Tests (patches 18–19)
> 
>    Add a KUnit test for CPU-less NUMA node affinity handling and a
>    kselftest that exercises MB emulation mode switching,
>    resource_schemata hierarchy, and schemata mirroring on ARM MPAM.
> 
> Apply the patches on top of [2].
> 
> Testing
> 
>   # KUnit (CPU-less affinity)
>   sudo cat /sys/kernel/debug/kunit/mpam_devices_test_suite/results
> 
> 
>   # kselftest (MB emulation; requires ARM MPAM with disabled MB control)
>   cd tools/testing/selftests/resctrl
>   sudo ./resctrl_tests -t mb_emulation
> 
> This series is in https://github.com/fyu1/linux/  cpu_less.rfc.v2/
> which is on top of [2].
> 
> Change Log:
> RFC v2:
> - Remove fix patches 1-2 which are implemented in [2]
> - Remove the emulation patches 3-8 which are implemented in [2]
> - Update emulated_by to *emulated_by in patch 11. Ben seems
>   doesn't like to emulate MB by MB_NODE. If that's case, I can
>   remove this patch. But for now, I keep this patch for further
>   discussion.

The discussion regarding MB/MB_NODE emulation is on this thread:

https://lore.kernel.org/lkml/6cf3efa5-697f-476d-9f8b-0c97bebd706b@intel.com/

Thanks,

Ben

> - Add patch 13 to implemente legacy and native modes to emulate
>   "mbm_L3_assignments" by "mbm_NODE_assignments" in patch 13.
> - Add patch 9 for memory hotplug locking (Ben)
> - Add patch 12 for memory hotplug notifier (Ben)
> 
> RFC v1:
> https://lore.kernel.org/lkml/cover.1784217438.git.fenghuay@nvidia.com/
> 
> [1] [RFC v2] mpam,x86,fs/resctrl: Generic schema description Proof of Concept https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
> [2] Reinette's resctrl control branch RFC v2: git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2.4
> 
> Fenghua Yu (17):
>   resctrl: De-hardcode L3 monitor infrastructure
>   resctrl: Expose MBA MBM counter assignment sysfs
>   resctrl: name node-scoped monitor domains mon_NODE_<id>
>   resctrl: Add node-scope MBM total event
>   resctrl: Make MBM paths resource-aware
>   arm_mpam: Support memory-level MSCs and ABMC per class
>   arm_mpam: Refine L3 topology and class selection
>   arm_mpam: Include all MSC components during domain setup
>   arm_mpam: Handle CPU-less numa nodes
>   arm_mpam: Emulate MB control with node-scoped MB_NODE control
>   resctrl: Add mbm_assign_scope_mode for native assignment file names
>   Documentation: resctrl: document mbm_assign_scope_mode
>   Documentation: arm64: mpam: document memory-level MB control and NUMA
>     nodes
>   Documentation: resctrl: document NODE-scoped MBA domains and mon_NODE
>     monitoring
>   Documentation: resctrl: document MB_NODE emulation example on ARM MPAM
>   arm_mpam: Add KUnit test for CPU-less NUMA node affinity
>   selftests/resctrl: Add MB emulation test for ARM MPAM
> 
> James Morse (2):
>   fs/resctrl: Take memory hotplug lock whenever taking CPU hotplug lock
>   arm_mpam: resctrl: Add NUMA node notifier for domain online/offline
> 
>  Documentation/arch/arm64/mpam.rst             | 105 ++-
>  Documentation/filesystems/resctrl.rst         | 135 ++-
>  drivers/resctrl/mpam_devices.c                |  59 +-
>  drivers/resctrl/mpam_internal.h               |   8 +
>  drivers/resctrl/mpam_resctrl.c                | 879 +++++++++++++++---
>  drivers/resctrl/test_mpam_devices.c           |  67 ++
>  fs/resctrl/ctrlmondata.c                      |   6 +-
>  fs/resctrl/internal.h                         |  18 +-
>  fs/resctrl/monitor.c                          | 355 +++++--
>  fs/resctrl/pseudo_lock.c                      |   3 +
>  fs/resctrl/rdtgroup.c                         | 157 +++-
>  include/linux/memory.h                        |   1 +
>  include/linux/resctrl.h                       |  36 +-
>  include/linux/resctrl_types.h                 |  15 +-
>  .../selftests/resctrl/mb_emulation_test.c     | 314 +++++++
>  tools/testing/selftests/resctrl/resctrl.h     |   1 +
>  .../testing/selftests/resctrl/resctrl_tests.c |   1 +
>  17 files changed, 1827 insertions(+), 333 deletions(-)
>  create mode 100644 tools/testing/selftests/resctrl/mb_emulation_test.c
> 

