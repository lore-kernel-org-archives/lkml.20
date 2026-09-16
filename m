Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62EB4BC016
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553877; cv=fail; b=bUzIrEtBC8+gGrz4vbtlHB3hw0sfM8iMxG2xmmxAK6vK3WlpBKEff/vI5AwR5XR4ViPVcXiEfXyeldoX9tGHg0+va6aOSU8ayf/SVA1SDsYn0/EZwMWzHqE6GqRxLZCxfWdAuPllNZQr0KQP+fY5D7oOsU158DL7ZSMvOylZBko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553877; c=relaxed/simple;
	bh=fD+KFqBqFcyVBMJYiGmWJ72j9c1yaZrQDUZK4cj5WM8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VteklM6IUss19xV9ATuj9dhEwvk6/FNMSWV7z5b4GXwPBR/rtCKVjC5lDKehkpElT32TEM3VH0jySmIYkTc2FSSTuyys1wyMZjfHimh11vqoI7Aed+niQ7m/QvnLzOk3x411edVDHE3ySJ884flvcUlNcF53b9Hs1KxTTSYYjsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FroqEX9k; arc=fail smtp.client-ip=40.107.208.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FroqEX9k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAmgVKkKaj63/tmp5Hpo9J3gQFl2/WDCvikDlFdqQlLQoUcxgIgwSYKlPWa6oKBT633Hez48MYSpXkyKWw4XtQo0BhAIkz1a+xcNtg/sbdeDTmP/wvlQZkPQSNv8cxiN8UJe9ilSEW3TpVcMMgJYnNApPv26k1mLbJ9yrhV2tkPz0kwxqc38uM+iacfpWkbHGShPf1xBINhsNeliFi54ixzzw0MZCOoclyzAZ0rW55P7btZ8oQ7qcv5o/eute7tmmiwPqdZAna1dD2WkscLwn2dMzSATPSfIhanuDfbUYWKqe7dWm7cc+VQyJICRjQCsTN/rA/2IUnPby+Sx+P66Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHJWYA3I+EzTu7u2Fl+zw20q1Q93DGqR2K/VtT8sMJA=;
 b=uw7AzrlymsL+zh4QV+7WAd270T8JfuCMrPJAlXHPfPSVm4bpsf3x9EcyFaC0Dpr1nJ1SsGHdiV8aqWz6jDxkLAG3ooVEuGdY4NN1RiCXUxad/IZI1UJrXj8SohZziHCcExfugObKM10n4/CQQHq3YnqoFkh5Ke0o5ZbuC8Q4aNa3KQUeTgMHBvCjx64NyByqt2jcD5hRgZ63zMkyEv8w1LiY4E9ewVdig+4ZLtS0iIIU9uJARB/LxOeIdbHVUko46A/4piE/GmlIpXCYu9v2/g+JmWi1cWpQziTtKsF69HUGF47SuWkWGgIUxca8MYQwyEWwhLbpxeYHf7SNbzX7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHJWYA3I+EzTu7u2Fl+zw20q1Q93DGqR2K/VtT8sMJA=;
 b=FroqEX9ke0XEvu1dGdGvUwoHNsyPl8I+dsSKB2imq0Mh2RhmOy1URgAzBNk9vyuZiTvItypvbmpmiV9r3r2o8eFfqc1LMXAkm+BKgvfS9HDaM7PkKYv1GHpRkuj89isJ9JE4IJdq4wiEUWT61YM8/HFloi0WmJDsSLQtcAGmBs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5039.namprd12.prod.outlook.com (2603:10b6:5:38a::18)
 by DS0PR12MB7779.namprd12.prod.outlook.com (2603:10b6:8:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 10:17:36 +0000
Received: from DM4PR12MB5039.namprd12.prod.outlook.com
 ([fe80::762:6408:ca99:701d]) by DM4PR12MB5039.namprd12.prod.outlook.com
 ([fe80::762:6408:ca99:701d%4]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 10:17:36 +0000
Message-ID: <73950e42-2104-4a2f-a43f-79f4e8cc0fd1@amd.com>
Date: Wed, 16 Sep 2026 15:47:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: change TTM maintainers to Natalie and Arun
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 christian.koenig@amd.com, ray.huang@amd.com, nat@pixelcluster.dev,
 matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260915154804.605772-1-christian.koenig@amd.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20260915154804.605772-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To DM4PR12MB5039.namprd12.prod.outlook.com
 (2603:10b6:5:38a::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5039:EE_|DS0PR12MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: c64549c7-03fa-4ae2-acfa-08df13dbba98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	u1/5CtGym0x7Je5LlyA4Wwkgff5W0gsScDMmbxM8I/JkGAgcQFbi8K7ylj4Vp4YedFArt/bINjk1EQoKqqCXIiQTKKGvhiw1JKi6KcntWiHtkyzbsYRlsTK11MYeQjFIj6B3KxzhMShhGeB4OrYujSergLmc0v6nSrLoiwfpQYHMVKpOUfvc+WJnGW3rcgdzqU2pyTMDgfSLw1PU3rndat+fLCLpX2Cx7IEQdRFUry9EHqKS9w/5qe694SaoyhwG7gjWrsMhQonrgsGYrCj8k+UCRD+9+23H9rYiqRS/JXXfWq06Np6P0+83octUbcDx6cKXd1FuzdV1g1K+6CIPNLyOMMyEtWUXhqI4wwYHk4JF/YWLLSk6qBS39rHtwlhfkf+wo7zP9WZsPWaj1RUUMlcLjgmwheZmPlP5m4aTKQ526Ii7/xxjiMN0qW1+W8Co5IUBYs5VtOV6ZNn4mblL8/7Yco5NKdqvoVw/97wnrKT6Zz4N8dWyeKpxa6BQKTESBzYpmNsaTMhjhFlkwkd9iQRv2+YOD01sg5G+sWNfr4S8B25nnm8SQoG0J5JnQAPnnJcaXtQi2MCuD90nYYHIpzRiJ1NAYc0xZ3rmRTzr/fFZmsCNEiEZ0372E6Wj1gza
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5039.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTNzYkhjVHlsTUtOb2wxUit1UUNMODZUbmhMdmx4aThiU0djZmUyd2FJWGxh?=
 =?utf-8?B?eFoxc0lac2toS1A2bXlFOXBMQlVWTTNjTGhDQWV6RTg3UWJ0UXJJRTR6RzRS?=
 =?utf-8?B?RGJlS082bnJkV3kzNUczYkZxSTVHWllmL1FUV081V0IrNVNHMnVoSkRFMzY0?=
 =?utf-8?B?dmh6MnQ3ZURQdERnWkFRNktETTd1ajJ1MURkeVdVaEk2UUpxZW44TS9ud3VV?=
 =?utf-8?B?NjV3ZXN0RncrckFnMDJVb2VkQ3BoeG5nNG85aThGRFlMRHlkWUlDVXM0TEk5?=
 =?utf-8?B?OElSd1ExREdQckhCTVpLVEtzV0hocDlNRjVyMjJFeDZiL0RrVzFGY1QvdHRa?=
 =?utf-8?B?d1ZhbGlpbitaM1puNEpQNDhFc2V0YWh6Y3RpSjhOSUlrRVNoamExbngzM3Ru?=
 =?utf-8?B?Ty9PaTdxdmlKNTdnazNFbkt2U3NMcnYrZndFMENxSWtUNnVWR283aStCcmR1?=
 =?utf-8?B?T08ybFh5V2RRUmZ5ZlVRdUtqMlRFcEZzNUh4SE9lalh1UlZ1YVJJNCtQV0JY?=
 =?utf-8?B?aTJ6eldsYi85VGZKbi95RDlRZE5KZUk2Mlp1aUNkWFoyZ1cxaW9SS1NlTjBa?=
 =?utf-8?B?Mzc1TWt0MnpRSU5rWnpGRG5PTFlxM01nVC9KaTI1elA2U09DWXpoK09veEFh?=
 =?utf-8?B?am4xR1EzTDM2clpOWHhsNGVDQnV1VmdocUQrUzByeXBzK1BoazNIQUxMQjRy?=
 =?utf-8?B?Wkh5UEZBa1pKdWl5QlN3OXRHVXFFMW9BTjU4N3ZiamxhT0VHVXBmaVBIcENw?=
 =?utf-8?B?REw2emVEcEI0bzlkNzlVNGU4bGptZ01WYnVNNmZuV2JZTkdDNWVUbkFpekh2?=
 =?utf-8?B?cGYyMCtIZzBhSlRnL3JKaWZNM21GUlpzN0R5NTh3TjZ5ck80dVZsOXY2THpT?=
 =?utf-8?B?OHZET0RaNFZIN2J5WFpZREhRZGVldnFBbTFGd0hwbUJOZFFScXFiNVZ6bnU0?=
 =?utf-8?B?RmlkVERHWGVqUFQvdTRXZk43M1A1eFZXNHFxbER0NkZzT0RHb1pvaUVaTSt4?=
 =?utf-8?B?dG96Y2prTUs1TzR3RS96N3dUWmVCREtjY09nTVBkb1poMUFVZm80TVJ0NWVX?=
 =?utf-8?B?YUtOM1l4SnZIaWVJMlFYK21La0hPdnd5RlRCKzBZTVBsNHJUa0ZNaWl3OGxy?=
 =?utf-8?B?U1JUYWN3TmNYejdmVjNWVGV6RTgwVkY0dVliL252YXJubnFJQmVjSkhHWmFU?=
 =?utf-8?B?TEhpTjVNaGMxSy8xUHIzR3hZWkZ4M05WYlFkTnM1dWtocnlFQkRaai9NL0ZD?=
 =?utf-8?B?Vi9LRmFJL0dudGgzOG1YUkJDVk1xNXBaRXpFT2RCY3RaeUFVVEU5Q3BJYzd2?=
 =?utf-8?B?a0VMU3hLYkhnRXBVVkVMay9rRURweXZvQWVSTFhpUkRNU290VVFDWkp6SWZP?=
 =?utf-8?B?aFZiYUxaK3lHb1RxNWZCSlJiMi9Zbm8wd2YvYndCM2JCOGgvYVFhdGFUbzBR?=
 =?utf-8?B?VzVMRGx5VldzZkM0Wm1GMmU4TnZML2YvdHNqaStXVGlNZWUxak9OT0NVbUpJ?=
 =?utf-8?B?MnBkQzdadENqbXVLWUlLcGh1dDlLTk5TRjlYVDRLa09rR0VoeW53UDY0SzVm?=
 =?utf-8?B?bEI1MHVrdklJMHY5cDh2OWtTR3ZnclF4RkszRUhUei9lTFN3WC91M2x0NHdB?=
 =?utf-8?B?NWdjQlRidTZFNVhrY0tnRk16QjkyZ0Q1Um5md0VXbTFtekE3bjZva0djUVp6?=
 =?utf-8?B?WTRZaDRndXF3VS9ZMXhia1NvTCs0cU5hWVBCZ0xaWmF3bDhFWmlKdEdKUWVF?=
 =?utf-8?B?QmxBdlFzU2VSelRxWTAvOU1OSUpWK09hVzJEei9FNHNPSVhPTUY2RmxsTUtP?=
 =?utf-8?B?Tk1rcUlTZWptS3ZOKzJuMW5VM0JZNG5nQ3lwcTBTWHNpYWQ0cmhtUml2anBI?=
 =?utf-8?B?eUVNcTdkZ0cwVlZpdnVkdk5mWi9TTC9WM0pObzluall3dlI3V0JZL3VXdk1J?=
 =?utf-8?B?Vnc5bUVyT0JGMDNsR3V6elY1bVdKOFkxS0t0RG9ueDFzMkllNnhxOHBSNjgx?=
 =?utf-8?B?MHRid09OUUp4Uk9BdmJoK3laZlUvTitVcXZ2Z0tCa0ROeUowVTBDOHVHUDh1?=
 =?utf-8?B?ZWl1blRjZUNFbmIxMU1saHI4cVVJN04wL1Mvc2Yrd01kRytWR3ZubkdaMUtn?=
 =?utf-8?B?UHBLZ3lsSDZqMGthVVJjSDFzUnRpTEtWZHozeXVDTW5qQURtWDI0d1JoL1d5?=
 =?utf-8?B?WlFNQUI2YnMrKzdzV1BXRFZOMEwyV215NlErSHhSUEVPTzFTYkpDMWo1Um0v?=
 =?utf-8?B?QUZTSjQzVzQ3NFRGdTdCZmg0UGNsa1A0Z0pLQVNKL05WcXFxZzlWbXNxVVJ6?=
 =?utf-8?B?SUF1bER0QWNTRUdJcGVNZHdvSi80QzNEbnJ3MGZwUkpleTduTkk5Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64549c7-03fa-4ae2-acfa-08df13dbba98
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5039.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 10:17:36.2788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90+0dxOMhnkTLiJ0Um1yJpG189+dNDFRBtdtSrgcFZw0wrxg2ZYerZJovBT7fO4RZ05gAqSBSg5zJn5iAagmfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7779



On 9/15/2026 9:18 PM, Christian König wrote:
> The blunt reality is that I don't have time to look into patches or bugs
> any more as it would be necessary. The same counts for Ray.
>
> Natalie has been working on the dmem cgroup patches for TTM and agreed
> to take over looking more into TTM.
>
> Arun is working in my team and already maintaining AMDs VRAM backend for
> TTM and the underlying buddy allocator.
>
> Add Thomas as reviewer as well, better to have more eyes on that
> component.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   MAINTAINERS | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b5a4e4b35cf..b6e58a138501 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9140,10 +9140,11 @@ F:	drivers/gpu/drm/drm_privacy_screen*
>   F:	include/drm/drm_privacy_screen*
>   
>   DRM TTM SUBSYSTEM
> -M:	Christian Koenig <christian.koenig@amd.com>
> -M:	Huang Rui <ray.huang@amd.com>
> +M:	Natalie Vock <nat@pixelcluster.dev>
> +M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
>   R:	Matthew Auld <matthew.auld@intel.com>
>   R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
Acked-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Thanks,
Arun.

