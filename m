Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A683B42E7
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524327; cv=fail; b=SR6iQfXksgKTOGGTgngAS/H8/Qtb53D6LIW5n6URhI+5Z39fx/uQZpinIdjPhXfTNtrwNnBxIReUKx7txIkeUg/A56s1xPiBgo2U05eH4ChfdvZDk2i9cEze7SKESZotYbTgVBF2nBJuAsnbcBmRpe6stvj71r7bFBsmzaXVP48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524327; c=relaxed/simple;
	bh=TmKOy5IlXGCE9x0Sg0fEx8IzObUdqIn7EqFhgJNudUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bJtn+55hwlzUPIRVbwWyzQaoc+qALtHmlhv+za1qqCfgqs2kAyDXiBfzoFNiaCVpnAOkMEFrcOe8a0kKFCcGWEQ1Wzj9NzOOJTQhfGCiWnWP1OdLxfLVnUO/oSG4KJmbO6Ce6gcSRIVz27asuVUxHtBolWylykYUyLi8ppbs94c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t0ermcK3; arc=fail smtp.client-ip=40.107.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t0ermcK3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsAjc7s9LET7LX/ZFL9dXJ4Vx63oed9mFSE4ZaZCEW+eCqFyBIqrWH4ExmeXuvguLJumSZvr4cw6Ld5lDlSEHm7L21eb+BRAJ6fgG/r1KFdlVoPLqTBZim2Qa7wAE2/9DHMyR8Dgh25LEIqaPygn76X4gohbqKGjfaKhOXUePYKsTIqlLBxiAwNWFXcmva4lCtdhPrbR0mMxfIZKYmbCkKOHfkV+j0HJNoEANHvvvzOc1IFNrEIH1h6tVyJ24CV2Mz4XdS15JQb3GpA7L5+c5G0eOntitFtIdEC0cQCFHJStV1GlzYwaLA2ZAUPtMuDBpxl99ssaLrfRDX27AXbsSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FatXzqEwU6QnTNIQFZ/qPsvU7PVo9U9zujpIFZrL640=;
 b=PiHs95/enr51vaCa142HkHb6teSZNq2JvBs7Q7pAGUKzPeqUHY4G3HJcEmIkMCCxN9NVV4ir5opDY89mEMAyg/1aMLhoX9HwmpZdxxFSLq1aFs6fRZn6Sdhj2E3+TuMR4SkfYR//Y3ymQ4uF2mCQ1mlOzxEaMXIa8fy0wuNZ0GIDf6ozlvvLomszUJjl3jW/DWNUNIA4R6ALSqWsdMC7+q1CLd8XSXgvJD+QxBmMeALDaC2Z09+T3knjIrXPc/37oSxG4HgTri4+zYBQ4PJPidTp+lu//PBHuVYCYbLk1dnpCoddxcLCHoI1LNxFnqNd1SvUqWTkixvXTjZOZuMYTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=stgolabs.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FatXzqEwU6QnTNIQFZ/qPsvU7PVo9U9zujpIFZrL640=;
 b=t0ermcK3dh38qi7v8qpEydkSEkbcGaDI9z99JFlxDlYiJDoRutTrWdLKQrU6xzCm5IkIXi3J518vVjEL7gBFkeWZgduHwU+be7NjW8fD30IUl51zRrqJcET0qIdUOsEYvm+oL8DIXYr35+KKLsUjeqoeWv3cEsX0DTwqjt8Qf5A=
Received: from BN9PR03CA0524.namprd03.prod.outlook.com (2603:10b6:408:131::19)
 by SN7PR12MB8002.namprd12.prod.outlook.com (2603:10b6:806:34b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Sun, 27 Sep
 2026 15:51:53 +0000
Received: from BN7PEPF00000094.namprd03.prod.outlook.com
 (2603:10b6:408:131:cafe::ac) by BN9PR03CA0524.outlook.office365.com
 (2603:10b6:408:131::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.22 via Frontend Transport; Sun,
 27 Sep 2026 15:51:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF00000094.mail.protection.outlook.com (10.167.245.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 27 Sep 2026 15:51:53 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 27 Sep
 2026 10:51:52 -0500
Received: from [192.168.0.152] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Sun, 27 Sep 2026 10:51:44 -0500
Message-ID: <31442591-d020-47b5-8f1c-b87fb632c226@amd.com>
Date: Sun, 27 Sep 2026 21:21:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] mm: Hot page tracking and promotion infrastructure
To: Davidlohr Bueso <dave@stgolabs.net>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <jic23@kernel.org>,
	<dave.hansen@intel.com>, <gourry@gourry.net>, <mgorman@techsingularity.net>,
	<mingo@redhat.com>, <peterz@infradead.org>, <raghavendra.kt@amd.com>,
	<riel@surriel.com>, <rientjes@google.com>, <sj@kernel.org>,
	<weixugc@google.com>, <willy@infradead.org>, <ying.huang@linux.alibaba.com>,
	<ziy@nvidia.com>, <nifan.cxl@gmail.com>, <xuezhengchu@huawei.com>,
	<yiannis@zptcorp.com>, <akpm@linux-foundation.org>, <david@kernel.org>,
	<byungchul@sk.com>, <kinseyho@google.com>, <joshua.hahnjy@gmail.com>,
	<yuanchu@google.com>, <balbirs@nvidia.com>, <alok.rathore@samsung.com>,
	<shivankg@amd.com>, <donettom@linux.ibm.com>
References: <20260728054356.291998-1-bharata@amd.com>
 <20260925021226.52kpnmvfylw73dz4@offworld>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <20260925021226.52kpnmvfylw73dz4@offworld>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000094:EE_|SN7PR12MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c6a1be-3fdd-43d8-5455-08df1caf4032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|23010399003|1800799024|36860700016|11063799006|5023799004|56012099006|4143699003|6133799003|10067099003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	HkVmsZMDMltM27+AjWYBuqOptmexHPtPpuRUTKYux37I9LQwCtOKYcoNE/o9yejeKPQhvknxf2u2TDcuzV8nIeKG0IXYeF80BjBMlVT8rodUt5Tz2mYXwTiKTqECVhA+AEDdMNX3wXWyrg79+9Hk94vySyoXCEuJcAWtsgCW2gQM2xayI+3Cj7B79fYynweXwjMIhzSLyFJmGJlSaf7baP37EDZaEiwwof7ISMlCX/yXhPMkLEv6WhPCaVALSrZRbuTjjXnyrAek1Cp3BMGT1IKUDGWT7J94NNjRVN2Jolk/IOF9OEHIsV8BwLcyOp9op2pZyhQK0gqzaHfPpCQJF3W0zkxaEp0nuiwNiXRBxy6fBReS26qKOwCFZZL5dZ4DlxCqedHmu+xzvuGigdVSGzTGvtFebaGjmK2sVJZYN+/q5fd/Cn/jpRpRb/F1CouKUJbsXQaHBex+yzX+X8av//sYmfdxOcrGpL/rlCcFYQo5x1G6xKg7dBVUNJ4eTrFIO9jlT/8bUmUOVVtlJapr1Tix7ExYJrbaNYuM9nL0No/TMOI7wKzTpTFPnhwaq4XzEunWHW+GyjW5hTHbEVPERqFIm7tDVY7wITxVP4aPsDJkbYsexsD8N5fFV0LMJUOPFAZ7mtBcp5QNI7xY66LFMHsrBrGkAHpOa8GP+HzTfs4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(23010399003)(1800799024)(36860700016)(11063799006)(5023799004)(56012099006)(4143699003)(6133799003)(10067099003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gpIoWk2mK5+hsXVtEjL3NfMQqZ98/edWyb/jCUAbDb4uya7IpGPYjVUC7BzF1xFbquHBUvBazYMLWY0J2d/TfVEoF0fnrDDaFtwF9oW+d2zyXjHhnYAmbYYkTuIywvo++YEf0cm9h0FJ5Gp0ctZ8tfQ1UMO3qJxkyFXGyGbXYtBIudF6tJilouQ1wpNSRsQfN+a3CC3kGdTM+H3VqOBr0hvWePOBNcwcGF8g95U811TNe5AfSAc8VGu6hBJRxhh4J/XW496WRnlpVqDUHq+343zxJbdXwXn8P3kgQuWLVaFqOf2a1DHrgjQii+pXrTYYNPALF2RKXY1EVQF433UMeXrP0z7WD0DTl5DffA5+7VCj+IDiC69OtEGlQt7nyAdncS33ZXyTUwnwlyZwfW7WIkLjDxv6l85hYapa9ccqZ+f6VlBJBrzA3XdOs4rftvKr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 15:51:53.1396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c6a1be-3fdd-43d8-5455-08df1caf4032
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8002

Thanks Davidlohr for using pghot and providing your comments. The timing is also
perfect as we can continue the discussions in LPC too. Let me try to address
your concerns by with top-posting first where I cover other general concerns as
well and would reply inline for your XSBench observation.
		
Complexity of pghot
===================
Let me start with lines-of-code and functionality breakup.

 1135 mm/pghot.c
     86 mm/pghot-default.c
     85 mm/pghot-precise.c
  208 include/linux/pghot.h
    45 mm/migrate.c
1559 total plus some small bits in mm/vmstat.c, mm/init.c, Kconfig, Makefile etc
That includes around 160 lines of NUMAB2 engine code moved from
kernel/sched/fair.c

The above includes the following distinct functionalities and parts:

Hotness recording mechanism (pghot_record_access())
Hotness promotion engine (which is moved from kernel/sched/fair.c)
PFN walk and async migration (kmigrated)
CPU, memory and node hotplug handling
Sysctl and debugfs tunables, vmstat counters, enabling/disabling parts etc

Memory overhead
---------------
Default mode: 1 byte per lower-tier PFN => 256MB overhead per 1TB of lower-tier
memory.
Precision mode: 4 bytes per lower-tier PFN => 1GB for 1TB of lower-tier memory.

In not-yet-posted version, I am tracking hotness at sub-section granularity (in
addition to the existing per-section bit)  which makes PFN walk more targeted
and reduces the CPU overhead of kmigrated thread. This adds 64KB per 1TB of
lower tier memory overhead for 2M sub-section tracking.

Runtime overhead
----------------
Recording hotness is mostly a constant time operation function.  Hotness record
lookup involves PFN to section, PFN to section->hot_map. Hotness record update
involves a few atomic bit operations and an atomic cmpxchg operation.

Kmigrated walks only those sections that are marked hot. In the next version, it
would even skip those sub-section ranges that aren't marked hot.  Within a
sub-section of 2M it walks all the PFNs (512 for x86). Hotness record
consumption again involves an atomic cmpxchg operation.

migrate_pages() already supports batched migrations, kmigrated just feeds it
with batched hot folio list extracted during the PFN walk.

No fancy data structures to track hotness, no complicated synchronization
mechanisms between producer (pghot_record_access()) and consumer (kmigrated)

Hotness promotion engine
------------------------
This is not something that was written for pghot from scratch, but instead it is
the same hot page promotion engine that is part of NUMAB2 which is now
generalized and moved to pghot. So this is not the complexity that pghot
introduces afresh.

So considering all these, I see pghot as a light-weight and low-overhead
mechanism to track per-PFN hotness and do async batch migration. Initial
versions had fancy double data structures; a large hash a small binary tree of
promotion-ready records and associated synchronization mechanism, but that is
all past now.

pghot interface for sampling
============================
pghot_record_access() interface was designed keeping the existing NUMAB2 source
in mind. It fits that and it fits other sources like IBS Memory Profiler. So
sampling sources report an access and the shared promotion engine acts upon it.

But for sources like CHMU, from what you describe, I gather that a bulk
reporting interface plus an indication to bypass the engine to treat the PFNs as
migrate-ready, is what is required. Should those migrate-ready PFNs go through
the regular pghot tracking (getting into section hotmaps to be picked up by
kmigrated) or even that should be bypassed?

However, in the context of PTE A bit based source, I have often thought about
extending the interface for

- bulk reporting where more than one PFN gets reported.
- indicating the bypass options (frequency check bypass, recency check bypass etc)
	
NUMAB2 has to perform better in pghot
=====================================
pghot is about a sub-system that makes it possible to have multiple sources to
coexist with reuse of common hot page promotion engine.

NUMAB2 source resides within the scheduler and the promotion engine is also part
of the scheduler. Through pghot, I am separating the source (NUMA hint faults)
from the engine and moving that existing engine into pghot, to a common place
where it gets reused for other sources as well.

It is the same NUMA hint faults and more or less the same engine and hence my
main objective is to ensure that there is no regression during this move.
Additional performance optimizations can be done to the engine itself separately
but that shouldn't be the baseline expectation from pghot.

Is moving hot page promotion out of scheduler into a dedicated system, a good
thing in general? I believe so as scheduler isn't the right place for it to
reside. However I would like to hear from scheduler folks on this.

Do we even need a centralized hot page promotion engine?
========================================================
NUMAB2 is good and serves as a good baseline for any new source that comes up.
But with different kinds of sources becoming available, do we want all of them
to  duplicate the hot page heuristics and promote hot pages on their own? I
thought that may not be preferable and hence started this effort.

CXL HMU may not need the promotion engine,  but IBS Memory Profiler needs. It
needs a promotion engine with full recency and frequency considerations before
promoting. I don't think an arch driver like IBS Memory Profiler should be doing
hotness heuristics within itself but instead be using the existing engine. In
fact in my early posts, the driver based on primary IBS instance was feeding the
"access sample" as "NUMA hint fault" to NUMAB1/B2 so that rest of NUMA
Balancing/Hot page promotion engine just worked. But I think pghot is a better
approach than that.

Why full pghot? Isn't async batch migration enough?
===================================================
Some of the above reasons apply but during the course of iterations, I have had
implementations of just the migrator (kmigrated [1]).

If every sub-system/source has intelligence of its own and just wants to
handover a list of pages to async migrator thread, that's not much of an effort
as this implementation showed.

But then if some source needs rate-limiting and another source needs only
hottest pages to be promoted, then again we overlap with the existing NUMAB2 engine.

Then if we want to be slightly generic and want two sources to complement each
other or the promoter to differentiate between lukewarm vs hot pages/regions
then we may have to maintain hotness records and may soon end up with something
similar to pghot's hotness tracking and reporting mechanism.

Hardware sources have to out-perform NUMAB2
===========================================
Different sources will have different characteristics and capabilities and will
help different workloads differently. So it is the choice that one could
provide. Sometimes sources can complement each other as well.

What IBS Memory Profiler has shown is that it can match and/or exceed (for
Graph500, ptr-chase, llama) NUMAB2 with no hint faults overhead [2]. Also please
check the initial XSBench numbers in my inline reply.

Cost of an unused source
========================
Not all the sources are required for every situation. Sources can be disabled at
compile time or not enabled at run time with no cost or effect on other sources.
But hotmap allocations would remain as a static cost even when no source is
enabled (built out at compile time, the map is gone; sources off at runtime, the
map remains)

Tracking granularity: per-PFN vs region
=======================================
Often times this question comes up when pghot is compared with DAMON.

Firstly, the baseline that we have (NUMAB2), tracks hotness at page granularity.
To support this, pghot started with per-PFN granularity. Naturally two concerns
come up:

1. Memory overhead: I have shown the numbers above. It is lower-tier only and
not much IMHO.

2. Scan/CPU overhead: pghot started with scanning all PFNs, that was expensive.
Then it introduced hotness bit per memory section so that only those sections
which are marked hot are scanned. Now I have added (yet to be posted) a
sub-section level hotness tracking where a hotness bit is maintained for each
fixed 2M region within a section. This has considerably reduced the CPU overhead
for kmigrated thread. While the ptr-chase numbers that I shared with the
separated out IBS RFC v0 post of IBS Memory Profiler [2] does show the kmigrated
utilization numbers with sub-section tracking, I plan to have some more numbers
ready for LPC.

I am beginning to feel that this may be a good middle ground between real
region-level tracking (where all pages of region are promoted irrespective of
their real hotness) vs scanning at sub-section granularity but performing
per-PFN precise promotion.

Losing cache locality due to async migration
============================================
I see that async batched migration is important to free up the heavy migration
related activities from the process context. Losing cache locality is inherent
to that mechanism I believe.  Given that pghot-NUMAB2 didn't show any
significant regression with the benchmark numbers I presented, it would be good
to find other benchmarks that show up this locality cost in a tiered memory setup.


On 25-Sep-26 7:42 AM, Davidlohr Bueso wrote:
> On Tue, 28 Jul 2026, Bharata B Rao wrote:
> 
>> Performance summary
>> ===================
>> All results are on 3-node tiered systems (DRAM top tier + CPU-less CXL
>> lower tier). Speedups below are normalized to the base kernel with no
>> tiering (NUMAB=0). Columns compare mainline hint-fault tiering
>> (base NUMAB=2) against pghot in two modes: hint-fault driven (pghot-hf,
>> NUMAB=2) and HW-hint driven via the AMD IBS memory profiler (pghot-hw,
>> NUMAB=0, no NUMA scanning). Single run per config (abench is avg of 3).
>>
>> Benchmark      Metric (higher=better)   base-NUMAB2  pghot-hf  pghot-hw
>> -------------------------------------------------------------------------
>> NAS BT (MPI)   Mop/s total                  2.26x     2.26x     2.13x
>> Graph500 BFS   harmonic-mean TEPS           2.64x     2.49x     2.68x
>> llama.cpp      decode tok/s (tg128)         1.09x     1.41x     1.21x
>> Redis+memtier  ops/sec                      1.05x     1.05x     1.00x
>> Microbench     completion time (1/t)        2.41x     2.40x     2.35x
>> -------------------------------------------------------------------------
>> (baseline = base kernel, no tiering = 1.00x)
>>
>> Summary: pghot hint-faults reproduces mainline NUMAB=2 with no
>> regression on every workload; pghot HW-hints/IBS matches it mostly.
> 
> The IBS doesn't seem to bring anything to the table, other than just
> serve as an example - we've discussed this in the past this. And for
> NUMAB2 I would expect this to be the very best case in that you are
> not suffering from loosing the locality info.
> 
> This is a lot of added complexity and code just to break even. And
> hardware sources should really outperform NUMAB2 for this to be
> worthwhile, methinks.
> 
> I know Joshua mentioned some improved PSI by doing the promotion async;
> which makes me wonder that perhaps just a simpler promoting kthread is
> enough, so NUMAB2 just kicks the migration to it and not done in the
> accessing tasks' context etc. And Gregory also recently improved this
> path vs NUMAB1.
> 
> I mention this because I have integrated the chmu as a source of
> hotness for pghot and this was tested on a real device vs NUMAB3.
> This was based on Jonathan's rfc for the perf driver, only that I carve
> out the first chmu instance for this, and leave the rest of them (if any
> for perf).
> For example, 'XSBench' improved by a factor of ~2.7x (I would like to
> report a wider range of benchmarks at some point, but this is what I have
> now). But a lot of this bypasses most of this framework and just piggy
> backs on kmigrated moving memory. chmu does not do well with
> pghot_record_access(), which is designed for sampling... so I just set
> MIGRATE_READY right away. I also added a pghot call/api to make use of
> the regions chmu deals with instead of per access/page. The cxl driver
> just takes the dpa range given by the chmu hotlist, coalesces into adjacent
> hpa ranges (just 1 for the case of no interleaving) and feeds that to the
> pghot subsystem as a list of these contiguous physical chunks ranked/sorted
> by access density (accesses per page per second, so a large lukewarm region
> and a smaller hotter one can be differentiated and promote the latter
> first).

I would be interested to understand more about how you ran XSBench, the
parameters used, the promotion stats, if demotion stats etc. Do share when you
get time.

I did a round of testing to compare base-NUMAB2, pghot-hintfaults(NUMAB2) and
pghot-hwhints (IBS Memory Profiler). I am still experimenting with options,
placement etc but here are my initial numbers:

Non-Overcommitted case: XSBench working set fits fully within toptier but starts
on lower tier before the measurement phase
(XSBench -s XL -g 238847 -t 64 -p 60000000 -l 34, footprint ~116.56 GiB)

			Runtime (s)	lookups/s	Promotions (pages)
base-NUMAB0		498.6		4.09M		0
base-NUMAB2		422.4		4.83M		30.5M
pghot-hintfaults	329.6		6.20M		30.5M
pghot-hwhints		109.2		18.69M		2.7M

Same amount of pages promoted by both base-NUMAB2 and pghot-hintfaults but
runtime is better with pghot. This could be the benefit of async batched
migration showing and no adverse effect of losing cache locality.

pghot-hwhints shows good results. As I said this is just a first peek to the
experimental numbers, I should have more concrete numbers and conclusion in LPC.

[1] Kmigrated -
https://lore.kernel.org/linux-mm/20250616133931.206626-1-bharata@amd.com/#t
[2] IBS Memory Profiler RFC v0 -
https://lore.kernel.org/linux-mm/20260924062206.319314-1-bharata@amd.com/

Regards,
Bharata.
