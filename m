Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012068.outbound.protection.outlook.com [40.93.195.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDEB396B6F;
	Wed, 26 Aug 2026 19:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772792; cv=fail; b=b9Qc0D8EobDuI1Ed4hyEz9HV2nLRUNdymm6u295ryIeWuTDIRv5mXlRtIBrK27EBDyioWulmplZfH3hIhUrhc4Uwv5pkZxsrgvao3P3vEALSqXJdWLsO8+fWDm+M7Do0TFs25AfzfVW9gDQ8aJiOjbMPWJVqq/06TwFQifY+vnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772792; c=relaxed/simple;
	bh=BwE9gP7RWhwrBIf9PiFV/uFfFMusI/BC3oyStqWr3Eg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BuXDK1RQjL60u4rkBoYgkjcmaGy40fobcmGLHXGLS0dmcXG0VhtIO69ku9LQgUp8zh6PTx1uktc1/2ML7Ct7CgIYjodQLSdZPIhUyzj2Wd35A68Q/nANz7QwL/GRby7zaSRQ57M2VaGHcMYBlSKHzxdDNkWOlXuWZtLyJGotuGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LVFtbFhZ; arc=fail smtp.client-ip=40.93.195.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LVFtbFhZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiuUie81i082CU5HNEZ3wYmxcNDva6W7fd0E3pbeAbE/6zDNnfq41c9tzZ87ER67u/JK/Jt4nzUX8UEhgJffq8POOXZfQs89dljQumDtD98qmIRzMvyPMmVUvAUei+1EyEd084IQQi0cDO9nBfnNRfIWmEKhmdL1pH2KNLfeN4snL8pE+tLstzGmQymkVH7WwrXO8Ikbp6OW8IX49ry0VvQ+9RSryFLINEuIyql6BkC47NfFocNSPzZU84ZkIQNckyIseZHAIE6Yoqw7D2f+hX9QkggZiRszP3OsTa/69lFucVm/rYPp0/KnzW0KlVFojsp1feoXdaP1sr9rvl8FJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W81uiyEEAx1BFslWEqc+RTP5lexv0/Z70R2XXd2lLiQ=;
 b=IxbRXsbY5Q3up+Oy3x84SyPZOVIew54usxJAm6/3WzWyyNxufLNZLcMBb+NvpiWEoxqP9QB5Gjdze3sCL1DTYQ4Zg/8dmnhpEjDfIj1X3HZWrvikSr+O9Zv8+bSkYI8IW+CD9Eb/MubKuWJlM0gevBOMaI35ETawLDT42gVBYs3qcyvaX8JNmdknDyRInzG2zohJp7KxVVdVTbYy6J9iA8Ey1DK2t3X7b5uSK/euf0xZXJoobOK5JXvxw5ykqUoUNAqvMRUpZGbTKxrGjNhWHxh2y7QQT426E9udeYct6/0SPXEEYtdXWJ2z63KBPQRuks/SaAk1MJEeRen2ee0Jtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W81uiyEEAx1BFslWEqc+RTP5lexv0/Z70R2XXd2lLiQ=;
 b=LVFtbFhZOpPdTP2izJjRRXYPZCiMXufuEsVHCNpTh+ZCiN+CciyEiKvVhf25GL3VOirPtHUEbR1sPENj2qandG0C/v1Ayv9r2BAPpJ84DwR9qpj58sqa8y/BP9LKDZf3Yr3cB88iqAzacw+6g3X/TAXwaPR/0rgk0Qz7SGaGaK4=
Received: from SJ0PR05CA0015.namprd05.prod.outlook.com (2603:10b6:a03:33b::20)
 by IA0PR12MB8256.namprd12.prod.outlook.com (2603:10b6:208:407::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 19:32:46 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::9e) by SJ0PR05CA0015.outlook.office365.com
 (2603:10b6:a03:33b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Wed, 26
 Aug 2026 19:32:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:32:45 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:32:43 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <bp@alien8.de>, <ben.horgan@arm.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <jlayton@kernel.org>, <enelsonmoore@gmail.com>,
	<kuba@kernel.org>, <ebiggers@kernel.org>, <seanjc@google.com>,
	<peterz@infradead.org>, <chao.gao@intel.com>, <jmattson@google.com>,
	<naveen@kernel.org>, <ricardo.neri-calderon@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>,
	<elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
Subject: [PATCH v5 00/16] x86/resctrl: Add kernel-mode (e.g., PLZA) support to the resctrl subsystem
Date: Wed, 26 Aug 2026 14:32:14 -0500
Message-ID: <cover.1787772750.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|IA0PR12MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 990b0f3e-cad9-4e8b-3ee4-08df03a8ce37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|3023799007|6133799003|10067099003|56012099006|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
	psYP6ZXuTho2ymxOujX3cVFkf2M0AlX6hYykI1tPx4004ORXZSVFGHg+ziPE1DX4xRbjkeX6IcNyhQS861jU/6K0XzVQicIRnzyWW4+qha/haRmDg5tG93ZlcW+lXF8uAMIBuuoki6Rslnt40BK7qYtBMIc+IyUxle91nCsrO6NCvyw8X+RTp/KLs69MdPlwfPvxDC/F71f6oUScnQnwW9MA0YIGArVq3Vfg1j0AUDZl/40n6tV+l9lc+IWV7r+vQ8z4Dr6PocQIpQt8IzK/naukAsAPfW62uuU16fVC9T6kYkeaZ3W2FzInGXrj+Vf6Kc9ajeoPbw4bKP6Ekbg/3otQme8SvWO7MmK77/J3Mh/mTymi5fy74B7LX+/MDCHH30BQS1Mt5autYE7zQOKx2Lv7VNf7wibOSE0b585ylY2o//ILvPLBk5r0SavWi3PjJmT+C8XEgVa6dnkUTBTiBJ0zvLAFekY3dLh2jlM2y2FqH4+j5lsZ6U9qiSWGRfJHNStkP2WJHE7UqTrWAFa0oYO1/21K+wmbhWn8vLtbjRyZ2LjU8IAVihpMebOH37bsZaFCtw/OzrEW1NiPiu1XFwdwaojZYQ0YUtOU3ts101g9UZrW/05womi+ll9B4LHeBhhxCOhtJ8UI0V+6M2lXmONM4+Gz2oSdhuH1mnpZyvHFdWMty+aow2iYrzDObZcgYoA8FcEZNEV36X6ywivBWA==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9uQ1IfSXTzPvqrws6g5KCqnrubXIN9d40H3RuekqlybKZciBVHKd9k4LSyaBrQKGhqImdKfPIftXUOTkGc+Tx0dlknk611cNj0PRhCOwI8C8Ks4nkTYwvU7GQ2929A/D+0ExMCHq2g4pvvL89hvozXackT+zBaHqn6E55K2zLdPJ4fxZSkX5tvr80Nyt4U93+EKZ1cAWbVfPEcGLXuWFOe1r3E08aXYc/qcN2P5BHB0Qpps8Km7vGHS5tXTYQkqTQnj5BKle6qfYh3sRwPXTZSnzDZ+/cbhwmWZpJjsT9M5B35L+c5jtjFEA8bhD3zj3eiTQeCp1OT1E2VPRnJj2LSYzjo7XSpvoLbQ4cdNVIhARhIYBMVbYGt9/fMUUmgbSVkgiRyqzHg7OGXhtulwVic0CBkI3trwt7pSdTDjk/n2rQCbXGoDiKPvFteR6P/YG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:32:45.7704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 990b0f3e-cad9-4e8b-3ee4-08df03a8ce37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8256


Hi All,

This series adds support for AMD's Privilege-Level Zero Association
(PLZA) so kernel work can use a separate resource allocation and/or
monitoring association from the user task, and wires it up through a
small generic "kernel mode" (kmode) layer in fs/resctrl so future
architectures can plug in without touching(hopefully) core resctrl.

The features are documented in:

   AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
   Publication # 69193 Revision 1.00, Issue Date March 2026

available at https://bugzilla.kernel.org/show_bug.cgi?id=206537

The patches are based on top of commit (tip/master v7.2):

  e7bb1f1ccd17 Merge branch into tip/master: 'locking/urgent'

Any feedback is apprecated.

Background
==========

When memory bandwidth associated with a CLOSID is aggressively throttled,
and a task with that CLOSID moves into kernel mode, the kernel operations
are also aggressively throttled. This can stall forward progress and
eventually degrade overall system performance.
    
Privilege-Level Zero Association (PLZA) allows the user to specify a CLOSID
and/or RMID for execution at Privilege Level Zero. When PLZA is enabled on
a CPU, kernel work at PL0 uses the CLOSID and/or RMID from MSR
PQR_PLZA_ASSOC; otherwise, the CPU uses the CLOSID and RMID from PQR_ASSOC.

Design
======

A new sysfs file, info/kernel_mode, holds the global policy for resource
allocation and monitoring of kernel work and the resource group (when
applicable) associated with the policy. Reads list the supported modes
and the currently active association; writes change the policy or
associate a different group. Look at the thread below for design
discussion.
https://lore.kernel.org/lkml/14a8ad0a-e842-4268-871a-0762f1169e03@intel.com/
https://lore.kernel.org/lkml/e4c95002-ae8a-48d0-bedd-772db58b937e@intel.com/

Two kernel modes are exposed:

- inherit_user: kernel work inherits allocation and monitoring from the
  user task.
- assign_global_enable_per_cpu: kernel work may use separate allocation
  and/or monitoring associations. ctrl= and mon= select whether each
  dimension is assigned or inherited, and group= identifies the
  associated resource group using <CTRL_MON>/<MON>/ path syntax.

Per-rdtgroup files kmode_cpus and kmode_cpus_list scope the association
to a subset of online CPUs without deactivating and re-associating.
They are visible only on the group currently associated through
info/kernel_mode.

Groups associated through kernel mode cannot enter pseudo-lock setup,
change mode, or be renamed until the association is cleared.

The arch hook, resctrl_arch_configure_kmode(), keeps the fs/resctrl layer
arch-neutral.

resctrl_set_kmode_support() lets architecture code register supported
kernel-mode policies during resctrl initialization. On AMD, PLZA
registers assign_global_enable_per_cpu when the feature is available.

Only AMD PLZA is wired up here; Intel and ARM can add their own support
later by implementing the hooks.

Examples
========

(See Documentation/filesystems/resctrl.rst, "kernel_mode", "kmode_cpus",
and "Examples on working with kernel_mode", for the full UAPI.)

  # Mount resctrl
  # mount -t resctrl resctrl /sys/fs/resctrl
  # cd /sys/fs/resctrl

  # Read the supported modes.  The active mode is bracketed for display
  # only; do not include brackets when writing.
  # cat info/kernel_mode
  [inherit_user]
  assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//

  # Create a CTRL_MON group and associate kernel-mode allocation with it.
  # mkdir ctrl1
  # echo "assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//" \
          > info/kernel_mode
  # cat info/kernel_mode
  inherit_user
  [assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//]

  # kmode_cpus and kmode_cpus_list are visible only on the associated group.
  # ls ctrl1/kmode_cpus*
  ctrl1/kmode_cpus  ctrl1/kmode_cpus_list

  # Restrict the association to a CPU subset; the write is incremental.
  # echo 0-3 > ctrl1/kmode_cpus_list
  # cat ctrl1/kmode_cpus
  f
  # cat ctrl1/kmode_cpus_list
  0-3

  # Return to the default inherit policy.
  # echo "inherit_user" > info/kernel_mode
  # cat info/kernel_mode
  [inherit_user]
  assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//

Tested on AMD with PLZA; builds on x86 without PLZA and does not expose
assign_global_enable_per_cpu unless the feature is available.

Layout
======

  01-03  x86: PLZA CPU feature, command-line option, and MSR/data-structure
         plumbing.
  04-07  fs/resctrl + x86: kernel mode policy enum, arch hooks, kmode state,
         and resctrl_set_kmode_support().
  08     x86/resctrl: register assign_global_enable_per_cpu when PLZA is
         available.
  09     fs/resctrl: info/kernel_mode read-only introspection.
  10     fs/resctrl: hidden rdtgroup files for kmode_cpus visibility control.
  11     fs/resctrl: per-rdtgroup kmode_cpus/kmode_cpus_list read interface.
  12     fs/resctrl: program kernel-mode association when a CPU comes online.
  13     fs/resctrl: deactivate the association when a group is removed.
  14     fs/resctrl: info/kernel_mode write interface.
  15     fs/resctrl: incremental kmode_cpus/kmode_cpus_list writes.
  16     fs/resctrl: documentation and end-to-end examples.


Changelog
=========
v5:
  - Collapse the two v4 global-assign modes into a single
    assign_global_enable_per_cpu policy with ctrl= and mon= options.
  - Use "association" terminology consistently in code, errors, and
    documentation.
  - Register assign_global_enable_per_cpu once during x86 resource
    discovery when PLZA is available.
  - Reject mon=inherit when group= selects a monitor group.
  - Split hidden-file support, deactivation-on-teardown, and PLZA mode
    registration into separate patches for easier review.
  - Fix msr_pqr_plza_assoc truncation on 32-bit systems by using u64.
  - Refresh documentation and add a readable end-to-end example walkthrough.
  - Block pseudo-lock setup on kernel-mode-associated groups.
  - Reject mode changes and rename while a group backs the active
    association.

v4:
  - Reorder and split the series into 15 patches: separate read-only
    info/kernel_mode display from the write path; add hotplug support
    when a CPU comes online; add an end-to-end documentation/examples
    patch.
  - Introduced resctrl_set_kmode_support() so architecture code can
    register supported kernel-mode policies during resctrl initialization.
  - info/kernel_mode write: validate group type; run fail paths before
    tearing down the active association so errors retain the old state.
  - kmode_cpus / kmode_cpus_list: writable with incremental enable/disable
    deltas; empty masks allowed; offline CPUs rejected.
  - Hotplug: newly online CPUs are added to the associated group's
    kmode_cpu_mask and programmed when assign_global_enable_per_cpu is
    active.

v3:
  - Generalise the layer beyond AMD: rename "PLZA mode" to "kernel mode"
    (kmode) in code, sysfs, and Documentation.
  - Reset the association when the associated rdtgroup is removed,
    instead of leaving stale state.

v2:
  - Similar to RFC with a new proposal; interface names were not final.
  - Separated Global Bandwidth Enforcement (GLBE) from PLZA; this series
    only adds PLZA support.
  - Used "kmode" instead of "PLZA" in the generic layer.

Previous versions:
v4: https://lore.kernel.org/lkml/cover.1783461016.git.babu.moger@amd.com/
v3: https://lore.kernel.org/lkml/cover.1777591496.git.babu.moger@amd.com/
v2: https://lore.kernel.org/lkml/cover.1773347820.git.babu.moger@amd.com/
v1: https://lore.kernel.org/lkml/cover.1769029977.git.babu.moger@amd.com/


Babu Moger (16):
  x86/cpufeatures: Support Privilege Level Zero Association (PLZA)
  x86/resctrl: Add PLZA support to command-line options
  x86/resctrl: Add PLZA configuration definitions and data structures
  fs/resctrl: Introduce kernel mode policy enum
  x86,fs/resctrl: Introduce architecture hooks to program kernel mode
  fs/resctrl: Introduce kernel mode states for resctrl
  fs/resctrl: Introduce resctrl_set_kmode_support() to register
    supported modes
  x86/resctrl: Expose assign_global_enable_per_cpu when PLZA is
    available
  fs/resctrl: Add interface to display supported and active kernel modes
  fs/resctrl: Add support for hidden resource group files
  fs/resctrl: Introduce kmode_cpus/kmode_cpus_list per rdtgroup
  fs/resctrl: Program kernel mode assignments on CPU hotplug
  fs/resctrl: Deactivate the kernel mode association when a group is
    removed
  fs/resctrl: Add interface to modify kernel mode via info/kernel_mode
  fs/resctrl: Allow user space to write kmode_cpus/kmode_cpus_list
  fs/resctrl: Add documentation on kernel_mode with example

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/filesystems/resctrl.rst         | 193 +++++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   1 +
 arch/x86/kernel/cpu/resctrl/core.c            |   6 +
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  38 +
 arch/x86/kernel/cpu/resctrl/internal.h        |  47 ++
 arch/x86/kernel/cpu/scattered.c               |   1 +
 drivers/resctrl/mpam_resctrl.c                |   6 +
 fs/resctrl/internal.h                         |  60 ++
 fs/resctrl/pseudo_lock.c                      |   5 +
 fs/resctrl/rdtgroup.c                         | 795 ++++++++++++++++++
 include/linux/resctrl.h                       |  75 ++
 13 files changed, 1229 insertions(+), 1 deletion(-)

-- 
2.43.0

