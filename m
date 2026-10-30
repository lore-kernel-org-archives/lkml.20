Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793352788;
	b=tkoKmOrXv3pQm3yyyAU+gyGH4aXewXgfitVnn94Gl7IM1tavgklTedIM8hJbIgVYbL39
	 tJfKA00sG+SfKi8IdzQDpUMVUPrBssq81mwfPn85me90/a+6AgBNb6qYhnQ4mu/KQkYLk
	 5aKAbiYbAsZD/4I7elO9yUVlGn2I0eVl5KQQzASK4KHuJ25/RJRIreIWkY+hSNXPkv2IO
	 B3jd0ga6nJVF8f5L34wlqDRxmoU9GsgfrEbsrpTzV9uMCC7BQ+wIjs4efl1EtcJYbgnwy
	 6w88peM1BRGfK+XNLbnjF71IAAEAvIvKA2+ZoeiV1VaYinMeWcx7hOsw4daz+x4zkAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352788;
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
	bh=U+KV0j3iNaMKKfU3qtSvTeLayHOWIjG88Jc76RWfYC8=;
	b=aFKxYjx7v542QpvJ8Y3RDxH9Uy9l8jbzL90JYwwZrFu/WdiZc1oQ+XXrJWSJUr3TVd1O
	 m+xgj0eeqfMSyPnyI9ewpxEgSQ2C1arBABwlHj4mznEDNG/jm24JEympC/9K9YEMwvWga
	 V/ZiPgcnxKis3QQEZaeO5c/J8WymRi/sclu4rtC8BB2OKPE9HXe1nBpZ/dpMYeGvCGk4v
	 6MYQhh7InRRm7bp6scbX4MceITmztTa4kwrlqvwFPUzbYPma4To2yx/7eAuNk/2aGJdrb
	 37L1ZQIuCa5mNb4ZUTVSRAjHduP93TuPRPeSTyBgPXXJLwUO+Ejk3j8j8Wtokoicf8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=X3xtxSyC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.3
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F22B606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F22B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=X3xtxSyC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mO3aaJYJk1FRjVoAS2gToSGvrsE5415Owb3UbO8zAaL715ZMjZonJAeOZmeSJWHj1O12SlPr63m63zIuuGRurJ/cJ+N6TI+dzuoFHbS5r67xcbhjS/p/fWlYiTVgyvZCBSqBujH2iYIi1MyuRYM056YuuEn4JEZiYTv4YcTsj5K+UwITHEk+Qg9coeDtco3jlXmreO1NP3AHuwi7cZVT+5aYuruvuhYak/GF03LTdRhHCsqm2f4iVwpaY9O/cSFNclE8BXW+xqCtS80k01YdaEdTetrjE7n4xjQowYtL45NzDdWCFio7LTzJQ6C25WZjCPYOwFJNk9J3np+cw56NiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+KV0j3iNaMKKfU3qtSvTeLayHOWIjG88Jc76RWfYC8=;
 b=tj4+h0jb6Lx7Zc9CDiUPUl+uMFQ8LslkfZJxVxWigSq6UTEEsEwcyqrcRy8IWBueNTnKNH8/PC0glJVhyuMtzrcrnPV5x49BzXOwlAw+rqt/V3Cscb72qaC4qHnbD68dPdp1iySjp5V4O9g5DJptOvuuVsvMxoYUqrVi+9it6T2SX1Mrl2aliXHZr6GqLCBKvgLuxOPh7+rQSPxu6y9bs6xX3tYi/eMibToC7wmfd4Dfmw8livifcd+8dhryYUnX13XuPBE+3lrucZD+5Oh3KSicL7rxVI3PJRDdA0C/ldUC1yY2E82lDesA1JYBahN/OiA7suVQQjKlE63YrQkm/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+KV0j3iNaMKKfU3qtSvTeLayHOWIjG88Jc76RWfYC8=;
 b=X3xtxSyC7nq8Ns5kRZSvEvay9sAfeOiUDT5z9AMBVnluc0IPrmFrv06Lte6rCbRt0biycgoP9FFVOQwoPU/KOLWULw34bzMtYsXr59WaXNy4NakZmigtHQIFaXt4z/2eLlynKm7E8sSe9aZkN1og9up+cAgMjV3nAWVqcrHcTN8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6174.namprd12.prod.outlook.com (2603:10b6:208:3c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:33:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0546.021; Fri, 30 Oct 2026
 09:33:04 +0000
Message-ID: <232b1eaa-f100-45b8-abe2-11cc5a30e2eb@amd.com>
Date: Fri, 30 Oct 2026 10:32:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/amdgpu: fix NULL deref in error path
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261029152000.22001-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20261029152000.22001-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d750df-421f-47a2-4a42-08df3668cc4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|10067099003|261021123027099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	3lfTLrsDRQkMEBWhJY5mis3x+eIAoZfXDOC7vRXIiqkHnsqLEi51mYA8vkOh6LNjPICDxo/4w3aPKgW5CgF5rQL3VHtxSzvEjuO5w3UeiAIU4doUOEh5CiI8r1TEgP5b9vzH/NcSLyT2IdFVadW1RZv6qbysxUu0KQOyhfTumUnF0jvR+7i/5CeEqhvN3kU8BQXQKKrxkw6dp9up+qfip7Cm3csc8A/3DZ/NhsloT5wJCn6ToGsij+QpoeXCxOL8F+8zmQysSQxLkhMgt4EEFdRG2qfXlAAuE/995Smb/hJHWthpaKiUkjoL66zxSlvepfHHRc4G3R0+vVerC2Hlm/qFqRNwbNiH1NWv1CM19/+bQsfuwGOIMmBEAWcRZa2zY3ymHszxFdLyCwLZ8+LZLRR5vQyPQ7yYYNC/oUxWWCfx6w2BSGvjF7JM1R/Pf958wnOYoHzfRpY97Zwr4tBmvwLkVz3C6nrQWpUaGJKsAa52MJa47Wn3ioEXGD5G88DD7CRgUmuGZJE5wJMDPWmAUUAER5ksB98q6jqDBwkajCjXszySBaOFsYHKa3erReO5l7w+CzmkgRhiZ00Xjrgza+jEDjM9hvdv2ukN8Wc1/aMY0ow/f0DEKaC269rlBcN8lRzGI6lpkqMvUWyyn0HqsTPhKwal9y+fYKiuODfkRNE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(10067099003)(261021123027099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVV6eldYRTBFQldIeDV2bGI4TzZOZWdJTG1uKy85dTROdXFpaGlkZk5pQ2Nl?=
 =?utf-8?B?cy9kWXJ1R1JJQWVncExNdVU3VGp0MHp2UWtaUHZKTXB4ajU1ajZCMTNqL0xh?=
 =?utf-8?B?WWlwbXdyVUpzdTdZUy9zV3RiMmgyQnFRZUNQc0pqOWV4cFdTTVdkQmRsRW9B?=
 =?utf-8?B?amdEeVFPOHdQY2dEY0lHaTJlazY1TW1wRkxaVFQvNTF4RkxaREw3dEp2OU1q?=
 =?utf-8?B?bkdVdU91OXg5R0xjWEoxSWNhVlRhTERZQW9TU09Memg5NUoyaDlmR0lBL2xi?=
 =?utf-8?B?cFlpVWxIRnQ3aDF3bzV1Z0xpTkJyQis3MGpvL3lMdTFBeHRQU21ndVliSnlD?=
 =?utf-8?B?djI3S1VZNEdBSklPK2c0UUVzbWZTZjhGZ3NqdlFNeVQ4MExVcFVBN3hBditq?=
 =?utf-8?B?b2dZQ1EzVnpQRkNYQVRHbjUyZUpoUzNFSHR6RDRsU2JlYlR1Ym9NYkdDL3dR?=
 =?utf-8?B?MHNDUnNrNisvYmhFMGh3dkltcEI2cjZ0NnNkRjlLY2dZcmpYRzYrNVN2L1F2?=
 =?utf-8?B?KzFKTVArdi9UaFB0dFp5bXZldWM1WFhoRlRGeWVBdThZby8rNkkwQmdQUzJY?=
 =?utf-8?B?Njg3U3ZhZ0xxR0hHUFQybUlBTU9QWjZiYVBLR0ZlK3VoMWE1cTUwcTZoQytw?=
 =?utf-8?B?cDZIU00yMXJQQlRHdFk3dlp4akkwYkdJem52S0UzYXFYczkzTEdoTnBqdFJu?=
 =?utf-8?B?N3BSY3l2NUY1WW94L09reTZzd05IUUJEWGJMSlVYeUZWWFYwbTVzenpXNzFW?=
 =?utf-8?B?U1hjWWZaUGd0d2RFRE9hWXk5WXBQUXR3ZlZvZkpCRnFnQlFWekdVRU1QVW5T?=
 =?utf-8?B?ZTRLVDJnT2J6TW0vVnhJS0FXdnlWRWtPSEgvZUk5ZDZKQWpnTU9ldjA4aU1h?=
 =?utf-8?B?YzIxZHdiMm1GUDJVTHVJUUNYb3FQeDZ6aHVta2NNWXA5ZFQvb3lQWWdBRVB5?=
 =?utf-8?B?RGlldmNFaXAxcU9BN2VFL3BNVVBXUmYrTHJLbFEyL1hCODJ3eDhrNzAwblBy?=
 =?utf-8?B?M1FNQTRwUUp6N0RqTW9mTy9idm1jMHA3SWxMWlFZdFJGQUo4cHBJenVmTk1l?=
 =?utf-8?B?R093Q0d2alFELzhncDVvY3dmZVgyOTU3SUhtSnRkT090UHlNM3BaQlpaRmFa?=
 =?utf-8?B?YXhla2RJNXd5bGcwZkNBdU55RXdsazRPNkI5ekEvTHExNmFvZm91YVBOeWpq?=
 =?utf-8?B?c2VjaUhwUUVPMlFKMVN0Kzlsd25PblowNVI1dWJHVHZYK1VkK2ZrODJBenR0?=
 =?utf-8?B?dHZoRHc3a2hvUDBONloxbVhBUUx1c01rbWtTSGpWQXEzK1VFSUt4REI0NG9C?=
 =?utf-8?B?MUdlMHFJdE1SdmNibnVmS3QrNTJ6Q0tXOVowUmFPTllySlFWZ011OFpHcWpo?=
 =?utf-8?B?VklFbVZRYzdmVE5lWXFNUWRROUFPL0JxY1F6VnE3WElpMk40YnJJU0x5Z1p6?=
 =?utf-8?B?Nnp4NHlScndPRVZRT3JJamtjQ2RvL1p1SU9PUlc0MEVRdVJvSFcxUjRBbEtM?=
 =?utf-8?B?MjU3WUoxTHVBU3FOaTlocEFibW8vdUQxT3A1ZDNIdXRBcWp5NnlZMXMwY3ZK?=
 =?utf-8?B?QlBWbDBUU0lzbjhEaG9ONGhoenZCYUlCR3ZwNWxFQ0E0VUtLSjZ3T3dTcWc4?=
 =?utf-8?B?dEsvWHV0OTVIdUt4Vlo1dm5MY05iRDNrb3hJRW9VS04wOEREL0JFNlhpL2or?=
 =?utf-8?B?bWhVV0dPK2JObkY5VVZIUzRrK1hrRkxZQU55cXhZb2MxOEd3RVhseTU2Ujh0?=
 =?utf-8?B?OXFnRDc0UnQ2cC9GdXRSWjFJVXQvQWkrQkZUTTN0bE0xeENvSktYaXZHWURE?=
 =?utf-8?B?b0ozUElBdDA2NUJIcmY2amNPMUFRcGhoenkxU3VKeFdxelM5WXBvTGpMZkxv?=
 =?utf-8?B?QjJYVFd4d1kxNnphY1c1dEpMTG8xNFhwVmFyeTNOcmRtTUJmSndobWJVWTJ2?=
 =?utf-8?B?RXlzZHZ0aThNczBQNENDMDN6Sy8yOEJ0TWl2NFBkek1BTGUwWEFZWjZ1TUtv?=
 =?utf-8?B?d1dsYVJla290cGdZdFNEcW5QYy9mbWFKTzRTejUzRU9vUlRpaENMK2NOeFo2?=
 =?utf-8?B?ck5KbDRkcDBkd0xDT0xpbUhXOU5RNW5pclU5d2w2TkJudzZrWWEwMlZsR3cr?=
 =?utf-8?B?bUJ3YjU2Uy9lRThCVHpTT2RUbDlHVGNUSWc4VWNzTTlWL1NGYnl0ck9SV2RN?=
 =?utf-8?B?cWNrTmRCaW42dVBURUlRV0JVeHdxUE9FQ2RLY2lvVEQ5ejd0ZHJtSGphWEJ2?=
 =?utf-8?B?T3RmVGNyUTJHM1NIOW4wRkJyUHBjV0dJcitKTjJjaGtzWVVlVHdRMzJ3WVhY?=
 =?utf-8?Q?DYlT25E56QUwjr9E5Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d750df-421f-47a2-4a42-08df3668cc4a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:33:04.4769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQj7TqAI6Toub518UXr49MmK8LjIfWAtvTxPnB6Ncz/I1YhRTCg/7wJtTzgJJ58V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6174

On 10/29/26 16:19, Pierre-Eric Pelloux-Prayer wrote:
> IF we hit the "error_free_root" error path, amdgpu_vm_pt_free_root
> is called which will clear vm->root.bo so calling amdgpu_bo_unreserve
> will crash.
> Since root_bo is a reference to the BO previously installed as
> vm->root.bo, use it.
> 
> Fixes: 8473bfdcb5b1 ("drm/amdgpu: fix error handling in amdgpu_vm_init")
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

IIRC somebody from the community stumbled over that already and I already reviewed the patch.

Looks like it was missed to be picked up to amd-staging-drm-next.

Anyway that one here is Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 000c982816a7..ea8688061237 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2716,7 +2716,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  
>  error_free_root:
>  	amdgpu_vm_pt_free_root(adev, vm);
> -	amdgpu_bo_unreserve(vm->root.bo);
> +	amdgpu_bo_unreserve(root_bo);
>  	amdgpu_bo_unref(&root_bo);
>  
>  error_free_delayed:

