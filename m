Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011040.outbound.protection.outlook.com [52.101.57.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA31230C14C;
	Mon, 31 Aug 2026 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181690; cv=fail; b=PfBE8mKpa5CXjjE9o+Ck+hvT6wep0JrwCAGyh4ItOBVci6L+UHMAYLOf99As8Ap6TviuOAjIgPB9XNEcHEd6MxRFRH+simVgwAVUZjcWRTdtyOrZZBmO9espPDAYyL4lRaFFZi0YJyShvg0gQOWBrAull5S7ICbsdOatE1598GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181690; c=relaxed/simple;
	bh=vRdkOlYAPI7JrehcVEjh94q9bW70kZh0tOZgne57oY4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ogD/iHArwbtXZNQAC/YyOm9CBtfZwGgt91LmMDclm35jX+UHkrHbh89WFQTJK8OVNHkz5xBpKH45gN1xQEiXbeahdJB6STKXaLMkbpkrZF5dMNe+cDWIDMbBh6zKIOFtCEbBmQXJ5RtLX+h3odd/MWE0cGWpvs5T686cXoi/yRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UTqV0BAD; arc=fail smtp.client-ip=52.101.57.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UTqV0BAD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLHfUPo+ybPPVwsasDO2GPNW2TT83iqK+R1Z4Psn4q78v0NIhVzaV0Fim9zXHWy5jGS7apHGqCIMULXDz5xkdLajAVAoRjohiYOP1P+WX2Y8U4dolUz9Y0mNhRDMN/m1LnGZ13nRtUkg0YVj2XyhZoHutllLJ9UaDaDKo/IWsJAj5+2mvmdK3La/OyMSXE/xHXFEMrY5exnA1FMcyLYLIU6khtI4KwlQcghA/aJYVM2txWhpfbPlE0fmWN+plSec96z35aVp/sMA3W7lc7Lg6nosOLJ2mZmu3AtS9Oxgjx300hIWDf480VmMbt7g98YepY2wSiZVdAutSEiQ/jifUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPhNnpucCghuGreuEdIJrKIRqUXqjqhoi77LBieQRZw=;
 b=rJY2AkPNC2DuhVZHQRfY/Fs28PMkHI3l3tRe87FqexuLja6cY4DnPlPYDRknMVauF4jggY7TCCDPcy40w2CCEfgfnC3z3Q+uOAgIGvJI6TNtdExcOIgiZl2I28wB7cHbNsnkIgl53HEDKfl3O+pI5Vrpit1L0TN7Zs5U+jgVjozWN/de5T456RMY9bQBWRHUn1fqx0Gthpy1MqnTJKFtZoooHh8wnr0sXLrBtT98za7OgxsJo7GbTLT/cnbTVRK4C7x1bFMCdcMx0wz+TNXxPUJEKBuxDuzCDw9LLvKV0MT5i3gS9IC+ddirk9ZMU/4CGLBGE5iTDziUQtIYdb6Ntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPhNnpucCghuGreuEdIJrKIRqUXqjqhoi77LBieQRZw=;
 b=UTqV0BADvtVg7eA5fqebKf2avVGHetq5IbfA2VxUwsi9rmXv5mIgPEkuibBOtx93CZ9dnZ17B9ztO0ys36KsxgY8VC7WNPaf2aMzne7aPmkjjj+jl497EhmQl0ZtfSXmwT0vTm5J2uTX9/dkQPcAfUQ8A1RlNwzW0/y2Wi1NCfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS0PR12MB999312.namprd12.prod.outlook.com (2603:10b6:8:42c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 13:07:59 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 13:07:58 +0000
Message-ID: <82d72aff-a9b0-4a07-9a5a-8f591009e43e@amd.com>
Date: Mon, 31 Aug 2026 08:07:56 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Juan Martinez <juan.martinez@amd.com>, westeri@kernel.org,
 andreas.noever@gmail.com, YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
 Sanath.S@amd.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827215740.415496-1-juan.martinez@amd.com>
 <20260828051903.485922-1-juan.martinez@amd.com>
 <20260831111128.GH124825@black.igk.intel.com>
 <8e20e208-05a2-4ddf-9ff6-081ce33b5a42@amd.com>
 <20260831130638.GK124825@black.igk.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260831130638.GK124825@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0162.namprd13.prod.outlook.com
 (2603:10b6:806:28::17) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS0PR12MB999312:EE_
X-MS-Office365-Filtering-Correlation-Id: 651e0f83-6ac9-4b07-4e40-08df0760e137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ejm2F45BI4xjUwZmGt+xHb3P0rmUf3n31D0gguJONg4QaOx6yf0p6JEwzoeKt0yiDKsv7I59Apn2Agqj5Di1jCnoiqQPR71TLDMKTjRgLRNRLu//ed/mP+ij1BWoe6IDSPuhzWITHLv9DYW5ckyUPnpuW1Xo7DnqQgsr65Ur5tfo0hBo7A0cLrdb8GW4GZE4qK5c+gT77PSqAVGWOqJbfZ2A7YOOA6rbm4fI7bu4o11u/Z+7Rmnl6mIOxdj8NYFKBJ0H4TDfhZwfKSeyNYMzAQmDBO1tO8kFh9vA/bV8n+UBuiYXwIN/4PdrQjwTa5mzK9DJd5mjMpRB5ZsiEObbBUhRZe6+kMlYCgM7Ymr7i8YRqc2VedqC4geAIYTbkUQrf8BbIc9PytxTllIY82nc3ZqqrV3YJ3uXbqAtmgsvr75jG5sXldHIOokb/GVbmvgG+n1+79rS7i8COw6xgw38+xekEW2ljqRA1ulqwP4gqI1OCLf/mcdVlvvZ3WY9sA4m0efz9rwPb+C7+9/ZbLRvSEEEX9BR8FzKyKiiUyXX4JlY1I0KaVlAWBTI/Xm7uKmzmuOGb0HmpKeDoSOh5eV3rSqx6j5+wZtD8dcsFByao9kzC//aMzmLwTQ8t4U53jfsDTUgWUMi8nD/az70C1tDQ8W43ticVSNmCt4SAEIDbsQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE5yYmFvazJFWm5NZXYyZGQ5MnI3OGxsWHZxR2VpOU1hQktZRWwyWkpIdjl0?=
 =?utf-8?B?djhYdmNVenZzUHNMelQyVEtydm5NaHNtYmNSb0FzQTBid2k1L0xmTDlieUF2?=
 =?utf-8?B?RkNMdFpucnRPZUdTSEttNUt5azNKVlBlZzkva2JSR3VyUVBuUXpoM2hxcFBy?=
 =?utf-8?B?bmgvZ3V1ZmMvWFp4ZTBPWUpsT0U5ZGFVN2JTR3N6VllSdDBJbDdhTFI2b2tE?=
 =?utf-8?B?Uzd6cmZsNTFjSXkvMk1rdm1oS3BvU1VOTnd2S2ExUUJqMytzVktPT2ZoaFUr?=
 =?utf-8?B?c0pyTGdXbjh5THJWRGhWcGh2aitOOGtmTVRDOHY2MEQ1ajdwMlZFaTNOQzYz?=
 =?utf-8?B?aU5ESHR2NHhxR1c1SDYwYy9XSWZSNmh3SEJiVjVEUFFwbncxSDZIWEVzSUhu?=
 =?utf-8?B?YUpjc2R1MG5aZGFrT0I0a1o4REpqYW5BUllQaEFlOTBtLzhXZ0VqU2VlOVB6?=
 =?utf-8?B?dWdTRmVTQnpHTEhMaDVnc1A1aWh5bnBtR25TUWFvZ0REN0tYR3ZqeXVMVkFo?=
 =?utf-8?B?ZGFXYTNMTytuYVRrdlFBWWxISjdSdmtHT1VSVko1V1RSOW9IYTJhaXNBRVN6?=
 =?utf-8?B?dHJFcndxZlUxWG5FTHdGbHF2NjNNcGw4WTRsMEJ0WUVBY2NiREExRUh0dmVQ?=
 =?utf-8?B?RExBT3NYMk04VkppblRaZkpTU0lpZ2lLZjdTbmlqd1hkem1La1FlM0ZQN3RK?=
 =?utf-8?B?bDBIamJtZm5vT0hqTVlvMVRCNXhtQVl6WC8xbWxzbEhSbHRiLzlsSEVySkZT?=
 =?utf-8?B?ZGJLb0FNK09mUVA5ZCtSNDVwSDEzK0ttd05YaTRnS3U5Z1V2ejk4UVlnaWdK?=
 =?utf-8?B?S21vV216Z3RYbDlxdEVvNnkyZGNSaWJBRjFiREsrQkMrbzJ4VVVVUEdMSmRM?=
 =?utf-8?B?L0tKOHhlVUYwbnRzOTBWcHptR0NBWVJXeWZndXY5S3dSQjhPZ1REV2xHQzYz?=
 =?utf-8?B?a3ZURmRnc253NzRMcUJ6K1UzN0dqUTQ1OWN3QWJiU29pOEdFc2xybWo0WFdq?=
 =?utf-8?B?Z3NGeEZaUGpSMFhWSDZHcTB2UGZ0UzIwc2x3dEhYLzJHemNSU3d3aHBEWnJC?=
 =?utf-8?B?MDhSWWhxMzhheXVMelBKUWNWa3BTUTNuMVRybTd4V1NBYTdnUktHeUFyaFpQ?=
 =?utf-8?B?eVYvZjR0SXB6aXdXS0FBWFhZd21WRk16NW80S2dtclNpRm1QRG5Hd05lSE9p?=
 =?utf-8?B?RHB3a3B1T3NwM0t3ZEs5UWJKb244NWJjbHBLVUdKVHB0SEU3N0ZnVlplNVV4?=
 =?utf-8?B?dm1wQmovS1NOUXAwQ2pCWWpvTW8rcksvRFJ4a1paVExqT1IwczBMSW42ZVB0?=
 =?utf-8?B?bHdGSTRTc0VlSGljVWc3UFlBR010TXdtRU5MUzJobmRINHNSVVFnWUxDV3hK?=
 =?utf-8?B?QWxHZXZEYzZQa1ltVy9TQk9iWWdiTEFHbytXSjR0Wmc5bldZdzJFbEJKTTU3?=
 =?utf-8?B?QXloZ1ZyclJ0bFFVcDRocm4zckxiL2JndzJQYnBOL3hXcFk0TnBaNG5hcUVv?=
 =?utf-8?B?WXRoT0ZiamxwamZnVU9vZVFJSENtTStVcGNkVkorc0N2a0RsK01zamVJejN6?=
 =?utf-8?B?WWFkOEkyMEVYN2lzcm5oRFRqZnl4eTBUeEpINDhaaDZDem9RL3hIVjYyY05Y?=
 =?utf-8?B?M254Q093aFFTOU5NQXVhdG1KSmF2M1EvU2F4U1VTTWwyVTByZW5ITWZyMDBi?=
 =?utf-8?B?Z3pSbW80NFp4S1VoZkJNVktUWkpVLzl2MTlpYi9hcnAyemxaQndMVUY2d25X?=
 =?utf-8?B?MzJjZUdrRlFRc2ZsQUhXT1JLYkF0THRrS2oxUElmT0tEdHpnZzRLS3UwMmNa?=
 =?utf-8?B?dHVCSFRpakMyL3dMbm9wT0hkcDY5eC9obXhwaFFwakNwN2NKWUVyNUU0T3Zu?=
 =?utf-8?B?UUFLK0s3MThzV09uUmE3VzlMcGFxVkJYOE5DdzJySVRnMVphbGM3NVJrWUdE?=
 =?utf-8?B?eE5ORFNnSVozK055OERxMUtWM2gxdVNwT3M4NkVMSkd3TFg3YVJlVmNjSkp0?=
 =?utf-8?B?bThoT1pCQlRjRE4vVGhxWGxIRjRScXpsWVIxK0c5bDVPV1VyTEhCbmwvOFJO?=
 =?utf-8?B?aCs1WS9VYWR1Ny94ZjE0OHVOOVZGYVQ0eUJmSitCb0N6dHBnR25wMUJMclg4?=
 =?utf-8?B?YVdGWGU2QnJoSmpISXVwd1kwYWJEYmpHVkFpTEpBc3JlR1JKbGE2aTV5SjV0?=
 =?utf-8?B?STFvSFpZSEdaN0p3K3FsbHk2MGl6UnM5N0k1S3dPMnZHWTBhNzFDV0RnTUhG?=
 =?utf-8?B?OXZSWGxDVDlFSzNZd2pFa0xtUVI1MnFacXhWSWx6dWllemJKUFJuN1cxOWlM?=
 =?utf-8?Q?aVCrRaq3n+kWhzRglq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651e0f83-6ac9-4b07-4e40-08df0760e137
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 13:07:58.8544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vU6pdwTkLY9jOqwzuDZAkcVskvF1uZMTYJRfSaxO/yBRCvsuBWLMzqD3Z020SCn4My7tIPoqjmixZlBPBkavJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999312



On 8/31/26 08:06, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Aug 31, 2026 at 07:55:16AM -0500, Mario Limonciello wrote:
>>>> +static void tb_domain_reset_interface(struct tb *tb)
>>>> +{
>>>> +	guard(mutex)(&tb->lock);
>>>> +	__tb_domain_reset_interface_locked(tb);
>>>> +}
>>>> +
>>>>    /**
>>>>     * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
>>>>     * @tb: Domain disabling the DMA paths
>>>> @@ -835,7 +849,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>>>>    	if (ret)
>>>>    		return ret;
>>>> -	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
>>>> +	if (!xd->is_unplugged)
>>>
>>> If I read this right, if you unplug a tree (say a router and then after
>>> that router there is inter-domain link) with this check the reset does not
>>> happen and AMD system still hangs?
>>>
>>
>> It should be a different problem.  The quirk fixed a problem in the USB4
>> router (router wasn't functional when problem occurred).
>>
>> This fixes a deadlock in the kernel that system gets stuck while shutting
>> down.
> 
> Right, but now since this checks !xd->is_unplugged and only then does the
> reset, if you unplug the whole chain including the XDomain connection (i.e.
> the unplug happens say on host router downstream port) then we mark
> everything below that with is_unplugged=1 so now this function will skip
> the quirk and the DMA will get stuck, no?
> 
> Because..
> 
>>
>>>>    		tb_domain_reset_interface(tb);
>>>>    	return 0;
>>>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>>>> index b7cc6894a598..89dfb3381345 100644
>>>> --- a/drivers/thunderbolt/tb.c
>>>> +++ b/drivers/thunderbolt/tb.c
>>>> @@ -2489,6 +2489,7 @@ static void tb_handle_hotplug(struct work_struct *work)
>>>>    			tb_xdomain_remove(xd);
>>>>    			port->xdomain = NULL;
>>>>    			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
>>>> +			__tb_domain_reset_interface_locked(tb);
> 
> ... this is not called when the unplug happens elsewhere (like before the
> XDomain link).

Ah yeah.

Juan - take a closer look at this, I think you're gonna have to spin it 
again.
