Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012000.outbound.protection.outlook.com [40.107.209.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54F62F8EA3;
	Wed, 30 Sep 2026 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781046; cv=fail; b=dRmlsTkCkjlw8O8xOF1da9YAVWCkSHAbJ3oDkBhsJ21aB4Hf3pzzprCNxoXaA0EHb8vCesKwVdN9icSS/4OCuima6k/d1wu2OnuYjV2BbK5azn5SgZ4FQqkHOpXDbwJE72j4C9u6QqlB5nxF+BkARzw1hoxeIqblpKBdl+OfmOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781046; c=relaxed/simple;
	bh=8+nX33XGcC6xaJ354t8+lO3WBY1CoFJ6aMeNcourCt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QfXRoQ4EMPMzMqxYJuYIA0z9CklrNdHz5TYkf/O41B90hSGFrCz9aYvZ4bFU6COyl3rV5TRoTcjJi6lHWx6kg917tvOFLpVKpzjd6LGPJbbR0cKmKAkkx/lT6XiiKQHslaweHGoUcU/NPHxfTa3goJAyWu7gl0NPu0YnkuVrXzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rF3LMWFF; arc=fail smtp.client-ip=40.107.209.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rF3LMWFF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLIB8JH3yvTItiBD/G0K5CkvyrflWKpHFG6rdtRwiB7jdRdxuC9Jjn2vWRmukR6oPQI77UTIVmkR24dGEQe6dWIz7dnB7vOWdcK1VXR+BAhW87dGCdqipML+dP1U346IjGixSAT4/iS5GaUUH7li31A6elTd6f7tMNaiuQDeVBRBrgQxJsA2jXHdUG8itUmkfKqwcdUMCQDGz6kp+053U0CTTqjzvex81DansGkf5Ik2SzT1/0XKRKo0qz0wGOMWwflC6eX+1aOjTX8quQsHkQteZlUcgU5+QJUcQjG4qPLAcAj8/E3sDb3aWgASUzS3GVES6IG8mYxhcvX1/GMbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIpEnQqeJD67Yt0sOkVklXGfQh7eSPXOnniolBK2wog=;
 b=NFwD6GF4ywwUoSGJwVjKRZi1+kvyvyOtXhHl1hgzeiqM5E8HjqoEmR01mvfBptxB+pH4RYRCI/ChAtQJnFSQ+G+U0CWQ/h7wlIy3ZPnw4dE7roApuvxWCs6jRF6zUVOT/vFXtyok04vl/Sdsb5MWZgtFTl7TRAW+yJe4WSJZjmSaY0FgbiXxWNwyQU0afTN9OMH+MdcTDzob8Hri09XcEo4W7IuyK969C/BwGZbub3HaPCyH6u3D6+1+dpfRRYNy+F9HK3+/sIhOpQO+NNkipixw8vYoyIk/nBQegHGGGwV8vS4WEi/tUyIUlOP3M2zxP5lAxkTCERk9+k4PnjFWnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIpEnQqeJD67Yt0sOkVklXGfQh7eSPXOnniolBK2wog=;
 b=rF3LMWFFYLaGqtyqSPTkSZSyYgkR0WVIfiMn158Aj6PlPZM+QRLQxMYvKm3URQQ1b+22S1ciDg1Cf09JRw9IjLk/uTqrWyupyCYvUgqQLCimhvHAhV5Lxo84zsbz3ZtWKgOuj7z19/rbXgcruHsPXQnKDk1hqx/n/R12UDqYI9kMxKhng5WfPqJgyffSHRS1kVUuF1r9BO9tQ/z+fYhiAHqH2Fx+kWF69w9bqy3zK7Fuwxhaxf1QBl8Lyraf/Di/q/qFFoAxK87XZcdVbvxcFO2p5fvE1hQgEGV1JgtXji6trH46I7ZqJukclwCDg++9WHrQH8GnRIT8VOWfhkL2qg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 15:10:21 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 15:10:15 +0000
From: Zi Yan <ziy@nvidia.com>
To: Gregory Price <gourry@gourry.net>, Li Zhe <lizhe.67@bytedance.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 ljs@kernel.org, liam@infradead.org, rppt@kernel.org, mhocko@suse.com,
 corbet@lwn.net, skhan@linuxfoundation.org, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Date: Wed, 30 Sep 2026 11:10:13 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <A005B05D-A85C-4153-A65D-0BDF9D8500DF@nvidia.com>
In-Reply-To: <ar0fURbLDPrphYMY@gourry-fedora-PF4VCD3F>
References: <20260930121154.687586-1-joshua.hahnjy@gmail.com>
 <2e3f12b7-0dac-428c-b70b-07e1f63de028@bytedance.com>
 <ar0fURbLDPrphYMY@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0870.namprd03.prod.outlook.com
 (2603:10b6:408:13d::35) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bb16d7-1086-41b3-54bf-08df1f04ee54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|18002099003|22082099003|11063799006|4143699003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	HKHZAYxG6ZbyjpFSLEAIU/ynIXNb+x3YvFHwJgGgy3oddFitj/PYqYDEq5STEARUrWtSp15i45tMEBF3UVS6bKIan5By3MEm280XQwiFieZP5vpKrl6Y+UxnYhTzTN8dWus8UzquREPdOJQNILcsZI4yuZKNrvtPM5BS3esGekjSFAxc7yV22yxa/LiW3GYDAA6hwf4egl2/19h8oJjfkC/FtFXpZp0hcp5d9qMxTXkk1ZweLlXIsqDMLZfKLwaKcT3dv97UZlneNU1tUXtShgrf2pX7UHgOnEiD5+HftzIdck6uTIPlEDGajv+V1eIzlVHFa5pphLzczr2Z8JWqRfTykiystLAkLUiQ5wo8HuP05TKVA2+aMQcsoGiBAPDdm/xJD0i7kQKZPF/O2hY+UJIH7rN3GN+c7626CP5CdRNwOs8fFR4gjCKenYprDFAdSPYppTGW7SP7Kuwn2ZZDhbQABpyR6zWiHWLxlL0C6oj+wcIAsjGBllxXz1fUpNF4zw6lFDNkiaCEnGkxx5NztWopI88bmqRBRa36H08JlgpI6sn/HEBQHhRfmSz0DP0ymrCMKU/1NpEkx8Ou8Cvwf7q/3gHi+M7XBh1BYxo06fhrmqJxb9EHLdlyqCS5pogY2IjHt3FJetazbhs2qkXvYXhMLqf/yETBGeRDuLpPjA8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0xhcnJxQjhZamdEb1BBaU5aTjdwNmI1MmViOTMvcDZZbUhZOHRPSDhsV1hQ?=
 =?utf-8?B?cUEyb3RMMFJYS25mOXVwcFZWbTlaU3B3Nk5XL1UzWGx4bHY1T3o3TmxaN2Vh?=
 =?utf-8?B?ZEhNRG5LakFxT2RGMy8rbDYySFpGYmUwVnJGK1F4TjVhWjZteWcybHJCT0ZP?=
 =?utf-8?B?OXZFZTU2UE14REF4SWhJVy90WDZmMFpXM3Nub1k1UG13S2ZBYmEzcm9mcGFE?=
 =?utf-8?B?Q2pwVDZGOHlPVW0zaC9mMCtnZENnOVczT2ROR0dseWtMdHZ3N2hRQlVjRUpY?=
 =?utf-8?B?YkNzZ2hTaFR1TmJ4ZEZhc2NUWDhBempYMmtHSU1sd3RCayt1YjR6Zm9iNEZx?=
 =?utf-8?B?dVorYThLSzR2VW41Vm1PVDY0R05GVDM5bFRmSkxUQStEMmpmWVhqR2V2M0ZC?=
 =?utf-8?B?VUdCWDNaZHpjRzhZSEpNbUlsU2dsVTV1aUx3eDZLNVdab0lGV2R4Q2tCNnlK?=
 =?utf-8?B?b2FycnBtQm9QVVkwQzdaR3ppelJKckdCVnk1MGdoakFCcXpza08ybHk3bU56?=
 =?utf-8?B?ZUFhSE8xcWI3VVEySmRIUC9YdVU4VDRvUXoxTTZqb2xRdVRwaUpWdWs4djY3?=
 =?utf-8?B?aXBUTjgxK05SejdaNWExTHJUS0U3MzNuMTVIWkl6bnh3dktZS2UybXNieUlQ?=
 =?utf-8?B?Mm5ENmQzdmR4clpPenJka2dDbGU1RjVOOXlaKyt3ZEIwc1hZRWIvWEt3a2Ew?=
 =?utf-8?B?LzRaTitNR0Nwc2JaZlpCc1BnNnVjL2pSRTA4VlBJUkVtUVNyUDFsaTRIMVRX?=
 =?utf-8?B?OWlJaUZOczJvWTdlVThWNGFWL2JLVUlIMmdta21RZXJobHJjWk0ycDlhRDVN?=
 =?utf-8?B?MmI5UnpldlRhZnRzSnNEaSswMzNMWkthZjFIR0xPazA2cEtycHdnRHNRZktq?=
 =?utf-8?B?ejV6QXJtUGRxaVJ6dWZZdjNHVnZ5eVBLd3hValZJYXVkZjg2WUMyMGIzdkl1?=
 =?utf-8?B?U0ZNNmRJZ1ZYcjJLSWlaVkM3L0lOc3RvYnNaQnZTL2JrajhhOVRuUDZQenhI?=
 =?utf-8?B?ZlgrOEJWUmxIZG9tRUZCbHp5cFVwcmkrSXlDK2xnMGt2M2lUbXc5QmFrbzNq?=
 =?utf-8?B?MFN4MkxKQW95UFA3T1dxcmN0aFd6amt4VTdHSjF4RDQ4eEkxSGNxNW9la0lL?=
 =?utf-8?B?ZVcxR3hDMUlySXNId0RGVkVrTjd4SnNFNk1TV2h5ditmM0JHV3ZTMkxCa1FL?=
 =?utf-8?B?dFloMWZhL2dWS0paSHBVZi9hcVhTc003Y0lyUGQrd1IzZWZpcXJDOE1EalFn?=
 =?utf-8?B?b3JydUkrUitlYnI2SnB4ajdaZklub0QrV1kzRkE4M2Zza1JNVm5JRExwaVND?=
 =?utf-8?B?UE4vNmtFL2gyTkZ0MWpoelNKUnhtZzlGbXVwRnJhdTh4WnptODgxcE11QTJF?=
 =?utf-8?B?dkFqTmJ3S054aDBZMTE0Qkd2b0dMZXEwYzRiZ3pIcFNkQ0habWV5Vmt1MjhM?=
 =?utf-8?B?djRLQmFBQmVqdFlhcklnbkJqVk1PcnY2eWs2a0NTYUI1M1NxZjdCQWZxSGF5?=
 =?utf-8?B?dG1kdXdFOEN2bldieno5RkRZdnVtL25JUmkrQkZuT2xsQmptZ0c4dTN5RmdT?=
 =?utf-8?B?ckdCN1FQc09nb2lvTVN2SXkrYXNHd0w3R01FUDRjL0YraXQxTUNPbzVLQkpR?=
 =?utf-8?B?bjRSdjk4RHZzRjNiR0QwSkJuL2pvM3p4ZWdjY1pxRzBkUXdVZ0MvMndQaHo3?=
 =?utf-8?B?c3RIQytPdHloOEp6WXJaQVI4bTZUREZVR3NXSkhMZGJaZ1YxOW5FU0FsckpW?=
 =?utf-8?B?QVFNYnRuMGxuUWVuL3BiNXV6dmw3QStta2k5anBwMFdTVE1Td1lrcXZzN0pq?=
 =?utf-8?B?dkYvbGhuazVJVmQ4SlJUazFaV3F4SlNpclNQajBkKzB1bFVndXVsYzcybGJj?=
 =?utf-8?B?SGdsNVQrUVNNcFMxdG5WeEt4ZGxJcFFpWHhzeWF6azRIdUFwbFRrQWh1WDR1?=
 =?utf-8?B?RjNta1R0WkE0REVZRUtvTjhIL3BVak5JVndxbXZ5TGdLWHRMMHNZc2pQRVlW?=
 =?utf-8?B?dWVjdXZQOG1jcWxrRWtWK0VJeDdpRmZXbXpncWZkU2tJdTRvOGVZT3lHM3V4?=
 =?utf-8?B?THd3QUFFQW1jWm5kWmdoK1dTeDFiaGRlZ1ZZWkwvTkhEL1Jmc3pDbzdDOHVV?=
 =?utf-8?B?SDFPVTUyWmVNUTc2WTN6UkZaOXpOWGVmUVJSOXRPNXlqMVN5VGNvRUF1a0Mz?=
 =?utf-8?B?QVZQWmNKVzQ5RlhuanFlV3ZTZ2ppUStKNm52L1dNall3eno3ZjVxRnU2OWl1?=
 =?utf-8?B?U3JVNGh0M0MwV01mcHBFZHNqYnRYWmhGZkx6NHVQYVV2cHd4ZUhNcWFxTFo1?=
 =?utf-8?Q?RpnfkmSsUxwuTAYROD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bb16d7-1086-41b3-54bf-08df1f04ee54
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:10:15.0193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gzCwtjpwZGTxKGjIjmnIfR18/MFmOlrOprL7uQvWipOwecyze9odJfZHDZ3bkLm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824

On 30 Sep 2026, at 10:50, Gregory Price wrote:

> On Wed, Sep 30, 2026 at 10:02:23PM +0800, Li Zhe wrote:
>> The use case is closer to the second one, but the main motivation is not
>> only startup-time performance.  The more important point is that each
>> workload has its own DDR/CXL budget assigned by the workload manager.
>>
>
> mempolicy is the wrong interface to do budget policy, you'd be better
> off looking at Joshua's memcg tiered node solutions for that.
>
>> MPOL_WEIGHTED_INTERLEAVE is useful because it lets new allocations
>> follow that per-workload budget from the beginning, instead of placing
>> everything on one tier first and correcting the placement later. This is
>> important for workload orchestration because the workload starts from a
>> placement close to its assigned DDR/CXL ratio.
>>
>
> This however is reasonable to me - you'd prefer to spread out the cost
> of initial faulting placement explicitly, rather than simply take
> fallbacks when the top-tier budget becomes pressured.
>
> i.e. w/o interleave:
>
> [node 0       ]
> ^^^^^^^^^^^^^^ alloc until full
>                 vvvvvvvvv fallback
>                 [node 1          ]
>
> in this scenario you end up with considerable hot memory
> on the remote node consolidated in time-space (everything
> allocated after node0 becomes full skews heavily toward
> node1)
>
> Tiering then likely takes many faults to rebalance after
> you've already reached node0 limits.
>
> w/ interleave
>
> [node 0                                      ]
>  ^^^vv^^^vv^^^vv^^^vv^^^vv^^^vv....
> [node 1                                      ]
>
> In this scenario you do an initial fill distributed by weight
> and then let tiering figure it out without consolidating all
> of the pressure to the point where node0 has no space left.
>
> That said - this seems like mostly an initial-fill problem, after
> you initially fill your memory, a new allocation largely implies
> the memory is hot - and you probably prefer that to be local.

If this is a initial-fill problem, can userspace set weighted interleave
initially? The program or harness can observe memory usage of the program
or related NUMA nodes and switch the policy to numa balancing via
set_mempolicy() or mbind() without MPOL_MF_MOVE after certain threshold
is met?



Best Regards,
Yan, Zi
