Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3992429405
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938774; cv=fail; b=k8CKWhVKP5TfEVRqTR+Sj+jHH6PtNO3Fu2FogCxQdDbBLRlOtdKX5Xtn4gy6b0r7HUXkR6CWJyyR1qgFHyYFnp4cqHoPNZSIBhMpCUtzwLAC5XM5sc5oEC9F2tExrovyBimo4nlZvmPH97VUk0ppaSSZeRv2VFjTJugs7JHw22Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938774; c=relaxed/simple;
	bh=kx5FJfCk7Om3O/LghboiLYfyeEif1WTF4GQKr/qDGfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TpxvihQX25Csrhh+myFal4Ocl+5A6/U7BbJ3XY8qMQalhGH4cTI+PzygMk+AUZ5Hb9J2RCjfdk5qOyHvn5XLOX5xW3eRr6LbayHUPWXvmTMwJLkKCyjdfQCadla0cUES0UcqIaUGmD/vMvPzMM+yVyNRb5QyUMqYZnZqkVlViUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Up8K9ISJ; arc=fail smtp.client-ip=52.101.52.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Up8K9ISJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4GWh1TPOzC6P0XWBw4Nn1dDIt4pRoZ1Z77723PEEXOHbsSIwoBo02075FQw2swty9R86nDR/t1R89iPjOPoY8dxRxoKIGUW624Jp7cZyFD2dq0udhZwsn7P9qRNjmaMHTcFaV/iurva7l4bXDPB9fS05l8B/IX3WH1+uM28jiMKMwg3bKMUHOUah6MNKHc66d34cj5swI8kqT6KJoy7Vq4/DdMTik1MGslWNvQehsintSMilsrlg1axBLFZifMKpnzN8S5SIN+Mp5oh5jImLhAWFIUPG1AEe9p8trifvHiCh8hcGqTum0/0GfdhJy+tdKHWF8V30H2JDbYyI5K8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IjnlF14QSJXc+Vtbw4l/86WJd4sHZQjiu2xjb1UvnU=;
 b=XhurZ6Rocclb8RVz3Cw06cBEXbDM0stzOb4BbQIQNuzEVKcGOvfEtdgvbuCPXrA9XEASIMkrZfMt/pBTslz9ktGjn4ZmBO2r2VoRpzwtwsFERUQYtR4ggI6QE7hp2r2wio8369z7Zpjd+FQAcPOAqZdQeuVkqlSiHfao4WCfG5mLTElzSTeDSEf74HTL37CTEKhClicH1uKpPquO8zfNgAiVpjBX9RYQ5gL5gdThpk6S9dfujB8yca/QmPjOkWirrvnXD4kM91Y3Jll7piezv2N2dL+/d86NIMZU9ictzFF3FDJXePsnPYnIwZ8rMTwxW4OWvA2x0o+ao6tom45KPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IjnlF14QSJXc+Vtbw4l/86WJd4sHZQjiu2xjb1UvnU=;
 b=Up8K9ISJgUI30oawBye7LIzLBkWE7X5CsTHywDgs8MCOPoSf+ObS6rmcuGtqShLyrgMUqCFTbkGRcGibwq2FM/2r2kVLsW0Sz3sthv1Hs8qLp+06iE2w1LpuLVIfEsA0VwjvUR30kxc+xB4UB1SHiy2hFfxZo5W+p9iGQ3j8lhaMTC9KGExRoMuKgU2llXe7IcK0iLy7CeDVAzME2HLLMPLKNfP1teL3ac9m38UzOkL8F/wbu0CIOIhosZUyfAvrmRec8/7zohGKYXaZW4Nb6pqGPdaqzJI+TRvOPDsucOWJPXjgjn2mm1Ra6O9l2OY0+wQIsmOH5Fzk1+NMKa80Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by DS0PR12MB999314.namprd12.prod.outlook.com (2603:10b6:8:42d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 9 Sep
 2026 07:26:09 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 07:26:08 +0000
Date: Wed, 9 Sep 2026 09:26:00 +0200
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
Message-ID: <aqEKCCSY6QetqOCB@gpd4>
References: <20260908082345.103087-1-arighi@nvidia.com>
 <c92baaa9-1c1a-4f1e-903e-7b98ec9f694c@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c92baaa9-1c1a-4f1e-903e-7b98ec9f694c@arm.com>
X-ClientProxiedBy: MI0P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::13) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|DS0PR12MB999314:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d42700-e165-4cd8-08f3-08df0e439ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|22082099003|10067099003|4143699003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	MEPM1USNBP94C6Jbpk1EjQrSNc6st7TCZOntnmPOupDt84OU7RMYXWwjTBmikybk4E1auUaKQHZn023ARRrvJ5QAiELDfzAuaNnmcNU6aWc0+CTEihF4UQdkYolJonXt8bLBptBFqwLS7EqdLFEBrTpYQVlRn0gYWUcmpuAQtT233Y7KElBpDV9a0XynisIoclQUzKw48/9T3S7LmcQWzT72LYHW33Lsy2eVKVszugqnGhVeCIhO5ixvqDcFNhb4+e3Dumle1w6IJxrhaDXJ6PAg7lBeWsSeSTVFg0hy0Yv7KyZN/icpPKet6a2essVt9GFsLdaYSjxebbxSkmEwv/xtoSKeF27gG0Ort3D8IoByoQcJzh++JFZ2T759I7zu9czZ/RQuw+BrWQIcAkwy7tp3SJBF7y/4cfPinmo961oYzPo+1M2DVeVOZG8REqOEK0T6W1Zt8Z2BdQ9yE43+DpuymAQz76aHLudUvsYaUozXtHUxs7cqBSZmDq80KG1tCdpYjAYbjqZjvsge8D76aUBxwcDVlXbKRYE1h3eMNnrkVC4BVXWXx5ZFPGZWzLdKdcXTD8dQuJWfTY1wq63a/HvwE3Ho1DfSOzWRQhxm1EZawNs4f6gBLtTBRh6TP9wPcbY04xFQQrWXXrzJzxBQXd40Dp1e1RnwIozoIIjGZug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x8VxxfBSHP8Tf27s4fRwxG+kKyuv7IsGb3fqfy/X/F8phkj9vaE8U6EFjAmt?=
 =?us-ascii?Q?Y+jvHp7XdTeve2abCX2UVyBjayZlPKfcYx7g772oRwm4gcQ6Fe8cKMcPs07u?=
 =?us-ascii?Q?tJjafuMwhQD7gKo25dXfsyzqs3UV0mTTDVHT4PXsyDBGr0C3IM0QzH8RRg1K?=
 =?us-ascii?Q?bWiTrZR5mX3u8JvCu1xrbHlRhIbLP/cyDM5rJsDGM26XELCnHwzXlygO/01S?=
 =?us-ascii?Q?56fbBtVL7fjQtd0KPk8IBSp4ma3SbznZCUhNlkFDI0OWMIrU/DVhNZyejBpr?=
 =?us-ascii?Q?+2f2286KCDZr4KDu2GXlZkEDP+ue/n9Kq2GUFbemUykHlHdSWijdD1fL7N/7?=
 =?us-ascii?Q?XMMPwpyf8bfSR7oGvPgtZXfUcTwjH2uWIq36054bJv86Lc5s3QOMyWAuTmF1?=
 =?us-ascii?Q?Sm5hTqIPqFm5wUTqzruKaPc6CyPcyfunQh8//H7l2U63+WNfyiuWU4QKtL+h?=
 =?us-ascii?Q?7hudnQY60R6nr1tQopQnxtM0JSsBBtDYdB4J7AhwWh9Em5fzgj59FDT65gru?=
 =?us-ascii?Q?rL81DuO5FcsjU7E+QWWSMYLhYs3RyEiVhCUUOk7NsZyx1k4tm7pjuVtk+boT?=
 =?us-ascii?Q?keVl6uq43NLdJ/AKkDKsjqquvHofhAAT07bZb4s9Q8BzUIj0oivipMlkm1HT?=
 =?us-ascii?Q?H69sXqOESQga8Qg2dnD1qFLfmc/Yjo1GYrBPDa55m2H8HPXFiS5VqgHoCJkf?=
 =?us-ascii?Q?s8n/a5lqzEjhXbLoIp6VpCvREqfBOdk9yeDIMerntXiVdVCsNFWkrZNdn91P?=
 =?us-ascii?Q?MagrqhCk5FKiTKAbHh1VhI8GaDnr3FeH0m0VAgozXCkNUgnynGH7UDAqM3ji?=
 =?us-ascii?Q?mCHxzzRrXP37lFaTwJiyqL2t2QaSZaNSP2tsPOGXr7xkt3Ns5EbYsxSoIpUp?=
 =?us-ascii?Q?tRhLNcQn2lbodI7kkh+dw75ix27XEA1MGCUaUSbozBZKAqMvUdT9ucQOVWLl?=
 =?us-ascii?Q?WMyZLnxMIyf4mGZY4zbD36dTha8ltdYHtHC1LZo491fXs0JL0z+BOSxy9T4Q?=
 =?us-ascii?Q?P3L5eM9Acw21RKw023MXGR7llCFaMDxCmGoTgPgSCiMjcXjyY/BOAHv28bek?=
 =?us-ascii?Q?aPrybUKZEKH2Gd0+iudO2ye7YYLoY8G+ohkqBNpaNnNJKT+hknzZtVpnTIX+?=
 =?us-ascii?Q?r0MDXIf32zmq7jMTaDlCG22RgILFn62LnwWs9a9p6leAAd0EcrOqD1LsbhSP?=
 =?us-ascii?Q?oPwcNkv+jSsQxCVcjVT1hAqtGqfbHdvC/b9HETZCJxJnPyOgi3qzsbPmi5mo?=
 =?us-ascii?Q?aSp733mCxnAMO42x3pxcdHpV7xQuIVuE2lwBzqYYuID2ol7e4Zc6KrYFEO1X?=
 =?us-ascii?Q?5af9cZYdGaOP6J7p/X7i/W7w+389t13I3RZXd524O7efhlS3YrcSB0b6vYrZ?=
 =?us-ascii?Q?FOoKWwy+fj3kDjohBZkUXZKZ7NhzTKZxImZrPnkBSGa7BqEuw6XzQNV1yac/?=
 =?us-ascii?Q?gr35zbqNjYPt+th5slb86/Uz0fuoSPUX93PiZM+yjAmx73p7R+VYQsOnDdeb?=
 =?us-ascii?Q?ifi14tlNYmeGyX4xWT6zF2JwkSepAUeOden4xEQly1cS7BpPNdX6VvxGg5GO?=
 =?us-ascii?Q?CtTnAq+q75J1cm27UgrY86HmF9MIHRotDj0cHRkV/7vnaaEP9YT+rBTXJ1WU?=
 =?us-ascii?Q?JFXTfopBfibMYOPUo8xS0O55BvcexqcLxswG0DcaaH8k3P6XFY6DAHO9ZomR?=
 =?us-ascii?Q?xrQzaQVv9HNE1Ip2QbAupJsDt7aORNB3AU6DnzRmJXNPjl5Qq9xreigoDjH+?=
 =?us-ascii?Q?q57ZZrfGFg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d42700-e165-4cd8-08f3-08df0e439ddb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:26:08.5447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01U3BILWDtqRF+1w4/6ozE4VEjLjSM1PpG+nPz3QhCTvGaNJT5kq0ZGEjj0SYycLUJAidFLdoHaXHJzTuIX+bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999314

Hi Dietmar,

On Wed, Sep 09, 2026 at 09:20:35AM +0200, Dietmar Eggemann wrote:
> On 08.09.26 10:23, Andrea Righi wrote:
> 
> [...]
> 
> > The series was tested on a two-node Vera system using an 88-thread
> > single-precision GEMM on the 88 physical cores of NUMA node 0.
> 
> Can we use 'OpenBLAS benchmark/sgemm.goto' as an open alternative for
> your NVIDIA internal single-precision GEMM benchmark?
> 
> IIUC, you used it for the 'Prefer fully idle cores for NOHZ balancing'
> work: https://lore.kernel.org/r/anIq6pU5KXTTFCDN@gpd4
> 
> If yes, I assume you would run something like:
> 
> export OMP_NUM_THREADS=88
> numactl -C XXX --membind=0 ./benchmark/sgemm.goto 16384 16384 16384
> 
> Essentially you want to show that those 88 compute intensive tasks each
> runs on his own core alone and so you get a higher TFLOPS value.
> 
> [...]

Yes, sure! I'll re-run some tests with that and share the results in a bit.

Thanks,
-Andrea
