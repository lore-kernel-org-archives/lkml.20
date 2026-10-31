Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793454699;
	b=yRkvbIk9OWDkuO3EUUdT9srwmQrHIKJS9JS0B7ftY4DmJ6EquCISu3nlLZhNFHZVho9S
	 qXvXqxsmg/W0D4a9ph9uG9dzgycys8vru0UIAuQGmINwLXoCbd6ikjyXePhAN4xhbPHAP
	 GcidAE/UgObSFL3aHh0KSVyR2teRkzY+YwQ1YF/LPXakfzXZ/dJB/sDFjgmQgmmGyXECb
	 leDLtuNw3Vr7q/eo6YKqTlEOlC9MYlEbxlD99+o82U/LEd9muUqXxNwCc0Q2lFHRQ3wVs
	 XE6oRJSCOQPfVoyDGrzwHj7VOZsm2D3aZpQdxpirqX5GMBJSv/jYqW9jAGPSofYtCRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454699;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
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
	bh=QRjm9e5E42rC4y80ybIhbOHJnl6l3frLkHg4iijQjhg=;
	b=wJqwzWHGBCKBHUnIHPlz8t2AWFrP+hW0Rose6kH6s41FvWvpL6Je1Wp1pHTsjRqovkED
	 xHFZAAxEJGvMXows/S1PrK4LBn9ZsCmuzswJdrpckXxQxaJZm8H/uBcunSXH0vEFtUpuA
	 uDCm2zqpquK4ERXbTCoV78VV1Cg7d4iyk3kvc8mFNoGrAMzFz0TSgITaouZ30aCv6VW6A
	 6FXrkyn4LWgJ9uAAWUwjhf6zTodgZkV186d6uO8mXIiVPkn7dK3WyvsXR3F/gDfNt505d
	 mF/lreyok0ZvUEWK3sxmUNksf1E01JYS2kWiDsi65C+vLza7JaBTi0f9HVTJk+zgFBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NOhnH86u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.1
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14E0606A31A;
	Sat, 31 Oct 2026 13:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D14E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NOhnH86u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3Vcjgnao3BWq0ULcV8Fy74Lkwyd0CCygnddqGVIq88wvH9sPQbGTHxb8BbpDDJO2qWlWhqtAxyRX3wRbKYumvqFz35xgtbMZov9Y7TrOXtWv8jRb60tdXM8UV5CIGq5H9MdGPFQZhUVnGWvyys2PgVsyeUgv3xGFcH3OFV+PV+JlsYjSpWtmsQ/79SulgiSzMmSHcWhttytDq+RwCGVMXTdriVOEtv8IVp5DKfExAZAnZjOWC+Ees+gAh7kYRMZQF0sovZdaQ+ifq7D8UY860C8QIvymSCwzkLkVJB+qQ5Er6SDr5k2NklRlxSxxU24wNwqONOpRGzwVhIClJMTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRjm9e5E42rC4y80ybIhbOHJnl6l3frLkHg4iijQjhg=;
 b=NvuVY77dX3l5aiurEuQG6uwu3+4HPk4kfw+46WJHmVk5i+Ix+Xoq02w1HBA1QemGrW8Kg6/UVLB4tGyDD++m74QK5xSME9gRz2hJe0JBOVD0UDXY9PqV+hNOoPruFgntzGirV3kHkb4XsGmmpYWgkFev4BqXyU2xPzK+RpM5OnY1SKpqTQFktPFGdWDSGeQrJnupcqmUCXlDkRyRsOSVGttA/f2gzlb1ER/SjnFQWFC/+vTEdnuk0yM4BF4yKZ0i03IULEQaiYp11r/K3TGin0RocnjqzX68G1fPsMJV29NPTsN5hDfmwf6ZCkRRCKPCczCXCX5iutVMmg9HKpSZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRjm9e5E42rC4y80ybIhbOHJnl6l3frLkHg4iijQjhg=;
 b=NOhnH86uSizHJ+YH9YTUhN3n5orCBsGJeRP7rih0aB3xcVOJaG/2mF7mSEq+F1+krQa6jhiPRm3UP2z07LsR2tTPM6/1GW+3QtgMfmoyWMd4+DXrR/LI/j3qTC1/gBt4s3E3L9BtnQtVhiDf+n2XndHnzVzo5SrVdhq5+z99Tkg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by CH1PR12MB9670.namprd12.prod.outlook.com (2603:10b6:610:2af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Sat, 31 Oct
 2026 13:51:35 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0569.010; Sat, 31 Oct 2026
 13:51:35 +0000
Message-ID: <64d14f89-07a9-40c0-8989-115fa6ea21c9@amd.com>
Date: Sat, 31 Oct 2026 19:23:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for Lenovo V15 AMN G6
Content-Language: en-US
To: rcilto1@lenovo.com, Venkata Prasad Potturu
 <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-ideapad-mic-support-v1-1-7677371af384@lenovo.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261030-ideapad-mic-support-v1-1-7677371af384@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2b5::8) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|CH1PR12MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb0d5bc-37d1-4886-aa96-08df375613d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003|10067099003|11063799006|261009223027099003|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Iid2vtBC5qZ93jfpH5tGdY2sHUPGNnuVm+sdXyxt5nSCLyIJdixlUz3JH/ALOu1bEwYH/66zZW5k/N0Ptv0YJuojR7xEcsHLEIo6F6TlsJhihwRJf0v81YGTIIfvkvUjX9tGpHurfHdAmZYuflvAnSdStFrqz59/GyymDkSLzDjgrz2dota/XFrV4eDq/l8TSNEgj97BR5Ilo+LlZvnbbWeEMM8syG6XyquxFGrK1oUkwcueZuf4CVwqm+3PTJYXYdY95MF9ajv0cYpUB4ZwI5S6/hcVBPRy39MHM5R+9AB1lEvOCSJYTEtM/UMRdigsLDmmHcF6fgXLAf02Zd+9FmOxeqBUwbiuTMclOe/kAziyvUFzPJsJ2YCXELWaGdNXbd2VUcMUh/yoVy0xeIGsVf7LO3GeJT1d9Sbg3uTpKsvqADk7UIqdteK1GJb6BknwoM1YCvEm7jC5V7xJNxrQnftNT7UK9+RaD7vWGskOTSUjlOdO3uRMc+7nLh2U58z/e+60stKrNT22HYBBktH0XdcfTpYYvhfRWdKB2p05d6pVFAIS4Qxk1FV6U2+X/DxFiIQSCL1AXbjuhlMFqkOtOWB84FV5mGSucaBmi70r9TBFtnQj8xWipGwIaEpXawXIrUG9Adi4CcDsS4AG6EQvu2FcGQ94kcnxnJTyfFxr54Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003)(10067099003)(11063799006)(261009223027099003)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW1LT09DNW1RcXd4Rytvbm1UL3BPSjFIaUozSnlMWXpoeXBlWGhqODhmRmJ1?=
 =?utf-8?B?QjBCbnJES1AwamNHUmVoK2orVmV5MUVoaGpHOW9LSGlZeDQydi8xckdnN01T?=
 =?utf-8?B?NWNncFNCR2dDbWhUbWh3azZadEZxaHM3cThINkJHYSt2Rk1rd094VlZGS05k?=
 =?utf-8?B?YVova2Y0dGFQNGhIajNHTWFGSDhXd29ZSUI2Sk83Y3BjTDlucnVKVGd5Mlla?=
 =?utf-8?B?MHdLbFh6bFIyR2ViN0tRa1Z4U3JXTUxuRThsbE9ZMjVtMVpPODRrZWJ2UjMx?=
 =?utf-8?B?b2NkdlpSeUpaQmc3OVl1SHd5b2VtNFJXRlF6WURJOElTRnBqTGFuK1RYaWxG?=
 =?utf-8?B?dnd6ODljSjZOYUNpeWFUVFBNWU5Hc25ZakZyT3dnMEYvemxQRm5uYktOSHR3?=
 =?utf-8?B?QUlPV2xYejl0UE9sckZ6UTdaSWdFMjVydlFQdUV5bEduSDZ5TXBKU1ZhdEo0?=
 =?utf-8?B?U3F6OWtiTTZoR2Z2L3hrSzFhYjNCazJwV0lSdUhWRVJxTzk5ODVlVVZXWEhx?=
 =?utf-8?B?MzZDbksreUUxU2pDQk52NzlYSERRdkxLK3QwSnJ6RHJWRDFUVGN2a2I2NmY0?=
 =?utf-8?B?QUJNNGFRZkcxbmJxczVRazFLVnBCbWJacE92bHFtN2FyQ0gzYVpCaTVqQ2NL?=
 =?utf-8?B?UmtsMmRZZWVRamVEL1RFMjc1RnRJSThtMXBEcDNCQ1ZwbVpOQXFSOEd3NGtO?=
 =?utf-8?B?dzJpaytUQXRTcGdKRVh2a2g0VnZ2VnlIazNDbG5BdmU1MDM0OFdRQy9BV2dR?=
 =?utf-8?B?aWMzd0RrWWdtd2o3bkxTcTJxdDB2Yi9kSzBQMzc4MldFeUU3N05PY1Q0cUZP?=
 =?utf-8?B?ZFMzR0ZWMVFJeHVqREduTWMzdWVOTnF2bDRJMDJIU040aHlWYk5HeHA0SGp1?=
 =?utf-8?B?cU50V2JoZjFuUmdoUG9scFdzZVFDRlBYMnh2eUhMeGNpeHR3Z1VKcSttRksv?=
 =?utf-8?B?a2Z6aE9DZVRxK1YxdUxJU21KdlhoRFhOTDhhNm5iUWRtTFhMUmZJNVBtVnZQ?=
 =?utf-8?B?QVRxUFpwMnRYU1lyTURTSEREV0g1V3pKRlN6YjJTTjVndnhMditVa0tRcWQx?=
 =?utf-8?B?ZGQzZXdzRTE5eTdLL1p6SldYbEpvN2o3Q1d0M3RPdFQrTkNvV2QzbjdPcEZF?=
 =?utf-8?B?V3I3b1p5Skt2RGhNWGoyeU9xT2FUWElhVzVILzVmZUpvRnliOVBXVStLc1I0?=
 =?utf-8?B?Z0RGaWt4NVBDRlZwTzdCbThmV2JHdWgyVVBCSzJjQ2hiU1B1aW4xTVZEeElv?=
 =?utf-8?B?OTFQS3dLYkRKOUJDeXR1ditVMmZkbkNHa1lteVhuTVJ4bXpiSHY5K2VpM2JQ?=
 =?utf-8?B?UXFzUnArbkdkdnhWNDNrMzZnaWRKTUlPWU52TW1sSlNtckttQWNTVkREa2lT?=
 =?utf-8?B?U0pUZ0kwVkZhUUFSMXljbmRPQU1DTXBIUmh6WVdWY0tyY25rYkpKWU9LTWti?=
 =?utf-8?B?NXdDQ0MzQzUvWmd3WFl2T1pDcHZNK0J4SU0vaE5id0g0RjgrR3dBMStweVJx?=
 =?utf-8?B?aUdCZWxyT0FmbEJpNkQydnFyYTNzWGd2RmVIUmZIMG1ySm1qWFJHRFZZN0s5?=
 =?utf-8?B?OTQycTJWVlhsSi95ZDFTdVBVc0s3dVRFSW10czR0NzlPbG5xQUZ1NlpxSERx?=
 =?utf-8?B?SjVxdDFYdGpTUEpla1hqUFhsWlNWMXp2ZnVpMHNTVTFNUEVLUFNjQmtROTRG?=
 =?utf-8?B?ZHl1R284S2xhb3BTY3IzRm5XNjJDZ1Z0bnIwK1RiNVQzZmZDOGZNWGlDaVZx?=
 =?utf-8?B?amoxWmtNVEQ1UW9TZ3YxSUk0eGN4bjVkZlhsc0JMdTcrL0Y2czFzeDFENGNK?=
 =?utf-8?B?aWZBbTV2cFQ2cUpFdWUvZUpRK1l0alliOGg3YzZkSW56QXdDcFQ2TE03cDNI?=
 =?utf-8?B?S1F6Vk9ZZGF6U3JQUUJGK3ZleTRnd3V6Yk9wak1lSnBhNjFTTzI2MVpsbWpo?=
 =?utf-8?B?OFJTWXVjY2h0eldHM2tKcFJoZW9SbzFUNjN6S0gwZDVuVEl1ZEhIL3JOSElQ?=
 =?utf-8?B?TjZJUUsvOHEvZmpvblo5R0RNb2IyM1pleWhzcHlMRzdaS3FuVW5HTFNpSEZu?=
 =?utf-8?B?THVNRnBqdnh6Mi9saGhRWFMyZ0xhSkxvYi83cjlLR2xBeDljVW0xYWlleEIv?=
 =?utf-8?B?Z2oyaEtWdEdMa3NmeG1ORFBYM0tTK0VTcUNPYS90Vnd2aEsvUWVySVovcnho?=
 =?utf-8?B?VSt4UnAwVUFadytZeitORmNxOFgvQTV6U2lJT2tYWnFKR2xPUmR3Und5bk51?=
 =?utf-8?B?MlZrL1g1alhKcEM1VHJYS1RxNlRIWUhVcmt4OWlIK3cvKzN2RXFYMVZPbHJn?=
 =?utf-8?B?a2dDeVk1dThpM0NicWEvRExqYW1qTC83Tk8rUk42bmlOT3BDV1hJZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb0d5bc-37d1-4886-aa96-08df375613d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2026 13:51:35.2715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8te+tCQlAg9+LZUYvfoMFByT4wuC9aYRodtDFsdQ5T44vSoA04aN1AZmXXi5HG65oWHNI/u/gQCDqzIJZZPe5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9670

On 31/10/26 00:09, Rodnei Cilto via B4 Relay wrote:
> [Some people who received this message don't often get email from devnull+rcilto1.lenovo.com@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Rodnei Cilto <rcilto1@lenovo.com>
>
> The Lenovo V15 AMN G6 (product name 83VD and 84CS) uses the ACP6x PDM
> interface for its internal digital microphone array.
>
> Its firmware exposes neither the AcpDmicConnected _DSD property
> nor the _WOV method, causing acp6x_probe() to fall through to
> the DMI check and return -ENODEV. As a result, acp_yc_mach.0
> is not bound and no capture device is registered.
>
> Add a DMI quirk entry for this model. With it, the machine
> driver binds correctly and the DMIC capture device becomes
> available.
>
> Capture was verified working with arecord and PipeWire.
>
> Signed-off-by: Rodnei Cilto <rcilto1@lenovo.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 41f8c0885865..fc648590409a 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -395,6 +395,20 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "83UU"),
>                 }
>         },
> +       {
> +               .driver_data = &acp6x_card,
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "84CS"),
> +               }
> +       },
> +       {
> +               .driver_data = &acp6x_card,
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "83VD"),
> +               }
> +       },
>         {
>                 .driver_data = &acp6x_card,
>                 .matches = {
>
> ---
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> change-id: 20261030-ideapad-mic-support-d658dddb815a
>
> Best regards,
> --
> Rodnei Cilto <rcilto1@lenovo.com>

