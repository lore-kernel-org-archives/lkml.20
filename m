Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E2F51A742
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750612; cv=fail; b=IoICDgAA5lnBeohoIrdkwp6CRWwVkHxjE4yrPC+//smFAMEOM89Ac8uYMFxaUiOxozI7y0ER0SqZyzNGaMRVTkI2kopIRSh0/UVf/1V6sX/Y3sCsuRWe45Od4LWQDm1ECG+AiBBrFg6pCQfznVFLdHMBZ5/fIX8rsN5kJPtmbTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750612; c=relaxed/simple;
	bh=EURb6TngTGXmOs6pyUxdcUdKTpMDcMTbw1fdUnm1qqM=;
	h=Content-Type:Date:Message-Id:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=TS125VPTmlQuUYpWQORF6LrZAs+DN6o15CLOdfU1ypluHVUkjm5sQifKkAK5iugRExoz3V+kt3VXVLotYODmUPVxPNerHrCW7v73Uu7QeZCkhgJRkwDbto9Tl05AccQmnlwGggNC/X3BdH8Gr1+B2sxdfiBv7C5+bIMRcMkvrME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CG9u5lIM; arc=fail smtp.client-ip=40.93.194.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CG9u5lIM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+j/AHPL7MNp8PSlz+V4Fhbgr6PJktkslpmeEbk9Ma0col7VTQKmI3PXK2hMfJMOqoduSjzXkCKva700kVDLFCvxgkm5/2KHsAdinY7LwEZ9GRu2UEGIy7vyIe0fjGDFf0o0FBRaf4uH2tS84+Pjlp6RtWeZaalcZObTcfcqlo66JvVYXAnzusuMWQVvpkDZr3SrV/Wk44F2NGEXDsqbRDNG4ehVtKvopTtIong7g8Eg7VUKxeRhO4pVZgZmIvTjI4xkF42y+xFCtgqJIsqDOxDk/+lpvrfeXqovwzVJjUzpMGqqrIncLfM6iS6QsOMJ3BcfFALwPHvE28sl1k0z1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVEPruZgbn2lSQO95JnRKpwLG4VVL2xIlqPAm3ZHX5w=;
 b=n70S6IZa10Ej6iiXLXHs7UrffcCMUHnGKJpokzwf8ww+TDVnPCbugNVwqVBsqoKnSdfN4rVcRcE++MdjGpG3qTYOoeXEPm4xMtu6ex9cvmn3hv9HRP9IXqG8tdfh1ou6+TeB2SvIl/8rpY5VLIo3ZdFNDVK0BDmbEZ118jkGwfW2FzmWfx6lhD+GhJ+TeXT+7P3tWHudxWoftH2p1ONdk02YiCZBmf70CFhl98hJuXmug4aRrhA9mX6l2LOIYkq4VHR4wLlImmkZMSPAyxOHqvPTDmQsI8w3jpAsWvrgBA0phvLdwo/QJjsbo7SSd9MdL8LKLCGUbnp9ECungQ1skg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVEPruZgbn2lSQO95JnRKpwLG4VVL2xIlqPAm3ZHX5w=;
 b=CG9u5lIMtJLvC2MP7EPYxVjMEFuTGnIs52N+YIZcBgxsZw+WsBrTx2bu0yrmGwC+pV4PPOaPyZ6s0EOQpJALjuC92n80+yAYk92KLC26Sm+AqrncEdJA2UM4aD6AqZEZs8CVU5vleFiZo9GaCaJ0L3553MCnobgy55P3Imb8SIRL4MBRdRQXbmd9TJhHT7g3yv5kn/Ro7c5THiuM2h2WNb0cVQs3ejNzseEZznXWzissW5CHtjef0BnitZfKp0C/MeHRRukJhOjq5n6zzYJ1EgS3Ume+56KqkyhV20jjhEdafy7KEKrsqQH7AVWwDNe2U/wTTqlFeVt5Xo9hFPwPxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 16:56:41 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 16:56:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 12:56:40 -0400
Message-Id: <DLILMZ6CDY7O.2RCRH4Q4QJJJ0@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Matthew Brost" <matthew.brost@intel.com>,
 "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Byungchul Park"
 <byungchul@sk.com>, "Gregory Price" <gourry@gourry.net>, "Ying Huang"
 <ying.huang@linux.alibaba.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Rakie Kim" <rakie.kim@sk.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Liam
 R. Howlett" <liam@infradead.org>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Mike Rapoport" <rppt@kernel.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: split up MEMORY MANAGEMENT - MEMORY
 POLICY AND MIGRATION
X-Mailer: aerc 0.22.0
References: <20260918-maintainers-mempolicy-v1-0-9a94cac6d135@kernel.org>
 <20260918-maintainers-mempolicy-v1-1-9a94cac6d135@kernel.org>
In-Reply-To: <20260918-maintainers-mempolicy-v1-1-9a94cac6d135@kernel.org>
X-ClientProxiedBy: BL1P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::12) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a84b9ff-5fda-477f-a4fe-08df15a5cfe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|921020|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/hBWlY5OggBAOdB/PdaCJv67k/sRWmDLE/5S/sKrGbGy6GydlT8NDpIpcSORpcRLEfBtTXXN0LsT073JzmAT8mtbsydS0uW9jztcXnvxtSmBo7FVXrq1TDdYaAIgLiIsvV7qVED2mCQWUFskHmIZOMO1zCGSsqr/T5e0b+jRpA7+91HyU8uxffYO3Exii8/PbmUzXDERW1RC/L35AoQQFNlWXpuTsYPTFzzlcFTWsK7wBc/Wrsc6k2qwhs51rRFfhBOcZVZk9DjLvbAIGGO3z0KbHAoIUs86cUEQsM1pxpRPyfhRusFa/WFQICt2xTWlmnBpnMCcFwTr6WgBiYqf7cRjOFeGojya84T2F4Tv2anstDBlqBe/Tsg6doQyxRuFvpkuFi1H+OkpPS6PMaxpRGtzbq6yZKuCKFlo7vaTS5qLwmjSRpYbHtNWkuAEEb8/vT1bvaGGoNqPnhLLGSqPa0GtbxNDNu+ixYlQiU6IXTxPE46QB8sRaG8xUiHZAsWF9rPpDRevjgCuUySZul1zUVPp3iMUSUfP/UWJQjkY2UEzl1hwFKp8tA7PLP3RaL0USxnWCMpuUufppZZWso4Bkps5UE1MiX4lrYjkvEM4VRsqW5VLT8rxLaP2398ilAD3vU/tpuCcrsnNFc+Kw2YMZ04wptrvLOqOzHGWFtMQM1t3yPulgfK5+T4BEgkOIVlGSS5ytFneADRDVPYtpgCdhA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(921020)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnMwU2xsMFZDQVpIMlpMcU0rYlQ4WXlKYjdFVWxzeURZbVgybnAwYVEyOUdm?=
 =?utf-8?B?UTJYd3JqQUwwZnlTSWg1L2JOeGNJNHNjcmM2THNsUXpZelZOQ2d2N1UvZHFU?=
 =?utf-8?B?YVdKNE90Q00rZHNUa3ROR3BWWFh1elhyWVg1MFFWMFIzM0taZDZyMHV5RnlL?=
 =?utf-8?B?UUNRZmdxN1lFMmoyNElUeHlvN1ZnOVRDVG9TdGVYLzBLejhWSFd5NmRNZnRW?=
 =?utf-8?B?N2VEQ004TTF6d2hzSWpING9vV09lVHNuSzRrSW4ySWFXVHhmdEROK0owekJ2?=
 =?utf-8?B?NThaYjMybkJ6blR0WHRDdTJXRURwanUrWUN4dkZxQ3l3VUJKZk52Z093Rnoy?=
 =?utf-8?B?Q3ZKTmR3UDlmYkRpMGdxYkN0OHdFeUNzckUxY1Q4K2hYNmZJblEzZmxDMHM5?=
 =?utf-8?B?QVRhenR5UHg1bTg4c0JLdDNMT3g4bFNtVXh1YVdGSGluZHZ6bmJOS283ZWpR?=
 =?utf-8?B?MUZmbmgxbWJDdUNocEo0cjl0T21KbGFsdDVFQmhoQ0FhN2tKZmJOMjBuWkVY?=
 =?utf-8?B?dGZaOXlZL3krMW8zc1NBd1FpZDJjWnA5NFVOWk1PdmxzUUxKWFFkMWJhek5E?=
 =?utf-8?B?bVJyZ1M4Q2c4OWsyWnZuS0tBNmxVRHdYT0FTNjhqV1g3Q0Q3dC9yUFkvM3lK?=
 =?utf-8?B?R291b0NpY2pUeHNxY3ZaUFIwclNwRVRvRkJHQVJkMDVQbnZkUThBM1hCOGM1?=
 =?utf-8?B?eVFwY0ZML2VReUgyTmQxYUQ2UlRGbjV6TmY0M05zbHpaSlRTYjU5U3hwa1VJ?=
 =?utf-8?B?SnVHOUJqcW5FMVhlcEhFcnNycGlkUUhFdm1CcDBiUjlld0FZK2w5VkMwTmtq?=
 =?utf-8?B?S1AvUng2MDY5Y2JNYkYrNWQ5TzZvWW5kbWFMeWZZQmJoZkgyNU5LVUdBU0ZP?=
 =?utf-8?B?ODRoaXZmQThqS0N5UWZ4eGpoL2NGeTMrVEpGdXNRMkhPemJrdVFhZFBUbFp1?=
 =?utf-8?B?QzdxMTh5ZU5JREY0QzFqWnJhSjB2Z0tPTG14WDU0WEZES1BMajd3dHVVUnUr?=
 =?utf-8?B?RmZJT1B3cUNBcjRRVzcyUWw0TjVCVVdncEdaYmdiM2NTWWVFQjd2M1lqYVFZ?=
 =?utf-8?B?T0RKV3FRS2VhMlEvWlNFWUxlc0NrVFF6bHh2Y0UwdkU1Z2dJMmRCMERNOFVE?=
 =?utf-8?B?cUlmMjN5RDdySUVkSG5EQ1JXM3ZJSVRhTEhIY3J2UlVkWjd0aTVtU1lHV2Iz?=
 =?utf-8?B?NmFGT2kyc2xFREtEbVZYQmFBNFJRU2o4OC9MMFVGSDg4VFlYeHI4cjdmekRl?=
 =?utf-8?B?ZmszOHVzajZTSlNkeGVNZHFPNlRsNDVRQmFWOGh1WDNUQ0JJbmFsZWZ5alh5?=
 =?utf-8?B?T1ZXQzMvSnMrY250S0Q2OHZlalkzbWZkbTJDYmIrM3ZRUW9sZUl3VFE3a0pU?=
 =?utf-8?B?UjNFczFmNUwvWG5lU0FpcUhFZEdqV2dBNGlOZ0MxL2JneXdTVkNjR3NFRk8z?=
 =?utf-8?B?d2RqU2xTRzZWd2s4aC92RlNWMUFuTFg4bHBYbTlmR2VjSll1Rk9PVmFBK0hT?=
 =?utf-8?B?M0xKYnBpMnBUd3lXVCtSQzJHcVU4RzZjZ1hNWDY3RFN6Qzg1SFRzemNYb2VS?=
 =?utf-8?B?b0tDcEk5YzJHS2M1WU9TNXU2Zmthb2Z1SFhLdVFvUklNenVoVmNxQjVtTVVC?=
 =?utf-8?B?bWloeVZSeVdpNWhMOXR6UVpPODRTWEVGMWkrVkR2YkNBcnhVdVRia25FMlA2?=
 =?utf-8?B?R0gxVGpGY3NuaVVlSFlQcGJ6bDZ5V0hXazJkeU1SQ0daRHBYUjJYWkVpblBO?=
 =?utf-8?B?OEsvNENSWnBuV2FsOEpqVDFubHpTR1pNQkI5OXlUaVNYWkVsRlhUcy9WN3JO?=
 =?utf-8?B?T2dONTRmN0U3VVhWbG1lTEIveTB0ZUlZd3ltZjFQamQwSXhVR2FCbkZWdTFM?=
 =?utf-8?B?eDYrZEtmWmZ6TVV1YUE2M3pHNUVocFRudmdFQTJYdm52aS90dGRhWEhoRnN5?=
 =?utf-8?B?dVk3L3RIWnB0b0VOY09HSlpZMXdXUDFNZnpTbDd5WlE4WS9RRDMyd2RnZWcy?=
 =?utf-8?B?ZkpUdUlEUFgxQkNCN3RPaGxpYi93TVJROUhEbVdYSXpRK1ZNRHVDNTdYaWVI?=
 =?utf-8?B?YWZYMXdJb0lmNVZuamsraFlhQW94MDJGS0wzUWxVdEdodDhueFFXdnh4QTZt?=
 =?utf-8?B?enA5clltUTJiNDBhbTNnaWNNaGIzTmVEZ1gxdGZpUTlkblJ4U3Bsb1RiUjBZ?=
 =?utf-8?B?ZnovekR6OExnNzVZSnFLL3JFR2hQUnVuRlF0cEd0OG5FUDNwdlZQRXZwZTUx?=
 =?utf-8?B?UXQxS1o2VW92SlN0VDRNaDJ5QnZHc0JyREpHbkJzK1hCYk56U0lPS2xYdkpH?=
 =?utf-8?Q?5olcwsO0fQPB1XZny/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a84b9ff-5fda-477f-a4fe-08df15a5cfe3
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 16:56:41.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOX4YW+4SniQRwwForZvDd/VDeXXbzM1KMAEGUNiiSChsAsEzdEu1a3lG20UH6ec
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617

On Fri Sep 18, 2026 at 12:34 PM EDT, David Hildenbrand (Arm) wrote:
> Let's split it up into MIGRATION and NUMA PLACEMENT. The latter is a
> better fitting description for mempolicy.c.
>
> Make a best guess about which pieces existing reviewers are interested
> in. Move the split sections to keep alphabetical order.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  MAINTAINERS | 62 ++++++++++++++++++++++++++++++++++++-------------------=
------
>  1 file changed, 37 insertions(+), 25 deletions(-)
>

Makes sense.

Acked-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

