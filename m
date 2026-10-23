Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792718627;
	b=ItsBE2K5wNMvE1/nXTNamh4VP19fUbEMoVPMPAuzB6xxB6wp68fF1gqLlDvq+N4xCjIG
	 e4KmJLVhILmf9TrMkLTAP71saKVWCYL9GmX+XCy/rJAtweY+TncBv4zLxvV0e6ZpLkkUZ
	 Acpg1H2KZ7Ft9DbDMdJftUARrLab17Yp7DhtvGIYlIo3vVXug+E0Z9U5IUCltyUuQv/He
	 FKXIx+eUIxG4zFsmF1Oi9+4lrksh+ThIOH6heASeK3cHSlKkkexz0SJuienVLvWOShYPN
	 ALxOlf0x4oivhu4CXYOW84n+YIqAq/bzrkX2X/f6hFHR6w31Zbv01USYYLkAv+2UkbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792718627;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=K5yLonYWgOmg+PAeVcPBoGQLdK4Hwc1Y9SMwne6Zl2c=;
	b=iyOFiCZ7Xb2R0Hdm0f64hy+PKInJgovjm7vUaNGCKw9xTQxAcr1FKpIr5sSDwelFtuoM
	 cdC6SNeBTlhplHC7rmAm9cA5R6dc3JexFP7Eq5SrrTttvB5w+aMwhwubYGgChy+eWXrtr
	 p2X8bLyEKAUHngyoYxyxFsz2O/ekOt7I6Thsbp+j1dVIvrgPKhJRiHRtWo5Ahwv3zG6i2
	 haw/gtoPGbK/69wDGjrooQEQLJ6SDQoyYYxw6qvglUlj+sNbM9+2m+H5Ur1KvG7kVWoMx
	 Fbtc2dxGe5JnNS2OQHmrnd19slmQz0kT/aVJA/3YA6Q8ZpAw8bWIe50TOSLGxyJXpnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dwh3SgbJ;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B979606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B979606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dwh3SgbJ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=K5yLonYWgOmg+PAeVcPBoGQLdK4Hwc1Y9SMwne6Zl2c=;
	b=dwh3SgbJaone+LjT5mlfaGi7Hp3dPFflo8BQwUpDoglDz1qKtQrN6R+w78Mx/d+y1Q1Y8lB3s
	sfeHGhfpbt5uzMAWWC0nCIg5WZKeeIBvqgAVzTsTkQCEs9DifavLARx2uJ4TzGA58g12CWHej9r
	TNE34V734uL5Opc+Wj9bI5c=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j9ldy6hKPznTwB;
	Fri, 23 Oct 2026 09:23:34 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4CD9040578;
	Fri, 23 Oct 2026 09:23:32 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 09:23:31 +0800
Message-ID: <87ecba5b-e396-45db-bab0-4eff0f30cb25@huawei.com>
Date: Fri, 23 Oct 2026 09:23:30 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 00/19] arm,fs/resctrl: ARM MPAM MB_NODE support
To: Fenghua Yu <fenghuay@nvidia.com>, Reinette Chatre
	<reinette.chatre@intel.com>, Tony Luck <tony.luck@intel.com>, Ben Horgan
	<ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Dave Martin
	<Dave.Martin@arm.com>, Will Deacon <will@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>, Chen Yu
	<yu.c.chen@intel.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Vikram Sethi <vsethi@nvidia.com>, Shanker Donthineni
	<sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>, Richard Cheng
	<icheng@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/1 1:22, Fenghua Yu 写道:
> This series enables MBA bandwidth control emulation on ARM MPAM when the
> default MB control is disabled, using a node-scoped MB_NODE control as
> the native backend.  It extends memory-bandwidth monitoring and

Hi everyone,

We also have the requirement for the MPAM node-scoped MB_NODE control.
Are there any follow-up plans for this feature?

Is there anything I can help with?

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
> │   ├── bandwidth_gran
> │   ├── control_mode        # [legacy] native
> │   └── schemata
> │       └── MB
> │           ├── MB_NODE     # emulated by "MB_NODE"
> 
> schemata: Only show MB, which is emulated by MB_NODE. domain id is numa
> id
> MB:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
> L3:1=ffff;2=ffff
> 
> 2. root can switch to native by writing "native" to "control_mode":
> info/
> ├── MB
> │   ├── bandwidth_gran
> │   ├── control_mode        # legacy [native]
> │   └── schemata
> │       └── MB
> │           ├── MB_NODE     # no emulation, native mode
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

-- 
Best regards,
Jinjie

