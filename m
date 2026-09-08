Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013051.outbound.protection.outlook.com [40.107.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDC6331ED7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882295; cv=fail; b=oyA3+Nk5aBazUf8YkTSkX0M/i9fgOE4h8TKrQNDtg5sfLkDH+NfQL4HiUcYN+nsVjRgsIj5ydscaTQIF48VxN5y1l0cGgf8/a4q2u8j7N2vuPyGIER+Ruoc9Lqage0vLMFFxmqwn23bnPwjLqD4KB/raravrj38R9BP7oNpCWTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882295; c=relaxed/simple;
	bh=PPY1dCMqvpPKtw/iWkW86afM21jSae6lVVrV9o3hG68=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To:MIME-Version; b=ehQJWpWyFyVBqX8Ne+TSdqXOEm2hXDet6RzaziRe9DlXi02AthcMxbjhkb8Nr9ya1cp0OQRvn5jitTaoorZy2ygHbnkrH0mmDqBaYvhAekjd4kWc/v1qjf4gu+po8Ww13hoyavNg6yz0mZcMo6lvD4UkBFV94ZYHUizuKP0kDfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VQx6+JOE; arc=fail smtp.client-ip=40.107.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VQx6+JOE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNXTeJn3wAg9WXnadc23COLow0t+fVtyrSLdBMioSg5aXICV5bD0aB1n3v39op2ITN6V93hppovIIPHIo5pRlumrqSHEI+ea/kevee/IT8UhCPUEsHmKkJ3mldz8BUGhQFkOKIhnuU+5dzAeMHXChSYWnx1wzVI8YtvxQXedsdGOLpMznnnFdC3PSbxZTDnbT0q2phGAf4VOiNRHMUsx0yfwwccG4NMp+sP6YPQhl7nTlH7z/6gBnKLwHt9JDV2cRwt4PUajH8ySLywTgqKbCK/CyUDqHyr4ueNvyUHJ0r4g5oos9Zhm3Wzk/L32ldFSKpDkNo6kB5sP36NhVPkBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUonv+1fXdqRVR64AjAKSh8fzS4K5yeQQGpHI4+sTZ8=;
 b=PikpR45oEYt7MOJrMl878COZoD2IIZKHqiCAwU58mVam3iieo2TBvGtCh/j9um5cL1A2iMlsqPQgLVZwEQua7eA9S9omvpF6t1V3OCx4Mgztnm7AaLNbw0BfjhZsaAYaFADhkaZyeLC+6n4/Nm3qCyw3ewxvpFS8Oz0+LncaaO14l3spbkJWmM/tFP9jCHoJ8J8O1Lvi0ZWDc4L54MCSLAA/qE//ge7iFLRVkV+LiH/QL129zXUPD221WRuRtjvV83Q1RlbYUYJIrbBqsSV+6srlsuFiVfETaAS5WS6Pywl0QJNH9gYXo0ENyLzrZ0NpVt7s7JcTaFMcm2qZtma4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUonv+1fXdqRVR64AjAKSh8fzS4K5yeQQGpHI4+sTZ8=;
 b=VQx6+JOEraj6F3kNb1lGvXWTN1o/WItmH/zgpXqIqgTvd/xwyfGVpRMN0IejkRjKj63anvIeHtak/4zmN8cbKRHU8FWG6ZPn4b95MnE5BZT44qeeX5g0aRmbUs9Az8hhZVOjxpCbmIS1diERpW2YQoiPHHeE/rgLtMuqFwL1aILcIyVB0p8kP45bWm9efkuBk8zAg2gZkv5JVszC6sGzooeOg6mt9Uuo96TjleJWDGc9uowAsXgQdIPRbPTbTNelpaAMktdLfNTvkwwDGZt4ki+hBH4p8/+d3JcF9iMclf11k/r9zoCPHrG6ydqkAxF6AB5rHTLHQU7AP7zyZ0FTfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DSSPR12MB999211.namprd12.prod.outlook.com (2603:10b6:8:375::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 15:44:48 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 15:44:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 11:44:46 -0400
Message-Id: <DLA1UH74Q0WX.1D02BUATXHDG6@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v3 03/14] xen/grant-table: stop setting PG_private on
 pages for grant mapping
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, "Juergen Gross"
 <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 <xen-devel@lists.xenproject.org>
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
X-Mailer: aerc 0.22.0
References: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
 <20260907-remove-pg_private-v3-3-6ae22f9d9272@nvidia.com>
 <fb8ab0ac-87b8-44ea-87d2-006a7a7569f1@kernel.org>
In-Reply-To: <fb8ab0ac-87b8-44ea-87d2-006a7a7569f1@kernel.org>
X-ClientProxiedBy: YQBPR0101CA0188.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::31) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DSSPR12MB999211:EE_
X-MS-Office365-Filtering-Correlation-Id: 2942c721-1277-418e-bc0f-08df0dc01d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|921020|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	XaYRZ3hMQP1dy8zHLVQuJFN5za1QToGQt9Np4pUCVCDk0m5zU5/n9F7pr0ubBVv20NDKcCih2Whe8JgqBx+5Ca5Q747AsQ5Lv38E96I82nShv7lgit+PCqqwNXuDrCm4aaZvCrplHUZjpp1SmNciGZvIftAkkXsg5Yh5IY8/MrwlIvsWHVmcm8mQxJnOPceQYiJxM/03zdLcdcv/At02p7ThuMRAHUEe566VIP/OcD++mMgGnHLJ7ixzSXCnt6Jl5xxJw9PoUiDw8vZYAVvRuo7SJOmjRR6hcOqKg7IOMbo2ZvRy1eJxYTaCY43yeaQuhbvbKoUKCQsxRsATmIGRsUsgtGqImuf4v23nNxoj7h/GPjSvL3ejGU0QeuQdXCMGmT6GjVMh8K/Pi10q34gW/yghJU/wBuhaMrEATFRoLtJ+l9qPEnTQwjErQT8KkkvDOja6zS3h25UELh4VCZVwg3D3ndPYJN7gBt0a8lUJ7NGItcGExgsRAcMpSkBMcKVV62FCDJnK//N4c0VMsnBHcvsLygFdSHc0CYpLZVPosIaHl/mgM0ET4wh/DmPS/6UJsX8HhgLnGH38TnO+NL6eusjsHFYnjWj+qqtveTG+gPhI/tnqsUIMa1c+mWhOAcDwn0JCE5clzRqvJjqm30WObf813onLye+4tPFXdlxaQLJ8yiwcTxX1N2aQfHLYfuvS1r1DESH47op/YTAN3zQl3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(921020)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG1QZHNEaEpGdWJNK3ZaZXhKbFFSQzdXak1CdUJYZkw1VnQwWlN4aWFGemxJ?=
 =?utf-8?B?MjlpUmJVeWVjRFpaYXpWUVAyQkFGMW8xR3pDRGtxY0ErcFVwazhlZXZSWG9M?=
 =?utf-8?B?bXVNUnBsUURZZy96QnY1YXpVVlJ0YitXaEhwL3NNTEt2KzlWOEZ5S1Z4WDhZ?=
 =?utf-8?B?SzNsNVBYYlF0REpXOVdpTjQ0R3dXOFFLNVp2ODlHT1BBT1JwT2U5TDBhMVBw?=
 =?utf-8?B?alcrUzVaWUlHRVN1MkxaWWNCOEN1VlQ2Vy8zR25EVkkvQ0FROUVZM3hZaVVx?=
 =?utf-8?B?bEcxeUphc05SYXdML0tGTVl0ZFJDMWxJWm95UWNxWk5ZR3dqTXBXZ0hvdWwy?=
 =?utf-8?B?bk9VNGpDbzV4SzZMakR3UFlDK0dURVNVTlUxMmtOUFE1RHJ1ejc3SXBvNXZ4?=
 =?utf-8?B?WWxvWUR4S0RuMjZtTlNoVnBHQVJ2RWJ1aC9udjZNRmhOcXF2K0lpTGUxRFo2?=
 =?utf-8?B?NTJmVzhoN2ZoS2IzOCsySlpCQVlVbFhsTGVXWDV1dUZTMEtoYWllSXI5cXdy?=
 =?utf-8?B?cmlOcHVPcEFkNXJpQklVeXNoK2dPK0E4SWEwMTllTzRoa0Zwb1JTcDVEa1kv?=
 =?utf-8?B?ZmNGTTF3TzgwVGRVd3hQMWZsMVRhbmp1S1lwVTJqWllucU8vL1ErOVpXV1dl?=
 =?utf-8?B?OE5adjcwS0xJbVp3a002aGJJMnNjNmtxbXN1NUhMVmlERDRaaFlubFY1Y0ZC?=
 =?utf-8?B?Y0xOU044MmxEdXdoVzQ2WHBYRXhMbWVENU4wajEvNkJrWkpLY0t3bkNsbnkr?=
 =?utf-8?B?eUMxZkY1Y0pRODJOUHUxK0RXbm00M05TaGIyVGZteDBBR0tKejliai9VeW5x?=
 =?utf-8?B?b3ZBczlUMU9TNmxBUmFveElEY3JITXhTRDJTYkdVMzdSZWNPdGV5cVVqZ2pQ?=
 =?utf-8?B?Vis5UHRvN3U4U2Z3OXNiRWZVdVIxL216QllOb0d6YjFmcXpHcW0zMWZ1Mytv?=
 =?utf-8?B?RW0raURBYWFXamNKK3BDVzlCalFIaW5tQk45cHZzK1VXSFRQTkUvajBPUGZj?=
 =?utf-8?B?VkxrWHNmMVVJcjZ3cUMwcFZtWmdtaUJud1hxdTlhMWtIM2lhZVpxU0R4QnZu?=
 =?utf-8?B?Mi9NQlR2elpPTnZIa1VuTWp6N1FyYUU5SW5tUERYOFRkMStmb3NIcGRVMHhC?=
 =?utf-8?B?NVJ2NFV1aEZNK2VzeGhHdUJjeDZrRUIyQ0hCV2l6VEEvbTBrWkxxdkh4MUpO?=
 =?utf-8?B?NWw2QWp5RnZvN0x4V1lKTHUzenpzbkpTK0MzbHQwYVU3dFBZcTRsZzNCNk02?=
 =?utf-8?B?UHBqS0k4cGFvbTVWc2k0TjhUOXM1RGVkeDhQdklWK2VsR0dnRG1WZEFTM1p0?=
 =?utf-8?B?WThIVnhwOVNDcFVPeER2dWtyWlE2QnNaRi9INWVMSVlTUkNwYU9DTDR4cTIx?=
 =?utf-8?B?Z1o4Y042YUFEMGVVeWg2dzJHZWcvazVhM1JweTlsRWVtT2dCT0ZFYTY5aXJ4?=
 =?utf-8?B?alNqMXJUbVZYQmx4VVBhZGl3Rjg5aEZaTnRTdG4vMFRiamtxMnhUNmsrVlBv?=
 =?utf-8?B?M2F6NVdjdGFqWTRBaGZnTy9EYXhEWnY5allHWUlqR3pyTjlQMHc3SUJvc21l?=
 =?utf-8?B?RzZjdzIyVUFEZ05MZmcvdVBtbVErS0ZINGtFZGsybEgxWkVGeHFJK0NhaGIy?=
 =?utf-8?B?cWsySmNPaHdCOUFTbC9jU1FhcVRlaG5Pc3l2Nk5NZngwY2xvY0VqbXoyMFdS?=
 =?utf-8?B?REFSbU9YS2pia256amJJY3JXTzg1U1FhQmJWOXFvT2ZvUU1XZjlNNjUvVXR2?=
 =?utf-8?B?a2lGVTJQODJudUJTZFRPMHdNaC9EWWxJQ0NuUk9UZXF5aXhIc2NzVG5wekh5?=
 =?utf-8?B?b2plSjRMQlAwVWllS1RId1AxR3M4K1RBWWRrWm1td3ZrQzZUd0pCSlF5dElj?=
 =?utf-8?B?ekVtTENtdUtiYmNCcWdXSG9iaExoS0VZUGttODIyc3FWR2s5Ylp4cUZQLzR0?=
 =?utf-8?B?T3Y4em02aXNGcUhWMTcwYXhiYkhsNWVhZTJWSU1VL0hGS3ZSUXcvZjFjMnVq?=
 =?utf-8?B?ZmU2SFd2NXdMRS9VdkxNRzFxOEN1TXdFWjFOcXdRamQxZGM4Vk1QQkprb21u?=
 =?utf-8?B?Vi8wSllnRmw4Qk9DN3RnSGRDQU9QOXpDd2E3YVV5bFp0Zk5rdmRrTHowdmR6?=
 =?utf-8?B?cHdEUDlIZ2IrVVM0R09SN29kTWx6N0tMa1VYcHJDVldkV3RTVmlkMmtrNUFa?=
 =?utf-8?B?cTU0SVE2bnlvMnBMNjlVMUNUZm5sRzZIKzN6QklsR25Md2RocjcwZ1RpOW83?=
 =?utf-8?B?K3V0YWxPZ0dkdmxwNDUwZEJLT2lnZHFtd2liTnYxVndtRk5pUnp3Y0JJVHlz?=
 =?utf-8?Q?c0ed76aK3anHzx1UPS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2942c721-1277-418e-bc0f-08df0dc01d2a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 15:44:48.5324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfRJXV2NR0FgilVsT6+QHdVji/HcNkfjCIduQjGWJd6mj1bOCPnzJy91HGcXIOh9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR12MB999211

On Tue Sep 8, 2026 at 11:16 AM EDT, David Hildenbrand (Arm) wrote:
> On 9/8/26 04:56, Zi Yan wrote:
>> gnttab_alloc_pages() stores xen_page_foreign in page->private. On 32-bit=
, a
>> pointer to an allocated xen_page_foreign is stored; on 64-bit,
>> xen_page_foreign is stored inline. Checking page->private !=3D NULL is e=
nough
>> to tell whether a xen_page_foreign needs to be freed on 32-bit and
>> page->private is zeroed unconditionally on 64-bit.
>>=20
>> It prepares for a future commit that remove PG_private.
>>=20
>> No functional change intended.
>>=20
>> Assisted-by: Claude:claude-opus-4-8
>> Assisted-by: Codex:gpt-5
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> To: Juergen Gross <jgross@suse.com>
>> To: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Cc: xen-devel@lists.xenproject.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>  drivers/xen/balloon.c     |  5 +++++
>>  drivers/xen/grant-table.c | 11 +++++------
>>  2 files changed, 10 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
>> index e7f74ea7cd5eb..fdb18348cfdfe 100644
>> --- a/drivers/xen/balloon.c
>> +++ b/drivers/xen/balloon.c
>> @@ -182,6 +182,11 @@ static struct page *balloon_retrieve(bool require_l=
owmem)
>> =20
>>  	__ClearPageOffline(page);
>>  	dec_node_page_state(page, NR_BALLOON_PAGES);
>> +	/*
>> +	 * clear page->private before giving it out, since it might be used to
>> +	 * store xen_page_foreign info.
>> +	 */
>> +	set_page_private(page, 0);
>
> Who would have set it to !=3D 0 in the first place?

No one else, except
>
> e.g., gnttab_free_pages() resets it to 0 now before calling
> xen_free_unpopulated_pages().

After reading more, I agree with you that the above change is unnecesary
and will remove it in the next version. Thanks.

--=20
Best Regards,
Yan, Zi

