Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437205;
	b=aqsW5NXV4lKi0hcppZCqpTLecIDFW4aL15HJ/yaz2PRM1YvD4xeBfI21YD2SZN7cRj+X
	 yaNCG0046iajizIs+IMsn7MAR6D3zmas9rbT34pNGnXHZC4K5F+ClMGYxKDNY6DKloTNG
	 ZoAj+w4g6zX+KKaKpBZZhrV/N1cJ0awULgxamDmwSml+//P0Pzex5OlHB2Qy7AQmaK2hg
	 pEyj898XIfYvLpYAW4I1IsvQixz0EOq72j8lfDMwSU5LgQKdM39wC9bcDID5dZKChjrS9
	 gBpYvaWFki/IJPxZCaLLzV4Sy4ltclsqIT1M+VjDJRVi3lg+GCql9LXQ5SgvSMyX78A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437205;
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
	bh=0t3iQowJpN3q2YCQEmGjJBSWj03yT5J5PrnqrlsqqiY=;
	b=uToW2h1JVZFJBT2AHQdieZTfOjorLPMZbod8H6bDE9Yzu9OxGwx+HqJ/F95gJhYY/ufS
	 F3dX16ntqnxuuPKF0tuyffbmPH4pTmDw21GjEAhBJzNPoCTjj8vdiwVFlxVZfOP/jJgnA
	 dKTWINNh6zbVEge+2D/+wQ7KxQZMfQEPs+Gh3PoOBHteK6ovrOSondoJSzMzB9OVUMxgt
	 PDX66iRQpKvNAjZx4e1Kt62ZEv4VFPqu376ExAFvyt31mSphAeZboDUhVCMIruTaRNybq
	 g8XYfFAusH/nK/pgyrWesrI/RJP7Zdrh+s0S+/qpHL8SVMmgFMKTTdFMvS1y8x8fe9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="kH8qBpP/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.8
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275C0606A326;
	Wed, 11 Nov 2026 22:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 275C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kH8qBpP/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS3RoZeavNbPwAsDCse7yHDIOIzQy2dZHCoXXBclb03BDEvCttZsV5dZRuGOFVUQHDfT3vrAEO/mjeEKgtT0vJpf3tC06+UdOX7iZFJY2uaWj0VbM1bGYuq9HYqSIB/frjc/kblAUovCyvjatyjKG4fb5svXfwaXaqAEtnOIgLXrbrsoOQvkzLfeiNZJOmCPdZ+3UOHITtD51DDXGqs1wazlX7CDII91kwJbwUeLeeP1pTRQBzzdPlF6XeaavM1rG7QjjOTo506u39KgxTBI77WfagFi2IN14XLNTRRUlMW7hx2a2of6IMEPrnP8STU1ltnpR/u8ST+E4Wk6XPaRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0t3iQowJpN3q2YCQEmGjJBSWj03yT5J5PrnqrlsqqiY=;
 b=Fyapk6FnKuTzpxqpO23v5zDjm3USzl/6KdWte2LgTeGcZIOefrDfFDdLp5OnPhmnkNVOkvMxudX8u2vyXfq2El04S2bwbclJMcoAxPCjhVgn/tfQkbMLueSFpHl0Q4d/WQhTe9D4atCBHOLdKuRH3nxMPRjKpcalNn8p6p5TO5sRnOqtigXwfcEgGLKWcesrWTzMm0346ax8asp2a5kSiDC0eh8Lv+r6VF5PRkwW21a3XYWTS0odmVYpWYsZ75L6Yt7jlHq7lUVgCS09N24w9M8yS6XuMHy/1FLT4M0HEt7wqzqr0wnNi621jLkC/llJOYnpUej+Sn2fRofWc746xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0t3iQowJpN3q2YCQEmGjJBSWj03yT5J5PrnqrlsqqiY=;
 b=kH8qBpP/uK0XIboqXqpyXtlqvwJKHJsdRBoDRrhChyTu89mUrSMi+yT8UUD2WwgevOS5um7460zx7e085QtlinktiVCvU91S5ZmQUpCNHEpLNjTj5dwsYgoAE2xLlKruuEKGbBXByEI+GVebpqtYShRaIAy7n+ROU09gRLpI4ak=
Received: from PH7PR10CA0020.namprd10.prod.outlook.com (2603:10b6:510:23d::18)
 by SA3PR12MB8761.namprd12.prod.outlook.com (2603:10b6:806:312::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:46:39 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::5) by PH7PR10CA0020.outlook.office365.com
 (2603:10b6:510:23d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 22:46:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:46:38 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:46:37 -0600
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
Subject: [PATCH v7 13/19] x86,fs/resctrl: Add CPU hotplug support for kernel mode
Date: Wed, 11 Nov 2026 16:44:06 -0600
Message-ID: <a46c34d2cb1cf11daaece5ef49f7e7936082d026.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|SA3PR12MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: e68ddaff-4ac3-4c53-192d-08df4045a5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|7416014|376014|11063799006|5023799004|56012099006|260925022911599003|260925021911599003|260925021311599003|22082099003|18002099003|13003099007|10067099003|261022075727099003|261022105027099003|261028144727099003|261021121427099003|261102123227099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	SDb4vnK8ThZUDIS84GOQvQQ3E3eD7ktRR5SCstsz5pxVMrThSQwpdSqGBVk4SG5jcxehC7ydogUdrGuD1K/Wko7Ty5vKHHdja9frD9HLchNgzTOMZ5iHwc1x9rZu9enrddbv9/goYo4bxwnr/BH9PJs6Rf8gpPoz8FRbNF3ULpq9V6B4gFpyRH3Xcjo7pOJY+7Pzg7B5keHrd0Ft5MjFcgA1vcFDE3Qgz5acaCoDZD7kgOXVLshiSbWNM5xQA/cTnivI+ithzgpgtKKHRrAk75b805Q6K7JTNxesRn27Uudma0/Li4bnaaNXDRD80joDNTlUReVTnGOCHGQYC0thLzEXlEsVzcWNXKZJSljt+niqO2GbNJ7/fcW4QQgEbF4MvRce6RUMY1KebV/7UCq2SqsS3S5UpSEvOSSDnSW8vETOrYoakEPQBxTsxJLWN87HkG/B4H5Kn5esSYxpyDXtuK4Du9AFuPnxRsGUxwu/k6tBKxeFvkvbCldj892pZIr8pFSyVdRVUHC0FNgKpGCbAn2p1TuzhRJL+mhZ5+enfqJTb3hmgSnqyIGyGtkVpWbQOhxvKY/1AjpFIhx1Jt1gi8rg4tVZLPrU028cbU9hCPkpeC7gbhidtqNMnrOHjbCkysqTpXg7QORnU8hYIldg1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(7416014)(376014)(11063799006)(5023799004)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(22082099003)(18002099003)(13003099007)(10067099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IwvbTGtCq0/VmsLrXi9ZZOq66WSytnerNMFWLhjafADsslHZeUFbk8dSUVI4zcozeTeHg49fhBObeoS1sAt0vOsb3Zn2Wvq48SZYCo607btAlviNOkyLMh3eFJPglfOjPqaFQOHWRbCEjX6FevVCe5SsKWpAfDEBZ8D45poRFTMNo/5qgd3aOeYD4Z1BpKorEmuv5CRviiGxQey7YTo2PTPPI38oKQA6WUWqwTVBdZIiJIsWXaqUBHEZ1JjRc4sitJ1AUbTGwmiEwU2jvfhDpQQv5ZDv+5/ldUAAY2xWpErte8/eJJnDB/oMSRSSgA2Ce3sjMxaM4HWJ0eoFHe2AoQu0PEDQ+qcqqQL+zRpnev5mvMxOTizENkHaBIzmM8wUhTtAQntaKPugpS9oKhNmAHhKmHxeB6TMXovhLNjlltrnK5K0FqfSw5t8BwLB4Yau
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:46:38.8434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e68ddaff-4ac3-4c53-192d-08df4045a5df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8761

The RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode allows the CPU's CLOSID
and/or RMID association to change when transitioning from user mode to
kernel mode. The mode is enabled or disabled on a per-CPU basis through a
backing resource group. CPUs that come online are brought into a state
consistent with the active kernel mode, while CPUs that go offline are
removed from its CPU mask.

Integrate RESCTRL_GLOBAL_ENABLE_PER_CPU mode with CPU hotplug handling so
that CPUs automatically join the active kernel mode when they come online
and are removed from it when they go offline. Also, ensure the register
state remains in a consistent reset state across kexec boot transitions.
This ensures that kernel mode behavior remains consistent across CPU
hotplug events and kexec transitions.

Introduce resctrl_kmode_global_online_cpu() and
resctrl_kmode_global_offline_cpu(), and hook them into the existing
resctrl_online_cpu() and resctrl_offline_cpu() paths. Also update
clear_closid_rmid() to reset MSR_IA32_PQR_PLZA_ASSOC register across kexec
transitions.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Changelog update.
    Code comment update.
    Added changes to reset the PLZA register during the bootup.

v6: Update the changelog in non-bugfix form.
    Update the code to remove rdtgroup->kmode.
    Introduce new wrapper resctrl_configure_kmode_global() to consolidate
    architecture calls.

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
 arch/x86/kernel/cpu/resctrl/core.c |  3 ++
 fs/resctrl/rdtgroup.c              | 56 ++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 14530c11bbd7..d7faf30c2885 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -704,6 +704,9 @@ static void clear_closid_rmid(int cpu)
 	state->cur_closid = RESCTRL_RESERVED_CLOSID;
 	state->cur_rmid = RESCTRL_RESERVED_RMID;
 	wrmsrq(MSR_IA32_PQR_ASSOC, val.q);
+
+	if (boot_cpu_has(X86_FEATURE_PLZA))
+		wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, 0);
 }
 
 static int resctrl_arch_online_cpu(unsigned int cpu)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 16f68f4317ef..af4c929d7ed4 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -416,6 +416,17 @@ static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+static void resctrl_configure_kmode_global(const struct cpumask *mask,
+					   struct rdtgroup *rdtgrp,
+					   bool enable)
+{
+	resctrl_arch_configure_kmode_global(mask, rdtgrp->closid,
+					    resctrl_kmode.ctrl == KMODE_ASSIGN,
+					    rdtgrp->mon.rmid,
+					    resctrl_kmode.mon == KMODE_ASSIGN,
+					    enable);
+}
+
 /*
  * Update the PGR_ASSOC MSR on all cpus in @cpu_mask,
  *
@@ -1125,6 +1136,48 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+/*
+ * resctrl_kmode_global_online_cpu() - Program kernel mode association for @cpu
+ * @cpu: CPU that has just been brought online
+ *
+ * When RESCTRL_GLOBAL_ENABLE_PER_CPU is active, add @cpu to the active kernel
+ * mode and program the corresponding CLOSID and/or RMID association.
+ */
+static void resctrl_kmode_global_online_cpu(unsigned int cpu)
+{
+	struct rdtgroup *rdtgrp = resctrl_kmode.rdtgrp;
+
+	if (resctrl_kmode.active != RESCTRL_GLOBAL_ENABLE_PER_CPU || !rdtgrp)
+		return;
+
+	resctrl_configure_kmode_global(cpumask_of(cpu), rdtgrp, true);
+
+	cpumask_set_cpu(cpu, &rdtgrp->kmode_cpu_mask);
+}
+
+/*
+ * resctrl_kmode_global_offline_cpu() - Clear kernel mode association for @cpu
+ * @cpu: CPU being taken offline.
+ *
+ * When RESCTRL_GLOBAL_ENABLE_PER_CPU is active and @cpu is in kmode_cpu_mask,
+ * the association is disabled on @cpu and @cpu is removed from that mask.
+ * A CPU outside the mask is left unchanged.
+ */
+static void resctrl_kmode_global_offline_cpu(unsigned int cpu)
+{
+	struct rdtgroup *rdtgrp = resctrl_kmode.rdtgrp;
+
+	if (resctrl_kmode.active != RESCTRL_GLOBAL_ENABLE_PER_CPU || !rdtgrp)
+		return;
+
+	if (!cpumask_test_cpu(cpu, &rdtgrp->kmode_cpu_mask))
+		return;
+
+	cpumask_clear_cpu(cpu, &rdtgrp->kmode_cpu_mask);
+
+	resctrl_configure_kmode_global(cpumask_of(cpu), rdtgrp, false);
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -4882,6 +4935,7 @@ void resctrl_online_cpu(unsigned int cpu)
 	mutex_lock(&rdtgroup_mutex);
 	/* The CPU is set in default rdtgroup after online. */
 	cpumask_set_cpu(cpu, &rdtgroup_default.cpu_mask);
+	resctrl_kmode_global_online_cpu(cpu);
 	mutex_unlock(&rdtgroup_mutex);
 }
 
@@ -4925,6 +4979,8 @@ void resctrl_offline_cpu(unsigned int cpu)
 		}
 	}
 
+	resctrl_kmode_global_offline_cpu(cpu);
+
 	if (!l3->mon_capable)
 		goto out_unlock;
 
-- 
2.43.0

