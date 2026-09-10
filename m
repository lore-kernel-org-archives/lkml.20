Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013027.outbound.protection.outlook.com [40.93.196.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6D12F3632
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789006006; cv=fail; b=u+D+2bSZdNtYfeJ5p+D8tpWOKvn235ENcNplE1s/R2XHmNQMFYxr+fvjY49armxxe20aPIzTDzrx9vwiLUqx010j/xqvOO5jtvuLyDVk5Avr7tsHlo4bXyEeySQhD7niXDDM0E8Ls9yR2BoyvAW8nnl0kKwef/g5YL96MOVlWqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789006006; c=relaxed/simple;
	bh=x40aRbMzFWF/bvYyhhE2xl5XzaiDLlLsph+nFjRe8ls=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=Kg80F0DaWpS84VXh9zh8qEipZhjRYn5hnSp9FVJkuV5Nu0d7pk71oMZIGJ+hR2+HVeGmk/Feqdamoi0i8+aCUWye1O9+FIKgo2JAf5Dp+Kpr9U/ujgp60A1jiX1R97icMKVQMmYCiCmfYfehx6FbJAydqeUod4DCTdsUlhBMNF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JmJJWzsw; arc=fail smtp.client-ip=40.93.196.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JmJJWzsw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaCmeil3fk6TyWRRd+y0RfXVGu1QmrC60vL6axGOpCZweENrgaDcClM9FFQyYaGe/shmAy+EFbcfMlvBKlcqHrgt7xDfiQyNbTTKzvNtPOcAfjZ0Sfa2twYDYvmyMahSa8ial7BWO5CMzcHNHBORIgWbDVg1RlV9VIsBFLt1mKI3rq7uni+rHDYhOk1UKene00XwMVu5WSlEVyKhpTWKd8Vu0/gf8BpX+COdmofCsST1yIHtpHNkq+tUxauEbq2q0h1ULwA1q+sVoXNjq/eDggB7U2C3Vy0FpCIYGqMzBCAUWMnVBD4tuPnwAlq8o9l+9IuU8RZm8uj4OXeKxk/Nsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x40aRbMzFWF/bvYyhhE2xl5XzaiDLlLsph+nFjRe8ls=;
 b=aGaKhH3qGuNxzRSTAMMHC0ufg2lxTmC27AsGxwarWzxPtobUxH9FtNLQdQdpqkjBLcdhfVtvM5jL+RwEmGYVJULhn4VVeOFItDpjACBTUED07eqs3sSDI2tp5A8csjYFcj4zJ+EWk/nfT/KjM9mXeqxMzX5dVjE1rL+g9Y3W5O/RjJrjMURBkUtOR3RUZM6hn01xl8nDRhjCJgPX2rllOI9CxdcALuR3Gys2WPPG+nZvEMY8WPLSGOKnpsSH/GCQfdovb+7tfQnFhIjuYPLvvvZ2MovbcBfoGlzxXtJOGMDr0W0+EzLL4mHv7ZXaGYnMnx4H/ZY5z6XeUB0gmTt6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x40aRbMzFWF/bvYyhhE2xl5XzaiDLlLsph+nFjRe8ls=;
 b=JmJJWzswmMMwobUklAGXIL3BVox0Qu9B7/qOJvv1T6x2ve0/y0uzz1l8q9Ph1lXnwwERaELZpOLV/lM+cWXGfN1ffRnCiIWl7HLc0/3gce5sLaSWrrpd14Tuz/cwvptIaYqs2WG7GLkWgvs0Yd717c8TvpzLhQYvza+lvuzFdbLhWfWFSv1kyNsuBBcoHwKr92CsEklVdegIThOsfG7c+GXLkS8S9Ox8VbBzIzOqsUlXxV/wGVZz76vKbwqglMikk1QTCCZ79Uh+t6rFgc2bdlCTOBADQBMpHZsl/PTk5Cy42p4gSIX2PRQfbAj/laoDoq3i9AGotAfcm061vXAkPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH2PR12MB4183.namprd12.prod.outlook.com (2603:10b6:610:7a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 02:06:37 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 02:06:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 22:06:28 -0400
Message-Id: <DLB9P1EMBOR6.3TBTKYVH8B9PT@nvidia.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, "Gao Xiang"
 <xiang@kernel.org>, "Chao Yu" <chao@kernel.org>, "Yue Hu"
 <zbestahu@gmail.com>, "Jeffle Xu" <jefflexu@linux.alibaba.com>, "Sandeep
 Dhavale" <dhavale@google.com>, "Hongbo Li" <hongbohbli@tencent.com>,
 "Chunhai Guo" <guochunhai@vivo.com>, <linux-erofs@lists.ozlabs.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, "Andrew Morton" <akpm@linux-foundation.org>, "Muchun
 Song" <muchun.song@linux.dev>, "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry
 Song" <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama
 Arif" <usama.arif@linux.dev>, "Gregory Price" <gourry@gourry.net>, "Ying
 Huang" <ying.huang@linux.alibaba.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Johannes Weiner" <hannes@cmpxchg.org>, "Qi Zheng"
 <qi.zheng@linux.dev>, "Shakeel Butt" <shakeel.butt@linux.dev>, "Kairui
 Song" <kasong@tencent.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v3 08/14] erofs: use folio_attach/detach_private()
 instead of direct assignment
X-Mailer: aerc 0.22.0
References: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
 <20260907-remove-pg_private-v3-8-6ae22f9d9272@nvidia.com>
 <5b02f5de-00b6-4f8e-9e30-6d0acedafaf4@kernel.org>
 <DLA3V43TKTU8.20221CSH8UJ5T@nvidia.com>
 <6a465ff3-21ff-435d-963b-385e7e5174fa@kernel.org>
In-Reply-To: <6a465ff3-21ff-435d-963b-385e7e5174fa@kernel.org>
X-ClientProxiedBy: YQZPR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::9) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH2PR12MB4183:EE_
X-MS-Office365-Filtering-Correlation-Id: 02225031-74d8-41fe-88fa-08df0ee02583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	H0w1nvCL7CUOaqNlWTupzXfD+1d8GkwboemySVXFMSuABK3ndaOk1FN/JBQyq6c1ikeUc/CVn3dfRgDjpnKPrQlW3I/+8JeiyTUSeUzF2OU1aMjMOhp169eUCyNz81Ic0U3R8soY07SSBK4CUmYloO40JUpGYBQesmK7IIXb4witIHY/Nk0mwH4gYFLBCSGhasfOE7BqEb8pzEm5WK+sJxDIzBni1tANhQHJ1Y/IhMKtQJGnfdiTZ1EyRPDZMsEawWUfhqgnuwZEEPW8P6bkT/xgrmIL7h4kkx1yer8qS5l9xM4dqT8ZyjfaSPUUze3TLFSY10qIlFrzkEBNUcFkoJd12hbBJARgyuY0qrKxTFGR7Q/eb3JJTXy3OdGzNIov7C+r5OdfYUeoByI/3ePu1Fo1tPudI9BtlpCUAIWXFSxfy5Q2B+kBjmLcdEGMPxzknuC/NJHjNlM5S22hcRgeIpLozBAlulwPIMmzkEPraCyZ+DdKsjHmU+Xs4euOdiRlCgCY629DbmJXkT/fgtwz7ET5BofjHliq714ZcR38qQcqdiRGqxMP8SeS6t3Msfb2ZR0oyCfMJ4IdmuZE/surtk03uLr/nQZBC2aueEP8B76egPYfQsw8i00VlrRggMBHUkZ4n5wFAsxuMCnebEpmYmG+jTkbnl22nVtcTFclJ3fbrE/7s1rNI6W75e2rPfdxdH0T87FhTWeT+omaq0gTuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVpqSVYzU2Y0REZjNTdWT2hpUlZwVUFuNWxFVTJTNHRkOE5mS2RNSTJUYUFQ?=
 =?utf-8?B?dDg2NGgzUmQzZDhjNzZBR2I4U2wveG9xSDFnRXM4MTBUVnJPSlM3S1lybGd2?=
 =?utf-8?B?ajJSbUVYcVhmMVJzNW96S05raWNFdnl4a25LMWVHZHc2ZUNBOExCbzIrREVZ?=
 =?utf-8?B?RGh6L3BEcWRHciszZjZaU1JEY2RXOUxNSU92UlZnUTFlNldWYzQwWXBSZmxr?=
 =?utf-8?B?V2pZRUdoelRIREFJNzU3OGJNZGQ2WnIyd3NxSkNFbnJMZGgxSnhjSFNOVTlW?=
 =?utf-8?B?NCtJd2tPTWwwV0ZwMCtwbGFObXhWVGFhWENpZks3TXZObWFXL2c3Rnhtc3NK?=
 =?utf-8?B?L3lTMGNLQVRRUVl2blEvUDNValBCbmU3MCtGc1lTY1dUVVZEYjdOMy94elRS?=
 =?utf-8?B?VWdNVW9mSVFJd2F3OUsrdEQxUUR2bTBrRmZSMzN5K2lTcW83VmJVeEdSeXA1?=
 =?utf-8?B?cVg4RUQvZng3ZlV6OHB5VWFGN1grU1EwZ0hyWVZZYytyR0k4Zll4ZzVKZTd5?=
 =?utf-8?B?aGJqak9VemZqelBBMzk3M1VHN2RVOXlnT2cvcW44ZUdhVDNqeE4vNlFQNit1?=
 =?utf-8?B?dDdpRWxJa3hhaVE1VzgrMUN4eUp6WG1WOXo0c1ZFVFI2MVJ3b0VVOTM3L2dR?=
 =?utf-8?B?NVAzYWpSbWZWdlJWWUMvc1pmSHlBeUo5Wm9PT0ZBZ05zSVBCOTlPTWhsWmwv?=
 =?utf-8?B?SnZyczFvRTdxM0RKR2FVNDRxc09zZG9nb1o0RlNKTmJQeGRMQU1EbWxFSmpz?=
 =?utf-8?B?dk5pVSsrcnNqUVpwT1pVUTl5VTZLZDZqcHoxL3YzTFZpb2tFTDB3M0lUMXVP?=
 =?utf-8?B?SkxJUzd2T1Y5RmF5RWxvNk5ETXhnOFZRdDJvZGhDNHBxVnBZbzB0UGdCdS94?=
 =?utf-8?B?eDkzUVB6UlZES0ZwOUEyZ3o1YmNyRHJwYUM3MlFlZzc3RWRvcGhaNm9JN3Fk?=
 =?utf-8?B?bjMxdnNuaVJhSE9DRmJWeDBCd1prNlVoYTd3ZWpEenU3YzFsZnVKbVd5ejM5?=
 =?utf-8?B?c2E2aWpVY3NmNDFBbnlkem9ZNFM2bzVyZTdJQXZZbmxBK0xoSzZ0ek04alVI?=
 =?utf-8?B?eFNmWUloaHg3Wk5SNVNxYTM3ZnFVQ3dkdlhPaW5FSXlPMjFYeUlmOHBlQnI0?=
 =?utf-8?B?VENUM1pZa3N2SFQ3N3pXRWhVMkdWeEs3YjlpaDAxZDRuckc3Q082TVdJbk1h?=
 =?utf-8?B?Y1N2TWFlSDFoTEQwY1dXVHE0VVlWM0szVTFHY256VldvcHBmbDh2ZHlwSWpu?=
 =?utf-8?B?bXVLRm5MWitLWHphajJtVTV1YmZLYlUyckZWNjdkZlR2cWNaaTU0Z3BrUVlY?=
 =?utf-8?B?anl6MjYweVJOemFHaDFqdmFYOFJaVFNJYmlibjZhcEJGUlhianRldVMveVhM?=
 =?utf-8?B?TzE2cWNVTGNsQ2ZGTk91Q1NiYWtldXVUckFKTjVhMmNhdzNIZWo0TGpmdmJZ?=
 =?utf-8?B?SUh0Z2hPcHBTbkhtWXcrNG1mNnV2NHhocVZRN2N1MUdycUZpRW5LLzZNRmZG?=
 =?utf-8?B?QlBjVmRxYTdoU0tMUmFsV2ZpSkppYWRTcmljb2xWNUpiOGNKNVB3ZGpRdHZD?=
 =?utf-8?B?RWtFZHpHcVRHVm9ZYXdQZmI5cmNqQTdybkFNeEkvbk1BL1N2VVloMG0vRCtx?=
 =?utf-8?B?ZFVKb2poemkwM2pBMlNJeWJTcThScWY0OS9iRVI0MzBhRTR0bHNIRXFMeGNv?=
 =?utf-8?B?Yk5mVnQ2d2YraWRDa2RZbmxkTjd2U3NabzcxTWdDVE43bzJOVS93VHRzcnlJ?=
 =?utf-8?B?MndyOG9QcjYvVHF2VWNnbHY1OUxuNzlSYVA4WUJKVkx5MUFtSmptOXBxVVpy?=
 =?utf-8?B?SDRMYzk5WkRjOGQxMHpIMmljWDdpSFF1czNTZmRQRWVLMUJqdFNzdVNDZkFF?=
 =?utf-8?B?aXBEU0J1djhUbTFOMytKWjVHWG5wVkZEVmVTV1psMXplcm5manNKbGt6RUc1?=
 =?utf-8?B?MkNtdmJoL0JPNDZaYTBoNzFqYS9KZG4yTXc1dURNLzdOSTlWOENGNTkrc0FJ?=
 =?utf-8?B?OGZjMFZmY0FXWk84aURVeXkrSEVGdmQvVVVKS3E4THNCR3VqcklEdzBDV0VS?=
 =?utf-8?B?NWtDWDl3UGhWdHBQazNQREIzeGdXQlFLeUEzYU1ndFJORGZ1MnZpUGQzS05E?=
 =?utf-8?B?NUhXSnJKc29hemp1Mnh4R3RFRlJ6UVIyeGR6andOWXlRY2pjWFpQbFFiV3Nj?=
 =?utf-8?B?SG9SNlZaZTlRY0EvQmNTSGIwMmUzRFlNM3o3M210ZEtUNDIyVEx3aUloNGg4?=
 =?utf-8?B?bkhVUmV1d3VRajZhNkZTdmJrUGNOdC9KUTRtenFYYVpUQTBjQUNpQjJJL1RQ?=
 =?utf-8?Q?/5Z8CeRKnDl4oBpV0I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02225031-74d8-41fe-88fa-08df0ee02583
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 02:06:37.6381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ipS39WzthEgV2gwnoJGlcsNJ2grM5zeHlVwLcr2aNdGnHr+Cb+cPjfZyg8xio6b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4183

On Wed Sep 9, 2026 at 9:27 AM EDT, David Hildenbrand (Arm) wrote:
> On 9/8/26 19:19, Zi Yan wrote:
>> On Tue Sep 8, 2026 at 12:13 PM EDT, David Hildenbrand (Arm) wrote:
>>> On 9/8/26 04:56, Zi Yan wrote:
>>>> erofs_onlinefolio_init/split/end() use folio->private without setting
>>>> PG_private or increasing folio refcount and it works. But after PG_pri=
vate
>>>> is replaced by checking folio->private in a future commit, it can brea=
k
>>>> folio_expected_ref_count(), since the folio has private data without
>>>> elevated refcount. Change them to use folio_attach/detach_private().
>>>
>>> Freezing the folio will properly work I assume, as we'd always freeze w=
ith that
>>> refcount in mind or remove the reference (detach private) early?
>>=20
>> Yes.
>>=20
>>>
>>> I'm thinking of folio_ref_freeze() in __folio_freeze_and_split_unmapped=
().
>>>
>>> Or is the ref only very short-lived either way such that we don't care?
>>=20
>> The folios here are locked since they are in the process of
>> readahead, which requires all folios locked. So they are not reachable
>> from folio split code. In additio, the private is deatched and ref is
>> decreased before the folio lock is dropped.
>
> It would be great to summarize this interaction with core-mm (migration/s=
plit)
> in the patch description.

Will update the commit message.



--=20
Best Regards,
Yan, Zi

