Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010054.outbound.protection.outlook.com [52.101.193.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0257139E9D5;
	Wed, 26 Aug 2026 19:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772793; cv=fail; b=mG/cMhQf4L0cT4oaflf8B6p7fKIkqjwd/Bc11SJSBe8jUDH+qh2Uu1QIQ+cgAhsPWm8dlhVkylNarMHk7m43vkQFD5blLktwqRtgjpkRveCGPNanRjnkQGmKA7PwJNFm2Gvu8PM84DOk/fhoQFqCYWd9iwMnaxsvK0zkGREb2wE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772793; c=relaxed/simple;
	bh=350VdMmxZ4Qt2oR0lzUon8Dxw6uPrFvGFMegLI1JLJI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FtJlfbZwaXP9b7fZEerMqZ3giFkroOYhNvQpkRmJSh48rwwREZVHLLAlsOwK/HSh395t7wTGYBMmbfP6uM9wfc2k8JNjL15CQkU+QzizAvmS00QZGVKb4USVR23N8AR28FnzPzsfckeUr1eig6//uvJJxPliqMrddem2Qf5O/QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b0qO3wiD; arc=fail smtp.client-ip=52.101.193.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b0qO3wiD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jp7Jx44HWqJ70mb4WDC5KCw2s4KWolJBdMRpos42GTdQdwiEjy09PDzBbxC6eA9ufXC4M0olWxMYv5rNVn6IP1bfkOvR4PJFxjzyqgVKYuN/t0rBTDuPJKXkTK3TW12xdGPEFbSq51lB+ZlxrNrG2mUR0wgWNOkCPdiGu8loL1i/slo0oSECpJfL6V7hQYqD45hfSLUuaQCsGu5ijLrd5rvHOixq4t2fbsQdtVWdO9uhqtE2swAHeCSrgnDltptMu6jm7pVPuBNpVV3E4Y3O1RbXVfJzVUfvUcvLbDj5lb3aIZc++Mk3T1uDlbJnKX3h/6wIDSt9/42CbxgLssbq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjK+7BkUqEAhmKE6mfDL1G1zTO3z4FJSvOQZ6ZV8v3I=;
 b=rwnNojQ+aEzqG6PVs79kJtyn0ubPUnhiIMOsvSN/3sT4oP/HFLcSJvEjWom1AMisqftyEUVmXNo2vsVxXONJI3IfugSsh3UUNavTW3Pdwpc4JlA69kgXjpVGPSeVALdno85cI/ExbeqqIngaKWmPZepDDhhEklxhlqrsrChyvUNRP7VwONae1YqUwnALRYVkE51V9h+CyEWq68OPR6eB29xAXy277K5iGlgZTsTo65I8cmpTrhXp2Wv3ivxJ8vdPYviEhcyoX0COcr9E3LdwYMvpy0Rbi7hCTQFqD6BMdAIofBVTmY8dWrCGCZV3nSDOIF9HijQEPt43zXYWZsr5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjK+7BkUqEAhmKE6mfDL1G1zTO3z4FJSvOQZ6ZV8v3I=;
 b=b0qO3wiD5dggiRecZ8KzS9NG6CyBoOUo5lWcd/Xi10vKn51quIKIQe1JkidWuWSvFKe0UdqsAuXQBoMzB+/0577io+MW1KBFwTDjJNaWpJPG83fyrFNCyjpYbBjRCu0Wy2QUdHOniJcoWqthnet2DYnmTPRr7mmqiNd+DC/0ZKg=
Received: from MW4PR04CA0252.namprd04.prod.outlook.com (2603:10b6:303:88::17)
 by SJ2PR12MB9212.namprd12.prod.outlook.com (2603:10b6:a03:563::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 19:32:55 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:303:88:cafe::7f) by MW4PR04CA0252.outlook.office365.com
 (2603:10b6:303:88::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 19:32:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:32:53 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:32:51 -0500
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
Subject: [PATCH v5 01/16] x86/cpufeatures: Support Privilege Level Zero Association (PLZA)
Date: Wed, 26 Aug 2026 14:32:15 -0500
Message-ID: <1e7f4c3b0cb570f6e501a01d361745b180271f30.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|SJ2PR12MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 393b5792-51ac-4a2c-d384-08df03a8d30d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|7416014|376014|36860700016|13003099007|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	phiyNDcz0vPXlA8SJUZVzWJOnhTgVg8d1UTEhi1HAF7R8Vi2HRBZ9yxhZgjsDoPleu5/Mvv81YGYC093tpeJAg7/eUQoVG4PCQCx2ONnUidze5l1xISqQVwyOxvIVBwqLvehrcLjlkoFtqQmbK/ZFQCog4oLFYop5CVMNl4tnbrMBDML0XvQaM9m+mclc2sqPUz0byVqHxdUSP9sW2H7hQPI1KflUuabchdc1xwm08m9njqCLdxbwzEkR/lF6lvloulAe0Gha3Ity2AMTmLODH8zVmvuW5hxcswsroGrfb+y2wy6+B05BRlorVn5AzfLHA6RNorBama/o3WUf968hAd4F7rhCy/7v2aZRDwvFa5mJEF4PSH5gX/2Q4drVwhQzqQnDGERATfTNutx/XEzLpT7o3QYsdl5PQFiXm/BuKl7Rr2s6YxJj8m4UA4iGntDeiOnbRAN7DB2R06w7yRzbb0ufOh6aALPcJRjF1PVO2z2AiDQopJTzWpvxTBzKJnWBfGvAFe02H/mae5+Jm2crDgl9waiAcxZ45OAHMJgPoVQybuqxeFOoy8ijinmnPtzfIFPhllqPymsaflNBiG2jpgINHbvERbfnrlDO2sim++UG2jjrG+CBYD9e9J7MQo0LhnFI8K/yYZDwf9VTb0w7/kymonuIG1Ez0byCNWZ13rvbBYQc14TGA+WWqPYwTEv3Ph9RmnX3/33VFjlT2557w==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(376014)(36860700016)(13003099007)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CfzMBsiZIlLCkySAFJiYtJ/muUCNkeXgR1cGWUfXe83ElwSZkqgmD0j//qUHH7Y6aI8GJcd+TeH9wtpr7i6mPNIVuX5bMQBQUhz42T19UruBIciz9yv89XF+SGv8iX+Y6PWG2NRUHcuT7o4INyBeir6HvdcyCFbEhE6iDXXVpYzo3qeIzhC1d1LoKQc2atutNApWpRv8AE4cxDeprjGlxAjOkArS63eZ6EzshYSDZIP2N1eiizzYCaVfdPGWMbeJ+boHuPeNSU6+bQIoH725HXcY0irYdF4CUBfPh96aewVkUBUGNLGqAtSinbioeN8CZ3Tbwhcn6Q6AmM69w0VJCs2MTtbaWGUssG0smAmj03T69xNDS8OinZm/jKagb/ZogiR5xgJPZvPx6A4RWZM86OQCwTRs6T+F3idOcgQ6iqCPIHacs1W3CBiYuzHuLEyg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:32:53.8889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 393b5792-51ac-4a2c-d384-08df03a8d30d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9212

When memory bandwidth associated with a CLOSID is aggressively throttled,
and a task with that CLOSID moves into kernel mode, the kernel operations
are also aggressively throttled. This can stall forward progress and
eventually degrade overall system performance.

AMD hardware supports a feature Privilege Level Zero Association (PLZA),
which allows the CPU's CLOSID association to be changed during the
transition from user mode to kernel mode. This allows the kernel to run
using a different CLOSID than user space, which can improve system
performance.

PLZA also applies to cache allocation and monitoring features and provides
flexibility to manage allocation and monitoring associations independently.

The feature is detected via CPUID_Fn80000020_EBX_x00 [Bit 9]: Privilege
Level Zero Association (PLZA).

The PLZA feature details are documented in [1] available from [2].

[1] AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
    Publication # 69193 Revision: 1.00, Issue Date: March 2026

Signed-off-by: Babu Moger <babu.moger@amd.com>
Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
---
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
index 73d5c740202d..cd7baa654d85 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -519,6 +519,7 @@
 						      * and purposes if CLEAR_CPU_BUF_VM is set).
 						      */
 #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for 4k vCPUs */
+#define X86_FEATURE_PLZA		(21*32+21) /* Privilege Level Zero Association */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 8665a6474806..0cb91f24b6cb 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -61,6 +61,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
 	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
 	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
+	{ X86_FEATURE_PLZA,			CPUID_EBX,  9, 0x80000020, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
 	{ X86_FEATURE_TSA_SQ_NO,		CPUID_ECX,  1, 0x80000021, 0 },
 	{ X86_FEATURE_TSA_L1_NO,		CPUID_ECX,  2, 0x80000021, 0 },
-- 
2.43.0

