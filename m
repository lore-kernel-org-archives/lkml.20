Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011032.outbound.protection.outlook.com [52.101.57.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EEA3246ED
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166621; cv=fail; b=k1z0m2GyCPiIINWZ4QndHgoqW4h+K4UldgOVJ/yj7W29ZKJNtrzwy0s0vk6w/J2r/2pfvKdUVrQxwl6HGoeI+NMkRsFEvg97BmEgHK4wsFypkpuvq2QFzz+7TVc4EzAC5pttthl6tT0HHtzyZuSXjGRbYu9XVyPqt2T01h9TiRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166621; c=relaxed/simple;
	bh=MlwJuh0LElInzsU1ujn5h8Igisc3WBxMV2QaDDvl8T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RwGOYkaM/LE7XJFHjUDPzjfWm1XneIBGk8UiZ83LaNUeczXX5FzzsDwS5MW5yX1bYnmeO1bAyFID0EJoA+hwkdcNBHon/FH54nMckXf0+Y+Kz4aY+I1coS4hp6T/XEMfLAsKhyzNMBHA0p/Fd6NjpMRB66CbwZ+YrxavgzcHyZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JEsr+c0g; arc=fail smtp.client-ip=52.101.57.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JEsr+c0g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jb6Gtte9qf8yFZE/Te8OZzCAKgMwbPYRDhtZm8CogoFzB+KaDSXtZ4VInoX6zgBcr12cGVeqwkI5i1ZWd9fzc0UBUx0NSIoqJk05aH7ku0E9y2Fcd60Hsw3+GNwjolZsOkk+spSAgU/mn3y4PYttVG45hv4fK2TVXS45NJhvInbAjUAxXH6jcyHa7zd9K2V0/DCBkboXmFm+WBnZiTKFfRQVT1s8KVaQ/QVCGzfaRFvUWsH1KR58b3VKS9kt3Ch6bw5AWfiQHGCDhb5fe3RVIF5Wqd/FCvkyEgMLfx0UICndlu0Zn+JswV9bUV3G1zKILhjUum0qRdGfyztgFrPkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XX+clRBz5GaAQeBtYMP6ou1Q+TKEB9wvnDCsGKW4NCU=;
 b=s7ar00kUQcitgpIV+cc+5eYCt6CY2PoDU1ccg3EPXcejvKyPL4nEAipviczhHi/RtXYIMw+EDfrK0B8iBA1Wmf0WNDHrwyddeorBD3uIr/QLKGAUwYrx5wQ5rTIFAKqvdOH4kE+WkhOBZEe+R3g0Fd8DVa5J4Vb7GyyQgqndLcnoyjrS/ul4RTPF7CyiG4ir514Mru+ionmIM1Ml154auNAPmW9PE3o1qfJPCmoHp3ZCEE0NJziwEma/N64aYyWba07JoGv38G2bmtKLgFDv95L3SyHibppLXQELNRZUTP5BS3pKbj0Y5MQsQpICGbdPtZNnXZOA2wPmOigVijFn/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX+clRBz5GaAQeBtYMP6ou1Q+TKEB9wvnDCsGKW4NCU=;
 b=JEsr+c0gC8psBTm3Pv/4F9DiUlmO1v7E3CoxpZy/SSFufzLGwZsv0rkKdBWnlGUga/utHrM5UtFgs3d7sAMRY4dcEl1B167PZ0b0iL47lITF77VteQGW5nX3vPWQy+v3RxkLxMf+/GRn3KdnYAYibtYFxTSWuXvOzf7zn9JoYILbgYvNxyCDUpr2c1fn64F6kdcgvxb1mYgl6/iXuzk7/h30/VqUYMOwFOzl/Lr+WIE8lzF9uB1klTuBpkILFDhLRClW6T53g0d3nMv2P2JJ1nXiaWAVloF8Hw0lN94vfJ2XCQmD5MOA0jONXU+Gk7Ahhc2dVlEl80OpXCNmlDi2cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by LVUPR12MB999138.namprd12.prod.outlook.com (2603:10b6:408:39e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 22:43:30 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 22:43:30 +0000
Date: Sat, 12 Sep 2026 00:43:19 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
Message-ID: <aqSEB2N_NQbBVab6@gpd4>
References: <20260908082345.103087-1-arighi@nvidia.com>
 <c92baaa9-1c1a-4f1e-903e-7b98ec9f694c@arm.com>
 <aqEKCCSY6QetqOCB@gpd4>
 <aqFTbqOVW8ph3Bux@gpd4>
 <66610fa3-982a-45f0-b39a-34f81598ad18@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66610fa3-982a-45f0-b39a-34f81598ad18@arm.com>
X-ClientProxiedBy: MI0P293CA0002.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::7) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|LVUPR12MB999138:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b2c989-ada1-43ef-414e-08df10561a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|4143699003|6133799003|22082099003|18002099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	nuwiC5dbKoZ0UsRmp+y8+1IIDr6cLKV+ML3MKkSWAv6TScv1n+rjsBmigfiVX67zY+5qVVQv0FlgPgCIVjmtzoPi7+/cLu9l8V0943XL0y4iey9KkHo3naGj6dK6e+FSSNCVR63ZO/2mUsrhEGznFpXxKzkmdX5nUeI1ETtMMJgvUCZAAhvu8fkHSkTWII8vU8rn64FObPZj8kCgMEZNW4mOTXBZvArnYBDqgwWt3YTc3OoZ5hxSWvODYBzGwXydFq5FYHT9fiRThfj2s283IIkLMaUE3/bK2AtEqwRcd/nCoAhuYYXhK7gbfJt6uzFrdohFJ7/ZViFW6+3DDdfqafZ0JDWqagdk4Se5g+xDnHu/PEZqV1JyoT02twFXEsHoPIApi+Gf5JU7xNhVP/p/jcSYW/UDts1bGn5zO0yT5EDCvGP0c1NU7pCbC+PjlZdJNg6qhV3FfjYu4uGKTREHSdecctqcgXAZ7EaAVCHbK+/iFJazxsGIFFUcXbk+q+jr6pVi1mBqU2ol4a7/nrY27woNXD2+pFiiIWwDo3FSvAG6ZPvBqOiBl7KGlhLkGByzuPnX+EvWOrFiI5sfk3lbBokDyKa8I4RA9xW67LLgwi91R9wLJpaNhLnPEB6tQBoUa3mzhKeG9fF9b9CuB2I2GRt3OnU3G22hJXTZvJrmb4o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(4143699003)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R2ORm8rscIRfCnZAKmie+bEgCArqkiGPzZRsZb7HWNSd5W8y2t9jfZyJhNwz?=
 =?us-ascii?Q?eCBcQgtuz9oz3lSDEuZ69YMLutzMOVfGiMXqPVs/NTlMQpI5hMbWY1Hu0Gyq?=
 =?us-ascii?Q?U2287or+mItGgOoiFK/ZuXpSrVv2t/rIrf2/CunBCf0wPusUuzsADtQueTIV?=
 =?us-ascii?Q?88h2p1ki8dZLeQDMlL6v4SVVSyvhWVQ5KuJ0iVeL4R/4ly1/TxsrKIF/w7tq?=
 =?us-ascii?Q?GO5Ib+cDMzeMSo9T/dISTsK2DF+C4qnJ3+07WkexgqSKzu1ZbRmh613qXlrD?=
 =?us-ascii?Q?SgwXabHGgvXNpOBxnUOwql7W0cgmUlNdVXdIS3zJM4jdMLcilGMRTgbEKTcc?=
 =?us-ascii?Q?Sm0z00acG03SAvKtICI5Vmlja9Ja6CIxBF2Lq+EL5S3ZrLPgSFyYxcZGhOmL?=
 =?us-ascii?Q?/p4sk9BNL1FU3ZX3o4teDmKBKnJ+olmaKuKvajpcNAdypovBFDim6lO6JPeh?=
 =?us-ascii?Q?TVs8XDCiF598fN6TQUcDnvCJ9UaRe0/RyJEjqNJigk7wSbtoW8HyPmEAU9q2?=
 =?us-ascii?Q?R46LM6huMGXO9JZDt5gM2uYZhyKV9BFjXO3iigiCDScEFpUSVyKEghkRHdGa?=
 =?us-ascii?Q?BZCJULVQ2svJW6X16Zg7G0Tn3fY5SlbY72Q7RaH9wbvxLKx8Irf/EDdC0za6?=
 =?us-ascii?Q?SQPcke+Zabpfh7Y57a26tLjpYMJHZibMQ/plcguKWXbVvXAmfKgroALfRfix?=
 =?us-ascii?Q?K1KRBRJkvX1wqIc/S+H4PcqruBkCfuWPlDzzkXVm1yQaiZcZnTb83Ma89llf?=
 =?us-ascii?Q?wY9a7aijVWEcX1BhQE9ZuuxpaAX0V5wqNSttThxfxcGMBUNUUZG6fSsULTbL?=
 =?us-ascii?Q?oA2XtY3uQz2zEIWYjUqgnNzWCj65R9yCz2K5Os/rQ3CQ7tRy47MzJ5m8RInh?=
 =?us-ascii?Q?Koulj4Q0ATknl2dHXnEFwQyi4rm85ADwCJ7ddG2kZi2QrDaMOqta3o/pTo/E?=
 =?us-ascii?Q?bBMV0HuYFLwSZvEGvW1wEsT8sI4OBbIAw9zJGwGfRZpSU5WY5pfqOtL2h/sy?=
 =?us-ascii?Q?2MUS7lEyKS1jiSohwGCAcGUbMReiRbdtetc5X06CuegMnDUWvBUxBJ65aVh0?=
 =?us-ascii?Q?IhuKjkHFH5JBSOVqOOBfqd0/VQSuCEBFE+zF1t0S4IoAaieHowMkZRDMV5g+?=
 =?us-ascii?Q?ugZOdbeAjHNLSuEXYs66N9At4YusB7WUYYQ+TfykyCfOEYLgsBs5z1pO1Kn7?=
 =?us-ascii?Q?QVWaHE9EM59ScrCl6L8faILwfcytrRuWBhWZc/pcaiJ4GgZDmTUkdPbaghNX?=
 =?us-ascii?Q?KhLuFDhGMrkfZdauhnBh98Uvl74cX9mXryJrHJ3CnxK//JhXhSO55cYeyUUD?=
 =?us-ascii?Q?O/7ff4gVw4Cn5ggNp7LoNyws5RszZgM+AyhmRxfYJAdY/a9frUQp6Q+VshIh?=
 =?us-ascii?Q?fLnqPu6TPwl64bRSWyBM4EMX7toWi0qAcakDVrZMmLOshoJQ8gbioyhLs9Ip?=
 =?us-ascii?Q?IFcgk3dVsQTNzQjMIfhJ7ekzeotDNAPymhrR6DWWxtvI7XmqQEzm9wWBTW25?=
 =?us-ascii?Q?at/bNzElCxyNc0oI/rd9LixgAGVPSO2b2AE5CG6MWEJT3kw86BqRI0Rfha5V?=
 =?us-ascii?Q?7W8xme9DiAv2DDIiCKMIh5W4sWx9MPGK2KijtnQRIrYb4+LpN6v5qqOUUjK0?=
 =?us-ascii?Q?3YzdSM9w303uPPkksZV9Uf/YZEMdKpDZz3UHkvsQyWP8uxt0osQgp/99cF0h?=
 =?us-ascii?Q?9AQAGLl8hC4V8SLAz+GQgfftCjHKzOy/zYISJbPSKnXXIWji1wOZyu7i/7e7?=
 =?us-ascii?Q?sNTtxt+N9A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b2c989-ada1-43ef-414e-08df10561a1b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 22:43:30.4157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpbriF41FzUy6xhEedK8U7WeaLS6Xo6tDw0fY+Pv8FAo/KLwIEr28j1Ck1YW+FfcaM1Z2b2t4hGVZjABE+Xnrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999138

Hi Dietmar,

On Fri, Sep 11, 2026 at 03:53:59PM +0200, Dietmar Eggemann wrote:
> On 09.09.26 14:39, Andrea Righi wrote:
> > Hello,
> > 
> > On Wed, Sep 09, 2026 at 09:26:09AM +0200, Andrea Righi wrote:
> >> Hi Dietmar,
> >>
> >> On Wed, Sep 09, 2026 at 09:20:35AM +0200, Dietmar Eggemann wrote:
> >>> On 08.09.26 10:23, Andrea Righi wrote:
> >>>
> >>> [...]
> >>>
> >>>> The series was tested on a two-node Vera system using an 88-thread
> >>>> single-precision GEMM on the 88 physical cores of NUMA node 0.
> >>>
> >>> Can we use 'OpenBLAS benchmark/sgemm.goto' as an open alternative for
> >>> your NVIDIA internal single-precision GEMM benchmark?
> >>>
> >>> IIUC, you used it for the 'Prefer fully idle cores for NOHZ balancing'
> >>> work: https://lore.kernel.org/r/anIq6pU5KXTTFCDN@gpd4
> >>>
> >>> If yes, I assume you would run something like:
> >>>
> >>> export OMP_NUM_THREADS=88
> >>> numactl -C XXX --membind=0 ./benchmark/sgemm.goto 16384 16384 16384
> >>>
> >>> Essentially you want to show that those 88 compute intensive tasks each
> >>> runs on his own core alone and so you get a higher TFLOPS value.
> >>>
> >>> [...]
> >>
> >> Yes, sure! I'll re-run some tests with that and share the results in a bit.
> >>
> >> Thanks,
> >> -Andrea
> > 
> > I repeated the tests using the latest patch series [1] both with OpenBLAS and
> > NVPL (internal GEMM benchmark).
> > 
> > Kernels and test configuration
> > ------------------------------
> > 
> > mainline: Linux 7.3.0-rc2
> > smt-pe0-prio: Linux 7.3.0-rc2 + patch series [1] applied
> > 
> > Both tests used:
> >  - 88 threads on NUMA node 0 (CPU list 0-87,176-263)
> >  - performance governor with cppc_cpufreq
> >  - same OpenBLAS binary and NVPL container image
> >  - metrics over 5 repetitions
> > 
> > Results
> > -------
> > 
> > Delta is (smt-pe0-prio / mainline - 1): higher is better.
> > 
> >  +---------------------+-------+---------------------+-----------------------+--------+
> >  | Throughput          | Runs  | mainline TFLOP/s    | smt-pe0-prio TFLOP/s  | Delta  |
> >  +---------------------+-------+---------------------+-----------------------+--------+
> >  | OpenBLAS            | 5 / 5 | 7.11876 +/- 0.06734 |  7.34669 +/- 0.01936  | +3.20% |
> >  | NVPL                | 5 / 5 | 9.64742 +/- 0.17311 | 10.29695 +/- 0.01786  | +6.73% |
> >  +---------------------+-------+----------------------+----------------------+--------+
> > 
> > Hardware statistics
> > -------------------
> > 
> > ST = single-thread mode
> > SMT = two-thread mode
> > 
> > Delta is (smt-pe0-prio / mainline - 1): lower is better.
> 
> Thanks for the test results. Good to see that we have an openly
> available benchmark for this.
> 
> > OpenBLAS:
> >  +------------------------------+----------------------+----------------------+----------+
> >  | PMU metric                   | mainline             | smt-pe0-prio         | Delta    |
> >  +------------------------------+----------------------+----------------------+----------+
> >  | ST-to-SMT completed/run      | 10145.6 +/- 1835.2   | 1981.6 +/- 94.3      |  -80.47% |
> >  | SMT-to-ST completed/run      | 10342.6 +/- 1853.6   | 1946.2 +/- 93.1      |  -81.18% |
> >  | ST-to-SMT transitions/s      |   845.5 +/- 152.9    |  176.9 +/- 3.4       |  -79.08% |
> >  | SMT-to-ST transitions/s      |   861.9 +/- 154.5    |  173.7 +/- 1.5       |  -79.84% |
> >  | ST-to-SMT latency cycles/run | 15.785M +/- 3.315M   |  2.477M +/- 0.090M   |  -84.30% |
> >  | SMT-to-ST latency cycles/run |  9.545M +/- 1.762M   |  1.815M +/- 0.047M   |  -80.98% |
> >  +------------------------------+----------------------+----------------------+----------+
> > 
> > NVPL:
> >  +------------------------------+----------------------+----------------------+----------+
> >  | PMU metric                   | mainline             | smt-pe0-prio         | Delta    |
> >  +------------------------------+----------------------+----------------------+----------+
> >  | ST-to-SMT completed/run      | 7771.0 +/- 1312.2    | 2162.6 +/- 137.8     |  -72.17% |
> >  | SMT-to-ST completed/run      | 7759.8 +/- 1352.2    | 2135.2 +/- 108.0     |  -72.48% |
> >  | SMT-to-ST aborted/run        |    0.6 +/- 0.5       |    0.2 +/- 0.4       |  -66.67% |
> >  | ST-to-SMT transitions/s      |  777.1 +/- 131.2     |  251.5 +/- 4.8       |  -67.64% |
> >  | SMT-to-ST transitions/s      |  776.0 +/- 135.2     |  248.5 +/- 5.8       |  -67.98% |
> >  | ST-to-SMT latency cycles/run | 13.285M +/- 3.742M   |  2.971M +/- 0.296M   |  -77.64% |
> >  | SMT-to-ST latency cycles/run |  8.528M +/- 2.223M   |  2.287M +/- 0.126M   |  -73.18% |
> >  +------------------------------+----------------------+----------------------+----------+
> > 
> > Conclusion
> > ----------
> > 
> > The patch leaves both workloads almost entirely in ST mode and substantially
> > reduces ST/SMT mode-transition churn.
> > 
> > Relative to mainline, completed ST-to-SMT transitions fall by 80.5% for OpenBLAS
> > and 72.2% for NVPL. This agrees with the throughput result: the scheduling
> > preference avoids repeatedly switching the active PE identity and allows cores
> > to remain in full-resource ST mode for longer intervals.
> > 
> > [1] https://lore.kernel.org/r/20260909062649.469633-1-arighi@nvidia.com
> I was able to run 'BLAS SGEMM' on ThunderX2 (ARM64) (SMT-4) on
> 'tip/sched/core' (base) and v1 and v5 (w/ small changes to get it
> running on THX2).
> 
> $ awk '/^cpu0[[:space:]]/{print
> $1;show=1;next}/^cpu[0-9]+[[:space:]]/&&show{exit}show&&/^domain/{print
> $1,$2,$3}' /proc/schedstat
> 
> cpu0
> domain0 SMT
> 00000000,00000000,00000000,00000000,00000001,00000001,00000001,00000001
> domain1 MC
> 00000000,00000000,00000000,00000000,ffffffff,ffffffff,ffffffff,ffffffff
> domain2 NUMA
> ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
> 
> $ numactl -H
> available: 2 nodes (0-1)
> node 0 cpus: 0 ... 127
> node 0 size: 64270 MB
> node 0 free: 62366 MB
> node 1 cpus: 128 ... 255
> node 1 size: 128599 MB
> node 1 free: 126960 MB
> node distances:
> node     0    1
>    0:   10   20
>    1:   20   10
> 
> ---
> 
> export OMP_NUM_THREADS=32
> export BM="./OpenBLAS/benchmark/sgemm.goto 16384 16384 16384"
> 
> (a) 8 cores/32 CPUs (hw threads)
>     $ numactl -C 0-7,32-39,64-71,96-103 -m 0 $BM
> 
> (b) 16 cores/32 CPUs (hw threads)
>     $ numactl -C 0-15,32-47 -m 0 $BM
> 
> (c) 32 cores/32 CPUs (hw threads):
>     $ numactl -C 0-31 -m 0 $BM
> 
> (d) Entire NUMA node 0 (unconstrained)	<-- !!!
>     $ numactl -C 0-127 -m 0 $BM
> 
> (e) 32 cores/32 CPUs (hw threads):
>     $ numactl -C 31-63 -m 0 $BM
> 
> (f) 32 cores/32 CPUs (hw threads):
>     $ numactl -C 64-95 -m 0 $BM
> 
> (g) 32 cores/32 CPUs (hw threads):
>     $ numactl -C 96-127 -m 0 $BM
> 
> ---
> 
> MFLOPS values:
> 
>        v5        v1        base
> 
> (a) 225349.00 227305.68 227246.94
> 
> (b) 376297.15 373908.56 380849.55
> 
> (c) 877144.86 867642.35 861639.57
> 
> (d) 868285.22 865953.05 861662.81	<-- !!!
> 
> (e) 868182.05
> 
> (f) 866835.49
> 
> (g) 867389.74
> 
> ---
> 
> So it doesn't seem to change much (v5 vs. base (d)).
> 
> When I look into the trace file then I can see that I have 32 benchmark
> tasks running for 10s constantly (no sleep/wakeup) so with 32 cores and
> 32 task, the SMT aware select_idle_sibling() (symmetric CPU capacity)
> should already place 1 task per core and then the tasks run there for
> 10s w/o migration. So I can't see how you're improvement can happen
> since the benchmark has tasks <= cores (32 in my case, 88 in yours)?

There's another hardware difference that may affect the performance.

PE0 is also more likely to handle interrupts and other per-CPU housekeeping
activities. By forcing the benchmark threads onto PE0, the modified ThunderX2
setup may actually increase direct preemption of the benchmark.

On Olympus, this placement is actually beneficial. If the workload runs on PE0,
an interrupt handled by PE0 may preempt the workload briefly, but it does not
activate PE1. If the workload instead runs on PE1, the same interrupt activates
both PEs and switches the core into two-thread mode, where resources are
statically partitioned.

Returning to full-resource single-thread mode is not immediate: PE0 must remain
continuously in WFI for 10K cycles. This threshold acts as hysteresis to avoid
repeatedly draining and reconfiguring internal core structures. Sporadic
interrupts can restart the qualification interval and keep the core in
two-thread mode well beyond the interrupt itself.

So I agree that, in the steady-state workload shown by your trace, with one
continuously runnable task per core and no migration or wakeups, there is little
for the scheduler change to improve. And considering that ThunderX2 doesn't have
the Olympus-specific delayed mode transition, I wouldn't expect it to reproduce
the Olympus throughput improvement.

What would be interesting to validate on ThunderX2 is probably just the
placement behavior rather than performance. With 32 SMT4 cores and four distinct
sibling priorities, I would expect 32 tasks to occupy all PE0s first, 64 tasks
to occupy PE0 and PE1 on every core and then PE2 and PE3 as the runnable count
increases.

Thanks,
-Andrea
