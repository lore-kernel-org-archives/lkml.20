Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793887982;
	b=frMNcRwkOp9uM0ODz4dbuPO5bLl/acH0zcDWTGg5f2qStOGw4Khwg0A/6MTTL+yIwOCo
	 D+algnfxaOF+A/5J06k4ZmGy6kVv6p2L6GAFbN15qaoCrfa6Iq1hHJLAI77e3I8TUu3OG
	 9kRaztvKITwLemBEaBv8AuoybvrXGAE2tpFuOWr9QoT6GRvXiQqyQFTESmMF3YxUpRjW2
	 azl9pfmGyrEK1DcDn2DyretjsyQWyVIW7aJASRHxR9QOkdWPAGzveVP/8dM3d8SifConi
	 e/zkaA/w89vM4cCuvUcSOAHr8uSsbULGeeljAhZ982XcWOTbNoZ4BJPwNzJKyTPb+Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887982;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=agzWDMOmhiyGb6UUDkf8ob+vWVYJD3FA4nRyMz+cGto=;
	b=uWifb2SHU+6/WbqJqiRHMHXGMLUJ+eAMQHIvEj7StnxIA5g4fRz2K2LHMoyknZapuXIk
	 op2mXLUt4iHKGiEdJxSxbD99u6hqpSSxmgpiKEHkBKg1Vmv1TmabocWGjaIiG2KiwdIdI
	 O7AvVEGebvEqLlZg/OWhYga+yjfcS960ewDGyt8o8QJb0Cy1B/is8OOfpiKDF8RCDTCDf
	 imVOz80edYKbRqJ6rX260EE/3X5nsGT+i/Y9V4UFvQS3hxk7M2oDw568Kbabgu+6XtgEE
	 rwEmIhaPsHhCjl+bF3py0dOI4wElVqK1El00PmEYqAZnDbzzIYrMtlUSG70n2IHUM4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hOIolqLg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.65
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013065.outbound.protection.outlook.com [40.93.196.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A021606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A021606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hOIolqLg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjMPbq2aIS5Mf9UfOq/FOLivSl38OlB17B35JsKWwAUKU/DqjyHcCEN5ZDtV3unv0HaZKTX7Ne+mr9GgDPTQfeZJXF4YM6QHkwaVNROQjN6JSH/QCckN7lwmeom/G0LsCcT+CxhWZHX315vLNMgmtpJOwONXDIPx7Z+BE7uUnp/1jak854eZqGlJESfOZoc8yUBbH9hUyTWdb/rhUcRGSO5dS+bp08KFn+3A+5s6dxAruwYzhCq75HAqK4DM6fBjxRJyah+Fn8/5u68tbLXnI/71VtD0wSLy70j0MAKsvGaQ3LMpRGE7SSTD2vaI00IjgbrS8nWpZnxu2+FYeSkccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agzWDMOmhiyGb6UUDkf8ob+vWVYJD3FA4nRyMz+cGto=;
 b=a3xRMVuuKkz4TOPdAJ1+BeG6KJIoeOeKnNQc/XjsdGfKMp58WEIMMZ40yJEDEaJfQ5+hDViWlMbJRPKzq/Rg7Ki7rkuee3ab7524lO6jf+nIeAo3FATii8gBEw1qQyfSJkQjxtTQVDbcREnyL6wX+M3soEy6NZsW9XPkQ/byO7BlciK71mDD7+a4DlsI5By/F9oNzIZp/Jfx4alA2Jxk93HDMoROs6hPLr9D2ayIfRYlRKZiXuizRFIDKuuZ0msdyITDiAY/WUFGkgdI0I/XMCUFP6+BPGw+swi0RsO2IY6/xKHVsuMW1fYTuGeamByQvrUsf4EWYtRFzK1hTacgXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agzWDMOmhiyGb6UUDkf8ob+vWVYJD3FA4nRyMz+cGto=;
 b=hOIolqLgGYldE+JJ0sSM8aaoJ6/V7ks8rWLEsdez8t2r+zn4pbb+BAvxtCS9rdBcP0u47xQBTLBzm/csZKKtIAjJHBt/23ND2KWXRU4WggGYZnWu0tlXn7mVsmfirmd2od+sIoItvR9niLa8hdkGQh3Mxovtky4I4ahEirYxTP0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by SA0PR12MB7090.namprd12.prod.outlook.com (2603:10b6:806:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:12:58 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 14:12:58 +0000
Message-ID: <0d8720d6-97b2-405a-a97d-d4c78887c431@amd.com>
Date: Thu, 5 Nov 2026 08:12:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] x86/boot: Fix off-by-one error in sme_clear_pgd()
To: Thorsten Blum <blum@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Ahmed S. Darwish" <darwi@linutronix.de>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Andreas Larsson
 <andreas@gaisler.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
References: <20260918142714.242711-2-blum@kernel.org>
From: Tom Lendacky <thomas.lendacky@amd.com>
Content-Language: en-US
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20260918142714.242711-2-blum@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0111.namprd04.prod.outlook.com
 (2603:10b6:610:75::26) To SN7PR12MB8131.namprd12.prod.outlook.com
 (2603:10b6:806:32d::12)
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
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|SA0PR12MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 6629e48d-f9e8-4c97-2c84-08df3b46e4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|921020|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Jcn0X8sDbvTFc2N5Y5hk+gqTDWQnESHB2FMzPt/6lJk+Gv6I5101A2cI8g+cUUmAm8kIAnAUr4xUXaoGVvOZfD3S76SqL9esS/r47adHWc1OBoAJOcbylpbtWOrcR0mYaLtHk87TldJSCmsSYWGeR3Ou8x9/kfaB9PJn8Qls7T5xO8D8DpihxKDuo3Azu5MHx8w49eqDAVUj+1CSGgNQOAQ47SJcEip7kZ372DxrUVXB2xBFlxoYo410p2lRNFlezC0XS7PSjB0KEl+Y9xMamdp8BCA1eAYa5KcGPSfL1cF/3ENNi/jJTEK+sJXOjfyEsV7w3bWBH6bTApXD8++MQgT/nYB6sPMRc1YSmD99AOd3Y0vv0bQNQrDMNXsqz60qID2BgmmTcDtPnlpN+QDJKTEPKMri3GORYsAztwcnNmPMybHfo5idWa17fPEMFPQ79PISLP/owiRoW2oBmip9AYgHjCN470Bjvpn7ss2cE+y/n+1Gy8UhEBPD7oLavsL+dFluIt3G8widrw7b/gG13x3kztzcMwdrCAMUqqnfeko+gO6OG9eqUpwHZNFLutDeoOigeJ4ElZxZY5PxADIejgczs1MV/8vu0LiDo4i9hpwHxUNWQCDOqQ0d59YIMZadLqQM8txfDope/jCkvXSfH3YS8e6+Xv2NAzEDCMXpUTBJSdX5xVwQD8K5hHUx70CU89UhrO0Insr7akKgUAtBXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(921020)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UElOaWZGRzZWWlJGdUhuUFkwYzFZSnlvdFBGRFdMT1A3M3pEN0t1WWtyMlBV?=
 =?utf-8?B?SkJwcitLWXVHZVJ4aGo2elordzRlMXJFVXhKVjRGMFdiMWwwVWdsalM1Zkhw?=
 =?utf-8?B?V0FKUDVkK3R1QTliUVBneStGT0dZMjdMU1FQYnRid2xLRGdrQTBtZDdPNE12?=
 =?utf-8?B?V2M0YWFZSDJsdEF0LzdHN0tvaVo5OXlJa21rYVlWblRKZXdlWjVhOGx6VVYr?=
 =?utf-8?B?TzVOSVJYT1NISytHZU1taElvM0RhdUJzN1ZSelRkaEtYcGpTblo2NU0vQnB4?=
 =?utf-8?B?SXlBQVpDK1BHMEY0aU0wUjBSK0lYZEFheThTVDhaR2J0dW1KdkJzcEcvR2Iy?=
 =?utf-8?B?K0hzUVREYVBYbXZZbFIvTVN5SlFFR1VkeGpia01sSHdJRnY5VlBWc1BJZlRC?=
 =?utf-8?B?bTFDREhJMzNGb2ZiL3NXYmJjajNWRnhxNkRBdnEzd0haQzFDbTNCa1dnckQ4?=
 =?utf-8?B?Tit6b0w4MlE0NjhIbFhHZDNRcFBNOU10WmduQlFHREhrdjE2QW1JNXVMVDdE?=
 =?utf-8?B?UVhJZUxTcVdLVTFKaGtKeW9ZZjNvSFF3eDFFcmxGMGxVTnNnZzF5RUIzakp6?=
 =?utf-8?B?eW52Zkt4ckhzV2RmWlMxMXc5aWZ5MFFNZDdmWURQSjVYSkpSVXllVzZtbzBq?=
 =?utf-8?B?TFBpSDZ3M0ZESkJQcUxTbkg3c0VRSXd6RXFOUlVQNUptQWh2SlRQb2FUczVR?=
 =?utf-8?B?dkhOUEFqTjY4OS9rQzZoRWJNcEg3eEg0czdYbVRNclZTa0lib3JzQ3J1WU41?=
 =?utf-8?B?SCttWWRLUnpoWHQzaDJlblRUWHV6Y3Z3SWdrRW0zZTZCOU0xQks5SHYzNnFt?=
 =?utf-8?B?NXkxSjI0ZFdkSkUrVzdoa1JvNWxlNGR4UEJMS3Frc21nMm0waUk2ajRBYm1u?=
 =?utf-8?B?K3c2U2VPdmdaVTVObGsvQzA1dnpzcnlLS2p0bkx0MUxkUDB6Z0RKeUNzZFlB?=
 =?utf-8?B?bFBjSnR5czBNejJOc1hKME00WnZPVXdsdVJrMFplcjAwalFCT3d2MVFrSHo0?=
 =?utf-8?B?MjVwTkZoQWVLdSt6a3lOM3hIeWRhMW5pUlQ4V0NRZXI1SUZXcnJoWVFiUUJP?=
 =?utf-8?B?dGkweUxDV1ZzcWdaK2U0MndxNFVib0ppZjJocU9Wd0htZHVEbHhHaTFGM3c1?=
 =?utf-8?B?WEl2dXpFNUFNNnQrODVDbVBFa252WGltZnZrVlUrWExtZFNpWmp0L0txY0Zj?=
 =?utf-8?B?OHlaOGZ4TkRsZzlmSDFLNE5sa2lvOUlwMW1YSlpGNVNicUd0K0JUNFExQVA2?=
 =?utf-8?B?RUVXa0VDKzFkY0JndVNrY2U3T1hMTzdGUDdXQ2dVNTFHRktLT1VnbUwrb1RI?=
 =?utf-8?B?NjZ5cGxFS1JMTnFvM1FKUi9MWlp4eXFNOGhFSlFYM1M3b3FIY3ROS2VBS0dY?=
 =?utf-8?B?WW05ZGphN0F5ODM2M1BvZ0FRT3FpOUorVkphR3JvYkdpWHAxM1Z0T1ZJbTN6?=
 =?utf-8?B?UVg5OGs5emFRSVZ2UW5KWTFxRCtDZHp0Y2NhbkwzcUllNkhMTlUvK0dmUnJI?=
 =?utf-8?B?MVRCbDBGUEJwYkFPMmliaVVYM2tvbDkrcnlZbjdwdVN3dDMyUEhVZnRKZFRo?=
 =?utf-8?B?U2MrMDVId3NMMjdwcVZzZlpaQVlrYVZ4NHJxWlJHZUZHTk03Zlk0ZTRYeUhS?=
 =?utf-8?B?WDVZbDg2WlV2WDVkVVlPemg0UDF2RjEvMGdHQWZBSzhZV1NBR0EwMnRDaDNJ?=
 =?utf-8?B?VzE0WE5JbWtyNnhpMGF5RFVuYU9ucHZuNXRRSjVQWEhCSGFja2dhSVFnSUc0?=
 =?utf-8?B?RFFBTlp1andWVGZOaVB3dnRXTWdUajdDUWJMRlJnRktYQVBPc3RlTzQzRW4y?=
 =?utf-8?B?NDhxNDcyeUdTQTJYZjNNZm5xNHloaS9lMCtIdk5lV3FoT3hWc1VFT04ySHNm?=
 =?utf-8?B?WFZWdjF3REdjYmk4azNDMkF5WmIwTTViUWYzbm5keThFTkdLb2dRc0srdmV1?=
 =?utf-8?B?YnRjdHBYNE9iM1YxeVBaUExSQ0p5R2lWQ3dOTFlYaHNsUzRqbW5VNnZBZGlp?=
 =?utf-8?B?OXhZaXJtaVpOczJLS3Y4bWI3cnV6VGt4UG92c0FKWnFkZ2YzOTgvSzdGcEVN?=
 =?utf-8?B?QUdPTVc5bHRndjhaSWFZOUgyZUZieHBXVmxxWW1Sam1EczVucU5zM2VYMmNU?=
 =?utf-8?B?N2pDQWRMQzN2WmVTN1dwenY4QklXQXVvWG43cUs5ZTU4dmVCYitFMW81a3VD?=
 =?utf-8?B?aDhpcmJzY3QvSlJYL2FNWnpOQkRwZXpiNE9ieWxBNkhLWkpCOFNhV0FwRTBM?=
 =?utf-8?B?K3orZVl6WFRQeUVHUG0yMHZtMDUxcW4rRVVGUThHa2U2b3JjTHFoeG9DTTlS?=
 =?utf-8?Q?3o55mCL4put5m09eKQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6629e48d-f9e8-4c97-2c84-08df3b46e4cd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:12:58.3712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAhyKEu39CpLVUGmYuBJasjwsaMgu5to36gZTKhScityzCxy/xf24J3dTZjLhW93+D+ie73aDArBNQLRNz8Z4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7090

On 9/18/26 09:27, Thorsten Blum wrote:
> The mapping helpers __sme_map_range_pmd() and __sme_map_range_pte(), and
> therefore sme_encrypt_kernel(), use exclusive end addresses and stop
> before vaddr reaches vaddr_end.
> 
> However, sme_clear_pgd() treats vaddr_end as inclusive when calculating
> the last PGD entry to clear. If vaddr_end is PGD-aligned, the first PGD
> entry outside the range is cleared too.
> 
> Use vaddr_end - 1 to calculate the last PGD entry within the range.
> 
> Fixes: 6ebcb060713f ("x86/mm: Add support to encrypt the kernel in-place")
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/x86/boot/startup/sme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
> index c07a2c381ed1..2d5cb3f7eee6 100644
> --- a/arch/x86/boot/startup/sme.c
> +++ b/arch/x86/boot/startup/sme.c
> @@ -99,7 +99,7 @@ static void __init sme_clear_pgd(struct sme_populate_pgd_data *ppd)
>  	pgd_t *pgd_p;
>  
>  	pgd_start = ppd->vaddr & PGDIR_MASK;
> -	pgd_end = ppd->vaddr_end & PGDIR_MASK;
> +	pgd_end = (ppd->vaddr_end - 1) & PGDIR_MASK;
>  
>  	pgd_size = (((pgd_end - pgd_start) / PGDIR_SIZE) + 1) * sizeof(pgd_t);
>  

