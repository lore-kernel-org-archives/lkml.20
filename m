Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AF22367B8;
	Tue,  6 Oct 2026 05:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791265158; cv=fail; b=rTeV8NY+E0cVOD1N1FLLeJUZy5C4uILbsPUhr22+SKZ6Fwe6BM8erJPk6gJ/d8HHcMaZT2J+Ydzg6aLpeDhxyoO7BSChXsEqULM0hVEkhRqVVXBtaKh/1oQBN8UqPgdCkf/byArGf2uvVnTQuo9jx8O+LrqGpGxxt5YxVjG1Gew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791265158; c=relaxed/simple;
	bh=Fj45SUOqssLkPa0kSW4H7kzRhtkPp5F4x5yh4BlNVps=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PhToOcXBiuf622Xzj0teTqMOYyb7MnC6epShwCCS8tBr+Kxm+oZtUECjyYHmzUPdhDyRIfGBBChIPblnilxMCXy80K4I8dPKlNKgV95qwaUx1al21H5L2rPieWn/HJqWTMtqr7+0RSBVe8MdYUdImhmmY6j18hJqMu2rNHMXMXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=amUl8CRZ; arc=fail smtp.client-ip=52.101.53.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="amUl8CRZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zR9/7gb0boFAHvkgccWHMs/ZFCvyuXbDm8JLjC/Y4K9pXRUq36cy/UcEVZqVynmAR+OSe0+obIkVzw4POAyg8U+0avbPIDez8Xy6OtjGIIFN7CLvLPs/OxwG+nkdKbZ8sQryXCfgjHznLxt91WdcY+U7vedHKaXKWVIfk1aU/tJfu80MC9Cu/hOeiFYyzQ1Yslg15YsG3kDWqIamU/TdvxJJ17s/hBSKeTYe1Kty5+Lm9zbu/o7palolHKIeEA8qg34jKBIDhRyGANcWMFkRMkAeD/JAtIXv3TNI3RwlDyoTKuWO3pALVUUBmlBgTkK+9nct4zZeL/h4TO/vLAwGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYzs4Lkln+uzxd9QpByQdi4Hj0GF4zI+5ZuWy8EePok=;
 b=GGffPotzWXGhyeWTdQ7gbevjyrBSLPWvDlWgF74nEusI9Vw4GLNRpYkl+9/HKCbbp4vkSltyId53UWfDB8r23tkPXLxDC04bVW6U7GaKenrWYW2UNoinU39dlbDHlIEc+RrMg7ZPOVVUqtvnzEISduUYX2ZFCMaOgyxXw7VlGvRrEvd9lgfggC/t5+WR5zF0M/VrcHyMtrYqsk6QpsorhXaYoSc9NMzTbaWK0qgsRbUGiQ/nxPwrYPxTiN4vxSe45fIHrlrjZC8FTRcMlJ0iSRaPwVOZnLUaqDEaECaduigm79L8USUYzGYrz5CzeyB0gUe6aYl0cminRglSwYADxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYzs4Lkln+uzxd9QpByQdi4Hj0GF4zI+5ZuWy8EePok=;
 b=amUl8CRZ0P7t+S8pWX5P9jc4GGTPUkhxQECutv5vQFJpUFA8VYTLAkBHYq3c5PXuSoSOhxDfNUfUhqcr30iC9r/i0FpPZDA0iswgK8HmXbdoltUMij9ubrHG/aNRrKFm2LbBTllckiiHmXGT9gHhQNjYSowIF+l/V3Xxwb3pQXU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB292992.namprd12.prod.outlook.com
 (2603:10b6:208:5a1::21) by DS7PR12MB5984.namprd12.prod.outlook.com
 (2603:10b6:8:7f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 05:39:13 +0000
Received: from IA1PR12MB292992.namprd12.prod.outlook.com
 ([fe80::4b88:460d:65c0:def1]) by IA1PR12MB292992.namprd12.prod.outlook.com
 ([fe80::4b88:460d:65c0:def1%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 05:39:13 +0000
Message-ID: <862c2375-ba3f-4d3d-80ae-50518873c252@amd.com>
Date: Tue, 6 Oct 2026 11:09:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah
 models
To: Yazen Ghannam <yazen.ghannam@amd.com>, Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261002113204.3358815-1-Vishal.Badole@amd.com>
 <20261002113204.3358815-3-Vishal.Badole@amd.com>
 <20261003012238.GCasBY3rN9K8ps1dDR@fat_crate.local>
 <20261004151447.GA2673@yaz-khff2.amd.com>
 <20261004160412.GAasJ4_AhYcuacY6ZM@fat_crate.local>
 <20261004170525.GC2673@yaz-khff2.amd.com>
 <20261004175048.GBasKR-AA6kPKnbgEa@fat_crate.local>
 <20261005150751.GA1159@yaz-khff2.amd.com>
Content-Language: en-US
From: "Badole, Vishal" <vishal.badole@amd.com>
In-Reply-To: <20261005150751.GA1159@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0274.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::10) To IA1PR12MB292992.namprd12.prod.outlook.com
 (2603:10b6:208:5a1::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB292992:EE_|DS7PR12MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: edaca58b-85e0-402b-ceda-08df236c2776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|4143699003|11063799006|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	yJNvl/dTRP2nKDKw5x1afKtraFZvjWQslnmd383sCpzqIFWbvHld/BKAMviYL6oejhdRAUJbd4fAyedJhdC4vaZGIAfhRjCD5IvXZk6MRXddmjEH9e/BbioIOnvFfP6EpxOm4PhMIS5G3Qa6zPZL5tbeXzVD9KiUFF5wI3XWXDvOOWhk3IojW0yurXfnmRBmDU1OQcOg1dvMDs/Fn+wvddYgNVsbdBNd6Ro+6ZVnCXSWC3etaMMAQ1QgoHbet9Dk9asGdwGqC7SB+8VTI96pW+33lvYxoeDXxCY8qce/oHtoxsvyCdUgfqEh6CTYVPZEypG9lo+SJSZrncA1ni1rVm5rwYXgeazhw5WBXW34fj01y/FdxHLihxuyCPPJPFYS+RYKJR+WuDEiRfNz/ypogBfa2a7Bk925s8p4NDrRG6sGhbo7qjUy2vlYaDf9j2v5Mcn4Gf1wJBdunNPqEpvZCnU1YF32cW12SWYAMZ/uoxUfWxaUqgVZVYvPb3QJhgExzSCUy7ZqlTLsBU2prEuD2bomaVuAdOr3ZnBMAEDitskSNh6EUCHNOMVyd3rAfKzOBG+P81wxwSETyvpsoax5ztQWVrEmH+Ot68suP5b/ClakSllNNXeTtQ4f8PpEDuzYY8J62KEi2QeM8yvIXHvuB8Bxetdgtmjc/GJihhnEpdY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB292992.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm1JMzhvd3FYM3BVNTBRZzk4VUxqb3BDUXhzaHlyelU2MzF6b2NIcTBQSlJa?=
 =?utf-8?B?NUZQTGlIeXRjWGU1b21ZVEJ5c1RPVWJvSnhCTUhuMjNwZGk1NDVxUWs3Tjli?=
 =?utf-8?B?UkEzSmZoaHJISE82YnZaVlVNbVN5V2JlK3Baa29rb29iUVdiS0JGdkRjdlBM?=
 =?utf-8?B?SGJVRHZaeEJmSG90VnNtUkZRSSsrT3A2dDNoR3gyazV1KzNUY2oxL3NpSXV0?=
 =?utf-8?B?cjlzM2I5dTIvL0c0ejI4OVc1NzJGQ3lJOTJwMmg4WVdzbzdHWS9YS2x3SkhR?=
 =?utf-8?B?WVRBSnQ5VnJsdzVyNEFpdys3bGtjeGRMM3cwU2ZsL21pdUhBeDR5cmhSTUxT?=
 =?utf-8?B?T1lKdWxOd1R0VFQzbGR5R09mNWFWTUFxU2N5SXBrTFprUUw0VjJsZGxYNmNE?=
 =?utf-8?B?RzRiWGZSVHBHeTBJYzRMREFXVitjMWNRS2N3MEl4ajNkSXZTRlQ1SGllRkhl?=
 =?utf-8?B?eWp2blNRZzYzTXlBNFo4aTMzVkIxUnF6SnU1Sk1iS3VlSWs3OWI5V1U2YWxV?=
 =?utf-8?B?WWFrLzMyRHdCS3VYYzI2cTdWY2JocFlaT3prNlFnWENVUHc1Q2p4bjRUNUY3?=
 =?utf-8?B?K1NzVThaKzV6TEZuNEFoV0ttb20rWGFGb2dUZTFoYms1VmlFalBQcHhycUpR?=
 =?utf-8?B?RzFSZlF2Z0dxTFJWNVBpcmtnendIQWlBWGpvVzNrSTB5SEdETEhkVEQ3M0FD?=
 =?utf-8?B?OGl2N3lWWnBMNTR6eEE1UE5weUZJMHhkQXBmQ3VIUkltRndWNURXaXE5ZWoz?=
 =?utf-8?B?TmlldDNwNUZzMkJ2b2lBanIrL0RsVGkwUFJkU0VsQUs1MWNObEE0azczNHps?=
 =?utf-8?B?bGRaOGdzZ0dseVlDSzc0SFgvNXVPL3JoNzNtMWJNT2lFK0YzVVhTbVN4TVVN?=
 =?utf-8?B?bUpDWXAwYXQ0UWR5elV3WGZybEthdmM5TXFEUHNoU29xb1FUUTBmelNUbmhZ?=
 =?utf-8?B?aytaNXEySHJVL0s4VjdZN0liL3l4eUVDTUljMXlOVzNBendNaTRuTGpmM292?=
 =?utf-8?B?VFo0eFZmSWJrQk90VG55RHhzbm56a0RUVUZzRjVqd2FkTE1oRlJuYllYODZl?=
 =?utf-8?B?NDMwaVFHRGdTVC8zVjQ5K3grQjZVL0Z6M3liQ3YwN08yOWNWdTlyTytCREZk?=
 =?utf-8?B?TTdwM3RhamVFKytsWlBDY1I0d3BRMWFIK3VCSms3elV3UWRIaytqYWJ1cDI0?=
 =?utf-8?B?MVg4L3pRcFdLRHVCeEREa0hEdDFIQ3c2WVFDdkRKUERiZzdmN3o5ay9SYThS?=
 =?utf-8?B?bm94MHl2MEw5MDRTNkxVWVhwUGZZbjd4Nk83NStsVWNBQ2srdmN3TUN5UnJU?=
 =?utf-8?B?QWNuRVQvbGJ3N2ZUWHZmZWtreHZrQnRmaExvaTM2WXJLazZDYzB2MXUwVDRO?=
 =?utf-8?B?M2NxRnBXK1M3a1Q3enVSRVY2YjNQT21IVCtIcUxNWXlJRHYrSFRaVWpBYU9P?=
 =?utf-8?B?ZHo1ZzhpcnFUM3NjNlFkTG9wejZPams0OG5FVkI4cGUrVDVGbFA2WThqTFdX?=
 =?utf-8?B?eUJueFhyOVBXTEtybWVHQ0JzbCs3SG5sWTJZSTJyWjArQ2F5UzdiOHN1ZFBS?=
 =?utf-8?B?aVc5djlpME5WZmVnbXVUeE5MQmtHQ2o5ZGJrZHRuU1Q2dEpoYktHazllR3ZS?=
 =?utf-8?B?Q2EwVkhsc1M5NXErdS9UM3VOdTdvaEwwNFJKRjRiOVJKQXNwTGtKV0paeUtM?=
 =?utf-8?B?RTYweitZSW5wWHUxb3Qya3FvNm9YRVNQQ0NyY0xuemJPSTc4UnpzSDdGWVlz?=
 =?utf-8?B?SjE1aXBQOGlDV254QW4yUUxKYmZFRkRzM2hGSUNsbXkwOWJHdUxka0pobUV4?=
 =?utf-8?B?bDQzbzlwK1JGSHFTSVcva1p2clhES3YrVlZXQ3VsbGpGakswaUtaMHRESFhN?=
 =?utf-8?B?RGd6dkxYRlVuZHBPZld1dTVKckZXSGV1TW9BMm9xN2s5b3FCRjk2cVNPNXhi?=
 =?utf-8?B?aVZtK2QzOUFUZFJjS0UrWGc2WWJZZW40OGdET0dZRXQrT0dSQlliK2xJWDBG?=
 =?utf-8?B?dWt3dVNoUDNmSTIveEJia2h5NkFjYW41MklHeEk0MkUvUDI2a0dPUFVLSWNt?=
 =?utf-8?B?a2lCT3lTbGp3UHBia2dFc1o2NTc1K3JzMlE4RFdZRlZydFNlVDVZVlJkQW1x?=
 =?utf-8?B?c1lDR041KzlvV0xtdTFEM1Z6UW4xTkpVMmwzNzF0dloxdzMvSUtobUE4ZWtz?=
 =?utf-8?B?ZW9wK0hNOXdaakdVL205T080QWFGdHNQcUZoZ25uNEc1TmRmMWk3RFJkSVh5?=
 =?utf-8?B?ZFMrMzZlbEdqRDFMYWVEOXdjcHFyU09iTEwyMUhOaDhhVktsLzdqcUR2Szdr?=
 =?utf-8?B?SEJwai9xaUVMbVZ2YW5PRVNaaWx4ZjFSZm5SczJmZDJ3eWJMN2Vqdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edaca58b-85e0-402b-ceda-08df236c2776
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB292992.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 05:39:13.8363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PQuYipLs++aOHUwEhNafEHRM9WoxSM1QVus7mjT4/NhUXjZnXPN4A1v8QxPZO03AZMOqJs7WGEJ0gTehAj/Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984



On 10/5/2026 8:37 PM, Yazen Ghannam wrote:
> On Sun, Oct 04, 2026 at 10:50:48AM -0700, Borislav Petkov wrote:
>> On Sun, Oct 04, 2026 at 01:05:25PM -0400, Yazen Ghannam wrote:
>>> I'd rather we load unconditionally for all models with the same base
>>> behavior using sane defaults. Then we can have model-specific patches
>>> for variations, if needed.
>>
>> I'd rather not because I keep getting all those: amd64_edac doesn't load on my
>> machine reports. Well, after a while it turns out that it should not load
>> there in the first place.
>>
>> And then there's the managerial checkbox patch which needs to add support for
>> their new model just because... does it even make sense to add support? Oh, we
>> didn't even think of that but it says "Unsupported" so we thought we should
>> "fix" the error message...
>>
>> So I don't want to have that unnecessary waste of everything. And if a f/m/s
>> would keep my sanity, then I'm perfectly fine with it.
>>
>>> Essentially, we could avoid a whole class of patches for derivative
>>> (client, embedded, etc.) products. The module would load with the sane
>>> defaults. If the test folks find an issue, then we can have a
>>> model-specific patch.
>>
>> Only on well-tested and supported configurations. Everything else doesn't
>> work.
>>
> 
> Okay, fair enough.
> 
> Vishal, you should be able to combine the current version with the
> suggestion from Boris.
> 
> 1) Move the zn v2 flag to the top of the 1Ah case.
> 2) Add 'failure' for the default case.
> 3) Leave the 40h model group and add the new group with it. Basically,
> there will be two model ranges sharing the 'empty' case.
> 4) Update the commit message with the new details. Make sure to describe
> 'why' rather than 'what'.
> 
> Thanks,
> Yazen

Sure, I will address the review comments and submit the changes as a 
separate patch. Since patch 1 has already been accepted, I will keep 
these updates isolated in a follow-up patch.

Thanks,
Vishal
