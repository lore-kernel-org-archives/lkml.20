Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299115;
	b=JOQ6B3pFh5/1a3sJXnzVhu3zpHsZswWujLEXeHVNP6CVx/D8nz5OKMkHv+YLTSoTfRtd
	 7li8N/Kv8ulpsT54EUGJhLWCou560z4ayUom24TqLiR1ySq+YJaVfCwZYNb+uxAUP9pjo
	 TCinlbga66o+CxGE8rVm2II03M0IPc8zpjQQhVG5nEnWnzkF45uKyNhw2IOxQrfRdGx3i
	 Uh1od1RqEod+qPLtasD2icWWytdJTKSyY6DMh2of7jg3OuF6+qCYOyq2kSfyZWr8Vjpjj
	 baN+aKGU1BQ7MEU7QFGw1mZsfPz506Cgo0ms8KVVQsPTIOcwvamfTcXAD2Eb8kl+rrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299115;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Km/DzfG0yIXZoSpqD5sB6fANmzhLcfrwiFQp8TFoDyw=;
	b=MHy9uGnaN50DEEcmxSOebX6aVLddsI4Q3111NbeW6cWq3HpgUVHsPrm7WKg/JEQX9SEu
	 45MKoue71t+OlQtHJavNViu3ZKyLraznWGSNssW1TYCfinUMlGy3sr63ZdsHpkLp9XuOY
	 BnUeR+MbNbr8QVKR5wLQPlg3B453YVsVU6Egg8QjPPfFLTWQFMw1Npezv+GCQvRjfvcFH
	 DnCoPOG4cJlaeTg/CrDuuZm1XRelDuSHntX0rOCmSe6fmx1Sw2QMWIIM9VtJr0NIpKXxm
	 dgUur/VZxx8TNGnzscxVtDncl2KB/wZJ4SPvCHKFpXe8VydZ3coauUZ1+v7PiyekO6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=j37HkeOX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.59
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85F606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F85F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=j37HkeOX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1osUIKJ36jx7FgxpeIFOQoEg4JMDWSsQMBUI0YhSqHA4AAqowpWrYTZAnWqYOzhKfjCP1qUGqI22l5DobY9wRhkpvFAQc4JRdtp76tc8l8IQF2koe1NDZVQWVFCdwKdKiHdzcOL8V+wetoDQKzS9D0LpVKM5GeBQ74XhPh90VNhsLcG6CoBG/pC1LzQIzcTrcJtkhp1yzqfmeidMIoPvIilfvMktSPwjv6OptX6NcyiWK3nohU0kRNvpTRDcCukkd0PQE/GTS6IzYf24XY7exFiPZEyTABc0XrF8awR8WnoWvcnzNxysBHJpcOKzocY2DPz4bedDLoKpttzphsPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Km/DzfG0yIXZoSpqD5sB6fANmzhLcfrwiFQp8TFoDyw=;
 b=wLw7s0PwpNJ81tLzkbkkQrMrGtXX/kQI2ofvPiIEGiG71rqBAuiw7mVtbyZ7PFLId+pR8s7DTEiugCMPsMcaf3KKjn/pfpk1mo59z6EVctLS378u3VqMfAlD6oHqBNu0S6/xdW23cXmoelvMtqk0lUgvilpwDWfKZWytiMiBDLXmxOjzf8U83EWwIbHRk8XiuKaKvniLzH2TMqnVLSRCwDqGfxYaffLIarwhgr0lYXg9SBSYTu7vplegC5zhz5cVbBFfo8TroMCtBSi0b1uwT4Ja34Q+N3G74DRbbd6jt5pv7InzCLGG8rOTrhDbcgRwpQQFz3nd4Y+5bPsenYS15w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Km/DzfG0yIXZoSpqD5sB6fANmzhLcfrwiFQp8TFoDyw=;
 b=j37HkeOXY2DPuiyp8/dcIB3GHCtJCBjT1wpSC+KRrmNiqmDyxUmQyAga9rT89L9OXm4Nnyr4gFYWHq9tDQQu+7VpFjhj0juFKwuboAk8LqCM3VtJnOFXjBYwysf2L/D7Dyn9k1/8et0Rg8cZ0rEjN2SDP9L5FsPj9p2M4NZQ4crZi36Vi3mphH+MEfmJ6YO0VUT/kCi5thTz6pGM846MxQsPS0FmSzwYVelealYjijyMnOhPyQ3OG4GEd7CfUuEAIhETGSVVoAMegsmh8SAreMb9Z5HAFAOczypPmfXopy03l0m0mWnnP3m5t2AlG0KY33zxSF4nSfpkUct77mjovg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 08:22:53 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 08:22:52 +0000
Date: Tue, 10 Nov 2026 16:22:45 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, 
	Tony Luck <tony.luck@intel.com>, Ben Horgan <ben.horgan@arm.com>, 
	James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>, 
	Chen Yu <yu.c.chen@intel.com>, Babu Moger <babu.moger@amd.com>, 
	Drew Fustini <fustini@kernel.org>, Vikram Sethi <vsethi@nvidia.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 06/15] arm_mpam: Support memory-level MSCs and
 ABMC per class
Message-ID: <avLTiNH83si_9OHV@MWDK4CY14F>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
 <20261109212427.1409204-7-fenghuay@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109212427.1409204-7-fenghuay@nvidia.com>
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SJ2PR12MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9b4342-c347-4833-7189-08df3f03d04c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|4143699003|5023799004|11063799006|56012099006|22082099003|18002099003|10067099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	uTr2Aa7as28L+EaMn5ktmFv1ZZkednQt8MxFDsdr3V+WN0G0HcIjp8CXKoRj4EHCAk/Bsv1EJEZ6MpcgopRM9g0r0r/YzrYBhPneIEW4vr4CTL10+wPrlQN116kdep0YqsZbnYx7FPXYMelDWtdnx5v/XnYFBgAbM5t0PSOkQ0su9ir3NdLEZKdQywZ/zx7e3jN0GnnczZU8J4yKDM1C9uVw4oHHCvCUAW6G9h+3NLkaVp5MIF/fZQusa3JbjrePzwd7S/RG1VCyL3pkmVxuhdnkGgeX/Y5PuteHPPdplco7acGrMYNDuG/w3ukpSJm1BvUp3owVPNKJUzy8velVapoqLqBQK6gb/+X6/2WcHDXgGR++FCX3im6vBZplxCw4xj3oyizNe6iAwtFGJWBYH+2ccWtDqeSDPdOOauNoPESNivN2vNZsylvXjephG4pkR369GFoDXeXMOPXESM/c38uWQfplHoj1cYDkZKs8njXqRSWcFib4HjL57m2L4w6sKq59ApzhER2aSaD2a+2Kn0uJlAjmhz1LMwVCzyC3yuXV+RBdOncH/mITUe1QZHEwN1sB1GCiBU+CXZ6jhyFq3bDSXlUUsKzrIFQECTyp4C0unBh0CDNBv9zopGkuJjLsE7jJ+I7NNWZPrcY8Jg/c+hkBfzWIiB6qgM355mPgXqw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CYl29IFZNcmIeO5XSM5/DNnNcgbpi2cD59QUnE3Z+TruUb7gw+d7ReOyECB6?=
 =?us-ascii?Q?X1PCD7ahFnuzHIcVQJe9AbfvjR8Qo0UYNMFH7s94Klbi1qrfVNn64F46vOaS?=
 =?us-ascii?Q?q3JxxLUdLVi4eTpnGM8axdJIjCrlNiE64WVUUj+BMqWbHQQNF6iyF6kMz3SW?=
 =?us-ascii?Q?ywTsmSBZaDxYr/BXou9LVierfVh96HOjfVStSkrl3HOudA5JewudRalnjQjv?=
 =?us-ascii?Q?dvEsBC+LDcY3ANjYxuGOeLB29zF9AXPgUc/tYEPU2cMylUEEaP6YeajaJHj8?=
 =?us-ascii?Q?LWWp3o7rnSBkp3gCI87XmmMOmLPfgCBOklOWIQaGKGSzM/9YS7qmt8m++jai?=
 =?us-ascii?Q?J6KsB3vfs1hn3zK3/2mHJsGRsTqhsiQiUBEu9REYEEoquC4oiyHQ2+pjE2ju?=
 =?us-ascii?Q?ME/8AvgxUuGi5gu0MFo0YhDpBp3zWxQl/NnVZmcoNVNp+YK4vTYFKci4Lt20?=
 =?us-ascii?Q?ZK0BbZ1kkXL1XkKKG1w/K8O2Yl4uDxOFw0rUGmFIZDUepAkKD3xtAY/TTlCl?=
 =?us-ascii?Q?pTOQISr6n/m33VJOsMxiFnrf3PZ1zC2ZFINSj6u2nOqmNJNjzlQkFYhxe5wv?=
 =?us-ascii?Q?JAcGQO/EfYBC2O7FcK3pvO4c5U/s81eYXZrlLK/eJ7O6QwQJcYthceC2f77l?=
 =?us-ascii?Q?lpuDQFLtOdnqs2SLpB1wSBmnP8sU+ZqpPNo/Ill5l2NiF7koGUrkGbQZotaX?=
 =?us-ascii?Q?EMZESna5iIFjMs9YdpkPk/bDNhlbBJjhmXKcp7256iZimAx+jP2HTK+FYN4Y?=
 =?us-ascii?Q?W6niH3VRw99dc6OMebenAWCxo1UFUW7Pp+U1ouSCSp5sQzk5u0tqHFgjevFi?=
 =?us-ascii?Q?IKj8FDn1vjbEPBQxmoJelKqCLErppPSCX9VUF4zhgzw5b4DT2eJ3Z2murH4s?=
 =?us-ascii?Q?gv4rsyp06l0suFKK96wMMG/QdPn7z6hYe+5sxbcahXMQY9cZZOdPoyTcGP27?=
 =?us-ascii?Q?J+97pQgU4t/QuktbUcTQdOAq/SdU3YSns+rQwKejxov0fHfncUX6KyWOqhg/?=
 =?us-ascii?Q?w3ipo+4xA90PHzIt/9+3jlLoqowC03NgUWSc3pWzevWBzV0JxvhMK44bfc3e?=
 =?us-ascii?Q?sGlv2zy+VK5wd9mv/1/g8KVgH/5RBsawgymTOlrnsyu2NuZpJsBt6rXQm5XE?=
 =?us-ascii?Q?q2Mcswpjj3nCByiPW3AVm7ZbpRHjLvjSM9pWxq49KmUrtKMo8pRbDQCN8KKJ?=
 =?us-ascii?Q?UMHBs2Wcqrsas7QHJbWaZFgH3klOyvusviGH4k/3qzDqhLGMJTr6gZYWymuA?=
 =?us-ascii?Q?cdVpAkRNgyQCow24eSdC2KqYvZFiCQo38H7zBm/6bIuc2CbKl+lLGY9KBcr8?=
 =?us-ascii?Q?lz24eC0DGIJ4luibnNQw3BdujjpcGblUS1+lL7vL4uDmJw63rN2UMdYCv48C?=
 =?us-ascii?Q?avWbFq5pX/xdUjSdHmqzxdTkuPjk/wxyjCRDEHe3ubkzU+/nfuyPcFQsOfyg?=
 =?us-ascii?Q?UQHJYIuqRxCz2BsjPWZRiG+JTfVk9XCo2Q+ZzqdrSccGs0B+2MDofB3GS77H?=
 =?us-ascii?Q?3+D9E0Was72hd18087m8cuduZ0fcKtKvpR76GLpTIIHcjolof3O4buA7mpvF?=
 =?us-ascii?Q?gvCIYkwEI9sMjKpI54xWUzM+iTduGN2tPQq71n6U9lGzAoSPXzOedUX4YEzB?=
 =?us-ascii?Q?LF0YJkz2ahsfnsDnpQKxEucUX8vlFsnKTx+RtF/BE1/TWTBnt+mh7G96RAWa?=
 =?us-ascii?Q?NqDrXTCXrfvd9tW6XtJQU/2ydvrszZ+6NygKFvYpd71zhDmFPjAvfmNXKKIy?=
 =?us-ascii?Q?AVuUQQ4EpQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9b4342-c347-4833-7189-08df3f03d04c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:22:52.6309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSGrRK4hMUL5Tr46H8/A0LG2hM75gATyKKXjHqrAQTJHwzSLCrUbpsZZ2hxn+BjLNZCOT5/vRrG+vhvg/YSsLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991

On Mon, Nov 09, 2026 at 01:24:18PM +0800, Fenghua Yu wrote:
> Some platforms place MBWU counters on a memory MSC above L3 while CSU
> occupancy may remain on the L3 cache MSC. The driver previously assumed
> all monitors and ABMC state lived on the L3 resource, which
> mis-associates MBA counters, breaks mbm_L3_assignments when multiple
> events share a class, and uses the wrong domain ID space for
> memory-level MSCs.
> 
> Teach MPAM resctrl to map monitor classes to L3 or MBA resources,
> initialise ABMC on the resource that owns the MBWU monitor, select the
> node-scope MBM total event for memory-side counters, and test
> mbm_cntr_assignable instead of inferring assignment support from
> whichever monitor happens to share res->class first.
> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 112 ++++++++++++++++++++++++---------
>  1 file changed, 81 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index ca2ae4b5cc8a..47a7b18d841d 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -45,7 +45,7 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
>   * to those supported by MPAM.
>   * Class pointer may be NULL.
>   */
> -#define MPAM_MAX_EVENT QOS_L3_MBM_TOTAL_EVENT_ID
> +#define MPAM_MAX_EVENT QOS_NODE_MBM_TOTAL_EVENT_ID
>  static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1];
>  
>  #define for_each_mpam_resctrl_mon(mon, eventid)					\
> @@ -88,6 +88,11 @@ bool resctrl_arch_alloc_capable(void)
>  	return false;
>  }
>  
> +static bool mpam_class_memory(struct mpam_class *class)
> +{
> +	return class && class->type == MPAM_CLASS_MEMORY && class->level > 3;
> +}
> +
>  bool resctrl_arch_mon_capable(void)
>  {
>  	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
> @@ -121,7 +126,13 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d
>  
>  bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
>  {
> -	return (r == &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res);
> +	/*
> +	 * mbm_cntr_assignable is set only when ABMC is initialised on this
> +	 * resource. Multiple monitor events may share res->class (e.g.
> +	 * occupancy and MBWU), so assignment support must not be inferred
> +	 * from mon->assigned_counters via a class lookup on the wrong event.
> +	 */
> +	return r->mon.mbm_cntr_assignable;
>  }
>  
>  int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
> @@ -181,24 +192,41 @@ static void resctrl_reset_task_closids(void)
>  	read_unlock(&tasklist_lock);
>  }
>  
> -static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
> +static struct
> +mpam_resctrl_res *mpam_resctrl_res_from_mon(struct mpam_resctrl_mon *mon)
>  {
> -	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
> +	struct mpam_resctrl_res *res;
> +	enum resctrl_res_level rid;
>  
>  	if (!mon->class)
> -		return;
> +		return NULL;
> +
> +	for_each_mpam_resctrl_control(res, rid) {
> +		if (res->class == mon->class)
> +			return res;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct mpam_resctrl_mon *mpam_resctrl_mbm_total_mon(void)
> +{
> +	if (mpam_resctrl_counters[QOS_NODE_MBM_TOTAL_EVENT_ID].class)
> +		return &mpam_resctrl_counters[QOS_NODE_MBM_TOTAL_EVENT_ID];
> +
> +	return &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
> +}
> +
> +static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *r)
> +{
> +	struct mpam_resctrl_mon *mon = mpam_resctrl_mbm_total_mon();
>  
> -	if (!mon->assigned_counters)
> +	if (!mon->class || !mon->assigned_counters)
>  		return;
>  
> -	l3->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
> +	r->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
>  	if (cdp_enabled)
> -		l3->mon.num_mbm_cntrs /= 2;
> -
> -	/*
> -	 * Continue as normal even if enabling cdp causes there to be
> -	 * zero counters. This avoids giving resctrl mixed messages.
> -	 */
> +		r->mon.num_mbm_cntrs /= 2;
>  }
>  
>  int resctrl_arch_set_cdp_enabled(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
> @@ -404,6 +432,7 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
>  		return mpam_alloc_csu_mon(mon->class);
>  	case QOS_L3_MBM_LOCAL_EVENT_ID:
>  	case QOS_L3_MBM_TOTAL_EVENT_ID:
> +	case QOS_NODE_MBM_TOTAL_EVENT_ID:
>  		return USE_PRE_ALLOCATED;
>  	default:
>  		return -EOPNOTSUPP;
> @@ -1160,7 +1189,10 @@ static void mpam_resctrl_pick_counters(void)
>  			 * and it's equivalent to mbm_total and so always use
>  			 * mbm_total.
>  			 */
> -			counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
> +			if (class->type == MPAM_CLASS_MEMORY)
> +				counter_update_class(QOS_NODE_MBM_TOTAL_EVENT_ID, class);
> +			else
> +				counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
>  		}
>  	}
>  }
> @@ -1187,7 +1219,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
>  {
>  	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
>  
> -	if (evtid != QOS_L3_MBM_TOTAL_EVENT_ID) {
> +	if (!resctrl_is_mbm_total_event(evtid)) {
>  		pr_debug("unexpected event id\n");
>  		return;
>  	}
> @@ -1204,7 +1236,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
>  		__config_cntr(mon, cntr_id, CDP_NONE, closid, rmid, assign);
>  	}
>  
> -	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);
> +	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, evtid);
>  }
>  
>  static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
> @@ -1303,10 +1335,10 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
>   */
>  static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
>  {
> -	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
>  	size_t num_rmid = resctrl_arch_system_num_rmid_idx();
> -	struct rdt_resource *l3 = &res->resctrl_res;
>  	struct mpam_class *class = mon->class;
> +	struct mpam_resctrl_res *res;
> +	struct rdt_resource *r;
>  	u16 num_mbwu_mon;
>  	int *cntrs;
>  
> @@ -1317,6 +1349,12 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
>  	}
>  	memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));
>  
> +	res = mpam_resctrl_res_from_mon(mon);
> +	if (!res)
> +		return -EINVAL;
> +
> +	r = &res->resctrl_res;
> +
>  	num_mbwu_mon = class->props.num_mbwu_mon;
>  	cntrs = __alloc_mbwu_array(mon->class, num_mbwu_mon);
>  	if (IS_ERR(cntrs))
> @@ -1324,12 +1362,12 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
>  	mon->assigned_counters = cntrs;
>  	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
>  
> -	l3->mon.mbm_cntr_assignable = true;
> -	l3->mon.mbm_assign_on_mkdir = true;
> -	l3->mon.mbm_cntr_configurable = false;
> -	l3->mon.mbm_cntr_assign_fixed = true;
> +	r->mon.mbm_cntr_assignable = true;
> +	r->mon.mbm_assign_on_mkdir = true;
> +	r->mon.mbm_cntr_configurable = false;
> +	r->mon.mbm_cntr_assign_fixed = true;
>  
> -	mpam_resctrl_monitor_sync_abmc_vals(l3);
> +	mpam_resctrl_monitor_sync_abmc_vals(r);
> 

Hi Fenghua,

Maybe update the call in resctrl_arch_set_cdp_enbled()?
It still calls mpam_resctrl_monitor_sync_abmc_vals(l3), so enabling CDP
doesn't halve the NODE/MBA counter capacity.

With 16 physical NODE counters, the allocator still allows logical counter 8.
Under CDP, that maps to assigned_counters[17], outside the 16-entry
array.

Best regards,
Richard Cheng.

 
>  	return 0;
>  }
> @@ -1337,8 +1375,15 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
>  static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>  				     enum resctrl_event_id type)
>  {
> -	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
> -	struct rdt_resource *l3 = &res->resctrl_res;
> +	struct mpam_resctrl_res *res;
> +	struct rdt_resource *r;
> +
> +	if (mpam_class_memory(mon->class))
> +		res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
> +	else
> +		res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
> +
> +	r = &res->resctrl_res;
>  
>  	lockdep_assert_cpus_held();
>  
> @@ -1365,8 +1410,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>  	 * monitoring class.
>  	 * Setting name is necessary on monitor only platforms.
>  	 */
> -	l3->name = "L3";
> -	l3->mon_scope = RESCTRL_L3_CACHE;
> +	if (mpam_class_memory(mon->class)) {
> +		r->name = "MB";
> +		r->mon_scope = RESCTRL_NODE;
> +	} else {
> +		r->name = "L3";
> +		r->mon_scope = RESCTRL_L3_CACHE;
> +	}
>  
>  	/*
>  	 * num-rmid is the upper bound for the number of monitoring groups that
> @@ -1376,9 +1426,9 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>  	 * this does mean userspace needs to know the architecture to correctly
>  	 * interpret this value.
>  	 */
> -	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
> +	r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
>  
> -	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
> +	if (type == QOS_L3_MBM_TOTAL_EVENT_ID || type == QOS_NODE_MBM_TOTAL_EVENT_ID) {
>  		int err;
>  
>  		err = mpam_resctrl_monitor_init_abmc(mon);
> @@ -1386,13 +1436,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>  			return err;
>  
>  		static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
> -		l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
> +		r->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
>  	}
>  
>  	if (!resctrl_enable_mon_event(type, false, 0, NULL))
>  		return -EINVAL;
>  
> -	l3->mon_capable = true;
> +	r->mon_capable = true;
>  
>  	return 0;
>  }
> -- 
> 2.53.0
> 
