Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011042.outbound.protection.outlook.com [52.101.57.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007A747B40D;
	Wed, 26 Aug 2026 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772925; cv=fail; b=S/e6+yR89U5jUA8XThRA1u1ocGV+EM+OyUQOT/R5pQIdilYSD+NbQlEz3RRXat8we6iIrSKmBoGRPsKNReDwP8ndzDdGZYLaDRJef96FJ+XJPjbWfBcHWH+hlg7fbawG56NYnmP8FM89CGNzC4im46E4LPM8mdlDyjPxlHa3MT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772925; c=relaxed/simple;
	bh=zJN0Fh5QzWlebD7SU4LMHsTIMrbt5tO2l6y4fZakqG8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mMKtczOnylcJnjJTSyHNOQMVRf1zGkoBPMRNeO+gz60eSigN3OdFpj1jRl/pb3C2cUqRLpG58zAbFAHRuRUw2irvT4kW5WOy5rpvwFFVwc+NP/GiIT4AFXXxyggSpZoIr40cGY+wsVgTG4MKaDairhZuB+Cg3UI4o7cp3Xb+HUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yB/sGSI5; arc=fail smtp.client-ip=52.101.57.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yB/sGSI5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xazFkTNERdNjecMnEsWGcQBDe30Y16VT0Z8x+wspY336OZk2mIwVJXuulMz+7NgRESyHhYdoSJyNS/2AiyOV8yR2kcVhKKZ063rQ01vz5VqEQQ4iOuaziBDRk0/4pApLuYGqAdf+8DkFaFLd1Sw0WHhsQn19omHHfmZqnRXEuGFrNeiVZnMreFWLUWnW4vndJGvB9PTbULuzXo9ffPJR9+JPOMJx0risTHJjh7PsyzrWFe71iIGuwUJLnBJhedzVu2oyJyk//FpAYo0nyBwVnvL+01xnKLm4tzAwp8hUQ+qx5ZM8GFlBzGQEtW2rACpPdrmOUJSuGcT4G7FRBgjprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgVq9c5JS1QlNqA1yzXJrn1ljX1LWKrbWw5JgBSKqYc=;
 b=Qt5CDFSVkmRYe5aLoBhb74YkpfINJnlUpaRXKDkyG53o3W4+Ot0ZTKXY8Y+GDkEbXbAa2p+0nqAqsIrzqUMnBkyKvRcCTg1WtAGQfS+8JiPtF6QPkvQgzybr4u/ghuPhU7tzbXwLVdxdzqLupV+jHez9QAsn4Qy6f11h7AOIkYNVLItznLtJlNU8a/NyxIVpNSbgQOa2dA1wSaItZVTg5PHetHK+PxAT5Bgpv8OW1nqcO13wkAGpyPMJofdKu9wgZXtmtCcqTQAZX1iTMnA9QM8Ki9tVd1ajYt2+HFnv8mCJWz2T3Danfke0oR7hBUg6ymGWQHIMtL2QmZ6KnVKXLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgVq9c5JS1QlNqA1yzXJrn1ljX1LWKrbWw5JgBSKqYc=;
 b=yB/sGSI5vC/OyCFCLZtsiex4cEj8MKSmiEyRr6zLhv6rmYWJp0WT7RDqCyj9d9BuNeG1JnAHqqns/OzfrADZ09QWK4/PPH5e8IcfxG8lufxghqjWetXFjY3NMYLtL5xTXq0AhBgAMPP+FqZj09iGPI42OweJ4ovjCv8kD1Eqx6Q=
Received: from SJ0PR13CA0150.namprd13.prod.outlook.com (2603:10b6:a03:2c6::35)
 by DM3PR12MB9286.namprd12.prod.outlook.com (2603:10b6:8:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 19:34:59 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::b8) by SJ0PR13CA0150.outlook.office365.com
 (2603:10b6:a03:2c6::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 19:34:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:34:55 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:34:53 -0500
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
Subject: [PATCH v5 12/16] fs/resctrl: Program kernel mode assignments on CPU hotplug
Date: Wed, 26 Aug 2026 14:32:26 -0500
Message-ID: <16b8b0e9d91c9224722691009317464c4d585178.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|DM3PR12MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: 715c6949-b09e-4de7-5f6f-08df03a91baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|7416014|376014|1800799024|10067099003|6133799003|22082099003|18002099003|5023799004|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	jUkOQI+Cix2pS2evBN1qCS3WrjtvdmjI9uV3ZgrTBkjLb1g6QyTF5veiwjL6BFgeMazuCWGlbLYRxVGhVQugPgk9MUcRDjD3m1pkUdsoggcKszqRJf6T6C75G473vzfOLW5YwTKiRVfnPyqmwbuuMDGNzY6QjeTbp1vCqNa40jUtqf+xbgpAwWuteSjFM562StNCRq+ooAAFFokt/cd0QcB20Eo9S427mznQdVR5mB/KdQfn+RU5JwQJM3uFW5Wqg45ZQDLrq+Bwm4wIxPS4/uBuXd+Rrz8zmPW7zIzAWgAwiRgfst2/qxxWUOv+Jh2dtNx3OhMdcc63SGcbkMaJUPaOev0M0ZTgRPqz8RT8ATrdQzeUvBvGNyAyEYyHp7i5bpJ1UThArh+rG2eJSRcxEWChn+8IjBmSIyI2bZ7Ji4gKbEvTHDDOOOU3+p0k8/gdT0/UUATXGn9gGjqNl3ylDLlHUh1Duzw0ZHriu1YIJg9top0Iy6clHRyXLyxfaBTSxhW0AcS6UaT7j+Kd8hPO+gkNxaVCr7GWcxZQ39NzSNjmSjxfxGIsSmuew+CBHmxA65tsAJtOIxvAh/YOgx5HHQqtowbHqhd7jIUaZrgTYUkGk/JkZddPsmof7ckJJ/sQm+iYGTAq5Pba09E/RodAnA==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(7416014)(376014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sDD9QQfJ2PWkJFtyYHNzybfPIgQhFyje88iidy0bEiE1coXLz7RlDBzinwLMm3NaP7TXSYKvIGSc+sI91ny5s7RalMjVoCyK6iXeokr5jPDqOY1O9hU0T2GnPvd/w5hfQFQ+gr4XCWm0Z5kX2fnjXBbdFW6joZlkzkrX+EUpipVGguMAMsFDBZIbnlO6Knh7SO65CRPJwytW7vVJPvWoUjDJb3httIOVYcIH7iaWj3MZCGZGAYKlRoH/3AChM7I23d/5Fmd6evr4xzAExIu+7gYxvoDjt+RGGv0BfQqEdoBFRRF4QNU5ZMt2g+Hh0WQ/qqSBE0lFzSgbN2SqM6AM8z2zEyuRIdJZY6s3k7ngob6AYpy8Hee2m5FXHTIJ6QNECwD21kbgY1Bg2lpUlXE9TyEpZH0RGlY6Zzuky25cGg4uQoFAgqr9f6U5Nd5BzptP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:34:55.7658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 715c6949-b09e-4de7-5f6f-08df03a91baf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9286

Kernel mode resctrl associations are programmed on a per-CPU basis. When
assign_global_enable_per_cpu is selected, the active kernel mode
association is applied only to CPUs that are online at the time of
configuration. CPUs that come online later are not automatically updated.

As a result, hotplugged CPUs, or CPUs that were offline when the kernel
mode was activated, may run without the intended kernel mode association
even though the mode remains active system-wide.

Add resctrl_kmode_online_cpu() and resctrl_kmode_offline_cpu() and call
them from the existing resctrl_online_cpu() and resctrl_offline_cpu()
paths to maintain kmode_cpu_mask and update kernel mode associations as
CPUs enter or leave the online state.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Added resctrl_kmode_offline_cpu() to disable the kernel mode
    association and update kmode_cpu_mask when an associated CPU goes
    offline.
    This addresses sashiko comments:
    https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=11
    https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=10
    Also moved the patch earlier than patch 10.
    [RESEND PATCH v4 10/15] fs/resctrl: Reset the kernel mode binding when an rdtgroup is removed
    That seemed much more clear.

v4: New patch in the series. Patch taken from:
    https://lore.kernel.org/lkml/20260611111706.1981788-5-qinyuntan@linux.alibaba.com/
    Updated the code to enable kernel mode by default whenever a CPU comes
    online when one of global-assign mode is enabled.
---
 fs/resctrl/rdtgroup.c | 59 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 06e74b027044..97e4176669e5 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4951,11 +4951,67 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 	return err;
 }
 
+/*
+ * resctrl_kmode_online_cpu() - Program kernel mode association for @cpu
+ * @cpu: CPU that has just been brought online
+ *
+ * If assign_global_enable_per_cpu is active and the rdtgroup has an active
+ * kernel-mode association, add @cpu to kmode_cpu_mask and program the
+ * corresponding kernel mode association.
+ */
+static void resctrl_kmode_online_cpu(unsigned int cpu)
+{
+	struct rdtgroup *rdtgrp = resctrl_kcfg.active.k_rdtgrp;
+	bool assign_ctrl, assign_mon;
+
+	if (resctrl_kcfg.active.kmode_cur != RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU ||
+	    !rdtgrp || !rdtgrp->kmode)
+		return;
+
+	assign_ctrl = (resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN);
+	assign_mon = (resctrl_kcfg.active.mon_mode == KMODE_ASSIGN);
+
+	cpumask_set_cpu(cpu, &rdtgrp->kmode_cpu_mask);
+
+	resctrl_arch_configure_kmode(cpumask_of(cpu), rdtgrp->closid, assign_ctrl,
+				     rdtgrp->mon.rmid, assign_mon, true);
+}
+
+/*
+ * resctrl_kmode_offline_cpu() - Clear kernel mode association for @cpu
+ * @cpu: CPU being taken offline.
+ *
+ * If assign_global_enable_per_cpu is active, disable the kernel mode
+ * association for @cpu and remove it from kmode_cpu_mask.
+ */
+static void resctrl_kmode_offline_cpu(unsigned int cpu)
+{
+	struct rdtgroup *rdtgrp = resctrl_kcfg.active.k_rdtgrp;
+	bool assign_ctrl, assign_mon;
+
+	if (resctrl_kcfg.active.kmode_cur != RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU ||
+	    !rdtgrp || !rdtgrp->kmode)
+		return;
+
+	if (!cpumask_test_cpu(cpu, &rdtgrp->kmode_cpu_mask))
+		return;
+
+	assign_ctrl = (resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN);
+	assign_mon = (resctrl_kcfg.active.mon_mode == KMODE_ASSIGN);
+
+	cpumask_clear_cpu(cpu, &rdtgrp->kmode_cpu_mask);
+
+	resctrl_arch_configure_kmode(cpumask_of(cpu), rdtgrp->closid, assign_ctrl,
+				     rdtgrp->mon.rmid, assign_mon, false);
+}
+
 void resctrl_online_cpu(unsigned int cpu)
 {
 	mutex_lock(&rdtgroup_mutex);
 	/* The CPU is set in default rdtgroup after online. */
 	cpumask_set_cpu(cpu, &rdtgroup_default.cpu_mask);
+	/* Program any active kernel mode association on this CPU. */
+	resctrl_kmode_online_cpu(cpu);
 	mutex_unlock(&rdtgroup_mutex);
 }
 
@@ -4999,6 +5055,9 @@ void resctrl_offline_cpu(unsigned int cpu)
 		}
 	}
 
+	/* Clear any active kernel mode association on this CPU. */
+	resctrl_kmode_offline_cpu(cpu);
+
 	if (!l3->mon_capable)
 		goto out_unlock;
 
-- 
2.43.0

