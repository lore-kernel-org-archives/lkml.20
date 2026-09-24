Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDF539D6FC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231187; cv=fail; b=aQdRQ4GXBoTgUIF4i5guThjxO0E93LEi6fJo98HRxTDw5kbILaBFf75b7IgOrqox9ocKkoYPcGkmk3MioTfYPx9IsCYuc0AezXQXZ1gmoxVrmVmQJDxyPPn5Rdsg4i1Qd/RhEszfiOHO6x/rOp8dnMDSSTZ5bSN71ShBE+jAFo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231187; c=relaxed/simple;
	bh=exeRHROrF3Tay1ePK4kunOzZGUtajfPWD3SuMBpGe/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cvR7xseONi2BQxRW26ru8hRmlTLyk8AeZL6OxXOvq6rPD2UEuNOWF6pKKe4k+0X4KyEcraxduWMVffSh3b6wCrd26jtX7m5h6frYjDE5GMuiUWB4BbmWQ1O5Mw3dOH4ABVfvlQ/uvhkpguEv2kjkp1mp6yU+tE0TgMEwdDLQgwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d4tirNeA; arc=fail smtp.client-ip=52.101.62.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d4tirNeA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mzibt8IzWyCMg19D7V5Dhm+N1YcN+tC5XFpBn5U6joSGMk30msGaY7sZiC8bVjcSracvXpepu3432yYvdP9nA014AcS6WbSs0IQLa3USFvPyWdHQJQj9y66DEZNOmBPi9jfZEeUl+C+1V3rxy953nY3qxNHhgujw++OmMkCUeALJ013mS76YG+3rbIyLBQTty1MRvCVqhHuYlkEGhfTMU9fFXbDJezELtx8zeXWDebpJTpBGN9SbvPsnrBxPbQjRP9JtdsF7aAVefCmqnJPFoO7eeU8YvqJFPLeEQ1qlXmTTZtH6BzNoFqHJPsvbL0aoAgmxLTW9/qFDY0O/RUhAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2xaPKBQ+w1Lc8UTzGtoLnaSWqBsWC1y4InhTxeXyuc=;
 b=CPVwNkwuSqsj1cogqmpA+2hr0Z3TTxcWhHYB8cbbGASK+St7pCVQVJ3L5lTQLwU/quLJ7g8h7SeAsUCstpqSRT43LnQHUrw4/+1UHKSVDwD3FGYp0OttnGSoUe65cdt8eIb1Wth6W0X30y0zl2V9OY7CoyZZQh5irg12Sp0i+xM/Ii00jTLgDBJL2yDip4ye0qX9SVi33zxcjUEunSVNkZ4siIrx2f2+yIo2H9zwOYvXID5aLG8Ty/UZD80f0AtjunK5//txHb7EaaDnEgZi3ItDYOkTrme6yv/ZYHq0vEh+UNqAYG8OSZbNrNfDOyxvoHfZS7GMdkje1cv2+2s4Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2xaPKBQ+w1Lc8UTzGtoLnaSWqBsWC1y4InhTxeXyuc=;
 b=d4tirNeA/sfig+thnialWpORo3xA6Ax7WP4JfZku5JCmNRORJYmOBGy7xEeRgxQ1ZtKhe6zUiNllqBQ2CP4JoPmwDGJQTurdKG9jvaYc4KYx8qVP0MU1epXpvzsD2hTlP6DwTnQ1+RkhuuTGTZsy2oxm246mUIFGqldRyXGZA5Y=
Received: from BN9PR03CA0968.namprd03.prod.outlook.com (2603:10b6:408:109::13)
 by CY8PR12MB7194.namprd12.prod.outlook.com (2603:10b6:930:5a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Thu, 24 Sep
 2026 06:26:13 +0000
Received: from BN6PEPF00000073.namprd03.prod.outlook.com
 (2603:10b6:408:109:cafe::18) by BN9PR03CA0968.outlook.office365.com
 (2603:10b6:408:109::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.17 via Frontend Transport; Thu,
 24 Sep 2026 06:26:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF00000073.mail.protection.outlook.com (10.167.248.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 06:26:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 01:26:11 -0500
Received: from [192.168.0.152] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 01:26:03 -0500
Message-ID: <736ed7a4-3eed-445a-9838-37558bab8bc6@amd.com>
Date: Thu, 24 Sep 2026 11:56:02 +0530
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000073:EE_|CY8PR12MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d82c9f-120c-4cc9-9944-08df1a04baa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|7416014|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LtM15EdigGqWyMx9wLZ6vFIpag/aXc0AV/qdRvezg8GP9SMeEzD/KjGK6VyactXEJEkOrtKc5JGDWmzG+HCnOVhdWdad5XFKYyoOkCLGp5uVw9ARbsavc1Jdu0DrUw8fGE7+PObGi6V9UhxvJ+TEyFAnCOTHO+djYnnYSyBOT7Lg9avhzI14qUJM0jS/WBenwwoBpYph04WIlFh6WkPIRK2Oi/S/lKtS/bxLD4YTVJIL+kU0v2y3u+r01qxPZySwDR8KfxP57uGrjaBskk2hvax+5DdOThRxQooQuB3Jf1cpNySlK14xfNynvgtCMoqViA2rPnkaQoA/9ot8SYXJT1gGkpQxOOtO3SWx1jZxO/KfQopJ/4mEaTwqWqHCIJrBCCj2zZ0yW8Vux+eYPPo0rkm87OawAcoqWqY7l5NqGkQbkO3e/6bStU9vsZn/s+QDAudPMCRxZJZEaXfSITgzhZww0xp6Vrj5Wys0ZnzaCDhLp4PttNwgUCx/gw++U5Tjzys1fFSrZSkQH/We7vSXMp3h7m3MnmRCgKcpFdegOjQ8k3cinFGLJ7sNTiqTU7yiZGNRItSw24rap1bf7q+YrJi+4rR/8nKEDRgzKmMbhOupbitQR3Y9c5q9NK32GUGywDvCDFsaT5TIAjJ2Dzr5kpfLm8p3rmaY1cizJ2+EIAbUjsCql7z+UC1glROWBdmAu3hmQrjjy0mnckQ6glmvCw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(7416014)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mcCnP5/juDmkCvngY8N3egF1AERh5LVh8kaGECLGFTEBJuUW9HLaCagl+4El/DaVz7efEYVfMEZTu5nfbTrqCIPeEJlkOuKfuR+/FS1KsHBQhQqUuL1F0XTm6i6uRgQG+AQ9EJFHrRx88t7qx/Shss2shx+pxriJxHqrqwNS4sDzzz/4xeDcHdJIDuyzaCN+Bkq911W0H6+b1jB+iuOAN8M0Wg+hkcp5B2FJB3CaMzgkbMzSlJTY2Ws9F++xRVZeR5bBmsqJzJ7nMHdFczlXpWQHw+jG1JZUwchn6L52vGwNxmZBQMA/VL+g5ZpehZzUBMua+3G2+xSadKzJ14oVSu0LtnA3L96oVXG3rGsiaAN7iBzRBhkPDGMW+XudZKRXzlTRuQEb1QOrOq+T9B6YDyJKCTA+XsLcs72ymcjIPIQI5HDMG7xgFYmja2M8xoaf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:26:12.2851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d82c9f-120c-4cc9-9944-08df1a04baa1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7194

On 24-Sep-26 11:52 AM, Bharata B Rao wrote:
> 
> Detailed per-benchmark tables (throughput/latency + vmstat and pghot
> promotion counters) are posted as replies to this thread.

Micro-benchmark

Multi-threaded application with 64 threads that access memory(8G) at
4K granularity repetitively and randomly. The number of accesses per
thread and the randomness pattern for each thread are fixed beforehand.
The accesses are divided into stores and loads in the ratio of 50:50.

Benchmark threads run on Node 0, while memory is initially provisioned on
CXL node 2 before the accesses start.

Repetitive accesses results in lowertier pages becoming hot and kmigrated
detecting and migrating them. The benchmark score is the time taken to
finish the accesses in microseconds. The sooner it finishes the better it is.
All the numbers shown below are average of 3 runs.

Table 1: Completion time (lower is better), avg of 3 runs
64 threads, random 4K access over 8G, mem on CXL node 2, cpu node 0

Config    Time (us)   Time (s)  Speedup
---------------------------------------
C1       98,485,716       98.5    1.00x
C2       38,636,402       38.6    2.55x
C3       44,270,350       44.3    2.22x

Speedup = C1 (base-NUMAB0) time / config time (>1.00x is faster)

Legend:
  C1 = base kernel, NUMAB0 (hot page promotion disabled)
  C2 = base kernel, NUMAB2 (hot page promotion enabled)
  C3 = pghot kernel, IBS profiler, pghot_freq_threshold=1 (NUMAB0)

Table 2: Page migration / hotness vmstat counters (avg of 3 runs)
'-' = counter not present for that kernel/config

vmstat counter                      C1         C2         C3
------------------------------------------------------------
pgpromote_success                    0  2,097,152  1,981,045
pgpromote_candidate_nrl              0  2,412,042  1,981,045
numa_pages_migrated                  0  2,097,152  1,981,045
numa_pte_updates                     0  2,097,152          0
numa_hint_faults                     0  2,412,042          0
pghot_recorded_accesses              -          -  1,985,269
pghot_reported_hintfaults            -          -          0
pghot_reported_hwhints               -          -  5,991,177
hwhint_total_events                  -          -  5,991,177
hwhint_dram_accesses                 -          -  3,716,462
hwhint_extmem_accesses               -          -  1,886,078
hwhint_cache_accesses                -          -          0
hwhint_useful_events                 -          -  5,991,177
hwhint_dropped_events                -          -          0

Legend:
  C1 = base kernel, NUMAB0 (hot page promotion disabled)
  C2 = base kernel, NUMAB2 (hot page promotion enabled)
  C3 = pghot kernel, IBS profiler, pghot_freq_threshold=1 (NUMAB0)
