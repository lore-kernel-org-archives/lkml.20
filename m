Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011026.outbound.protection.outlook.com [40.107.208.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689553C141A;
	Fri,  4 Sep 2026 18:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545266; cv=fail; b=EfmTvngXQZPmfmMMH0na/LYDZZxsMueTirW4LT5+XUf8Eo8LdBKjSgV1DKr3a/qYehqy2EJng8zrqdE2sB1zI8lPI72GGrfNrgMFaabdCTmOjhca9hwiuqP6oxxCU7sbKA9rSyfz6mK7/NHHXps2c6ciSmcJcoKrb+lV07uqZSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545266; c=relaxed/simple;
	bh=mk1KDE75BCXyDMWVVtHZqlQdP/olPpD16oAyc3wjU6I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XMMVquNt7PDpbv3XOPkWZJ0HwF7cF+rBTzug74ESJayuSuaYrZbK0bVr+RZmWeqPLbWOXXJI5FsR9TYL+mvAro+WbYOnL73irLK6OUqgCrF5+czCMnNvXc9jQwhgSYt+ogn/d0FqwLsWMZgwDgL8dfLQCJWiMIRmG1eTL54pnNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2ajCHFiD; arc=fail smtp.client-ip=40.107.208.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2ajCHFiD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tfvf9LjNC1XL46PFIZBgk0/r2otW31o0CYCKNB0vbYhRbg5hK3He27nomNuiEh8vsUexC063VUBVlKbq9PDycDev0SaxHmuHys9iEzX9PbOWJ+qOz4SIl0DhqAaMnm/TnH9a9KH9pbLGwe4qL/hrjbUiVkdQ2oYz8jLwXyY4BBRR4+L3ZUH64viBO8i/8N3JTeKaZ5FE0h/cpqXW+cUHx8eZXWRquDtWVMAjyCqeXyQWlo5G+Butv8IVZWutXaZrsubvscvmwkcmOsah1tUkpVH4QZdL+vEDdK0gNp+tCYtDLHdnSd/Px5opV0nao8P/XDE1y9sHtYi7W6CKdZcxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ag6bX2i/hvcm+y0zwqzRVUmJnGNbvqRWHc8OhRuhpY=;
 b=uVdam8W1tIKV1uaePUaQs1jhNUNmxeo/UZD3mN9Lt8zyD3zlalzMU7hWYN7qfqhNNckxeJVoFPh9VO5zc6Pgn56vRM+GXCI0PfE7S0yrRhl8UTuhDkMlH05/Uu2vdw5OiZMrE1Rm9OCa5iHeSB08nE3GoOXrasRvMAtQkdtx5R94aPMSyLGcvAeJ0/T1Ve3m1MJCJa77EgeWktu+Ez0mw1z5nXkHhLIMYJdm+9wUVAfGdbKqQEswUZG27E6bix61rwmE+thozPfnICqHL/Prg638NOOZjd4YKxkl45SFqVh2rAaaZYi7hMGdS/qP/xEAmBjHCoKUO8Wf+JVs7+zSeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ag6bX2i/hvcm+y0zwqzRVUmJnGNbvqRWHc8OhRuhpY=;
 b=2ajCHFiDTByfQR/nHInS1Fr1aWuY8DeAwWYpfGnOfw/ta3SLFZ7UW8eqPjH4Rf0Mwsd2fpK8U3KcDRywr/AJLDs00bJ0LGSH92PxckNUFi7nV5bSzeS5kRbkmqRD3V8s1/8t60wbYbBMSqEXJ95d+cSydImGQ7tzMH2wFZD+kAs=
Received: from BN0PR08CA0026.namprd08.prod.outlook.com (2603:10b6:408:142::28)
 by IA1PR12MB8519.namprd12.prod.outlook.com (2603:10b6:208:44c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:06:25 +0000
Received: from BN7PEPF000000A1.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::1d) by BN0PR08CA0026.outlook.office365.com
 (2603:10b6:408:142::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 18:06:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A1.mail.protection.outlook.com (10.167.248.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 18:06:25 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 4 Sep
 2026 13:06:24 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
Subject: [PATCH v2 1/3] x86/resctrl: Fix ABMC counter programming for extended counter ranges
Date: Fri, 4 Sep 2026 13:06:10 -0500
Message-ID: <9e85f67add9ac84f55e4b0fced92ed8994f8419a.1788545152.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A1:EE_|IA1PR12MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: 055ed391-5a61-4195-eef4-08df0aaf3c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|23010399003|36860700016|6133799003|10067099003|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 tXPFIsCmtJOmsXDMbyxAkcmW2Hb5ZJShnIxOje/3+qjHmHGHnQh4glVShNVecy+yGESEarevX5gedmqGU5EMWCEtFoh4OmvTWAF6us//GAJXPGwOhcV81rUd/dOpE4ft3K14ZTrRp8f5hD+jtT8bHHbrBhJpiIDjzoL8CjaB63jl9pKS6TDdX2N1ZoX4qL8E5cYqhpBI9MdF/8YpQ0Zlk0ANTSaGke7ksC4ul5U/+D+IAPduwA9peGM9phVntado1jZVtK7ZB9XZYnK9qFOvk57pjHO6+xobRGU2a2UZ+Ui1QxcRJ8/pQrUm7jc8yOCPDRnBcunGNsDPcHUhqO08g2DdN8yPABErI7+f/BTLZtbFpPZauNwauUWA0CJ9Op0ueru397JH1C8eRKRzh49OqD6cqa5PTvBLXw4zJ5wph6GVsWsmXFrEnlv3ES0OMWzhTNPYHuW/Oh3K4QoMkthOOid+eIbWAKShmArpo3bDE/sd4JraYef+IVLIZfDrwbHwuITkdsDwnFHzSUFtasMFu/hl3T4mWEOgbbnB3XYTw+x9M0FuN/ZY7qdDxxNww+Unp26k4Xf6L/YWqOqQwFixjBehlDiXYSYmbtXeISTmk9yrA0RpIAUUj4ZM96QDx6AY4GRObfSKFnxZNjLuOzlapK2lTS4RCu6OeFyHHwUTwJfaYtOrXBxy4o9QdOBYkcikkjN71Hr9wP/qi9uvknxLmQ==
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(23010399003)(36860700016)(6133799003)(10067099003)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 IesNCLCS3poCfFx0Nk3WUQF67Shd2OxbcUdUJ0vJQSYnT7aoBIWOzncEBxsj95CafW6bHvg8zrAqsLjPqUoebLWVd7IEPsPMXB8lkArcY9ZQu821PGwcQiE7ycSP+Wj1sH43I51T/oqe7gZdstIUvu3oFP1QAT72sGzEvi/xvvrv6zXQQ/wAgvPJ7v0Zli2JQpVSlm6xIcQD8I+pkbydYzDqhM8nPU/zd1NCCz3jTs0sQud7QqANlKuCE4XiwTNQHpBZo9XtJcwx5Z4bLtUQdohKiquqzr5t+Wbwdj56r84+cB+AELkEWj2zFKoioEpuAp/Cu3JD6t4zI8qW5rbIUvQhEmRLojYLiIUXXlsudHgKD6AhCWsnXaKrzJ6CD4bSK72to7/1aN41meJ1uogCdVdLCZ4JZ/PBZPJY2Hix0lgL6GbKb8Vj1u5dAwWw70J2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:06:25.5855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 055ed391-5a61-4195-eef4-08df0aaf3c3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
 BN7PEPF000000A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8519

Memory Bandwidth Monitoring (MBM) can report incorrect values when ABMC is
enabled on systems supporting more than 32 ABMC counters. As the number of
active monitoring groups increases beyond the range supported by the
existing counter ID encoding, programming an ABMC counter may inadvertently
affect a different counter, resulting in unexpected counter resets and
abnormally large MBM readings.

The issue originates from the ABMC counter programming interface in the
L3_QOS_ABMC_CFG MSR. The counter ID field is currently defined as 5 bits,
which limits the addressable counter range to 32 counters. On systems
implementing more than 32 ABMC counters, counter IDs above 31 cannot be
encoded correctly. Consequently, programming a counter ID beyond the
supported range may target an unintended counter and reset bandwidth
statistics associated with another monitoring group.

While updating this logic, it was also observed that the bw_src field,
which encodes the RMID, is currently at its 12-bit limit with support for
4096 RMIDs. This field also needs to be updated for future expansion.

Also found one more pre-existing issue. This union structure can truncate
data on 32-bit x86 systems when unsigned long is used.

Fix the issues with the following changes:

1. Update the cntr_id field handling to support the full hardware ABMC
counter range and ensure that counter programming does not interfere with
unrelated counters.

2. Expand the bw_src field to 15 bits.

3. Change "unsigned long" to u64 to fix truncation on 32-bit x86.

The AMD64 Architecture Programmer's Manual [1] available at [2] will be
updated accordingly in a future revision to document the expanded cntr_id
and bw_src field definitions.

[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming,
    Publication #24593, Revision 3.41, Section 19.3.3.3 "Assignable
    Bandwidth Monitoring (ABMC)"

Fixes: 84ecefb76674 ("x86/resctrl: Add data structures and definitions for ABMC assignment")
Signed-off-by: Babu Moger <babu.moger@amd.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
---
v2: Moved the link tag to the last.

v1: https://lore.kernel.org/lkml/980f39d3a0e0d9f73925e362f835aeef070a1bc5.1784322818.git.babu.moger@amd.com/
---
 arch/x86/kernel/cpu/resctrl/internal.h | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..b3d780eda8a7 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -192,7 +192,6 @@ union cpuid_0x10_x_edx {
  * @bw_type		: Event configuration that represents the memory
  *			  transactions being tracked by the @cntr_id.
  * @bw_src		: Bandwidth source (RMID or CLOSID).
- * @reserved1		: Reserved.
  * @is_clos		: @bw_src field is a CLOSID (not an RMID).
  * @cntr_id		: Counter identifier.
  * @reserved		: Reserved.
@@ -210,16 +209,15 @@ union cpuid_0x10_x_edx {
  */
 union l3_qos_abmc_cfg {
 	struct {
-		unsigned long bw_type  :32,
-			      bw_src   :12,
-			      reserved1: 3,
-			      is_clos  : 1,
-			      cntr_id  : 5,
-			      reserved : 9,
-			      cntr_en  : 1,
-			      cfg_en   : 1;
+		u64	bw_type  :32,
+			bw_src   :15,
+			is_clos  : 1,
+			cntr_id  :12,
+			reserved : 2,
+			cntr_en  : 1,
+			cfg_en   : 1;
 	} split;
-	unsigned long full;
+	u64	full;
 };
 
 void rdt_ctrl_update(void *arg);
-- 
2.43.0

