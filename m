Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792550773;
	b=0qIpAF2SkIEIVsFZTlba2ansYMi8Sood94uXDR3pcR98z5lCcqK26gAk28ZaMxasD54t
	 5kGjXbJniEjOeTD4ewLK6Xi9cgvTDTr5UXhvditsXvP56goASmqO6rnSDqIPAwtqhimlb
	 101KmGPx2FQQKlF3NZYQeg9nXbk3Qq8bPAA4qyQkBOK2rhh/SqwaQaD5iVlIMzJlMBMOu
	 E2s00Ezbmac0yqa4QwiSmSqbM6yH0wYWU0CqqbvDYoPO9F/eOIdaVUDzh1DWis4unSC1/
	 qPIkDzQ/Yn0RIY83gpX9//u2bwJvs5WHwKXvx/EzqpOVoqGsPfs7CBBJbb4Y/Hyvw+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550773;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-MS-Reactions:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GAQXp2hfsqC6R1JlgoECTYHWbeyQqsg/wbsTbiuaW6Y=;
	b=AYGp4ysfeN3FMjBj07vG3eT6oVki+I6x94ycJM7jd62jeTN0bpmDqDiz/UkyfASmD5yA
	 zNvz6AxQ4IBR7j5QlC7sD51fI0y9DglgIgVW6DZXNHrargEgG04D/Wp4OLYjhnPGosBEd
	 0o7DfGKZDFVLFHFBEU2dmLTVLsOqS4HCcZmZIY2ULFigpnIK+HykOJuA45kO8Ub90m4qP
	 fpwzGM8fMHZtUS8DOTDPJinhil2Su1BQn5d976XQgJ8i77u3GfFue6titvWhuoUDbObrU
	 L2+yclzrW++PSce56AvT7vObCK4K/hqISeVi/v6hHOwIfHq1F24qD/JUcDxjovD+v6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mm+nIE8A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.4
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA49E606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA49E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mm+nIE8A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGciMOj0lsoIGNHOrR4a/lxSkWME1riR5ymjZtWCkozmYCM8/vv8ZxaaQwHh0UIL0JMzl2RNeHiK+BWxwTlwdsqmBRufNk2/u7k/FEtHnAaCRPWR7XdEVcfFVlQ1RVlAFkNwvuA43XVFZBuVfz3itkeL9Aq2samzhtYBuYvflGVQJlANSQADCXqdS03Vu1xg5sGgY1TchiEFr3biSqYSDC+DshU6WUBr3MiaBGk4lhlq31Y08QxLexAIMCunv1cOT1stwyYbDSbB+fblKL1+UM5rjfPDcsGwM7Zsnmc5Q4XmGXuhyq6RIhHkCvC6sLLjank88yIqMMbImphyuArf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAQXp2hfsqC6R1JlgoECTYHWbeyQqsg/wbsTbiuaW6Y=;
 b=ZGpXaB9mc7Tu12vl8VsH2kHLGSOCcJUS9TSWglbwuKg1hSMwReRDKL2Vubn7kq1sJ2XhNHcAXohTIa+gA8oCkgBsYV1fMDtTYwzJ/ty1YjYFfYDe8aCrAIfaEyXuSaTgZQ0ew/KXwLkpxVgNrYBDH3WWr+yaDkRul75KjCi8u8Xpem+FjrEGDzMDocMxdpiEFgXViH0lv3HL2U+lIaPJGCuPe9GcxAEY2TnMooEBNHZaxyuKZAyThxF4TrH69VAj2EFzbRGZ78tmAy37gV/R6bm/OwnsPpPyzoQV8PJWb19xR2EBARHwL7Ortus2YleVmgmJWfmwHhvQp4mOBo4IjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAQXp2hfsqC6R1JlgoECTYHWbeyQqsg/wbsTbiuaW6Y=;
 b=mm+nIE8ARhQ/0/icOmxo3JJN690fGEKneBEow63eG+lk1/ERLiVWQahlzfEn809CT5jEPQQcXAgJRfw5UEMtJeaUC5uHRmF1TImpdHqERPihsZOMMd4CcfIq2Pmes/2r/zNl0hEherrfjwsto5A6q6AePjFM81yynFzN0JjCwck52NXNEG6MytIk8ASSDRi/0ECMvZMApEJcUARydpV+NArsJLJcw+e42Wb7K5wMLroS0Bx2X3MDCuj8TwMVEm2VL/jEL6dtLU9evlXDF3LyQ+jF8AzdD5+WEu+gxgqTzjZqMWRdWMiZ7b4/cHibZrvmdwM9G6NtSrKmLXODPxF10g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SJ2PR12MB9008.namprd12.prod.outlook.com (2603:10b6:a03:543::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 02:46:09 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 02:46:08 +0000
From: Zi Yan <ziy@nvidia.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, weixugc@google.com,
 aneesh.kumar@linux.ibm.com
Subject: Re: [PATCH v2] mm/memory-tiers: reset demotion targets of nodes
 without memory
Date: Tue, 20 Oct 2026 22:46:06 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <EFCCF1D5-731F-4430-A721-92F351713B2B@nvidia.com>
In-Reply-To: <20261021024438.1942502-1-gourry@gourry.net>
References: <20261021024438.1942502-1-gourry@gourry.net>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: BL1PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::35) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SJ2PR12MB9008:EE_
X-MS-Office365-Filtering-Correlation-Id: 810cf1bf-20ed-4cb4-1760-08df2f1d75db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xN3+lQN3PMC6q9S13dIe0A9QPoWRAu9tJCQsIzeRBL10vPGMu2n6QUlNtYzRufXYtb/v09weZ+IHPf0XoSHZi1Rdm7v8JeQBIO5ES1m2gZut0b/AmJaBey0Gt9pf9VmVDflJAGWu7AqPkHIHXbSRsu8Oa65BtC1Pp5XlHXHo14QPIQ9DlzK4yGUO6GGklXyK301PFKKZ/rl1P9vOtRc8P8NTXC7/Fg9KMlUKDMxdRHuC1aJ8rOPGf8g6C+rMfhexDmbOJ8L2Y8OkAb5G8fPQ74w8UVWRLratfTRjyuGqHRCA1WVz1a70X8eHVbQkFUFgPldCngek/Hd3c98T12ZEhtfwtD71NgK8VInnQwZoOOEOccZ8gGfUXN0VH/HdUUsmQghdeMy1Sn24t9oNaztTLw/caQt6S2tGeCCHJ1vTZzQ8jU6gWUB1+/3pt9LNfqdn8cSDSc2uQjcJG/jWStCBVCfEL2X8WIiQfkm+9bgEtUaiA05pb2ViK+ZL8mLhN1uE2jboVEGsUg7NY5UCdzpLvdbL0qnt5AZ4IZOC/oRThO137SL/Sz4F/jRLu5M3E/N02MHYjrnoQDn7VwROcXaD+CW1b9HAfOqsrJkwzZJKqEwCmL87CoHqW8YfmCoyqE0GW664+7uffp88FTo66hrIQBYrKb+1VbZd8edRCBMnq4o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NsGDUh+ilV5L8fMq3AE04/FCCA03D7+w2O+KmxXNp9SiStPcsvSiBoZS0lkY?=
 =?us-ascii?Q?/ypKFFggMFjpmi3iYm8P/yu+Rt4lM69ikzZxZXepffbaMrmxbaTzx1EzpkBX?=
 =?us-ascii?Q?uN9paTEr8vp4swZWWOY2HUE9SJbWzSA42I1KWK+nCqqyCqGmog9l7VyXuIIB?=
 =?us-ascii?Q?CoY2sQ83uvWGU9sfUJHgZtQmTT0jCLogsVLruKDaHpkOpTuMx5DOYMHGKZ1X?=
 =?us-ascii?Q?v+j+6b1Gf4WSIswI4tjyCnYNdQnyJqAFI2DrFgK6U/XtXaPhrRht2v5ufIN0?=
 =?us-ascii?Q?060WNPkz33F5j0r/nZUWShRrf/E285Y8GEsWSM8TiN3Yeeu+SLeSoje+GMjC?=
 =?us-ascii?Q?m7k9wHoPh3UgncVdVG/Nr2xv+cOI7loqJ7A7aHi4oBloqAt2oGFCgjMbsz70?=
 =?us-ascii?Q?omfFRujtwe2Czhoz6ngm3enOwV5vnEOEvW6xOKpq6WAp98g9HFbJanKcyyC1?=
 =?us-ascii?Q?drThPH+oJ0ie67Znc14t6GPn+kFzrFEUkpXMBW5hdqQnuNot41PBVPaxtxhz?=
 =?us-ascii?Q?qyX0Iyd7327ZjQOEaTckcll1j2FT0H04R9gdnrh5RmNtJXC99/vqgZUL3ztA?=
 =?us-ascii?Q?44nMGSMRaSmgufRC70ql435Wf1VxkXesQLWMmcJ+6STg2Y3Xa0QkNX013FIh?=
 =?us-ascii?Q?8BE+P9R9WBndfqbx8/IiPuE4oGjLDcNYr4G5blG5PDwyQX/nzFwuOBePEpMJ?=
 =?us-ascii?Q?ewGFd7B3d0DDbGoi9C/y6tBkN8cUOLAiIdiAgeUbOmD4qNPNRb7LpyKb9rgm?=
 =?us-ascii?Q?9RiYvwLK8Hv/VDZpOH88kStyLWOQn95d1jCgm7GyVR5QrhRK4lUAj7mVSMk6?=
 =?us-ascii?Q?7PyXlvOSrrCB9U7nZ5ZzgPY8fvi4rSkxLP6A/SrIDZ8Dr63VlGlh6KQ3Gzmb?=
 =?us-ascii?Q?PZaXA53yMWlAVG3nD6uYWYysm9rgKBVEBgEHeSasACN9Jsv3dnATL0P4MCWj?=
 =?us-ascii?Q?bbq/wptS0Gr7/60VqmuoN4C2jNiC1DBL/gJ24Fx8EMeY8bSeb5WbOpwT6wpg?=
 =?us-ascii?Q?+exNkZla68DmCpqDGxq4LVZzxthrZd1Y9nmqgVOTJjicRG+MrIZe9GCkGr9p?=
 =?us-ascii?Q?lqecSMpHfCDaQiFc+TZJlnZ6DLG1HnbsH1wheIUwet0zspZujP3vWt8nrEUv?=
 =?us-ascii?Q?GFmnideufqW0DrFM4do9CfUTh4G4zE073A+JpPUf6wEGOomiFwmWohWM71nB?=
 =?us-ascii?Q?aDdXpAj8ZWMVGS/gkZhZEXcOSpfQPERIUpcLsyTC5Qo1S7MiezD1mrNd1sS3?=
 =?us-ascii?Q?6Ha1I72IW3z9AaF350lIm5jJDWSDjuVScSUG7cek25/TyfW6PqyV+5jza+X/?=
 =?us-ascii?Q?ZBrFMerQ3ejTVRi6jnryQADf3SUoAfHgMGb0fVwxOKCT+txbkR4TnqxKPA+3?=
 =?us-ascii?Q?Z/oZ9TDjwnWZjxRV7TF7UEvxvdv5k2HVpoaTbNmUIuSdrp31nJfX0owuG9Yn?=
 =?us-ascii?Q?tYVwoweN6I8DkEhcv0KXo32+g4U3lAN1zC0QfX6LixUwCJU/TQDef6kL4uha?=
 =?us-ascii?Q?majKyDKOB038OBWeSH0p8q9+1VcFtX5OGUslox46C31A9fDzobzAy1euTQWp?=
 =?us-ascii?Q?d1eX8RXdXiS2DvS1FD8ZwEnKRelf9GRomnbcSr/b/gAXrZaQoZW0P2HokpRH?=
 =?us-ascii?Q?KJyEB1nF8asYbPkQKleynPLrmD4S8y2p/gSeqmCwn9cHJW3RyPd6SVYgCKDL?=
 =?us-ascii?Q?dqSvsTn1fVwhBHPAIxlAOmLEhF1FHaa6FiG2BEvR86vUknKm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 810cf1bf-20ed-4cb4-1760-08df2f1d75db
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 02:46:08.8897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+4mqLb9109qfRtZR4yIq0JSBoB4lUAmVd8ySvqDu9PVIHLsRQ/P7AYSTwAxjHUy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9008

On 20 Oct 2026, at 22:44, Gregory Price (Meta) wrote:

> When a node loses its last memory, offline_pages() clears N_MEMORY
> before the memory-tier callback rebuilds the demotion targets.
> disable_all_demotion_targets() resets only N_MEMORY nodes, so the node
> keeps its old node_demotion[] entry while it has no memory. Before
> 6c542ab75714, the reset covered every online node.
>
> A reclaimer reads the stale entry only between the node regaining memor=
y
> and its targets being rebuilt, and it filters the entry against the
> current allowed targets, so there is no user-visible effect. To see it,=

> online and then offline a node's only DIMM: a debugger still finds the
> lower-tier node in node_demotion[nid].preferred.
>
> Reset the targets of every node.
>
> Fixes: 6c542ab75714 ("mm/demotion: build demotion targets based on expl=
icit memory tiers")
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
> v2: +comment
>
>  mm/memory-tiers.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
LGTM. Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
