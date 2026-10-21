Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792597396;
	b=BYY6ZLd/gTvSij51ND8EQQsau34zxOreWeoqmxJTs9RRHDH0lSQhZb55JMHcFrKNQ6tj
	 I6w8aUsR8OR4HAwZRg0RtslPcRcTz/McoKoYiEzq51rvuTqD7dY3jzAnUiCm2O7DwmmCU
	 DYmDXdDE9JGuwk3fWSmHcVF8OltVg+zopywtuCDaKSFbgcdVvZDkHuFAHYQhCP7QQ734w
	 +a4PSkJizKqkwWJmTZU/eTpJhPJf3qYPhCK1Jbrjuu/xhsT4DbPHu/mICBMxEunlO8fXy
	 Na/IXyNvd41WU0/PGs4YwrhOowsq6meLBYPnbDFZ7UFYs62f4UttC0LRkoBmjWsu4WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597396;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=/MkPbd3JzMqw5i7RESQrUwKg04RwCgzifrhmeY08/5o=;
	b=HkeY1qAQenmeKHT2CUTtix8ojaWZ+vjPtg5NIvaDlXrnxNfv1G1KNeEYaKbV+mQESf1g
	 ch/cgj5jtRo8onFbi5eYchTmKrhH5u4DnIWHtANp8j0XlW9sWE+3/1zGkalAeCqDFYP8z
	 YRUMWfrpV63ZgsVvW43KbPiNwVM3t9bsa2E1ATwUoALRugYUem6s3AFfCHBeFWNvbrQ7v
	 T7tnFCyQ7Xa4rn55za5tfzYiDMfCVVrxs8U7tQeqbhzMqXcSuUZ42L0RfKfW9DwRr1huY
	 /3ddUFXPQww9HMhkXD7GLRxK6mP/VV5USAsq+gx0a9a2GdvPIAUfoL/sQBM9F9KIa1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LCGWlvF9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.26
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010026.outbound.protection.outlook.com [52.101.201.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8F2606A331
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8F2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LCGWlvF9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vk0ruR9pbwmf9AwhfekCBOe5CS4zzFlZ68H0yW0f3v0yZ/teVEYYO6qRafh3eDM01AAWpuxY5jVcEfnW7oJVN0bgSa2lFtX6RE0uB/6T+fbMh/zEz2ipkmTC4WqwIVf2DSgSrmD/cHB8alzOdLHRc3LQdEtxTXsQVKDQvNldSx1pP4yfeAKYUn1m2woDTybfz1NW48d/yz+3wM0sxNpm39YIo661HwUlCw89hcUMqzYX4oMmc3oLZYGBfnyEY7Vjv3dEY4Vi0/Zn2qCyCs20NQwXvklIKN9r5pBUQXXVnT9UPb16Z0s+IwJSnHfoUvGrUfFRoSQAyGuMTfDtyCu1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MkPbd3JzMqw5i7RESQrUwKg04RwCgzifrhmeY08/5o=;
 b=dJOtNrbT6QKkEa7hQbyPmx/zOFOfBv8J0EIWNuX1GPVXxRSDf0Nc7RUZjLeV9gOhIA4y+sSpKC0IrgzOUfgSmE7C1ZSCg8XoYNcoOFGdDmE4SyCnLy379rzXHqRdaSmDfVLe9Cm0LCDHRLG5G1mYRgpSRmUzLx7ugUhoC4Q3+4xUIC0lsThIhLu0NC9nWzw+HlJ95QuE/ZiL/ITP3xhEtlqcdd+8OBOmxYi61Ti+To5EI0xtql4xK+T03nxFQea8tJt6a2NjIoGHDmUUfxOJ8L0ZUMLO+O3Va+FIptLVfkVaVqBCxE9P4BSJUXc7FDt+yOEzw5Juq6bEm8H0ZA3QWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MkPbd3JzMqw5i7RESQrUwKg04RwCgzifrhmeY08/5o=;
 b=LCGWlvF9h2nAUedRuFl284b2KfugusnkJIY2/2J5URjtksYsiXlfoYdwRAAl6zz8j1pELx5kA88hRzv9yInYVDzy9xjvGVaZugq3/sv8JrxtJng1igG/aC4saz8TwMSvPldjvfM3FgxTWUDKvudPsEFrht4KFYfXMTqir7EGCJA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN7PPF5F16C5C9C.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::607) by SJ2PR12MB8035.namprd12.prod.outlook.com
 (2603:10b6:a03:4d3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 15:43:13 +0000
Received: from BN7PPF5F16C5C9C.namprd12.prod.outlook.com
 ([fe80::67a7:9feb:71ef:964a]) by BN7PPF5F16C5C9C.namprd12.prod.outlook.com
 ([fe80::67a7:9feb:71ef:964a%8]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 15:43:12 +0000
Message-ID: <b44fb51c-11f7-4332-8ac6-d260f6904dfc@amd.com>
Date: Wed, 21 Oct 2026 11:43:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/amdkfd: Do not use internal implementation of
 tolower()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20261021084639.251366-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <20261021084639.251366-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::21) To BN7PPF5F16C5C9C.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::607)
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
X-MS-TrafficTypeDiagnostic: BN7PPF5F16C5C9C:EE_|SJ2PR12MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 47682c6e-427d-4e20-6079-08df2f8a03b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	97XHISzoqS0Tbb9LjkDo76ivDu3aKOPmSkJng4GdYmsuslHw/nVxq3blSCXH20j72bU2zAmiqL84BicJ9+OK4e9y+hl1uxfo7+FaEtjODwYpXfiK8PIYd63vAvq5YcpQLWpsUP2vwOdjqEzViw3Vgse/IYF8eFNlnEKgyUQZ5IOmCX4pQDEU6XjVZ3PyiYY4BqeheX4/U3iMsHiNcwlwEZe0dygUO1Kaj/7ESkyJw05DQQ8TJn9WInzDkj9PaFllylAKycwF4kg0wnFBgmCxxzMIqv9iSCgamNUaxDjb8qdr3uG94N+sB57Uy38UooP1ACkHEOSHLVnNFu8FFLsKOJNfmJtS7wcv7bCmI6aQEJ6t+lnQz9XSDOkuPtyKhQiNyBizoXxXrD8q0OlaQfKzcdI8gml3DP7RejXDUKIF9xMSOmW/NrgOUEfk17ZYYrhD/DAj2O8myCsy68b5ZE4c9zp0x0kjiw+n+rdeFYSY2ssFJwuPy15SA8Nq70Zzm9HwTu43a9MIAYSGhor22OGV9KMd5tGwDIefB5HiUhwNnKledOVYNUSIhdEGHYC6Lm7HULMXTbzUuPeIGugZH2gJHn93HSFudAGf9gUToxKNxIzOvZMD+sMi5D7osjaXksDlOLIAg/rrzb7259E5Y+j5KxzEId8NLMLmNQXDAxzcDfs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PPF5F16C5C9C.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEdVelJiUDRleTFjUWNqWjRQbGkxaHNoZ1k4QndkQ05heEpHcGw0Z2IzSXNJ?=
 =?utf-8?B?OXM0amRHa2RLbTFCQ08zM3N4T0FqczBxaENTR21CVjV6MUVUSE1aK3MzTG9h?=
 =?utf-8?B?bWdpR2ZFSGxUVzNMQ1ZXeUk1ZFFkdFM2WVEzNEtVYll1dnloRjFDQ3A3MmJ4?=
 =?utf-8?B?aDFwc0sxc1JrT3N1NmpscVlPaWs4VUlvdjRvVzEvOHJueWdQWDFsZDYzeTNa?=
 =?utf-8?B?M1F5WXlIaUxXQmpUWmxlRDkxYm9vcUE1d1ZWOFBpZFF1ZFdnQzgydmpJYzU4?=
 =?utf-8?B?dHZ2OGlOaXJLd0lIMEZLK0JraXByM1M5bWNLbFNWWDlySjI3ZXVBajVrWmxC?=
 =?utf-8?B?T2NiM0xVczdOQmM2ZkxhMFpNRXNGSEJqZ255NTY4bVg0SUg2Y0RMT2VaWHY3?=
 =?utf-8?B?WXBuYUhCZVc2Nk5CYWIzTkwxU0xSRi9oR0ZxMmREcEo4dTR0anZ4RzlhSmxW?=
 =?utf-8?B?NGhCYmhQdTRuNkxrTmRjbTVkV2lhTzZlckZKL2xxdkV4NG9CeXNOWHBSOUEr?=
 =?utf-8?B?NWhVWWlNSitoRjJyRFR5cUp4M3V0L2w4YXJITDZNQWlHVzl1V0Q3ZG1jZnBr?=
 =?utf-8?B?WlhxeFJCa3BCQXZrL3ZJTEUwYjZURS96ajNQQTRrMHhsSkl0M2dtNnJUbm1T?=
 =?utf-8?B?R0thK0NqQ3VxRkhwYnJNOGZNbWNvMmpjRFV4aWpNNG5la3NUYlFBUEF6V3Qx?=
 =?utf-8?B?akJ6QVdtTVU3WXNDR1NDWkdnQ1p6RnJpYk96U0FUN1JGdW4yZEszekZvUTlQ?=
 =?utf-8?B?dkV3UXQwamtvZzlPclM5d0F4YlR5dmFvb3gyQUpwQWdTeTdHcUFPUXU4QzU2?=
 =?utf-8?B?MkNyN2ZxdkVxa0Z0YldDeG9NRUswYjZNSUU3bDdndFM1bUM4ejZGdFZrZDM5?=
 =?utf-8?B?RzVEWitoNU40OU5sRzNpMWpLWXFHVUpUd0gyNXBZbzRzV092Z3Q4RW9nempG?=
 =?utf-8?B?OXlIcXk0WmtJQ2ZoUzBGQklJUlRlUGcyR3Bqc1RWUERCSEYwcktGTWNzVjlV?=
 =?utf-8?B?RDljSmlxRWtjdUxQSTZYSnpsSnJHMTVNYzRzMmxLeU53bHpiY2NKQnhBRXNU?=
 =?utf-8?B?cng5eVdYTDRxLy9VZExXTUJ2UzJwQTk0MjdacXdMallRRDNOa1NjUDljakR5?=
 =?utf-8?B?VlY3djNQek1JU210UFV0WVZDYis3OEJ6dXRzNlI0VHplOHdPdWcxMy9TQkJZ?=
 =?utf-8?B?YjZtVzRXb2J3WTdJUDAzN3hIZS9rZWhzZzY0TGt0MytUSWR5c1RWREpPL1Y0?=
 =?utf-8?B?SWxPT29sSWtCZ3NzTWtEZWg2WkJSc2FRZDdrbjB1dTRJelc4VitraFBoLzU1?=
 =?utf-8?B?a1E1Q1MwSUhKUktRdm9PMDhrSnNyYWlvdmNjYlVlWWh0eXFHU0d6MUltc0ds?=
 =?utf-8?B?amZXUExaa3VUSjFBdWVMcStmRWY0Q1dJZXlvOGdiRnRQQnlEMlZodUVKMFM2?=
 =?utf-8?B?M3p0cDQyREVyMG9Xbjk3Q1pEQU9jaDhnM0ZobGdNUmNYbTJQa0lJbFBvaW9l?=
 =?utf-8?B?VkJSKzVVdDcza3kyMWdSWHV5RVZSbmJ3ME1PME9TWHNVY21YWlJYSWZaYlF3?=
 =?utf-8?B?Rkk3eXI0REl0UXhMSjR1c2xSOVk0MTNkamQ3bWRtQ2FHZG9oQ3Fpd24rODNt?=
 =?utf-8?B?YUR3YSszQTF1OGx4T0RKTDVMR3ZENG9NNDhPYSswR09nbzlRODJmSUphR0pi?=
 =?utf-8?B?d1Zsdm9CU3BHbUxTRTY2WStTeHI5dk5JdEFYK0QwTHdrZTk4UUVVK0ZMQnlv?=
 =?utf-8?B?U2E5VWlmK01RUW5Jc09HbU1uMUdMZGIrSEJhdEtkMWN6M283K2hWYjUwQTdk?=
 =?utf-8?B?azRLbWZLM2F3bHUwd3VLd0M3NklUdEFrNUJ2ZVVlMGJ0VURLWUdBcnVFOVNk?=
 =?utf-8?B?M3dpUy9ySGt4aHRuSkJiblRuVXcxUG56bGZyMjN5SWtrSzV6WFd0ZFoxenNJ?=
 =?utf-8?B?Lzg5VXMvem5qdlFLR2lYR3lSajRCcmt5UGZ3a01ZakdUUVdLM2p4eFVWTlBT?=
 =?utf-8?B?Q3ZjU3RwSGZ2M1ZlUWdtSmZBSzM4ODJTUmpaWFR2SW1UdG4vTlluangzajNl?=
 =?utf-8?B?engvMWJWOGNUSS9aaG0yZU5lQjRsUTlTbXhsdXp5aUZYNUI0S3lma2ovSjhB?=
 =?utf-8?B?emFTVElOM3V5am9BbGhWVE5sejlaMWw2aG1tZGJudklLL2dmL1c5bTUyVUQv?=
 =?utf-8?B?RnhBOWFJMDFpS3ZmbTJzWWRFNVArK2pHK1VEMjJua01wNUs1QUhURDYra2Qw?=
 =?utf-8?B?Vjd1RWNYcTF1NmV1S1FxVHJsMjNBc2MxR2F3a2pzUDB6MklkNENveUxEUlBm?=
 =?utf-8?B?Vnh6SDVoQ3A5SlYwaFUrdW9xa1hrOGptZDJIWDlYWWFnd3NZdnJSUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47682c6e-427d-4e20-6079-08df2f8a03b6
X-MS-Exchange-CrossTenant-AuthSource: BN7PPF5F16C5C9C.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 15:43:12.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tv5csV8tmmgoLCbBq1j3sDoKdr9Y9Cno0KMsQxQlrWSTWJtrTU7zBoEhgn4ZNM6EqQJ+QH4mkyI0p35mTfb0DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8035

On 2026-10-21 04:46, Andy Shevchenko wrote:
> ctype.h provides tolower() macro specifically for the cases
> that might be architecture-optimised. Using __tolower(),
> which is internal implementation, needs a good justification,
> as this driver is the only user of that and there is no evidence
> it's required.
>
> Note, currently it's no difference as the macro always defined
> to the internal implementation, but it might change in the future.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks. I'm applying the patch to amd-staging-drm-next.

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index 35b3abe57b80..1ef4d26a0ac6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -2091,7 +2091,7 @@ int kfd_topology_add_device(struct kfd_node *gpu)
>   	 * needed for the topology
>   	 */
>   	for (i = 0; i < KFD_TOPOLOGY_PUBLIC_NAME_SIZE-1; i++) {
> -		dev->node_props.name[i] = __tolower(asic_name[i]);
> +		dev->node_props.name[i] = tolower(asic_name[i]);
>   		if (asic_name[i] == '\0')
>   			break;
>   	}
