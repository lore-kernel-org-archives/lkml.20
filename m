Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794383469;
	b=bvsxuFRfzmbVpc1zcitYnZAW3iYFGtP8LVDQU1WsXrDhXR6U8l42jmoolVACE+sESQRW
	 g/1rMfYQYFtn958GW8Yz0cazMFAZvoCvRYmmLbaI1PAFrNGp9CKG/FDNY3YxSVs0PHCx4
	 GT1ox87gY98rR1FfHD4TGJuu4D9LeGilnhqkKcV9MV9t0VQTDKfp1302PuQ/ZyRDzzhwN
	 Et0t9iAsjXzHD8lfBI5xqXT2+B+aWeKZ8eMc8MEf38VJUpfFQGd+BRdW2CCEnHrUYFGUy
	 AeOD5nml3Xm7iCO0iXpLXl/iDanHOfgHP2F/OfpyBG3IGOAIKnBOLBhZ12akwPMV0ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383469;
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
	bh=EI/RohQs73W1grjxnOhx2FbqK7EO3ZJgn0jtmPCHXkI=;
	b=dHywxTEiCiMiFPTwJBNfAaEI/wcQxQe028tleV/2ZcSoZ97gelPM9EcDmr6SAno7XKdr
	 yRWh57B57jlP81w7NKBb555PhHEibo6QmKslU2ddL8J8ZN3AaSGRHJLU/bmX3zUA24Cs+
	 QTu/k0LDgoM80TvYvA0OzVVf3Lp8em1Ctxc5QfEIcHZQhur7P3RwAKN42Ijt4xfTzQqcv
	 O8Ij+orQK2FfkPRuZRJ1l1h4isA3rTmK26DxS/0bNxUmcLVm4R1gaem+J7iEOOSoY4Hur
	 ecyrClZp+N4R/yjRywpbi478DzCEmGa2Isrep9tAIur3u45d5C8zErojMP5evud1/ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ig8Fd7Qr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.13
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194FA606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 194FA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ig8Fd7Qr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b67wI3I7v8jW39TpvQEukucE9JpF9TYu7dZD/IXIipbpipqsYQnlcXAhZV66exkVCiJB6GZ5m0vyFIDYMYbUleIRt00/g1QhWhhHajVg9P8cIWCkVJy3ewVYNdA21bjg5ONjA8iRsNLIoVIoklrHZOPiJmOFYopZDOqnm9CQii/M7z7WE4TK7051JdfVV4Gu+c5Ge1eRquL3US++lYOEk3pF75LbLscN7fuBqRSRpQqQxauYAAYa1MfQB7Mlfwc0oVuhZP1XIZt6V9rVI1uNBPe2qclr63Yfy8lI8rH1v0pCqRNiAzblU6sRfin5bnqnEyxF2sEM7cDcTWWtGbLTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI/RohQs73W1grjxnOhx2FbqK7EO3ZJgn0jtmPCHXkI=;
 b=rJ2/A4Z+OxUUNqNv8KLE0GRfV2IXm8ey9My0Hr6Tep5C9V0JGKkQksI3Q6poNitDt2XwxKPvqK1vnO1mZM2FVdxMn0WFkqblT5y9Wc9cJR4fYeVhfLvU7+4OmDqohQaFhUzFNiZIqyvXzGDjSE0bRw5a8uM9S12AyAC2zQ2Kj9KaH1vXbgB654D+SqWb9gAeVbxNQrepAZErYWq8wnBum2M9/W0cdMOyqhjMyH2cwFFMmqqsZXzeP1KrNC16hSWNTuYSa0cwzZgOWIimBGD9gU1bj8kSXnzE7+3hFexRJgGM09igjZ09MQjhEid84fTg2jQ+EZPIeogWDSwC0sG6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI/RohQs73W1grjxnOhx2FbqK7EO3ZJgn0jtmPCHXkI=;
 b=Ig8Fd7QrSV8BGzvx9s/9cRKS/bciC0KEFs9oHznLRJZggny5cuI99xJJzYTXQt3PaR4RXQvq7GP9nXBAA/VxPCteNCFRpcLq24jfCWxpmq1RNxUuNq6bq92HTdYubx5XAOnn8dgnObJCBfgafr3xhBX/UFwP8Tj/wK8qWyD7+gE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CHAPR12MB999225.namprd12.prod.outlook.com
 (2603:10b6:610:2fe::11) by DS0PR12MB7995.namprd12.prod.outlook.com
 (2603:10b6:8:14e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 07:51:06 +0000
Received: from CHAPR12MB999225.namprd12.prod.outlook.com
 ([fe80::a4c2:82c3:da88:c585]) by CHAPR12MB999225.namprd12.prod.outlook.com
 ([fe80::a4c2:82c3:da88:c585%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 07:51:06 +0000
Message-ID: <f718f5ef-fe3f-464c-9472-e0f9af1ee0a7@amd.com>
Date: Wed, 11 Nov 2026 15:50:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT 3/8] drm/amd/display: Interpolate when reading PWM
 back as a percentage
To: Hugo Sales <hugo@hsal.es>, alexander.deucher@amd.com, sunpeng.li@amd.com,
 harry.wentland@amd.com, siqueira@igalia.com, amd-gfx@lists.freedesktop.org
Cc: simona@ffwll.ch, alex.hung@amd.com, mario.limonciello@amd.com,
 linux-kernel@vger.kernel.org, lohita.mudimela@amd.com,
 bhawanpreet.lakha@amd.com, dri-devel@lists.freedesktop.org,
 roman.li@amd.com, airlied@gmail.com, christian.koenig@amd.com
References: <20261103-backlight-curve-rfc-v1-0-6e4813a8f2eb@hsal.es>
 <20261103-backlight-curve-rfc-v1-3-6e4813a8f2eb@hsal.es>
Content-Language: en-US
From: Ray Wu <ray.wu@amd.com>
In-Reply-To: <20261103-backlight-curve-rfc-v1-3-6e4813a8f2eb@hsal.es>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::11) To CHAPR12MB999225.namprd12.prod.outlook.com
 (2603:10b6:610:2fe::11)
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
X-MS-TrafficTypeDiagnostic: CHAPR12MB999225:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 3840284a-40d2-44f2-7481-08df3fc88a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|11063799006|56012099006|261102123227099003|261009223027099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|10067099003|261028144727099003|4143699003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	cd3twBp5CgCTQSo3ENhsTfh4A+hiMKN24mLwrCReBSm/NETTUF9qxN2l55cfDXHeDZX7CFQnzjVPWLzsiYZ9Pldbbsp5l5Brq5XU8KmAlwCNAbZMYKhbQH3d5doR9MgKYAJkavOcLWum5GBUNZsPNTSyOFYipEpB+gnWcqiKqLOSKwMyPSDNcVrNmlvwTC5vsZLNajNiXIhYwZ870lJmnnRdrVAVulC3gDMA82akbADKmNZQhluW1ckjeZTth8ofvHD/xAUsV+kOhkD2gW3OR1dRw3MfzpLGpVfDdKCVRd0fdicu4mUw9q0HWXKePBkdUuABrVMA0GoXFV0TLATG2hTZZQZn/AtWTEwu/Fvv5TZTg7FGxt0LneMf19cfR3H91yJnnrTafCtUbmeJKIIEXA7+iuoZfF2UrcYwLRm9v5D+B8D2iv0LA/MoOqjjWpxv8rOAvJiGT+VS74HDMUhaJ92JPWMOBYeSsK+fEfdXndCMCFLyOJ/I0kFaskSwKncWLH7gt+xjP5sdMTzB1voGPHesRvbSn8TZhrGidg066Wv6IBeA/P/624lkHJ1oZ1jAJKhvtXDANBOGAEPoKO7hJPwuWmhBDEbYYdEkJr9y6MC7qh8KcUAt3U8Rn/cqe4rzKU0ztfKrGBZX8R2NrFXToxs60svYbCRSqoN3/bgZxlE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHAPR12MB999225.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(261102123227099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(10067099003)(261028144727099003)(4143699003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm5uSUNhQTlFN3hUM3pTc2ZhSDlxRkI2TEdUb1VvRVJvdlFsYm4vdFU2UGpw?=
 =?utf-8?B?MFJXOENENXViS1QwSXltWWp6dzY4UDVhM3E1Slg5NHVVTTRQeEw2RWtPa2Jz?=
 =?utf-8?B?c3F0eFJSWHh5QXd0Mm9BVWYyenR0VDFwMkNxM3JDZnVLYytGMUV5MzlXM2E0?=
 =?utf-8?B?alUzZk95aEZ5TVh0MUMyQWx1RmhiVmpITWpMbXhCTHdXKy9vWDJBR2pWbHUr?=
 =?utf-8?B?U0FwMzlnNjF0U3lwcW1JYzd1R0VRcmE2M1FkSjJ5NVhHSzdzcDVwUkJXY2Jp?=
 =?utf-8?B?Y2g1S09iRXNJSkczRzFWa3BiMUErRXJCRkFIQkFPTWVWZXlIMnVYZU1TMG9n?=
 =?utf-8?B?OHhCNnU0akNPZEhTdVQvZzJUcVhJNnZwRkdjREpEUElvdGNqT08vTFp6R0RG?=
 =?utf-8?B?SjhMT2tsMU1JK21pNjFoVHhmd1BEUURqN2xBa3g0cDh2SW1Cek90dlNsekFw?=
 =?utf-8?B?Q1NHdzZYa1Q1aENkcHVHZUE4T0lBdGtCeG1SSEswSGMvVjdlK01uUEVwNFBW?=
 =?utf-8?B?Z1g3bHFuNGhTMTF1Mko0MWJLaXNJbWFUaEpkZzRrYW44ZlFCYjd1YjNWSHNC?=
 =?utf-8?B?L21qNUxST3NoUWlLUzFIcnVRWjVqeVlFcnEvazRDYjdBUllzTDZxeUE2Vk0v?=
 =?utf-8?B?a3JkcS9yMCtHbFhmSEE4U2VNZzFNMXJyQ1p4SGtBNnhlcVYreGRleHhlTExZ?=
 =?utf-8?B?WnJWZkwvR04vb1UzY3VaSW8rZGJjQ2VhUjRBR21BUEx3NzNUV3pLZ3NYQTc3?=
 =?utf-8?B?V0NtRjV6T3haNHpFOUxnUGtoQ2MxZDF4OHgvd2ZjdzBldExJNk9qWDFXRTFE?=
 =?utf-8?B?dzlBLytDS1lHTFVhOXJtcDBKTzlqbjJpa1hyRHoxN0cyVnlLakJVY0VyWk4z?=
 =?utf-8?B?cGRFL2FzOXZ1RXBuZEhPU0ZkR3RwUHRUaDdHNldqUjRMcXh5WGRvM0VqaFZ4?=
 =?utf-8?B?QW9zQVdMY1R0NjkrL3RTUE5TaEdraG4wRURzaUpLcGFDSWRnMXQ1VWY1YXBm?=
 =?utf-8?B?ak1CU09TMXNFQlR5bGp5NXMxVHpuSTIzUXpJenc0Uzh5NlZOODUwdzBEeUYr?=
 =?utf-8?B?Y2NmNk0rbERnMW9ZQW85b3pPSElGYm94ZXZBdUlMU1cxMnZNaEI5b2t2RWt0?=
 =?utf-8?B?aTNtR0pxNjhVTkxDTW4zaTV6UW44RzNhSityU3ZFa1B0SkFqK01scXhjN1Jl?=
 =?utf-8?B?dlZXMmlLbENNTkZvcjhnanBIWU80TEFHZWNzaEFjUkhITEhocERlRmhGQ3dw?=
 =?utf-8?B?dHNSS3VHU1phb1d4WnR3K0ptWFduZ29teWtyMkVsQmdaWHRWOUxLSk1HYzFU?=
 =?utf-8?B?NUw5eFdKUkd3VExPNTd4elI1UjJXTU1HSUlRc0VNeGNQYTZES1p0Unp4NGMz?=
 =?utf-8?B?MUhRakNLdzZIYXd2Y1poTnpqSVRUNGs5bWkvZlRlbWl2U3Ntck5ldW1wb2dI?=
 =?utf-8?B?TnZSZW9GYjJsMWo2SGJoam5tRWNuOERTK3hjRFlyYXVIbmxrdFBOVGJNSDBT?=
 =?utf-8?B?VWNLb1J2cU15Skd1TWJ4NEtOT0Fna0V2NHhObU9NNi9wM0VYNHBZZ3hWaTk1?=
 =?utf-8?B?Y1ZrVTlnQWxQaCs5dHJHNlcwME9CNWVhaEJrMUMzM29CYTg1aWhpWkFpemhq?=
 =?utf-8?B?THRuOUtUcmI0NWpQNC9CQnNrZ2lKUVozcU5ZTjluUHZJMXdBSmN1UEEyS0ZF?=
 =?utf-8?B?azJTVDEzeEJWUklHMFA2RE16UnB4MU5IZXQraFZWbE5KTzVFUWI2SzhINXFN?=
 =?utf-8?B?Yko3TUxDbG1peStIQlQwVC84SGZNU0lMRFQzQ2xsbnFkY2l1Z1lRVDZ1V0V5?=
 =?utf-8?B?NzBLMCtEWVJJMGxCVGtiK0JRK09iT21RWFM4Tmo3WkJlZ1pMeDN3WjBwakhn?=
 =?utf-8?B?U2R4Rzg5NDhrcUNPeEIwdThpMnZCbjlWVHRyTUxiS3RyUUNGOFE5K1RwMzc1?=
 =?utf-8?B?N0EwYU9mQXpmOU5DZFhtbG9qTlJJRS8wMVgvQmlNYS82MTlIMnV0M2NBQW9n?=
 =?utf-8?B?UzlJWTNSc0dFcVZiSzNqNWRjdGdrOE02Yi93bS90NTltYnZzN0pSRUwvTXAx?=
 =?utf-8?B?OHhuOXZRNTBZRTJuZllBVXQxQUpCMVhpbkg3dG84TmZaWk5meWx0dHZUWVNx?=
 =?utf-8?B?S280aFdpZzVxMGt0eHZPUHFtRVRaYkNmOThiVTlnbXRMT1Q4NEJlcUcyL2VY?=
 =?utf-8?B?WnNIbFhTVk1IanU4K21PNldPdkhuTGNqYnlUdUx0WUo2NUc2OFJmY1pGUVhR?=
 =?utf-8?B?c0pCVWFRV3hDWVdrWnRKNmxvMWVpSHJuVXRYRTFuZjhmV2xidkJCSGl3UGF0?=
 =?utf-8?B?Z2k3V2h5UTBPYy9MNThzUzVKQmhsYUw3Mzd5VVJpVGM2d1dHMUFEQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3840284a-40d2-44f2-7481-08df3fc88a71
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999225.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 07:51:06.1170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHFNcGXfyqhw4AFRCKzXpcKHexOv8+ou2Bv3h77RoLxKPC3f3uohRMtmqmbUt8AYofAQQnq5NNBMv5U26EEhNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995

Reviewed-by: Ray Wu <ray.wu@amd.com>

On 11/4/2026 5:55 PM, Hugo Sales wrote:
> backlight_pwm_to_millipercent_legacy() finds the closest backlight_lut
> entry and returns its whole percent. That was the exact inverse while
> backlight_millipercent_to_pwm_legacy() only returned LUT entries. Now
> that it interpolates, a request of 1.5% programs a PWM halfway between
> two entries, which reads back as 1% or 2%, and setting the value read
> back moves the backlight by up to half a LUT step
>
> Interpolate between the two entries around the PWM instead. A PWM equal
> to a LUT entry still reads back as that entry's whole percent
>
> Signed-off-by: Hugo Sales <hugo@hsal.es>
> ---
> Converting a percentage to PWM, back, and to PWM again now moves the
> PWM by about a two-thousandth of the LUT step around it, plus rounding.
> On the GV301QH LUT, whose steps are at most 1799, that keeps every PWM
> within 1 of where it started. A curve with much wider steps can move
> further, but by far less than the half step it could before
>
> KUnit: dm_test_pwm_lut_readback from patch 6 fails without this patch
> and passes with it
> ---
>   .../gpu/drm/amd/display/modules/power/power_abm.c  | 33 ++++++++--------------
>   1 file changed, 11 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/power/power_abm.c b/drivers/gpu/drm/amd/display/modules/power/power_abm.c
> index d9c1f1401b604..83d79c20281ec 100644
> --- a/drivers/gpu/drm/amd/display/modules/power/power_abm.c
> +++ b/drivers/gpu/drm/amd/display/modules/power/power_abm.c
> @@ -409,34 +409,23 @@ static unsigned int backlight_pwm_to_millipercent_legacy(
>   			break;
>   	}
>   
> -	/* In this case, exact match is not found. Check if mid/min/max
> -	 * value is actually closer.
> -	 */
> +	/* No exact match, so on a sorted LUT lut[max] < pwm < lut[min] */
>   	if (max < min) {
> -		unsigned int min_delta;
> -		unsigned int mid_delta;
> -		unsigned int max_delta;
> -
> -		min_delta = (core_power->bl_prop[inst].backlight_lut[min] > pwm) ?
> -				core_power->bl_prop[inst].backlight_lut[min] - pwm :
> -				pwm - core_power->bl_prop[inst].backlight_lut[min];
> -
> -		mid_delta = (core_power->bl_prop[inst].backlight_lut[mid] > pwm) ?
> -				core_power->bl_prop[inst].backlight_lut[mid] - pwm :
> -				pwm - core_power->bl_prop[inst].backlight_lut[mid];
> +		unsigned int lower = core_power->bl_prop[inst].backlight_lut[max];
> +		unsigned int upper = core_power->bl_prop[inst].backlight_lut[min];
> +		unsigned long long span, den;
>   
> -		max_delta = (core_power->bl_prop[inst].backlight_lut[max] > pwm) ?
> -				core_power->bl_prop[inst].backlight_lut[max] - pwm :
> -				pwm - core_power->bl_prop[inst].backlight_lut[max];
> +		if (pwm <= lower || pwm >= upper)
> +			return BACKLIGHT_MILLIPERCENT_MAX * mid / max_index;
>   
> -		if ((min_delta < mid_delta) && (min_delta < max_delta))
> -			mid = min;
> +		span = upper - lower;
> +		den = span * max_index;
>   
> -		if ((max_delta < mid_delta) && (max_delta < min_delta))
> -			mid = max;
> +		/* LUT entries fit in 16 bits, so this stays far below 2^64 */
> +		return (unsigned int)div64_u64((max * span + pwm - lower) *
> +					       BACKLIGHT_MILLIPERCENT_MAX + den / 2, den);
>   	}
>   
> -	/* No interpolation, just take closest index */
>   	millipercent = BACKLIGHT_MILLIPERCENT_MAX * mid / max_index;
>   
>   	return millipercent;
>
