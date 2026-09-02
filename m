Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CDF3EF649;
	Wed,  2 Sep 2026 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363656; cv=fail; b=rwjH6OKeeYgtDgXsTpi4UQno3WL31Yf6lrzZaZEiA420pPH/RUNaM6hegvO6keRjBLTPOanBdfvd1oRqm7H5WW/924/RQEVvGfLCxmNj8zdQaN8MLq+kmNravKIq0lyyRQ0lrPEnyx1RoZoOwd+k/VNb40QGLXsPoTEITl4mgfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363656; c=relaxed/simple;
	bh=NW1dKcbmcpFSHd95INwB4bJ/Xlsq2RsTh0+aN2uWvPM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T8bfIu5IdRIUZnQ3vJsnlo1JmySF/MeQBpx0Ba+GqaKF08oigHL9JFa7A+AjXoBwVT1BBaVOMMA8jp3GQ8MMg3pUEKt3HqBgdjmXOtmNzoyLhIn2r15ZgOAR0DUA/wFoiHs7qb1N4bESdNRn24ATKz6KQ/Dst+7eA5y89R92W+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZeDGG/5B; arc=fail smtp.client-ip=52.101.48.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZeDGG/5B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZs2eSMq4IkTOvN4RgfPfycx3D36NGKvkUYgUV6pu7U4IMMI2Dme1Ctr6yqwC8FNXfVVlPJTRcpyiZy+bXRU/NfCqAZ3N2S3t6yOq9EFMCUPRmgVgkxxWtZFaInGo/J2CX7a5EX2tOf7/SguywYXjDf2hMbLylSWL6wM7jbbdTld6BYvBU/noqhT23fEdLsDEdSybIfZw7UGc77eCuIe4+rJ3ZfyV71fW75fgqRUwdXXTbwHmfskJ0kG6414oI81pQKcQRdd2wjoG33au6b4qQTIDQmfC7BPHpSN5Tj1wprSMJBsN+DrmB1N/isrCWPpKsACbucCXzVocZlc8vA5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWXpiXUXq8naRaWWvoHVVcX/arphiJWAoFeol0GR/D8=;
 b=LsDaQUTpjFu50oPrXmEOZaTZwCcMXGyPnUljmoUeRknIR5oGTNiSJ/bc/DnWJCmmh8v0Lzy1McoC8n7xUZ0jlwF+KJAcHNe3LtJGUDGgYc1V1fhQQexOzeQorWLUG5cpJu6YO+w2Y8jGOuOcyObCwVVwwdXJpxq7yqUAilxPVEMrmUanbU7RHN0+h6siprlGSJ7tT3b0wBbH2IdSO92/lGDOVhva9XXKeeQEaelaRRQpvvvgD36D3iUf8st2AOn520B/ZKBrkqcrxsAw5d6PuEW/E3ta6wrWW72MWXnmDvkJmFLPkwacXqigDYNCdWvlMvf1pCziXkFhpIMBcdoBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWXpiXUXq8naRaWWvoHVVcX/arphiJWAoFeol0GR/D8=;
 b=ZeDGG/5BV6JNxlWeCjeOjNpWGfxR9ipaHm9mK74kj0pyXbmQP35Mete4D8g5EVZYpGLyiLBQlBe9Nds4NXjtZHAPHn2rSR0nFiuzkA1d17CGbbZJb1/9WVDydLc4l66MTQ1gptFYqFh4QYUqbaVZ9/LHuI96Obb8LLw3gDg2tx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by BL3PR12MB9049.namprd12.prod.outlook.com (2603:10b6:208:3b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 15:40:51 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:40:51 +0000
Message-ID: <eb0d756e-23b6-4b46-adcc-45d90c144b44@amd.com>
Date: Wed, 2 Sep 2026 10:40:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Reinette Chatre <reinette.chatre@intel.com>,
 Borislav Petkov <bp@alien8.de>, "Moger, Babu" <bmoger@amd.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
 "james.morse@arm.com" <james.morse@arm.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Eranian, Stephane" <eranian@google.com>,
 "peternewman@google.com" <peternewman@google.com>
References: <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
 <112cebea-d455-4b75-847b-bb7d4aa4847d@intel.com>
 <1fe5cb09-aa2e-4b3d-9fbd-293d8e9f33d7@amd.com>
 <ad90a776-7be2-4d5d-88b4-280bc46b7387@amd.com>
 <d476ea5e-340b-4d65-8207-cc1a0055b4aa@intel.com>
 <20260901232139.GBapdeA0fj1XjLsjAM@fat_crate.local>
 <4a81506d-87a1-428f-b797-d9391aedcc7a@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <4a81506d-87a1-428f-b797-d9391aedcc7a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR18CA0015.namprd18.prod.outlook.com
 (2603:10b6:610:4f::25) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|BL3PR12MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4a62b9-fb74-4a2d-1482-08df09089107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vnFuN4TgzObNcXPE7VuAzYImWe4NoCcDngHR7LM8QDeijdCNMzZSNazHoJZrwpFTcuYr7Y514OyRUmNs4XT3PGoUU2m2Mh/DxUAqs2RFhFByKK5041w8fhVLF16+CxHwG0DTqy1j8GYtC7gw5CLHezYQnaRMXEqDHe1nSs5wB1r2DcdK9RYqtvJhmo5A0zG7a1WKPpVc+/24yqo3Avjiu2agJE2X2Ck5SMRWVPnJZ2dxs2Xo388K7QtCAoPD2YXITj0PED66sDUQ9qrYBAnRXvFpEnluvaTvVhE1pcAESljvh17TwAehpXq3iXZIwFg/niecGcO18pchTm5PdOjMfNR5Q0NI8mAWMF7Jk46Qgj+5C3WgEpKHOzULiWVOYkDp85PkZvHfUBCTIlqkDxLqzmvnOlfrHJvTbndqTR3T91z1qm28dc8RcYSxBLfgGn1HmZhq6Gj0DFSb1tgP+98Sc5ep3viNZUebxxSN3vTtLcxPKNkAxibsajN1sm6JhkPtSv5c+XIVOcLPTXds7WtIlwOk3ZHKkkihkbCAVfsTTQU5LJfG1AzVRVP+W27Y8TGM4moa/m16EdH2OtgEDnM6dGyWOBVuCbE8JvJNAf6Fg0dTRNzZ8PbtB4iDNXeGj0N4RBb9tpYERd0XaVdoQw4q3vL+czwVK5gAbWZFxK50Jv4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU5lYVRRVmFUMzVZOERONHB5NlloUWo2b2JHN2UwYVNEcnNDdjV5WWh2UUVB?=
 =?utf-8?B?bnZITGxaNWxkSllqSk1kTkVzY3J3c0FhNEYzTlVpNTVvSGg3UTlubHRka1pO?=
 =?utf-8?B?VHJxdExobnF5YjZ4ejA1bFhid1ZpYUIzd0crSGFCMUYvOU5iaS9aYkdVd3Zz?=
 =?utf-8?B?Y2hvS2t0ejMvN3pQdUdXeTAzM2pIWnpCZjFpSnJoV2orVnIxVlJCbDVSNWVG?=
 =?utf-8?B?eHB2b2pJSDQ1ZXVGVzhHd2NuTkljT0VaNzhVZjlTOVhZN0JlRHE4S28rYlpu?=
 =?utf-8?B?V2h5TjdlUXRXUTAxcDNjUlI3QjhCb01RcDJrak1EWGlLUHJOVmhVNjFDNDlE?=
 =?utf-8?B?akxJMHBZOW5ma0dEdDhrZmdER05RVStZTVpGOE9DV2xSVjJJbnpsSVNDT2h3?=
 =?utf-8?B?bnpocjVVMUswV3NoT2V2TlRLWGlzYnRObzAzc0hyYWIwcGJJVzRiVVFwUE9u?=
 =?utf-8?B?a0pSbnpYVEtVajJkbkhadW9ZMTc3eHFmUi8xUldLYXZ1VHArUzlZVmlEOWpP?=
 =?utf-8?B?VVh5TDBWQ2pweUc3Zk5iQjZyayszb2Z6aUJ4dlBrVWxaUFVic1FtY3VuekVp?=
 =?utf-8?B?bUU5aXJJR0NDYktublRETU85SWU3cnI3cmxrWWVWcitwdGdzL3V1MnFGU0tY?=
 =?utf-8?B?UjNWb29DN09lbk1mTEJ4OHJzYURsZUI4WGVjN3g0emM3N20yMmFDSTVaVW9p?=
 =?utf-8?B?QnBhYWM1UzNML081c0tFMTd6ZmFZWTd2ZjdHdGR5eEthMi9mMnZJUTdqZ0hj?=
 =?utf-8?B?bFhnY0N4MlI2T2Y5WmpoME8yWkc1TTNRTzBmdWs0Q1U0cEx1ZjRjU24wRThS?=
 =?utf-8?B?cEl0NmNCa1M4THpROWZBTVFtb0JJNkZPMG9lWUJqSUJOYm43MWY0RjVRa05v?=
 =?utf-8?B?UXd0TVhQa2tQYlFzL3pWYkdrenVJbkhxYWRGbXBhZ1ZuVWNPTXdZWnQycWEz?=
 =?utf-8?B?TmN2SWYydlM3R25ZVFlJWTlISk96SXRtWkhwS1M1eTlEUGVmVkxaQ2pJU1Bp?=
 =?utf-8?B?SWZnenVtdlZEMUJXVnZoL1l6ZXJpS2RncGJWRFhVd1d2cG5OeGltakFvdUQ0?=
 =?utf-8?B?Tm5JUVRGWEdtTjhobTZwUm00dVJzR2JFYi9iKytIQlVESkFFQ3FvWnpMcm9U?=
 =?utf-8?B?ZnlwUk1PN2IwWTIzZjl1cDY3bit4ZzAyR2JhTDR5ZHBxL292dzZXY1JnSnpt?=
 =?utf-8?B?eVIweDNQZENoN3ZRS3ZGRkRZdldpV2t2aC9MZVE0VGJFaHd6MmZzSUYxSDdK?=
 =?utf-8?B?MTFOT1ZRcUdpalE5QXFjakRrTTdkenkvR2QwdjlnQTkwei9rSHNubDVPSDcy?=
 =?utf-8?B?b2d4dGlUOS9kVGkxV2hLYmgra1VyNDNWSWZLelNGLzRuUk5YNWhLSklKb0hI?=
 =?utf-8?B?MmMwQlY0V25lb1JyS0dGaXNBbzl1QkU4T0d0Q1VLa3pLTkV6SVBZS1FhR3Yw?=
 =?utf-8?B?eEV6emN2amFTVFR0RHluYkU0UVoreUlNendnbTBSQVQ0dHlJQTJhblFjbW9H?=
 =?utf-8?B?VVR0RExXdVJJT2k3TTlncXVaL2YvcTYyQlFYM1pRaUhVbGRLcWxhdWNTSmZU?=
 =?utf-8?B?aWtaNzBzTW5naHgyQjJVeEFHMkpMRkplb3ZZb3ZuN0dWUFB1L2NOMTIrSGVC?=
 =?utf-8?B?cUZDY3ZibWhsZ2JXaXRueXVoMEtSUWFGRTR5M2h3ZFNTNitKTEFsMXkvOVBa?=
 =?utf-8?B?UjBCTkcwRTBrQUtRZSt1L2pOdDF3RXZPNGVEOUU4WGNBcUJJWlA4MkgvMzBj?=
 =?utf-8?B?c2JpYWdmR2ZIano4RFJnNEV5SGhFWURvNnFoUUVvRm4yaW1ZeW1FSldpeVZD?=
 =?utf-8?B?RGNMdmV2djlpYzJDVzB2Yk5VdEYrYjhsZFNTYklWMEpjQ1JSOFpVQ01qNmhC?=
 =?utf-8?B?MHpJUFZyWDRTekhnYnllSXhZam41MWlDUUJZajMzZFoweElzQmJlRi95QkhT?=
 =?utf-8?B?ZkhBclNiNnFVWisxVUJXTkgxTXZSL2kwbTFZaWY2WmlTK1E2ZjVWLzZVbHNR?=
 =?utf-8?B?ZzVWN01lVEJWUisvNUFldThZU2ppQXJoL1pmRFZKK1k2eFI2b3V1Zlhxd2d5?=
 =?utf-8?B?Nmt2Vm1kVVRhOWN1WDhFOWZDS1RHRW5Pd0o5K0lLc1pTZlR6VzY1azEwSE9w?=
 =?utf-8?B?eTJRbElrVzlCK3BsSm5oUk5FdS9LK0I0TmxZclFUaUZHWFF4dCsrUHJmWUht?=
 =?utf-8?B?V2JjRG5STGd2dlFxMU9zUkROUUxYVzlrOEFxRmkwckRzaWV0SENEb0dwRWhM?=
 =?utf-8?B?bzhna3hFWElGMGxscUsvaGk3d0kwN1Niajk1T1dYSndvMkNJdFM1Y0V0cTh1?=
 =?utf-8?Q?F63pr/8OGGbct8Lgpd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4a62b9-fb74-4a2d-1482-08df09089107
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:40:50.9450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyEOXYcp9bLu+EOyimAJM7T64NSCnHkCEM050+01yKNiqkjzr2y1wCPMGjIMFJto
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9049

Hi Reinette,

On 9/1/26 19:21, Reinette Chatre wrote:
> Hi Boris and Babu,
> 
> On 9/1/26 4:21 PM, Borislav Petkov wrote:
>> On Tue, Sep 01, 2026 at 12:26:16PM -0700, Reinette Chatre wrote:
>>>  From my side I provide a very high level summary of my view below as we await
>>> guidance per [1]:
>>
>> I thought we agreed on that:
>>
>> https://lore.kernel.org/r/20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local
>>
>> and
>>
>> https://lore.kernel.org/lkml/98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com/
>>
>> I am reading your reply as you're agreeing with me.
> 
> 
> Boris:
> 	I agreed to follow your guidance. I did have some nitpicks in the email that
> 	you linked to and the discussion that followed created the impression with
> 	me that	you were considering other options. Specifically
> 
> 	https://lore.kernel.org/lkml/20260805002138.GHanKCEmyMcvK8Xg4w@fat_crate.local/
> 
> 	is what I misunderstood as this topic still being open. My apologies.
> 
> Babu:
> 	To answer your question on how to move forward I thus think what is needed
> 	is a minimized patch for easier backporting that is marked for stable. Also

Sure. The code change is a single line; most of the work is 
documentation. These changes landed only a couple of releases ago, so I 
expect a straightforward backport. I can help if anything comes up.

> 	consider
> 
> 	https://lore.kernel.org/all/d476ea5e-340b-4d65-8207-cc1a0055b4aa@intel.com/
> 
> 	when writing the changelog. For me to sign off on this change the changelog has
> 	to be accurate and complete.

Sure, will do. Please let me know if I missed anything — we can tighten 
it up in the next revision.

> 
> 	Please also follow up with pqos team on the issue you created there to motivate
> 	this patch.

Sure. Will do.

Thanks
Babu
