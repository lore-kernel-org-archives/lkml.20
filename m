Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010061.outbound.protection.outlook.com [52.101.61.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB7433F368
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266073; cv=fail; b=ogDRmg3UnfdzDe9+x9Ea/gNwhSYLyOHkNSKysUuleJbVIuuxTg7VRK50V+TSkn39PZ+elYIj2MMoSOBm+tvIW7h2ujBg6Y3g0gAY30knc4gE2aIbPz+I8eXShlYccf1BB2za1jZq8DejvasVdj9Zys74GJ7ap8ZhSm1yTf4Q3xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266073; c=relaxed/simple;
	bh=WQNL0Xfpj9TbFMFp3PKxqUzy/lArIxD1FMhQzhIOFWo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rsd2VNeO0qpGmMe0SK56PzZiwce4ykUvNtCGi2GnLtIld6c51hy/IP3IKTfjlmyhMvtMpFzK/i8Z/3/RsIxCyLmw7omLOht5kq9zzEWb3KS9BnhSyJ0YUOcNYtSQ3MWMVC+VOUOACye+ypZD3Q2LVnMWshX9L7ddx0UpbhR9Ngc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Yh1JPzKm; arc=fail smtp.client-ip=52.101.61.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Yh1JPzKm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNtxXlaOn2yKyjmu1h5VM3DOpVWDwfzoITyIxG7nf41KX9OpiDz+xBLoFIMHKUA4ERfSHcToa3Hd7f5tN6QdZSAqQFv+QowSNheL8d0RHEOacVP3KUstR+ekn3+s7+Q6zqaoGhcDfqF/n2nhDjnW+sOWRQNWHMQ85/835hPLCm8a/BAxIzsrfBHoC/R6mdBwpXEe66OjdrEchPyXs2aldwsIOOPE8X7af2SUHFbWlvjT/CYhiD+IB2//A70vBJpN+pEoe9T0JC9JMMmucXhcfg8R/EZSIWZcqRbJ2colZ2gOgctQ3BXGtQGmofSi/gp/uyTSEVT+WTKatWvPnSRv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLH21SKOEpGvfYil6tXHmeG8hNxxsJFC7hS8QA+8UTk=;
 b=VFwBThkQ10NQZ1uXbwZaAg7rxFRwUdRiX+2yXygTrJecL90AHZhepCDhzOmVM+qZqw+Y/EHPL61U9k1kRC5ij+4POJX8tHrKgXX7ee0EwU7nylN6mEpxtU3Fqx1yeP92dDby5jrKXeyxDjUNE1xKRdk/fkJF9iHajQ5nd1KXHy1w0NN5ZjYDNeeWv8ynO2JwrPy0NRsVgeRARCU7lI5z/o6Hz7HsGka7ITtDIlth1HI0/OPCcFMu6NJFeUVVQ0dp/Gydq+DEE6jm9HQ0lQ3IRBhIStX1xf62N7nEnu6qGpv2eHNXrl5PKlT066OVVh02YMN3znTF9TEi9OfxQrfM9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLH21SKOEpGvfYil6tXHmeG8hNxxsJFC7hS8QA+8UTk=;
 b=Yh1JPzKmFX4IwyjyMjGF56VmIF+wlYpKprJES5HW3BTxPHBxTBjLyJHB5ZiXmBdt2i1CNVX7OfKRDSSvFZ4EFgK38JTE2tou1wft+1qKaJoosINl+icFx2JVOUJtejBTFpZFx//A4pXSjMfWcwmDcZD0+OGkiOWpHrYWgzGqGoA=
Received: from BN9P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::8)
 by SA3PR12MB297303.namprd12.prod.outlook.com (2603:10b6:806:590::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 12:34:27 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::8) by BN9P223CA0003.outlook.office365.com
 (2603:10b6:408:10b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 12:34:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 12:34:27 +0000
Received: from aus0006770c4n-lx01.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 07:34:26 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Borislav Petkov <bp@alien8.de>, K Prateek Nayak <kprateek.nayak@amd.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, "maintainer:X86 ARCHITECTURE (32-BIT
 AND 64-BIT)" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, "open
 list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>, Tim Chen
	<tim.c.chen@linux.intel.com>, Klaus Kusche <klaus.kusche@computerix.info>
Subject: [PATCH v2] x86/itmt: Don't make ITMT enablement depend on debugfs
Date: Tue, 1 Sep 2026 07:34:04 -0500
Message-ID: <20260901123404.2503482-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|SA3PR12MB297303:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a94d45-6da9-4549-71db-08df08255cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|18002099003|56012099006|6133799003|10067099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	1HneOwfG1NbVZQDCIphpKl86Is14ZeCIx9oGHzn/j43hMWKrZ0qK4WAU9CsUvviuISuicGd1o6Ui3F6OE3iARc8MuhzHD+aQU0HSckciRxYC/cjFFx0EFy66CPWf09uBfdIm01DPap6Lh3jz9aNWJH2rJEl9qp7csZ3fDR6wDwo5g+pSkXVMsWQsnNgRj5ikhOaZUFN375+KDqcxPs8Jt/lLZHWU56MDU22OzKEeaY9ab4rE588p6fqvwrpA3sxYykf7qKucwqDI0eF/AycfUo+4NvnBfY5ZySU4O10szi/yBw5rKAu9DPYvNiDk2yXCkJckGV7JLUYz+PfUNrBpjuwZKmMCSMKb0yAi/VhAKI9t4cyeoXpbjhquRyBGNtfoml9BHaPe8aWxypJOOR8FS+qsFvhc7m6A0JHNgIZVOtVQDt5uz7qlN1TsnsQnAMdjbMTlEGS9y7vG5t30EJpWVqONSFGxjLzcqDEVC9cKkTjHu87Ats+ZMGUuJGdKDDpqjGjLSOcoWQn3tMIBwMpnvBmG06uOLXaWo7X68EWAxnxzmpXFuOzrBj3nE2wRlh5UsJxMlocDAgUu8ePK7p2HF4SzeIJo0SSspASbaR6DbKpiVVnUO0BX1J/HkHJhka4ZnCiXvqn+Fv4859KPIlCgruZCgNiUq+lScFu5AFGmhu9UbU+uU3AorXDUL+1S5GDmzybqXC1pUe7IqF1hfP3U2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099006)(6133799003)(10067099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oz8UvR3BVycyAQacytEsTvqa8b7+Bebnu/y+YJBjPb3wRDyZ+143t+uC6h3qV7IYVJIab07/MYluYjLjjr8QSM4HTkKkPU7LrKIJjphYatT5h5DnzqYxBUODS1+aPT0yR/U/AU9kwHwhvppqc5rDZulOTNbJaTBxAhfDmecxaRO4NQyMxcht/FJOCUACZ+1tBe1UH5XqVmsC2VtjFHjuevi5UGJkDpOl8mnbW13ziPz7yVly0UChu67tU97Loc/d9Ua0xUdH8bn6znJZ1O7X3fE9K1Qr0RDxY7hMzQe/6Y+PTXuJ6kPmUdO2ZeipIrDvn0QmnnEwZLUAYdsW8xP0XGURyoq0Y7WvbyWCgtKdLvCBrrN8HtkAkUxpbTdO3RvtC0qGBQmcW4aWD+//9w5d5mjwfRC8EI4MVIugd558c017pEvL2S3j28z7EVm5eARH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 12:34:27.3984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a94d45-6da9-4549-71db-08df08255cd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB297303

sched_set_itmt_support() treats debugfs file creation failures as fatal.
When CONFIG_DEBUG_FS is disabled, debugfs stubs return ERR_PTR(-ENODEV),
causing ITMT to be silently disabled.

debugfs is a debug-only facility; its return values should be ignored.
Drop the fatal error handling and enable ITMT unconditionally.

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Fixes: d04013a4b21b ("x86/itmt: Move the "sched_itmt_enabled" sysctl to debugfs")
Reported-by: Klaus Kusche <klaus.kusche@computerix.info>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2:
 * Pick up tags
---
 arch/x86/kernel/itmt.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/itmt.c b/arch/x86/kernel/itmt.c
index 243a769fdd97b..85ebde361d6ae 100644
--- a/arch/x86/kernel/itmt.c
+++ b/arch/x86/kernel/itmt.c
@@ -110,18 +110,14 @@ int sched_set_itmt_support(void)
 						    arch_debugfs_dir,
 						    &sysctl_sched_itmt_enabled,
 						    &dfs_sched_itmt_fops);
-	if (IS_ERR_OR_NULL(dfs_sched_itmt)) {
+	if (IS_ERR(dfs_sched_itmt))
 		dfs_sched_itmt = NULL;
-		return -ENOMEM;
-	}
 
 	dfs_sched_core_prio = debugfs_create_file("sched_core_priority", 0644,
 						  arch_debugfs_dir, NULL,
 						  &sched_core_priority_fops);
-	if (IS_ERR_OR_NULL(dfs_sched_core_prio)) {
+	if (IS_ERR(dfs_sched_core_prio))
 		dfs_sched_core_prio = NULL;
-		return -ENOMEM;
-	}
 
 	sched_itmt_capable = true;
 
-- 
2.43.0

