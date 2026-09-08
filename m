Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010043.outbound.protection.outlook.com [40.93.198.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD199559C99
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881211; cv=fail; b=o2WnBQSzE2sUULvZjBW0BZOJ1jgpQKh6byN+RE5LqLZub62Cnp4zhSFu/mrZIubMa5zcyh/CqFzzVOT6QqFCpgoWZLVinps787IehChCtH8pQOUyvG1j88YD3cFbQbMviR8o7Vu2zLXsvrwf7GoYB++GP+0oenENAwS9BvI9gDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881211; c=relaxed/simple;
	bh=rRz+k8qOlZx6g+HcKE7VMZQXj259a2wBgMl1HVFWq2U=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=H8ZbFH6QOsHqdIlev6ZLk5x9K+H4fyum6DjdDhN+pjqyKuJDJM+QX4hGVMHTz45zcpLiPi1N15HJdpOERt4k5DXNHokJsGkb51wB3UuQ6X0OlB8AV8zH06fsoh5Qz1l1suMcGlRH6drFbM5VEiOII6Yb1wi+DTAi3Ca9MppXBrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I3eq4kSK; arc=fail smtp.client-ip=40.93.198.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I3eq4kSK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQTWCa5OLXDJLzMVQUt7qjJjMykEkhBkffhgEjQOVbfDxbNY6vkFZx8GxWbO5zLTZZLKpATziVZLBcjnwMFp5xqK1WTKSHLpHB3FCffOWqm2ltiWMpameG0WU+rgO5nvhrW4Fc96dQflCKuAzorBjSytIKSfRMOFrch1meII2K2x4aVpOgZtV5KFsgMGqbmznDYvMynlTqQnIqtDDP8S5u1TIcA37FVKumuIuJVqJwZcVHe4zjkzJeztTRqAJw7v3Tdjz6az0agMJqfJ2FYdlDnEkadS1zONyuLPYz+k7ZsE+kFyWO2XFNShTIxlwnq6FQim5ItAwM7DYGGTsF9gHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHEdA8P0yg8tiHrhLXuBJesT9FFMp+1krwG4gYhfeQ0=;
 b=MNNJAHIpO6deM+XPHxoXbJxiNQYXAxJdyxozbi6NUEjApcqDjChm9y0buOvGZjr14OTUXvjN65H0+Z8AnjkA/2T1dBQQukykTcQzX6cz46bgAs+uzPxXuIxBaCE78A++sSG/dIaugMUqwF0eK3IOhjkVXNqegboUNLWyXjjJKY54uK+PwwA2+lx+u59YBshExqkdAcoUGW9dNnY3kqieTWjPwL8HwITOrQ7T+Ie6XSxc9zfLPkOVSLo9dQ3hPWEjVZTVMA3DHuxlIj+qQKlqTPhKPwZI0NLuZkEhPR+CjzRLCIjkX40SHGjlyo0AaD9SL7KUPMdXSJvLMg34l+am7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHEdA8P0yg8tiHrhLXuBJesT9FFMp+1krwG4gYhfeQ0=;
 b=I3eq4kSKHSRp9NJd3SEG0f0lEizV+ZMwvJrnKWmIFtsUdRNRXUSkakyd482nZD4bpwubBxHx6kjteSt4W27Ixe+PmPM3KmxeHw+il6XGyc1cjvXXCMgqE05u1XAfbwNuiSu/YddOLz301FjwY5gpIQenN/6e4sV8L1cbqXnWEO6VvOqHS8UnmA0o/tu9oiZ1LBSJy1bCcirlFMtUvgMVnk8GGIThSErnxNjBYTmpp+PFTnvIlnID75oUY5VzVFORgN5GmrrHuXeMN4MVtGKZwHfcmSkywqLvkzCx+S4Y7Im2GTjBhiZvsZRVeV5b7BGz897dkK7z6cBH3ZFVODQJVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH8PR12MB7351.namprd12.prod.outlook.com (2603:10b6:510:215::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 15:26:39 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 15:26:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 11:26:36 -0400
Message-Id: <DLA1GKJG4RGP.3LKH58GGWE4N4@nvidia.com>
Subject: Re: [PATCH v2 2/8] mm/huge_memory: add a comment to the open-coded
 swap entry
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
To: "Tal Zussman" <tz2294@columbia.edu>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Chris Li" <chrisl@kernel.org>, "Kairui Song"
 <kasong@tencent.com>, "Kemeng Shi" <shikemeng@huaweicloud.com>, "Nhat Pham"
 <nphamcs@gmail.com>, "Baoquan He" <baoquan.he@linux.dev>, "Barry Song"
 <baohua@kernel.org>, "Youngjun Park" <youngjun.park@lge.com>, "David
 Hildenbrand" <david@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Lance Yang" <lance.yang@linux.dev>, "Usama
 Arif" <usama.arif@linux.dev>, "Kiryl Shutsemau" <kas@kernel.org>, "Lorenzo
 Stoakes" <ljs@kernel.org>, "Rik van Riel" <riel@surriel.com>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Harry Yoo" <harry@kernel.org>, "Jann Horn"
 <jannh@google.com>, "Johannes Weiner" <hannes@cmpxchg.org>, "Yosry Ahmed"
 <yosry@kernel.org>, "Chengming Zhou" <chengming.zhou@linux.dev>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
 <20260908-folio_swap_entry-v2-2-ee6d01dfa5e1@columbia.edu>
In-Reply-To: <20260908-folio_swap_entry-v2-2-ee6d01dfa5e1@columbia.edu>
X-ClientProxiedBy: YQZPR01CA0189.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::12) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH8PR12MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b9993f-6aa9-41dc-3e19-08df0dbd9392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|921020|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/RmJG3mWeAb6ksiKtuITRIQeIhUGs5zJcoRy5UH9QJjT3KWm8AwoSGS+iZaUrod8lgJzclKH/qbbQX98ZDn6hzu0werEeIBh6oW9W/lw6KPQPB0LqgtMZymUUwJw+50D2uYCjUpNrnAY6gK7Jq5rh5lvP3lyopbR0zprqSA/oWgHRxtmhQs/3E65TgXBvdYScfmBakq5meDn4d/37IYKysq6IXQC8hPY2c930SfUEgNLvZP552xZ/AT/Hu5aTh1c+Yp/VywR1bX/u7XDm/8TRYzpU/UDBF127RxLe5FY6i9Lsrswb64UrhPWdUwMj0koJ4QF2Sr0LZFUku6SbkWvyM7nBco0ugLAw5Ou/jmTw9m2DuiwQIaYUl3Kzb7Fhgvb+vvsn6cL19nQDjp3DGZDg2rpiDSolavKchGtKYtTHr2RabBB9jow9Jc0IgVxCEnSxa6dYurDQEmKjEesWXAIHDlVcdB931SU9lNPCH2JaIG2ELzxwGmu/p+JsxzpD/6yzm5+ycc6tb2sGpYtwIHonr8DNyenkqDVQ56Sjsmxb3vF5szfpfNyuRdSdDx/4hQS0bsuRnwoSeYqo8TXias0ecHKVN0Jf2Mrp/v6IR0mIoLQvyf1OuhP2dYN0TObrAyFSgsirKglFlPRAxeVcNuOh0ELHcw7hCQ8DLzdrwAEIIRSBaRxPPDjQWXVY5sGKyJsxJZHi3LhJeh+/JeYujkarw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym02dVNSSWFsQzJlQmo5ZVFzb2kwVndtU1VmUVJ5TGlKMlZOQmV0TlBGQldm?=
 =?utf-8?B?dnJZQXBZSzBSMW1LdGlleFVHbGlUQmdSd0xRVk4wT09ueXNIQUlIbndJM2cv?=
 =?utf-8?B?azFEYlRZY3pUYmN6dUVoQkZXMW11NFFLNEIyYXRJODZBOWp5Q3pUWStraFdl?=
 =?utf-8?B?ZHhpemhRNWowRi9rY21QZldmeDdKS3JBaHVGSSszWXpRMlBMQ2V4T0pBOStz?=
 =?utf-8?B?b0NRcFhkb1RHQkNHa2thWVVJandWUXRWUXRmWXhkeEZ0MFZ2cUMyK1kwUSt3?=
 =?utf-8?B?ek5iZ1BJQ0ZKaHZuelpmcFhYWVlvL0F5bVdzdkZhS1NrWkUzM1hmZ2ZhREor?=
 =?utf-8?B?MENWaXd6SGswVGNHdG9RUVdaaVNrNTY2aHFDZ3BHd0V3RmM4Y3FndmlVT01L?=
 =?utf-8?B?UGFmZ3ZseTdwanNZbmdDOVRwYVdzQi9OcVgxQndMdHRWSEo3RzFxU0hkYitp?=
 =?utf-8?B?ODNZSTlwWWlxcHQvL0ZxNVRmL0EwMWN3b2dsdVRJNThGbDV2a0RvM2VCcW8w?=
 =?utf-8?B?bmphYkduVW4yemhZemdvbktadmw2K1RYYVVYZjVtdmNNbXBHUEhHOElzb3hN?=
 =?utf-8?B?WUoxb2xyeUhkVzRPTER2Um1BSmFQRkZpZDI1Wk5nNmRGaC9SR3NjTE5HYitI?=
 =?utf-8?B?RmpyeUZxZ1h5WTZEOVJCQk9zWHhRSHhWc1pOQmNlMW13UlRaTS94QmVISEdX?=
 =?utf-8?B?cmFhSm9KTUZQbnhGTE1VZWJIUFltdjZrdmNFZm4zOTIvUEwxTFlWb1JUUFRm?=
 =?utf-8?B?bWFOWVNLaFFBam9DNGRJcU5BaU92dDFNVHVEK2RxM3J0WWp3TWR4dyt0cklR?=
 =?utf-8?B?Y2hINGpOdUg1VXVheG1DNVZJZXNhUEZveHhyUnlnMm1WNHZFTlNERzUyenQy?=
 =?utf-8?B?RFlXMXBUcE1xbitmR0prRHRySm81M3lncjZpVFY5WHRJbFh4YUhGNkhZK25X?=
 =?utf-8?B?NVhTOXhGTGo1Mk5vaTZMY09vYjBYc3ZBRklKNVZwL2YwSTRUaGxHTHFaSy9Y?=
 =?utf-8?B?WXZpcHV1UHU0ZHk5bWl3T1V1YlpobUViU3NrckNSREJCT2huTTd6TFRhak9h?=
 =?utf-8?B?M1BOcUg4OWJCYUNXUnc0UTh2MGtzL3hLd1FMQ0dqYnhyRUpMQ3BxaURIVUJL?=
 =?utf-8?B?SHlZVlBySlU5c2srZTNhNko5SFYxQVhOMjQxSG5kam94Tnhwbm44dWhDWW5o?=
 =?utf-8?B?cGlkNG9VT1lib29ab0dDQU91SmNBMVF4amxESC9mS0xLZk9URCs5Zys4SUhW?=
 =?utf-8?B?d2FzQi9LRXNCdWJzcUR6QTRHU1RoWGRIbzdpWVBZZnBNbXlGRW9KdWdKMWs5?=
 =?utf-8?B?Nlk1dWQ0cmt4bEFaY2tqYlJGMmZFSmswcGRaWlMxbU1iMWJtQmlYZUZrV0NS?=
 =?utf-8?B?bjlsOURxR08zdXlyeVY4OTBjc1lLWDN0OGc4SENGTDl5WjhsbjF5SEZINFBN?=
 =?utf-8?B?bWNycEFPSmFDREhLdklpeUYraWpZYVE5SnpubGo4VGo0Z2ZFUnVWbE5LM2sr?=
 =?utf-8?B?eTByQmcyVlVFMXdReGZsMzU3aXFQZ2NoMkgvSkRsejdJNmxzNDdsZ1M1bU11?=
 =?utf-8?B?eDNMODhQTExrUFlpS003MUVndU5IczA1RnQ0ejBEVllqQVBkbXU5blpKQ0tt?=
 =?utf-8?B?MDdkTnZ6aDB4VmRqWjZWNk11aS9VSGxhejJFNEZabUg1T203dHNCVTNDcEds?=
 =?utf-8?B?d21HQjlTSzllL2xiS05kYXFYanhGb1FZQ1BneXdValRwUzN2R3JDRGM0eXlv?=
 =?utf-8?B?VzlFMGlHclhCY3ZBNDVUNmhTQjZYcFREWnljSU5aQkR5SXl6WXRyL2NYRUNr?=
 =?utf-8?B?VG8xUlkvWnc5ZHIyeXp6dnlDYkppbzBOeUNWVXcxVDZsN1VXeUp6aUVWa3hs?=
 =?utf-8?B?dFR2NWQ2VTQrRlErUzBSYTgxaWEvS3lScE1iVVRsSjZUVUQ0WkR5emNrYWxu?=
 =?utf-8?B?SnBkU2FrWTlPbWYvSDAxTjBIZGFMRkp6Q21ZQVBpTW5Ec2RQYkpoaXJTQ2tz?=
 =?utf-8?B?N05EVXlTQzdpTm1OS1BGK0VaWktvZnJML1JWeEF0eG9MTlQ5dUVVeVJ0RzFz?=
 =?utf-8?B?Q1IyQ3A2Z012TlBEWTY3VWRoMnlOWlh4WUdBKys4ZWVHTG5xWk1FYm8wTFBN?=
 =?utf-8?B?NlBrZzB4Sm81NzRNejY0dmdhdmw1YzVLbDNockx1dzZmTzE5WjZKYmlybUoz?=
 =?utf-8?B?TkRtck9zQks1Undzd1ZnUlZpeVhScktBcW12OTFORW84RjR0ZlVGMXo5R1JB?=
 =?utf-8?B?WHBTTTRYRVdvaVJXWnpHR0N3TENJdytocjJTYlJRMmxQZFR5Rkw2Vy9EZWZD?=
 =?utf-8?Q?u1SmP+afSSt+N/N5Rl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b9993f-6aa9-41dc-3e19-08df0dbd9392
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 15:26:38.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tExtuLINP86N8JgbkBWglHM6o0VckITIfs5XMu7njwlQ+tzAU9B8bbkOf2dkydf1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7351

On Tue Sep 8, 2026 at 11:16 AM EDT, Tal Zussman wrote:
> The swap entry of each new folio in __split_folio_to_order() is
> computed by hand from folio->swap rather than with folio_swap_entry(),
> because the folio's page count is not valid while it is being split.
> Add a comment explaining this.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  mm/huge_memory.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index d1ce061601bc..1fabdcbd8c8f 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3763,6 +3763,10 @@ static void __split_folio_to_order(struct folio *f=
olio, int old_order,
>  		 */
>  		VM_WARN_ON_ONCE_PAGE(new_folio->private, new_head);
> =20
> +		/*
> +		 * Not all folio fields are valid during a split, so open-code
> +		 * the swap entry rather than using folio_swap_entry().
> +		 */
>  		if (folio_test_swapcache(folio))
>  			new_folio->swap.val =3D folio->swap.val + i;
> =20

LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>



--=20
Best Regards,
Yan, Zi

