Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8722E3D7D97
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791632570; cv=fail; b=BgpmFqplkodxnjk0BXCGyJNxVQkriWcumm084tGkJ6LprJA0Iqa+t+fk/dhEhS580XF2ZRGTSsNwJrFe77wuHPsYw4egcIfwcnMv0JHGxcy15/DJxB300foWY/+LrIiBoCcVBMa5EdmI91xT0McznGRZYlZeWUmRGe9P4uzRnfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791632570; c=relaxed/simple;
	bh=UxFMJSZyafFsnVVHgfGELYC8Dp1dJDXLOM/0uZ3sUbU=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=Ud6DECLPeJTIFvLiskMZxfBbFHH/10B+Kp2eJTc4s8VDieiMqnUZ2N3N9qou9mQKPNPmL5GqPPJq/TNemNsiGKZ/5RPNu3N1jw1k679xsxq6xoL5SZi02bNHlBeaaj+Gv+A5it9qPyaolGBWqJXBAUXwO4oJKdY4OWFNMEFtmIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mcxMYRlz; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mcxMYRlz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOkye1WUB93+EE6a10Yngq5gd9GyUizqVUB1/iMGGdNbNEeg+3uNT1S20z2EUAqXuI3VHTzm1lcZc343YTeo+kI5d7/Qw+B1xet2f16GcYE+4g477JMr8GdSKH7+51sg40h3CVtoU/B2RcFqY3ev5UQR5teNc7aPBfkVK1YOiym5KIJhtJwdegGHIlyVqzlKf7bLKEp9TCXbb/KKZS6YPMveOyAml2AnsJWp6T72/gSZj+0UyXSL8/mqaLrgxeuHqpCqjEmUzW2yC5ZZNpde/CA8h35IRJjWFVP69ZiopidOz7iLi/sqUHS2y4fBBNBejExpwRBRlrlJr3S4i3e9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nh/PAHfxR/GvQWLJ/pVoTUg2zTtjWzLMCD9z3+JADE=;
 b=j/M76wSN0WbJk0xf+rC4jzr93fZ0oTwRWEbHTApRcLwhRdhnyc99kjzkwHmgXf0h20Jj8GuugXPDFTgY1ZbMHDp52zZAh9nTyeU1sksku++O0bV/1n4jsZB4SF4ei9qWDQwptZDVzSA/QyWQFNCLAXnmvawy3p+Jwk9YuTIc+THO+s7ifVFVB8PXeJKWfFFk28FJNlhFSpOzIAVvRc3/H7Rp2tz2b7HZgENopVTraGNsNZ7x0P1lUa8eNNyDH8QI6kfpc39/2A/vjSH/YuGNQrnxAjvPxTbiX4ds/f8y657ukjRRlVfpgFW/uRrjpKsnMHuC5mzYC5FbXWkpuDVoBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nh/PAHfxR/GvQWLJ/pVoTUg2zTtjWzLMCD9z3+JADE=;
 b=mcxMYRlzt6VRc4/7zPmpiD+Du3LehbfkTPDm2ynu61VtoGNp4N9X4ZuaKij1ekPwM0frokTehLe0NCkEX9wSzkJQ/+Au07JmmOreJG4cImrr2pCU0yBTHXMw4V5725V+C5aYud9lob4+DqAzR4riwwNCRxpelY9Ch3pBgh10+x4TgTHe8thYnOOu3+YubqvIQVIM59gxBi7xvHalvKVT2Sgep48mT/6Gtz2scmdO3jMB9rUXTWp2+UADaL56OnaWVTXp0HLB/s+g3185Qid4rEJzaEGsZcvKBywTRjqNpnL9DKHSQhf3+1A14QfBduxjD7M0sRQHuPXm/E/PrGjylg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Sat, 10 Oct
 2026 11:42:44 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Sat, 10 Oct 2026
 11:42:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Oct 2026 07:42:42 -0400
Message-Id: <DM14QKTSWM6K.YSJFASLMY53E@nvidia.com>
Cc: <surenb@google.com>, <mhocko@suse.com>, <brendan.jackman@linux.dev>,
 <hannes@cmpxchg.org>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
To: "Kanishka Solanki" <kanishkasolanki456s@gmail.com>,
 <akpm@linux-foundation.org>, <vbabka@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH] mm/page_owner: make page_owner stack depth runtime
 configurable
X-Mailer: aerc 0.22.0
References: <20261010093843.103169-1-kanishkasolanki456s@gmail.com>
In-Reply-To: <20261010093843.103169-1-kanishkasolanki456s@gmail.com>
X-ClientProxiedBy: YQBPR01CA0160.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::29) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH0PR12MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac95a5f-3ce6-48a1-4b6e-08df26c3992d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|6133799003|10067099003|11063799006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	sbU56mNp9eVg1YusxIXbQniHVzecvAmDnnZrzuaFPv/dsg0x2jhm9tAq66wgc6bULQ47d5zdc7xtk4t9nnjMLRBYyHBb/W91cdi7552z5GyltOFtPf1rthKQOQ5QaMakwp0X8A64Z9rJaEAHMEJhhC8/CqLJJhYswici5rclgxeI4nrsDH+NbYHqIYL0n5tDueV8LC1Y11Q6XNoGMvbb7GfVyovh0hSyMmjhqiJFg1rJpdbydz892sv6Ji4bGvm0akgUK+t9BTet5ZGELaGKIHKnu7L3YIsHppr+X4uRsQrXPGbaJEd7F6Cg70DynxOzE7h1hBH0TXjeoil4k+wQF7od7viwbefeUo6ZOeAjyHQOtUdVQNGdwq3sE3XXSZ6idX8QmAdYdPG2vw6fiHpUEnr9TiPKQsEgojX/lRSCqa0shVsQP5UgfyP8qar+fQMCXDmL1NJeg90HXCQLZTWfsd1BWPhS9F45Oj+mDb5beYRHiKMR3g+FqD4zrw0pnoXnw6HGVNwiWVPp2Tas2aGL/iL3uYJVrDO+Y3DeY0FtyO4RdrarvGQWzrVpNUw2SY10/FkJT92/VfoAr5BoulJ/pIeRlT2OGA2TDxCHUaf1O3XX04yE7aSXp1I2peZZwfl4tTOec17boUQV/m2gfvXkqCrszy25E2BrvMT89wYB6Lo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003)(11063799006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkdWMWUxczFFWGRSeUlzWUxyQms2bUdLZ041dnM5ejhBL3dPTTREaS93dWl5?=
 =?utf-8?B?T0lOcEhCdUxDOHRXWmpKSGVhc2xzZEl6a1k1cHpaRW1nSUpQSmNUNXZocWE1?=
 =?utf-8?B?RzViNVMxb2JyYUFvRFdaVUNYbTB5aVBUclRpMktEdExFWklrbWFwc2p1SFB3?=
 =?utf-8?B?TzJDbk1TWG14Q2Zvdmt6TjNPSzl2TUkrc0JiUEE5eDRWTEhWVkpDTUVDVWsz?=
 =?utf-8?B?QU84b1dlekZqUUgvQUdHWkt6WG1yNzk5ZE8xa2dUdXFrZjk5ZlZlWi9ZNnRt?=
 =?utf-8?B?cjhDOWZSYWJQZHZyWW0vY0VQQ1Vic2RVeXRRYk9mT1VsSlF4dEsxWmFjaXpK?=
 =?utf-8?B?QWNzcmJlVzY4MWhmdDQra3QrRjNRcUhkZTNvMXZjY2lsbE9xeXQxNjBDVWJk?=
 =?utf-8?B?NWNwcitWbzBHTDBIaUVhV0tkMmxub1p3YlRMeHFzSzNLdGRaZ1J0ZzRWeWtB?=
 =?utf-8?B?SEFEMEN5QWhpL2hXVm1OM05SUEF0bXlzZzg1SUEvenNnUU5DQnMwQWViYnlN?=
 =?utf-8?B?SjB2dHM5WEJlQW9ZakFQSjBHLy9jQ3llM0tIVk0vOHdoRlArMENWSGd5V1Vv?=
 =?utf-8?B?RTJWQU1HSGwyUnZQMXRQYndENnFLT3E0Z1hLaE5nZmh6Wnk1UG1mMjhkcE1C?=
 =?utf-8?B?d1lCQTFPOFk2OXI0d1dlZE4zU1JXUGJlUnFXUk9sVHV6a3VYeDNqdjdOOG1F?=
 =?utf-8?B?a2JYVmZmeVk4c0J4RUJZdFpNK3hHbnhLODNNeW5tMDAvZkkvc2l2aDVTVkxl?=
 =?utf-8?B?RXNKU2RkQStkcUs2SzdVNGlsTlFaK2RCUWJ5REZJbE5VY0JlZEg4QTNmK2t6?=
 =?utf-8?B?cGxEek1OQ3Zjdm85K1lTcHBWaWR1R3RTMEkrQ1JkWlZReTJxWXRHV1FMdjRF?=
 =?utf-8?B?YUJOR2JuU05yeFFwcDVDbXcxN1VLK29NWFBQMks4MW5rKzNscnQ4Unppby9n?=
 =?utf-8?B?UWNoRDdKTko0R2dUN1NRQUFWV0tRMllkNnFvNmswdlVFL2RUY2xPb1BJajNx?=
 =?utf-8?B?cDdXTUJSS2VyRXhKYjJ6Mll3SDJVUTJhRVRSV3h5dmxBWExxbThURnhZSFRU?=
 =?utf-8?B?aGpzVTlycEFpU1g5LzExdnpFQUtScTlJakpvbWVMd2RUS1hLdDFNcTY3VXdm?=
 =?utf-8?B?QjdESDhhUXFnRkhncWtQaG9lR2d5d3JUeGFJbGlTWldoVUtaK3F6NG8zU0xR?=
 =?utf-8?B?UDUvQURwSDA5RGdxTndad1pnVUkrWC96NTJoNjVZS2diTGkxeU8xQXpXWDQ2?=
 =?utf-8?B?L1F1NEtIK0k0dGlndkpDNVRVM25oeUVjK0NWOTlLbVRKWkhGTWovUit6K2Q0?=
 =?utf-8?B?ZCs4eTN4UW9tdVFPMnFmTm01RG9YRTVrekRsWjBndS9MM3RDeWlvaEJTL096?=
 =?utf-8?B?MlpOUVNUaDZGd2ZFRTFaNUxBanRTaWEvMVYxKzV1RGJHMFFDVnZxN1FBblVn?=
 =?utf-8?B?d1l1NVZmQ1pLMTBNek9ZSGZCVklXTjRiS1BZRjBFR1IrNlJsWkcyemFmY0Ux?=
 =?utf-8?B?OFVsWHp4a0hHMzFKQWxCc2xhbXJkSnZFUU5XQ3NlV0pURndWRm0vVXpsNmZy?=
 =?utf-8?B?U0NpR0I1dXU2RXhyVlJvY0tPOFpZSFppN3puVU5nWFd3UkUvSEY2ckFpQjdB?=
 =?utf-8?B?aEVrOWIxZ0NybjI3d09tQXhaSHlnUVZaaVQvaU03REo1ekErUWN5OXBGNVl3?=
 =?utf-8?B?a0ZvanF4TUw4Q3Qxd2ZVYzd0SEtwRVdzVTJRR1lnMms2V1pHU25ZUnFyKytU?=
 =?utf-8?B?aUtWQ2E2VHNza0hwalhHYlp2V212eWV1T1pEOUJwakFmdkpJQmlnaW5WQy9m?=
 =?utf-8?B?QUthYkFnVlJYOEpwamVTekJYdVFld0lUejRPUmdTc3NEOUhrNkFkY2NEYTF4?=
 =?utf-8?B?RG1LNVBjUk9EdGRJa1FzNTBSbnNSK3NrN2hGSzEvbGh3WmJxNy9YejdVOWE0?=
 =?utf-8?B?RXFYS0RzbWpFczZiZXJNQUtQcVJzdDZFVWd0RU5qY0U3MmtMbWN4bW9tMEdL?=
 =?utf-8?B?ejhGa1dVR1lkRmtkNWJrb2hrQ2RBbzB6U0M2NTV4WW5ONFkzK2xoVkFiTU82?=
 =?utf-8?B?SENmRVBmaEgwYTFpUWUvUTVWUncrQlB6UUk4WUtDQ21uMWdKNm0vOUhtQUl5?=
 =?utf-8?B?Yyt2TjFXOTBTa1hIWGZBM1RIalBMRkN0RzdEM0liWGZ2am1HQmNVTnM5VXk4?=
 =?utf-8?B?OHE3eXVMdDg4N2d0b3g0V1NRWDRmVEZmUDM0d2FyTDN6dkpSSFY4QThwYzl4?=
 =?utf-8?B?QitIdG9aL05QNE01UFdNRUluTCtRc3BwMnZ0OHZtYm5zQ2Q1UGQrbnlxcXBh?=
 =?utf-8?Q?49DOUZLfXxMyPkMS+I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac95a5f-3ce6-48a1-4b6e-08df26c3992d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 11:42:44.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5ttQY8/kxvczv9RLvuwA95UfswxRayWcfOhOGEtgJ5yTAijyyQyqFdDIC9BkVDR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7957

On Sat Oct 10, 2026 at 5:38 AM EDT, Kanishka Solanki wrote:
> The stack depth for page_owner allocations was previously fixed at
> PAGE_OWNER_STACK_DEPTH (16).
>
> Replace the fixed stack depth constant with a compile-time max ceiling
> (PAGE_OWNER_STACK_DEPTH_MAX =3D 64) and expose a module parameter
> 'stack_depth' via module_param_named. This allows users to configure
> the stack recording depth between 1 and 64 at boot or runtime via sysfs,
> while preventing unbounded stack usage.

What is your motivation? If you see page owner stack gets cutoff due to
insufficient depth, explain your use cases first.

>
> Signed-off-by: Kanishka <kanishkasolanki456s@gmail.com>
> Signed-off-by: Kanishka Solanki <kanishkasolanki456s@gmail.com>
> ---
>  mm/page_owner.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/mm/page_owner.c b/mm/page_owner.c
> index fbbda7ba914b..fcb584070f1d 100644
> --- a/mm/page_owner.c
> +++ b/mm/page_owner.c
> @@ -15,11 +15,10 @@
> =20
>  #include "page_alloc.h"
> =20
> -/*
> - * TODO: teach PAGE_OWNER_STACK_DEPTH (__dump_page_owner and save_stack)
> - * to use off stack temporal storage
> - */
> -#define PAGE_OWNER_STACK_DEPTH (16)
> +#define PAGE_OWNER_STACK_DEPTH_MAX (64)

This uses more stack. Do not do this.

> +
> +static unsigned int page_owner_stack_depth =3D 16;
> +module_param_named(stack_depth, page_owner_stack_depth, uint, 0644);
> =20
>  struct page_owner {
>  	unsigned short order;
> @@ -172,15 +171,17 @@ static inline struct page_owner *get_page_owner(str=
uct page_ext *page_ext)
> =20
>  static noinline depot_stack_handle_t save_stack(gfp_t flags)
>  {
> -	unsigned long entries[PAGE_OWNER_STACK_DEPTH];
> +	unsigned long entries[PAGE_OWNER_STACK_DEPTH_MAX];
>  	depot_stack_handle_t handle;
>  	unsigned int nr_entries;
> +	unsigned int max_entries;
> =20
>  	if (current->in_page_owner)
>  		return dummy_handle;
> =20
>  	set_current_in_page_owner();
> -	nr_entries =3D stack_trace_save(entries, ARRAY_SIZE(entries), 2);
> +	max_entries =3D min_t(unsigned int, page_owner_stack_depth, ARRAY_SIZE(=
entries));
> +	nr_entries =3D stack_trace_save(entries, max_entries, 2);
>  	handle =3D stack_depot_save(entries, nr_entries, flags);
>  	if (!handle)
>  		handle =3D failure_handle;




--=20
Best Regards,
Yan, Zi

