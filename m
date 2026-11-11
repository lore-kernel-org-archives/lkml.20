Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437086;
	b=puvDcT4V5cgiyNRNxNVcUJvyxujPQoRpoTswpEYvuBRTg0nB/G4GuTqndVe0G00r1Bqq
	 3ss/yQg9Yd8GK57M6+8OR58Lg5n8CmF2NMQEJwZs+IgO9HI9R8CVmyBxIZ/a0vYwkPYBs
	 3yAFIdW7nkwcHktYCDzpy6eAgV7EJ4oRytfAw1H8Gr0Ca98xyLBGcKL+8VZPcvU/YI1fO
	 Op10i9Tm8M/5+RMaY5CFOBrnSL+ip41SLZR93ynru4xufTkRnF6m5f2Cpenx160nN633e
	 EbuC1kmTHwsOTcs/Q57gZOY8zpPTnoFZy7s4jXRga1FvrlZUUpLrUtdmrhSSn7uXyKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437086;
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
	bh=LYGmg32tY76QpwMGOUsRsKkAO6fc/ykxQ5niM0dx6eM=;
	b=FD18oin4e8TOLfKhWzz+C75ka+2TIjsrYyOTqcx6z9tK0/r0/m+oYwba0BlI9dXaTswQ
	 SE3MsT0ASOVo2aPMQIrZf25gSRcYxJzXjIg4QMgUvYVwpHVS8hRIRo+ud8/l88T+E2Zn1
	 TfwTC3GN1PAaLDBPP1Pu9oJH93Xuq8VeI2FyRIPLNDEncvcF5DKkBxaUbgkQRfP8TbQ+Y
	 qSOazQ+g07Yk+r7UoZQmr59xlKmsawwE6f74yfAywYOxtsVQKOKXnSgCXdl8i8TIIjj1M
	 u/UVuS5OJIXCoRdcSG25UJLotBOKcAE1e6GwEXI2GKOTIjpUPCOftPoBJg3tgabvP5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="Y11R7R0/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.12
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012012.outbound.protection.outlook.com [40.93.195.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E690060A261E;
	Wed, 11 Nov 2026 22:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E690060A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Y11R7R0/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ko9rlcn4N2bUAxG5kLME3O4JElxADaGX2vR6Qnk5JKXnli0jlpq98duZnwYpDhKm+3MHYyRYNY4JGzPrA8+maz9j9M2YKR0ZY2MIrzK0I+bQfYwT2EDVgC13Y0Oe6zovq5k294HP+5bAfx65TXDiH/+4eIQwSj/WarrOX8lcKTXzvGr0GyCcOCWRUMhueCaURyJArIaiMCmRk/GUy7lf4tnoPadcduEmL6/T8ycSc9ui8kP50csXNyQXloez/xA0UTkqNDPLPNkRPAXB4nfKw6GdlkW/N8Mgd+sKnm77Kuel89P99NActsSGCCcvJI7wlmc+ZGDfzIOhSzfl3fPYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYGmg32tY76QpwMGOUsRsKkAO6fc/ykxQ5niM0dx6eM=;
 b=PNSvxM35FxxclzCIBGgJbNUZWgUNnjCL+qAo2psdfTxjsAaTNK524Az3alJd3/XyRG3DjLFtDh6vWbgj9AUyoeMHJin7ZVYdKcmUQNTlEBEIvlmu6ZXcCHTx2r3dClxUjkV4lkvC8VnVqEs+VOTzkwHwyREZfjdrkMaC0uq5+99gc2s9Zf+nbIKvt1PIk83IMrHxSse/qapkekCO3UKuOsATQ5s0v63/h9GyMYytUq9fLhD/Mx5Tiwzgf3a8lgZzR7ZYg5a8jOstD0p5jFx0s0tR0AiZQS/hC4YesrxHojPvRyo3lm33WXg+mjloy5qbxvun1e9Ove/7aUdhinzKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYGmg32tY76QpwMGOUsRsKkAO6fc/ykxQ5niM0dx6eM=;
 b=Y11R7R0/nBUW65lh7EnGtDRGWux+PFwQ3ORQwFE+QAdzHEBrHUgaOqpZjkbx2tef0nxPmwtX91+yZ+bZsE/JqltZezs7TZhFXjWcOD6Ckf1QKLyIUe7aiWPCLWVqrteTbiur2g/J49Kxox0Uq/kJOmWd1jHvAMNGi5gHsbyC+qw=
Received: from MW4PR03CA0066.namprd03.prod.outlook.com (2603:10b6:303:b6::11)
 by IA3PR12MB773576.namprd12.prod.outlook.com (2603:10b6:208:61f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 22:44:41 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::1b) by MW4PR03CA0066.outlook.office365.com
 (2603:10b6:303:b6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 22:44:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:44:40 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:44:37 -0600
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
Subject: [PATCH v7 01/19] x86/cpufeatures: Support Privilege Level Zero Association (PLZA)
Date: Wed, 11 Nov 2026 16:43:54 -0600
Message-ID: <92afaeb0484e915f5403d15684050c2f99cbe920.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|IA3PR12MB773576:EE_
X-MS-Office365-Filtering-Correlation-Id: bde8bdc3-b411-4a3a-882a-08df40455f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|1800799024|36860700016|56012099006|11063799006|261026121527099003|261022075727099003|261022105027099003|261026140227099003|10067099003|261102123227099003|261028144727099003|261021121427099003|261102124527099003|261009223027099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	hcGaO0QXxKZUX0jD4fyKkoD9F6tWAf+hEEevfzkQGf34hZfDB1Y0Gv6eHro22HAy+kCeOUl5GD2j7qQAbbi090vFX6IaJg2s1LwNSGIANQ3oalt5WVcd5gRmtHNAbl8IIlGaIIYPGO1GTch2HaaUtbITWPgPILL5pgbueVrrN8BVCU8PD1dCj7INdeuGkJD9PZVS/vsg5BMAFFMT4r7XEWMmV9Ieq9xef8yihTQShkbcK0Rv9wpYD9WuvAz/mE6MpUIibUvQI7o5aFR39e92mLThX+aHpkJewLFp0uL/83tuCNfbn3m2NKHdJo29ux3lC5z17Ldw1M7AlZTAHnFlyyQj1n5bjz2OirsrXVI8yi6REkaphGznQU3LgMr7lEop0GzpJPtm8xb5oeBDiBKXaH6bXZInSBw+ZtPkAEFlIlEoZwv6hKJZiiMYegU2TTYSbTB7U5Fw8potDuU+GIoJV/zlAZZCjh3qn0wRK8QhLU9peBEH0z0bQcIIkHDT5bi7kKeXvKPowoqXDU/s/kaU80nsJJEjUWxLd29huz0K1sQkAKMNAzDYkZzYPH5OKORhc7tlcSqFtkS0vMFUXQDE6YGKimbLhQl51tD0O8pCji19r4IbXEh/UZhLbRXF3J/sJPCMKUFMbkSt4TJ5xlwdnQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(1800799024)(36860700016)(56012099006)(11063799006)(261026121527099003)(261022075727099003)(261022105027099003)(261026140227099003)(10067099003)(261102123227099003)(261028144727099003)(261021121427099003)(261102124527099003)(261009223027099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m00yRew0X5tAuA1viU/XslGrxhCA8kigNKBwgwDRN2inXQ+Uy9D/Fikz3oLiXmeDVgl0xD3io9u85XsTO3dHVXp0P2u+BiILL9qJIKHhwmvd4IH6WT84kmwKC5U+4cDyH/ZXn+hSoDD3Mxr0wuDDYIovwOI3i96wpWbcmU2HNbn2NmRYAJbzxKehaWoFXdro46bLUeBgwl4J/e6odXKlRIkDj9gNm9jHACNdhVdgn0KfsS2ioCNZXeih040bn9OFKMq2MrBzIiw/gyhC9l6AKRrjDYrKZbcfRwUZ7LIrScggNnH/E3NwF93uf10o+cau5NtjBKsxI4SDghJguNoIZLITFke3JDmMMebiNsJI8PK3MbDLeAfCRJR0cPNcI8V9muxhoEpF8wl4rh24bWzT4PWX3R41fG7S4X+d1rPDviwW9fUXijIHj5wVWcA679je
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:44:40.0491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bde8bdc3-b411-4a3a-882a-08df40455f10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB773576

When memory bandwidth associated with a CLOSID is aggressively throttled,
and a task with that CLOSID moves into kernel mode, the kernel operations
are also aggressively throttled. This can stall forward progress and
eventually degrade overall system performance.

AMD hardware supports a feature Privilege Level Zero Association (PLZA),
which allows the CPU's CLOSID and/or RMID association to be changed during
the transition from user mode to kernel mode. This allows the kernel to run
using a different CLOSID and/or RMID than user space, which can improve
system performance and/or allow kernel work to be monitored separately.

Note that PLZA feature associates CLOSID and/or RMID to kernel work, and
therefore influences resource allocation and/or monitoring for all
resources, not only memory bandwidth.

The feature is detected via CPUID_Fn80000020_EBX_x00 [Bit 9]: Privilege
Level Zero Association (PLZA).

The PLZA feature details are documented in [1] available from [2].

[1] AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
    Publication # 69193 Revision: 1.00, Issue Date: March 2026

Signed-off-by: Babu Moger <babu.moger@amd.com>
Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
---
v7: Added Reviewed-by: tag(Reinette).

v6: Highlight that CLOSID/RMID association affects all resources,
    not just memory bandwidth.

v5: Added Acked-by from Boris.
    Updated the changelog to include cache allocation and monitoring.
    Moved the Link tag last.
    Updated subject line for cpufeatures.

v4: Split the patch into 2. This patch only handles x86 changes.
    Re-wrote the changelog along the ABMC changes.

v3: Code did not change. Patch order changed.
    Added documentation link.

v2: Rebased on top of the latest tip.
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/kernel/cpu/scattered.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 303467a498b8..3090fb28ce06 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -536,6 +536,7 @@
 						      * and purposes if CLEAR_CPU_BUF_VM is set).
 						      */
 #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for 4k vCPUs */
+#define X86_FEATURE_PLZA		(21*32+21) /* Privilege Level Zero Association */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index c990245d29d6..be387ba1cbea 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -62,6 +62,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
 	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
 	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
+	{ X86_FEATURE_PLZA,			CPUID_EBX,  9, 0x80000020, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
 	{ X86_FEATURE_TSA_SQ_NO,		CPUID_ECX,  1, 0x80000021, 0 },
 	{ X86_FEATURE_TSA_L1_NO,		CPUID_ECX,  2, 0x80000021, 0 },
-- 
2.43.0

