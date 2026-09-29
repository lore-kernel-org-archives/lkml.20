Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07AB3DB626
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697603; cv=fail; b=TqZcDW7A70qiyfBQNCu3P0Zbf1v1Lnq2JY+rfS1SjGBFSCdtp0EFXBR8qrsDX0gnLqFuqdG/JSe/Rrb/81651wq+56W64WYvEgLEL7TYDLsfy/ue454tF81wrwZ7BfmbUfgx8kPPqj8WkJ/+gmd1rztm2DuOcgy2vJal8D5A7GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697603; c=relaxed/simple;
	bh=r0bADgf/kvAJimhaVKox8Xw5L/0b/FKxrxcE68WIfHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cQmcXxlA/UJIRWfQt0wo61eQmetMOUg9Dv7MJFwO1U9fNjzjK77BMrWUe1sjtduRgqihSXrksbfG/X3tFGcLpI5thgDo9iY23opHXfr6Bu3U4NzMAzaTSfs8EgAFdeArgUU7KNN8rYidTLsYORcjqztMV8suYeHJrFbvQPWmhok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=oKZvV+Ao; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="oKZvV+Ao"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE40es2793052;
	Tue, 29 Sep 2026 11:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=pytza
	scx4NS9TJFVlpmb2Q1/1Q+YaO4wwV7AE1hGbSY=; b=oKZvV+Ao0pysm6BA5gSWw
	skD8kPX8oJ/7DH0ERmdj8KtC1Dmwpx8t6lNkCrdqdf7jP6gp0DoOLW5iLU8UuAUl
	HJhkehjTqhnlt4hEeQEHpO0x4UtwN8vzqjkyiRrhYBrkzpx160R7FLqc+OyET7hM
	tC6GyfhbAOSaXG8BvgEyYwyEOJFliTCubBs8wq2wnAElPn+WTQYgLEMK1fUZKCkU
	sSEv+dmBFPxZr1RoRlfLDrW3i/FMlCtiWuwGU3WctgBMIznyOdgwN3G0l6ZsWD5m
	AAETP89phMoYuKb0t6WchU0k6mOCuvkCwE2MWb5Vc5GRBZOJxgYpux/13QCHQaI/
	g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010038.outbound.protection.outlook.com [52.101.85.38])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gyqygy71a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 11:59:22 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWjK7qblvNRyMYxONNU1Wrk1LlVcvPoM9xFlk79C2fFKWBDPCQXSPnZsuL3Qt7DNy0dJxHiUIFbhP+aPH5JmAEZ1uTWNipNvWonAw4wR86BAv+4OWEEaAwje6b3Z8QiGDn8nBGO5O6xDOwOagxmMW/Cyeb2AukgVdNXNMP4b2e3dK0RAKKQC+so33shlLKDytlKPOczukKfaABJXj4wO1K47T/Fkt6W9yWcFhiQIYxXcfI/4FgzUF4GDFd4Mehm9TwiEFWy1+bwoLLHyTahnZxe3FcAXrgwUapqwOV2Iy/zS1PMJ3ErP4rIBAzQ8NmuEZL4Q8eVCFNo4siXg+IOxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pytzascx4NS9TJFVlpmb2Q1/1Q+YaO4wwV7AE1hGbSY=;
 b=vr5DmGAafjs0u+9H1dXoCQjjlGAtxmxUmz083ceH1FMAIojZTcI+b+CUC96zQUdBjyDRbwGvN2h5cIM3DiPm5rt+Q3esRm79/VeLC/lgaNYcY+zIkSUMt+N7h//KYQb8sNFLR/z2Ynoo6qQOPCu4vzb4LiCYykVdvPf4hnIJZ13HsZazPuK9349L2unnRqJStOSakaqjOe2EAwaQmXGIfikgcdBWe1v5LKwUScgHSEPhFohiLP8RMoeg3J6bT3kTlxBo28Mh0rTRvqU6as4shJM0SPhoDj2cAbhNO6Kh+Dj2CpGRCT5QxA7gjwrtrYX8mjMHnfcgotUhDBuDF3T+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by DM4PR03MB5984.namprd03.prod.outlook.com (2603:10b6:5:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 15:59:20 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 15:59:20 +0000
Date: Tue, 29 Sep 2026 17:00:23 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <arvgR1vN66ChzGjO@nsa>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
 <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
 <aqgRsP3cxzcLok5C@nsa>
 <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
 <aqpTO-5LTLtRXaY4@nsa>
 <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
 <arqBm7OpMHuVhzg0@nsa>
 <DLRTFDVTU3XS.2Z1O4PO8PBM1D@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLRTFDVTU3XS.2Z1O4PO8PBM1D@kernel.org>
X-ClientProxiedBy: MA4P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::20) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|DM4PR03MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc0dc1d-1fac-49f1-bfa2-08df1e429f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|5023799004|10067099003|3023799007|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MK5XssiVa8qqOuVRWl5pvIg3Ju61+TLnpahEI5QKtDDO8hE9OHVF4KCwnfEJdsOLkQPYwskpyZ2+igirRqntLi6G5LLj6iAkP46PqV0e0NoZf8OkDEattgaSUHA5sf5uSpLFB5nCtcgeve8cah+byg6970QFBH/5Io3umWV3bTWiXBj4c+u/WVMbbUG85MSw5CStX4nufLqh1ERUPWjyK0mfAamVW53UAXK96wHSUtZB4MSaz9I5d79HkjapAuCrIPtkJ91An/efNvsDb54bj3T7S6TtaIfv6CifEiS+I5SD9f9ZkdQlyjGhamsPhWZevZHGDk2T2QEzLPylgM0gf4obIKD7uhBIBi+N2rLgy1Ql6d48i3WHBrWUpplPdYU/L5Rax/a9npZa69qvIkj/Q9prejos25CEMkbvPspnSefiUNDT7kfSa88U6yDMAKC+FN9gcg7UvmJLoB5MEXmXSa1pJSxKPYiXQPerg+FoHAjG9v7gyr/sH+M41HqD8S0RYVBkpvz36vxurJeHsicuPbclJqB9GsKte1aOCW++tGB6Nnx/dHSWyn6NY8RukdoWT8It+66mC8Le63QLD/VY/9u7KhfXdYhAiKvGwSMwDXx0Q6NAIO6akNM4s4wGdS5qP5W1Ovl2aqRyvfsvUtfB4HLkivk26sxznB3apMBJzAQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(5023799004)(10067099003)(3023799007)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azZIQndUY2pmd2RxaGRPRTBjZWZGUmRwQkVzRU55eVBPOUdsQkhIenMxL0l6?=
 =?utf-8?B?MEUyVkxBeXIxUUZxbFhuQy9XbElRZEtoTENXVmFKaUkxcTkxRlNyajg1TmNX?=
 =?utf-8?B?T2Fuc0k5angwQXhRZVhmR0o3SFZtNURYVExTVEV4bTl2UWhvNTRNdzZuUU1Q?=
 =?utf-8?B?WkUvZ3NMNDFmaWg5SGdpN0Zyd2Q5RVJjYXdUU0xtamlpOWtGVkduZG94dXlr?=
 =?utf-8?B?TDRjYkwrTWZVR2svbUdNZlFzRzdCMFlENG9NKzhiVE04T2RqU2E1NENmUXRw?=
 =?utf-8?B?SW4wV3g0SEpmN3hkcGRWeUZFMCtTU1h2YStNTUx6eE5TZG5DQWN6elVoS2hI?=
 =?utf-8?B?TDdEY2tqcmhtQnpGeUxmeGUwVzJ2OXl5bVBzaFhLYXpSWTJFNHZXWjlqZkdP?=
 =?utf-8?B?Y3NTN3I2bjVzRWFlQ2NMRkJhOHJBUDFxRWxTbzFnaUlnZ00vYWhsTVRsdU13?=
 =?utf-8?B?NWVQeXpNM1NZOHdOZDQ3Ty9wS2xreVFzZzJobTE4SkxFbHFaNDVYOFdTRWRh?=
 =?utf-8?B?YXlvSVRndHFPZXpTWEFobVRJSnp4TUtsTE1jNW5LRVdueHJabkFabDVUSW9v?=
 =?utf-8?B?c0p2V3FTUVJVazVCci83cW9SdWswakUveXkrR2UyZEJjdjJjT09HU3R4Y0pl?=
 =?utf-8?B?MDVyczlyWWttUzRHNnVrN1BpTW13Uk0yaFV3K2ZpVlhOWVIveGpZZ3h2UlJG?=
 =?utf-8?B?MjU5VVpxU1FYZThjY0Vob0EvL3F1NUJQVGVhMy9lRkZJVGluN045M1RTNndC?=
 =?utf-8?B?K2kzM0h0Z1lTWXdxcldFQmtIYnRUWHBrOGxEZm12NHFXNG52ZngvU2xKWHNi?=
 =?utf-8?B?MDFIMzROS0l1THVIa05UakhjTUJjUTd6VmVyWWorT2FsdmpBU1g5RFRxdHhC?=
 =?utf-8?B?UVIyb1hraHBWTU5qOW1YVkpRT3hnSWprS2ExWTludS93OGhUWFRVbnB0MGdQ?=
 =?utf-8?B?T21zVTkzVVprazJ1NWhwOVdVZ1A2MW5nSVJTQWFzT2hUMFlObmlubWczbWxE?=
 =?utf-8?B?R2RrMGMzaDBib25HRUdGMzFYTkZQSDFlbURhOFFWWk1FdGRmVWhlYzB5TnhX?=
 =?utf-8?B?NkNSb0gyTmoyM2JLTVhlQjN5aFQyYzBQSlR6ZmJwOUtHN1RDZlNvUU1RamUr?=
 =?utf-8?B?VEFvd0VaNXlRTzhZSUdCRmN0K1dEZE93ZGwyTjJWYnpGdTh5NUFjY2lISmxP?=
 =?utf-8?B?SDZRc1Y1M1lYRnVpdzd6aUhPT1BydFBISHhLWmJTV0RLMjZleDhrVll3R0tJ?=
 =?utf-8?B?SkNqME5mN0tjOWk5U0RsejNvUmhZOGl4U0RFRlhqaHMxaHk2Q01ranh6ZG43?=
 =?utf-8?B?T2EvelJFL1VSdm9mamJ3MnoyZFJOKzFydTVTd1hnNVpJY1I4czE2c3RUQ2tD?=
 =?utf-8?B?SzVzTWtTOVphN0lHeVJkUXdGbEVGeUQ3U2UvZms5VUh2dFM3YnV6RXNGbG1C?=
 =?utf-8?B?OVhSRldsRCtleS8wQWtRWWFBcEs4c3I5K3dybTdpUVJRdjB2L1ZYM29NYXJI?=
 =?utf-8?B?VGFpVlRsRFlQOVFDWVZnbE5IR3p3VndJaGNXeityaFVraGpZaTVjZzNiUDV2?=
 =?utf-8?B?SENqVTNiS2NXV0Z2WW5QdWxlenppckE2SHlhVGRaZnE0OEsya05GRnVHNG9I?=
 =?utf-8?B?RUpDa2swVUNGS2xyOFV3L1FDQWtGSjhlZWZsR3U4UnN5dGExRmVIYkk1ZkIr?=
 =?utf-8?B?MEZTTlF3cVo3R2pXSUc1WXJQTiszYUZiY1N1Q2V5NzVVOFFzNUVIVGlJeDI4?=
 =?utf-8?B?M2lxdEJZNTkwQnV1QmxEQWo2c0g2ZDZsZG0xbnVxOWZGNk5MbUxYQkVtekFO?=
 =?utf-8?B?SVZDWGtnSU1sRUZTcFlEU3NDQ0JTREpmYXBqM2pOVlhSeDRwdVBhWElNcTN6?=
 =?utf-8?B?VzNISEFyUnJJb05CUGI1bk92TVlKYmV2QlJmbmV2bi9WckRmWGFSQ3dSRjQw?=
 =?utf-8?B?ekZZSmtaVU94dlZBaFV4S002dlUvN1Vld2x0QzVzQnhnelVMbEZXcXRHY2dJ?=
 =?utf-8?B?ZFlVNUVRdnNFcjBzbzNnWjRxaThhQXluRHZ6Q0NRNFZzVnp6WkREUk11eGQr?=
 =?utf-8?B?Smd2OWp3L3I1cjczU3M1OXppSHZxdkdkSXh6VXoxZDYyMnR5YUwzRGxicWVs?=
 =?utf-8?B?aFBkWEVQa01SckZ4MUlFVVRKVHBHR0NFVVBWVS94MkJIZSs1cnFKRVdGcVVQ?=
 =?utf-8?B?Y1BlVHgwY25CZDNpaHEyWVJUT2ZNUmFZZ3VKdGhZd1ZkUS9EQThMa2laUlhY?=
 =?utf-8?B?VnN2eFRrcjJHZitrSjZWbG1kVzhxYUszc0xGS3ByeGVha0oxRnBpOXc5bDhP?=
 =?utf-8?B?R2t6TnFjcGZIZVZMRU5PczBSUzVTZW5XdGVPb1UwMlBySzB6ajBZdz09?=
X-Exchange-RoutingPolicyChecked:
	fMUhBYS3DeRsP1xEevv7tRLgTQ43kGnJ+EqExBzhhPmhWvluT/lJhmEtn65zBaSiUCLmI6UP0SrTpS2bHel1vR90D95uI/6/XaYJk1ZCgWwF535VZ+7Y4hug0vcZJ20sYBXOU56JZivEk0bLxvDWQWCUz9nhzYj8d86FyglgGfDeynNb0hEkvERlSjd8un4TtKofW0JCOadQUYJOGSam3hurUxiFkS4Mcvv65Z3GRB8eNt8WPuQwosH/m5hdHITqnBGwOWCJT2ZJPBrs16PXH523KwIElbbyy685GsNP5PESqBMNoUxwogpXmsafrFgIrymsIBnl28c1n9ot3efplA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc0dc1d-1fac-49f1-bfa2-08df1e429f59
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:59:20.2584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WapPzRqfed++WdGRXM+otY098/Oxw/cikzHNBExsHcwI9x9zZeFgZpYr8/f/fFp/+3Ps6EvocCfcI9V5qvLMtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5984
X-Authority-Analysis: v=2.4 cv=CIu/zhrD c=1 sm=1 tr=0 ts=6abbe05a cx=c_pps
 a=EPZJxM4MYJNUcCtligPUUQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=fxxGF-MwVb8NT6w17VMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2sXYauPR95pGqmndctWE-3vKI-4bNT4W
X-Proofpoint-GUID: 2sXYauPR95pGqmndctWE-3vKI-4bNT4W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX9ixGKBghr/tB
 uMYi4R7hIRrxaMAjZGngtGV3vkmtzEJrWasZzXw1FRJpyk8kBHMxCkLkwRaAx+1oVnXzDVvG8SP
 rtmSfwihSyb01reTg33XS9ITvJpUCa2u7oPIBdYZoqIbBTXdc3IL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX7MgAwBg6FVGI
 EL6ZnxVpfJDvS1gn/ObOv54VTyCm3pPGeRbZb0Wy9HKfQAdf1ivThjIUqDRUHYErZiDJizgyHBm
 h0IKw58+d897ZOSNsPa2zXkfHsjiy+97hYwrPOJgEW5Ct5DkcmNp6tLoQiVxkc3Q9dT0bMo8opK
 Xf604IKH+tv/7n5WnpDpw/R33PQoeyuSCOU6u3Bqloc5iZRUwmPU5uWViqUFGFRMrMsrlNYRMwA
 gZRn910eg65ol+EMmG/QCvyRFDTc+eQzga1YTeei+8ZzwzVmdp0Lqvb2uHOw3i6/dVth8pWqSDL
 0CDHM3bk+4FN92CsHBuKsL2+Ljti1saTt9XOCi/wa7CC8gc4uCDYO3gIHxAFhNYxIZYwoeFW1PJ
 G9DD2QI45nY7b/1USfROvqk1k/jZzjZSeC/olZ1FlwQNiYFplR1UzjeKYtbo2qOJaNOX8l78/T5
 jhhEIy6ZsX6LZDCH+Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290063

On Tue, Sep 29, 2026 at 02:56:53PM +0200, Michael Walle wrote:
> Hi,
> 
> On Mon Sep 28, 2026 at 5:03 PM CEST, Nuno Sá wrote:
> > On Fri, Sep 18, 2026 at 11:25:54AM +0200, Michael Walle wrote:
> >> On Wed Sep 16, 2026 at 10:44 AM CEST, Nuno Sá wrote:
> >> > On Wed, Sep 16, 2026 at 09:14:52AM +0200, Michael Walle wrote:
> >> >> On Mon Sep 14, 2026 at 5:31 PM CEST, Nuno Sá wrote:
> >> >> > On Mon, Sep 14, 2026 at 04:04:40PM +0200, Michael Walle wrote:
> >> >> >> On Mon Sep 14, 2026 at 3:42 PM CEST, Nuno Sá wrote:
> >> >> >> > (*): I should note that the command actually failed with -EIO but it
> >> >> >> > actually unlocked the chip! And the reason is because the flash as the same
> >> >> >> > FSR register than the micron-st flash. So WEL is set to 1 but can only
> >> >> >> > be cleared when clearing the FSR register.
> >> >> >> 
> >> >> >> Why doesn't this affect only the locking operation? WEL polling is
> >> >> >> used also during write and erase.
> >> >> 
> >> >> Sorry I meant WIP.
> >> >> 
> >> >> > Not sure if I fully understand. But AFAICT, the reason why erase and
> >> >> > write is silent is because the default spi_nor_sr_ready() only looks at
> >> >> > SR_WIP [1]:
> >> >> 
> >> >> So usually, the WEL is cleared automatically by whatever needs the
> >> >> WEL in the first place, i.e. program or erase, write (status)
> >> >> register. That should also be the case for this flash.
> >> >> 
> >> >> Now for this flash (as well as the st/micron ones), there is one
> >> >> peculiarity. Whenever there is an error bit set in the FSR, the WEL
> >> >> cannot be cleared by a write disable command. Which we shouldn't
> >> >> need anyway because it should be cleared automatically if nothing
> >> >> goes wrong.
> >> >> 
> >> >> Also the write status register won't set the error bits if i read
> >> >> the datasheet correctly and it will always disable the WEL, see
> >> >> Table 29 ("WRITE REGISTER Operations") in the MT35XU512ABA datasheet
> >> >> and Table 8,8 ("WRITE REGISTER Operstaions") in the IS25WX01G
> >> >> datasheet.
> >> >> 
> >> >> > OTOH, on the unlock path we do spi_nor_write_sr1_and_sr2_and_check() and
> >> >> > give no special handling to WEL so I imagine that we try to set it as 0
> >> >> > but read it as 1 (given that it clears only with FSR) and hence I got
> >> >> > the -EIO in [2].
> >> >> 
> >> >> We do a RMW, so my guess is that it's the other way around. We read
> >> >> it as 1, but then after writing the SR, it's 0 (see above). That
> >> >> actually assumes, that if the WEL and any error bit in the FSR is
> >> >> set, a write status register will clear the WEL anyways. Could you
> >> >> debug that so we are sure, this is what actually happens?
> >> >
> >> > Sure I'll do some debugging on the unlock path. The DS seems a bit
> >> > unclear. It also states (for the WRITE DISABLE)
> >> >
> >> > "...In case of a protection error, WRITE DISABLE will not
> >> > clear the bit. Instead, a CLEAR FLAG STATUS REGISTER command must be issued to
> >> > clear both flags.
> >> > "
> >> 
> >> Not sure, this contradicts each other. As I read it:
> >> 
> >>  - Write (status) register will always clear a WEL, the only open
> >>    question is, does it also clear it if the protection bit in the
> >>    FSR is set
> >>  - Write disable won't clear the WEL if the protection bit in the
> >>    FSR is set.
> >> 
> >> > But the truth is that the second unlock I did came without an error.
> >> 
> >> Which might indicate that a write status will clear the WEL anyway.
> >> But then it might also be interesting to see if the PROT bit in FSR
> >> is still set. IOW, if a new write enable is sent, a write disable
> >> might fail even if there was no actual error.
> >> 
> >> >
> >> >> 
> >> >> But the question is who is setting the error bit in the first place.
> >> >> And I guess it's the testing sequence for the locking when you try
> >> >> to write to a locked range. So you could also actually test the
> >> >> locking/unlocking without writing any data to the flash just to see
> >> >> if that is the case.
> >> >
> >> > Pretty sure the above is the case! If you look at other tests after
> >> >
> >> > "Once we trust the debugfs output we can use it to test various
> >> > situations. Check top locking/unlocking (end of the device):"
> >> >
> >> > Everything worked nicely given we were just doing lock/unlock. The DS is
> >> > also clear about this (table 8.11):
> >> >
> >> > "...When a command is applied to a protected sector, the command is not executed,
> >> > the write enable latch bit remains set to 1, and flag status register bits 1 and 4 are set. 
> >> > If the operation
> >> > "
> >> 
> >> Ok.
> >> 
> >> > I also did tested with basically the same code as in micron-st and then
> >> > ERASE and PROGRAM commands just return -EIO.
> >> 
> >> But the unlocking does not return EIO anymore when it's executed
> >> successfully?
> >> 
> >> >> >> > AFAICT, we should do something similar as micron so the writing to an
> >> >> >> > actual protected region fails rather than being silently discarded with
> >> >> >> > that status bit set. The question would be how to do it? The code is
> >> >> >> > pretty much identical to [1]. The masks, the opcoded... So should we
> >> >> >> > somehow handle this in the core (by having some common helper) that
> >> >> >> > could be set in .late_init() under a common MFR_FSR flag? Or just keep
> >> >> >> > both implementations separate for now?
> >> >> >> 
> >> >> >> I'd like to keep that out of the core.c, but also like to avoid any
> >> >> >> code duplication esp. because there is already handling for the
> >> >> >> intel spi controller in there. So maybe move it it into a new
> >> >> >> common.c.
> >> >> >
> >> >> > Also don't like the dup tbh. Could that be a follow up or should it be
> >> >> > v3. From the top of my head I could think on a mfr_common.c kind of thing.
> >> >> > Don't thing this FSR register is standard?
> >> >> 
> >> >> Not really.
> >> >> 
> >> >> But (at least) parts of the datasheets are actually copied verbatim
> >> >> between micron and issi, I wonder if we shouldn't just put the ISSI
> >> >> part in micron-st.c. (Yes vendor will be wrong, but I plan on
> >> >> deprecating that sysfs property anyway).
> >> >
> >> > Also works for me. Say the word and I can send v3 with this in
> >> > micron-st.c.
> >> 
> >> Yes. But also please verify the our guesses about the root cause of
> >> this and what's the actual behavior of the write disable.
> >
> > Pinging this one :). I sent the debugging results in another message.
> 
> What is this one? I thought you'll send a v3 with the flash added to
> the micron-st.c? I presume the code for clearing the FSR in there is
> working for this flash, too.

I did sent some test results in another reply (to myself which makes it
a bit non obvious) and asked for your preference on how to add the flash
(in micron or the common code). I guess I have my answer!

- Nuno Sá

> 
> -michael
> 
