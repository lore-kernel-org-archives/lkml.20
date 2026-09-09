Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C70357D0D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973796; cv=fail; b=WcHzqaMUpJEbrCBE/FVYcSvrlwOyKox5W3uN/w304iiQK36X+m5p+BTfEvm4rRBrRcbRlsa/6XvTf1P7DkukPspecMaxlEx+0wPM0yzEHh0Qg1ScPGTCSNyBpVeTtk54jSVJgrpNLo1cmVSdxSbrRZHe8peOpPu/8c8/Xx7wR3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973796; c=relaxed/simple;
	bh=KLmxuwdxtuS9VZdDzk5jAIb70ztoxwNP7Gw9xIbKEqM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XjNuIkQEe7GmyTcrSZC7wDiSebZ/rAfIZcCbc94JShXL23dhsyNCZsqq2+mTuMQ/GsiDcuzYFmAPhzSCWSDfOZSIvw9wZuxkmKVUoE5pP3NpQwCSs2vrCVCkLCCGMpjGlmXv4eR51x0r/ncBjHiksquec06yFWE6JYwsEgUJqPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=gnMo2zS4; arc=fail smtp.client-ip=52.101.52.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="gnMo2zS4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZ6Ju/5PxIy0CuIrkahrlAR7pzDXXERfPwELVorIo/py2NRsK444LSVj4jCn5NbEY+fxhvjPppB7egsV+QZvg+yUiaTs7oeEwOqT3B+lk8Iv2eo0CR4v6hODS1WiIK2CNtYEKgluLrGWaxNCPQ1YkgLdLRqmYbReOyVIUITrZQSNarU3hOGEcRIhFvGbkJe8nX18r2VvQL7Q7YHURjbtKjv08jjHtax2B3LZBaM6eV0WAjne1M42jQkcb+2heWHIy0VkphicKussb06YBM6EpNf9QOtYF720B7WDW6gm3beb/MlaEic4WsSn9rLYxbbUrgbW9GSoPNTKhrDIWmmrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veYsgp1P3tJUhqBQzcGOjUmgXYmszSG8e51aMJEtHDc=;
 b=vjmvKJlAmp638sBFsKjUSN7tr6bPMQ+Im/kABnwDFCB4gk+uQ/GJaoaCO58pxDgurkTweKk0owOvg9CXcUYL4CDKUIhuxPa/cz28lqACDzFUtp+r1a4+2k2CmRV1VbE4l6aHgfkthJpJjweEqAJ4zYjJW0akU2cNmmsrHg2/aILBNf0ymgj+VFz7QqEzm7ZPYRWOspJLWHduIurmj/x7xVSJMhVLGun5wDI/YtUOKm2FrA96WmqS/8JqsQgoKS6rLbnYqo/ERiG6cT1awFl9517faDFT6SI76Zeg6tHd+1mlYNuP9ClLAZdBTCIQGYI82Y/TNYWH6eknD16XXwNcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veYsgp1P3tJUhqBQzcGOjUmgXYmszSG8e51aMJEtHDc=;
 b=gnMo2zS43QxKXezLkqU5+HBlSmFIFpZ6rNshldnG//nWfaSkjalb+ugufkcn+TbRb9NThd6qpdCtYLqoFjnuuymSVZayBo0IGhcP/me6URAFzUwwSNwncpgtThJBYvVJpw+GYSvDfq6+IF4StiT3fYpnye8of87tv/21CFwjVz1LU5FQDLHTZXRKjeSY5fpU2VP4Sbvaku7YoJqMDkikvifMX+Q0aUDxOCO9bgjc8hNzr6B0PDtSvFXQH/+4iQPm16dUNmCoIGGcgt0r24OkTRxWoPeRO2eolZxWWQWceHH1mQDGd2kG2kH1hBOCzzaBgLPJsidJJHp/UvJR+BBuKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN8PR03MB5140.namprd03.prod.outlook.com (2603:10b6:408:7d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.8; Wed, 9 Sep 2026 17:09:52 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 17:09:51 +0000
Message-ID: <eb7eabac-1557-4956-af05-f7220f14a1ae@altera.com>
Date: Thu, 10 Sep 2026 01:09:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] firmware: stratix10-svc: fix kaddr dangling pointers
 and populate kaddr1
To: Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1779780223.git.adrian.ho.yin.ng@altera.com>
 <ee89861d-b0f6-46bf-a7cc-310da1f1acda@kernel.org>
Content-Language: en-US
From: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <ee89861d-b0f6-46bf-a7cc-310da1f1acda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN8PR03MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: 768d0fb3-2627-447e-981e-08df0e952926
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|4143699003|22082099003|55112099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	P21SsD59amNXvK1YED7WBlKLP/RkwryYAlVzB+ZIUKAv+t9EhNe4Jw25joxuwtJcTK7d74dztFC1q6hRYlu0E/vjUMgEGcaaYiRyQf/tKMAzIfXDWjDEMYLKGML/e5mR+zG2gJlFFBN9uG433gFTdlFSEV3C7Wz3gdKZZLydsihalc5sQICRn+VemdAGiJd8SQzawcEhCjIbABpJpWhQVf8/8WZLyJaSlJmzXO6/NeJdwXBONud7gEr/y6vWjexBkiLMBlQTCqbBX9q2lTXVU+hcPoN/l5kMduMCx9kqc9kiKoJWtW968Mg5qhpUlr55qhh8iYG39eniyFaZkHOyjTHBOBdtBE4OKc8191gBzVJEJ6Qx+WGXq2zcq/cujWgF+rws6zn9CssdQB3Kc7W00PnqOXEOIqGYy3Lk1heBCeNOmmV6qzO4fpg+jnvmu94zw8BuDh5dAfOUYC6vZV3oSniX0HXVBSYdUynQouuQWHvN12aKJ6OieqJ1oz80zFyhGzl54pOKW3LtrNvfT2iX8u2+RYsq/jw0AOBpnIM9O/QRCKkYFqmSGIDVaUCHfLSgy1zefgHfVgUVbNFPjkLcqfWetpLGv0nsC/wbvD3riAiUu9pZY9kNF221w4TTGq81Nwb5z5a2CUzB/aukMcLER3gp++KRw9XS3vElM7qVAZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(4143699003)(22082099003)(55112099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEVGa25kQVA4N1NUdHRuTGY0NzVrRHYrQzdxVzJUOG1MaEk5TVB2dXFrKzFX?=
 =?utf-8?B?RmFLUDVlMFlnUXRkamJic2RRSEdrOWRTL1VVVkZCR2x4bjJMMFUremp1dTdw?=
 =?utf-8?B?V1BmdWF1YytVVmRieGpqL09LUzZKa3RWVHRXTmx0b2doSUFCaXY4eEh3bERs?=
 =?utf-8?B?NGtrSnpjcjk0ZTNoZytEWk02RXE0UkRkK1pySEh0bklQZ1hOdFc5a0pkWllw?=
 =?utf-8?B?K3hwd01DNGt1dkF4N1ZUVU5ucTQ3NTh3dlFrUHNoUVdwcGZaeHFSQk9PcjVP?=
 =?utf-8?B?bXZjZGlHVVl5ZVdGa0NESytvSzE5M20vVFhGWmxPYzhkMkhGZzV0azdZajlq?=
 =?utf-8?B?Ny9pdDhQb1luRGxHOU1rRkdPbjVqZkFYa2dnYXRUTlZ0bUI0TlFaNUtJN2ZO?=
 =?utf-8?B?cXQ4Q0szOEwrNXBSb3dlTmZFL25qVmh2ZE9lS3A2MFRvaGorb2FFaEwrYXpD?=
 =?utf-8?B?a0ZxdlFkSWdwcWZJcy9HUGZHbFZoZVdScUhzbjFtaXpRekN0dzdZTktrM3NV?=
 =?utf-8?B?TlhhOVViV05pMUZxU1hsSzNrUzR1NmFEK25pNG1NS1VkMDV5dTh5d3VIbUdo?=
 =?utf-8?B?eFNBeWxyQjRtUjZiK0VXVkhOSG4vZmh4S1p2WmkxbDI5U09JSnhxTmVtWjRP?=
 =?utf-8?B?eTNhUlAxQkxaMTN1WS9qQUdxdmFPK3MvZ3d0VlpMY0w0Q2hjc2dDMzNCbkNG?=
 =?utf-8?B?Q3g3cmIzNy9IS0xjN1UvWDhUbnRjMjhPWllUZGlWQ1EyL3JQa3pTWTlJVnE1?=
 =?utf-8?B?S1h1eURBVEVUNndLaHhzZVJuSGY4TFFpUjNveGRzS0E0SWRPNy85ZjlEZEM3?=
 =?utf-8?B?VS9VOWF4YmNlSVB0Mld4dzdLaWx6a1pnTGExb25CN2x4eDIrbytKV2dHZGRs?=
 =?utf-8?B?VTNZS1JBRUVJYUgwQTFEcTljbG5acnZZS1BqdXJDT3UzRkR1a1h5QUVBVU5C?=
 =?utf-8?B?b3g1alhFNnBBTzlOSisvMHhrRzBld2llSjJaVVNFNmw4WWl2emR6cDR4a2Ey?=
 =?utf-8?B?eHlWNit0L09HTmhyMmVwdDVPa09YQW5BYVVnb2lzeUdIN25hUnRsbWlWcE5l?=
 =?utf-8?B?eU1GYVY5ekhZYjZCN0JrNGdsQTRUQXA3TTN6LytuZmE5MkQ2YnprQkFTV3Iv?=
 =?utf-8?B?cHdpQVErLzlKSFpCOElhVnA1MlZMYkFQS21FbXlkYlRodDVOM2lMT3dSbGYr?=
 =?utf-8?B?Yk51TW42UkpuRW9GK0I4bGlQZ1Bvd3pyUm44RElJV01WWHdoY0VKZVpXczZh?=
 =?utf-8?B?QkMwZjZvRVpDWUora1NnN0g0QjZZd2JISzM5OXY2N1NRb2RaTlpPTkVTL29R?=
 =?utf-8?B?WTR2OUdxbkRUazhSUnBEWHdrUUtDcmVRaEViTE0yQzk0MmtLL2NuZDFlNGtR?=
 =?utf-8?B?a0w4dmlvMG9OQ0R1NDlYOHVrVWdoY0R2SDN5KzdTTTdHTm1QZk0wdzREbUtH?=
 =?utf-8?B?QTlnMG44dmZNSGhJWURLZm44UzBweTJ4eGsrRXZxcWNuZjBFeWp5S05VdjIv?=
 =?utf-8?B?eUoyOEswTDRDaFBRSTVmZWloTkRTeFZmbEtFejRyMVByUUJPclM4NUh0dVor?=
 =?utf-8?B?SVowQ0kvRERSbXF1ZzRRV3RTNFIrVjhObk04MEI5eFZMblNEb2g5WUlYTXJW?=
 =?utf-8?B?cUIzSVFOQXNNMnhaUENyYStNbzQxdk9iZFc5UzIxamZ3NnJqWDB4ZGRPYSsy?=
 =?utf-8?B?a3Q0QnFtM1VjMjlOR053djFaSUNuNHFvMzh4amZYM0ovYjRvclNrMTFCamNY?=
 =?utf-8?B?WFBZYTlaWVN3cVhraHYrdEV4dk80WnRuZmZQS0JRREp3UDlkd1pMV21oc3po?=
 =?utf-8?B?ajgxT3l3VGJZdFllclR5bkdyTW55UDhzYk11RzZWbkg4NUNlTndRNW5tWGRo?=
 =?utf-8?B?U21CZHNudlJObW4xSnJMK1NXQWZRSEVwcCtOUHA1YkV5U0FLbEFqQmUrcmdw?=
 =?utf-8?B?WlFNNG8vVjVXZHozc1JucUlyckRMSjRtTmtvbGFqb0RCdW1oby81T1pGMVoy?=
 =?utf-8?B?TXd3emJ3R1dDQjE4MzFSOG9uQU5FeXBZTWZQUzJtMFZGZThrSGJvM0FlOVhl?=
 =?utf-8?B?YXFycmdCMkx3UENaUFlXanZiNytyK3hYY1JoM2dIZmhJRWxQaHZQUFJpRjA5?=
 =?utf-8?B?TE9tSDR4a3B0d012SUdCaVRuQU55eGIvYXovaEpyWlhVLzZrTnM2WjhpeFAr?=
 =?utf-8?B?bUhRTTdlNjcxZjJxZXF1QzhKWHhWWUFldjJPbjZEWUlTQ2YrVm5xNzNCODZr?=
 =?utf-8?B?YTgySmJCc2d3U21ycnpwSVNYNk5ac1JpMGp5dnNkbE1TaElkeTZhQ0doVnQv?=
 =?utf-8?B?eVE4NVNaSjU3ME1NdGZ3N21laXR2c1hVeDdmNDVsUzlUWFlIbVRmWFYxR2Vp?=
 =?utf-8?Q?8f8WIiPItGEV7770=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768d0fb3-2627-447e-981e-08df0e952926
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 17:09:51.5966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJbI/lhov/4DhzPBh7biuuWki/mNPMqHCcT2ntMRRF4AsJB0LHai7kBJAkgcsgt2pMz6YBuQ41IRXenfKx6J5BAMYhFvGfaxxKCziJta7Ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5140


On 9/3/2026 12:31 AM, Dinh Nguyen wrote:
>
>
> On 5/26/26 15:35, Adrian Ng Ho Yin wrote:
>> kaddr1/2/3 in the stratix10 service layer are set to addresses of local
>> arm_smccc_res fields that go out of scope when the setting function 
>> returns,
>> leaving dangling pointers in the callback data.
>>
>> Patch 1 fixes this by adding a1/a2/a3 scratch fields to struct
>> stratix10_svc_cb_data, which lives for the SVC thread lifetime, and
>> pointing kaddrN to those fields instead of the stack.
>>
>> Patch 2 uses the same mechanism to populate the previously unset 
>> kaddr1 in
>> svc_thread_cmd_config_status(), exposing firmware status details to 
>> callers.
>>
>> Adrian Ng Ho Yin (2):
>>    firmware: stratix10-svc: fix dangling kaddr pointers in callback data
>>    firmware: stratix10-svc: populate kaddr1 from config status response
>>
>>   drivers/firmware/stratix10-svc.c              | 45 ++++++++++++-------
>>   .../firmware/intel/stratix10-svc-client.h     | 17 +++++++
>>   2 files changed, 47 insertions(+), 15 deletions(-)
>>
>
> Do these patches need to get backport into a stable release? If so, 
> please add the appropriated Fixes tag.
>
> Thanks,
> Dinh
Hi Dinh,

The callbacks run while arm_smccc_res is still on the stack, and the
current clients copy kaddr* during the callback. They do not keep those
pointers afterwards, so this is not a stable bug.

I am dropping patch 1 for that reason. v2 will be only the kaddr1
populate on the config-status completed path, using &res.a1 like the
existing error path. That is a small feature, not a regression fix.

Thanks,
Adrian
