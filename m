Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010067.outbound.protection.outlook.com [52.101.56.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A953A9612;
	Wed, 26 Aug 2026 19:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772822; cv=fail; b=JLlTwhsTyFnDCbb3RfbQ1BB0zyzPZgMfALjzgX2RYObp7jSP0aNIjv0UzeBpkenPzr/B4hq92ShdNq39+Lsn2uG5fbLK8EWFyzIfG2TCYtsHistUDdkJNOM+J+l3HH106sDo8xdJkmKXMsl2Z6oICLib5I0S0vjelRSunSAEQHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772822; c=relaxed/simple;
	bh=ABscrGai/cn+ApWaCx5YutR5SPVeww8u8o/dmH8++zM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HI3+7tVqVK7SLk5MXNMP0vhO4T/Z+lQQNowWyDP6nQz5zLSAL29Q7oMNrT0bxmxRmzsBSDqrdg91ZoDuOYNOOPnK/WqWDdR1shq8l2whXBaQg3ngeQpI78/boKFPyOOdFUpNRHe06ZvlQfeZdE+L+7rEjI9k0d1pVCd+ahBP/f8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Msj3qpad; arc=fail smtp.client-ip=52.101.56.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Msj3qpad"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipSGX4Y+GwA3Du6CSfHXIi3QNWmH4a5e70gAG6GNziKbOn1bDhIFTTtNh57X2RrGgocHvhAS0looR92plCsriLRmofNppXwRjs2Q8kQf9jTbCS5aDUprEtrOb6BU+W7+526LRIA6ffXRbDB/3nWZqI67fxcCRna2Ztf+S36N/wApmHuZOrDCQD92avAbwUWb++m7nluhRLWCLFaLlI6Eh1tlZ6WyrMO4f1hqZP1Ji1Bv5C42jTFabVMRJ6WHLHi3NDrnLSbBOAJwuySKK4i3kwzPdyVtlB4saxITCtqZREiYC65wn8/TWjNLP8QI2oQBjZ+0wN9lsEcvLVdKs6zOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjEfq/zJrkiKZybZvMBHiwYR5bBPFYiwaTI3xC0La68=;
 b=wjgL73cWwHJL9rtJk8nWcSyFvWWFULIuF+7QbWOFwYte4lrRCUDcI985PWfW94i2CUd9JhLm6h0s7JB49O8eI2Ii4lHF2RN8iV3L3kpQEaTjAaNouF5b0gry1JxkXd8ce/R3aAbUQGNqAcyYTFSe/T3E20jcE6iIUF4B8EgYudhPiUwEsyCFUSSrZSD9fC3LUO3VLITSYQFqphDDh+76MUdI6/q1oZGRJ5dnepAzzELfRHWbcg5BZs3Ah68GozBLxLeymMf+QvvTwqYG8BmghgaQqHeyGmAfab/KBh4Q+eBSh1CgmdcPaNqtwGC2mQb6RquOfGrUXDjVHA4S03UCfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjEfq/zJrkiKZybZvMBHiwYR5bBPFYiwaTI3xC0La68=;
 b=Msj3qpadveJM5oz1JlCsDkfpALOd1jf/6Xv3fJgrA36qzjmAd44SnvgP5HJgM8ffaFWxsRL3Kd0+RYvh7TIE8KerYviGXWr/OUVk6X2Kh4XhGDnoOtWGA9P0+pnNBKzNoDjPB8avtutsYSpyhrYWoMuJJbup6HsRCtBM8/zxBo8=
Received: from SJ0PR05CA0150.namprd05.prod.outlook.com (2603:10b6:a03:33d::35)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Wed, 26 Aug
 2026 19:33:16 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:a03:33d:cafe::40) by SJ0PR05CA0150.outlook.office365.com
 (2603:10b6:a03:33d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 19:33:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:33:15 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:33:13 -0500
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
Subject: [PATCH v5 03/16] x86/resctrl: Add PLZA configuration definitions and data structures
Date: Wed, 26 Aug 2026 14:32:17 -0500
Message-ID: <702b88901bc62f07829144a96cc887471b427da8.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: 118b442f-9425-44a5-446b-08df03a8dffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|23010399003|1800799024|13003099007|6133799003|10067099003|11063799006|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	PLlHu6JPQ2LIo3d7nxkxLG1rkeiagoslkzdzOa/T8JSBBZj0F20UOTaz9Smu8Vn6YXGKG9ZHVJa9KnI5T09wD77amRdRckv1f2it6HnnOua3JvyOUiEF3Ed/Gan683shRwLKwCyiwDRj1+WUJL+AsDmT4otTqxpaHBRGU3/m3ufoLllMAFbMOgEmhU2c2zcKC3doooopSpRZ1Qz9/tgVDpfj4QnFeYB4bY9RLjUFfVD/UK+JRRJ1cRrjRAV5f/fMmyb5WsOHaoqCu+X/ChPiHKyXZCgP+aR9rGt9EpLTGFjLQpfOsUETdkecV/lXXZlhs5PzVQ8+ORavFpvA0M2FGZTIxnf6vsdo+9ApwFAiWOsxnePM2/bRZZLRJG5ecUT8shKy0mu6C0MXBDRrpXLFMd97cVhVXPNG8LRdNrNxZHnOl9pANzl5rD4XgM0rommQoLwiwyhiZnACK5EunCRtvDF1coZ5uZ4RHQakAOSrlamXzWeSAn8WYizEMuwUTp6/00BRBMmQqdWqIRiMLa5Ri6OWVPmPHHcn+PiI9yVOqWAU9wsHbFFM/LsAdWnKp+I9F5uBpVczfXxW+eF8dK1z5NYWdNO49IyxK1ujkyPSKLx0gJO7EiOXDsFRlgUPafeIUpfEYqhkuAf/myF+tBBxvg==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(23010399003)(1800799024)(13003099007)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RWxpd/62JAq3dgvWNEnLlM7ZjSHc1ZABjJegIZguhs50z7ORsdyUIVIihUNP6kY2wT5o0cCy4Gwgcr/uZ0xCZAgsSxtHpenAnSxTatdEkubdnk9MdPnKm6/7G0XvkRMDd0vroDN5plD5wUJQegxGp7XWvEylvLzIxeMSsarnlnHggsfTD/X/XyE3+i5hFiirtilRWxiQ8gy6EHzcQf85wNeEp8dpN7uxHnKvTz12vt1nKQMg7Dcq90A50q722i1YfvME3mZREQa8hy0N5X+cYoJpUhoUQFSvpl1G/IyYy/3iSmbATqN5D6+hEW0Yy3Id8rEFL1sjwwYJvzRZ78+0Vp97txu5JqzxuqNJBPH1hV0NXq0CQIAnsvCNNVxzNm7LiZeceliX7a3nkA2pysCMfGgZmSdgbZI/zauObWG8kwnJsC92N4mIvARRDsXm6MF3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:33:15.6080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 118b442f-9425-44a5-446b-08df03a8dffc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343

Privilege Level Zero Association (PLZA) enables the kernel to switch to
different CLOSID and/or RMID than those used in user mode when entering
kernel mode. CLOSID and RMID selection are independent and can be
configured separately.

PLZA associations are programmed on a per-CPU basis through
MSR_IA32_PQR_PLZA_ASSOC (0xc00003fc), which contains the kernel RMID and
CLOSID values along with their corresponding enable bits.

Add the MSR definition and the msr_pqr_plza_assoc union to describe the
register bitfield layout required for PLZA configuration and subsequent
programming support.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Sashiko reported:
    https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=3
    Fix the union truncate issue on 32 bit systems by using u64.
    Updated the changelog and code comments.

v4: Re-wrote the changelog and code comment.

v3: No code changes. Patch order changed. Improved changelog.

v2: No changes. Just rebasing on top of the latest tip branch.
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h | 47 ++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 3a8e51a0c9e8..849e8587631c 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1294,6 +1294,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_PQR_PLZA_ASSOC		0xc00003fc
 #define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
 #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..2f4c60487a5d 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -222,6 +222,53 @@ union l3_qos_abmc_cfg {
 	unsigned long full;
 };
 
+/*
+ * Privilege Level Zero Association (PLZA) is configured via
+ * MSR_IA32_PQR_PLZA_ASSOC. This MSR must be programmed on every CPU in
+ * a QoS domain. Each domain supports a single PLZA CLOSID and/or RMID
+ * association, and all fields except PLZA_EN must be programmed
+ * identically across the domain to ensure consistent behavior.
+ *
+ * RMID and CLOSID selection are controlled independently. When PLZA is
+ * enabled (plza_en = 1), CPL0 uses CLOSID and RMID values from
+ * MSR_IA32_PQR_PLZA_ASSOC depending on the corresponding enable bits.
+ * When PLZA is disabled (plza_en = 0), the CLOSID and RMID are always
+ * taken from MSR_IA32_PQR_ASSOC regardless of privilege level.
+ *
+ *   - rmid_en = 1: use the RMID programmed in this MSR.
+ *   - rmid_en = 0: use the RMID from MSR_IA32_PQR_ASSOC.
+ *   - closid_en = 1: use the CLOSID programmed in this MSR.
+ *   - closid_en = 0: use the CLOSID from MSR_IA32_PQR_ASSOC.
+ *
+ * This allows PLZA to override only RMID, only CLOSID, or both. If both
+ * rmid_en and closid_en are clear, the effective behavior is the same as
+ * when PLZA is disabled, with RMID and CLOSID derived from
+ * MSR_IA32_PQR_ASSOC irrespective of privilege level.
+ *
+ * @rmid		: RMID programmed for PLZA.
+ * @reserved1		: Reserved.
+ * @rmid_en		: Enable RMID for PLZA.
+ * @closid		: CLOSID programmed for PLZA.
+ * @reserved2		: Reserved.
+ * @closid_en		: Enable CLOSID for PLZA.
+ * @reserved3		: Reserved.
+ * @plza_en		: Enable PLZA. When enabled, PLZA applies to the
+ *			  given CPU.
+ */
+union msr_pqr_plza_assoc {
+	struct {
+		u64	rmid		:12,
+			reserved1	:19,
+			rmid_en		: 1,
+			closid		: 4,
+			reserved2	:11,
+			closid_en	: 1,
+			reserved3	:15,
+			plza_en		: 1;
+	} split;
+	u64	full;
+};
+
 void rdt_ctrl_update(void *arg);
 
 int rdt_get_l3_mon_config(struct rdt_resource *r);
-- 
2.43.0

