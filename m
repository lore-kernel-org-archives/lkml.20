Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437115;
	b=n4hDwyD28+NdZO+xb6njK+8VyB8JAm+AbR5L8wUlxCU8jhYpWQl/SmjwRaLN93zPBP0B
	 3PFAVXa7YNkTW1uN2sfYjnAln5o3aUgViYEsAF4egMtuVK2Q6mvmlS4pDCIZZFHTPo1WD
	 TkOpJpTWqzKkR4i9wzHWDvHZndb3AhWTSQ8VwAWOv/NMd/2P//vUVui5Q247RHbhltpln
	 EqSOy+4CnEajU/VBTEQRTXkZVBJEtXxx01gpdPo27R4rfe6GBRMQrpQ4o0uVQgyNiFYKT
	 aJoDlrbkfn4EYS5gzy+EldKz7zStx9v1hkvSXqtZiXSIerMvA70+qqB8ltgRYV4MvDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437115;
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
	bh=OZBeTYvLsskE4wseBUGQmM6Fncq26pNb3BqNqcPUKWc=;
	b=WlcGMv+KlfHkfsXGwjTNQv/NGHtKCfHkFVwDaWsQIV8J6XK1GhcEFjk7xPLT5jHQ27cc
	 REeGvBbCUEyfcENrtacsw60FmoBN/m3RhbSSQtrdN6JLv6OAzRV4m6BNkpYNZWlQsOIxk
	 R5g2GrRHscg0VFwtIKnTwXY/S1x0UuTEQIZCjCqmmK8K4zvv1sHQVJXkTFDXWIboYp511
	 PDR2MX9uYVvE8rHcyDftdIkTYDKZLU5SSIDUfJRxPCtTKRHmbNZR/rM16zOjSVIeb7ll3
	 M2iwaQtqc7VZWOK9V0JJLRGbeS06LOMeCQ5xUqv89/AcWHr2/eEpk5pqHO8z1i+6TOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xaGpR29q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.18
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4860A3825;
	Wed, 11 Nov 2026 22:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC4860A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xaGpR29q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBVyW2algZuDUWK3NKeShSHNsqdOlHVtv9ShqptES9rElYH2d6trCWRhiauvvB7VR3X5b3Ruxsih2pTQlJ1zqBaiJupUIemJhmSnsAdI2F2LLyQJNqmmfyOkc75Q6QP9H4ouZkFKMCuS2ZyTAi3EOoaKLImorXmS1oVofWWdw/d2/B/atHdJsiUirgayYCVA3tp+fCZh1dC5RZSJsjD6D6gFk9kn8j2oHb4i2Q9+Zb0Ih5W+Mak++ZHHTQUTleyQV4cKn8cdeEYgx0Ns5PRDBxVLndzqKVE9t6kErxeN0HkIo6TN3ok/LHea3on9BBAUv6qW/1K1AaQ0KHieUeNJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZBeTYvLsskE4wseBUGQmM6Fncq26pNb3BqNqcPUKWc=;
 b=ccu8bLgDh25lJ6FeUYS6VLSv89ZN2O/bD6J1UkIyxiU+/OfHegMeKeuj1HAky3ACmL0EmKImSnDdiiRjyKVjEaLAKNga0zIgJ9PG4VksOLcK7Q0JRawZ4441E6OVq0DAej3Vn5I5ewabq0L1xj/1SQQ/R2axZ0PiZBZyC+kFIAfc0XjRTV2LzBJ+KWnZS9BAjupkaBt30mhDY+Hc4kc97Po8z3hJXYUWp3p7rz8tLbi6uzTugQxgO2TudSxWBGDYHWtAsk0xjHyq1alL0J6jhfOqV/GjICBn30vwBGIkaBsicGFUh1Y4/OmoZhps1YptdFWQKCEMxdZmBU5RrAIhiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZBeTYvLsskE4wseBUGQmM6Fncq26pNb3BqNqcPUKWc=;
 b=xaGpR29qi4eUVu9TUBnsQvCDqBSNy7/3eyo3C8OjBcwGKmw115yX/pXnTywwsNQawunEz/aaWFHhrE0rmBMYSk+Y/hTPpZtsc2RTymGe6X7H4Y5x+viowotRlri76AM8+Rk/+PCc0oVzwXfEY9vmP2pyiP7T8iZZ3F9zbivkPuk=
Received: from PH7PR10CA0008.namprd10.prod.outlook.com (2603:10b6:510:23d::14)
 by MN6PR12MB8543.namprd12.prod.outlook.com (2603:10b6:208:47b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 22:45:08 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::6) by PH7PR10CA0008.outlook.office365.com
 (2603:10b6:510:23d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 22:45:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:45:07 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:45:06 -0600
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
Subject: [PATCH v7 04/19] fs/resctrl: Introduce kernel mode enum
Date: Wed, 11 Nov 2026 16:43:57 -0600
Message-ID: <a0251dbaf1c493f84ef1c1dfd7afe9d1cbafcf5a.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|MN6PR12MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ce96b7-f84f-430f-533c-08df40456f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|10067099003|261102123227099003|11063799006|56012099006|261009223027099003|261022075727099003|261021121427099003|261028144727099003|261022105027099003|261026140227099003|261026121527099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	62ulh0k/9oIgrldnUTfiqwIW+eQ+q9mAdNZBKuFi9vHRlmHyUzsVJx8PR2uxAODKluR6SXyqup8CjO01+Moh5y0h1rfCFwygb02XSzJ3bFb/h/9Fk+Tyyzz8+IenwGfV3Qj5UpYD22jPfTrKdSeGTXEPrDUPNUPnX8xa2/tfNDKlgav/dd8GjTe8jfENNR6dhXXSGmCgQBfIIHXuL60tUwdOyeuIeER9xS+iiavx16PGLtQEy17Zofa4BMpx498N/QuqriKspYEXNZrMrGzbNK70VQMFD9RtAxPCcOHnp5G4sH65876F17Tu2GA6v414oz46Bqs3THh1eYcdvr06whG+kWYBXkFy6KVyfSh+Dbd83lnV1+rFfPTDBqwij5FxRX9cXP+FL9C5d+9m3hdw1NTAwqJ5pKJH/1loAoZh1dOJ8Jm7fbZAkP5ubaiBCyYiGTYOA63tb6OrbhyXOXBeiAMUKhiGdjsOqhPuHhzd/kuieYZUYrEvhNJ7zgAQ9hdEeCtyoSyRHaxAjDaIhkevWzTUMYzEtTHDU/ExoiQf8xxNYz7aJpT22/RsuVRafpegxXcq773IHcdVwG5dKEebysj15O2WPV5yjgC8eWf8+N3AsO8OkxalturCN3/wOTEKz89ZkGcksvRd/OXap4ixkt95JCHXpKXBs15HezgH+HU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(261102123227099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261021121427099003)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tis7th92RqCmM/ZJvgWDceVTm3yuL5VbgLwInr1UE20/lLjeOtDHtKkZlSYLwcqVyWhYFSNbo+J71h++QnwJwKHTjElu6E9vlH6IIfov57fKg+KK++Ba0yTvho71MhNZiLh6BBb87ZBRcBw5YBHE8zhyfRUXSsa6UiQZZE11tsEp17fdzQn7aXDmsEvjo3sTRqiAO7UuGBi377FtnoEMXUlb+yzP3AQnuVW2GNQsfyoUxlH0bIqIFfIzYR/cB15FR5gnXwzZBwqRXgKeqIGjYlOfhDgR7hJJ0ABJQyaSLPEKrqCi5VaNQQ7ruYClvPDYJeOg6bjKVIkzaWmNXPq4n9oyw7/hsh0aq3TI51Fz6bjiJWtn/hXjYwJt1dmHZ4wjsWzt0x/DxbSUJyG5nKbQRnELZBeoaodOkNlx+B/VMe1x5iX1ZIDqCPluxRUIvtxk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:45:07.7674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ce96b7-f84f-430f-533c-08df40456f96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8543

Kernel work need not use the CLOSID and RMID of the user task on whose
behalf it runs. On x86, Privilege Level Zero Association (PLZA) enables a
CPU to use a different CLOSID and/or RMID association while executing at
privilege level zero.

Resctrl needs common definitions of how kernel work is managed so that
architectures can advertise the kernel modes they support and user space
can query them and select the one to use.

Introduce enum resctrl_kernel_mode:

- RESCTRL_INHERIT_USER: Kernel work uses the CLOSID and RMID of the user
  task.

- RESCTRL_GLOBAL_ENABLE_PER_CPU: All the kernel work uses the CLOSID
  and/or RMID of a single resource group, which may also have user tasks
  assigned to it. The mode can be enabled or disabled per-CPU; on a CPU
  where it is disabled, kernel work inherits the user task's CLOSID and
  RMID.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Changelog update (Reinette) with minor changes.
    Code comment update.

v6: changelog update and code comment update.
    Renamed RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU to RESCTRL_GLOBAL_ENABLE_PER_CPU.

v5: Collapse the two global-assign modes into a single
    RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU value. Update the changelog to
    match the enum names and descriptions in the code.

v4: Updated the changelog to be generic as possible.
    Moved the enum resctrl_kernel_mode to include/linux/resctrl.h.
    Updated the code comments to be generic.
    Removed resctrl_kmode_cfg from the code. This definition can be fs
    specific only and architectures dont need to know.
    Changed enum name to resctrl_kernel_mode from resctrl_kernel_modes.

v3: Removed resctrl_kmode definition.
    Changed the kernel mode definitions to enum resctrl_kernel_modes.
    Used BIT() to set/test the features.
    Added details to changelog.

v2: New patch to handle PLZA interfaces with /sys/fs/resctrl/info/ directory.
    https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/
---
 include/linux/resctrl.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index b6b4519a5190..6f3e57ec4aa3 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -716,6 +716,31 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
  */
 bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
 
+/**
+ * enum resctrl_kernel_mode - Kernel modes
+ *
+ * @RESCTRL_INHERIT_USER:
+ *     Kernel work inherits the CLOSID and RMID of the user task.
+ *
+ * @RESCTRL_GLOBAL_ENABLE_PER_CPU:
+ *     All kernel work uses the CLOSID and/or RMID of a single resource
+ *     group, which may also have user tasks assigned to it. The mode can
+ *     be enabled/disabled per-CPU, all online CPUs are enabled by default.
+ *     When the mode is disabled on a CPU then the kernel work on that CPU
+ *     inherits the CLOSID and RMID from the user task, effectively the
+ *     kernel mode becomes RESCTRL_INHERIT_USER on that CPU.
+ *
+ *     On x86, CLOSID and RMID are configured independently; either or both
+ *     may differ from the user task.
+ */
+enum resctrl_kernel_mode {
+	RESCTRL_INHERIT_USER,
+	RESCTRL_GLOBAL_ENABLE_PER_CPU,
+	RESCTRL_KMODE_LAST = RESCTRL_GLOBAL_ENABLE_PER_CPU
+};
+
+#define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.43.0

