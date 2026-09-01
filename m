Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021139.outbound.protection.outlook.com [52.101.95.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1DC3644C1;
	Tue,  1 Sep 2026 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275509; cv=fail; b=h52o3cCZg3knLIbSvr6iVYxaLE8So7DfWUS8pDx5IPGNwxM9dnUolZjlKzSGTMSmO/aYknOT/BOUmIFXSfc4McXt+decGLFpSBYVsmrHdk+xH9iWiU4+HgjAv+LaBOHtChpDiWmdg3StBWdp1ObQdqNIHQQWoyvCk5hQSOOYY2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275509; c=relaxed/simple;
	bh=Bk3EbNM4o94xzTmX1OvZgvjLAoPNNrx8KAHHCbCfTds=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hycevp+dqucvYz7W/19XAdfkas9mSXeTRrd5/Yol9qQED0uz7y8fs3jG+Kpt5NTMXSzOJxjpjcK4imVkb7pQTSXd0PHb6oVwZou+rW3hwRrYaLxvutCYBouEqjw+w9LZgfMP9XwAAsmRHoZVCsTdM9MFA3szQbIZbYJk/k8Bh0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VybC+446zFJ81vzwmB6CXMWoFKbCDa3pBea9+IyRtpkgTkOAIT0Vk0ShCesLt2jJSFi5/mrTrKjwJ+ogqXHnibjRGQJsvPkCxRlBFCOPEVZDneHx45Cn9FVsqnP4Hp2jP1/78Vo3d3N33iiCCsyzhDgSwWg0qOMhcLTein6KwBJaUhr0e2sD641gcgysvWxItPhRxJIZsH0mjTq5tNNZMV8QBtXEn+N0qXBjLoylmY95IukBKXq0G37cDOsgTSgn4OOvvqYCPSGofuVqUJMOZ3BsHHp44HeN5T4LH0yyRHqBGk1uaYKVcM3NW4F6IRTA2GEM28mqcPU+eeo0CAGGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=if7L4foEHZkyV4qp3UkCNvr1IZ0gNXqXAwRMdSNRRTU=;
 b=lUMW18JGthKknjcqmx/FhgcXREvUVOJMkFfgGRjyew65l7wJcg+9uJyCrtKLJTf8pZTbLGeFV1tZbnevh9FMP/lRO+JmmFw6wygpsSWvQeELblgT/UVDx6po1YfDIolPsauzpNW7mrmMEM5wO6TfwuPHJPbEHGcmouLXi4ad2XVgqu4iqcXtOT8Frct0PNXGTfqRgjR5DLRW4E4EHXeu5frNLN343FMiDAhN4NOvkffPOy/Akf17hwSeSE3hTAOFC9zX0YxoBn3Wq84vZ52Zk3NvTnaBRm1bQnRb1qO5xB4tm0zco5Hvdkl9o+CWIB8O9+/uQJr0pL77Od4ZY8rdBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOVP123MB8559.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:487::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 15:11:43 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 15:11:42 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	frederic@kernel.org,
	marco.crivellari@suse.com,
	sean@ashe.io,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] x86/mce: Avoid arming periodic polling timer on isolated CPUs
Date: Tue,  1 Sep 2026 11:11:38 -0400
Message-ID: <20260901151138.132950-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::33) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOVP123MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9d25c8-8b22-4236-7367-08df083b5488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|6133799003|10067099003|5023799004|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	oCSZmF8pjWGGEggmghkEnidNlBy8AELy28C0dSQIQp4ONz24rF42S5vEWGurFEtHwnpMGaHsrBH+JWiIR4uNmDLjsScwZhzJaa7NU1XA9pk9k0MESx1tx3Ru0j8FGp2QYwoc8qY8Lj+QBMLI8DTCfUi9OqT5fiGD//sxrusDnJMTs2g+2RGjscNSU1jeEpW81T8TVGEbJ1rQ2Ir3kiJrxhCoe6VTkYNl/E8AZyKZBDdbs7bMlYMyjsEASc12NOjfO2Ngc5HgiE2zli42b0qd5zksRbw1pEi44uO7VuJCEBnMTac8QJuqK193BplrNvjqagq3hUeRht1w6T7TwaH+iqD+jiWzOStVT1vncqQcGTs1K+wIIDJ0dlDUcef8NFrBp7nWCMNY0BefMEri1//7bQYDZ033PPRyplZPIxNXyK+6VM55xMk3t4SxpITpwc3twBNg5MfXlSUfxcvuDINPXf+KCkQILC7L7x95IHBtTleY7JaZH3ox5gyVmQEmfRp2vklV2BLMosNXAx/90qNqbtLnGtfIsGE00lqwMkfJDdTSVDwG3CPRArQFTqPi6tqqx+kKcvpfEZh8TQuZzpvejqnvtDxIgzL6zYE8aBOqaaRUsYTp4PrtbUTVLCfYC/TOnkMX1eB+o2zj1SGqWttXnU9bEX8EAGYwOQtYLsbhEno=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(6133799003)(10067099003)(5023799004)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6A/YkvxulRWpBbLCaZXsNoq8QxUv1/Ahelg0xoiCAgzrnqUivMYvQjZF02WY?=
 =?us-ascii?Q?6RlPtOOBu1EXU8b7vPUWLDTgisGs+9kRjcOa2WaZNzKoj6BYbfdKl6fpKzg+?=
 =?us-ascii?Q?WL/cf+xFxJkH/lh6U/gYjYu7KNyRaQRfhA5Z771UTD/BweNm6I2On+sbtj7w?=
 =?us-ascii?Q?5kXN1QTPN/Llye4/ByEBVJ/cVhXpQWV5/9bFrrWLU9hMyRb0p0xMwypROqgJ?=
 =?us-ascii?Q?44gaZAyFwB+VpJ63d0Vh3BZSRMP64TpRIH0/4zjaxldCDmTdpdnIcifdB+br?=
 =?us-ascii?Q?w1F/fZce4gn5HVAtw9+VaLfFqSHGgofJTM9j/Ke+k2Lmjtls8+viLtby4XDQ?=
 =?us-ascii?Q?qAEO7X6Nv3aUsKpiI8f773kNn89/4cssMjOSQYXu18LNlkQoPpQesPbs+HMU?=
 =?us-ascii?Q?mpEnIjrZ+V10nOyx6m2Llnpb5Dx1BXmN4ZiD8EDNH801PJM1siuZggu5zXbp?=
 =?us-ascii?Q?7TPHYY8STu6JexPrRfOjY1T1KZQ0in52fXQ6LmAiEjquf4agz1rq2xqinWsf?=
 =?us-ascii?Q?syucDRRbD0Mhy5KT+VZC0vFNaMJYKKcD4MIaCDe0T7T1qGfx8J3UCO/OxLX3?=
 =?us-ascii?Q?wpyrkzNoz23lD6rq2Nnm3YSsZquPivdD/9CD9d3mgoS226rlJIcGUqrc4NY2?=
 =?us-ascii?Q?c1+IC2ftrHlKJ9SlMWC0oqR8XRl2vbCPJS0WedQJxoFwQSf90As2BEFXlBLV?=
 =?us-ascii?Q?1BSboQN97oElMC2FWpzRMZT5V7NOG+u7MrnMcvt4Ll2FFoaNK1T5g1iy7e7C?=
 =?us-ascii?Q?yuu++5couUmNG+9n170HzJ/6+/hKFhBQNc/6yY9RfBZSlwHI1taPb5y6PuIC?=
 =?us-ascii?Q?8Iatw3urAYmi5vvHye/hFw2tqjWP9ENDKCNgVHVCApO/aSe9ZhjFcEzCsj4w?=
 =?us-ascii?Q?GK6Wo3+6Z8gRt+8USNJRHllaSwp9bKWoj50wi/lVV5sWWylWlHv18b8+twlD?=
 =?us-ascii?Q?E3Qv4B9GXUEia4P9lBwaMonYblNZ+oe5+IviRG4YaLFKhIFVn3iq66BWcmpF?=
 =?us-ascii?Q?+GKwwRFBMx5AsSkUs7WtOgMgsoIoVUKKPadiUKwc+dzy55Qh/1xrAJL6ci4m?=
 =?us-ascii?Q?sDQHk8y5YVkrqmU54xF7wyq6Qg19A1go1OOkWBm+ZaEIBEfxR6ypGAktsXB5?=
 =?us-ascii?Q?rHxQdqlUkE9Cq1fVaVKrC2z4DdtRMPQGhIK+UfR/xeOGMiVF+qweyG+/SKUC?=
 =?us-ascii?Q?rMPZIpHrkkB3seVl3xFCwTqdLqLXh84xjRP12/3vTvWbFN3dU7rXBzOHiz/m?=
 =?us-ascii?Q?b4Ax82FiWWDe1F+VoaYX7BBOyKHezOea7nzFd6F9aqiVh8L4s4g05yQB9uhw?=
 =?us-ascii?Q?dV1or/idWtPTVFg0JnadShT2a0fJPuMSrfVBPYHKgsGjhr7pKcs/WmNSLFmv?=
 =?us-ascii?Q?Fdw1q4/HvG5NohvycMpKmdKFtLkRcqXBtCYjQhRh3iUgwD0sVdXwz7xAzZXl?=
 =?us-ascii?Q?tinZM4sLZ3ZEDFc0nTt1ufs/Y3qU0aYTZSDAcPXg//m1MLl93vf5uYuofT+h?=
 =?us-ascii?Q?grWiIiFduSkSQ1DzBBwXy1APyDki7/ekdVCjbnp1AzR9nDAR3OLiOQJUPiNC?=
 =?us-ascii?Q?LAIN1rwK8JaG2az5BYGwtNhl79OelEQiVubKnDDMhNK9sA5LcI5ymVA4cLRB?=
 =?us-ascii?Q?sWGFMkT+hlwvPsCFSrK/SB9ccVkWkdutjQ9OmaIIgFCg4nuufpyuAxYYu9Se?=
 =?us-ascii?Q?d8Y7B8CC2dWdKaWVx3WFUYcrR85sHxdMg/+ULfAJdws2U/0EsAkh8A9W8wSV?=
 =?us-ascii?Q?1Nocf8Qryw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9d25c8-8b22-4236-7367-08df083b5488
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 15:11:42.5620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qbw2Gm8OHm3sLFoOWL9JJvZRCbfBFWbGvUeAgNsyOkKsTbakEE3msWwZb5UEgW8ch/CnMlDfEbDiAAxk0raXEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP123MB8559

Latency-sensitive workloads rely on CPU isolation (i.e., configured via
nohz_full= or isolcpus=nohz) to guarantee deterministic execution
without interruption from background kernel activity.

On x86 platforms, the Machine Check Architecture (MCA) subsystem arms a
per-CPU, pinned standard timer (mce_timer) to periodically poll hardware
banks for "silent" corrected machine check errors. Because mce_timer is
pinned to the local CPU via TIMER_PINNED, the timer core cannot migrate
its expiration to a housekeeping CPU. Consequently, every check_interval
(defaulting to five minutes, or as frequently as every 10 ms during
error decay), a timer tick interrupts the isolated CPU to execute
mce_timer_fn() and machine_check_poll(), introducing unavoidable latency
jitter.

Presently, the only mechanisms available to suppress this timer (i.e.,
the mce=ignore_ce boot parameter or setting check_interval=0 via sysfs)
are system-wide globals. Setting these attributes disables polling
across the entire platform, needlessly blinding non-isolated
housekeeping CPUs from monitoring shared memory controllers and uncore
error telemetry.

Amend should_enable_timer() to query housekeeping_cpu() for
HK_TYPE_TIMER (HK_TYPE_KERNEL_NOISE). When a CPU is designated as
isolated, the timer is neither armed at CPU online nor re-armed upon
timer expiration. Housekeeping CPUs continue to run their polling timers
unaltered, preserving routine monitoring of shared package and memory
controller banks.

On isolated CPUs, critical synchronous exceptions (#MC) remain fully
functional for fatal and recoverable uncorrected errors, and CMCI
interrupts continue to deliver asynchronous notifications where
supported. When CPU isolation is not configured, static branch
optimisations ensure zero runtime overhead.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 arch/x86/kernel/cpu/mce/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index ab469605fc89..fd047968ad17 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -25,6 +25,7 @@
 #include <linux/delay.h>
 #include <linux/ctype.h>
 #include <linux/sched.h>
+#include <linux/sched/isolation.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/slab.h>
@@ -1759,6 +1760,9 @@ void (*mc_poll_banks)(void) = mc_poll_banks_default;
 
 static bool should_enable_timer(unsigned long iv)
 {
+	if (!housekeeping_cpu(smp_processor_id(), HK_TYPE_TIMER))
+		return false;
+
 	return !mca_cfg.ignore_ce && iv;
 }
 
-- 
2.55.0

