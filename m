Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437081;
	b=Q7e5owSCuJ5gb00sEcMa3MlGFWXIaCcV8AUwfeFMooWNqM32gFUqj2X1jANXOthsqbxw
	 Q+C+rIycGyfa2kbzPFEZLiY3WG1H7jL4gl1QpV2xD7Slz/AMoDcmc/Bu/QldkrdskGCq+
	 1Tj9EnabqxJr18uNy7Sije/eSODKIjH8VuLJzwSaWgLL+x3AhXY9SflUXrUzN+PGDURJh
	 BePulh4F6AuXHGc9Xpmbzd/JIw3uxUuYIVPKieRJOAd1WP1LDOjpHFMjcAOpTvRWN7xfU
	 4NfNgJ07dlAsF4hi4KZ/YYJD+tr5xGFJhT0I24ucK6Olhpc2TwuziiHwm4z+nfZFC3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437081;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=B0PJOZn1YxYllXqDKIZSp9/D9gVoxD8xF17eDc3uSvo=;
	b=A5nulHk+3uk/yTgDQ6by9e06zw2lgcpmWfbT4KLWWR359Zpq8p6s9fbxZb3817sI7Dra
	 yWAg4xdLv28qToNVI5uMzNsfluRdavOlGIpcQlX2FwK3KzjGFgpG2IvLj93pY2NHBjTRy
	 Q2uHj6OJRBCSixso9E2a0lQT3bvNlU5vzDantxbWMmVqOO31WMcurKH8qddxpviyk+RC/
	 KvzGYkZmaDfHLZpReoMNjd7numFcrxhkb1aB8Nww41yZKCBeYVk95iu/YBrmE8rqo7kP4
	 nHgKcOKYcyuTGJ6nF/t1u5UbaxiRgEmw8b83BxXKzAQDmsl6hvwHU/9B6axcnzo0ZqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BfDxtmdC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.22
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010022.outbound.protection.outlook.com [52.101.193.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1517606B76C;
	Wed, 11 Nov 2026 22:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1517606B76C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BfDxtmdC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiVmMJ/YWfA6FxDr0xwxlnkedOC7ZwNOvZMkeTShp1+zwfYzl/mkKjuSU3ehD4HrqiAjiA77hF4Nwh6LOW+Crja24Tha3+VEzM6kCscE96AY+qkjeuR5nDQqJIJUfAoEcQSBoMJ+fXOBhyA2rFwC2O6UduWUMyywR2R5T0Q3SRgBB1C+qL4P00RUptPXReCLaC6hgSzHlGil0swKpxK76b58r56nY957drJxXp8FYjJfycIPBpwgbypmB+qiKjRM3ehj0MQ4odMVc8zZosDQ8x6sDrPJ2z1RyPK7gn1MgX4OrzhVVRV6mkJdZy8wEm4wKSEDZHTeb5IUl386KF9FdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0PJOZn1YxYllXqDKIZSp9/D9gVoxD8xF17eDc3uSvo=;
 b=hhRqrosEDq+VLKAyKHCffpkOZ7OXQ38ljGQ9AnfYmDmFrbs4U7DVcJmW8NBarQpmjQsw2/uhVUnFOTmEMHlH/R+mCPgh2zr0pxAC7CVOB4pGO7JM+D2SjASAF+a97qX+8Ej6QVjhiDs3jyscAuDQCkci6I6Nkp1fiDCWu226kymve9D6N/ARCbAslWNWUQkeQiN+/NVhIxgVLZgjtZjZN4NPLa9VS+yP80vnu+TZLGCp70vbRMOSt8J667v8qLyoK/PckC5awyCSQBIEByiVQrPkjg+ZlkLLWaqiUGFr9iYJ1JZN38QA60j9C9txezjcVpQYn/2pJYf+KOdea70wvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0PJOZn1YxYllXqDKIZSp9/D9gVoxD8xF17eDc3uSvo=;
 b=BfDxtmdCWCZ3PrzfXsnQIN1lrjckYiHfyhav3B6lVN4mkcxnWUtrHc56tWkLQlJysAUrPfZgpq8MgL/AcuSIB7VwKsM41IguK3SDNwyVUl1BocWavBH6xJq/oPIkvFkpv0oKXmrj0A7Un6+IDRBeIHTp0D4Q3ACAclCe5ksc67U=
Received: from MW4PR03CA0087.namprd03.prod.outlook.com (2603:10b6:303:b6::32)
 by CH3PR12MB7619.namprd12.prod.outlook.com (2603:10b6:610:14b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:44:32 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::52) by MW4PR03CA0087.outlook.office365.com
 (2603:10b6:303:b6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 22:44:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:44:31 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:44:29 -0600
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <x86@kernel.org>, <fustini@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <jlayton@kernel.org>, <seanjc@google.com>,
	<ewanhai-oc@zhaoxin.com>, <binbin.wu@linux.intel.com>, <nikunj@amd.com>,
	<ashish.kalra@amd.com>, <peterz@infradead.org>, <superm1@kernel.org>,
	<thomas.lendacky@amd.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <ricardo.neri-calderon@linux.intel.com>,
	<darwi@linutronix.de>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v7 00/19] x86,fs/resctrl: Add kernel-mode (e.g., PLZA) support to the resctrl subsystem
Date: Wed, 11 Nov 2026 16:43:53 -0600
Message-ID: <cover.1794437052.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
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
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|CH3PR12MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f00c3a-757f-45fe-415b-08df40455a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|23010399003|1800799024|82310400026|260925022911599003|260925021911599003|260925021311599003|10067099003|5023799004|11063799006|56012099006|261022105027099003|261022075727099003|261021123027099003|261009223027099003|261021121427099003|261102124527099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	GX3oN/isw4FWR87+2+TSwOcUnsLw4pJlJPuyhOU632gEZIWplRHi0nrAUyKYD2cnXZDjRoMNIVqWDHQowK3mwjdxXDw3YavdCvWE571TFI6fOA60FPQjDbjNSDfVEiq/7vidz+SnRGnHjZAjou4VbgbC1Q3f7PyTMj0VM+ghFBZSKjbGrkvdufkGMx+3arxUtkiBxuWs05T0VzmJ5PhG12PFMrjSLmnxLJkF46GLi8tS2VkqA5UHKQCJqzh9YdSFiT0KfUlTQDrcp9AK0hs0nNJa5gxzwJ4iEuil1kHYF4qI3x+k+7qZlNq+ItvSuldgwmZl6IGtc+CuvDhXn9PCU1ADgHl9DVMyrQGXGQxH5tMYcPvLra2eR6RkvSTDnpOxoS36fKQrX8WaxEbO/vpioHS0lTjnyvLyWrMPpvMFrTxRYu9TvQmD6abVltBtUatRx44TcA6Ov2fkqHyM2gRraWIFwYI3lm7/MjFx+CQYJlDN+fYwwAQ+g//yv8UBOeb6AbNZJ87C1jfFR6h8Nx+/jZqZNhJWKteNAegtxM2aYqYaKuQG6ilhc66BT94+63nMB1bSmddW2eoy+6XReV2phfuSvFGs3u//I/2NHbiPgpPjscqa+0ClySW8ezDRqqCCgivMr9iPoQEIW+gRybQoXw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(23010399003)(1800799024)(82310400026)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(5023799004)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021123027099003)(261009223027099003)(261021121427099003)(261102124527099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vrnVke60OUEJKIhKYnwxORJT4fb9/D6lxfpWKwR+8DNukFx2N2eV2hXfYhp61nrBtKmYhmX8OeHSoGSU4sH0iXnm26AtrFveSQ/i4Fc1os5w1qjzJOxi7Mn4oGwuetj7quwauV1PGW71guEaVym2GAZXz1XM1bA9bw5OV2yWFxHzF7tG3m0zw+HgDR7fS7Vi86l3OmwosAhEtVfXJbstb+1Tat4c3tskS11ODeGlyl2uKii1CPEkDdkVZzkPnZkjqzbutSD8mKDlfaYAl42QTg2FQBojxHl8L6bEpwhLKLYAY/OQFb2AsLOh2rIHciLrvmPWMiId72rJOo8COVnlXOCJzvMY2oa3MjzBwIICtQSTgETB8AnjKh+eHb1VIQ1YJLidpjxaeu/Kit42BER49hBTZykuQHhCPjfVMxxsz97bC4hPz4t5fLkqSedzCs66
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:44:31.9727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f00c3a-757f-45fe-415b-08df40455a40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7619


Hi All,

This series adds support for AMD's Privilege-Level Zero Association (PLZA),
which allows the CPU to use a different CLOSID and/or RMID association
while executing in kernel mode than it does in user mode.

The implementation is integrated through a generic kernel mode ("kmode")
framework in fs/resctrl, enabling future architectures to support similar
functionality without requiring changes to the core resctrl code. The
intent is to provide a common infrastructure that architecture-specific
implementations can hook into, minimizing future resctrl core
modifications.

The features are documented in:

   AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
   Publication # 69193 Revision 1.00, Issue Date March 2026

available at https://bugzilla.kernel.org/show_bug.cgi?id=206537

The patches are based on top of commit (tip/master):

  c6279551a44c Merge branch into tip/master: 'x86/sev'

Any feedback is appreciated.

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

A new sysfs file, info/kernel_mode, selects the kernel mode for resource
allocation and monitoring of kernel work and, when the mode needs one, the
resource group that backs it. Reads list the supported modes, with the
active mode in square brackets. Writes use the same line without the
brackets. Look at the thread below for design discussion.
https://lore.kernel.org/lkml/14a8ad0a-e842-4268-871a-0762f1169e03@intel.com/
https://lore.kernel.org/lkml/e4c95002-ae8a-48d0-bedd-772db58b937e@intel.com/

Two kernel modes are exposed:

- inherit_user: kernel work uses the allocation and monitoring
  associations of the user task on whose behalf it runs. It takes no
  parameters.

- global_enable_per_cpu: kernel work uses the allocation and/or
  monitoring association of a backing CTRL_MON or MON group. ctrl= and
  mon= select assign or inherit for each. group= names the group and
  must be the last parameter, because a group name may contain ';'.

  When mon=assign, a CTRL_MON group is shown as <CTRL_MON>// and a MON
  group as <CTRL_MON>/<MON>/. When mon=inherit, or monitoring is
  unsupported, a CTRL_MON group is shown as <CTRL_MON>/.

  An omitted ctrl=, mon=, or group= selects the default: assign where
  the platform supports it, and the default CTRL_MON group. A partial
  write therefore restores the omitted fields and programs every online
  CPU. ctrl=inherit together with mon=inherit is rejected. A monitor
  group requires mon=assign. A failed write leaves the current
  association in place.

Per-rdtgroup files kmode_cpus and kmode_cpus_list scope the association
to a subset of online CPUs. They are visible only on the group that
backs the active association. A write enables the association on CPUs
added to the mask and disables it on CPUs removed from the mask. An
empty mask disables the association on every currently online CPU. A
new global_enable_per_cpu association sets the mask to every online
CPU. A CPU that comes online later joins the association, including
after a narrowed or empty mask. A CPU that goes offline leaves it only
when that CPU is in the mask.

A group that backs the association, or a control group whose monitor
group does, cannot change mode, including entering pseudo-lock setup.
Reparenting a backing monitor group is rejected. The backing group
cannot be renamed until the association is cleared.

The arch hook, resctrl_arch_configure_kmode_global(), keeps the
fs/resctrl layer arch-neutral. enable=false disables the mode on the
given CPUs and still writes the same CLOSID, RMID, and per-ID enables,
which is what the PLZA domain rule requires. It does not by itself
switch the active mode back to inherit_user.

resctrl_set_kmode_support() lets architecture code register each extra
mode during resctrl initialization. inherit_user is registered by
default. On AMD, PLZA registers global_enable_per_cpu when the feature
is available and the platform can allocate or monitor.

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
  global_enable_per_cpu:ctrl=assign;mon=assign;group=//

  # Create a CTRL_MON group and back kernel-mode allocation with it.
  # mon=inherit, so the group is shown as <CTRL_MON>/.
  # mkdir ctrl1
  # echo "global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1/" \
          > info/kernel_mode
  # cat info/kernel_mode
  inherit_user
  [global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1/]

  # kmode_cpus and kmode_cpus_list are visible only on the backing group.
  # ls ctrl1/kmode_cpus*
  ctrl1/kmode_cpus  ctrl1/kmode_cpus_list

  # Restrict the association to a CPU subset. The association is enabled
  # on CPUs added to the mask and disabled on CPUs removed from it.
  # echo 0-3 > ctrl1/kmode_cpus_list
  # cat ctrl1/kmode_cpus
  f
  # cat ctrl1/kmode_cpus_list
  0-3

  # Return to inherit_user. The inactive global_enable_per_cpu line
  # shows the defaults again.
  # echo "inherit_user" > info/kernel_mode
  # cat info/kernel_mode
  [inherit_user]
  global_enable_per_cpu:ctrl=assign;mon=assign;group=//

Tested on AMD with PLZA; builds on x86 without PLZA and does not expose
global_enable_per_cpu unless the feature is available.

Layout
======

  01-03  x86: PLZA CPU feature, command-line option, and MSR definitions.
  04-07  fs/resctrl: kernel mode enum, arch hook, kmode state, and
         resctrl_set_kmode_support().
  08     x86/resctrl: register global_enable_per_cpu when PLZA is
         available.
  09     fs/resctrl: document last_cmd_status under a top-level info
         section.
  10     fs/resctrl: info/kernel_mode read interface.
  11     fs/resctrl: hidden rdtgroup files.
  12     fs/resctrl: per-rdtgroup kmode_cpus/kmode_cpus_list.
  13     x86,fs/resctrl: CPU hotplug for the active association, and
         clear PLZA across kexec.
  14     fs/resctrl: deactivate the association when a group is removed.
  15     fs/resctrl: info/kernel_mode write interface.
  16     fs/resctrl: reject mode changes and reparenting while a group
         backs the association.
  17     fs/resctrl: show or hide kmode_cpus on the backing group.
  18     fs/resctrl: kmode_cpus/kmode_cpus_list writes.
  19     fs/resctrl: documentation and examples.


Changelog
=========
v7:
  - Used "CLOSID and/or RMID association" throughout the series because
    feature operates on the MSR_IA32_PQR_PLZA_ASSOC association register.
    The association concept is already known in the resctrl subsystem.
    Please let me know if you see a better alternative.
  - Rebase onto tip/master c6279551a44c ("Merge branch into tip/master:
    'x86/sev'").
  - Document last_cmd_status in a new "Top level files" section of the
    info directory, before kernel_mode.
  - info/kernel_mode includes the monitor component of group= only when
    mon=assign. A CTRL_MON group then reads as <CTRL_MON>//. When
    mon=inherit, or monitoring is unsupported, it reads as <CTRL_MON>/.
  - An omitted ctrl=, mon=, or group= selects the defaults (assign
    where the platform supports it, and the default CTRL_MON group).
    A partial write restores the omitted fields and programs every
    online CPU.
  - Reject ctrl=inherit together with mon=inherit. With both enables
    clear, CPL0 keeps the user task's IDs, which is inherit_user.
  - group= is the last parameter, so a group name may contain ';'.
  - Drop resctrl_kmode_switch(). Deactivation restores inherit_user
    and the default ctrl and mon values.
  - Move kmode_cpus visibility to after activation and deactivation,
    and move the mode-change and reparent checks to after the
    kernel_mode write interface.
  - Clear MSR_IA32_PQR_PLZA_ASSOC from clear_closid_rmid() so a kexec
    boot does not keep a previous kernel's PLZA state.

v6:
  - Addressed all the comments as discussed in v5. Anything missing
    is not intentional. Please feel free to comment on any mistake.
  - Rename assign_global_enable_per_cpu to global_enable_per_cpu and
    describe the interface as a kernel mode rather than a policy.
  - Flatten kernel mode state into resctrl_kmode. The arch hook is
    resctrl_arch_configure_kmode_global().
  - An omitted ctrl=, mon=, or group= keeps the value shown by reading
    info/kernel_mode. inherit_user takes no parameters.
    ctrl=inherit;mon=inherit remains global_enable_per_cpu.
  - Selecting a new global_enable_per_cpu association sets that group's
    kmode_cpus to every online CPU. A CPU that comes online later joins
    the association even if user space had removed it from the mask.
  - kmode_cpus files are created hidden and shown only while the group
    backs the active association.
  - A monitor group requires mon=assign. Removing a control group
    detaches a child that backs the association before the parent's
    CLOSID is freed.
  - Reject a mode change when the group or one of its monitor groups
    backs the association.
  - Split kmode_cpus visibility and the mode-change rejection into
    their own patches.
  - Use the parsing similar to ctrlmondata.c:parse_line(),
    ctrlmondata.c:resctrl_io_alloc_parse_line(),
    monitor.c:resctrl_parse_mbm_assignment().
  - Re-wrote the changelog as a feature and not as a bug-fix.
  - Remove implementation details in function headers.

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
v6: https://lore.kernel.org/lkml/cover.1790867441.git.babu.moger@amd.com/
v5: https://lore.kernel.org/lkml/cover.1787772750.git.babu.moger@amd.com/
v4: https://lore.kernel.org/lkml/cover.1783461016.git.babu.moger@amd.com/
v3: https://lore.kernel.org/lkml/cover.1777591496.git.babu.moger@amd.com/
v2: https://lore.kernel.org/lkml/cover.1773347820.git.babu.moger@amd.com/
v1: https://lore.kernel.org/lkml/cover.1769029977.git.babu.moger@amd.com/

Babu Moger (19):
  x86/cpufeatures: Support Privilege Level Zero Association (PLZA)
  x86/resctrl: Add PLZA support to command-line options
  x86/resctrl: Add PLZA MSR definition and field layout
  fs/resctrl: Introduce kernel mode enum
  arm,x86,fs/resctrl: Introduce arch hook to program global per-CPU
    kernel mode
  fs/resctrl: Introduce data structures for kernel mode configuration
  fs/resctrl: Introduce resctrl_set_kmode_support() to register
    supported modes
  x86/resctrl: Register RESCTRL_GLOBAL_ENABLE_PER_CPU when PLZA is
    available
  fs/resctrl: Rearrange top-level files in info directory
  fs/resctrl: Add interface to display kernel mode status
  fs/resctrl: Add support for hidden resource group files
  fs/resctrl: Introduce kmode_cpus/kmode_cpus_list per rdtgroup
  x86,fs/resctrl: Add CPU hotplug support for kernel mode
  fs/resctrl: Deactivate kernel mode when the group is removed
  fs/resctrl: Extend info/kernel_mode to configure the kernel mode
  fs/resctrl: Reject mode changes for groups backing kernel mode
  fs/resctrl: Control visibility of global per-CPU kernel mode group
    files
  fs/resctrl: Allow userspace to write kmode_cpus/kmode_cpus_list
  fs/resctrl: Add kernel mode documentation and examples

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/filesystems/resctrl.rst         | 255 ++++++-
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   1 +
 arch/x86/kernel/cpu/resctrl/core.c            |   9 +
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  38 +
 arch/x86/kernel/cpu/resctrl/internal.h        |  49 ++
 arch/x86/kernel/cpu/scattered.c               |   1 +
 drivers/resctrl/mpam_resctrl.c                |   7 +
 fs/resctrl/internal.h                         |  32 +
 fs/resctrl/rdtgroup.c                         | 693 ++++++++++++++++++
 include/linux/resctrl.h                       |  65 ++
 12 files changed, 1141 insertions(+), 12 deletions(-)

-- 
2.43.0

