Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022095.outbound.protection.outlook.com [52.101.101.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1737F726;
	Mon, 14 Sep 2026 21:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789421278; cv=fail; b=scUhYJeApFv/JYYeniX8J0miw6SuSSGaA1SQhtL4+U+1Or3IWnBfG6W1N8WHTZrWJ/vPEFyN2dWHqBNxtG71HpYvkiKLXAQ43hIZKR8CqSzwYzL34Cc5Y3Isd/bTLNX9qC1k3CHF2lztbCr84hN49K3XJ6aQqTKzaCSmOw9rNFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789421278; c=relaxed/simple;
	bh=407VZ+l21gFEJP9c4N2r8tZSNegT6lKKkaXI3UUMXX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=osLA26WPQvHt9YPA6AR7YcG7/3ctvynl0hPeAiP+Roztav6fy6z4jusEYjQazsRTKI24XJaWrMU5xUhJrwpnR6DzLGzwFTq9+2/aQbU4KhXINod5JR7S7zMUYlatPC7a87chr63hz7bYBSGmoRHSbcVtGtgXtaGxyVzBIulQY8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQUrmGtetAH7ZXVDCWv1fHv/vmzGoyUMqB0/WJXZX6pA1gYB53xY0qsaW6puIvxxv72eZKKsmn663CuGSUPALijJZWMtoW1/6hGHEjhoxe3OKL4kUfx+Nq2MjxTsj9dZiEYPX9vde9Lg4Pkpd4HL9P8tmWJeDN3ep61ZZh0zvTMw1v+BJswpmfZ0mRAF1QjHx8tu+MEot3MGuj499TIQWbOD41WKtyxdXimuZBf/9G/8rmARr1RrZ8u1B/Ftd/R50KErPjIMGPL/vJQVK+EBeChH+OsCjaXi7Yl+lRIqhTlmVXSj0zp7AV/3kDciQnBXWuwMh8pShIYdCM+Ev23ABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=z5QvAmRRHwBekdun32EdD4D/OzPMIf5dZ7blTwgKgfQ=;
 b=yWKtTkVPqLPq95dLLjB+nBoSSLe215e8wVjWJfrOkKTGPnmnqdoKo/9ASX10UCAMkmrTBnCgTPqkBnOHALbHhDu+wb98k2OTdQBSDu1poHxRRpHVZnRxVEL8PSplpUT+CkdXrkMBCrwcJx9PWD8fjg7bvUHRCfoatNiMLnAeyfNE01Ygox2mRj2yh0JOQh5jz8ipjmDcwFxs7sL86+UGbW6udzIe8KGYHo4RGMJm/nL6DABtmnz4ihtcu+zQgmmtj37457DOqms0aqVabXEr+pAHrt0PAvNta4SD7BPCJTTf+dDJYEO35ee8aiPrYnaOiw4bn3qMbwxeSLVIEoXK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB6886.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:305::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Mon, 14 Sep
 2026 21:27:52 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.012; Mon, 14 Sep 2026
 21:27:52 +0000
Date: Mon, 14 Sep 2026 17:27:48 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Borislav Petkov <bp@alien8.de>, tglx@kernel.org
Cc: tony.luck@intel.com, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, frederic@kernel.org, 
	marco.crivellari@suse.com, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, 
	mproche@gmail.com, nick.lange@gmail.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] x86/mce: Fix timer and storm tracking races, and
 avoid redundant polling
Message-ID: <th75s2gp7u5s4bsgnulrnasbk4bimjhfv64d3pn7popmnaewb3@k5z2lftcvxab>
References: <20260911201206.532113-1-atomlin@atomlin.com>
 <20260914045254.GEaqd9pgnKrXYU4thR@fat_crate.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914045254.GEaqd9pgnKrXYU4thR@fat_crate.local>
X-ClientProxiedBy: BN0PR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:408:e5::18) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f4b57d-1a92-4b62-bdf3-08df12a7085c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xsGtS3Tf380EvYC+iYKEkzmhgnSBKHVCn4epWXKU8lym3kprXASAkCjmmAtoLwM6obAek9/p+85LxWmg94R7Yq5Kc1tBpNEFANn9glwXRx99HGtJy2g1C78gdKvEmO8xz4vo7+xLwLZr0V50o6F+ITXCE8yuR05A51zkSoaqO1UpxAPhmuxkQSP9/TPe36lUgXsB7gIiOIssBE4LFiobYWIhZkc9b9lR54xZwGTTpjkfINp0UJ7C20BazMzuvdcE4XXrg+TBfGIzf89PR9frzN/XPX9AagBOEpgLTYPeJwcPOdexYD9SEoZHds5EAYBkjPuiafVkRkc7+fL9pYzaO0B9r9NhQNNTHAS76+bsjocFu5rbzKfr5sa+MjmDnRN94rMu2RGNawTPgiqO6oAR61jIebLr2Ntu563AirJHMd3Gf2+FqxK3Tp1jx0R6ig6vi52Wie6AwnnxWpGzMub3jbY+T+BlSr6gFSzatv2RVVBPDSnwh7u94PzjUUW1wHdpC88wjVh0mTBFZzoq/Diar2+FDlBaNWDN3tUU0g8mlzSv0129Jx64wIUStV3nEMhs7WVUXH41m7k9m7FMx0fMgTwINhtdWgO7HuWjnW3ZW+2brDRl6s8HPu93KqtYjbxWVbC6d5kNZTviIKWow4p1ZwsEhRz2NuGbe3cF25oVqI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1dtczJnUDVSS2xoZGVRdGU1N1lTbTJScWI4Z1E1TFpqZjJNb084dUhNUVVM?=
 =?utf-8?B?ejkraGVPU0duZXduemxHME1NbEtyL1pzeEo4M1lhdXVVaG1NOGkrSnpiZ3Vh?=
 =?utf-8?B?aHV1TUdXOE1hRzd5MjVZbE02bnRjcHpROUZXWlZlcVNPdEljZW1yOS9WZmVy?=
 =?utf-8?B?RVYvWUJYUjc5OGp6MGhQTzJZR0VCc0tWT0d3ZGU4emZXTWFENVJVVDJVQXc1?=
 =?utf-8?B?WmlDQlFqdmVsdC9hMkM4b2tRN3cwU28ydVNqV092bS8rT0ovUlE1bEh2RWdP?=
 =?utf-8?B?YmVRODNmUndBelhvUHhseEJwNDhxVDlZR2pUcUtRWFNzMGpMVnFwOWI2U1Jn?=
 =?utf-8?B?UnlzNEE2K2gwR0pIcHBMNXVIS0hoTUhtcXNWMy8xaTJmaHFZMUdrVHN6TFhZ?=
 =?utf-8?B?bUVlZSszajFNbHU4ZHhCdmU0Zms3NmJCYXNBT1lGNDlydmlMM0VReGZqUndM?=
 =?utf-8?B?TUJHZ0ZUT3ZxeXNodnV3TDE4UldRazEvYndyVE9reXZVVTVyOGtGQVJnR2o1?=
 =?utf-8?B?dEVDSVBsUVlqOE9laHpNMnE2bHp0SDBqYjlGUGFtQ2dJa3FqT1JPWTFrV01E?=
 =?utf-8?B?OFdlUE1NWjd1aVRxcXdob015WXZxR0RWeGVNSXlOZkc1amxwenNYbUp1SGt3?=
 =?utf-8?B?OGNldFpuWXJRUkNjVHNqS0toSnJCZExVcG14TDVBaHd0czJQZC9OWXVCTUFx?=
 =?utf-8?B?RFQ0TXJtdlhlcFZ2WC9JaVBJMnRTTTVrK1ovVDkvYkZEWU95eDlRUi9ONmZK?=
 =?utf-8?B?ZFcxanRZUmVkVVFBcmNRcHBndUY4U3VwTCszY3RoTDIyYzQxTFB4ZUhmY1Vn?=
 =?utf-8?B?dnd6NkJKWFllMUNiVjFqK21PV21ORXdUZXc1UHQvRnkxMk9JNy9kc0V1clls?=
 =?utf-8?B?ZGoxSmhUU3E1eC9JR2wrWE12cjVNekNxRVg1VFg5UjZ2MlRVV3IwODY0R2Vl?=
 =?utf-8?B?dzdsY0U4bHByZXlGWUJLOEdQR0VSYjZQK2VUYit6enhDbXFWWllrcGZmaitF?=
 =?utf-8?B?LzA5RHlSUzRYRHl6NHVqT2NwdDlzdkEzRlJLUU5kZGNEWTVXRnAyYXNVNGk3?=
 =?utf-8?B?WEZFbk1zSU8xMWZXNUR1aDloN2ljNEFsNEVHY1FDa08wWkpxRCttcFJIYWVI?=
 =?utf-8?B?UGhmU00zVVZ0VVRlYWgwaFpNMnZSSWNtWklPVFlXZ3NXT3pMR2drNERhdWVN?=
 =?utf-8?B?SVZ4K3VnY1BFTTdRaE03ZjZ0R2svWUI3SGUvUlNBd1NvSXh5d1R5ZGU1Z1U4?=
 =?utf-8?B?cVdvUEFWbjNrOEJaczhhZGZEMmJGQUtRRzNvOWpDdU5MWWNKZEtVTU1rLzNI?=
 =?utf-8?B?TlN1RDBtVDh1cVh4SHFQRG9oQjNaOE9ncmhKamJTbnoyZlBRYzhack5UdVB0?=
 =?utf-8?B?SFlGbW81d3F4ODJUMW5uZFB6QnB5dlMydjI2dWVzMVNSMUs3R2ZMaXBCUG84?=
 =?utf-8?B?V1V3aTYydTFjZXoyVnpjbkI0NDEvSHRXVThRK0k0NkFYWTVaS2FCSnB6aXNL?=
 =?utf-8?B?eWkrQUpJWDM2dVhnbVR1aC9ZR3U5bmhGR090S3ZGemJxWThsRnROcnBucGQ3?=
 =?utf-8?B?NkxwS21tSEsxM0kyRUdOUy9HNmV2U2pwN2RWVjhNWllaQVRqSDV3NTBoZ2hN?=
 =?utf-8?B?NnNsUWpyZVdlQW13clBTckNlRUorOXIvMDdrc01Ub1c0RTVvbHUvcWRWcjV3?=
 =?utf-8?B?Qlh6VDliQVpyZmVoWDlkTklKMnM5VUVYeTd2TFZHTEpvRWtSMUk5YitUd01t?=
 =?utf-8?B?YWpmTzYyNTdtYjc3LzJ1cG1iUGZzZlZPTFlxM1lnSy9jbTFoQjVxUlVCK0xa?=
 =?utf-8?B?UVBYcmpWd2dub2VXMVVBQ2N5bHZSQzRpSGdhZzlJTGVyTVpHWHNSdDRzSUcz?=
 =?utf-8?B?ZVozbXZ2MEF0Q0hpMGg0RVNUOGpuVFViSTErN1QycFd6eW9XUU1sclY0K1c1?=
 =?utf-8?B?cGhwQTRrY3NaMmg3MDJPQW1IM0xxUDAycGhpOTNqeDV3MFdkc1cvOUdlKzM5?=
 =?utf-8?B?VVNDU3ZMUmZic0xaSTJtcG81OGdrei9NT1RkWEIrbVM2bjZ3V1p6QjA5aUs3?=
 =?utf-8?B?QzVSN3k5K1pwZ2pvSk1GRGxwVDUrSmhzcjI5d2VBUDJXM0FreG1zWGQ2QSty?=
 =?utf-8?B?RCsxQThISTY2emVMeUorTjR2ZEg2SGNySTBmRWFjVnB6a1ArdWVlTU1vMHV0?=
 =?utf-8?B?U3gvdjk4ZVc3SWo1cWJBTWN1TUNyaStPZGxHUXZxWktySDhQbDFRM2JVT0ZZ?=
 =?utf-8?B?bGpCdHBsZFVHRU5URG9EeXo0S2tpZzFjRXQ5UkRKUENzUk03SkpmYVNNeHVa?=
 =?utf-8?B?MVVLVENWNzJDRnN0Y2NlVnNOeWw0d3BsL2hYZFFDZDRIeDEzWFBpZz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f4b57d-1a92-4b62-bdf3-08df12a7085c
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 21:27:52.0847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJG6RMFx4Qs1YLWPY71gnWMQAlwnDOdIvS+qL8kELBzUqBvMhe5ZlM7wLas1XDwnp4W0dVDjTXUlfooQ6cxE0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6886

On Sun, Sep 13, 2026 at 09:52:54PM -0700, Borislav Petkov wrote:
> On Fri, Sep 11, 2026 at 04:12:02PM -0400, Aaron Tomlin wrote:
> > This series addresses several distinct issues within the x86 Machine Check
> 
> There's also this thing:
> 
> https://lore.kernel.org/all/6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com
> 
> Since you two are working on this, probably should productize Thomas's patch
> too, in the last mail of the thread, while at it.
> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

Hi Boris,

Understood and thank you.

Hi Thomas,

Boris suggested that we productise your patch below to address the hotplug
teardown race in timers_dead_cpu() alongside this x86/mce timer series.

Would you be happy for me to formalise your diff [1] into a standalone
patch, provide a complete changelog, and incorporate it into the series
with your authorship and Signed-off-by?

[1]: https://lore.kernel.org/all/878q63lrqr.ffs@fw13/

Kind regards,
-- 
Aaron Tomlin
