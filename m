Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794599361;
	b=MehXI0QLpOSAg+KmYiyxto1yLwu7zTpNxqztQXQq6zy29su0y/p8fMqre71gbQCbkmVH
	 7CeeKmneZukZGWbS5Kyk8o5lco0hfAV0PWm6tD9I1T+seSyguByXEdSnPbz7E0E0/7JWH
	 1FPVDu3uk7aDHJ4EIL7xLnRuOiZgW9Iq+ksArxO087bE9ZK7gHYwJRVVN5Z+GfaKolhFL
	 Oqv604ERIOHHDBlpAHXDoBp8+retqbx/czdDXalk37Ef8xbcsbecxXoyjqPKU/jcS13P3
	 Zqp+sxW74jSwlCEOgqdljCs3A4unA89eNgBLn+R7/qYe3xhAnEd1140SrzAAgi7Srdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599361;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 X-MS-Reactions:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=kL9NY20n5YLEvcBNRY+HMGpKD760/oNOc2lpiP/q+HQ=;
	b=EGNTKqm+XpQQLuAxit6ZJCKbVk7L6F5PYco2RWVD2dUEWleJVB1MAOMpEl6wiKEN3vlo
	 0XtAUGbK+6TGvCIUwZDSgVqLI6SyfCDpVoN3pnJQoZKcI9RsDzrLlgFVJ/8cc+08VW+Q3
	 aoq52jeorLWWHxtK2lbENwI2+KKSHcLNWPHT1gKvqAOqPeA4hsx4JWUbAVxLSo3HKVn+e
	 DkyNPqPH+53XcvpTVif1ae+yGIbUl7kbkj4086Wq/kfYONcK0A6uVWaq4g9WXceD/gB+Q
	 lbDbxJirEOdEhCYn3Hram9NVwAgQJNsWTUjGn2++oE3zcjzmcgknhQBgzZODKIALx2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qyJU1gpt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.27
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010027.outbound.protection.outlook.com [40.93.198.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E8C606A893
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E8C606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qyJU1gpt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2l8yx+r77qybvm0bwt53M+CAiwxr6eWkfvzxDOM5E8fRgvSweopzSfkc0avB4vwnoLfcTTIG7gZxZ1pyqHVUXkAVpGB7YZ4OCmJTIg9oK202nxyyl8C53hplOldDXUPOZYIFic3KBK0NilZ0cNJYt3yYAbm9IQj0nXoc40aIulQBu8wciM7Pvb+PPIkRKy/D443iNUrgG3BtlqdpPl9zlh8ipaaUbMgl2AVYORCweguMx8QIurqvuQpqr+JIxaU6EE485DXwhTN5hQxqpJCZAKwkP8GIH/QWuGBxhSa1x6lWMAVPc2THvchYQXe7rvj7+Wu4p2RsqnChcNrOMwcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kL9NY20n5YLEvcBNRY+HMGpKD760/oNOc2lpiP/q+HQ=;
 b=p0e/uQMF91ZDUB+0BNpNAoYYOM5HGi842Vj3g7EWemTHOLnSrYRGj7Hi7GoIAc9TTsaw7qDKWsuHGFP3v/j7J4SnO6W5083lwFy3e+b4iFTraHkqle2HYFd/xghFYK6umS4E1u6hCS5NQ1Ak/YKgDppMWh1dZD98cWh4zeZpJcD5bhov7Gg9wY47wSf3UbIFs8b8bjl2/GRxzClXPBgd1EKZZEOd1K155t+9ovpiT/ddDjaGfY3tg8eMgT5j5fkx1cZZP4Oq8rmyteAykGvT//yzEh2cfC583Yixy57hsM3UQjqvFNAg4e1hsyhM6Y+dFAqQ0gqo5Ztdr0GrYIQqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL9NY20n5YLEvcBNRY+HMGpKD760/oNOc2lpiP/q+HQ=;
 b=qyJU1gptJTI37h+PYkT81FJp9D4i1wYAjWmiy5ifnPZEJyHiIfzbVI4hiVY5KqrQCT3Qk6z0V6ObeXOMgq7uQxJcNcwJixJPXwRfc/LW2xn+Kcu0xc3FR0KsA+aCNpLusa5HRBxR6AbXVgJOkQlPRgGdde4XVqXFSevGxPP2fCLRqVWsfMMo1FDgZcPZOLXJ0QmvhZqG4XTzVnepiCZnfiOxgnNHePagQaijVQBi1nN1AHfXNdhvFkHh+U94mnJCMIVQzCR05Ipd7uR0Guhhr+5hzbE+8kyXhXyHFSCx8YqRypDBdUuRwwhMG+hJaF0wM0pmNzF08Lv02vYitJkpAg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DM6PR12MB4234.namprd12.prod.outlook.com (2603:10b6:5:213::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 19:47:14 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0615.007; Fri, 13 Nov 2026
 19:47:14 +0000
From: Zi Yan <ziy@nvidia.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, ying.huang@linux.alibaba.com
Subject: Re: [PATCH] mm/mempolicy: ignore a bind policy whose nodes have no
 memory
Date: Fri, 13 Nov 2026 14:47:12 -0500
X-Mailer: MailMate (3.0r7038)
Message-ID: <D1684A69-FC68-45E4-8349-9D5E5A327053@nvidia.com>
In-Reply-To: <20261113192642.2618878-1-gourry@gourry.net>
References: <20261113192642.2618878-1-gourry@gourry.net>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0394.namprd03.prod.outlook.com
 (2603:10b6:408:111::9) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DM6PR12MB4234:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbf8d93-81af-41da-9036-08df41beea38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261028144727099003|10067099003|5023799004|11063799006|261026121527099003|56012099006|261026140227099003|261022075727099003|261022105027099003|261021121427099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	vA+q/2Hr1ICWxo5tAf1zgOBjKldKWNWvMhuq4NAsgWyWACuMvl99HyAQjWJ87yLRXCkzR8S5NS4D2JakGd0eH/uOpmouBAXK9gqgQ+OSKA1cBKqJstOLV1z4b9lmJpFDPqrZBw8TLAZDvSmMrzJFnQZ0JuDUeLG2AsWp5N/MElHRDxnn/B9fQiziz70BgStFS9nGmXmD4RxMCSC1Z4E6LLVb4VJmMXzE39mkXs8/5sJK37IAT6lxhX7uy7YnvatkGMyu2lcq/y+pu0NLZZVDjMm/xcshr3UZjAuaAsKM+JG8zbnCdrB95aObsinI5jMB0R01tPtFecvzBVyw8uIulrm2Ph9AdcQqf+zjr3M8QAdBwUx67QFUw421qM74cK+uxs8vGKHjP2O01wdjdeMa9PnGsfWhd1zu6C8/gZvrGuJF3gGt6Jl+y/99s7BG0mqyduyYzNtlI8+WwwQP5k8oXEz0VCjlhHbAbAiAWfi6kkHe16rgAKnEuI1H3MSBmagPZBVlz4UVMxqJ+wUEAItzyhK0ApJOJFNi19BhD7yYI8CeHc3/xYK5O92o4DCntaajqQBC/Fi2uBVswgwoXRf7bHTmp0CI8LHbfOLs5rOxEo4AnaeScTZvG0IctolYVb758TcLkaCkWXEaP1ECyGqashcvT5P22dLiYCo6IZICzSo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261028144727099003)(10067099003)(5023799004)(11063799006)(261026121527099003)(56012099006)(261026140227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q+ykvJDtu6G08dX/EBUEe6V5w/mayVHcB6bPeQsQ3YwLQ4fSfaSEUNJD9ttk?=
 =?us-ascii?Q?UematsUf1Ghw/TMUxnsxP2BtsQy9t1ibN5ilKUSDtNEo1UBDXSQUKe6v0qz4?=
 =?us-ascii?Q?NpnEnuRqo0UhZXy4SG5iSVOM33uk3tgSjS/a0xqYdPFLDyE5gp/G093JPvoV?=
 =?us-ascii?Q?BL1GY1rlmpw3LvKl9zVuvLpo82PQMIrPVlJ70gN8C5mIw/96snizxORQfb1x?=
 =?us-ascii?Q?6q4Wep2xwqp6BqLCB499oFyoz7q8Xh3KuOL2ZIkthn54Cr+DhTQeLcO7YIQq?=
 =?us-ascii?Q?TJvykTOgi0rGv+JhpQAG7rtXJohBZTZCefH7balgzdE7kPifkuCzf2JEpjr+?=
 =?us-ascii?Q?gqLFQ8E5UVr50KyBjymuTsBKWcT091mshk2XkgqHohja5UKLbZ90PdmcXkTS?=
 =?us-ascii?Q?o4YBaA6ArILKuKulHLnQeVolCFpEGDWLT/hKwazgCwGOCn80xmB4yKHPXwI+?=
 =?us-ascii?Q?d/ugcNXourBBkvD6ef4vdjJH7uEHLflxlgjeWXQ+GTQeccNLhEGgjVwDpvzT?=
 =?us-ascii?Q?PwJ0qZXPSKAnozqIlLlyBPeNUUvw3Yzn67VDNXCV3YyPyEUn+IaeqOqfQWeH?=
 =?us-ascii?Q?SGh3lq7SGdlSQQ2zBLw75aSzplvk40xf1PSFq7vaYFoCYbW9Vm5HuefQf+5B?=
 =?us-ascii?Q?N8YYcWaaZ3USVrihOkDUaB0uXS5+97K3tEsC64jHKM22d9G43RyeuqF8AmOW?=
 =?us-ascii?Q?bZ5Ga6kxhdVpejOBELlkC4RjS1xm3V97eKhJITZGp+Oh9AtD9wE2USGV9s78?=
 =?us-ascii?Q?NcW69AvCLg11FS/LtuD17UJ2ryWKU2oHyCf7wSCvemQqf+7tCnmBM5IXdHuh?=
 =?us-ascii?Q?mlh16L0pfIVWZFqsBTpJQ22Q+LVY6PZnBXDfbPm8lAsz1o0oTVJj9ucPoRT2?=
 =?us-ascii?Q?JddXocWH6f6ckojfsjOWgjELiFnuTlmEc8LEBebHALfC61vT7FtuL1scetUo?=
 =?us-ascii?Q?uu0ArUm7RaCGfGZRIL7PzkNsoSBRMTUNBvJ9n70BXjk3B01Qlts5kAjOQibC?=
 =?us-ascii?Q?35z1D4P2oR5owwKx2Cns0qS8NoszLIkKPUyY0ftUCt5aXAOHCPo7ychiSfaR?=
 =?us-ascii?Q?agOFL/ygJfp3U1z/Tse/2CbMNfkRADjfIZGqm7mriYvKxWN5affPPssz/gml?=
 =?us-ascii?Q?cZG9LWFN8kgrwqyqdv2MTG7d/7PHDXFqZg8vBwtxlkwzYwDlyaht6c0tyOeD?=
 =?us-ascii?Q?gzL1+18DZPIqUVSZEAgfMbrEjEoIdsYrExN/Z/TSZX9ATbf/MCKW4sCeRJUs?=
 =?us-ascii?Q?hA+oEIq9jCaMxeKLf8Y7XwepQ9p8gH8zxa7sHNCdH0iolCBHvMLyoFGoF49O?=
 =?us-ascii?Q?0msmXxFDV6zGdHntS1RQGSiUi2bkoA9ozQ7WJcw4PwCwupXcgnDZuKoLqnmc?=
 =?us-ascii?Q?vEArCUgTDZiQfNx2nFwbbn7U+fEXReQmbHjDfaZzXM8+6xd1UldIqc2DHGKN?=
 =?us-ascii?Q?JPUHPKYtm87epxbCd9By8MkGaJhIQG+JKHKgW920KvjgoqNqqa0pmShVDTNm?=
 =?us-ascii?Q?ulbXOVGqvjfCO4Q62UKwXepPcvCZr4roL5GeB1P7RgSWp+x228JlxOedOMw+?=
 =?us-ascii?Q?jIN1GD65Vql8MAw7HE1mmKG+KEs2Ed8o5X75+bLb9+hu/aivEVDgH74HgXrz?=
 =?us-ascii?Q?DDTX3wpZ2AaCQrJXH17WLFT0WEExU2JnEIpJsW6U/tsXUwlgNNtNY23SmKmW?=
 =?us-ascii?Q?/LfoIXaEDAA1JjIleSvs0Z2wCnkndtSgnYLMQ9y5g5ekSWqi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbf8d93-81af-41da-9036-08df41beea38
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:47:14.0262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8rKi8yJRO7PpLgThwHAsF1Wi9boFSwDKXLYqY2ipSG4H746EUOexxJTSSQsbPWv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4234

On 13 Nov 2026, at 14:26, Gregory Price (Meta) wrote:

> apply_policy_zone() assumes that policy->nodes intersects N_MEMORY, so
> it reads a bind policy with no N_HIGH_MEMORY node as movable-only.
>
> On systems with CONFIG_CPUSETS=n, nothing rebinds policies when memory
> is removed, so offlining all memory on the nodes a bind policy names
> leaves it with none. The policy is then treated as movable-only, and
> movable allocations are restricted to nodes without memory.
>
> This results in allocations failures, a VM_FAULT_OOM leak, and then
> an infinitely retrying fault that hangs the process.
>
>   page allocation failure: order:0, mode:0x140dca ... nodemask=2
>   Huh VM_FAULT_OOM leaked out to the #PF handler. Retrying PF
>
> Ignore a bind policy whose nodes have no memory. policy_nodemask()
> already ignores a bind policy that does not intersect the cpuset.
> This covers hugetlb's policy_mbind_nodemask() as well.
>
> If the nodes regain memory, the policy applies again.
>
> CPUSETS=n with HOTREMOVE=y is unlikely a common configuration, so this
> isn't marked for stable.

Also no Fixes?

>
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  mm/mempolicy.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>


Best Regards,
Yan, Zi
