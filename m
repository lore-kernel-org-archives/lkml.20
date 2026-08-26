Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00DF3955D2;
	Wed, 26 Aug 2026 19:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772970; cv=fail; b=sYvLkFkpX9B9GnLDcJez5hqe8Fxqmh3FKebD8wX/7pkxUhosQZxXZzySeLpceUI0Oon7COqhYqblXBM2hDngV5cgBkoFKsEPQFgZ7KOqkkCltd0912BzjzyTdxSGRp2HZMm5lunzb7JzyAyn2VQC7Ol2PvXpkBNRXyoKeZiGJ1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772970; c=relaxed/simple;
	bh=6/3BpEqZjvBF6cV1saugxbAcOAvGX6AggyAEpg78D3w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CUqklnzGQHeXAdDRPEgKtJMEZnj/mPxXj/i6L0RObGo78Y+oEadUp78k0C6wnAWVK6xXwKX9gyevPbwP8d4Lui3AHZ4qf2ddYqwZE5oCx84FEe8tNn9YNMeFwqV3pp1GqOZbf3tZWmlI1aI3NPZrilL6kaoRInfxcNT1HK0XHpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FFOJKtU7; arc=fail smtp.client-ip=52.101.52.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FFOJKtU7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgspDWv8HybxLt3kY2s44/7mjlnZZIwX/urLIwb8kjG1nvAAbvZ79zNc4zIomNeoHJG78ghQlaPnVbZdEvD/Nj3YkvWZQZaNOUy5PS/iGLEczMyL0LeIq56V2Nc/NrisXyK1HJhB4wlnK5cAcwh2qv6iw9TsQ4IDfNIXNtCBy6F0F0HYCNRXvkB46l1ah3ktZ1m88lYQWnMLh6YQy/rrCasI2608WtwdEzdE6TjBuOLcYrMPAL4fqYrkZc7uaXpF66Wb0D86qJ9Nl3tJZEzLARLdhMHytjeUTkn3D7ncD8XUGfGP0uZ8gtnRC+UqhmxsubRKk66Es/E8ztzaQS/wgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RteATnUWzYtoSpPeQ8hqRFZW1XiiORpkJQB+/udJIzI=;
 b=AyZWwi2dx7oTYKYAocyuTv4s0uqGrtK4SStZJ6Y+gDNDQ9MTsNrza/xcS635TkQv0FzDyCMzV4ABoATXRP1HbKbYBMMUKv89Za+XjNyrdPnqFkMee3wTRCTx8gUSr8QjhQyyvIE/1gXnEF4Yezyld+K82LFESIgypy609x7JSKzZX8mVUa3n+/404tqaDgt9/Hsg5F5n+ZqzX/ckhlb0OfZL7srX6dUaoNDvQbs7iMhn0xCaGWhJtbnBAW4niFEHDRzSuekKUashXEwapb5hMSjLaHvp8Zp/X3TlQZit7RhWsW83k4AWCe5F8EPQ8WharvJPOlVUPE2nBd73We9bvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RteATnUWzYtoSpPeQ8hqRFZW1XiiORpkJQB+/udJIzI=;
 b=FFOJKtU7XX6ZnuB3Qr2Po4VDb7UAEUlYK56Kz0LTJZXUM18aLzgZAYHo0ggsRAdzDLAzcwgB/g3JtYFG1R56slF8Ir5ydDOBKOX8XdaL/UDi8fW0odx6WOkHblbR7JeWGw/Vnc1ZEa4/lvARawNMWHkaVkvkBByGZ0A20saPa+0=
Received: from CH2PR08CA0009.namprd08.prod.outlook.com (2603:10b6:610:5a::19)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 19:35:39 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::4b) by CH2PR08CA0009.outlook.office365.com
 (2603:10b6:610:5a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 19:35:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:35:39 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:35:37 -0500
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
Subject: [PATCH v5 16/16] fs/resctrl: Add documentation on kernel_mode with example
Date: Wed, 26 Aug 2026 14:32:30 -0500
Message-ID: <c04c7a9e2e47d472c6cf4b184ef9c3be5ef6b4c8.1787772750.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787772750.git.babu.moger@amd.com>
References: <cover.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 631d449a-cc13-4bb0-dc96-08df03a935ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|7416014|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aCtZhWeRImwWt0sfvAGMo8oB6md7rA1xorISZPQUW4FP1eGRCUTeY3AG5v0udG3oi8zS7SuHt4hKJZrN2kdHaLLxEqxJGopwPVIV43vPeiR2o/u2eRoH+7e+IYKyJArr23t/qPNnQ65YdkTwDAnqBmfHyx7glVAnO+oGfQ5egJFjjBx+WNNSrtvPojCvUWu5+5dVx9UIMjHMWt+paBiaQVM4OC7iK1ck6Caqwc3vyylthCtMYF87SI6oUfRRGGnosIkxRzytYJGpkCmxacy0SEOXAsTie2PGMu8trlpuJSgGxkgkjZyiss25vDhnPVi2c4nLZaBiuRyx+EQGBdMl04ekktGCIoiU9eMQSqxfDidUouoI5sw38yB7paDx/jTfJUcipoDPeHFY13An9i6oSueGbySelF93Aa5zJv4cm2FoMZseG9hB2NqemOdngd0aws2iA7wGfJsyKPdYzvRD+nOiI4d7xyU/gn29BKYrvat9uip2c6zN/sqIC421a+a+6Kn+z5Ts6qKRwiZ2kq47AJugz6FI1yw/iWJlH+JAEf8LfSkn7WhnocN/7M9+70tDQe7FKt0CXMXSebKlmXR7zmhGnWjfdVd8eBGtkRE8HeWKSD+Dw/HlMMiqo3MP6C1Sbtq5FMc+2A75LBWXB9oEUU7oB6S4/HMaPX7PqD1LxwI1fXR1ETMbuvabq50Aufu2uTRntRsTmMl8okaT/JW+rw==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(7416014)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	izuOM+8FFL/ywwdWWouvdTlEeO8nCeWCSOh9WYbVtkX4gXf2gR+0brRufGdu5P8cY5aZyiLfwMewgP9xGHqSpxR3Rkjs4lPUjLU2Q/iQ9Ma44QApwf+xEXRsQMVm4Fxr6a0Ht5TBqwYr9FenNqy6FqYhJ9dDkIVyj+LC3I9VyYahjXy84RwqUIVwvcv15J3AowOVR3FohCJJQHbcfWS4noV1oLCPoTJTPWKuNUeKxwGcAEQGjzhoQb2BSqWnqur28LKq16LBn827+0N6UWRGhW1qU0LaZRn5IBStQbxKnIjb8cZj8HHcNXE8bGcyPOQEBpwNRbjlP1FoFaHZ2cPe9lSW/h+NDdUxNIrpbIccpBN+byiL3+0pha0IFf0fUAeLH6UAnZH3mRpCuyYUJWDXlyKHPIlhSf2V9gmtrjmB/AMdKveUR03prbxplubpAOB5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:35:39.5592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 631d449a-cc13-4bb0-dc96-08df03a935ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317

The kernel-mode interface spans info/kernel_mode, kmode_cpus, and
kmode_cpus_list, but the per-file descriptions do not walk through a
full workflow.

Add an end-to-end example showing how to discover supported policies,
associate kernel-mode allocation and/or monitoring with a group.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Update the example for the collapsed kernel mode model:
    inherit_user and assign_global_enable_per_cpu with ctrl=/mon=
    association options, and <CTRL_MON group>/<MON group>/ paths.

v4: New patch. Added examples in the documentation.
---
 Documentation/filesystems/resctrl.rst | 100 ++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 3e886f84315b..81017858231a 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -1873,6 +1873,106 @@ View the llc occupancy snapshot::
   11234000
 
 
+Examples on working with kernel_mode
+====================================
+The kernel-mode interface spans three files:
+
+- ``info/kernel_mode`` - select the global policy and associated group
+- ``kmode_cpus`` / ``kmode_cpus_list`` - view or adjust the CPU scope of the
+  active association (visible only on the associated group)
+
+The walkthrough below covers a typical workflow on a platform with PLZA
+(Privilege Level Zero Association) support:
+
+1. Discover supported policies.
+2. Associate ``assign_global_enable_per_cpu`` with a control group.
+3. Narrow the CPU scope through ``kmode_cpus_list``.
+4. Move the association to a monitor group.
+5. Return to ``inherit_user``.
+
+a. Discover supported kernel mode policies
+::
+
+  # mount -t resctrl resctrl /sys/fs/resctrl/
+
+  # cat /sys/fs/resctrl/info/kernel_mode
+  [inherit_user]
+  assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
+
+``inherit_user`` is the active policy. Kernel work inherits the resource
+allocation and monitoring of the current user-space task. The second line
+shows ``assign_global_enable_per_cpu`` is available; square brackets mark
+the active entry when read back after later steps.
+
+b. Associate kernel mode allocation with a control group
+::
+
+  # mkdir /sys/fs/resctrl/ctrl1
+  # echo "assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//" > \
+        /sys/fs/resctrl/info/kernel_mode
+
+  # cat /sys/fs/resctrl/info/kernel_mode
+  inherit_user
+  [assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//]
+
+This selects ``assign_global_enable_per_cpu`` with control assignment
+(``ctrl=assign``) and inherited monitoring (``mon=inherit``). The group
+path uses ``<CTRL_MON group>/<MON group>/`` syntax; a control group alone
+is written as ``ctrl1//``.
+
+When the mode is active:
+
+- ``ctrl1/kmode_cpus`` and ``ctrl1/kmode_cpus_list`` become visible.
+- All currently online CPUs are associated initially.
+- CPUs that come online later are added to the association automatically.
+
+c. Narrow the association to CPUs 0-3
+::
+
+  # echo 0-3 > /sys/fs/resctrl/ctrl1/kmode_cpus_list
+  # cat /sys/fs/resctrl/ctrl1/kmode_cpus
+  f
+  # cat /sys/fs/resctrl/ctrl1/kmode_cpus_list
+  0-3
+
+The write reprograms the association:
+
+- CPUs added to the mask are enabled.
+- CPUs removed from the mask are disabled.
+- Offline CPUs in the mask are rejected.
+- An empty mask disables the association on all currently online CPUs, but
+  later hotplug CPUs are still associated automatically.
+
+d. Move the association to a monitor group
+::
+
+  # mkdir /sys/fs/resctrl/ctrl1/mon_groups/mon1
+  # echo "assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1/mon1/" > \
+        /sys/fs/resctrl/info/kernel_mode
+
+  # cat /sys/fs/resctrl/info/kernel_mode
+  inherit_user
+  [assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1/mon1/]
+
+Both control and monitoring are now assigned for kernel work. Changing the
+associated group through ``info/kernel_mode``:
+
+- Resets the CPU scope to all currently online CPUs.
+- Hides ``kmode_cpus`` and ``kmode_cpus_list`` on the previous group.
+- Shows them under ``ctrl1/mon_groups/mon1/``.
+
+e. Return to the default inherit policy
+::
+
+  # echo "inherit_user" > /sys/fs/resctrl/info/kernel_mode
+  # cat /sys/fs/resctrl/info/kernel_mode
+  [inherit_user]
+  assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
+
+Writing ``inherit_user`` clears the active kernel-mode association and
+hides ``kmode_cpus`` and ``kmode_cpus_list`` because no group is
+associated with kernel mode.
+
 Examples on working with mbm_assign_mode
 ========================================
 
-- 
2.43.0

