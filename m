Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792695564;
	b=fan+5d7l1Gz81PwLjD3b27utPY/7HZXKx3zyq64KTkDTMLvxE1WlefDqCOdIPbT8c0nX
	 XsOY5UC3wbjijGrqQJmAPWQsIvCO4p84iU3ccre10Wdb0FOawM0Vwkqo3l8EsFHWt4M52
	 bETx1zTX21K3AnU+u+l0CsotE+j4EOdMDDEZGEoBWkMv1Gy0j1RNMmU5XMOfCiJmjhBZs
	 zZiimpEw3T9jRTuOjrhKD1+TCP2wHtFnyIFvSR3JsrqMDd6OLh2oBIPBa/kpXyfjg+0Im
	 7HgRE/P+xJQ6XPzirz7IzsWvIY+Gtq17erwg9F1eDUz/be4Srmk/IA1JMmGd7uypogg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695564;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=2BHLTsR/jOlN4B6iFOIXrBLrUldtpx5d4VdiWYc3fO4=;
	b=KkdC+su47NFwFbZy9/2t0dUn4EAE1Icpn9ILsrEfg4v6/Sic4BE043TEUI2Qi7AGTYG6
	 VUGC1fYxjqFvvJPu7PaV8PQP9l42a/7KKJgxAIzuoXqoDfX2LsSaD+ubulvuEKGN9VmDI
	 NnLNQTxhgfj+SB8/nSPoCo2V4zfRpZmxmXMZphWmj0TsKr9GHZc575OKbjemvGS5TcJ0+
	 6j+ull1FJG7JR7VRRE5JxqAO/gVXKkWlGQaTeAsCQqw0fe+xxRwccvPlnYZSGNyggQ5rv
	 KBBBzTBqjwN7ZhJTGvorZDRy1yxXiV+3KoelWUlo2MG1+6ii4VVX22lRIlF8hHFDGJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c7aJ1fNJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.2
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1D7606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1D7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c7aJ1fNJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsZxwVEElxZvdRmlCTnMURcBWFuRXD4AY7BE1witvQIfYCRMUozM4DWnTQIEXVDEiExFU/n8/FxRce+2zbaUhNdZXunZEsTx2rG8KdAK1LOscQNQeFsuJ/+VvGEzXDLmfm7i59JI1nvZuU23C0HXnK+5JR1uav3DXa0gRhyU++SoCgZJxn0cgzKMyV0xHNTmYUxXGUddfo36R+TWDsaLBdeul9iWEmEHyuQzwI9+YAY97wX3zWHYoV2FLF7Pti7ep6mXiwBG3zUa8WH9V07ZCKXm6ctYHjpgxk6AJAT+0KeAzzZsxuidLEeP0IYHWHTRQB9Bpj/T6flVJHE51H7BQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BHLTsR/jOlN4B6iFOIXrBLrUldtpx5d4VdiWYc3fO4=;
 b=wwPVtK7DNkp9/tV1Rb+2gyXIX1bjaHrXIte/ECX7aEoVJPj5CuaJpZGQ4RzSuNZIXr0tFAdxZZ39UGImHrQghgsY1j4hjWJ88RQlHX8BOCSwNYanAkub8dgNrXkOtwg/1IOfN/VjuDZhBelL+ZWYxA0zO/4Wj9Bl6WOrBr1dLM5z4+P0l27UI7xT5lJO0HUKAnxtgVCwKqTc7MdaqcfaPb6YdaHdHjgzYhzUTjg/x/GlHGdjbQPqh1fBeD+sCJiz4zQtuWypuU+V1OR5NXBKC8qI4xT+Ry9nt1SUD7bn9/tae3CVx7W9B8WxGDqGL4oDfuvuv7J6it8tNSOarfpBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BHLTsR/jOlN4B6iFOIXrBLrUldtpx5d4VdiWYc3fO4=;
 b=c7aJ1fNJEAO8O9BD+7T0AOW+akN7kKkvhFVWA0YiRjz5DgMbeCkBJ5uFt2VBBjnMrDsjkIU9c4zP482UbXWzinpxGQBPmDq9y3QUUVACJ+YAvCfWRgt2MuOtR1k1UKXibXSC4p+xKgk7MXYdEYKGER8Ti821LumrzZD1p7u1FeNqOATW0fsJRZnElqdW6fsxoqi2xjgeYoVAsmx8Qd3ZRC6cqJ7SJGTy/otQFPro9NGVtP7cxEZFw+CRZe3BsotcA5wZdfyz6AecBBtT30e8uceDG145EA29qLL7kizw4WEIEpGyEZ+6mZfK1gwxrW0vomxzhDvkXwJZhkSECwY18Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS7PR12MB9503.namprd12.prod.outlook.com (2603:10b6:8:251::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 22 Oct
 2026 18:59:19 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 18:59:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 14:59:17 -0400
Message-Id: <DMBLJDUCMJI6.2RDRAALJ84225@nvidia.com>
Subject: Re: [PATCH] mm/migrate: wake kcompactd when huge folio migration
 fails in numa balancing
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Matthew Brost" <matthew.brost@intel.com>, "Byungchul
 Park" <byungchul@sk.com>, "Ying Huang" <ying.huang@linux.alibaba.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>
To: "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Gregory Price"
 <gourry@gourry.net>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261022172547.1181530-1-joshua.hahnjy@gmail.com>
In-Reply-To: <20261022172547.1181530-1-joshua.hahnjy@gmail.com>
X-ClientProxiedBy: YQZPR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::20) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS7PR12MB9503:EE_
X-MS-Office365-Filtering-Correlation-Id: b3932136-b231-4484-f915-08df306e936d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|18002099003|22082099003|261022105027099003|261022075727099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	iB6eiQriBXotUjUr07ob7gYKZgTGgVxL+ikq6YgW2lrWkdaL+9C892Q8fUR71O+AH2/FZ+9KcAP0Li+SK9heFPCvZGjgaSErtIvuN8cltone1+UdfhMS7aGVvf6Flwa6MWZzBqwgZEl0wUpcdxfNFPdDdrZXN3cYff/8MpqkkJlpLjcNAG200xNuoNbxfFibOYXY8HfqeGrLHk2hNDkbxRZb4Tpny9xxYUiGWWImJzjrSQmz3AxUC4gcirVKZOMqIRwhNZAnLSVovXxiLIfuer64hxFvptjxjRcQIltqjUswl/7ydp2Akp/w/oED1OG5PEWAtFbiRLkIV6vvAgK84x0a0EQ3SChqqEiyp0w2Vnb3ohd0qPFIlmLO4A2aklinEl1Vj1ar0YiNRHeqlt3IGVv/d3Fe5T9V1anOG0q+P2skoaj7VxMmQJMdiTWFfgxWsyGsKzRojE0e4RCXghA/8NCU8kEj3x6jYjnektBGVtIaTkYyj+p3RTx5JB6uCMPMK9mD97v/4GsPAvwRsz2UWg0W1Yh5gvGQ/+L37QZ/mFL1qX1EwcJ9gQ1Q0ke6cy++Zv+56po7mLhiEE3t7g70IF6DsVv3oDKHJNehDdg0DEbootxvrehs+6WAgMF61Ytu1QiM9hD4667xpu4ZWDrmLulwbtrhjvbz/AfeLlV4lE0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(261022105027099003)(261022075727099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3FZSnoyZ3hIdE5yNVVjYjhRRHZUMGF3c3AzWDNoeDVlUTFkdmJiUjZyVVh2?=
 =?utf-8?B?NFNtUmNJTG1scjAvRXdHNnVzbTV6SU0zK0k4RmdhUFBwZWRuN244OVk0aXpx?=
 =?utf-8?B?WVZjMUV1L3BKWFlqUTZFQ2Nrb0pINjh0dmxFYXJ2ZjBtMXBLMHUzOWFWTjRj?=
 =?utf-8?B?bDJRWXJlNXpzWmpzWUpaSUZhR2crMmY1aS9WSHJ4cHV0Rk1WSnAvOWlLb1Jw?=
 =?utf-8?B?K05wclVmdmhBeFY5cC8wa0UydmZiN2wrTjNwR0JhRytRZ2JubVRUL1BLeFVG?=
 =?utf-8?B?SmhibFgvRjVBdi85dENjMEtaYk1EOEc3SDZzMW4waWN0RWFlRXNiRkJEWHBC?=
 =?utf-8?B?V0c0Q0xLMmlSdFlCOU0wdDc4eFVZQnNxL0FyTEEwejd1Vkd6OGpXN2ZlaThh?=
 =?utf-8?B?a3dEdlhJUUtmeHNJanVhVkxYOGlOV3hwNm1pemJDcjc5S1FYUEppOWRzMldW?=
 =?utf-8?B?Y3g0cTFzZHo1azhRa01QWTExcFR1RGlFaGpGRUFZV2xKQ3J4S1UwMVVVcCs2?=
 =?utf-8?B?Z0FMRHdvcVBGanVWV21iV3k4QVNRWFJpVSswak9HWlkrbEJmRDFHQmMrNnJG?=
 =?utf-8?B?NjFTcndDMWQ3SlhBQkxtRjJCcVZ5cFVkR2tUTGl4UEZFZTlQQVMzSVZKMGg0?=
 =?utf-8?B?aU9UMytvaGo3aVptVWdZa0hYVUFxc1RtYnNGOHRDay8rb001SFlmWW5tQUxB?=
 =?utf-8?B?Qm53Zm9WWjNKc1VrOFNYMDNFYkpGbEx0MVIxQy9oWER0OWU2cWNTRThLWXox?=
 =?utf-8?B?WVVQWE56eEYxdDJiakJKRjViZ0JqekJEZXBUT1VVS2dhLzBYVUtZTlAya3BE?=
 =?utf-8?B?Mi9VVUY0WTlHeGhFeVRKTUZRZnpMbXdHVE9rMmF5Qkx6YkJSUmplNVZHaGV4?=
 =?utf-8?B?MnF0NHpnclVwdkNIMXVBaXp4ZHlSSjdOa2tGRUxjenRSQ1VMZ3hCRnVEc291?=
 =?utf-8?B?NWFGWFJoZ00rWDRYN1JHeERpVGhNK095NUR1c0g1ZnFVcVVCdGJWbVVTaC9U?=
 =?utf-8?B?d1UvY0d5TXRNeEFqOHhoeTl1UGhhSThsdXlwM0w2WjNBRG5hRVd1YnVWdEtF?=
 =?utf-8?B?eDJSek5landGOVZrN05LUElJdGEyVktuOWFGcTNsc3VML1B5Y01iS0owSUcr?=
 =?utf-8?B?Q0QraVhwYm81VWNFeHBnRzVscVpTcG5GRURTMUx4NEFIMEFmc1g4Qm9XeFJU?=
 =?utf-8?B?cjlIeGxNRWk5cmZiRitxK0pkM2VNVkFyTGhPajdIR081OHJMQnBkYnFWZVAw?=
 =?utf-8?B?UUNCb1ZaZDF4VTRTYUJMRWZtbFRaN3B5eVpSUXc0eWVJeEZ0WlpkU3V4cTkz?=
 =?utf-8?B?YlowYjNseVhSTXAwdDRhYklsRVJVQ3FuWDhGb05YQUs1N2VNVVp1MGlCYzQ3?=
 =?utf-8?B?eWlXV1dRR2NyUGY5bElSTWF4aU04ZWJQMk9LUU85OWhPci9jdUJzRUpCd1Ns?=
 =?utf-8?B?NGRVd2VFMUt3bzdtZUhMR2szRE11WEZwUGkxOUdJQWcxbGUyTEpib2hJQ2pz?=
 =?utf-8?B?RzZqSHNiMGplWEFLRzdDMmtmdWdIbG5Gc0pXYzJHMW1Cemc4TGtudkxnYkpJ?=
 =?utf-8?B?R3hUSXlkb0gzMFhueVRyQXZkQ1RmRmFWOCtVZlE1UzdJNEhmVURuVkplcmlO?=
 =?utf-8?B?bFVjSTJYaFJ1WVdWY25nUitaZWRuUUU4ZVJ5NncySmVyRWZFdHc2NGZYcURY?=
 =?utf-8?B?UlBZOVJlNDFyTUtCMHJzMnJIL2lFZWxUdkg1THVaZHNaSjliSW0xSk5KSUJL?=
 =?utf-8?B?alpmSzY0Y3lyV0pHRUppRWlCNnN4SVVTRWFOdEtQbkhDTFN5bm5hWU53VE1a?=
 =?utf-8?B?a0lJTGFoSS9RdXZZTnFPeFhxRnh3dXNva0tVZUtvREpIM0lNVWtxaDVWczgw?=
 =?utf-8?B?Z3YrWTd2NkRWekNleFN1Vm12d2VhUVo1SlA1MDk5T1ZTeVlma0FoY0c4MjFY?=
 =?utf-8?B?S3p5QXlKNWppQTJvTjkyVXc0SGpYUnUzc3VYVzlTYXlSWnplTUNKZUFqbGJZ?=
 =?utf-8?B?a0d6LzlyZHlGdmRDc3hMdnB1eE8rUmNzRGxOaUJyd0FoVEJLRE80eUR4Yi84?=
 =?utf-8?B?UWpxYW0wcWVKdXUvSEJ5T0JCb09RNjY1Z01lOFBHekhLZy81cFBuM1ZkL2Zk?=
 =?utf-8?B?YmpEV3dSSlkrWXpSRDZmKzd5SUhDMDV5TnhpbjdaZER4Zy9NZzNucG9td0dF?=
 =?utf-8?B?dDQ3L2hjVmZVMXBJSWxKTDRGVVU4dTU0cjUzOU14QUhic0twN2VPSTIrOGIw?=
 =?utf-8?B?ZWdRZ3ZJNDFHZklsVFQ3Z1I5REp2VGZ2V2ZWbWF0TUMyZzEzQzJsZWdOWGhV?=
 =?utf-8?Q?we0nsYd80mGUzuGDyQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3932136-b231-4484-f915-08df306e936d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 18:59:18.9328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kbvP1bvmn5tYqrLGcN6iqObTNPGruM/mJvWEqkEKodQZvUyEdeT7acKPPrS1obl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9503

On Thu Oct 22, 2026 at 1:25 PM EDT, Joshua Hahn wrote:
> NUMA balancing migrates a misplaced folio if migrate_balanced_pgdat()
> finds enough headroom on the destination node. For large folios, it then
> allocates a folio from the destination with GFP_TRANSHUGE_LIGHT, which
> wakes up neither kswapd nor kcompactd. This means a hot large folio
> trying to promote to a fragmented destination may never succeed in
> promotion even after repeated retries.
>
> Wake kcompactd on the target node when the destination allocation fails
> for a large folio. Don't wake kswapd, since this path can only be
> reached if there is enough free memory to service the allocation, but it
> is too fragmented to serve the large folio allocation.
>
> This patch has been A/B tested on tiered Meta systems (DRAM + CXL)
> running identical cacheing workloads. Without this patch, we accumulate
> around 4.5k failed THP migrations over the span of a day, while the host
> with this patch accumulates only about 80.

Is proactive compaction enabled? If yes, why does it not help?

>
> Those migration differences leads to about 25% reduced CXL bandwidth
> usage after applying this patch.
>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---
>  mm/migrate.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 7bdcdb57652f8..67364fe0851c0 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2671,6 +2671,7 @@ static struct folio *alloc_misplaced_dst_folio(stru=
ct folio *src,
>  	int nid =3D (int) data;
>  	int order =3D folio_order(src);
>  	gfp_t gfp =3D __GFP_THISNODE;
> +	struct folio *dst;
> =20
>  	if (order > 0)
>  		gfp |=3D GFP_TRANSHUGE_LIGHT;
> @@ -2679,7 +2680,17 @@ static struct folio *alloc_misplaced_dst_folio(str=
uct folio *src,
>  			__GFP_NOWARN;
>  		gfp &=3D ~__GFP_RECLAIM;
>  	}
> -	return __folio_alloc_node(gfp, order, nid);
> +
> +	dst =3D __folio_alloc_node(gfp, order, nid);
> +
> +	/*
> +	 * A node with enough free memory might still be too fragmented to serv=
e
> +	 * a large folio. Wake kcompactd to help the next huge folio migration.
> +	 */
> +	if (!dst && order > 0)
> +		wakeup_kcompactd(NODE_DATA(nid), order, gfp_zone(gfp));
> +
> +	return dst;
>  }
> =20
>  /*




--=20
Best Regards,
Yan, Zi

