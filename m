Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010053.outbound.protection.outlook.com [52.101.85.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7013EC824
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231864; cv=fail; b=N86pVPbexybg5jhsiGn8u5s2vnJKEAwTQyg4GlyQO9mX3OGS8PtGkqhYXcqSubSDeyyodjn2HELiYuKqTFb9vxz/S6PEdocEFzOHooqFyaiD4MtQl/onpTj1+gYqx6eLaQ4Q4z3Inm5v2Sc3WKIBdhnvCGL7dF+Y8gtWDTjwixo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231864; c=relaxed/simple;
	bh=cN1fPHVG9Y1XemmyriZmcPlnJUZf5EALCJrx9B9//iM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SaZZDms759PAgnp6j/IZOKPe/0BuJY06OfahSvsb1BFKLo2LlikeTBIYOzljd+Ci3J772WLWluAv6mHVfIohho/Dj5XJyYwKMXC6e0UJJAduYOcjzG8t2D83hmf+3pAKbZc9OlOrAom6BqvLtf+3dVTJF6j/XF7kJsf6pRnyz7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gmgslRry; arc=fail smtp.client-ip=52.101.85.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gmgslRry"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDTlwm1MtxBvmoQ7VH9SJQY2iXoIg3qxtwv6EGLRH0eTaWzC3zWHlwpwhYyhTg19y6TWJ/z1fg4dqkyiBJWDdZ4IYhrSHUEUGfgOTK5Ipb7RN3Gx1mGzGRxnTmnHnmpWBiMi2hgpxIqG4DvzTDzQIeeLSJWH0mJhCEQF4P2CFRKsMP2G0EIPr01tqyDx6EjVkUz19+8QoXR9sMyoE0mvrkRAoaIeO80EqyRr+ItjhDXNX4svxeMDAze+BiTeurctA0BEn37EcNyWDbm06FTQKtMSOi388BXB35R5VmrIC9Ei8kLC7QxsjoLhlOIKaspeJXXKm0ngya/7V2Le4FtYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cuHss1f5nj2E2L2f3iB/jediY0K3vNyJk5p/GIhpXo=;
 b=d6IfvuchQ9O+N/FiQJVImvJ9/ZvEZW2PwJRvH3/t4DmQPg5A4DXdZtCn3Irkzdt+YjYihIRZLEYIXNJsiKMM/z1e59m+RgUxYE8Nz1eP8IYq7eB0Jw9YlTambZqIzNZXt9ML0N2PIE9hahX3mrzxmxdt2ATPgZylPSNwLWKElYsLW8wzX36BfzZQpXKmGufOmCQ2yjXPY6S/zgMHh3nkD3eJCLRPiniKaX5ubGFU+SIr8H7u5MD6Dgf4ofk2ddb8mz9M5MVE5/3dOdmpzIYvu56N06rLtNf8LEW6XLnm1PLkjG0fB2KsFt/T3C2bjPJ7Ft7aYPDRwqYo961E8hkACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cuHss1f5nj2E2L2f3iB/jediY0K3vNyJk5p/GIhpXo=;
 b=gmgslRry3t4KMiIU7DC69ZWFvSPDumos5/O1iYY6wA4w07QFysxUmgqOy1Oau3tdyeUn5X5mz0tlb8mJukuoIG5dx2Q9PuccMVTIuqhrDpghjph+5SjYaj+ukhAY5Ro1aRlwDiMqCeOCRE6fGJXAjpO9jPlXSfJZdk0xsIzPtZI=
Received: from BN9P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::35)
 by CHAPR12MB999248.namprd12.prod.outlook.com (2603:10b6:610:2ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:37:35 +0000
Received: from BN7PEPF000000A1.namprd04.prod.outlook.com
 (2603:10b6:408:10c:cafe::8b) by BN9P222CA0030.outlook.office365.com
 (2603:10b6:408:10c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Thu,
 24 Sep 2026 06:37:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A1.mail.protection.outlook.com (10.167.248.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 06:37:35 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 01:37:34 -0500
Received: from [192.168.0.152] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 01:37:26 -0500
Message-ID: <61cf8070-008b-4909-8b20-e138d3b33289@amd.com>
Date: Thu, 24 Sep 2026 12:07:20 +0530
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A1:EE_|CHAPR12MB999248:EE_
X-MS-Office365-Filtering-Correlation-Id: 35470ac9-8dad-414b-8145-08df1a0651ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|7416014|82310400026|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HEhchYiFyQ4LeculKYX7/9WrZh0wtWZfBuont917UT0OHmDTzWla2yp3njj1Ev++AS+t5qY5u9SqWS7fCoq6aEdhh2umYj/Zvp7iNmfI1adBwO9JFbIk7x3IDua9ZTHSxVWX13CKNGXblWjiQ52s1wDnE+dyT7ShA42cUGPzk/Lnr0pwaoRfYffpegJlgx+YMc7ISPKFRDBr6ZHJft1t7dQXeYvTSCB1yrKZCgJZSNrA3/srUV3VGTaSRylc3yXc/GGGKeWXlannVnVi8Z74m6iMg5HkxgmD6+fG0ID4LJI7ryLu4dRZfSN8jo9luMJNjMFQwJf9tRSTGr9iNeLST/UDCNsWiNFzCtglom21guzx0WNC8pytECrvfACkc2n15Q83Y6uevP0oqqoFuGwMv7UNFehkim3LM8IXX01zPWRk0in3wj2tzBXfN7xB0BtKC+AcW3po81/179e476dyC4EtY7TRUsjuAbQXmEDKamQIbeu8ssmtPS+jjCasVijnn0gsCtrfuf/NS6PrQa6t/nd0J08fRM7RDkIoHkHvcFh6OZLK8+3JDZhCNpF1sqXlAW0C3eY7agaMiexps/QH7nJNO36ESdgtlhcO28oYnQJSjQlj1AlYzHlK/nokv7Y9yGrmSjYvlyfzEB8Ri6RWM2Kdl0TTCSt62wO6kkfH5PzdQbG3n8dHlt2uv2ahJa7Q5iSMv1EKkGKnMFkUBJSU6g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(7416014)(82310400026)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aupPwZ5vrl+MWfxqNAqku/eMLHs8gzRFqRvMNvLVhiHvvJPtaVzr+z6lvYie7p9MHXOrgiU8PP+a0VxguQhbbWU+Us5ddaH9tGTECFI/vZLRk38g2V11LfDhEPUO7EfMU00ypx4Nbk/dwc4Kb2TQhL4WnZMRvcg3LcLzJtmOWTq4te4J3HpMVKOIquFDxJz9BcB8+/52yJK2PwWdRX7bpBNiUmn55IFZp3he9hN5p6ASXRI+z839cbY97uMXNk8QHKxxTNFdre1Yy+Q1MbYV+IYft1LGZbTYlrQny0inVK0maufEmWg2Aq7fT2+v+DK2D72y5g0CpkOmRQoE6rLvbWXUvNmSgMqB9DCuRHPQqhOLaG8vCncF056Imf9yBou1A0SONxV6e2wipkh4hIvBaWOmfgDvF54O9yVMN4HUfk6TN4F2o3MdZwSmHlsEIXtZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:37:35.4132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35470ac9-8dad-414b-8145-08df1a0651ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR12MB999248

On 24-Sep-26 11:52 AM, Bharata B Rao wrote:
> 
> Detailed per-benchmark tables (throughput/latency + vmstat and pghot
> promotion counters) are posted as replies to this thread.
==========================================================================
Redis + memtier: hot-page promotion on a CXL-tiered system
==========================================================================

Benchmark: an in-memory Redis server is loaded with a ~64 GB dataset
(62.2M keys x 1 KB) whose pages are then explicitly migrated to the CXL
node (lower tier); the Redis server and the memtier client run on a top-
tier DRAM node (node 1).  The measurement phase drives GET traffic with
memtier (16 threads x 100 conns, PASSES=12) over 50% of the keyspace so
that repeatedly-accessed lower-tier pages become promotion candidates.
Promotions target node 1 (local to the accessing threads): NUMAB uses
the accessing node, pghot uses pghot_target_nid=1.

System : AMD Zen6. Nodes 0,1 = DRAM (top tier);
         node 2 = CXL (lower tier).  Redis/client pinned to node 1.
Kernels: base=7.3.0-rc2-base+  pghot=7.3.0-rc2-pghot+

Cases:
  C1 base/NUMAB0      base kernel, promotion OFF (baseline)
  C2 base/NUMAB2      base kernel, NUMAB tiering promotion (hint
                      faults); promotes to local accessing node
  C3 pghot/hwhints-10k  pghot, NUMAB=0, source=IBS mprof,
                      period=10000, freq_thr=1, target_nid=1
  C4 pghot/hwhints-5k   as C3 but IBS period=5008 (kernel min,
                      ~2x sampling; 5008)

==========================================================================
Table 1: Benchmark metrics (memtier)
==========================================================================
Case                   Ops/sec   vs C1     Avg     p50     p99   p99.9
                                                           latency (ms) ->
----------------------------------------------------------------------
C1 base/NUMAB0         285,288     ref  179.46  177.15  344.06  358.40
C2 base/NUMAB2         295,475  +3.57%  173.18  168.96  325.63  364.54
C3 pghot/hwhints-10k   285,923  +0.22%  178.91  177.15  344.06  358.40
C4 pghot/hwhints-5k    285,290  +0.00%  179.24  177.15  346.11  358.40
----------------------------------------------------------------------

==========================================================================
Table 2: Page-migration / hotness metrics (vmstat delta)
==========================================================================
Legend: C1=base/NUMAB0  C2=base/NUMAB2  C3=hwhints p=10000
        C4=hwhints p=5008  (both hwhints: target_nid=1)
        ('-' = counter not present on base kernel)

metric                       C1          C2         C3         C4
-----------------------------------------------------------------
pgpromote_success             0  10,433,506    575,010  1,107,371
numa_pte_updates              0  20,333,730          0          0
numa_hint_faults              0  10,433,506          0          0
numa_pages_migrated           0  10,433,506    575,006  1,107,369
pgmigrate_success             0  10,433,506    575,006  1,107,369
pghot_recorded_accesses       -           -    575,677  1,110,760
pghot_reported_hwhints        -           -    964,304  1,967,044
hwhint_total_events           -           -    964,324  1,967,078
hwhint_dram_accesses          -           -    388,027    854,679
hwhint_extmem_accesses        -           -    575,674  1,110,758
hwhint_useful_events          -           -    964,304  1,967,044
pgdemote_kswapd               0           0          0          0
-----------------------------------------------------------------

==========================================================================
Key observations
==========================================================================
1. NUMAB tiering promotion (C2) helps only marginally: 295,475 vs 285,288
ops/sec (+3.57%), avg latency 179.5 -> 173.2 ms, promoting the full hot set
(10.43M pages / ~39.8 GiB) to the local node.

2. pghot with the IBS hwhints source is flat vs baseline at both periods
(C3 +0.22%, C4 +0.00%). numa_pte_updates / numa_hint_faults are
0 (no NUMA balancing); promotion is purely hardware-sample driven.

3. Sampling density scales promotion linearly (period 10000 -> 5008
doubles reported hwhints 964,304 -> 1,967,044 and promotions 575,010 ->
1,107,371 pages, ~2.19 -> ~4.22 GiB); ext-mem/CXL samples map ~1:1 to
promotions (freq_threshold=1), dram/already-toptier samples are not
promotable.

4. But even ~4.22 GiB is only ~10% of the ~40 GiB hot set, so throughput
does not move.  Unlike C2 (which promotes the whole hot set), sampling-
based hwhints at these periods covers too little of the working set within
the run.  Reaching C2's gain needs far denser sampling and/or a longer run
so hwhints promotes a large fraction of the hot set.
