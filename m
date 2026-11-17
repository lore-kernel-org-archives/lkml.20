Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794936608;
	b=d+PpoIfksIthNsc2EfQ6gvyhHzFluVxI2krcyCoU4CQLDVqAddKeKO5ajafR55QrCjGY
	 +hvfgUl0D1YKlmxMhyApyAKpvYPtD+48XPt0gn97QFWDDoGXoTUH4rUyYZwZvVt2Hox5C
	 LIGC/nY+0s4Q/ecjNgYngFwsq9+NlYs0XBj38rAD5lo8UUSnhzacHQhOvzQLDxzVNwzNK
	 3WIhVrL20QtpYSyrVxX2Qs7jXJHtPOyGudCMxtfHwirr5o78tEUcRFFddtf5FV7nyV6py
	 OxTqiUxaO4oZmsHeetWoSkCHxsvE4dPbAirEw4ipXA4DbswfOT27UctDiV+4Dc2tKDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936608;
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
	bh=aALfBnHCZOzfuylqdTOHOun8tGX3lrLnramFxzlcGnk=;
	b=kH9GTh65RYB49eaI2tdieTYBWTOZmS8A9KqFboncwImgJwMIccNJzf1YWmLabFww7r0t
	 HlWBOUYwnleh5+9dp6fEXHVE7meqVxlM7sP0HYWZRZxpj/AGjw9atSWUwnHVrdFByT6Aa
	 C4drrmOSZIzhjOE0KY+DjAD8VIM+IEumn69bewSfFkCjyXNxncGhUjDHMNLXdl5b6bBWK
	 i9vZl+mRlsCs/WHwmVkQZtlUsKQcOb/8Th8XP651lhNsViZoc2IXe6k55utV9BoMnVnIE
	 xHOUXjUe4a6Lbka1DRAtQ6oPHo6qM3Eq3c6qo9+u2A7ZcsxvppC9NPbmNm2JmxaqD7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Po2hNBbv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.12
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011012.outbound.protection.outlook.com [40.93.194.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED7D606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED7D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Po2hNBbv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMuBg13PqPnDBSHEo93wgmSekhpIwiH6ABeq+dAQh56ogZE5OO6l9myAdL+zD6YlO5veb/EqogiiDopU6K6GdDw4bmKukfNZRs42f5mrpP+FtTQ5t4SrRu0b/OOr9+5bv216fhdDZsVH2/AmTzgjhZsEss4GkFyS/sTh/b9UU0rDvmP9AFe96oAIqlXtRxMxWD9a8TM4xqaq/yduAl4zMt/GWeQSAubUEYBFm29pT4k2mDkkgjdfJtqST81Au6jP6a8AG3Y3dl09QMcJKZWfl94m/zvEzi6pXY7y7eX9nyidiyfQHdSI2lGXV7LtPU1f9v8asqnrQcu19seejOK1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aALfBnHCZOzfuylqdTOHOun8tGX3lrLnramFxzlcGnk=;
 b=ERNuKLJVFxYX0BERegE5h7o+kQf/vVYdoVpKbEPYehcXIl5xkmDC9K2R07Jy+NNgg8Xx9P5AL9YuWSe5NyvkxGXdDh8ToFLO6TXAcV5gGvJVpoO5pzcWINY5SrPfJTbg5SKQyjZlaRh3E+gXfUVayYzJ7NgNBxrDI6t5ZARVCipok2pMnJB9vox3fmp5M6qAJYP7OTYIny2GGPXgkRmzn425WjlSw/xFSFK+YL7b3p8z0oouVEvZCLs+9l8vRsLXzKT6dpXCDaG6Nv2FHRfaXXCyDZmkpg6urbAZeGAt8gXL5p/nMKGgyjyxbEdA5zjUxZngPcxYKKCVGB/MCL/+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aALfBnHCZOzfuylqdTOHOun8tGX3lrLnramFxzlcGnk=;
 b=Po2hNBbvUt8uVljy0kMdqNSstA3QhI1UT3ylrGRhsseyOVyEtrCacunCpwf3y415Xgg+f5v8Nk/5JHHLZKP/nMRKhi/h6Yb6UzjjEvp33EmQ4TTlt+e5rRUc/nDPSZxEOf0LnM6B1IiLGcSCa3GtC8Jq3q5wgvFaUeRGjrTeVPdqWHfbCg0ESKIuzr2gM5ZeHvkHZGzxQz+cdAQAfwWWpBqQFaoKr6eYOCpWbiP+yale8ukCAEEf5z4WF6SGKLTeHpuf5xesxr2iCvpYeOigymPZSasuGCpHh9W+k16YsWlHxwjIwAIwp24zTJVQWmlFuU5lEI8rIN2nkt1wBck1aA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS7PR12MB6311.namprd12.prod.outlook.com (2603:10b6:8:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 17:29:53 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 17:29:53 +0000
From: Zi Yan <ziy@nvidia.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Dev Jain <dev.jain@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] mm/compaction: do not skip the free scanner's periodic
 lock drop
Date: Tue, 17 Nov 2026 12:29:50 -0500
X-Mailer: MailMate (3.0r7038)
Message-ID: <94C597F1-DFEB-41BD-ADD1-A6DA0A9875D2@nvidia.com>
In-Reply-To: <20261116125746.2897395-1-kas@kernel.org>
References: <20261116125746.2897395-1-kas@kernel.org>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: MN2PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:208:23b::10) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS7PR12MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 29724617-e81e-410a-e162-08df44d063eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|18002099003|22082099003|11063799006|56012099006|261102123227099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nXSt+5+udoMWXS1aXcHo9nUhvRD5g7H+IpCHSoYDCPiQAfyqXzmAffKv2UTCP71VIQsAsLrIaxvlLlSXOtBzAODcDAZbal8H40HtpGRdIgfXPFDdINXldconFJkN9RgB2FpOxyaSAh+nuUMRb7vihwZJZu94UDZ/zwTOI336gDPJOlcg35rJAZSZqcSuP523ddk/bspDRX6gH1ZZa3XnGb6gs4+oo/Y/md9+fRJrAFkhVN1u1MFe4IIiZiY+kQFyenz5lQPwrn6i3M0rc3mVx5+7VXmkCgH+WMxDvUgkm7xK8zfmp1k+gcVRJtZZP+0NgX1tWY0RbSIPZ9gc10GGdeTmxEGyQ6ejQoy960igZ4g8tox5DluqOq7pkAgBBH738iJ+P7hqBBZEtfclidPadsAP2Q2/0iRlfT9kY9exZsd12cqLsqwj99ipQX9bKh1Gkbro6H63KOk11I+7fkzCKkJg/VDPB/S7e5L2+FC2k7+5o6xIyBx3ZC3LdHwu2PDVO7X8O8LvUGVEyOH70nP5Vd50mMhoBphM8JLnkechup0WrEGzylBdqM3TXWuafUYNLWn2l1yVTU0+RQaAjBXIeTdfCfV8m+Fa0sc5RUTqzKxu4ZtZOLY0LXLECXthcfmjlutLxKjyiQqpoyMBmGNY4r0CoSO9Qp1RJyqpPPgVuBk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gZOMzmOMCVtig9I9VLfH/vrec977pqrychAFkqZMFKCo86UoXWrXdCwjCobg?=
 =?us-ascii?Q?naCcp6aLIDfkFLa1fXGMP+FWUBeU6FXDWzvmQx1Oh+UY2jpUcgZnfYoSgiSg?=
 =?us-ascii?Q?AQb9Io5L/JpOyi+f5olGQj6DOYG7RzNGBYWPzGsOVsUV5xl1b7cJM3aoXVyD?=
 =?us-ascii?Q?YPvNec4tbqWTUks0tFDK2o7TA2N4mH+rMonxS4bcgGI3nQXVl7MAzgmH0mt0?=
 =?us-ascii?Q?khDXskhAzsNKPIozOdvJiJZt9KL4IDJI0M+t40OrxhePLJSTjRkoQcexxsox?=
 =?us-ascii?Q?u5I+9EoLxzpcJAWxZIhk3n7QVdkcWQg/eX+SbZaoEgV2jnNuO8l/9SqiyID7?=
 =?us-ascii?Q?83Q0MSTTH9cBLLuVE0McjE/vXBCeUr/XfShxzBN3SuuXgmHXotf+reR2d1u4?=
 =?us-ascii?Q?SoJBJ67cQuimEyUHPQdPz1fleM+P3wKzmGuXFyumNUe8dzo1HBv9efQ84Dvf?=
 =?us-ascii?Q?8JJPviav7/XCcnrMrMxqH8+aH5r3GJ0ud7CDuCLEQQIkV0C75KS/l8hvqr7U?=
 =?us-ascii?Q?WcrZtPq3gyP/vJ7x8WosDOjzyXqJWlBxBpbF1DIO3QlaEpF5YFAXG8sJ/+oC?=
 =?us-ascii?Q?U4i9Qp53SUn32ugNor/8NS1JCFowl1U5MoDhYpQ7ffIeuA4yw1wW0QOofffR?=
 =?us-ascii?Q?X0vbqgcQxb9FXB375N/evsn5Y5EJK2KGAw5Tmxjr1map8TOYkk6uDkYgbngr?=
 =?us-ascii?Q?y4WEut3/Cr+Bt7hpJTrBFYgODLqHPuBPHvS0ORDQisd57veFLqyDlb1O0a8a?=
 =?us-ascii?Q?jJb7dgGnk8wiKenYaLMhF6EjAaxjQHlR91bUOehNQbafmb6l31EuxRHenczw?=
 =?us-ascii?Q?OJkdYyA+ZA/Q1KN5H5KO52lMGKbtr84OLJqqBUiV7d3tj0zSyUjd1YjZVeJW?=
 =?us-ascii?Q?R/bT0Fvdtz5ABF+pmc8t6Atp5RSpyFFqL03yiiTGL2kbIik0ERmgOLNLvnKo?=
 =?us-ascii?Q?FBydkfCpVFmMGr6Uk9NcjXA2BQi5MSc87AhZY8wRLSSj8yCAgO9tAi8vj+QG?=
 =?us-ascii?Q?A+rr98gzcCO4oGccPpWUCm3dqjddxwfVaxzzJIrc8EeFYQY4jPgMefPzvOiG?=
 =?us-ascii?Q?iZt1SqRFanX2ILE5uHPV7GiPUrGhs8o/tpkiy7jS1uhRhoJFX/6r/fz5m1l9?=
 =?us-ascii?Q?m1LPwX4mVopaXyHcetYoZqLZ7T73MZXOyTmx6VMDI1n7IeQiylsFjhRBUzQB?=
 =?us-ascii?Q?2tTjtdjqhBomdSx7QrA92J6x0Ck5QIy6wZDtZnPQ1LDt9xhk0f2M4Vq2C4a9?=
 =?us-ascii?Q?s4e9ppD7/+MmwP4jPBRfTzIK+5cWUhl4xWI/6fPo0dwoW3QLfla2uVfBEInm?=
 =?us-ascii?Q?5Wz2YwjIkzsUuyECe8kEmDXEZbNPdHKqj/FlQOGTqxGmAXLlg4UVBjtPbVia?=
 =?us-ascii?Q?G8ChiZBX4atOGT2Pc4HRU25qFVOOwTlfRsjziUCL1B++TdWa8vyVA9XYpEca?=
 =?us-ascii?Q?/+ZYUsRd/NDwtwsM3a5sJlJUo3lBGxCOm2PdxT1Z5r816u5u8lnU4n5VFGWY?=
 =?us-ascii?Q?6WEWm9edWZBMeZ2zwdePnSwcxb0duidBPMPOFV6DNgnzjf6oGhsCLi1S8Lqa?=
 =?us-ascii?Q?WFFd2wAIb+ho4YrdH/OKzzjxYokLz9p5kVRJk8Ky+s8XGNbqadFN9aYZYIGN?=
 =?us-ascii?Q?PqNP4Dm/8NemAYD1MQGfwq/JZtaTUTJUSFJenxe7NTec/zJtYEPpYeMwaMbG?=
 =?us-ascii?Q?3L5rovXkSS5wuzga9qP6NR1Uw7hl43aucZjWFI2wk7/Ux7Xk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29724617-e81e-410a-e162-08df44d063eb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:29:53.1543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QA7IEWMMQ3QWQkNbTvnl9/NjcxxnGpjOUvsnSgjeqmLz4gL6afs/aZJRpyPdRH/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6311

On 16 Nov 2026, at 7:57, Kiryl Shutsemau (Meta) wrote:

> isolate_freepages_block() drops zone->lock, checks for a fatal signal
> and calls cond_resched() at every pfn that is a multiple of
> COMPACT_CLUSTER_MAX.
>
> With a stride above one, the scan steps over a compound page, or over a
> high-order free page it has just isolated, to a pfn that is not a
> multiple of the stride.  From there it never reaches a multiple of
> COMPACT_CLUSTER_MAX, so the rest of the pageblock is scanned without the
> check, possibly with zone->lock held and interrupts off.
>
> Count probes instead, and check every COMPACT_CLUSTER_MAX of them.

Makes sense. The loop is working on one page (regardless of its order)
at a time.

>
> Fixes: 4fca9730c51d ("mm, compaction: sample pageblocks for free pages")
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/compaction.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
