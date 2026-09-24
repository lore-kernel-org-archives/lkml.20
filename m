Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012035.outbound.protection.outlook.com [40.107.209.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041E44028C3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230995; cv=fail; b=r89RsX4+pJq4dHw7qhyeZHjowpGUeq/2ohZlr6VG4Q6ELOIQealt9QFWO3W4B02VYLgddoRYqRoJmaNYXN276efq6o0aCx+Lqwlr9X3Ov10uKCpQqq5wlId078YRfikSM3WyQn/HgRLPNJskS2PIiHoOV0nL+k0sTsBImT6msQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230995; c=relaxed/simple;
	bh=zQM/IH9k2bMPIpTlChtv59I1yJwQem6lXY5Ldkultp4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=csUoT238G249Q09/O1W3U345WIPVldyMlnOYLdQtWGxCLf+cVo+0JPVCMyL8KyuCwdxgGyhi1jKZs87Do4E6wNYwNjjXXnaW2cZ2zX0QpMgehrbrscunwOBwqK10xevKpfyS3AOKrD/MFE3Uv+j7Q8lWCRTcxPdIKlJVtPXEyyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sHs8SMc8; arc=fail smtp.client-ip=40.107.209.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sHs8SMc8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCpSbR+ObSBcdrmFwTd265gmEJ5tT4AqfZFn0SJdefbTKGHxYPZCgIMOOvxXLYyCJtP8ukhG2NkziuAxRZ0UB3eWlgdo50AiWqM++vH2cp7lkOFczTPrbjpNo+JomK50BXq7P9dvsJfhlW+H31kWqR4mWNKUgiZ74FdMeeEJSCzgaVw1QZZSJy9qDKS9lP8eMkYfyxbpmaWFrkPlsTcTtN9t33ON9GeI5PJoU/bQd1etqg+4uf1iwCAzL2s/Q1Y0AUtyf7zk+/9bYsGxwVU5xk+gEPwH+CYhzdMwfkR9gvKjpC8Ngn8MsP47ekxPuznDl7kKTUnhbkijzZSMmVh+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGMzkooZA65UU8isagAS2XTW+xDROHZokw6tS/fLUfs=;
 b=ECJ+p1iEeALtADZqkVhWlYKzVOGgXYh9oJ224jizekrAveff8NXDhHRjXpNeLCycMIfP+NBne+AxJWD8em4CL7Dqaug0ZVwjM467CAiTBEC4I2mwd7MHx7b+1NRzFGaJTpJ64rjqpuuHlgy16V8x4Vnvwsk8raJl76tFEquyzK9IfgPnMM9nXpMszcRHbpzT2OlYah/Z83WBLAHo8j3cvsGBv93tpRYEYCMxu4riv0BHW1EVVy699Yl/3B3YF7tMEGb4BtbKGygsoUEpUPcA2iwpL3vL0ffeScPJALXGSLufOUzG1fNparoHeZtUJceiy0L/zn9GIwCCoQOOoccSHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGMzkooZA65UU8isagAS2XTW+xDROHZokw6tS/fLUfs=;
 b=sHs8SMc8CmRiMaxDrC66oYF2xMHpF9lYSG07V3hB3Qok8rML33aqQEdwdiMwWIwGGI2oY062iwEdaA+3I0gfeJhDe+p4T8t109/AmY4ld/TaVSOrwwFdOKFy4JPfHkNaFUPAVzPFGhwhinARw9G+w4zTNDXo4pd4/Z2qp7Knjkg=
Received: from SA1PR05CA0003.namprd05.prod.outlook.com (2603:10b6:806:2d2::14)
 by IA1PR12MB9031.namprd12.prod.outlook.com (2603:10b6:208:3f9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:23:06 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:2d2:cafe::76) by SA1PR05CA0003.outlook.office365.com
 (2603:10b6:806:2d2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 06:23:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 06:23:05 +0000
Received: from BLR-L-BHARARAO.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 01:22:56 -0500
From: Bharata B Rao <bharata@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<xin@zytor.com>, <luto@kernel.org>, <peterz@infradead.org>,
	<Jonathan.Cameron@huawei.com>, <gourry@gourry.net>, <rientjes@google.com>,
	<sj@kernel.org>, <weixugc@google.com>, <willy@infradead.org>,
	<ying.huang@linux.alibaba.com>, <ziy@nvidia.com>, <dave@stgolabs.net>,
	<nifan.cxl@gmail.com>, <xuezhengchu@huawei.com>, <yiannis@zptcorp.com>,
	<akpm@linux-foundation.org>, <david@kernel.org>, <byungchul@sk.com>,
	<kinseyho@google.com>, <joshua.hahnjy@gmail.com>, <yuanchu@google.com>,
	<balbirs@nvidia.com>, <shivankg@amd.com>, <donettom@linux.ibm.com>,
	<linyongting@bytedance.com>, Bharata B Rao <bharata@amd.com>
Subject: [RFC PATCH v0 1/3] x86/ibs: Move IBS caps definitions into its own header
Date: Thu, 24 Sep 2026 11:52:04 +0530
Message-ID: <20260924062206.319314-2-bharata@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924062206.319314-1-bharata@amd.com>
References: <20260924062206.319314-1-bharata@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|IA1PR12MB9031:EE_
X-MS-Office365-Filtering-Correlation-Id: ad04f826-b147-41c7-2fcc-08df1a044b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|7416014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8M8owqoKzHZ/tZqtm9hcl/wTUVj7ldML1ToCP69Sf79/UciUAZr/KkoHIhnuFu/Ctu4ZfVUrccXp2kjga59ytftjN47nAwckluUlEbh+pt0lsmuRAomxp6xde1wkf5fOgidIRiIr108qjAeMCulIANEIhQ842xNvbDPoIbtikN4+op7hC6QoKNH7Ai8dRNJpJbdigWl7KojGyvEgBrdhKntAYAcAUpa+2nG/fT/1awGI4ibFqtEsSgUBxbOrt+2MCDOhiYuJRRgnKFO0dREUR1MTleKXveLZLyKBkvzZo7tYRPrxDNHhhO14e5kE2EynK6W+gHpraqmnDMQgMfoxtQTfK9YB4JsI1M4W4IwNml8PuBDeybb3L705F+jAoh85yhMdha34MmL1Kx0Pkskttweo4+6G3JqUzLObKUYJiByl1CbeGEZ87dO9vwiZHzkIwY6pi2G8I0MY9QGsNAYvAF2t09OpVvcCIXGwxGZ4i+oAwtllQK/gHna0SSwHuvCyyOhM7/9iRInKmpckpPBh/XIHQ8f2f1RNrO0GgxHitFCdoCYfJW0lNnfHKMXD2x56lraZ7fTyqBz4Jkpeo4TMaM4mEkrKBQnShV84jz2ogsOK94Zs7fbtLcXQ00vIbHoqtnfGmVykLjmZ8/1tuR03F8K9Fp09eOl/YcxmYJ35De3opflm8S5isqnUc8Bu3gq4Jj0V27A2LGbRD7OXR0zAbw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(7416014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	okc58hyHOvUWOsz0wGRDEUeR0pfD+xz3eLQeirPnq2DDXpjoJDoAwy8y7W4boD0NZn6uVRP8kAdjZbgh5gY9RpmkvXDEtRksx25acRbejp1ZifRuWpaU2dJ3PYTtvSa04gj9wwnU7ikVCiu56gfyZreuoM8L7cEhbxYGv/ZFFuWVdqr/PccmbOWwL9f5MurBXXIeRQfmXyUIj6GRoBSxExtrXnsjVz84MSUmVD+vxmL2g1vvCDZcdq3qhR0REpwdLAsbhobeAdNvBiqePw61/y0PxTW5nf4kh6UOlPguNB5z0AcvKBxAQO3fDh3I7o+A03WzCMCkRwtUZDTtupTRStetrzdnHzXD3SwGfhEVV+xPZvW7SnQkcFiivrf5cmw1+mFZvgXHyWfiSCQ/ygJYmpN6V+ns62FYb2TfrnLinY7kt8oed5FwgDp/XLI/IljN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:23:05.8514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad04f826-b147-41c7-2fcc-08df1a044b87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9031

Subsequent patch adds IBS Memory Profiler driver that is
independent of the perf subsystem but needs the CPUID
0x8000001B capability bits. Hence move those bit definitions
out of asm/perf_event.h into a dedicated header so the new
driver can consume them without pulling in perf.

Signed-off-by: Bharata B Rao <bharata@amd.com>
---
 arch/x86/include/asm/ibs-caps.h   | 85 +++++++++++++++++++++++++++++++
 arch/x86/include/asm/perf_event.h | 81 +----------------------------
 2 files changed, 86 insertions(+), 80 deletions(-)
 create mode 100644 arch/x86/include/asm/ibs-caps.h

diff --git a/arch/x86/include/asm/ibs-caps.h b/arch/x86/include/asm/ibs-caps.h
new file mode 100644
index 000000000000..ddf6c512c8f9
--- /dev/null
+++ b/arch/x86/include/asm/ibs-caps.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_IBS_CAPS_H
+#define _ASM_X86_IBS_CAPS_H
+
+/*
+ * IBS cpuid feature detection
+ */
+
+#define IBS_CPUID_FEATURES		0x8000001b
+
+/*
+ * Same bit mask as for IBS cpuid feature flags (Fn8000_001B_EAX), but
+ * bit 0 is used to indicate the existence of IBS.
+ */
+#define IBS_CAPS_AVAIL			(1U<<0)
+#define IBS_CAPS_FETCHSAM		(1U<<1)
+#define IBS_CAPS_OPSAM			(1U<<2)
+#define IBS_CAPS_RDWROPCNT		(1U<<3)
+#define IBS_CAPS_OPCNT			(1U<<4)
+#define IBS_CAPS_BRNTRGT		(1U<<5)
+#define IBS_CAPS_OPCNTEXT		(1U<<6)
+#define IBS_CAPS_RIPINVALIDCHK		(1U<<7)
+#define IBS_CAPS_OPBRNFUSE		(1U<<8)
+#define IBS_CAPS_FETCHCTLEXTD		(1U<<9)
+#define IBS_CAPS_OPDATA4		(1U<<10)
+#define IBS_CAPS_ZEN4			(1U<<11)
+#define IBS_CAPS_OPLDLAT		(1U<<12)
+#define IBS_CAPS_DIS			(1U<<13)
+#define IBS_CAPS_FETCHLAT		(1U<<14)
+#define IBS_CAPS_BIT63_FILTER		(1U<<15)
+#define IBS_CAPS_STRMST_RMTSOCKET	(1U<<16)
+#define IBS_CAPS_OPDTLBPGSIZE		(1U<<19)
+
+#define IBS_CAPS_DEFAULT		(IBS_CAPS_AVAIL		\
+					 | IBS_CAPS_FETCHSAM	\
+					 | IBS_CAPS_OPSAM)
+
+/*
+ * IBS APIC setup
+ */
+#define IBSCTL				0x1cc
+#define IBSCTL_LVT_OFFSET_VALID		(1ULL<<8)
+#define IBSCTL_LVT_OFFSET_MASK		0x0F
+
+/* IBS fetch bits/masks */
+#define IBS_FETCH_L3MISSONLY		      (1ULL << 59)
+#define IBS_FETCH_RAND_EN		      (1ULL << 57)
+#define IBS_FETCH_VAL			      (1ULL << 49)
+#define IBS_FETCH_ENABLE		      (1ULL << 48)
+#define IBS_FETCH_CNT			     0xFFFF0000ULL
+#define IBS_FETCH_MAX_CNT		     0x0000FFFFULL
+
+#define IBS_FETCH_2_DIS			      (1ULL <<  0)
+#define IBS_FETCH_2_FETCHLAT_FILTER	    (0xFULL <<  1)
+#define IBS_FETCH_2_FETCHLAT_FILTER_SHIFT	       (1)
+#define IBS_FETCH_2_EXCL_RIP_63_EQ_1	      (1ULL <<  5)
+#define IBS_FETCH_2_EXCL_RIP_63_EQ_0	      (1ULL <<  6)
+
+/*
+ * IBS op bits/masks
+ * The lower 7 bits of the current count are random bits
+ * preloaded by hardware and ignored in software
+ */
+#define IBS_OP_LDLAT_EN			      (1ULL << 63)
+#define IBS_OP_LDLAT_THRSH		    (0xFULL << 59)
+#define IBS_OP_LDLAT_THRSH_SHIFT		      (59)
+#define IBS_OP_CUR_CNT			(0xFFF80ULL << 32)
+#define IBS_OP_CUR_CNT_RAND		(0x0007FULL << 32)
+#define IBS_OP_CUR_CNT_EXT_MASK		   (0x7FULL << 52)
+#define IBS_OP_CNT_CTL			      (1ULL << 19)
+#define IBS_OP_VAL			      (1ULL << 18)
+#define IBS_OP_ENABLE			      (1ULL << 17)
+#define IBS_OP_L3MISSONLY		      (1ULL << 16)
+#define IBS_OP_MAX_CNT			     0x0000FFFFULL
+#define IBS_OP_MAX_CNT_EXT		     0x007FFFFFULL	/* not a register bit mask */
+#define IBS_OP_MAX_CNT_EXT_MASK		   (0x7FULL << 20)	/* separate upper 7 bits */
+#define IBS_RIP_INVALID			      (1ULL << 38)
+
+#define IBS_OP_2_DIS			      (1ULL <<  0)
+#define IBS_OP_2_EXCL_RIP_63_EQ_0	      (1ULL <<  1)
+#define IBS_OP_2_EXCL_RIP_63_EQ_1	      (1ULL <<  2)
+#define IBS_OP_2_STRM_ST_FILTER		      (1ULL <<  3)
+#define IBS_OP_2_STRM_ST_FILTER_SHIFT		       (3)
+
+#endif /*  _ASM_X86_IBS_CAPS_H */
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 1eb13673e889..de18e63c5c3e 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -3,6 +3,7 @@
 #define _ASM_X86_PERF_EVENT_H
 
 #include <linux/static_call.h>
+#include <asm/ibs-caps.h>
 
 /*
  * Performance event hw details:
@@ -622,86 +623,6 @@ struct arch_pebs_cntr_header {
  */
 #define EXT_PERFMON_DEBUG_FEATURES		0x80000022
 
-/*
- * IBS cpuid feature detection
- */
-
-#define IBS_CPUID_FEATURES		0x8000001b
-
-/*
- * Same bit mask as for IBS cpuid feature flags (Fn8000_001B_EAX), but
- * bit 0 is used to indicate the existence of IBS.
- */
-#define IBS_CAPS_AVAIL			(1U<<0)
-#define IBS_CAPS_FETCHSAM		(1U<<1)
-#define IBS_CAPS_OPSAM			(1U<<2)
-#define IBS_CAPS_RDWROPCNT		(1U<<3)
-#define IBS_CAPS_OPCNT			(1U<<4)
-#define IBS_CAPS_BRNTRGT		(1U<<5)
-#define IBS_CAPS_OPCNTEXT		(1U<<6)
-#define IBS_CAPS_RIPINVALIDCHK		(1U<<7)
-#define IBS_CAPS_OPBRNFUSE		(1U<<8)
-#define IBS_CAPS_FETCHCTLEXTD		(1U<<9)
-#define IBS_CAPS_OPDATA4		(1U<<10)
-#define IBS_CAPS_ZEN4			(1U<<11)
-#define IBS_CAPS_OPLDLAT		(1U<<12)
-#define IBS_CAPS_DIS			(1U<<13)
-#define IBS_CAPS_FETCHLAT		(1U<<14)
-#define IBS_CAPS_BIT63_FILTER		(1U<<15)
-#define IBS_CAPS_STRMST_RMTSOCKET	(1U<<16)
-#define IBS_CAPS_OPDTLBPGSIZE		(1U<<19)
-
-#define IBS_CAPS_DEFAULT		(IBS_CAPS_AVAIL		\
-					 | IBS_CAPS_FETCHSAM	\
-					 | IBS_CAPS_OPSAM)
-
-/*
- * IBS APIC setup
- */
-#define IBSCTL				0x1cc
-#define IBSCTL_LVT_OFFSET_VALID		(1ULL<<8)
-#define IBSCTL_LVT_OFFSET_MASK		0x0F
-
-/* IBS fetch bits/masks */
-#define IBS_FETCH_L3MISSONLY		      (1ULL << 59)
-#define IBS_FETCH_RAND_EN		      (1ULL << 57)
-#define IBS_FETCH_VAL			      (1ULL << 49)
-#define IBS_FETCH_ENABLE		      (1ULL << 48)
-#define IBS_FETCH_CNT			     0xFFFF0000ULL
-#define IBS_FETCH_MAX_CNT		     0x0000FFFFULL
-
-#define IBS_FETCH_2_DIS			      (1ULL <<  0)
-#define IBS_FETCH_2_FETCHLAT_FILTER	    (0xFULL <<  1)
-#define IBS_FETCH_2_FETCHLAT_FILTER_SHIFT	       (1)
-#define IBS_FETCH_2_EXCL_RIP_63_EQ_1	      (1ULL <<  5)
-#define IBS_FETCH_2_EXCL_RIP_63_EQ_0	      (1ULL <<  6)
-
-/*
- * IBS op bits/masks
- * The lower 7 bits of the current count are random bits
- * preloaded by hardware and ignored in software
- */
-#define IBS_OP_LDLAT_EN			      (1ULL << 63)
-#define IBS_OP_LDLAT_THRSH		    (0xFULL << 59)
-#define IBS_OP_LDLAT_THRSH_SHIFT		      (59)
-#define IBS_OP_CUR_CNT			(0xFFF80ULL << 32)
-#define IBS_OP_CUR_CNT_RAND		(0x0007FULL << 32)
-#define IBS_OP_CUR_CNT_EXT_MASK		   (0x7FULL << 52)
-#define IBS_OP_CNT_CTL			      (1ULL << 19)
-#define IBS_OP_VAL			      (1ULL << 18)
-#define IBS_OP_ENABLE			      (1ULL << 17)
-#define IBS_OP_L3MISSONLY		      (1ULL << 16)
-#define IBS_OP_MAX_CNT			     0x0000FFFFULL
-#define IBS_OP_MAX_CNT_EXT		     0x007FFFFFULL	/* not a register bit mask */
-#define IBS_OP_MAX_CNT_EXT_MASK		   (0x7FULL << 20)	/* separate upper 7 bits */
-#define IBS_RIP_INVALID			      (1ULL << 38)
-
-#define IBS_OP_2_DIS			      (1ULL <<  0)
-#define IBS_OP_2_EXCL_RIP_63_EQ_0	      (1ULL <<  1)
-#define IBS_OP_2_EXCL_RIP_63_EQ_1	      (1ULL <<  2)
-#define IBS_OP_2_STRM_ST_FILTER		      (1ULL <<  3)
-#define IBS_OP_2_STRM_ST_FILTER_SHIFT		       (3)
-
 #ifdef CONFIG_X86_LOCAL_APIC
 extern u32 get_ibs_caps(void);
 extern int forward_event_to_ibs(struct perf_event *event);
-- 
2.34.1

