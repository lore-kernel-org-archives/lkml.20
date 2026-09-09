Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010019.outbound.protection.outlook.com [52.101.61.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563C35632B4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957576; cv=fail; b=qP3x3WSOojhp/pF5Dy8M+U3JIlwM778yytB0Dpjrb033ssvokck3L1ge2yg0R1wX9SDQNzgtxXGSKuPgUAPwqP7bi3+Fj8PBZI9HBIO3f1YyCgYxRPRkPtEJixuRPD7Q3JWSlIklnkSMbqPK76BGSSVer6s1P4/YU4IXG3XcEIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957576; c=relaxed/simple;
	bh=f4geu+k66A8XTPi6MdwIVa1giE6rAVI2EtOgnq0avMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HhjbXaNK+2JMs2q5USUFEwYbyQ3ChBfHCcO1ij2aIxLixwZISuoaDgwxDDvvcAHtDt6UKavvqHouKdVd2yg1dRDF3WtO0CQon2bzONhBCYe5zQHdr4nVPq0eA0bS3bwm466Nyav6JV9BQe8k3yLvyEjuLDn9RybErUUk1vqIlaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IsJsuZJA; arc=fail smtp.client-ip=52.101.61.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IsJsuZJA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVZx1bLoESqG02kTjx8BqEvf13fEYy6G6lUgtU7qy6DwMGJTD4e0H8AXMZ/rnFO2SP/6dzdtS+oBDxifj1NO6oWG128NjW96gbaU6ijn03xWHFkMG8wTbfv2/SizQrmd2+IsHYx4LUoH/se8ANmw1oiwvaA52NDByMChdWbJtGU0pxuqwgxqtxQYFYOHzEFdHFqXMjWd8EhiaLzw2slICyIiezUJy4xLaFIJd7uK6PLYOCHnhBIVhkAuKAQlWp7HBvZvEC2936iM6714+sgedix88md3pYtUXYjkET9DwjQ01jwuSJfWI+W1Ao8lmXk9EkD2nIV2kDSnaURFS7dt6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjUFq41VeEgWWZJLKSYNLE8D4w34+V5SnBBI16CR204=;
 b=X599Ph6tD/BdXhbX+Va90sURe0REUhbcGWY87nf4Fwi2EULG8ug9zNyXoio9T3MVArMnn59TulEwYhRHOUUEF63Pn30S/E1lWZcUe9qbDEJQ3I/GHP4tykR+4tUtoLozsewhBR8rXCH/TXjZycjP3w1fzZXFlmELFFSpADN6M6SHN5cZUKUmRW8er8pVw9lp/wPqn97MjHrWfCau2ORZKill77x0reGvRmwlO9BOtDEmToAgSioyAC5SVt3SlzMRyOa78iOdVtAmzYvw9BJhqFMQovsaWOI5o4CTpqkiD2sIwercw1ZFf0yFp+Q8N36iHSUKRLqfK8WTET0B30CUkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjUFq41VeEgWWZJLKSYNLE8D4w34+V5SnBBI16CR204=;
 b=IsJsuZJA3NM7PCaxllsiOkeDbPlIjGvzd2S9d485ty5aG9K9a9UkyoWC5Z5O5n7KON55uMda+xc7Kl8ZQbhL1JhEPGPWbDdQUW33Is5aBVCFfEsZEsZTvQ/IIBEWhiYSQhl8kNHrKwYpt7RK4Bq5RAUepz1Y/0Oh/sOoGZDBKdDXEYvZCRRGwuEkhe/mCB4ZGWvUSFrGjU+lTQz+4+LYfXyc6l0zozMT6xlZj0LvOtrt96Wm0x1rX1q1L7Bboq0e+NZm+jVJ1HdEW/t1r7FNj7LOJcMfl9eVuWrRp0c6P/xLAFyAL0QMKvhIDk9Pib7mO5KRXsyMjfiLPelD9o6vSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by PH8PR12MB7109.namprd12.prod.outlook.com (2603:10b6:510:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 12:39:20 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 12:39:20 +0000
Date: Wed, 9 Sep 2026 14:39:10 +0200
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
Message-ID: <aqFTbqOVW8ph3Bux@gpd4>
References: <20260908082345.103087-1-arighi@nvidia.com>
 <c92baaa9-1c1a-4f1e-903e-7b98ec9f694c@arm.com>
 <aqEKCCSY6QetqOCB@gpd4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqEKCCSY6QetqOCB@gpd4>
X-ClientProxiedBy: MI1P293CA0020.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::18) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|PH8PR12MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ababfe-b90e-424a-0f8b-08df0e6f5e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|4143699003|10067099003|6133799003|22082099003|5023799004|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	MXfyYG93lci5ePJx58cYaPz2BtRtd3HkM0QcM7K6oR5lr/01tGzxy1bRY3JHM+EpUbpht9iCu54iqZEPVdNa+/cyYtTt132oI8JpZN7iEtbGWbWB1gQnnxbJ89tTIWGUn+5KwinPC3wJJpRwkxU/IG3r2kUsIInRXunNWZtyJwIzG/ZWmv+W5c81cMWN/TDs4tzWBpKKrtsjeAndzcBfSutVW6eU7dJnXbIdzo5pE5vS/fbhTulEvX63o0iufk5LiLx9dLvJ8+tRtgG4TM4p/njKYRsA47RLaVk+vBaPRVUEke37xydjlW4nzIGlNvNgIQdftr3KOvTIJmJuY85GJF+r/e7uhX3iuGOIOH6cUwy+cK2Oged4dWGYdRPloss9kDQ2lpkVV9i9IUjldO2D4YwBoD9sobq+beU+4wVOicrvYB3C2rDWML3RYTg0xFIoPt+OGCQhd6pcC5T7PaKey+CidExCqV7JptNyUNjmBYPH+66rDflUw4Ycm9vevAPN/yGGDpY0bwGRTatdlBWjSJ1QYXbAalKnr0sFOIyX+gHAFyddf3FOnJ+336v/3Q5toD73/efHIjymrlHCx4Y3kgBVMShY0lYCrLDRZ7OCHSoFseHdwFket5ZadYcEykRcz/xNS/H5C96l+bmkBRrzqekoXzuN6nv3kXtO8A4qrYw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(4143699003)(10067099003)(6133799003)(22082099003)(5023799004)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5958ujphClA/CR7KgCLKPMiXX1ifzhCcC1AseYyFZBvaD5x0TWxSs0hJz8hD?=
 =?us-ascii?Q?6otBjuGH7wmKH7SLc8E8E/5oek8BxtxevEwkBXoriGUPm0QqLC+qmACT+Irq?=
 =?us-ascii?Q?pDt9rqgn9QD2GsM2S9/YS9iIkm092ZoAyYObLLpcERD2CBxEyOW6bsLXLPW6?=
 =?us-ascii?Q?14RaJ59aA+Xmb2YNeybSmDoyn/Ra/N4qSwClRD2YZD5/THxNYdxkDtagsADQ?=
 =?us-ascii?Q?C/CNlB/JTe1ZAlTd8s3AI5NDRT8ZOd5+XKWLnYXYhNxBS1DLa/G/h7fX+672?=
 =?us-ascii?Q?/GHqlg9hF67Gwxbf3wslBhDH5bEC2HNTX4XO+CoxhxcFDj8OfdzOaZsGmYwV?=
 =?us-ascii?Q?ZRAEbaR8j51Pp7J+h/TJQTsjL2uGOpEzgjBGjb2DnMG3/0RqXE2Egkj9rwLx?=
 =?us-ascii?Q?npnzRWjLzBeitIunegY+43Y/S7qHIUhRQac6dAN6uGeGsg8aXHSreUrguJN5?=
 =?us-ascii?Q?SGglGQIBvDBUKgc6BTLmI08neaHufzGyG9lAszXWdAEg/zSPdBJn+yVGyCZK?=
 =?us-ascii?Q?ctDbW5eM5z894si94tEKxKNf4QIv4Y57Vp1vGxE/CFkHDijoDRj1mbKGEVLm?=
 =?us-ascii?Q?45SWdb7CBsVrKhZ3kSD2M5DweNYicnwn8V9qCBNX3iKRB415wGfPyZiIgs1q?=
 =?us-ascii?Q?7mfwk8SlTFZhlBFsD3+PB1dKKhn8fP/K/I0uGo8UxG0MagZeEUUQ0Vnh0XKa?=
 =?us-ascii?Q?3PPv8/WEpe7lASi+m8nhsLwDb7D/IU1rXhfpvGSdVpqtoPfaUiVXIpGS5iaM?=
 =?us-ascii?Q?eGm9zs3ijociQFaVmA5eS/HIUpiNaUJB2ikhj31jCbV48HWUKuMoRBrT6bCI?=
 =?us-ascii?Q?oQA1NMLWAkDoAwFYyyzEHd+F6EOlvx6IkqoDgxFf40QvzBHZGJznRK8aZdZr?=
 =?us-ascii?Q?D5r2heS3Pzndy66M/mCMvxT27jwEIXpIKtchjQQwy6ZVI2vZJviifBl5UPKG?=
 =?us-ascii?Q?AkKs4gP4KBcyW5XQCQ+gwjyJ2qoaMfGqpC+0CvUov51RO7EXvI8LEguu4Mv+?=
 =?us-ascii?Q?S+uUKmszPfxTjqsXHJBg0NOgcHzO89IDWgVjR6SZlyy6OgwIHbkiIKwsE9OS?=
 =?us-ascii?Q?bn0iUGzkxwFBmtybIQSeNFVef1yWRjaVBWDj8XoWGuCIso7bF0Bj9GXAOUKW?=
 =?us-ascii?Q?wB20+/A9c/FWSaQD0zc8fJnuVhq7QZBGoWf9NPF7Nu1IALw/Y6Cl4QuJ0YEM?=
 =?us-ascii?Q?8vbvW9JcPyMIor0EumokLSC0MCrFXIjXXuwhWZaXzM9xtPYtfV9wKUaaWvsB?=
 =?us-ascii?Q?38+fp1BoYodeluscc6OsQzjGEGqbDMSG7FsVDn17RTI1ijGleDeDX3RnL2Bc?=
 =?us-ascii?Q?C21hSv+6wbw2VoYhF/VTPiAaiNzLSRJQUJ0WHV6/W5boy21nkshCDHYAhdEo?=
 =?us-ascii?Q?Q0/wTMaoGnHe4XVOSLvU/DhjHxTubIjGYmZUxyMAUwLujeIe2y1B2Hagu92B?=
 =?us-ascii?Q?5aC5jIT1dldpbwEhDWmU/ZErRlD3poBQb1NpVwnrkkhEmi7nneiHu6YjrwEy?=
 =?us-ascii?Q?FkQsPHWo5tnEodkpIfaiJtGEHPKtd8XWPkXH2r+l7/M+cUtUfNKawIwnolt0?=
 =?us-ascii?Q?A31DFgAyDFYvsbV1uwdYaOiG8Aq+H6Os81Mlog/DR3kW6TeZXW44ChSNiBFe?=
 =?us-ascii?Q?5i7jD5GRZkHkobWJul7Ya7pytnY7euRtsUiTijNpOuNX/14GU9xMJdWYRnB9?=
 =?us-ascii?Q?+fQPqvoFbdc0+7wARtoLpUIjdegIAvqhJKSsEyu6NBR5i/PUzc4BooHOQ3ll?=
 =?us-ascii?Q?KTyZB6N+PQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ababfe-b90e-424a-0f8b-08df0e6f5e91
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 12:39:20.2891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLYp4nuNY7MY6LIdA8KOOOTFVIVQhbyBIV67/Le64SNw7elk/zbHuYa3z9w7qHErRmxNSMNcVp8T480tLu0VsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7109

Hello,

On Wed, Sep 09, 2026 at 09:26:09AM +0200, Andrea Righi wrote:
> Hi Dietmar,
> 
> On Wed, Sep 09, 2026 at 09:20:35AM +0200, Dietmar Eggemann wrote:
> > On 08.09.26 10:23, Andrea Righi wrote:
> > 
> > [...]
> > 
> > > The series was tested on a two-node Vera system using an 88-thread
> > > single-precision GEMM on the 88 physical cores of NUMA node 0.
> > 
> > Can we use 'OpenBLAS benchmark/sgemm.goto' as an open alternative for
> > your NVIDIA internal single-precision GEMM benchmark?
> > 
> > IIUC, you used it for the 'Prefer fully idle cores for NOHZ balancing'
> > work: https://lore.kernel.org/r/anIq6pU5KXTTFCDN@gpd4
> > 
> > If yes, I assume you would run something like:
> > 
> > export OMP_NUM_THREADS=88
> > numactl -C XXX --membind=0 ./benchmark/sgemm.goto 16384 16384 16384
> > 
> > Essentially you want to show that those 88 compute intensive tasks each
> > runs on his own core alone and so you get a higher TFLOPS value.
> > 
> > [...]
> 
> Yes, sure! I'll re-run some tests with that and share the results in a bit.
> 
> Thanks,
> -Andrea

I repeated the tests using the latest patch series [1] both with OpenBLAS and
NVPL (internal GEMM benchmark).

Kernels and test configuration
------------------------------

mainline: Linux 7.3.0-rc2
smt-pe0-prio: Linux 7.3.0-rc2 + patch series [1] applied

Both tests used:
 - 88 threads on NUMA node 0 (CPU list 0-87,176-263)
 - performance governor with cppc_cpufreq
 - same OpenBLAS binary and NVPL container image
 - metrics over 5 repetitions

Results
-------

Delta is (smt-pe0-prio / mainline - 1): higher is better.

 +---------------------+-------+---------------------+-----------------------+--------+
 | Throughput          | Runs  | mainline TFLOP/s    | smt-pe0-prio TFLOP/s  | Delta  |
 +---------------------+-------+---------------------+-----------------------+--------+
 | OpenBLAS            | 5 / 5 | 7.11876 +/- 0.06734 |  7.34669 +/- 0.01936  | +3.20% |
 | NVPL                | 5 / 5 | 9.64742 +/- 0.17311 | 10.29695 +/- 0.01786  | +6.73% |
 +---------------------+-------+----------------------+----------------------+--------+

Hardware statistics
-------------------

ST = single-thread mode
SMT = two-thread mode

Delta is (smt-pe0-prio / mainline - 1): lower is better.

OpenBLAS:
 +------------------------------+----------------------+----------------------+----------+
 | PMU metric                   | mainline             | smt-pe0-prio         | Delta    |
 +------------------------------+----------------------+----------------------+----------+
 | ST-to-SMT completed/run      | 10145.6 +/- 1835.2   | 1981.6 +/- 94.3      |  -80.47% |
 | SMT-to-ST completed/run      | 10342.6 +/- 1853.6   | 1946.2 +/- 93.1      |  -81.18% |
 | ST-to-SMT transitions/s      |   845.5 +/- 152.9    |  176.9 +/- 3.4       |  -79.08% |
 | SMT-to-ST transitions/s      |   861.9 +/- 154.5    |  173.7 +/- 1.5       |  -79.84% |
 | ST-to-SMT latency cycles/run | 15.785M +/- 3.315M   |  2.477M +/- 0.090M   |  -84.30% |
 | SMT-to-ST latency cycles/run |  9.545M +/- 1.762M   |  1.815M +/- 0.047M   |  -80.98% |
 +------------------------------+----------------------+----------------------+----------+

NVPL:
 +------------------------------+----------------------+----------------------+----------+
 | PMU metric                   | mainline             | smt-pe0-prio         | Delta    |
 +------------------------------+----------------------+----------------------+----------+
 | ST-to-SMT completed/run      | 7771.0 +/- 1312.2    | 2162.6 +/- 137.8     |  -72.17% |
 | SMT-to-ST completed/run      | 7759.8 +/- 1352.2    | 2135.2 +/- 108.0     |  -72.48% |
 | SMT-to-ST aborted/run        |    0.6 +/- 0.5       |    0.2 +/- 0.4       |  -66.67% |
 | ST-to-SMT transitions/s      |  777.1 +/- 131.2     |  251.5 +/- 4.8       |  -67.64% |
 | SMT-to-ST transitions/s      |  776.0 +/- 135.2     |  248.5 +/- 5.8       |  -67.98% |
 | ST-to-SMT latency cycles/run | 13.285M +/- 3.742M   |  2.971M +/- 0.296M   |  -77.64% |
 | SMT-to-ST latency cycles/run |  8.528M +/- 2.223M   |  2.287M +/- 0.126M   |  -73.18% |
 +------------------------------+----------------------+----------------------+----------+

Conclusion
----------

The patch leaves both workloads almost entirely in ST mode and substantially
reduces ST/SMT mode-transition churn.

Relative to mainline, completed ST-to-SMT transitions fall by 80.5% for OpenBLAS
and 72.2% for NVPL. This agrees with the throughput result: the scheduling
preference avoids repeatedly switching the active PE identity and allows cores
to remain in full-resource ST mode for longer intervals.

[1] https://lore.kernel.org/r/20260909062649.469633-1-arighi@nvidia.com

-Andrea
