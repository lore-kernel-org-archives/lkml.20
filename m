Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012069.outbound.protection.outlook.com [40.107.200.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B751A740;
	Fri,  4 Sep 2026 18:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545208; cv=fail; b=b3nMIB0Np029/AtVtT/z/HT0YoTXBw0ov94zL1whaWirTHnt7rPa6e6Q/Tqnv7PxQoxSoWel+yEeIPg/UCodcs+1bA+FT1vtH08rrJ3Ny085vz0hmoArsf0qtrcW/r18xrmFutMC1kpXYzyZih+ttZbHatsJ4WM15tpkH644xSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545208; c=relaxed/simple;
	bh=dyAcIx1fJZZu2LsDQWj7CEf7IGq0Lj6ShAmm4vpYcbU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOfzFORMTpjKzH6Q9UnCUefN/NaLapW02NVTTa6exVNGLUOz86xE7DgiR1mKIZubOI/kw8Zsnneo3uSo5wf4Yr/CF8/P8e6dcshZlIdQacSBbdXbtr3wAaQVU8HB4SlAY6Hg+C/9TaznfestRSwSYeE7Tl0qGpdO+OS9lsbqRH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QwSAdJhl; arc=fail smtp.client-ip=40.107.200.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QwSAdJhl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+DMNxJMN3m/nPQ7y+H3TtKamQcl1nKeLH5F603CssHFPzxSjDESTttSOlMNyXxHxpUhFWeL4K8k1gOeojJ9Nd8gEztF4mKrkDvS614DzS8IHeFzJ7E4F1PVwTK+kPA1hkP+j9OQOMXrkNBI3ym9Vy/XxJxI+8GyaNRh3y6ulooTiZoEuirc3bBeKyUkqfmgorlXZee1vVH+hoeL3MeCLwy3DpAOQ5Dww/gIcCvgmj3QzlNi2q96WafTvOWoVRzcPhro0xc0SCjjKOorjCu9E13PycJaWYp9Yv14pO7uulUYvppuUwYMsBx5GI36gQ9V7Kk2J6TZfQwirwXeURFKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hesYsjRcJDr0sDWp2Zlanbd+B0YVGF12dJ+EChCSS3c=;
 b=HLkWzjCx0dmxKUmS3Cuf1Tzm3XM2hKjX6JbXm+/LOMbLnMmqQSIUxJLL78Clciy1oyDD6cW40CyQb5AeHVcStP/g0+/H7dLwU02l2VVtTfDTblUy6PGVnhOPkcCt1af/oa6HBfq4Z6BV4rd+fSzkN9IRC46XABYKW3sTZZJ8/tntJW934/zIaU3856xZ+nA1h3OTwcf6vprhjGEy6PNSE99PevVOGelrL1GhVk/ush5iwI8GDvsoRRF8YiIxKMy5xuu8IY/odF8y3xH2dFgHWfsQJC//NMvc6/7tXMeHdX4XWedk67ugaBqM1NkhhBUmGb4tF0HzuqUqn4NPIBJZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hesYsjRcJDr0sDWp2Zlanbd+B0YVGF12dJ+EChCSS3c=;
 b=QwSAdJhlBVn/WJ3BkSQ0LauQzwF+WbNqqWzOoJHaboG+zIx14nKDSHc8lZzuNdrPUIdxLJ7aUXIQDTfi6E8Fg+YWakzPrKMBwspuXLbOZOyaMbEoBWcoh7Tcf6vUbvBCC9rDgOkUhdU46qtte5rlUkQ5l/QgMDtYDZaRC4EHRlA=
Received: from BN9PR03CA0542.namprd03.prod.outlook.com (2603:10b6:408:138::7)
 by SA1PR12MB6946.namprd12.prod.outlook.com (2603:10b6:806:24d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:06:40 +0000
Received: from BN7PEPF0000009E.namprd04.prod.outlook.com
 (2603:10b6:408:138:cafe::ad) by BN9PR03CA0542.outlook.office365.com
 (2603:10b6:408:138::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Fri, 4
 Sep 2026 18:06:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009E.mail.protection.outlook.com (10.167.248.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 18:06:39 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 4 Sep
 2026 13:06:39 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
Subject: [PATCH v2 3/3] x86/resctrl: Keep mbm_assign_mode in default mode at boot
Date: Fri, 4 Sep 2026 13:06:12 -0500
Message-ID: <176d53626058ae97c4003f77ff47371628da9f1f.1788545152.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788545152.git.babu.moger@amd.com>
References: <cover.1788545152.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009E:EE_|SA1PR12MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: e919b443-f1ff-4f19-7786-08df0aaf44cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|7416014|10067099003|6133799003|3023799007|18002099003|22082099003|11063799006|56012099006|5023799004|13003099007;
X-Microsoft-Antispam-Message-Info:
	hKmhCqbADfl9m99xhgNl05gFxR2SPEmCM7/fSM2AIScMEmPwdvXPJMOfsAA14n21atPJAcTMXm8njvCPkoqLNZBpnqmQdHLq4S8xWvJL4Wpi+2HEaCX3AlZoioCp2rcnB/CL6xRd/qSNejp8Lf134pzEbjTZg06pHHd3AQwh1P+DGWxX1lQAgpkMNk+Cf5zKQRsKMct41KTC5/19f8DP7bxJs1HKpQqcQBI9v8QWojnI4/ee0AHF9zZ4A3/GZoyQLqxsegN8ojcRvnLPuKA9xsjql6jBUPDCR7PzKwhyZ29bE52w8zMwV9qQ36srtA33zHXSmgw4Q8JTAIiB7ugcjOHTVsFgPqik9nAUkPMiYbyLlpi8TwEdHvbSsSfiT/6U63nYE2pw2YzbXpsRBJG4c2RABr0jl7/kStk58K4vumgZCFhXmQFYFKa3nzWjsVrIu85vkaj4pz7j7T/EH4ftnOn+TtDCSYtSmUuSrpuM3t2P0z2cvYgBZuPh8ADUnGBl+xEHFk6W1BFkxorYp4/WuH+33r6Hdr3KbDsUe2iW3CNUxxku0skuY8sAqNaQGv3l3fB/zDaT10f2y8fPrKrIQGHmH1Sbepk8BtEoBEsWHjFYivsVT9GyGfZK3qveQ4nIOh1NEz3EhjlbZa0d2ZG+l1oNpW9kHxy0oE1dK/uLwGILv1OWGHgdFdkpTL3W7jHC6VSDkiOqYGwMcCThRc5rSw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(7416014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(5023799004)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PDLX9rUxbUy+fhvFCv+T2ARw/zQdZSbqClPyW/S8bh92nKvdgxp3Azfu6iYDJwW3MtRf662efev0sPbv6ZSX869P1ND0q8jW0zKcduXdZhvthpUWl4dVJndI8qAQW9bSGC6u0urUbQQSs2Moz+kbL8fYXSi+uEPkUMX0ZwvHgrOkicpJ2rRIYouNKZ0ZYUPEoQnUmGUg+BI+hMXexjBWbgTDt9frQjjy7dE/WDWZNICrF8GPK93mfnCstDinW3OuqEtFR2Z3oKa/CaMOTcnnLVPGeqJ1S2r4FBHCxg7xB+kE+hktBXyANP1omPh2FiUjyRDD2AvWenEAvVPh3jXvw05PhN5Pr/11n3HUp/enWKv2g/aoPQi3q+zBHMMRakukgvgTyd9U9L1euEK/ednyDaEQhiGi/+dAkytYXeiDQ0UEIIPE0PTbUwN4pip7Wk3J
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:06:39.9248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e919b443-f1ff-4f19-7786-08df0aaf44cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6946

ABMC ("mbm_event" mode) allows explicit assignment of hardware MBM counters
to RMID/event pairs. It is intended for deployments that need to manage
counter assignment on platforms where the number of monitoring groups
exceeds the available hardware counters. Because hardware MBM counters are
scarce, mbm_event mode is best suited for snapshot-and-rotation workflows
that monitor a subset of groups at a time.

Commit 0f1576e43adc ("x86/resctrl: Configure mbm_event mode if supported")
enabled ABMC automatically during initialization. This causes problems on
systems with limited MBM counters and breaks existing userspace that
assumes the historical default mode, including the pqos tool from
intel-cmt-cat [1].

For example, pqos mounts resctrl and creates 16 or more monitoring groups,
using two counters per group (mbm_local_bytes and mbm_total_bytes). On
platforms that provide 32 MBM counters per domain, this consumes the entire
counter pool. Additional groups cannot be assigned counters and pqos
reports zero bandwidth for them.

Leave mbm_assign_mode in "default" mode during initialization. Default mode
can support more monitoring groups (up to 64) than mbm_event mode, which is
typically limited to 16 groups because of hardware counter availability.
Common deployments with a modest number of monitoring groups continue to
receive accurate bandwidth measurements.

Users that require ABMC functionality can enable it explicitly:

  echo mbm_event > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode

Note that default mode has a long-standing limitation when the number of
monitoring groups exceeds the available counter pool. After hardware
counter reallocation, reads may return "Unavailable" or misleading values.
Users that need stable measurements across a large number of monitoring
groups should use mbm_event mode and rotate assignments as needed.

Update Documentation/filesystems/resctrl.rst to reflect the default boot
behavior, document the limitations of default mode, and adjust
mbm_assign_mode examples accordingly.

Signed-off-by: Babu Moger <babu.moger@amd.com>
Link: https://github.com/intel/intel-cmt-cat/issues/311 # [1]
---
v2:
  Added documentation describing the known issue with the default mode.
  Will add cc to stable once we have all the things in order.
  Let me know if I missed anything.

v1:
  https://lore.kernel.org/lkml/8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com/
---
 Documentation/filesystems/resctrl.rst | 79 +++++++++++++++++----------
 arch/x86/kernel/cpu/resctrl/monitor.c |  1 -
 2 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 79feeb1dc296..a43ed3c89a93 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -355,8 +355,8 @@ with the following files:
 	::
 
 	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
-	  [mbm_event]
-	  default
+	  [default]
+	  mbm_event
 
 	"mbm_event":
 
@@ -377,20 +377,30 @@ with the following files:
 	will return 'Unassigned' when read until the user assigns one using
 	"mbm_L3_assignments".
 
-	The mode is beneficial for AMD platforms that support more CTRL_MON
-	and MON groups than available hardware counters. By default, this
-	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
-	Monitoring Counters) capability, ensuring counters remain assigned even
-	when the corresponding RMID is not actively used by any processor.
+	The mode is beneficial for AMD platforms that support more CTRL_MON and MON
+	groups than available hardware counters. The mbm_event mode ensures counters
+	remain assigned even when the corresponding RMID is not actively monitored.
 
 	"default":
 
 	In default mode, resctrl assumes there is a hardware counter for each
-	event within every CTRL_MON and MON group. On AMD platforms, it is
-	recommended to use the mbm_event mode, if supported, to prevent reset of MBM
-	events between reads resulting from hardware re-allocating counters. This can
-	result in misleading values or display "Unavailable" if no counter is assigned
-	to the event.
+	event within every CTRL_MON and MON group. This mode is enabled by default.
+
+	Default mode has a long-standing limitation on AMD platforms that support
+	more CTRL_MON and MON groups than hardware counters. Hardware dynamically
+	shares a smaller pool of counters among RMIDs. The size of that pool is
+	not enumerated to software (unlike "num_mbm_cntrs" in mbm_event mode), and
+	"num_rmids" may be much larger. On current AMD platforms this pool can
+	provide more counters than mbm_event mode (for example 64, versus 32 ABMC
+	counters), so more groups can be monitored accurately than with mbm_event.
+	Typical usage with fewer groups keeps a counter attached and readings
+	remain accurate. Creating more groups than that pool (for example 64 or
+	more) can cause hardware to re-allocate counters
+	between reads. Bandwidth values may then be misleading, or reads may return
+	"Unavailable" if no counter is allocated to the event. There is no
+	user-visible indication when this begins. Users who need stable readings
+	for many groups should switch to mbm_event mode, if supported, and assign
+	counters to the groups of interest (rotating assignments as needed).
 
 	* To enable "mbm_event" counter assignment mode:
 	  ::
@@ -474,8 +484,8 @@ with the following files:
 
 	Determines if a counter will automatically be assigned to an RMID, MBM event
 	pair when its associated monitor group is created via mkdir. Enabled by default
-	on boot, also when switched from "default" mode to "mbm_event" counter assignment
-	mode. Users can disable this capability by writing to the interface.
+	when switched to "mbm_event" counter assignment mode. Users can disable this
+	capability by writing to the interface.
 
 	"0":
 		Auto assignment is disabled.
@@ -1791,32 +1801,41 @@ a. Check if MBM counter assignment mode is supported.
 
   # mount -t resctrl resctrl /sys/fs/resctrl/
 
+  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+  [default]
+  mbm_event
+
+The "mbm_event" and "default" modes are supported. The "default" mode
+is enabled by default.
+
+b. Enable "mbm_event" counter assignment mode.
+::
+
+  # echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
   # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
   [mbm_event]
   default
 
-The "mbm_event" mode is detected and enabled.
-
-b. Check how many assignable counters are supported.
+c. Check how many assignable counters are supported.
 ::
 
   # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
   0=32;1=32
 
-c. Check how many assignable counters are available for assignment in each domain.
+d. Check how many assignable counters are available for assignment in each domain.
 ::
 
   # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
   0=30;1=30
 
-d. To list the default group's assign states.
+e. To list the default group's assign states.
 ::
 
   # cat /sys/fs/resctrl/mbm_L3_assignments
   mbm_total_bytes:0=e;1=e
   mbm_local_bytes:0=e;1=e
 
-e.  To unassign the counter associated with the mbm_total_bytes event on domain 0.
+f.  To unassign the counter associated with the mbm_total_bytes event on domain 0.
 ::
 
   # echo "mbm_total_bytes:0=_" > /sys/fs/resctrl/mbm_L3_assignments
@@ -1824,7 +1843,7 @@ e.  To unassign the counter associated with the mbm_total_bytes event on domain
   mbm_total_bytes:0=_;1=e
   mbm_local_bytes:0=e;1=e
 
-f. To unassign the counter associated with the mbm_total_bytes event on all domains.
+g. To unassign the counter associated with the mbm_total_bytes event on all domains.
 ::
 
   # echo "mbm_total_bytes:*=_" > /sys/fs/resctrl/mbm_L3_assignments
@@ -1832,7 +1851,7 @@ f. To unassign the counter associated with the mbm_total_bytes event on all doma
   mbm_total_bytes:0=_;1=_
   mbm_local_bytes:0=e;1=e
 
-g. To assign a counter associated with the mbm_total_bytes event on all domains in
+h. To assign a counter associated with the mbm_total_bytes event on all domains in
 exclusive mode.
 ::
 
@@ -1841,7 +1860,7 @@ exclusive mode.
   mbm_total_bytes:0=e;1=e
   mbm_local_bytes:0=e;1=e
 
-h. Read the events mbm_total_bytes and mbm_local_bytes of the default group. There is
+i. Read the events mbm_total_bytes and mbm_local_bytes of the default group. There is
 no change in reading the events with the assignment.
 ::
 
@@ -1854,7 +1873,7 @@ no change in reading the events with the assignment.
   # cat /sys/fs/resctrl/mon_data/mon_L3_01/mbm_local_bytes
   121212144
 
-i. Check the event configurations.
+j. Check the event configurations.
 ::
 
   # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter
@@ -1864,7 +1883,7 @@ i. Check the event configurations.
   # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
   local_reads,local_non_temporal_writes,local_reads_slow_memory
 
-j. Change the event configuration for mbm_local_bytes.
+k. Change the event configuration for mbm_local_bytes.
 ::
 
   # echo "local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads" >
@@ -1873,7 +1892,7 @@ j. Change the event configuration for mbm_local_bytes.
   # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
   local_reads,local_non_temporal_writes,local_reads_slow_memory,remote_reads
 
-k. Now read the local events again. The first read may come back with "Unavailable"
+l. Now read the local events again. The first read may come back with "Unavailable"
 status. The subsequent read of mbm_local_bytes will display the current value.
 ::
 
@@ -1886,9 +1905,9 @@ status. The subsequent read of mbm_local_bytes will display the current value.
   # cat /sys/fs/resctrl/mon_data/mon_L3_01/mbm_local_bytes
   1566565
 
-l. Users have the option to go back to 'default' mbm_assign_mode if required. This can be
-done using the following command. Note that switching the mbm_assign_mode may reset all
-the MBM counters (and thus all MBM events) of all the resctrl groups.
+m. Users have the option to switch back to 'default' mbm_assign_mode if required. This
+can be done using the following command. Note that switching the mbm_assign_mode may
+reset all the MBM counters (and thus all MBM events) of all the resctrl groups.
 ::
 
   # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
@@ -1896,7 +1915,7 @@ the MBM counters (and thus all MBM events) of all the resctrl groups.
   mbm_event
   [default]
 
-m. Unmount the resctrl filesystem.
+n. Unmount the resctrl filesystem.
 ::
 
   # umount /sys/fs/resctrl/
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3838e0a13d36..8a0d6086518b 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -471,7 +471,6 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 		r->mon.mbm_cntr_configurable = true;
 		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
 		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
-		hw_res->mbm_cntr_assign_enabled = true;
 	}
 
 	r->mon_capable = true;
-- 
2.43.0

