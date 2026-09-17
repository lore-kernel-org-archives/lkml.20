Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010019.outbound.protection.outlook.com [52.101.85.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF42B22538F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603478; cv=fail; b=KH9WF1JK2X8opjLLjp/UgvTU3x+uISFhgRuWFUzIVLACrU4QKGXj3LtP0u33jNO14R3Xizj27gO/sxBBEvkENaqjC6tjDzjg821UI8ZtgBujNPgj4iZqCLj7IinAkYVopHhcrSQAUsIdl3WnCqM1h3BfR4bilk2YLZN0xIimDew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603478; c=relaxed/simple;
	bh=79jP3qHL5c21qQrVxzs8elBQgEuHTa7d6tUpX33PmfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tQ5HYREZB7ehMH404viTkYyaDEyPwO7lqIOCkD8oWMgfO9L/SupKiYRnhAXutlYqBJcr1LjmdVxyz4IxVtMaACh+HrVNWYBg11pztNXSFWNgH1XaAJM+Cbc17gaOuvB+5SklQVnOF5bIsrBmWuC6FowH8SRo9KvNgiQNqioZmJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TVPJjoRv; arc=fail smtp.client-ip=52.101.85.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TVPJjoRv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyCRAS3TwponeEAAV5ejdFobtpCW4ahMG+TDymIH4Fx/T+3JJxXDdkihy9xWJ1eU1ECxq8v+OnVnSs5dAuook0ZInKIu2A558hcwd1OVwv7E/G9AKdO5W5IlBpveYsUp6/Oh21KJ8oN1XnMYZqsFS/3AnLXls3O4pq3WdFsYcRpyLhdfCXWNdO2dzmZgPycg9GnH3MQwfI6Ifr/v/tzJMQFamAOMTyJpbYLGj4xXpjz89es/X0zg09cehyvEjCkqBk7EGuFh7cfbaaKAxB7O/IoP1x+cjQhosBtSstx9BMbSsdGwgJ4mpXAjPm8Wy8hHE+BM1pzgaEQdXPWN+etjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7gMYegBr7vI8VLcT1nCM8bACoP/SuzymORz4UyZb2E=;
 b=nKWD8yZOIS61s7+XAPWulaV7+cmMSbUwBNlzubwkRJZ3meFJpx/hSMqOGBWzZLe/HQVEc1Uco9zr5y0m2HoUuqb8XPUDwizhUqojrxWmztLMQvqZ4FcmyL7ImlLgbGJAHT85EgRmpSm+dBkoYYjvTrKtY9CpWDolt4/M3kPdGXRqkwmPZ0+xXq77ZP+aZe5/HxLgoqHbQN1ZgnC1OlksyVWPOE4g6D+Ty3xqVtClXN0zmrgI2JTKrFhrIZifJFvEQpNjDlA18W1fPLlSGH1eQIzrmOWuJii8JlyCmA6mrYDJe/Zu2+OY1vpyhgSnzRvkumLDBAm/vxPnnaOm//uOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7gMYegBr7vI8VLcT1nCM8bACoP/SuzymORz4UyZb2E=;
 b=TVPJjoRva8C+0euPHJFikNYyi23oDx1RN5keTYIxbnDUdWtQfYGvJzBJWXvQHDmXd2kqWmhHvtrD79HLF33s4MB88O8VB9dstRE9yBgPF5SIzStFEHWf5IeY0ydjlwVVxtPHZWTFeNwzpVB/edbwtob/SMiAsTpLzWauO09EhGdhXWjoZZrAsq2t276eSzU1Z5e0MJR9Ef1R5/caaagIl3/eX82OYjRRws7ir7rlwK63lecI/zTlRFVtqCHut/lW2QpEg9h00bygQCeuY2bcndSe6gx/B+atP+vBk7m+wOl99uauJUnNk0kRY5vrIg7LY3gi6QQgYXt6Xem+WhzCYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22)
 by PH7PR12MB7186.namprd12.prod.outlook.com (2603:10b6:510:202::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 00:04:28 +0000
Received: from MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28]) by MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28%4]) with mapi id 15.21.0428.008; Thu, 17 Sep 2026
 00:04:28 +0000
Date: Thu, 17 Sep 2026 10:04:23 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, 
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/hmm/test: Reject overflowing page counts
Message-ID: <aqsrSk9wUaKY7QQw@nvdebian.thelocal>
References: <6f0d39089e938d4f53dc72632eb84aca34de7015.1789457465.git.error27@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f0d39089e938d4f53dc72632eb84aca34de7015.1789457465.git.error27@gmail.com>
X-ClientProxiedBy: SY5P282CA0147.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::6) To MN0PR12MB5977.namprd12.prod.outlook.com
 (2603:10b6:208:37c::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5977:EE_|PH7PR12MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: ae526861-43d3-4dee-f895-08df144f3dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|56012099006|6133799003|5023799004|11063799006|22082099003|20052099010|10067099003;
X-Microsoft-Antispam-Message-Info:
	1dZDroxz0l6mTNDQpzeb86YiXdBlyjctjATTPEpNwi0HiQ3U9pqGtJ6bx0iwfYPyBD65VlLqqRsFzCbpzkJ76ttJiad6zOJD0LeiWa+Hwys3Z1Ut76W6hxtUWhrkAZ4Is4toPxXx1iakDAkvz+OyvAddSjQKlUhTFPCivRLEppip+JnWmuQarvRgljedAsfjUfb4WQWGK6nyvkT9O8+KbMdMI5hWz88Wi2L5eVGr7h9nHKQj7oNwBQ096yoAuFUFCFg52JsGtWhb4cznqvjjw7mdwJLFCSM1mPFa9jSYho/vdSqiXw2PD5odJRIM87ZOc4CaSYJyTxR4Qa9MIdMfP0tlyaJjD164h1rCDgvmICmF/WuERABU/InmbJdhfsYVaZJF8hgVRdlINTT6BZmVyWmT21aposK7+pB//uSMz292vx1gjAY2Dp5PN30aMQq9wokkb30eI/TdzTuQsgBp4KMhBljuFsAOD0RHCQjC2z8MNX13NgYjbmjruPVYsPjwvNb9GtywR6MZvWu20z1MfmWhOmdnrLzoCesRceB5BZhtgAc1vnthvr23tKOZh5GujXc3c33GTJFrNWTEK/tiLYDdDhxNNAt/jTIifELdGs8qGXk4uI9GRKjGatE4PBMcEWzbuckR8H4lzwNdZ+mQC33rfIEQh5wPhxclqb3WvzA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5977.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(56012099006)(6133799003)(5023799004)(11063799006)(22082099003)(20052099010)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WidvSHUeHJW9TIiB8CXU6uw6nfEHMzoLZvgExn+ALCdN6gecAhn2TDwglTJo?=
 =?us-ascii?Q?eVnN+gYO8rcpjRqYDOB+xTIaDZtOFnc/p4W3sqKcwZA0PchKiev29QrpMVDI?=
 =?us-ascii?Q?aYiKgjKB1GdBkX9QufdShFGIcKoEfDkgwO0gPBrMv28gs8a6iIxG3e9dhoqD?=
 =?us-ascii?Q?03b5FO7PR6DM4kL+hoH1DSUGy6kcXkjnEeyvyo/ygy48ECsx30wacSossv2x?=
 =?us-ascii?Q?Y+kJV0olezK+jdNAY6Zfil1j4QM89e+WPP1wWFOQO3BDbCe2mGVuVXaxxwkh?=
 =?us-ascii?Q?Z42LITLicdbS620XNADL+8TtvXfaaBxZsfIXNYFLJSL/0ZtJ6unc4NYBCP3l?=
 =?us-ascii?Q?8fwBdcEb1ufzuJNUI68RSi8Jpc+2XWLxnceEkbgiIKCpaLKhK1glYI601o06?=
 =?us-ascii?Q?ZO8HSMPjKdVcFljM4A42hu7npRH3IgKlIac5K2KlHtlG5HSuK3dDNXmwKUI4?=
 =?us-ascii?Q?r/434i7ItA4labip/zWVgZRRRuOeCKpUXxeXKGLMxEVEcblz62moyyL6falx?=
 =?us-ascii?Q?n1AM54I6LJK1vikM0sGfG6JO4GpmUuXDWgPEb0DUDjMri54TN6y44d/J5B2z?=
 =?us-ascii?Q?BIPCiVNMQfzzYnp4tGm1CT0P1/A1nFv/nwW5xC7i/ZkXr9SErgLowGNfNm9v?=
 =?us-ascii?Q?PcYaXZX5K6y2Z6JrKjeImHH1JA6qinlmMn3YwchHZRLmxytZj/L98P9irtDQ?=
 =?us-ascii?Q?bSDFr14sryWs/qN3Bsezc6o+mv9GWia+IUHzjm/9SRNKbJi7dY02CmaMTAcY?=
 =?us-ascii?Q?kQU5paM1DJYHlS6cvYO2ZrsEQOeWwIa0qrkEDQ8nYXVIkFiO6g6CiSG86Mww?=
 =?us-ascii?Q?5sdkxxX3VG+VbikpV3WQSzoxb24bmR2BTzSuolJxoR7sS3mTRkatplxVJZOn?=
 =?us-ascii?Q?qtxyg/flyvsBiTDA5P7Q+SmXb/Gyg7/NdD4BPCSYwEYUe7UbUDwkpq35NXm0?=
 =?us-ascii?Q?CwyNPTF+cPCxnyebYQzdsN4Vq6jfmZ+8DgecF3Gyt9iquekx1xd/hGd8q6O+?=
 =?us-ascii?Q?1rFkPavduM/g1tE1/D77anIJUCzzU/zJBxs0q+bZrHkyjyolbfpkp4Nb04o2?=
 =?us-ascii?Q?WE3VJX0HwQ5tgsPTcJnBzEu1D2KdbFnImiWt7gl5A28k1WXp6zj/B56O5M/l?=
 =?us-ascii?Q?EszjfhZk/b/qXPeJBIFgjeakae3IUmI6J1lXNAxZcrlhyMqZO8CrSGvdhw87?=
 =?us-ascii?Q?TRlqcoIMDFzo84SceGA2Csafhn9oOKpAb2zBGsjVfP52N4wXWYTn08nejI80?=
 =?us-ascii?Q?HIvzFkOqeRNuyi5QJ3EtT3mTxOhFDygnt6V9ceyDnI4ovidCo+mFV93H5Uuz?=
 =?us-ascii?Q?8H5e9CPoXPmznHm3So5SMLXyOIiG2/uyqEvy4nvGXe/tpHiPqkyX5xy3+kAk?=
 =?us-ascii?Q?ErlSFdYc9UfEXBMlir9OCKXz0l21UrPrUY9X4XQH6wlgzDejtLgvGokV+uSJ?=
 =?us-ascii?Q?p7PXnU4fo7OYDZzSvbSpWEBGJiJyGretmjHuTYm1jrSwOZ0jG6xZ1TY34XYh?=
 =?us-ascii?Q?Sj5orCNqmzPO5sIx93qepOWePnpwYD5TcxA/M55RzjzPoiSEvdJbnDeY9Hzn?=
 =?us-ascii?Q?N25U+nWj8WzJ73njHoYjrFxN5TJcBTabU65ocUcCl0CmRv8La1394aLoTgkX?=
 =?us-ascii?Q?3N1VMVqwqIyHLMloPGNVT6xAsBnX7qaeZcoUSYDerowQY0mvcFv9PdQzUDm7?=
 =?us-ascii?Q?UMOrzM0BDsGCFUqcvtcOprwXhfFS9F5LbOJYSui0uurdo+AuOoeVA+10xXXb?=
 =?us-ascii?Q?NKfGkfcLLQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae526861-43d3-4dee-f895-08df144f3dde
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5977.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 00:04:28.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n85RGHYwcl8QgC2+NxUMp/po5t8xiqJGjLp379GMvVqe0x+ameotF2oI+s0ZgB6jVmUcUkcTqUTCnKmC3CBIZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7186

On 2026-09-16 at 02:37 +1000, Dan Carpenter <error27@gmail.com> wrote...
> The number of pages comes directly from userspace.  Shifting a value
> larger than ULONG_MAX >> PAGE_SHIFT discards its high bits before the
> existing end-address check.  A request for a huge number of pages can
> therefore be accepted and processed as a much smaller request.
> 
> Reject page counts that cannot be represented as a byte size before
> performing the shift.
> 
> So far as ChatGPT and I can tell this doesn't cause an issue in
> practice but preventing this integer overflow is the correct thing to
> do.

Agree on both counts. So far as I can tell every subsequent function using cmd
just uses npages to calculate a size to calculate an end address. Eg:

	unsigned long size = cmd->npages << PAGE_SHIFT;

	start = cmd->addr;
	end = start + size;

And this is all just for a specific userspace directed test program, which
currently never asks for a huge number of pages. This makes the fix easy because
it won't have been causing any test failures nor will it introduce any.

> Fixes: b2ef9f5a5cb3 ("mm/hmm/test: add selftest driver for HMM")
> Assisted-by: ChatGPT:gpt-5

Minor nit: I think the style changed recently to:

Assisted-by: LLM [TOOL1] [TOOL2]

Where TOOL is optional.

> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  lib/test_hmm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 6911daa9f854..b409c42bfe6f 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -1624,6 +1624,8 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
>  
>  	if (cmd.addr & ~PAGE_MASK)
>  		return -EINVAL;
> +	if (cmd.npages > ULONG_MAX >> PAGE_SHIFT)
> +		return -EINVAL;
>  	if (cmd.addr >= (cmd.addr + (cmd.npages << PAGE_SHIFT)))
>  		return -EINVAL;

Most functions (eg. dmirror_read) have a similar sequence as well. I don't think
we need to add this check to all of them though, and arguably we should just
remove the redundant overflow check in each function and just validate once on
entry from user-space.

But this looks good to me:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

 - Alistair

>
> -- 
> 2.53.0
> 
> 
