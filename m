Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300AF330D25
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231751; cv=fail; b=M0XR65uy/xeFNZ7d1TCozxY5QWjKWhFivTc0JBwVFMERK/BV9I0ST2ogL+lTpnULTKMuOMQPi86DKY08O3Iw5Ku53VWZJWPD5v4H0g4JmXlFS5h+L4g8X13NYYnlcevXtl9VpTVKMO/f01ZsOpDFv6CgHuiaAWDTSS6P+Jzr6l4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231751; c=relaxed/simple;
	bh=8qf3PU1srUQXWp8lK62wKfExmh5YbtADesFJiD8z0bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oG7a6D40OmRU6oKlYg2celWmPELuwSYgfJG0dRltzit3ARLX37K41sMxzYvjfTbQfWLWDl315E/G4saTgHOEhknlMjZqxxNHRRBfwc6MLOVItrL/lSUMLSvZLktZX+evjFiRs5jzJMfHoQ1/dIRAQzeeC951msPdL2hmGs8Oxqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XmKxNnJT; arc=fail smtp.client-ip=52.101.56.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XmKxNnJT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxgEEXwluboscZpJW/XtqBOEG57jndhPYrkARNV2TPTQTJgchqiESqFsqz0LRA0d2l218G/PcvyBKeUP8zOn1HCLtwaZRDx6GBLieEpNCO+LZgLc/VvwqJaFZEiZIGLiBOTPc2o8P4GETwvKogQ1bX7XplFMDdoYVsjbsDTmaf9KG+R3ik1zUe8ovTah8qBcwn64DvL8T7MeVZKJ2kqmtyYMDA6/V3tlh6DnIHab9wZo/w1IIP6y4rB8L6vzfygNmLuccfn42rfz3mhW9SoSt38bJMfluM3XQRibBIPUlVhJ/W3MLma9qfcf4ZkbjRDli+o04HylsIRlVnMgF8thgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxT5Vr8KXbRrXgqtigc2fQQrMC2wVCM8t8tUu6gVGBo=;
 b=HLjX+6paKRkRarBBN1UamzKR/CEmv6QRcfNxX32sN5QoE8pupDa4Zn9/OfK4/kpPhvoD0K6UxPr0vRTnAI2leUieNOzXBhy64G2L/ltuj7wF9hD280DNcU88CvqdhzbuA2H+QT3QOc7CtgG4WspsPXIK8CES+UQyIH3IP5Q2yQpksh186IJJcbPj/T0/zqaVPbPZnfi9H5f/IwkXlxJdg4yh++1EmMZ0pWAFP+S44NAi/pY0YWffb8KjqMdH1owG51ppSonFfJo26JQvY//zpkTOUK2zbiYbQ90vDIFpqebrtyz0Q9+IzlhH1QHjxDpeaf3yMhIaJtwla5LrdRCuxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxT5Vr8KXbRrXgqtigc2fQQrMC2wVCM8t8tUu6gVGBo=;
 b=XmKxNnJT+1kocK/pbTebGPYYr3ueBxNkkgDodo1IbOOyaonXWuEDQYHVr6SLT3vFTIWVpqYxn3EoTc8BIfDzX3QaD6rJKRtxEPfU/0hIrwjDVd/EnSggM3SGQMdceeSqOwWKTEtKFFZqkuDrlz5R5MbJl7gBZhlzjydNSU/fhf8=
Received: from CH0PR03CA0030.namprd03.prod.outlook.com (2603:10b6:610:b0::35)
 by SA1PR12MB999251.namprd12.prod.outlook.com (2603:10b6:806:4dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:35:45 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::94) by CH0PR03CA0030.outlook.office365.com
 (2603:10b6:610:b0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Thu,
 24 Sep 2026 06:35:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 06:35:45 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 01:35:45 -0500
Received: from [192.168.0.152] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 01:35:36 -0500
Message-ID: <c590eef7-a7e1-4c8e-aca5-03eb81ae7697@amd.com>
Date: Thu, 24 Sep 2026 12:05:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 0/3] pghot: x86: IBS Memory Profiler for hot page
 promotion
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
	<linyongting@bytedance.com>
References: <20260924062206.319314-1-bharata@amd.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <20260924062206.319314-1-bharata@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|SA1PR12MB999251:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2e73c8-accf-4f6e-32da-08df1a061067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|7416014|10067099003|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JcBvHd1dcAHMXwffGUkFfdKQiBR1AnnyThFEKVGdoWGerwIUmyIcsa9S16gsi0IiVxBADMQO0egMX4Vsq98QPBEnFB5q9qD8TZsgEXXb2ma0ohLi7yTcq4o65pSoVuTUvIj/Hj4WxI6E2MUWKOknFVyOJT4EbLLyvw0k9/tHtUxlVAyHJEnmCibz3jPwiV3HMv0QmvlGda/hrWKRR6KeZHxYFQVsA+wQ9ysHlrBJ/Gi+5truk/QoEY2WnIiXJoxr2lQG3KqqlYfwWXH00J3MaUcOSv4qXA9UgaTGMHtbsqgVpI9UZcOr4NqIWqlxegsdMfZ/LeKy0MeIj3TVmibsGXiasgDF8+hFfuF6WGKz20lxrneeHA1i+H3q1fJZCZvmfxeDbWwIc5f1CIePuZZCNz9UwZAyATmdjssNbuolx+i3guHdhyqNbEIYl8p4J5KwDcJdd/pLmNyarcLMouYOUSubFxyVfPafYdwOPhCfCXaQKsrRRZ2YoRQDsllLJ3ilgjh7SF1PIVPaXp9o3764tNI/0bwbiDFinmxMaTaJV/+yVvMVa44i6K1N1DAchltWOIUaSfs0yki+oAA0JHaMBaM7S8Y9V4PsBaVmXgyBrp6zuecTzwEl1pt2ac0NpV/kHR3GgcbXzVt6udou4ZqYGGtJV9wA3A48RFQABPgjtv/phZJbfH/9pEoYdpfwJKNmFB67peFFLw7rJubbGwG6Lg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(7416014)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g3DBeC9KdR90Zu9OoW5shcAu2c1oCLGIpok+jrfmJXrdgl7qrfOnA6y4gK4ALc6ZwVTklxiR4JtuU6hBcojGhw5ZS7qlGajmsTvTsCA+S4mEaRqutTn3Uou3teRiamIrYcsfKZrmm+X/Jp8sgNHPtTQrc9UH/CvUq8Hj676fvjJgtBo5vS+FolRybnL8Zl2vIFypDqz8iTRBvn531mp7w6AQqFLk11zg/biC14eqfdaZFxXCtOYyhkq90cR5yd59N5gBIGkG6xF9LKck56rQI0CQWe4yBF09nX/MEJQcqr8MgY+MWpy78wu4kiJ4prYi1oCuCEzrDOt368WmgPtz8H3++u4YC5XoWc3926cNAkPdbRD1UfFUNJlVk6q3L5mIAIQOerA1C6DUikuXffZfebSKnlyQN7uFtU0i8plbLy0g86itXkUQxw3Myrc0JrOh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:35:45.6679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2e73c8-accf-4f6e-32da-08df1a061067
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999251

On 24-Sep-26 11:52 AM, Bharata B Rao wrote:
> 
> Detailed per-benchmark tables (throughput/latency + vmstat and pghot
> promotion counters) are posted as replies to this thread.
llama.cpp tiering benchmark: base vs pghot-hwhints (kernel 7.3.0-rc2)
====================================================================
3-run average per configuration.

Workload: llama-bench (llama.cpp), Mixtral-8x22B-Instruct Q4_K_M (140.6B
params, 79.7 GB), -t 64 -p 512 -n 128 -r 5 --mmap 0.  pp512 = prefill
(compute-bound); tg128 = decode (memory-bandwidth-bound).

Setup: 3-node box, N0/N1 DRAM (256 GB each), N2 CXL (distances 10/12/50).
Bench pinned to N1 CPUs with MPOL_PREFERRED_MANY({1}); a 200 GB hot hog on
N1 forces kswapd to naturally demote ~1/3 of the model to CXL; each mode is
then measured while the hog keeps N1 under pressure.  pghot target_nid=1,
freq_threshold=1, promote_window=3000ms, rate_limit=65536 MBps, kmigrated
100ms/512.  hwhints arms AMD IBS (l3miss-only=1, period=10000).

Legend (columns)
----------------
  r1 = base / notier        7.3.0-rc2-base   nb=0 src=-
  r2 = base / tier (NUMAB2) 7.3.0-rc2-base   nb=2 src=-
  r3 = pghot / hwhints(IBS) 7.3.0-rc2-pghot  nb=0 src=0x2
  (nb = kernel.numa_balancing; src = pghot_enabled_sources; 3 runs each)

Table 1 - Throughput, 3-run mean +/- stdev (llama-bench tokens/s)
----------------------------------------------------------------
metric                       r1       r2       r3
-------------------------------------------------
pp512 mean                69.43    61.34    57.90
  stdev                    0.85     1.78     2.21
tg128 mean                4.094    4.883    4.975
  stdev                   0.045    0.053    0.023
tg128 vs r1               1.00x    1.19x    1.22x
pp512 vs r1               1.00x    0.88x    0.83x

Table 1b - per-run values (3 runs), shows consistency
-----------------------------------------------------
                             r1       r2       r3
-------------------------------------------------
tg128 run1                4.099    4.856    4.949
tg128 run2                4.037    4.836    5.005
tg128 run3                4.146    4.957    4.970
pp512 run1                70.37    63.37    61.01
pp512 run2                68.31    59.03    56.61
pp512 run3                69.60    61.64    56.07

Table 2 - Key vmstat counters, 3-run mean of run-phase deltas (millions)
-----------------------------------------------------------------------
metric                            r1       r2       r3
------------------------------------------------------
pgpromote_success               0.00     3.07     1.74
pgpromote_candidate             0.00    12.80    12.86
pgdemote_kswapd                 2.58     4.78     4.40
pgmigrate_success               2.58     7.85     6.13
numa_pte_updates                0.00    26.06     0.00
numa_hint_faults                0.00    25.12     0.00
pghot_recorded_accesses         0.00     0.00    12.86
pghot_reported_hwhints          0.00     0.00    30.79
hwhint_total_events             0.00     0.00    30.79
hwhint_dram_accesses            0.00     0.00    17.74
hwhint_extmem_accesses          0.00     0.00    12.86
start N2 % (at SIGCONT)         28.3     28.9     27.6

Key observations (3-run averages)
---------------------------------
1. base/tier (r2) tg128 4.883 is +19.3% over base/notier (r1)
   4.094; pghot/hwhints (r3) 4.975 is +21.5% over r1 and
   +1.9% over r2.
2. Consistency is tight: r3 tg128 4.949-5.005 (stdev 0.023);
   r2 4.836-4.957 (stdev 0.053).
3. hwhints armed IBS: ~35M events, ~13M on CXL; pgpromote_candidate
   12.9M matches pghot_recorded_accesses 12.9M (1.00x).
4. Prefill (pp512) pays a tiering tax: r2 0.88x, r3 0.83x of r1.

Caveats: base and pghot are different kernels (7.3.0-rc2-base vs -pghot);
the natural-overflow setup settled at ~30% CXL at SIGCONT in all runs;
3 runs per configuration (per-run values in Table 1b).
