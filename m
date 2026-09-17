Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0DC2BE7BE;
	Thu, 17 Sep 2026 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644220; cv=fail; b=Vt5G9t4lCWH14EBJHzksRMlSGgDIC6b62eiMcByaN8o8De3OFNJ1xoijz3NBagoOR2jrW+kXxHkg05b/TjxSajtMspA10duiMoHrfH8Nn3maQwCQpV9YRZeDIWz8Fyl1EPxMAWy+YICGRgISZs7x0GQdz3JZmcG4crPBcrRb0QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644220; c=relaxed/simple;
	bh=yMoSUauot8m54IuJ89b5g4f176wcKOPbtTvkG7CYyDU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FSyJGwy0btRYvzPO4dXfeIk8kY38+XVHeBHh1TmTzt5phhwevi+5eWueBuCMtOKauftgXHsc38ZysD8cmLRCZ7NNtWgeX1KadTR70RjKZ5lUU26QVUJTI1wZ0Xi1YxgkAeKMpJSPc6De4i6GDmdfBy5t+FFnZ9O0gsUCePH7d98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hx90EDqz; arc=fail smtp.client-ip=52.101.61.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hx90EDqz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0AiwT4+A6PPmpoMCIpwM9ReXzgSD5xL1nwEFGJrMgeluA90+yIl1uxPANcqU3BthH2usZ0qY1day8+Wg5LLL+I5fnsYawu30b4mHQjQnMyAxzQvuZTtWOjDzhH2z1vNHtzL85CClkTjdAUv/dmhaR2+X/M2L03vUXs5THWqAymfphYlvco6INGmNi64qzgms9wHJLbEIrkftdyHdZ8o2D2Lr3XsR74cQbb+Bar3hRnrqaXpeIMhOyqubEDQ48HAyYIR5Ds6m0ex4fAUfiVVLMEOjvuSD+f0vsnsqdn4cNU5NHa+e5BqXNxMIV3KlJiKAauljWpmmF0hdtxufdpQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTcFw7JdWLwIQVnPeW6v6kRCmMdGtbjpYYImpNceCLQ=;
 b=Mp5mho75cJ2Gn/8VQ86Gp0/eM8cIbnDj14dnfnUdyQARVLneOASb/2QCqlPN/GDBNtyomdNZZVhzlcH2D7dm7Wmq32zhoUsV2EvurJDVxbcSvSFUiZJ2WS79jPo7cSyfTfOQazU5rU5+krmwlqahDG/jV3+onXzyeSZGd5ZKJVOeoNCpi+Fsta84TKuUqd9j1sjhyFWWI890VRL50+fnmBNWl+B0foNzqBXJUoho3JPPT5tlidLTIo6FHjcQ7YV5e8QviHfrjVhuarRFISskFm+cF8CLLLyaA7JEcRotPXoryf0ojdR7O9QbftWKLMbjAirR9R72hAjCdqCCRBg6cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTcFw7JdWLwIQVnPeW6v6kRCmMdGtbjpYYImpNceCLQ=;
 b=hx90EDqzTZFndiOPwOV+Vbup07tAW/P4wnEBbjQa+OjLe4h7JubiWwKVfbY8paxKiIrpCSIFF0BOQGlr5Gdcv9IDtowlBrqmN+qYS+STX1K1FkVcwCAe8tzSnLbhPF6neo4wGPKG4HPe7n/2slAfqC8kC2huHE8PYsoboW0r2iI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by IA1PR12MB8240.namprd12.prod.outlook.com (2603:10b6:208:3f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Thu, 17 Sep
 2026 11:23:30 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 11:23:30 +0000
Message-ID: <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
Date: Thu, 17 Sep 2026 13:23:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
To: Frank Li <Frank.li@oss.nxp.com>, Conor Dooley <conor@kernel.org>
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
 alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
 <20260908-groin-undivided-0af701135404@spud> <aqGHlWpQjpHEft3j@SMW015318>
 <aqKWTT47S_zPzvbN@squawk> <aqLQaHndX4t1kKLG@SMW015318>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <aqLQaHndX4t1kKLG@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF00000144.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::88e) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|IA1PR12MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fc019f-4cb6-45d3-85f0-08df14ae19f6
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|56012099006|18002099003|6133799003|22082099003|3023799007|4143699003|11063799006|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	NQMvgFVIzFK8slQamPQf12vBDbKG9ck0IBi+hVAEWZ+6J0Z17eU2Hby2jinBV88WYGwepe4ToaZTZvBIqdh8AOD6TOe2rgj70d6CD0yKoBRQ7r3QMjx8kS8PX9+XNJBOff+NewtdTCVLtLxHHR0hUYA7IiI68J8IirWCWvOqBmPfe8+jJnnJPVqTgFUUm2GKGpgti1l1kNZvroTNuN5p6qcdQu7i+/gOfdIKSM5C8YO/oHs/LC1RVC8oBk1OAK8KGouZ/iEME4V0PD87e3ulmucqczjO2sEp4X8cWb0CqXROKeSymU8WJ57JhUkcmSzjmOTlQMJk7A/4YgTT94dR+0K8iF5XAvawkXOiEi+ptkM6ZWHhkiFxV/hjoSzg1l401JqTBh3Tg3F5B7ZMjcf+DUAnjhRJA2TWuuK/XO8NXE24JhEW5vJX4WA6nlOPdmhgaofvbvnbj9deORNmEO2BeipodprKm164f5piUSximj+UeHJIOIiW8gpajxJBf5T9JBWYPsZcfEcJatASnp6ghEYfnDNrEDzwuwOwSKC4mGSEFbcFLMwjdtPKb/ryYjpZqhFjT6NDO6Xtaifnaw4M07IIE5pC4Hz81dF8XL7Pw9lOzsjP4kpav9hRY9u3Aq4xT2KqQTkXxWCNUVi/+SXx0OXtDgaIl757wiDPv3XaCRQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(56012099006)(18002099003)(6133799003)(22082099003)(3023799007)(4143699003)(11063799006)(10067099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmFGR1dCTkYzNFZHVGRoLzJuUytkMWVEaFlpMzV4NXpsZFM3NjcrODBlbnZt?=
 =?utf-8?B?QVJrMk1VMldKYzRMOEJxMVZzM2thbzI4eEhaVm5oajRnWmZqZWFTNlNUL3Jh?=
 =?utf-8?B?U0tWMDI4QlRpaCtkdVBSbTAvN3dISGNvazZMMXN6M2dlOTVWTEZIUHFKOWg5?=
 =?utf-8?B?KzJTZk43ZTNtMitZUXZsV0ZVb2tqeHRNdnRmN25tOGF2T2t3Z0xwR3M0UlZu?=
 =?utf-8?B?RFdqQ0FmdUpBdGo4SkN2ajNNcTBhNHlhd0tqWGNzNXBYcFQ5MHZ4S3JuMTdI?=
 =?utf-8?B?S1k1Y3dyVmlTTExPMUxEVkVId2pxZk14UGtld2NucnNQUWxjemFHeE5QWU5Z?=
 =?utf-8?B?TkFGQ29sSkZ5N1NUVXBiK2lzcFJPb1ZaYStlbUVPdFFFTnB0bThVbkhrdlEv?=
 =?utf-8?B?SmZLU2dlNXh5Sm9BTTZnNWt1clZWeUlJYjBPS3hXY0s3VC9LemU1UkhMV0Q2?=
 =?utf-8?B?TFIwUW5qWjJjMzl2WS9ySDI4UmlSUis0dWdONk11eFZhWUhkS2djdHpZL1di?=
 =?utf-8?B?cHJidkN0blRRRlFoeXNlTXZjVXNUL1ZmMHU1cWladURnOVFHUnRqZWJBNnNN?=
 =?utf-8?B?WVJVRHo3V0hTMWZCclBVT0w2RWFSb1I3UHAxaEtJZmtUQ2NvcEFmcTI4bkFX?=
 =?utf-8?B?NTJ5ZjRyclVDeEhEY1RlVUkxQng3ODdJNVYwNklrQ3R5QmV5QnFuZ0lSY1NQ?=
 =?utf-8?B?anRvMjRCTStIQllLSUE4VVhPS2o5T2xhZXN3d3huUTBVVjRUTm1iSXlKM1RS?=
 =?utf-8?B?cFVEVElPdVpIOVZuNjlJMzBaQnJUQkdsaHNUb3Y0UW1DS2lvSjEvYllzZEJt?=
 =?utf-8?B?bEY1NDlIQkt2Y3JnSjJ0NVAxZnlZUHZkTXpDbWwwT0pYUGh3L3F0RWViOVhy?=
 =?utf-8?B?OTRHT3RmZElWRVJLeWJYV0xtTjJ1bnU4WEpJaEZZajBVTk53YTlMVlZOMGoy?=
 =?utf-8?B?bGRkcUMzOVR5TDNHOS9aR2JCMjVuYlRQbnJObUF6NktMUVZaSkpNbnpKQjl2?=
 =?utf-8?B?RElLc0crbFJKeVVHMklpdTNaNGFtQXRTenpXbjc2TVliMXpzcmpva1RQeFhz?=
 =?utf-8?B?ZDRKdlFHUU9VcjVYNGE0cTB5dS9OSENySllITDhoeXlaWmhFM0tJWnlBTi91?=
 =?utf-8?B?cCt1M2M1dlgySUMzRWc1NU02MHppSlFFZzBNOTI5SGR5ZXliM1labVNUcFh4?=
 =?utf-8?B?disyUS9PR0hZY1JMOURQZGdPMjlCeElyWkRCNHNWTmQzSTEydUJFQlg1cVl2?=
 =?utf-8?B?ZU0zRnFUMjlGTSt3c09LRXdxampQTWRxQkJZOGZJTEZENnRIUnJZSEUrTnAv?=
 =?utf-8?B?ZGRSNzJIT3JybGQwSTJVeXZzRTVBS3AxdHdrUXhrS0ZrcHdiUkZCb25VV01R?=
 =?utf-8?B?ZzhJbGQ1bjZDazU3NU9FOERuOW9yY2V4SXdGM0s2bEhxMUNUQzFoeDRUL2Y5?=
 =?utf-8?B?NEVhT2UzT3FxWENvZXhZUDg0VFE5MHZqVmpZc3hjUVcyY0FSOXJWUkhTUG1h?=
 =?utf-8?B?b3ZRUUlxeVVXbzNPbTdEMU5ybE1pWFJYQXFXT1YzL2VMakdmdXl5TkpiUk9Q?=
 =?utf-8?B?OXBGVjJwRVZZTW1adjNCblVOTlQyTmFSbzFKS0tMWk5jWGNRU3I3UEdidTRG?=
 =?utf-8?B?YmpGQ2pRWGFlQTNEUFE2aEVIWlE1Y094RTNMZXpsdC9KNThHRXVia1ZqQkpI?=
 =?utf-8?B?YUdNd2JuRUsrRWh2aC9JVFRyYSt2dEZ4TkNENjNDYk9kVlR6U1BBK05HWnNs?=
 =?utf-8?B?Q1A3Y1hPOXRYNEgzWEp5cVFkNVNPNEVGR3RJK016THhKYVUvazNCWXM5SnM0?=
 =?utf-8?B?U2M1UCtIakFwRzlGTzZkUUFHcWlEQmhnRldwMCtVT1IwSzc5RWZRdlp3RmFR?=
 =?utf-8?B?ODhrUjV5VlRLWEZLV0RoamdNTEtxQ3hINzZ3eHkyc3RhVzZTVnk4WkpRWWhn?=
 =?utf-8?B?UHBQRms1alNBS2FQRWRMSWU3MHZGRFp0UmloYXp5ZnpROStaQnJieXdRSlVo?=
 =?utf-8?B?ZFk2K3d2RE1TVGlTc1hzMjZTY0toaTZEWVMyMGpqTmE5ZmprWno3a0k4ZVdw?=
 =?utf-8?B?MnlOMEZSSEpMMW81b3F3MlYvb2cvbU9BNitpUFE4WUNiaWRUM3ZjdzhCQXJ1?=
 =?utf-8?B?OE1xdHhIcVl6RGNXU0dHdkUyQm1seDN6TnNXa0xSMEY4VVhJYjh3VU00djFs?=
 =?utf-8?B?c1M3STFnQkZEL3JRNi9nTm9leUJkODRjZUc2TWRTZ1ZlcDV2ZlkrMmIvdWxT?=
 =?utf-8?B?amJoNnM3d3ozUmpqdVpPK0JvYlhiczhBOHRRM0JVdTJDZmhYWStuY1J1RFRo?=
 =?utf-8?B?aUZ6YmtlY2loUEtCVmNOVGlDVUJrQ3d1RjdmWXE4YWJXY2NSWUxUZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fc019f-4cb6-45d3-85f0-08df14ae19f6
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 11:23:30.4268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6H/Y/9xRiCRNKWBTKSqWlWXgu+C59C1DlHiMJueFxCePXs4Q1DcqmI1wJuvROwC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8240



On 9/10/26 17:44, Frank Li wrote:
> On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
>> On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
>>> On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
>>>> On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
>>>>> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
>>>>> IP. Describe them with two boolean properties.
>>>>>
>>>>> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
>>>>> capable design is always IBI capable as well. Both events are reported
>>>>> through the controller interrupt, which is therefore required whenever
>>>>> the capability is present.
>>>>>
>>>>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
>>>>> ---
>>>>> Changes in V3:
>>>>> - Move in-band-interrupt-capable and hot-join-capable into the common
>>>>>    i3c.yaml schema and drop the xlnx, prefix.
>>>>> - Keep dependencies in the AMD binding.
>>>>> - Update the commit description accordingly.
>>>>> - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
>>>>>    binding [1].
>>>>>    That Acked-by is not carried here: the names lost the vendor prefix
>>>>>    and the definitions moved to i3c.yaml after Frank Li's comment.
>>>>>    [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@spud/
>>>>
>>>> I disagree with Frank. These properties make sense for Xilinx because it
>>>> is an FPGA IP and synthesis options impact this. For other devices, this
>>>> should be determined from the compatible.
>>>> Please revert to how things were done in v2, especially as no rationale
>>>> was provided for why these should be common.
>>>
>>> It is common problems, when IP intergrate by SOC, which may defeature some
>>> part, It is not appeared now just because IBI and HJ have not enabled
>>> widely.
>>>
>>> IBI and HJ is optional features of I3C. Ideally it should be indicated by
>>> some registers. But not all vendor implement provide this CAP registers.
>>>
>>> IBI and HJ depend on some slow clocks, which monitor SDA line change.
>>> Some instances of IP may not have such slow clocks. Some IP's IBI and HJ
>>> use seperate IRQ line, but these irq line may not connect of difference
>>> instances.
>>
>> All of this should be able to be dealt with by appropriate use of
>> specific compatibles.
> 
> I understand compatible can cover most cases. Need variance for property.
> 
>>
>>> like previous SPI vendor customized property, we takes efforts to convert
>>> to common one and also meet back compatiblity problem at convert. I don't
>>> want to do it again. This kind property is most likely as below.
>>
>> What SPI controller specific properties are you talking about here?
>> There are relatively few properties in spi-controller.yaml, and none of
>> them deal with these kinds of capabilities.
> 
> num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fixed, but
> some instances have not route all CS to pad.
> 
>>
>>>
>>> default: 	decide by comaptible string or hardware cap
>>> force-disabled: force disable for some reason, like, miss connect irq line
>>> or missed some clock, or IP bugs, or board desgin's some level shift chip
>>> broken IBI/HJ timing requirements.
>>
>> Of these, only the last would be a valid reason for having a property
>> for it. Missing interrupts, clocks or IP bugs should all be dealt with
>> using device specific compatibles.
>> If board wiring causes the breakage, the property may be more
>> appropriate at the i3c device level rather than the controller given
>> that wiring to some devices on the bus may not have the problems?
> 
> I3C.yaml is for both master controller and devices now. I3C is bus, which
> connect many devices, if wiring issue, whole bus can't support IBI. And
> if any broken devices happen at address arbitation, whole bus can't support
> IBI.
> 
> at beging, I suggest 3 state,
> 
> [default, enable, disable], but now I think IBI_broken, HJ_broken is more
> reasonable to disable it, default value should be set by compatible
> string or DCR of I3C regiser.
> 
> And some I3C device may be failure to work with IBI even DCR of I3C register
> show it support IBI.
> 
> I don't want to appear two similar property between vendor and common, like
> num-cs vs fsl,espi-num-chipselects.
> 
> such as IBI-broken can be used for controller and devices case.
> 
>> That said, I think that problem should be dealt with when it arises,
>> rather than starting a trend of adding capabilities properties at the
>> controller level when I am not convinced that there's going to be other
>> users in the same vein.
> 
> Understand, I3C is realtive new protocal. 'IBI-broken' is more easy
> understand,  logically equial to in-band-interrupt-capable.
Conor: Any update on this one? I think this thread is stuck at this stage.

Thanks,
Michal


