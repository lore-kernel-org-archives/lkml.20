Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE06363089
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242751; cv=fail; b=Na+bIjUvEY7HU4jw8SZ00IfB2TkvT/80j1K0t+XH0C/ZNt6rG+vWn9KVgVQd6/gJ0ZiUswkBPVOu0OABI0VpHVhllOmuC8b67c0D9UvOLKF8C4G9+vnrryN+mmPepkxDQiauFwAI/B7Suvm/BDuaXo49wSi5EJtEzpl+PVyQgXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242751; c=relaxed/simple;
	bh=blo62CB+dQ34vFxlz7p6m9UyzJeXRlU9K+7pG3IoLaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s7US4bd1kIl6sqr3rOrupm5dnr/qEzeYlaT9w5UAdaKfa/EYY64AJfMYKBmQpaajTR584AhBXnpwYsiRA7XHb5Kl3yqW4hlPng2uBft0GCpgn+7YgBHPyP1og8idRbC1Bx8omZL3o970BhkEJo3ZCV0G6UL0O1um2b0nFvLncLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M/joJ3TM; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M/joJ3TM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqEGl1RiGs9LY9WM2izLK7tS1Au5A2zkH+j0hGl84ntSGasE28ByZVgL9KW3bE0FuZBZUZmgqJjhGS7iZlRHsevVYsZd/9l5GkOgWw/qo3KliSC5q7eyUJ7AA/E4XkdXXdo18LPxXj/053dKjs+j5WjM2Lg7gjD6wNKmhQDJbV1hWEcdSqzCwsULzGEfU7M47/OPaMuBzHJtHg0dHEsViPOajF+rKRa8ShgEze+ZBwpXI6BttMastcwJDNmIgYt366yKgsFJ5dkMCR71byYZB5lEvmTnBllR0FMnh9Cuegp/zcybpehgbvLD3Rhg+i8p+Ms4Zci1oEfOiodkXPtVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sP8zomlI6+RZLbBTLmxVuJ+3J5i6YfjhWoQlVOoCnRc=;
 b=JMDh5aJ8aK6BWQ+nHacDEgvflxq2VXb1Y7ZxUXAYlZvp4UqMw+lp3dMXmDUEQWqtpv/oaqEO63pylUPZN59OaFh+lQwItVlLv+CIEEHS8V+qWXYjjY8aVUovRLD0ZNZXToSGFdLlH898XYM1ZFiIo1Oqh/RoOKbgsOTORu6bDeH2ut04P+BnrMMeHSz+M/8oKUZOvrYaxcMEygOI7gl4edOr4EWLgJ03pB1W361an4d+Vyn81/c+W1iGfRl69idxTwUJNMfIHr0EJANzDZ1OveStJvc1Vny5lzNbGLUyGZP1k/OgkNheCGrMi1i0X2mZTW/fOajYqeD/Fldii9Arbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sP8zomlI6+RZLbBTLmxVuJ+3J5i6YfjhWoQlVOoCnRc=;
 b=M/joJ3TM82ynz2uTsPsowEBDe6ScJ0hsLZlr2VGUUfio9KMd9oqhM4izeQ5GzWMvt/uaYvcKXK7l8kgUvMQ5EaC/5U1R0cvIrgqgfuMdwlB7rbRPGfk/1JbvN59eq35R44L430JbzOc2YzJW5B9kui2jA1PnxtKvPISnP5ED4kHFxLltsD28xfC3SD5Fb5W0CMmP3dew1u0pfUoULVDXpvbeayP1IZ7DH5KWuW3doGEplQVT7uSRULn5wEzjeNdh/c54vfqqRfFGUi3MZaaYkWFuv96141tLkY9KqOMX1MqcShsWIh/8cwfML0xaFli4KQkNgbEhrvWQxp72F2uMGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SAVPR12MB999144.namprd12.prod.outlook.com (2603:10b6:806:4e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 06:05:42 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 06:05:42 +0000
Date: Tue, 1 Sep 2026 08:05:31 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
Message-ID: <apZrKweoy6uej0Q-@gpd4>
References: <20260831181800.1668646-1-arighi@nvidia.com>
 <20260831181800.1668646-2-arighi@nvidia.com>
 <f5d625d0-3b94-407c-8f64-793df9590f03@arm.com>
 <apX1j6srdTcFLZOd@gpd4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apX1j6srdTcFLZOd@gpd4>
X-ClientProxiedBy: ZR0P278CA0051.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::20) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SAVPR12MB999144:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c85194-e1e4-47bb-5db6-08df07ef0dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|3023799007|10067099003|11063799006|4143699003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	edsWU8Yj5ZN+RYp6+stJZsxBYsavjLPHu3+OjpWgr3xzfSc9jRq99Gh7sz6WTVVuDmwOkiKOzAAu6QYWhL6mjBmprfZleyHFzEKEbG4pk6RqNddHU87ryQYidSVI2PdajPlYq3SW+XUZLumSSNAS8r3aUq3jInLnRU+TpYH5hZ77Ely5k1h3CpeGE38fU5pMq5H/qkp0O7uAB4FPAxvAvNVQ3aTOF7uvwF0hg9ksWd4X4UrUFoKK4I9yFYttkJrgZuxSazk1C7j7IjYhS9cZA6hFwx9i8OCv1Um6sLg00J2Qni1pBg5omT94CYvGnn4DgYOdT26XQSA+O/be5rr0Y8D34lV4gPMQLof+Suo4FhvHAmbqEdkIGEM6qKB9xCAnwo0nMTfKITEBsr4mTdGnD9c5PvcfQNN0qOl7quTBAMncIGe6yZ4lYTxmNDWcbG5RVPRCqdvTY+DwML1xwBOrZqEOYfmsAzM+x7clQMBuPyY436g1Ac4R+YfAarIqc6LGLnEEuCVAtGU9uQP+6VLK1/GsJKDZBtKg/Jv7IK7K/Jr5LoD9FE6X+Kr+IOaIfABJZ4zfbgcMkn0tiE/0rHsygcZxjJWOeJMhY3apfW0aveAOZM4bpjJT4VLwFKF6wyymTw1wJ5DyqdqTWzSVH3Cy2kevfEPLG30seFfbCW5JFTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(3023799007)(10067099003)(11063799006)(4143699003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/VOgOIbF4kd5XxFadoeLZnH3cNWx3rv3iXZY4QYg0YSzY6e9vQacivOivSzc?=
 =?us-ascii?Q?4NU14Y5OVSEyVAIoVQjEWa3ufC72jlCIsRmBZYdV4E7QM+TpypzZJEUYFCwu?=
 =?us-ascii?Q?O+F/qrdoggrgr1NXPFeRsoFekDMDhNIV4rgJ8Lkf1g02zpvZPVWCF91BX95X?=
 =?us-ascii?Q?9SFYM3m1bcXVG+26rqwNWuXUMzOoPyq/D9Njy2wUYI6DHR481ZZPXleWhfqc?=
 =?us-ascii?Q?zBhqjEMUR+/ll97E+bMoVyC2tArqM2T/7XU/h9LcHHVarG7I+GHacbxe3u3j?=
 =?us-ascii?Q?X3NaEQyj9P0NRxVE7v89Wnq5OmtFsEtRXy31tLcIu2H1cL1QklgskylOYkmZ?=
 =?us-ascii?Q?Qbrg78phkKCinMIPeXjkec/xCGkDz4ebWobv3zcM3kOkDaw6SGBzf8OQQHXM?=
 =?us-ascii?Q?n58hM6RkICq2nJqlfnvSGp+Fud8KLnGC3jKE+Rw9vga/ZqsnnZwvtU1qkJQW?=
 =?us-ascii?Q?3SlLGuBvi3b7Mb50TYEI5j2dr2zSBjF76Ft3kbDQ2kmjV4P53c/KphArnE4M?=
 =?us-ascii?Q?zjdcuT8rSCQzZagVQ/wMKicePtReQNuEMvb+l8YygOrlyDFwGo54ut8rjNrt?=
 =?us-ascii?Q?w+6KcwuN5SAfstRXxyLHtybK7WOGFpp7zyDF065kz1WWglxwdsvfexFNw0q8?=
 =?us-ascii?Q?ikdLn9dDqDPC7pDVAw+IIEDEZfbRuVVoniysLLbVMYHJq3AwgdLyN37orOFh?=
 =?us-ascii?Q?lZoauBXveirjJQZ+tkjpFfuLof9ARdvI3v7+6ZJI94N59XAoSpL4vMtE4HW+?=
 =?us-ascii?Q?tlbCcxEuqTQz1RuqHgdPdMHhnXZcfBCvZLmRs012hGayReZ43oQ4LH2EXrH/?=
 =?us-ascii?Q?617ss2Gvc9xX5uHemSppXr9uKUfcj1OpWIdCvYXN3iZaU32b/xyBt/Lwp23r?=
 =?us-ascii?Q?DEHhNODRWSrDhPjZ8Ldl7yr4/BuPoIB+MNt9M8kKhIignUI6sFtyIEvoJ+0x?=
 =?us-ascii?Q?8xIJApzhrq4fvotKhXMHbypNtfYMvcxyxW2T+/uDhsXzNQpYQV5IdRfxuFvA?=
 =?us-ascii?Q?LlZui1uUlFH+e1PN36GU9mwyOg0DZZhkFTmWan1sKylBUr+BvcIja4uswqxP?=
 =?us-ascii?Q?QRGnfrQpsU6RTOndwZzHLHchQTBtR54wvzXsUomg2crGsLLcKkZXAiHPx739?=
 =?us-ascii?Q?R+gFWqIR5VMn58/1g6XOfs9gsPf4xQfVFX05R6IccYn1v2jIhwGZROxuT/go?=
 =?us-ascii?Q?4mXlyDYJs7YHVPmpq5Q2DbjZRaBm7XqqVWsKpc8p4/UxDcVDPrpYROPQ3Oau?=
 =?us-ascii?Q?ApvwIxKdqb8wDq28pLyz1P2d2p7vA0AgYRKYbFbk7FcaHEDqwHn/Kmv5ofh/?=
 =?us-ascii?Q?whuYpOCOhOqY7/Q+591O3rdw3VH+wGAR2IxXHD3qg12oO5VjfMNqNmtwojwJ?=
 =?us-ascii?Q?xLT1ztE85IITsauRWdLi/sFtjdsOjzgAjBG4lZGvGdYvA+/qelrXnRedHvFC?=
 =?us-ascii?Q?7pbFcD7JF7A0mLjiW79Aa+wx8KCdgQ2eoQ3DxXK84w3wGmb9TZw8r6BQR8un?=
 =?us-ascii?Q?tJYvFsbiQwVjsepvjWAhZrHZw/OqYNy4v9JuN2GYFIpdQHbCY0uNbNY7bFOW?=
 =?us-ascii?Q?55Kaj8fYrzXeOrN8We9KAP0s8Ymmn2AePz/2X2MmAylYP5Ac8gigdOn9Dm/y?=
 =?us-ascii?Q?HgiW5oYDbME/TwsZWpWxSBZ/qNV5SOc9HkABYhPDvE5k4e1Y6lFQKdhppZGh?=
 =?us-ascii?Q?BBIk4TaaaREGWgbNF5rQ3OJe+sNUAZ5HWiOp4H+f+AaaOcflLLfWqcH96CK6?=
 =?us-ascii?Q?rM0go4U3xA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c85194-e1e4-47bb-5db6-08df07ef0dd7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 06:05:42.4088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1Z/s6gdv2RwBf8TUS+zmm00CBJPZ1+tM5gQWWKO3mwUzHOwVx9tnNXb7i4l2WIVb9y9qybwPkdkYk+h4xTjUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999144

Hi Christian,

On Mon, Aug 31, 2026 at 11:43:54PM +0200, Andrea Righi wrote:
...
> Combining the priorities is a valid experiment, but I'm not sure if it
> completely solves the problem by itself, I'll give it a try and share the
> results.

I did some tests comparing this asym-capacity+asym-packing approach vs the
combined-asym-packing approach (tested patch for the combined-asym-packing
approach is at the end - patch 2 is the same).

Policies tested
---------------

combined-asym-packing:

- combined capacity/PE priority
- SD_ASYM_PACKING at all topology levels
- SD_ASYM_CPUCAPACITY disabled

asym-capacity+smt-asym-packing:

- capacity-aware physical-core selection retained
- PE0 priority applied only in the SMT domain

[ Both policies include the idle-selection fix - patch 2 ]

SGEMM throughput
----------------

The primary result is ten repetitions of the exact 88-thread command provided.

Metric                    combined-asym-packing    asym-capacity+smt-asym-packing    Difference
Average throughput        9.864 +/- 0.180 TFLOP/s  10.094 +/- 0.065 TFLOP/s          +2.34%
Best throughput           10.194 +/- 0.193 TFLOP/s 10.374 +/- 0.065 TFLOP/s          +1.77%
Minimum average run       9.575 TFLOP/s            9.968 TFLOP/s                    +4.10%
Maximum average run       10.057 TFLOP/s           10.204 TFLOP/s                   +1.46%

asym-capacity+smt-asym-packing averages 10.095 TFLOP/s versus 9.920 TFLOP/s, a
1.76% advantage. More importantly, the run-to-run standard deviation drops from
180 to 65 GFLOP/s. combined-asym-packing can reach a good peak, but it does not
sustain it as reliably.

Thread scaling
--------------

Three runs per point, average throughput:

Threads  combined-asym-packing    asym-capacity+smt-asym-packing    Difference
22       3.065 +/- 0.002 TFLOP/s  3.068 +/- 0.002 TFLOP/s          +0.08%
44       5.849 +/- 0.064 TFLOP/s  5.888 +/- 0.022 TFLOP/s          +0.66%
88       9.975 +/- 0.128 TFLOP/s  10.062 +/- 0.107 TFLOP/s         +0.86%
176      10.695 +/- 0.004 TFLOP/s 10.704 +/- 0.012 TFLOP/s         +0.09%

The difference is specifically most visible around the intended
one-thread-per-core operating point. At 176 threads, where both SMT PEs are
used, the policies are effectively tied (as expected).

Cyclic wake-up latency
----------------------

Values are averages of three runs. Percentiles are the mean of each run's
reported percentile.

Condition  Metric  combined-asym-packing  asym-capacity+smt-asym-packing
Idle       median  6.433 us               6.398 us
Idle       p99     12.753 us              12.494 us
Idle       p99.9   18.324 us              19.025 us
Loaded     median  5.114 us               4.500 us
Loaded     p99     12.398 us              12.759 us
Loaded     p99.9   24.240 us              20.954 us

Idle latency is essentially tied. Under concurrent 88-thread SGEMM,
asym-capacity+smt-asym-packing improves median latency by 12% and p99.9 by
13.6%.

The worst observed loaded sample was 579.5 us with combined-asym-packing and
74.5 us with asym-capacity+smt-asym-packing. That is only one outlier and should
not be generalized without longer runs, but it favors
asym-capacity+smt-asym-packing.

Concurrent SGEMM throughput was tied: 9.902 versus 9.899 TFLOP/s.

Scheduler microbenchmarks
-------------------------

Lower is better for these results.

Test                       combined-asym-packing  asym-capacity+smt-asym-packing  Difference
sched pipe, processes      4.478 us/op            4.446 us/op                     -0.7%
sched pipe, threads        3.618 us/op            3.625 us/op                     +0.2%
SMT pair, CPU 0/176        1.815 us/op            1.813 us/op                     tied
Separate cores, CPU 0/1    4.388 us/op            4.311 us/op                     -1.8%
Unrestricted node 0        4.284 us/op            4.385 us/op                     +2.4%

These simple ping-pong results are effectively tied.

combined-asym-packing did materially better in the broader 160-task sched
messaging socket tests:

Test            combined-asym-packing  asym-capacity+smt-asym-packing
Process/socket  0.669 s                1.039 s
Thread/socket   0.653 s                0.989 s
Process/pipe    0.296 s                0.337 s

This suggests that combined asym-packing can help some highly communicating,
oversubscribed workloads by changing how runnable tasks are packed.

Futex
-----

Test             combined-asym-packing  asym-capacity+smt-asym-packing  Difference
Wake one         0.1695 ms              0.1800 ms                       +6.2%
Wake all         0.1734 ms              0.1693 ms                       -2.4%
Parallel wake    0.0430 ms              0.0332 ms                       -22.6%
Hash throughput  4.052 Mops/s           4.064 Mops/s                    +0.3%

Futex hashing is tied. Wake results are mixed, with
asym-capacity+smt-asym-packing notably better in the parallel-waker case.

Conclusion
----------

The combined priority is technically workable, but combined-asym-packing does
more than express the PE0 preference:

- it replaces SD_ASYM_CPUCAPACITY with asym-packing across the Olympus topology.
- It changes placement policy for unrelated multi-core and communication-heavy
  workloads
- It still requires the idle-selection scheduler change
- It produces lower and substantially more variable throughput

The asym-capacity+smt-asym-packing seems to solve the specific spatial-SMT issue
on Vera, retains the existing capacity-aware semantics, provides the best
target-workload result and has no general latency regression in this dataset.

combined-asym-packing patch
---------------------------

The following is the combined-asym-packing policy patch tested in this report.
The idle-selection patch was present in both test kernels and is therefore not
included in this policy delta.

---
 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/smp.c           |  1 +
 arch/arm64/kernel/topology.c      | 90 +++++++++++++++++++++++++++++++
 include/linux/sched/topology.h    |  2 +
 kernel/sched/topology.c           |  8 +++
 5 files changed, 102 insertions(+)

diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index b9eaf4ad70850..edc1c59b3448d 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -18,6 +18,7 @@ int pcibus_to_node(struct pci_bus *bus);
 #include <linux/arch_topology.h>
 
 void update_freq_counters_refs(void);
+void arm64_init_sched_topology(void);
 
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_scale_freq_tick topology_scale_freq_tick
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a117..0135ac4eea8bd 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -443,6 +443,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
 	hyp_mode_check();
 	setup_system_features();
 	setup_user_features();
+	arm64_init_sched_topology();
 	mark_linear_text_alias_ro();
 }
 
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f1..42a5c0d4f5d2e 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -19,6 +19,8 @@
 #include <linux/init.h>
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
+#include <linux/sched/topology.h>
+#include <linux/smp.h>
 #include <linux/xarray.h>
 
 #include <asm/cpu.h>
@@ -44,6 +46,94 @@
 static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
 static cpumask_var_t amu_fie_cpus;
 
+/*
+ * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
+ * two-thread active mode, with resources partitioned between the PEs.
+ *
+ * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
+ * mode. Combine that preference with the normalized maximum CPU capacity so
+ * asym-packing also orders physical cores by performance. Firmware does not
+ * currently describe the PE preference, so detect Olympus by MIDR until a
+ * firmware interface is available.
+ */
+static bool olympus_prefer_pe0 __ro_after_init;
+
+static int arm64_asym_packing_flags(void)
+{
+	return olympus_prefer_pe0 ? SD_ASYM_PACKING : 0;
+}
+
+#ifdef CONFIG_SCHED_SMT
+static int arm64_smt_flags(void)
+{
+	return cpu_smt_flags() | arm64_asym_packing_flags();
+}
+#endif
+
+#ifdef CONFIG_SCHED_CLUSTER
+static int arm64_cluster_flags(void)
+{
+	return cpu_cluster_flags() | arm64_asym_packing_flags();
+}
+#endif
+
+#ifdef CONFIG_SCHED_MC
+static int arm64_core_flags(void)
+{
+	return cpu_core_flags() | arm64_asym_packing_flags();
+}
+#endif
+
+static struct sched_domain_topology_level arm64_asym_smt_topology[] = {
+#ifdef CONFIG_SCHED_SMT
+	SDTL_INIT(tl_smt_mask, arm64_smt_flags, SMT),
+#endif
+#ifdef CONFIG_SCHED_CLUSTER
+	SDTL_INIT(tl_cls_mask, arm64_cluster_flags, CLS),
+#endif
+#ifdef CONFIG_SCHED_MC
+	SDTL_INIT(tl_mc_mask, arm64_core_flags, MC),
+#endif
+	SDTL_INIT(tl_pkg_mask, arm64_asym_packing_flags, PKG),
+	{ NULL, },
+};
+
+void __init arm64_init_sched_topology(void)
+{
+	if (!IS_ENABLED(CONFIG_SCHED_SMT))
+		return;
+
+	if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_NVIDIA_OLYMPUS)
+		return;
+
+	if (!topology_core_has_smt(smp_processor_id()))
+		return;
+
+	olympus_prefer_pe0 = true;
+	set_sched_topology(arm64_asym_smt_topology);
+	pr_info("Enabling capacity and PE asym-packing for NVIDIA Olympus\n");
+}
+
+int arch_asym_cpu_priority(int cpu)
+{
+	int priority;
+
+	if (!olympus_prefer_pe0)
+		return 0;
+
+	/* cpu_scale preserves the ordering provided by CPPC highest_perf. */
+	priority = topology_get_cpu_scale(cpu);
+	if (MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0)
+		priority *= 2;
+
+	return priority;
+}
+
+bool arch_asym_cpu_capacity_enabled(void)
+{
+	return !olympus_prefer_pe0;
+}
+
 struct amu_cntr_sample {
 	u64		arch_const_cycles_prev;
 	u64		arch_core_cycles_prev;
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index b5d9d7c2b8add..dd40b8f466ca0 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -50,6 +50,8 @@ extern const struct cpumask *tl_mc_mask(struct sched_domain_topology_level *tl,
 extern const struct cpumask *tl_pkg_mask(struct sched_domain_topology_level *tl, int cpu);
 
 extern int arch_asym_cpu_priority(int cpu);
+/* Return false when the architecture represents capacity through packing. */
+bool arch_asym_cpu_capacity_enabled(void);
 
 struct sched_domain_attr {
 	int relax_domain_level;
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227d983a7..8ccc734efd748 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1682,6 +1682,9 @@ asym_cpu_capacity_classify(const struct cpumask *sd_span,
 	struct asym_cap_data *entry;
 	int count = 0, miss = 0;
 
+	if (!arch_asym_cpu_capacity_enabled())
+		return 0;
+
 	/*
 	 * Count how many unique CPU capacities this domain spans across
 	 * (compare sched_domain CPUs mask with ones representing  available
@@ -1709,6 +1712,11 @@ asym_cpu_capacity_classify(const struct cpumask *sd_span,
 
 }
 
+bool __weak arch_asym_cpu_capacity_enabled(void)
+{
+	return true;
+}
+
 static void free_asym_cap_entry(struct rcu_head *head)
 {
 	struct asym_cap_data *entry = container_of(head, struct asym_cap_data, rcu);

Thanks,
-Andrea
