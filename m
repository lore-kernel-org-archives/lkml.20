Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437093;
	b=Pyy41qGLYzrCs+zG2oS2072ZkDT/IX/GB2jKyrzFWdnk4wKB+dSQIzVUBw5y38HKCsX2
	 nvKyN2cPOQfoUJuNW+Dtq/x3F7XoihmR+yYchYtQJon6oZriY29Hrs/UpS2HyK3UVBKhd
	 ctYC0wNfCHHn/qmsji67Tb5rwWoWT2+jJA3CyuqqmX5zdlCOQT1P9/Llj5CvhokDp6rH3
	 OuECY5lJUGjj/EDBQyDT6cRZEE1U74wNgqKTsoNHxB8HnhYs6sh5xjGYbxPn0TGGm0rYa
	 9LibNnTJWYEArOMBNUABmbvBKfHF1u5f54tAMJccDC3IlCcBQ7y29z7o1odWwF26AQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437093;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=BcokNcIW5Y88SNjp6rtNW4Z8bO6tvA6Cwe6xhkycsSA=;
	b=NarMl42+W/d6pLNtDo8d4QY1tb/OG6Cejf54ATXrdNhLzyi2xE2W5Qf81JUMJ/uYrGBi
	 KRMa61U4Smp9y9L7jT4H44kqcYoPPBaJtVCym93GAoS0FQszaLKemQkr+Qu5c8+/Bf/9B
	 Eqh3WdG8YhOZHfUnJAIktyKO1RtzJNJW2bQe5+NAmRtZHd50UJU7/6pv1GeR9iODIPFbc
	 couY1pSDOxCzxmBLvgtGFZKrBXW6SC0bWXYdhWkhsLrwszhTk/vFBVLI0gtPK0kYQfiSI
	 o0tjXYnT75CZ+ZZDpLcOLF0EU+M/5fvanXM5jNP/6QpTf9rNXdsFEDoDTrs1sSLO+dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aj5R1Kil;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.22
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011022.outbound.protection.outlook.com [52.101.57.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A87C60A2638;
	Wed, 11 Nov 2026 22:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A87C60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aj5R1Kil
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRoViKi80XuaSOTpjm8F0MbQb7FgyTilRUC1jXnI0nWYsYIMCVhDcY2NoJZgzr0kbdmxld6aOixqc3/1LRus7hvr7yIB8UWoFg+aB4DkGxvGUrdZf5nsxMFgxdzYiD4tKnzWtXQJihcOFIjYBxShUi/h292N4OTGOsMiSctrtxtzyxudyYF9kSntZ7V+dR028luLIfjO+gCOhiDGNdIWKLRRHTtiXG8D+UsLzTgjdz8I87Zb0lAMjYMVUlfgBZxBQjypovbv9bvZKLiDKbT8Q3C1ELpAenEP1R64Vv/VYyw9VxaG+O+w82e7aOZ9hBY+C+1Yr3X6jABtHM7VSAxV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcokNcIW5Y88SNjp6rtNW4Z8bO6tvA6Cwe6xhkycsSA=;
 b=uh8v+zPghsVdikIjb0fWSAITbSLDmlWhnqmGt3oU6z9zuHaWA7I0pqBr7AXwWqyl2/QJ3BzvbA05BgbZx8PuFFa8+vKYgreo+vfA5M2lSZXjKkwkhWX4nC2sXrL7DT3tHfrxxyFXYodBIIC7JUMEI7pGnQEfIfAEvYcP92FCbwo4mea1lGHNtmD0zmD83Q25m8W3hjlMW+81Lqhx5zs94RdEnRFDfDv99AJcNLbBEbk3IqhU3ou/pktnn9iAiyyyLidYey1NQycAaVXruUoEKl6QHYmYbOoP+kcwEZoY0SD41VNuYGXP9dU6MN80KLLOxSHXMzRMfKR8F5XwhBtiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcokNcIW5Y88SNjp6rtNW4Z8bO6tvA6Cwe6xhkycsSA=;
 b=aj5R1KilB9f8Dk7IAnLvwL2mCgej2DB6T6MZpheiqRChgxTTQbl4OFHdJNVOK1AakUhn4MeCy0Yrh75f0JdS0swL9T4yGG4YtSXsyqGn0O37LvkW3YdRVBcmTEs4hPV1b/J9y0fprij1dmRuM2NbLOqeyxrapuTAB2JY+pRrj0k=
Received: from MW4PR04CA0231.namprd04.prod.outlook.com (2603:10b6:303:87::26)
 by LV1PR12MB663552.namprd12.prod.outlook.com (2603:10b6:408:514::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:44:48 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::2) by MW4PR04CA0231.outlook.office365.com
 (2603:10b6:303:87::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 22:44:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:44:47 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:44:45 -0600
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
Subject: [PATCH v7 02/19] x86/resctrl: Add PLZA support to command-line options
Date: Wed, 11 Nov 2026 16:43:55 -0600
Message-ID: <7cdfb87055acedda5c5f54a84135627d5c80e8c5.1794437052.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794437052.git.babu.moger@amd.com>
References: <cover.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|LV1PR12MB663552:EE_
X-MS-Office365-Filtering-Correlation-Id: 179ff353-27e9-4a6c-1e41-08df404563bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|82310400026|376014|1800799024|18002099003|22082099003|6133799003|3023799007|10067099003|56012099006|11063799006|261028144727099003|261009223027099003|261021121427099003|261026140227099003|261022075727099003|261021123027099003|261022105027099003|261026121527099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	+LHtJgLJduOaqVay4izkIaAwANHVchSxWanf52/GRi3D4sEavcmyQSIW9fX9qEG9z/X61xA2LN3Uhmn9XBwXFWRiG3T/qpYgWB5RTwVPxfu0sbNdHL+ngWDycT7ReArEuZ8p82MrA98pzhYgZtgPabChvPRO414m1BgN7WbQBIhr7Z0BnGzVSlIBQHpt23cZZoJgXRMNbEHZTp3hm+xn/h+S2Tmy4zUzYvoIU+4FHu4lb9isrgCk9+tXfingX2r/R8SSiq0UOccoQB+yjeveqQ49KOJnF2tmoo1EWE2hNZS/aEMXb1589WEIuOQruIbPH/xXgB0R64aiiE6bDmFPphqxKrkUBdnSGRQHHLgBFHO3Yei6OMjbeHGcSCLgqN39AOMBgFYDYYx+n7sntqIXFiBaJzo/BK10h4hexD4CLxf1PmpxAfFn3mEkuZCCgR99Hix2D8CnwMh0cZp7w/ysA8PJKqYDdInqtLgkn8vSVFOZm1Y14ap/rWGzNeJknKONPwfkiUuZ4umjqpGAoSrr+v7V6I/+tXP6hOVNlo57TwYmTi8aKdEB1u7TlnzulP1derFwgj6J9MsHFjayKWJQQ++PZmCeUZX0sBwLXJrI91n6kht578DJSdkT94HEH6WzaXkN1FXNpQEgc4grl8xnxqpMqGdmPRIQ5g7PM4uQT0LpYEbvMU7Ff1bQS6EGliqCHOV9by+RVSLHHMcZD0RlLg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(261028144727099003)(261009223027099003)(261021121427099003)(261026140227099003)(261022075727099003)(261021123027099003)(261022105027099003)(261026121527099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P5IMCYXLx6+5D7C5i7vBJPUlqbugvqlUxlXPFtPhwfExGFPMm7KyhSxv3hdwqSoKw9tqaoeZmlzoR1nXSJcQWsZY5omXEhFulabHwzNG6oW5IVsEdFn3YPxRSIEdOeXwWZhl4U8zTAb85JT/gnh8xalyHJfW7QUfklg/wiZcdtDVliN1wHY9/97jDR07EmPWh8sQ93gazmin5gqgrq4zjKTdP0OjrJyad2/pO0V8IXwixJSai3PdZo/mSJcgJiggH43jILAHV4uh4CW7JX3YjEdU+IQuH8vXX7CPsmUGpSOatKoywpSi4lmpz/uZiJsCqeYe/4hCHubpGrUO0F126ESz54Ok1rCadCeAhY0xURsTIJB5bgpA9ibhvG7QYHw4osjjz8LyG0WAGlm9qSijRkB3nssvR/SM4ta062PbZ3YhYTfVWZ155EH58QsEx94I
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:44:47.8771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 179ff353-27e9-4a6c-1e41-08df404563bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB663552

Add "plza" to the rdt= command-line parameter so PLZA (Privilege Level Zero
Association) exposure to resctrl can be enabled or disabled at boot. PLZA
is exposed by default when supported; rdt=!plza suppresses it.

Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
v7: Removed repetative lines.
    Added Reviewed-by: (Reinette).

v6: Updated the changelog.

v5: Updated the changelog to mention about rdt= options.

v4: Split the patch 1 from v3 into 2 patches.
    This patch contains changes for resctrl subsystem.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 Documentation/filesystems/resctrl.rst           | 1 +
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..b8c680f7f638 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6460,7 +6460,7 @@ Kernel parameters
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec, abmc, sdciae, energy[:guid],
+			mba, smba, bmec, abmc, sdciae, plza, energy[:guid],
 			perf[:guid].
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 2750f2eabf70..d13a4998ee7e 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -28,6 +28,7 @@ SMBA (Slow Memory Bandwidth Allocation)				""
 BMEC (Bandwidth Monitoring Event Configuration)			""
 ABMC (Assignable Bandwidth Monitoring Counters)			""
 SDCIAE (Smart Data Cache Injection Allocation Enforcement)	""
+PLZA (Privilege Level Zero Association)				""
 =============================================================== ================================
 
 Historically, new features were made visible by default in /proc/cpuinfo. This
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 3294b18ba45f..e64e9191184e 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -772,6 +772,7 @@ enum {
 	RDT_FLAG_BMEC,
 	RDT_FLAG_ABMC,
 	RDT_FLAG_SDCIAE,
+	RDT_FLAG_PLZA,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -799,6 +800,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
 	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
 	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
+	RDT_OPT(RDT_FLAG_PLZA,	    "plza",	X86_FEATURE_PLZA),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.43.0

