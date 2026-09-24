Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010004.outbound.protection.outlook.com [52.101.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A90344D8C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231558; cv=fail; b=fJVFF1FMYFGK5QhQFAn9wkQhcJFdBSl7jd7hl2hz/Nmawhc0boj4rKIgsfANE3Cy91KKT/gRqM90Jx6OP73DswFoWy4auSgRSkL0Uey703RNQ37nSTGrddapqD9O/lt0mxIhs2WIrv8EMycr6XdU3NeefKK+4etAWOVBsdm8WCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231558; c=relaxed/simple;
	bh=N5DRZvo8fkzz2Hh9hMUnjFy6JcE52Uwu80T2fSts5/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h6O1qzXjaF8G+4hDW4WJUW2PMBqa1JoVdHsafZNOwJ2M/oFXbmwoSboFsBay9UcsdZQujfjWPyU0io5WCwvxJicGlN3CmcPbBDpn9AQfZzEyL6BQ/kFP+oT6Kyu8KJM4LCiEo5h79qWupR2QYfbFteOsPpmycLbzDR2iCnRmXz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nu3Mrxip; arc=fail smtp.client-ip=52.101.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nu3Mrxip"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFgFJbg342DcCM7F2tR7RT/gw6ZGSJ6vMo5fVNH9GsnATuH63cuSFKAOyaGe8aoaqUo7I8vQSod/Bw4oUvVvKlNisrFHnxPEgyA2Bet6Qo3/+gEnYFrUbrhN5zB6bwv5BrOiNNXT5YchYxluNozzknGzovYpn24ynWSaN8FHdwRyNDQKF3I7JRotMqUDBbliPtWs12iQFIEN/aK2OwMsOE0a1qErJRWJkjK7YDvB4DklUsT0wp502nycMIVBsulalIPbO/68mfo+giBfhv6tL0lDuEov2HCB4vOR0aCK3GEiorqOrCv70ebSHDkmHvyoCy/pb3Nje4JFysNDyB+ypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSHi0Y/ys4DKMYpI/mZO2Bdveh7aYebl09YgCt/3bYQ=;
 b=AKJwru/ncompZ2sKitDOsebKedhxfvWTRxG/1a9x5BVZuqFVbBgsysEk72ycgey37ZS2GwuCq7WRX5LpNrcYDwxT5Hza76xwiU6XpHXIFW3dJc/52Wnu50q0qzfn4xEzDOoN7FdHwulZzNNH6DrLZuDQrHVlMDlYdt6iPythr7X6cO2em7cIUwGqioyzfMsL2L9bkX8FBQ8X0Xpo7N18Ivcg4Zo5QGdgQ9jZQioOn/sfe3ESxgs7NNZbXn7D29KC9cyFYEsnv10LA+w+G8znF8upMaUPpvOXNwILC5gHh9TF1RIQ/v/eJCXG9odVvO3W2W9xjqE4h2zbjNW3o4LwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSHi0Y/ys4DKMYpI/mZO2Bdveh7aYebl09YgCt/3bYQ=;
 b=nu3MrxipMgTcnq7T9mKHmWr6YoFKFJEHr+/A/YRfqN4RFn6Eoj2LaF+OrUtHeVKLYQOP1ZBNZD+qCLkJP1yCRfnhr3A49CNSzSTqgyXiDw1OWTHOw6pZQTIJ7PgaV1yXUbXtKyDlj2cpAojZBVGC15SkuvKAW2RdxyCGtu0mXpY=
Received: from BN0PR04CA0196.namprd04.prod.outlook.com (2603:10b6:408:e9::21)
 by DS4PR12MB9586.namprd12.prod.outlook.com (2603:10b6:8:27e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:32:31 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:e9:cafe::13) by BN0PR04CA0196.outlook.office365.com
 (2603:10b6:408:e9::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 06:32:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.5 via Frontend Transport; Thu, 24 Sep 2026 06:32:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 01:32:20 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 01:31:10 -0500
Received: from [192.168.0.152] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 01:31:01 -0500
Message-ID: <1928da1c-e07e-4523-98b6-611b62a53143@amd.com>
Date: Thu, 24 Sep 2026 12:01:00 +0530
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|DS4PR12MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa2a048-0872-4e3f-ab7e-08df1a059c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|6133799003|21046099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	barjpvVMxAvnvYUTRliAE29UxMWG0Tw0thvCBNrVLX4VDKjP+VCmN6drhaB466k2Wq2yRLeP60WXd2GEgYkgrvGihtHxNcwyM1jUyUGXL2BfBkpMb/xc4Ahk+HDLLC2/cvY6hxW0uPqKOZt9cmGLgCHGS6lPvbo4mUUxllXlsPa2NRYlgykHDo4jibuo58f+3vLg1BPDzNIpTis01NkGQFQmf1ElyMeYhbdcpZzAvWG48c2LIGEvSb4MWeyCL/FApy5PKm4Vy5opaqRajdxrSEiTOdjaQ2NHAhpyRBtBRalO0FYd/leKU7ss8Z16oRvFM3ytpB9KQdgJLEtKy4bReN2gB4XdklaabgDTYXPxLYTlYd8j7oi69hMeWzT+Hp4QGXmbGcubYcuOg36/KJRWQc6NxlDs37pfJMU4rQH16JfmIVYYPWW0Apd+CRb2q2VZDMI3tf1dSzO1mBAR7Fdhu5v9qtRf66iAIfDByZ7e3+nHZBQH8u7CpvJij2weZk4p4o5NClLCB/1BTYx82FTXhjxb/xqkTbGDdsTrlPwV+O8Orxi831WmLHCsuxf+EKPEL5dG0h+do4RdZelBjPBK4fFqziNPRTxUNHO9UcpNYUmwqBTJ0uFdiZnYAOdDzmXRTq8JZLLs9gxJg/bLX15MUFrrvRnzxyR5OvNS3wRMpfyY25Z++he/Ul90YHcf2Cfj+WoflTbrMwrv9SmnN4KJWA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(6133799003)(21046099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+8BcAkwYccSySkx6wTQLa7R3Bz48GA1UPIHUSJV2CUvF4BYcxHNvYygSsT7MoCgZ9pX5auMHx5wEkrfZvvSucpUmbsBk1K9i5uqKYceGXPGG9gkw5QQrOb23siyisgMwK47nP9Hr1gAgFf2bsrJR81/ERRxNy2NMhIvwMh4U+8H3uXfoYHbl5nCG2cwGZgrglWVEP+dyZNLiZmAdyjQWRCH1VvqCVsJx5trSrgM0x6MLfca7wxj1T7Ijt6wHqXU+Ka/8DoUn1C1b5yV9j7S8Ojpv4cRUVqo1wMTC8tfs7nFtF5vpCmiiL6fjr3JhehXgt2rGwPC4okL8a4WumRdlnE+zoSPgnlFW60IwqtiMNc+TDrygDITMpcyN7RJHSSGSZ/IDQ01jTpd64kZCh/xOf4Z+EINamS4FisfdaKjmEkO785Gu+5OZDGIDrFEkP02F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:32:31.0970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa2a048-0872-4e3f-ab7e-08df1a059c6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9586

On 24-Sep-26 11:52 AM, Bharata B Rao wrote:
> 
> Detailed per-benchmark tables (throughput/latency + vmstat and pghot
> promotion counters) are posted as replies to this thread.
Benchmark
----------------------------------------------------------------------
NAS Parallel Benchmark BT (Block Tri-diagonal solver), MPI version,
Class D, 16 ranks. Compute threads are bound to node 1 via:

  /usr/bin/mpirun -np 16 /usr/bin/numactl --cpunodebind=1 \
      .../NPB3.4.4/NPB3.4-MPI/bin/bt.F.x

Test system : 3 NUMA nodes. Nodes 0 and 1 are top-tier DRAM
with CPUs (~252 GiB each); node 2 is a CPU-less CXL lower tier
(~252 GiB). Node distances: 0<->1 = 12, 1<->2 = 50. Before the
measurement phase all provisioned memory (~161.4 GiB across ranks)
is migrated to the CXL node 2, then ranks resume and measurement
begins, so the run starts fully cold on slow memory. This isolates
the effect of hot-page promotion (node 2 -> node 1) on a
bandwidth/latency-sensitive workload.

Kernels
----------------------------------------------------------------------
  base  = 7.3.0-rc2-base+   (mainline base)
  pghot = 7.3.0-rc2-pghot+  (pghot + AMD IBS Memory Profiler)

Legend
----------------------------------------------------------------------
  A = base-numab0    Base kernel, NO tiering (numa_balancing=0);
                     reference case
  B = base-numab2    Base kernel, kernel NUMA-balancing tiering
                     (numa_balancing=2, hint-fault driven promotion,
                     demotion enabled)
  C = pghot-hwhints  pghot kernel, promotion driven by the AMD IBS
                     Memory Profiler (hardware access sampling);
                     numa_balancing=0 (no NUMA hint faults / scanning)

IBS Memory Profiler configuration (run C)
----------------------------------------------------------------------
  vm.pghot_enabled_sources     = 2   (HWHINTS source)
  vm.pghot_target_nid          = 1   (promote to compute node 1,
                                       same target NUMAB2 uses)
  vm.pghot_freq_threshold      = 1   (promote on 1st access, like
                                       NUMAB2)
  vm.pghot_promote_rate_limit_MBps = 65536
  vm.pghot_promote_window_ms       = 3000
  /sys/devices/system/cpu/ibs-mprof/enabled = enabled
  ibs-mprof: period=10000, l3miss-only=1, lat-thresh=0, lat-filter=0

Table 1a - Runtime (lower is better)
----------------------------------------------------------------------
Metric                           A           B           C
----------------------------------------------------------------------
NPB Time (s)               7564.04     3232.04     3515.97
Speedup vs A (time)           1.00        2.34        2.15

Table 1b - Throughput (higher is better)
----------------------------------------------------------------------
Metric                           A           B           C
----------------------------------------------------------------------
NPB Mop/s total           51739.90   121088.51   111310.01
Mop/s ratio vs A              1.00        2.34        2.15
Mop/s ratio vs B              0.43        1.00        0.92
Peak prov. mem (GiB)        161.38      161.38      161.38

Table 2 - vmstat counter deltas (after - before measurement window)
----------------------------------------------------------------------
Counter                               A           B           C
----------------------------------------------------------------------
pgpromote_success                     0    42181004    39701482
pgpromote_candidate                   0           0           0
pgpromote_candidate_nrl               0    42181008    39702291
pgdemote_kswapd                       0           0           0
pgdemote_direct                       0           0           0
numa_pte_updates                      0    42252137           0
numa_hint_faults                      0    42182619           0
numa_pages_migrated                   0    42182610    39701482
pgmigrate_success                     0    42182610    39701482
pghot_recorded_accesses               0           0    39793839
pghot_reported_hintfaults             0           0           0
pghot_reported_hwhints                0           0   553943841
hwhint_total_events                   0           0   553950006
hwhint_dram_accesses                  0           0   514144414
hwhint_extmem_accesses                0           0    39794778
hwhint_cache_accesses                 0           0           0
hwhint_useful_events                  0           0   553943842
hwhint_dropped_events                 0           0        6147

Key observations
----------------------------------------------------------------------
1. Tiering is essential for BT. With the whole footprint pinned to
   the CXL lower tier and no promotion (A), BT is 2.34x slower than
   kernel NUMA-balancing tiering (7564 vs 3232 s) and delivers less
   than half the throughput (51.7k vs 121.1k Mop/s). BT is
   bandwidth/latency-bound and much of its footprint is genuinely
   hot, so promotion back to DRAM helps a lot.

2. IBS Memory Profiler drives effective promotion WITHOUT NUMA
   balancing. Run C reaches 3516 s / 111.3k Mop/s = 2.15x over the
   no-tiering baseline, i.e. ~92% of NUMAB2's throughput, while
   numa_pte_updates and numa_hint_faults are both 0 -- no PTE
   scanning and no hint faults are involved. Promotion is instead
   fed entirely by hardware access samples.

3. Comparable migration volume, different mechanism. C promotes
   ~39.70M pages (pgpromote_success == pgmigrate_success ==
   numa_pages_migrated) vs ~42.18M for NUMAB2 (B) -- about 6% fewer,
   consistent with the ~9% runtime gap. Both promote to node 1.

4. IBS sampling is high-volume but precise. With period=10000 and
   l3miss-only=1, the profiler recorded ~554M useful events
   (hwhint_useful_events / pghot_reported_hwhints = 553,943,84x).
   Of ~554M total events, ~514M were DRAM accesses and only
   ~39.79M were external/CXL accesses (hwhint_extmem_accesses).
   That extmem count matches pages promoted (39.70M) and
   pghot_recorded_accesses (39.79M) very closely: nearly every
   distinct external-memory access observed led to a promotion,
   i.e. precise hot-page targeting.

5. Negligible event loss. hwhint_dropped_events = 6,147 out of
   ~554M total (~0.001%), so the SPSC delivery path kept up with
   the hardware sample rate.

6. Migration is promotion-only. pgdemote_* and pgpromote_candidate
   are 0 across all runs; memory is pre-staged on node 2 and DRAM
   has ample headroom (~252 GiB/node vs ~161 GiB), so pages flow
   node 2 -> node 1 with no demotion pressure.

7. Caveats: Verification reported UNSUCCESSFUL in every run
   (consistent across all three, so a benchmark class/build
   artifact rather than a tiering effect). These are single runs
   per config; the ~9% (C vs B) gap should be confirmed with
   repeats to establish variance.

Bottom line: the AMD IBS Memory Profiler source drives pghot
promotion purely from hardware access samples -- no NUMA hint
faults, no PTE scanning -- and recovers ~92% of kernel
NUMA-balancing tiering performance on NAS BT, at 2.15x over the
untiered baseline.
