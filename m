Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D7D2FD7B1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511984; cv=fail; b=EXk2teNrghDrL6JxVTDuzx4ClBnuPuu7Zg2SeAYnSgdlZcXGCYmNSTTJvniqfdYk/U0dFioObTY+BBHCa3pBL6nLOf2W4KklngA34OyX7mY/svm3UVwPwi/h+ZIAlW+gxlfVRHwhYgUY//mbGOISz8RKXLYrFKKuNxd79dIhI2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511984; c=relaxed/simple;
	bh=oPfU2CIBPZQWnEejTe6c2Ow3Xp9f92WjLE60VQ6yNRg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B62zcK94iPTrg7LFHlb1iXd8zdJXFJD3EvcRUUmjVLZcELLQpGocTFN3DhMil4HDeR9aLEMQVGn74JtgwwpV0hrYHUHjrEWWvMTzdNcY3BD88GFD/IojIshm/kZTb7gj8oNm87AncZYJHQoMIbhOiiXSttxQoCROQWmYEWGkLh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s44bPcbd; arc=fail smtp.client-ip=52.101.85.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s44bPcbd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NK68pQMzcMevplMMIwpB+vjAYd+Atr5VYgWDfMTfJk6eDWGEMdm6L0BcVqPWfIDz6pqEKtiAwhNzEKe0sKdZTDoqL81ZmMfW8vewTDsTNXAKUYChEV2N5bCt9/2FhAsR/WbaiP+OUVd1vnMkjfR1khs+4jMkAFTbgao3xQsZdqTJCcgyf57F5+O7ByrT6/310C+LN+W5zCUBgIT7yPvEFDWGh0b6wUMZSk4lBXC09tnApFJEy26eiMCEyx8d38jrQ73WP1J0F6CvHWHxNvMwyGN5w9ZOgfOW8KTpb66bu3H15ktSIlTcI0TIqhS3bBISC+sLxM4iAg51AWqTqDRyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ha11w+pVJqkN5Y4xkZlvh8Xj4Vi5Q/qnqYYi+53zTMU=;
 b=ri27Yu2s3i5UjPOLJHB+muokNB/n5JV9s98miqY2hQfj5+yMfsLeuaQdl2yrti4N7k5wJnW+1qnrJbF9iVjzgP+WN419OluaR1C6lcZtBCHaSUdxdB1OVXa03BFxb+VfFNyZDtT+trFpFr0wYuDHwaQh+bieFAJYapFZ5Hoqkps8i75ECQXTqL80OnO0T3hXT67Zo405SL2mAAMw6CiW8sjlPpsrhckz6bCDgT1/vtgnkxVO5c4ehbVpeYK4pysB61442MGbpELMviI1vmFodmHKl/gm/i3yzB1Y3bdJyooY6q4mrE8dbtn5rvxvlc2tOLKroN03kBhRUYbI1s302g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha11w+pVJqkN5Y4xkZlvh8Xj4Vi5Q/qnqYYi+53zTMU=;
 b=s44bPcbdpG3FSp7lUda8r9qOfRmzh0CO+TUdXQJz3efFWihVhEfGZY+i1XY9yNfAOB73fdGjC6jjxhJUUVbIgpUoEGg+9vP+3Qi+an30bmswn/GLo9MbbE2D+J3LSTpx+YXfAPpiYYtodBEC2bLgHe6t0pnH9tBFB62ilQdsCuJTiQDcFt+iSEXh4bD36DeSDoeEFLfo4BBiPRckL7g8DFKLo/FG0WyEILuMbr3UCz8zcF4++mN38lkWFVmj6iWdO4e6Fbq0GXJ7ymPY0WhCU3huyK28ZGmHp1JPfW0U4xOTSPj6dkXR6Aai5xQ9hKSl1FtELb6yD/Lt8DPfBb88aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB9730.namprd12.prod.outlook.com (2603:10b6:610:253::9)
 by SA1PR12MB8161.namprd12.prod.outlook.com (2603:10b6:806:330::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 22:39:39 +0000
Received: from CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128]) by CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 22:39:39 +0000
Message-ID: <5c057547-71a1-4985-82f8-e95b715d2070@nvidia.com>
Date: Wed, 16 Sep 2026 08:39:33 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] taskstats: drop the unused CPU_DONT_CARE enum member
To: Bradley Morgan <brads@mainlining.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Balbir Singh <bsingharora@gmail.com>, linux-kernel@vger.kernel.org
References: <20260915180623.22058-1-brads@mainlining.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260915180623.22058-1-brads@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ME3PR01CA0035.ausprd01.prod.outlook.com
 (2603:10c6:220:19f::10) To CH3PR12MB9730.namprd12.prod.outlook.com
 (2603:10b6:610:253::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9730:EE_|SA1PR12MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7e0b82-fbb7-4e5b-d76a-08df137a3a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	zcTvT4xBmZ9TP+wSCWPQVLF5Zsq+GKtP/KaLrk1fysJuUeI9TZeB50PpZkkOYHmYE4FipsOYNiFajNfSHo5BVoGf3cSvxieINraId5KpRy8pCJ0KKNKwyXXsPuaY//EEumcsnOjP8PB8eh21TBPqtM3LAGwc56WwhxCAg7hzNYWl+B/GqI42pI0xy0sbdf5K04WqwylCvWUtPu0GGHrGp8yXRfVOoIhAnxrgwY4K3Gz52vc6w77iSj+wGg5cSr1zDfaCzy4to62CHcYQ1dt6gK/glMh2pf9k9M1uNuFOiaUq6zw/4kUbdSM0JpB+CcRVQnId8i0rhonSLsON9VqqgHNzeep8LR5EohHNZNOmtuioE/r+V1+sg/A+9Ogust1xznHDq7B6rf6RQOjsbjDx9DA0/GzsxsAWv61rT/OqgLcpOnNzI+pY0JnOPXkE3Kjva+sSXj0eVOURpXKixoJ/lth4mcQezAUmGQZRmp2rlRwTqkfG7vCQoXanHEjUq49lESKfrC/3eJYyK8JvVrcuHuYERdrLV90pVmCuCI4uwroWj34a8DHviurZ4tfwn2WNG85hgadee59tkUK/+OCZEOCJqBH3WX/wdGo5/mEkYXiJIVMbDMdWq4plCT96H4xIxwoArp/74/PzPzQXDkiXuVBoeOVd0f7/htSH9T3YMec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9730.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFFsM2s5dGw3eVAwZnp5MkVua0VZeTJidUpLVldiMW5BL2dJdVk2cUdNUUpw?=
 =?utf-8?B?Rlh1RnQ2WFdmeWxWNnV3anZ2ZEdCTjV3MUxnKzFLTnlkT2hObm9yTUhVRDRy?=
 =?utf-8?B?NEQ5ajV0K2dKcmE5OU0zU05nMmk4NEgrbE5qQnZBYzlwb3p6UDlSc3B5NTk3?=
 =?utf-8?B?QlMrUHhlejQyRWl4MWFQQ1VnZitxNllkMzZPQnBBMFdsVmwyN295N1YwdUhn?=
 =?utf-8?B?bE1xdVJTa0gxdjU4UFBaNWJ3aEdBaGpUUG9oWGU4ZlZrRXJYK3pzTVVLd2ow?=
 =?utf-8?B?YW9Gd3h1cUt6bVNGWlhXWEV1aXdpdnd4SGlmS2tFYnJRMjRrdzNYS2dEM3Rh?=
 =?utf-8?B?Ry9ZdTFNTGowM0xjTVcxVDgrQ3ptR0xLdjM2cjJJRkpCQmV1TngxaGNmYTJy?=
 =?utf-8?B?Y0lKdStQMFA1M1dGRXJmVUVpS3UvNVRGdCtRT1E1bGg5OE9uY0JEWCtMQS9U?=
 =?utf-8?B?TkNvV3RWMDdMSWswNFh3bFdVOGRvNlRVYVh1SzJUU0pmUnFNUEZnWlJOWUJn?=
 =?utf-8?B?MCtrdmVCUXVlMFQwV1N3aTE3cCsvc2ZXbUx4bmIyUDlRT0tPRnhPdUlGdSth?=
 =?utf-8?B?dFJJUzE5TEhKalVPeVRhOHhXNVZrNjJtTFdWKzdnMVp3ZWtWVVp1bDNCWW9V?=
 =?utf-8?B?RlE5ckVGaVpKTHF6bnQ3MTREemJNWG5YWmU1ODYvUmliUjd2OGg5L3ZxcGZm?=
 =?utf-8?B?cGd1VHZzYWQ1N090cXZrUkwwTEEzMTdpNE1hcTBXSk9jS2c3SGwxYzV4c1Bk?=
 =?utf-8?B?L05yeFoxSzdLL0QxTkFHR2NLUG1VMTV3L2l0dlJwbTZmck9aNXAzeDd0RitH?=
 =?utf-8?B?Snl2aGlGVXh6S0FkcHVNY0h3aG5NeUxxc2xRaEVhTEY0eVY1VFNmZVR4aVFy?=
 =?utf-8?B?T2hDMkVBVlg1dXhZZE9qRW50bHcycC94UmErdWpnWmdvVkNSamx3VTNLK0xz?=
 =?utf-8?B?UDZZTm13cHUwb05qMUs1OFQwSWg0eUNWL1FYWDBOYWt4VzM5NGxla3ErWlMy?=
 =?utf-8?B?Nm1zRGw0WGRWRkRybUcrOE5WU05yZGN6K21ZOWNlYWZCZ3BaOHlzeHo0bGl6?=
 =?utf-8?B?NGhiMURucXhCQUh5c2lGVFBMTnpPNGdiQ2FJSFE0UGRRRnJTRENPWUtNT1BU?=
 =?utf-8?B?UEdYNzFmSitXT1paZENKRlYxMktVQVlCekhTaGJCbkZaSzkvMUw5NTlrakhx?=
 =?utf-8?B?c1lXb2g0NTdydHFNT2wzK05yb0Q1N2VDTjU3bFlkN0FJaXQxZERoemNueDZy?=
 =?utf-8?B?b3N5cTNGTzB2WU9uR09FdGQ5ODMrcU1Xb3ZNaE5mc2hJSEU3VHIycy9mVllt?=
 =?utf-8?B?enpoMFFzTmhyVGhhOUg3dENwbGxQOVJndVRJRnpWN3RrVmp2MjJaTmcvb01p?=
 =?utf-8?B?QjBFelN5Q0RyZkF3RGFPd1lRSXM5NW1CSDNTUUY3V0d4NDNINDlBZzZ5WHU0?=
 =?utf-8?B?TUFGbGFPb29nN0ozeVJkNnFMSndNZUNWOFVrbDMxWFBabDJCYlA0L0VZbDFn?=
 =?utf-8?B?SlRTRHRvZG4zOG5tWEtJa001d2JnV1hCN1hwOTBIMjhoc21FMWIzUlp5ZzZ6?=
 =?utf-8?B?cEh4MVNhc2daUXlzWDl1QUdvMFlpTjhzcnpqcC9ZbVVpbWF5YmVJSUwvbjdN?=
 =?utf-8?B?SU90bjFveGVFOXg0VVdQcVBWVDdIUEhGeGk5ZkZQZlJmbVB3bnFQWUF5L1Bp?=
 =?utf-8?B?Tlp2TytaSE1iZFdUOWVOQW5pRkRpdk9GK2YvQ2E3N0NmUFU3cldoTWN6WTJs?=
 =?utf-8?B?S25ieGczR1N2eVcwS21nemlVS1BET3BzQ1BCT0E4OGpqMzhnTE9jUlNyL3Rs?=
 =?utf-8?B?UEtuN0ljQW9zWGZVa0JBc3E1YktQUWsvU29VQU5zSVRwdDlIb0x5VGQzRFdl?=
 =?utf-8?B?V3AycFI2SkRyYllSZ2J2SzNuYmtWcVRvMkt3cmtHQXNqMDd5M1RxODJBRkxN?=
 =?utf-8?B?WHlzbVUwOG9DSmN5YlMyWjRhbEI2ckxxamhvUnBTRXQvTmtqaCtzN2szWkZE?=
 =?utf-8?B?Zkt0d01QMzY1K3hIWXZwSUV1eGJSNUJJTmZTcG1HSXNCdlZQMy9xNmc0c3dL?=
 =?utf-8?B?WFZPaWUxczhaQ1F0TXJwakt0NndiM1lCVWxqc2VHMUFZbTliUzMwWkc2Mm5i?=
 =?utf-8?B?bHNRY3QzQ0lTeDlLOExxMG93NVJTRVIwenNaZVZCN0xDRThPVTNhMkRseUlR?=
 =?utf-8?B?UmV6N2hwNlNqZUVlb3ZIR3lGY3JzOGN3ZmNBVGhFb3JUN0pmOWpmcVJveHht?=
 =?utf-8?B?RG9mcmJXdGxJaVROUTlNL2tjbnpaVFZ4alBFc1JydG5hMGJqUjlCaWRqVDZv?=
 =?utf-8?B?dUVBMXE4MWhBS3BsMi8zVE5YK3JudzRqNmhHemdxaGpQRnFQTlhSUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7e0b82-fbb7-4e5b-d76a-08df137a3a59
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9730.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 22:39:39.6715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNqT/eW1Cx27TRHKFXATox1ZIEwX+8d9OYGl8URMGcoXXjNac7hgNQTCnjnZVX4UW6a4PcViKdNtdEL1awIKXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8161

On 9/16/26 4:06 AM, Bradley Morgan wrote:
> CPU_DONT_CARE was added by the original listener cpumask code in 2006
> (f9fd8914c1ac) and has never had a single user, not even in the
> commit that introduced it. It survived every refactor of the listener
> path since, including the recent handler folds.
> 
> Kill it, twenty years is enough.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  kernel/taskstats.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/kernel/taskstats.c b/kernel/taskstats.c
> index 598d9cd83250..3997dbb5aead 100644
> --- a/kernel/taskstats.c
> +++ b/kernel/taskstats.c
> @@ -59,8 +59,7 @@ static DEFINE_PER_CPU(struct listener_list, listener_array);
>  
>  enum actions {
>  	REGISTER,
> -	DEREGISTER,
> -	CPU_DONT_CARE
> +	DEREGISTER
>  };
>  
>  static int prepare_reply(struct genl_info *info, u8 cmd, struct sk_buff **skbp,

Makes sense! Thanks for catching this

Reviewed-by: Balbir Singh <balbirs@nvidia.com>
