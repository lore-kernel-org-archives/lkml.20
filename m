Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B6D49EC75
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439182; cv=fail; b=DoBp94tDTGiA/Rn534SshVUYlyF8FlR6wWBMeyEvkqZ89LyC2uI9GpbGfBOxjyB0vEc4lDmSIOl1u6WoWv4r3gXihaKOJk41jBI4Dx67ISVVxJhAcBUZxCXE/8L7qlE2wg2fz2nFxItgtlqHUbV5v4JRjdpR9LhJETm3FGUUueQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439182; c=relaxed/simple;
	bh=V6hSFxtC55a1FDUkjDAsbgVx0cKIhEry5YqSDk42Wt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=df1L+MLxVLVnB7woHbk119miJubWW70jk0/g7x0N98CwyweGxUyAzAxtFgzexoeG3pazrpVXbp82DPLwvsW0fqw4LTnsCr4syarRL2Zwn2ctQ7lxflNgOt7Ezw1M7oGrKaITA1aUwYgvMAmpc2gLXLyJCAALsL5UishTeQOrYbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=fcy9dlNI; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="fcy9dlNI"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AFS82851052;
	Thu, 3 Sep 2026 08:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=+C/8l
	DC6LCOTk3Gwy6DIh8WoPH3szjMLYujc7yAd0GU=; b=fcy9dlNIpkBI5M/lUXvEA
	SrEhQZUFB8I5UPpB6GtaeQxPYK/QMO+3/tWutkoMloV0FI4UeF4LoQSxV71hojsb
	lRdse/sH/tPUZSDb6QWKBtmMTifbLIs8Qmm4EYO3Uf8Eq+6lUDeZ1kM9sWtJeH3x
	PWpBV9HYLXlhgBr5bQ4wUjWsARnSsE6wMa4hpU8huUOeCrAiuTk3iAvwzWGASzro
	+pN8svKqdi5/6dFdSu7OODetVHM3D5GcrgfJ1icb5TVHoosyJ1Gvzs9W/vdhJF4h
	TtQYCXUnr47/moRk3vmsPYc7wFJQIsT0cClfoVsmvU7d+Wba7Y4UkcGWtus1JqmW
	g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012055.outbound.protection.outlook.com [40.107.200.55])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gea7ufpp4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 08:39:25 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V42qEi/CbHAUzh8NlHVpzMWKM6X8ita64YuAlsBiV3E9MePf5q35GjAc4IR+JO6nrbcSaAV+sX/hE2SPB7XvkGi9VMVn9RZljrDYdKPzRVm93urKn2StHrAe2RXzkZMk0PoSqgW+dXdvhEk4rEDaTFKscPrNmrp87T3LdaO3qdfqBk4LiOI19Eh47CeYTesxto8CE1soQx6tRbF+/CdgSwgLGbIv6VoGT59eDAFlVfXbj+yzaZ73KuvoOTtQD5n1w0beVRoMzFTgNfJppALbeAphGNObQ7NRlb06DMoF4kU1RKziSXVVpTAWW9Lwhy/lcpoBsugy96c4rEZhO3kTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+C/8lDC6LCOTk3Gwy6DIh8WoPH3szjMLYujc7yAd0GU=;
 b=yKr6qhLhIXn4kb6yDVI9z0CdmjIHMrZS/Q2pKQq5LACOYQNrtsHolGLi/h9jJiSRBYLCzLqcNpPWZETy6ST3oRsgfuL1hW8v0EnmE/gsFUQWitRl5shXAwfxhcPly44bI1hM4fuPwqAs8S2zewThGLUouI2LPZ1vO7fnLi17XuK5YLO50irn+wSbz2lA7BEd/a5XkjMpUoz8dBUPHwmFOjbTmHLdAjVvNzBxc34gFQ8lVP4O0wxM7B4EP0fOUXmcV2wpMX0Yp2AW/KfgtlYjSpVRC9DAqcqX5JLxRNm31DAjnSA2AUAWc2afvX+Vmddy/+ZtRSKD8I9qMisyFJhCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by SJ2PR03MB7476.namprd03.prod.outlook.com (2603:10b6:a03:55d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 12:39:18 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 12:39:18 +0000
Date: Thu, 3 Sep 2026 13:40:22 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spinand: winbond: Add support for W25N08LW
Message-ID: <aplqm-84OXtDF4oV@nsa>
References: <20260831-mtd-nand-new-chip-support-v1-1-dca9f63ac0f9@analog.com>
 <87h5k64pa8.fsf@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h5k64pa8.fsf@bootlin.com>
X-ClientProxiedBy: MR1P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::19) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|SJ2PR03MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 0181fbe5-df0e-4c6d-eea5-08df09b85eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|10067099003|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	EgD0uUraQ9ZexGuRXV27vwKlRloFo4przkHXS80nYyzMaVFCmI7Bwq47jEC5UnRlRjEJhT5CH2BV7u2qD+2JYPmjeodSlxQOgo8WkonP/1umWTyYMPd5NSqq8weqpb13PrnfENyzYyj7HNlCQBg3L1gXwI307G6DHcw98VFyfnmZQMDDteFkR7qnU3R271w/DMLfzN/B1TtvUGJKlY2CeYwGY7gR7yWHiYctsNTv6XMPY1JA/ZUk9nY71A+l3yqH4y3RzjJycI89fmKwEGLsgVA/nVHiFrhk/G6whLgFT7u2/HoI6TjpQWJC6LIPtY8AsTN5MwB+09i5kwNFGG6cTYyD0OVOn6OFtaCoUdPfgyK7JTDFhLTvpUxvNfB0egpIczg1sUjVzdZTqYsnB4+e0e5Sy+bcERCITxqgkTSE+4tNb5lmtpjSSel52lpoDz0j9brKGLzuoBjdHITW6tFpb8IUbldvqDCT4ntFoyXEAGDtgFxBjwhtyOnTDGkrbKvj8Rp7pUowSGF1BeuqYr+cV0XfEZX+PI1OnzWZBD1/Qpa03CBEuPqYTEhkBvy/ve81iVkoQwDnJQI0VL8rrhmkbnlOuXU7beni3PHkrIMg0Uo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkUrZDVOZDJCeHhxeDlYOWUyYWVSK1dPNkdkWVNzVW1DRnV3TDE2MWJwWFdy?=
 =?utf-8?B?WkI1bzVRNHI4KzdFTjgvNENDZW9WT0pnQVMwbE5jamdPU0x4WTVlb0x1a3J5?=
 =?utf-8?B?MFpjcU1NSDhoSzlhNXA0R1NieVhHUHJwYnJ0ODNMQU9sNXdKUVZuOTZURkdF?=
 =?utf-8?B?UHpzZHYvb2pYeG9ubkdkcEFvdHJ0cEVSTjhQdzVGRi9Lc04xNnJkOFpQelNM?=
 =?utf-8?B?S1VqZDdHbDhGR0JnYVVyQWhWV3BEeFMxckNOY3pubWpXc044Y3pVMWVva0M3?=
 =?utf-8?B?VVNYVVpXVVV6cHc0Nzd3VWErSEw4V3NVRVJBK01xcmpyY0IwbS9OOTRnbHhL?=
 =?utf-8?B?M05mZ1RMNlVzVUhpcHNVbXhERlZubWFyWWtjbmE0V09PcDB5QTZoUVFGcmVG?=
 =?utf-8?B?RERwRVFhaDI0M0lqRElwMnlRK2NXblFPWmRUL1VrNXBtRnNvRUxDVkFINTdE?=
 =?utf-8?B?Wk1oV1gvZlNhakNndElmdjRzcHUvOTRjYkYraFN5V3FXTm5RNlZySFVNcVRE?=
 =?utf-8?B?MWl4T3BVeDI5WEs3b3p6YmVOQmphWk11Y28rWDRnS3V5MEpkaytobzZ4VlQz?=
 =?utf-8?B?cVB4Q1NPZ09veE0vSUxzTXJPd05LUS9WUExvUllFZHlUa0Nwd0lEYVh3NjlG?=
 =?utf-8?B?bnRhN2Y0dzJqRmtTSVgyeEJxUTJpZTBkbHRDaDY1MFFpWTd5alFGM1pmaWlZ?=
 =?utf-8?B?cmtsVzIyTjdzQ3kyTFE0Tmk5STdvNk1raXBnSnRPS0UzbnhXbXlWYzFrUjNl?=
 =?utf-8?B?VWhLVThsdkxTa25YV3Vyd0plbUUyR1lqVjZLT3JrSkJGWmhjY2tVVkNyd250?=
 =?utf-8?B?aGN0aXhsSkN4bE5Za3N2L3hiNVJXendZZ2xFNi85ak5CeEc2YmZkTG5Od1Rp?=
 =?utf-8?B?d3VRVjFXbHJXNkxRd1QxK1VudUVpRkF4dEhEU3RQVUhLSFd3SmJUTE1KUDVE?=
 =?utf-8?B?eW1sVDdmS0xNWHdqQzJhREIySm44bms3ek1rUEgxL1hkbXpabm8zM3dXOXlu?=
 =?utf-8?B?ZXplSGlKSURNY1NzUnBMWktkWUNYanoxTEZ2allKME0vVmFadmt3YkNFcHUy?=
 =?utf-8?B?c1J1Mmp4TGkxYSswd1kvOEZkWS9pKytwVHZtWjc3dmNMOUdCakZyS2VWaXpt?=
 =?utf-8?B?dy9yamsyRmU0bjdpVnJCQ2lrUU9JMmQ5bThkWU02UmFRUFV3QUJUUTV6aUFB?=
 =?utf-8?B?ekZtMVhQZXNTd3JJdU11c04xbDZjalVTZXVvNlJPV0NmUk1SOEpJSVRTU1B5?=
 =?utf-8?B?UVVpOEc4eUZpbWlIMnZNd1k0Zy9HaFhhUW5RRjh5NlpmcWdwZjFWcFJKak0z?=
 =?utf-8?B?Ni9LQTVHbUpaNWVmVzBZS2M1bUxVZ2dTby9KR3NJSWo2S0hIeGsrNVoyNi9G?=
 =?utf-8?B?VlVsWkNpRTlFNHE1NmJpbUQvUUU0VzBjQjc4YlloRVZaQWtPazZNNWdqVjZE?=
 =?utf-8?B?ZGptUnhpUkpQbnZhSXB0S3A5TFVFQmN4YUMyU3F2bXhpTE5oQTdzaUxMWlY2?=
 =?utf-8?B?bkE3YWVieHRWRHhJOGFiT0xjYnBXbmY3N203ZnUwNUhoejN4b3BLRVJ3T3Ex?=
 =?utf-8?B?a0tRWGtoSWc4bXJsNkxhZVV2MWxabXN1M3l5ZTk3MU9uWUk4NTV3RzVMTXVr?=
 =?utf-8?B?YlVnMnBrcVZiSm5tQWx3MndmRDdOREZ3TXRnTkkvRGV6aGdCZ3NLbVN4cURM?=
 =?utf-8?B?S0hkRjNOTjhJYmNQR0lrNDR3cHRQWHNFVHhOOUZmNnRpdm1lK2dWMmxRTDhS?=
 =?utf-8?B?eVZSdHpZeHlKK0ZsWlk4YytIMHpBWnEwTFRrVHpxT1NqVk9kcjZScDU2dEVZ?=
 =?utf-8?B?YVMzdmhmV0dPelhKSW9MenlFc09tYTJHbENaanJGSml0cUhZNDdWTHRzWEFU?=
 =?utf-8?B?dXkrUTVPWXUySkxjSWxXbHRtbFlWNmpEL0Zpc0ZrODRuRUhUVG1WMkVneVRI?=
 =?utf-8?B?NGgwRHQwSmZxcEhHemsyTkU1cTRqSk1tMHZxVytVWVVKSGtYYUZYbXJKVXFw?=
 =?utf-8?B?Rkd2U2FJQ2xBZkNNL2FZbHlVZTBHVUVtRjhndHZlcE5jRnpKZDUzU3BZelNG?=
 =?utf-8?B?cHE4cDJFM00xS0xtMUp6a1FVZ3B2Y0FXeVpxNHBWUkx2RTNRWDdMMW5KWVJQ?=
 =?utf-8?B?bzc4WkM4cmo2SHhJb1JSeUoyZFpHbzg2WHJIUE5NbXFmSmg5SWdJenJudzlL?=
 =?utf-8?B?Qy95Q2ZReTFZRVVWeGFkMVZjSkdsdjBQcGQyS1RwU01nWUpnUW5haEdaTTFO?=
 =?utf-8?B?ODBuZzNxM2IzRHpKbk1VTm42ZkR3Yk5UZlVneUt4c2JVZ280MWlEWGVaeWFw?=
 =?utf-8?B?VnN5QUkvK0ZHT1ZTbElFaXZYeUtMY3JicjBMbFdBdGZHaDBXODRJQT09?=
X-Exchange-RoutingPolicyChecked:
	wZE8w0fCV9kDzAa848y7p4pvpDopquRFtuXMXZLW4KDH+9gMmp7agg23D5RQDxd1z0+1i+ngVDshW3/hyGGv6ICo2uzDZFcqEeX5B49XRoDlIkAxK6mzAwfjECXaiR4XjY6VL/kd8dEJjSFa1mW8LTd1z9Rki42FZp32PI5K6oPagHS09szWiA1rN31VoFkt+CCtydeNX0ZOXZOhHyarrNIwKro2aNYvyDkXXZRrKDjvHhJMASYaDo3JD3WhUOJyqHSfXVkNokzBbzAGNoVQ/U8K8eMezkgG95qTTgGIQJ3mATqHW9ivbPhw2kmCOD9U6bD0IaxcxbVLJsKNd8sx8g==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0181fbe5-df0e-4c6d-eea5-08df09b85eaa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 12:39:18.1625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGQ6KuT0GCZjD4Ly0b7UXPfVonIEXBlYy+pX9yfXNWn/uc3FtqiZOpjUH8P6nssCq/nIwzht3066O9mP7/FTNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7476
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMCBTYWx0ZWRfXw1r5TQywBFtp
 W4xH9KnBJJjpBSKf0CxKn6XloRZBrTUrFl6je4TWdaobQpYhTQz6Kc9l1OwHWa4hqhVBYSEH0yn
 yp7pb7a1LAasjlQutNrGghSeI5ks0UQf8YlJHD+JjIUJMpFSdV8HwZ8tn2V8aKAKQNXW4b8cxuD
 cuBNEmbAcrhB8Mrnm0i0abTjSzWPWhuvoT9erhrPkIAEoNcOtcrOEy8VwZu+BNQQlj0DlcCfdwt
 2xYp4JnLzeGqW+3oTIJbsGcTVmqBkiz10CHuv3qVn+kJuQGrpK0tIwSdxOPi9TC+yzczL/H0G3S
 FjZd3dz2Ku9T/J3Y4mYjgmxOXFAn91q4XdlLShTI942YVwTFWf/f70o6kyCd8jZhSuXqY1yTkE2
 Fh6IusHUvFFi0VxteWcbVXwWZeOyZZtZTnyyJhRfKGq1iA/9MMjGgSpZwwYNZnSvfs0G9UbFjns
 Q0Pqfb7hL30Ur3bisyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMCBTYWx0ZWRfX3FQPw37nSs/a
 2S1rd4/T+ZeVDIwXrC6TBd5zHNcSKvH2Zq9/B4rOcPsr1cJiagTY7oIMXiB5BT9jCrnMaVBEa/7
 UharQ1Co+uhvEbco7hdBjTfMuNt2OlGho01Xs2TgSVnOW8OOp1cA
X-Proofpoint-GUID: 0uqxgkIFZKcjph7YH9e0JN6CzovOBGy2
X-Authority-Analysis: v=2.4 cv=a6EAM0SF c=1 sm=1 tr=0 ts=6a996a7d cx=c_pps
 a=JQIjQaBRt2POjw1IEeT7Rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=JfrnYn6hAAAA:8 a=gAnH3GRIAAAA:8 a=LETaAwOYFzcmk1KyIxkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 0uqxgkIFZKcjph7YH9e0JN6CzovOBGy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030110

On Thu, Sep 03, 2026 at 12:12:15PM +0200, Miquel Raynal wrote:
> On 31/08/2026 at 16:38:10 +01, Nuno Sá <nuno.sa@analog.com> wrote:
> 
> > Add support for the W25N08LW, a 1.8V 8Gbit SPI-NAND made of two
> > 4Gbit LUNs, with 4096-byte pages and 256 bytes of spare area.
> >
> > The chip reuses the KV ECC status helper, but needs its own OOB
> > layout because the geometry of its spare area differs from the
> > existing Winbond parts. Only half of it is visible while the
> > internal ECC is enabled, so the ECC region is reported as
> > inaccessible and just the free bytes are exposed.
> >
> > Assisted-by: Claude:Opus-5
> > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > ---
> >  drivers/mtd/nand/spi/winbond.c | 45 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
> > index 9b78c1e6cbc9..c2c4cc306f05 100644
> > --- a/drivers/mtd/nand/spi/winbond.c
> > +++ b/drivers/mtd/nand/spi/winbond.c
> > @@ -345,6 +345,41 @@ static const struct mtd_ooblayout_ops w25n02kv_ooblayout = {
> >  	.free = w25n02kv_ooblayout_free,
> >  };
> >  
> > +static int w25n08lw_ooblayout_ecc(struct mtd_info *mtd, int section,
> > +				  struct mtd_oob_region *region)
> > +{
> > +	/*
> > +	 * With ecc enabled the parity bits are not accessible. So we can
> > +	 * only see page + 128. Without ecc the full page + 256 is accessible.
> > +	 * To make it simple just return the area as not accessible.
> > +	 */
> > +	return -ERANGE;
> > +}
> > +
> > +static int w25n08lw_ooblayout_free(struct mtd_info *mtd, int section,
> > +				   struct mtd_oob_region *region)
> > +{
> > +	if (section > 7)
> > +		return -ERANGE;
> > +
> > +	region->offset = (16 * section);
> > +	/* Note that we include User Data 2 which is not protected by ECC */
> 
> The more I think about these free bytes, the more I get convinced that
> we should only expose ECC protected bytes. I honestly do not remember
> any guarantee regarding these officially stated, the common case
> (eg. UBI) there is no impact, but maybe it is best to only expose the
> bytes that are actually protected, since the thresholds are getting
> lower and lower (and chances to get bitflips there increase with the
> optimizations of the technology).
> 
> Do you mind only exposing User Data 1?

Not at all! Will re-spin with that in mind!

Thx!
- Nuno Sá

> 
> Thanks,
> Miquèl
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
