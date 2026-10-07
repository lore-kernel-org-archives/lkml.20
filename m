Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010050.outbound.protection.outlook.com [52.101.61.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EF916F288;
	Wed,  7 Oct 2026 06:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791353010; cv=fail; b=IMJTpG5T6LMEgHhz7wp9R6pWBV3bQoXbEbzwXhvUsTkPXCukwkVPWc0Mxi/dDFAhXa9/OIt7XcxfeVKpw4VlXF6ofO/FhdXe3G4Qj6wztgv8LdKwXtE/iofpPDx7MUMMpWD/6D15WO6zw2MFrFDJMs1vzEBP5BZVuserCP9OSms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791353010; c=relaxed/simple;
	bh=MZ/ovASUB8UOqssOtY0XmzygAaJR2VQ0kdkplX1W+7E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MQSPiQkVRzfsFrHA3DLBdrbiA5OdV10vtj1AOn/t19I1o7SmqeMpElmTCxQWy0ZkL/ixNkOkD11O0ohLXMdYKVbxgoGg6KGFYKbKmno4vIdj3Vg9aJcnvapAViyaX4WBotyVc/S8c2rODHbfofVr+HtRBuRfEiZw6VMAK6kWG/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4mhvpB9c; arc=fail smtp.client-ip=52.101.61.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4mhvpB9c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdIV4EDmuCBUZ1snUZNQ44cLBWvxm3G06N/di4AdXX1hsKm/xWfS4eq5B7dutco9XCnwTU8bKIfyCkxH632IRoKdS4zm3Mv3glafvI4y6UNoL4EuxVk8D9QFfeBMpPHLd8zLVHM4m++S2DLsV2npSegJE1Muq+5uuXYdItEhOel1ce+086cLy0OnNpTdWoNCLS2yNelK+zPY4tKe8cJzy2q4Zl4dInctPfoBkml/RdbCInt+Qc52tfvaQ/YY7UaO1gKuohGrjnL3uQEtfdtRkqqYRbfOnqTzATdnslZDd2LmHuKjwUcZ7wekgIe12gw3S4mc5uqoLaXQTH7uEQ2JrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ubyh75R/28ZKgeD46dSoDkgdTfLsBT3zOZt+xoPDjQg=;
 b=R2FwEh3eNm+LfgefruKf8fTXGCdYkWGu6to2Ll0OcKxmm864AC1cdZ/vO1+rtJFSTi0NaiqxgmaGyHh4JoS0Jy4plCv6Dmn/H6PoMVbz4aVsE5TlUxiG4J89xrSAcAXAPxYuxTjQlWhiwOaqAB50THqg/6P23/jrnsJ+57w2PlkmgAvC5h53ES5AlXP0C1sd2lXDGzgvCOGSurHMkXH6uV6GehAkqA03yi+dzCogmrUZcBn7CiOTJIOm7jM4qfdrC+N13XFTXV6I+j8nqsamMIuWyyRGWK2vuIq0JDTdLlXu8vEYjzPqHbEvPBV1Q6rhbjUzdWAZ1+7HLzw4F+ga0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ubyh75R/28ZKgeD46dSoDkgdTfLsBT3zOZt+xoPDjQg=;
 b=4mhvpB9cpZS16RqcEu+ycQ6nkpt5XnOKA/YLIf1ayqosHfpZMppLiQh7OuBlD7Im+sM+UzRFU5LZTSby3moVZulcXtKHf94xg4VbkTWKycz0MKNeaaOY+s6Vb92CkHYHxKGnAjjzqJhh8somc7+X3Ausx0zrV2RAxq/EtiW3D+o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 by MW4PR12MB6851.namprd12.prod.outlook.com (2603:10b6:303:20b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 7 Oct
 2026 06:03:11 +0000
Received: from IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466]) by IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466%7]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 06:03:11 +0000
Message-ID: <8547c8c6-502f-4dca-a82f-893a5568f7d6@amd.com>
Date: Wed, 7 Oct 2026 11:33:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
To: Rob Herring <robh@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,
 Shubham Patil <shubhamsanjay.patil@amd.com>, alexandre.belloni@bootlin.com,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com
References: <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
 <20260922-bullpen-reprise-f62e01922d88@spud>
 <20260922-immersion-salvage-00450539f1ce@spud> <arKr-oapsl5qzo_E@SMW015318>
 <20260922-purple-overnight-2cdd2ddd5270@spud> <arLKWE1tJrKnzGdp@SMW015318>
 <20260922-unadvised-stalling-5cbeff8f982a@spud> <arL_Zgi1r1IFpNIO@SMW015318>
 <20260923-overturn-acts-5abc2e4fe6ed@spud> <arPlFMhcL7Jxh4wP@SMW015318>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <arPlFMhcL7Jxh4wP@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0348.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::6) To IA1PR12MB8408.namprd12.prod.outlook.com
 (2603:10b6:208:3db::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8408:EE_|MW4PR12MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 832360a8-f3b2-45c3-75e5-08df2438aa84
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|10067099003|18002099003|22082099003|3023799007|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	H/DBpFIBFszkiV5Y14F9OkEPKflAjdJqA4eRB2Pzdn+NH/kgjQktci+W359AZUDmnnYvF3PsnewXpB87h7hZvq0aSJdGaXBdWDPzasckro/MALB4eSRsxRVfgYSKh761L3VMyM4ffTexwS4v6kGNW+mVNTKatvlmROiQLmCaYFQWeBIaLY21zIPG3Pld0zmED8aS46N+ay/SH30pN8wAUFt/rL/8zm1N2DJm4bvmoXL+XZ3ggBnC22FJ80hrGVKxCNyEOqPs8Rh7XeoxbbfpKKwhITH73yGSZEIEXdG6g3HXL4Ss0uCXJSwa1xS5Cg5rizDyAKdH9a17uHWnzbED6szfZIRmB3k2bahCQXRbjtTc23VUjKwclDt4lJ/WroGAhKKN6Zm+GnhL/+iLom8d2FQlJa7piViP9itGQHKEmECTUg3IB7hybf7IZfBfVZJKN0TND00seu1ERFVXIMhQ04Jqojtm5AAT0XP6eVwjE6pQe+e5gE3BmVusuEZJV66nOQ9dMhEhJ5162vbPrXpkrv/d83sjo1mglvvxrgxBYkfVwLkAhT9p8s+vUjqwlYYO2/Wh8fIdOWq68L2FgCCr9OwCVthuzX9bwu4i7T8Ts2TRdlV8BWjogRLBVKm33o7z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mys1OFZmdmtBOFJsYTJjMUZqSU9wbjRFRnlWcE9FZDI0K0dLeEE5ZE82VU1I?=
 =?utf-8?B?SWQ5NnozQTd5VktWbFZvMEJkeWVMYVcyK1U3d0hWdnptNUFXSGNQQXExMjNk?=
 =?utf-8?B?cFhxL2RzZTl0MU1WRmRtQi9ZYkdYZFZoZWYzbkxsMXFlL2dhQUI5ZVIvWkpW?=
 =?utf-8?B?Y1NZemxKc2V4WXB2K2JjTXpnbXZiRUtubmcyMVJEd3JIRGNHaGJvZGIwNlRP?=
 =?utf-8?B?Um90dVNnWmM2azMxUFdoV3JmaERqS2NNQnJmTFdPQkI2bUo3WHdLN0JyczZa?=
 =?utf-8?B?Zk5CbWNOQzh2bFZZbnllTXFIM0U0WmY2UE15aHlFUUdhblBEclBEekRsY1lR?=
 =?utf-8?B?dHJKK0ZUS3hGYUJObmU2RmREUXlncExQTGFPS3NoTUErVGxJbGZYODZEZHNR?=
 =?utf-8?B?TVIvNEtnYjROMnNXN3pyeEp4MHBBNDVHSXA2QkNEcVVPTUxLZUpVbFFzY2lH?=
 =?utf-8?B?U2tsY3d2NXdxbm9JV3dtTWpRYnNNQStid056T3RjTW1sYXFqZ29rWC9lQUMv?=
 =?utf-8?B?SHVSQWEySTdaK0ViYWdVVVgwM1FGQTF6ZDltM0IrTXZXRXRteHprUE14aUxO?=
 =?utf-8?B?ZnhWSDlLek1KcThUMHZQWnpWbmNGcVZ0cEl3ZVNLUEkwRXpsUW5WL1hjNHBW?=
 =?utf-8?B?WlZxMGZGYTlab2RQMDNZWHVqSjJXeUw4U0gwZUZKRnFRTWdGOGptenQ3MEJu?=
 =?utf-8?B?dTdWQk1DUFdqVDczN3kwbHg5VlZ5T1dsQzhYRE1hdXMxNk9WSmRlYXI5eGk3?=
 =?utf-8?B?WS9TZDJ5US9CK0FRZ0trbmRod204UG1FN3dma0lrZGl0SVhLL0svUHVLR2JR?=
 =?utf-8?B?d2dVcTNWdThNL0xzdVQ2bHBQWUlBU1R5WjRyZHZjb0JwYk9ZTGxIR0pMcFZC?=
 =?utf-8?B?Y0RYNFBWNmdCZlcveGIzOER4V1dUZGZsdjd4SCtNSzluaHcyQ1UveVFSRnEy?=
 =?utf-8?B?RGMzZUFETnVqNzE3cHhsbWNhTUVNQmNuV2lONDlITUk1cEUvT2YvRlRoaDhM?=
 =?utf-8?B?N3psV0tDZWt6ZVIySDR6d1RIVUdtcWU4OHlTU0JIZzNiN2tNVnFDMmZGS3pa?=
 =?utf-8?B?QVk2KzJvQjJObEphbmFGUXQraFdYdlF6b0dKUm5hSG4zSVVRYm1XMFJKWitP?=
 =?utf-8?B?blRER3BJRmpkdUp3OVMvNEswUUE1SnA2OGpzcjdNbDFuUEZoaUoxck5GdEN5?=
 =?utf-8?B?aTFRbkZsQk82bnNSdE1odEp1emlBTTZRZ2ZyMi9RRlhkeWxuRFk4ZGVGUzhk?=
 =?utf-8?B?UEs3Uzh2Umh6THpDcVlsQ0tJZncyLzFtYnRqSVRaRENCMVNMaXFEYU5kSkps?=
 =?utf-8?B?UXRkdnRYdksrR3Y2eTVKcU9jQzRSd0xBTmUrMmNLbEc4L1JTN3dGQU1lNVN4?=
 =?utf-8?B?eTM0RlR6TDF3MnIxbUN3UDh2T0xGK1BQZmdhYzAvMEdzT2hYVjNMT0ZDQXdk?=
 =?utf-8?B?UHpDeFpYVS9CL0pMRTJPS1NFMXg1cytaSTZTNE8yR2lMcTdXMHNQYVI1UkVw?=
 =?utf-8?B?NzNXQUxnVC9MSmFxQ1RhUnNxbmlwRks2N2prdEtaZnZyYkRwRStCc3JBVzdM?=
 =?utf-8?B?MFVmUG1tWUlRU0RZVVZrMEk2Snh6R3VLTFZ2K3kwNzA0cDJ0TW8xSkQ5TWc2?=
 =?utf-8?B?QkJ1Y2greXBZSE8xMXYwdmVaWGwxU1prWGFvdzljOXFhRHBzcTA0Wlk0UGVS?=
 =?utf-8?B?TDk5SWQ1Yk5WcmNuOWJWMENacU8wa1gvNkdYZFlUcFVVU2ExTXpnY2xpSnBm?=
 =?utf-8?B?WCtHbTNzTHc0ZDhDNjlPOTRyRE54eUhEUGRrUk9wSHdOM0x3NHRvdzdGd1ZD?=
 =?utf-8?B?Wit1VkJQZ0NJMjQ3MFE3NnFBdlc1WXZkU0Y2VDhFdmxqOE9WaTRVeGlpL0lG?=
 =?utf-8?B?UTFYT2ZKeTFDaXNKRHhaODJON2lCaVNnUmVHZTMwUzNsTDRFM1N3WGZLWDRu?=
 =?utf-8?B?VmZtcmRyeHRCeTlTcXIwOHI0ekRxeUh0L0RoMnhkcDQyMVhWR3E5S0RQSi9m?=
 =?utf-8?B?TE1WQnQxN1o4ajRnZ08wN2pjNGVqZHZmcytVcS9LMEFHQWx0WjNpLytGZVRC?=
 =?utf-8?B?NUF4R3JnN1dJdDNBTTdyVWsyeEdpcWFjK1B6SldhWU9VMXQvbHdZMzBJNlRP?=
 =?utf-8?B?Z3dnM25pNUw1NFIrYmhUWDY5aEp1V0E2MTJpSjMzZ1VnSTBqT0JCWDhrSEdQ?=
 =?utf-8?B?cGlDVjRndUwxNFF1TWFySUdvYTkrcVZ3L0pHWEtVUG5OWk8rcTZmV3d3Yk1T?=
 =?utf-8?B?ZUFTbFBOOWNtUUFtZlZwbUsxSjZ5aEhvdmhHcXlBWnN6cExQMkFubnZDMXV1?=
 =?utf-8?B?SVROSUROVkxsYWFRWDdnVHErVm9NNm5xUlM0WHB3TndsWDhvSEZRUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 832360a8-f3b2-45c3-75e5-08df2438aa84
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 06:03:11.1229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYalP203rPx3++hpgDGqz+9waA698KizpAZkX4M5zYydUaz4XxSdED4l/Q8VJNwSn4hNi/5r82xPT4WxwU1aXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6851

Hi Rob, Just a reminder !

On 9/23/2026 8:11 PM, Frank Li wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Wed, Sep 23, 2026 at 12:43:22PM +0100, Conor Dooley wrote:
>> On Tue, Sep 22, 2026 at 05:21:26PM -0500, Frank Li wrote:
>>> On Tue, Sep 22, 2026 at 10:29:31PM +0100, Conor Dooley wrote:
>>>> On Tue, Sep 22, 2026 at 01:35:04PM -0500, Frank Li wrote:
>>>>> On Tue, Sep 22, 2026 at 06:24:52PM +0100, Conor Dooley wrote:
>>>>>> On Tue, Sep 22, 2026 at 11:25:30AM -0500, Frank Li wrote:
>>>>>>> On Tue, Sep 22, 2026 at 10:39:23AM +0100, Conor Dooley wrote:
>>>>>>>> On Tue, Sep 22, 2026 at 10:38:17AM +0100, Conor Dooley wrote:
>>>>>>>>> On Tue, Sep 22, 2026 at 10:33:44AM +0100, Conor Dooley wrote:
>>>>>>>>>> On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 9/10/26 17:44, Frank Li wrote:
>>>>>>>>>>>> On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
>>>>>>>>>>>>> On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
>>>>>>>>>>>>>> On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
>>>>>>>>>>>>>>> On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
>>>>>>>>>>>>>>>> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
>>>>>>>>>>>>>>>> IP. Describe them with two boolean properties.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
>>>>>>>>>>>>>>>> capable design is always IBI capable as well. Both events are reported
>>>>>>>>>>>>>>>> through the controller interrupt, which is therefore required whenever
>>>>>>>>>>>>>>>> the capability is present.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>> Changes in V3:
>>>>>>>>>>>>>>>> - Move in-band-interrupt-capable and hot-join-capable into the common
>>>>>>>>>>>>>>>>     i3c.yaml schema and drop the xlnx, prefix.
>>>>>>>>>>>>>>>> - Keep dependencies in the AMD binding.
>>>>>>>>>>>>>>>> - Update the commit description accordingly.
>>>>>>>>>>>>>>>> - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
>>>>>>>>>>>>>>>>     binding [1].
>>>>>>>>>>>>>>>>     That Acked-by is not carried here: the names lost the vendor prefix
>>>>>>>>>>>>>>>>     and the definitions moved to i3c.yaml after Frank Li's comment.
>>>>>>>>>>>>>>>>     [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@spud/
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I disagree with Frank. These properties make sense for Xilinx because it
>>>>>>>>>>>>>>> is an FPGA IP and synthesis options impact this. For other devices, this
>>>>>>>>>>>>>>> should be determined from the compatible.
>>>>>>>>>>>>>>> Please revert to how things were done in v2, especially as no rationale
>>>>>>>>>>>>>>> was provided for why these should be common.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> It is common problems, when IP intergrate by SOC, which may defeature some
>>>>>>>>>>>>>> part, It is not appeared now just because IBI and HJ have not enabled
>>>>>>>>>>>>>> widely.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> IBI and HJ is optional features of I3C. Ideally it should be indicated by
>>>>>>>>>>>>>> some registers. But not all vendor implement provide this CAP registers.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> IBI and HJ depend on some slow clocks, which monitor SDA line change.
>>>>>>>>>>>>>> Some instances of IP may not have such slow clocks. Some IP's IBI and HJ
>>>>>>>>>>>>>> use seperate IRQ line, but these irq line may not connect of difference
>>>>>>>>>>>>>> instances.
>>>>>>>>>>>>>
>>>>>>>>>>>>> All of this should be able to be dealt with by appropriate use of
>>>>>>>>>>>>> specific compatibles.
>>>>>>>>>>>>
>>>>>>>>>>>> I understand compatible can cover most cases. Need variance for property.
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>> like previous SPI vendor customized property, we takes efforts to convert
>>>>>>>>>>>>>> to common one and also meet back compatiblity problem at convert. I don't
>>>>>>>>>>>>>> want to do it again. This kind property is most likely as below.
>>>>>>>>>>>>>
>>>>>>>>>>>>> What SPI controller specific properties are you talking about here?
>>>>>>>>>>>>> There are relatively few properties in spi-controller.yaml, and none of
>>>>>>>>>>>>> them deal with these kinds of capabilities.
>>>>>>>>>>>>
>>>>>>>>>>>> num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fixed, but
>>>>>>>>>>>> some instances have not route all CS to pad.
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> default:      decide by comaptible string or hardware cap
>>>>>>>>>>>>>> force-disabled: force disable for some reason, like, miss connect irq line
>>>>>>>>>>>>>> or missed some clock, or IP bugs, or board desgin's some level shift chip
>>>>>>>>>>>>>> broken IBI/HJ timing requirements.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Of these, only the last would be a valid reason for having a property
>>>>>>>>>>>>> for it. Missing interrupts, clocks or IP bugs should all be dealt with
>>>>>>>>>>>>> using device specific compatibles.
>>>>>>>>>>>>> If board wiring causes the breakage, the property may be more
>>>>>>>>>>>>> appropriate at the i3c device level rather than the controller given
>>>>>>>>>>>>> that wiring to some devices on the bus may not have the problems?
>>>>>>>>>>>>
>>>>>>>>>>>> I3C.yaml is for both master controller and devices now. I3C is bus, which
>>>>>>>>>>>> connect many devices, if wiring issue, whole bus can't support IBI. And
>>>>>>>>>>>> if any broken devices happen at address arbitation, whole bus can't support
>>>>>>>>>>>> IBI.
>>>>>>>>>>>>
>>>>>>>>>>>> at beging, I suggest 3 state,
>>>>>>>>>>>>
>>>>>>>>>>>> [default, enable, disable], but now I think IBI_broken, HJ_broken is more
>>>>>>>>>>>> reasonable to disable it, default value should be set by compatible
>>>>>>>>>>>> string or DCR of I3C regiser.
>>>>>>>>>>>>
>>>>>>>>>>>> And some I3C device may be failure to work with IBI even DCR of I3C register
>>>>>>>>>>>> show it support IBI.
>>>>>>>>>>>>
>>>>>>>>>>>> I don't want to appear two similar property between vendor and common, like
>>>>>>>>>>>> num-cs vs fsl,espi-num-chipselects.
>>>>>>>>>>>>
>>>>>>>>>>>> such as IBI-broken can be used for controller and devices case.
>>>>>>>>>>>>
>>>>>>>>>>>>> That said, I think that problem should be dealt with when it arises,
>>>>>>>>>>>>> rather than starting a trend of adding capabilities properties at the
>>>>>>>>>>>>> controller level when I am not convinced that there's going to be other
>>>>>>>>>>>>> users in the same vein.
>>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>> Understand, I3C is realtive new protocal. 'IBI-broken' is more easy
>>>>>>>>>>>> understand,  logically equial to in-band-interrupt-capable.
>>>>>>>>>>> Conor: Any update on this one? I think this thread is stuck at this stage.
>>>>>>>>>>
>>>>>>>>>> I didn't think there was any need to reply. I took the first sentence of
>>>>>>>>>> this snippet to be acceptance of what I was saying.
>>>>>>>>>>
>>>>>>>>>> If yous desperately want to have a generic property, the negative
>>>>>>>>>> connotation of the "-broken" is probably better in that it'd be more
>>>>>>>>>> likely to make people set stuff by compatible rather than have to use a
>>>>>>>>>> property with that word in it.
>>>>>>>>>
>>>>>>>>> That said, technically this platform could be both
>>>>>>>>> "amd,in-band-interrupt-capable" and "ibi-broken" at the same time, since
>>>>>>>>> one describes the way the IP has been compiled and the other wiring. I'm
>>>>>>>>> not entirely sure whether conflating the two is possible? Depends on if
>>>>>>>>> your IP's programming model changes if the option is enabled even if it
>>>>>>>>> cannot be used. Not beyond the realms of possibility.
>>>>>>>>>
>>>>>>>>> Also, ibi-broken doesn't work for your platform, since the default
>>>>>>>>> before this patch is no ibi and requiring a property for no ibi would be
>>>>>>>>> an ABI break.
>>>>>>>>
>>>>>>>> The perils of FPGA IP I suppose, and not being quite careful enough to
>>>>>>>> document all of the relevant options from the start. Been guilty of that
>>>>>>>> myself.
>>>>>>>>
>>>>>>>
>>>>>>> Check impliment code
>>>>>>>
>>>>>>> +       /*
>>>>>>> +        * The interrupt only carries IBI events, so it is only described for
>>>>>>> +        * designs synthesized with that feature.
>>>>>>> +        */
>>>>>>> +       if (master->ibi_capable) {
>>>>>>> +               xi3c_master_init_ibi_ops(master);
>>>>>>> +
>>>>>>> +               master->irq = platform_get_irq(pdev, 0);
>>>>>>> +               if (master->irq < 0)
>>>>>>> +                       return master->irq;
>>>>>>> +
>>>>>>> +               ret = devm_request_irq(master->dev, master->irq,
>>>>>>> +                                      xi3c_master_irq_handler, IRQF_NO_AUTOEN,
>>>>>>> +                                      dev_name(master->dev), master);
>>>>>>> +               if (ret)
>>>>>>> +                       return dev_err_probe(master->dev, ret,
>>>>>>> +                                            "Failed to request IRQ\n");
>>>>>>> +       }
>>>>>>>
>>>>>>> They can use master->irq is determinate if support IBI.
>>>>>>
>>>>>> That seems viable. Where does that leave them for hot join though?
>>>>>
>>>>> No reason to keep hj because the difference between HJ and IBI is the
>>>>> address when address arbitration. If hardware support IBI, it should support
>>>>> HJ. HJ just use special address 0x2.
>>>>
>>>> For this IP, they appear to be controlled by different configuration time
>>>> parameters, so I don't think conflating the two is the right thing to do
>>>> here:
>>>> https://docs.amd.com/r/en-US/pg439-axi-i3c/Configuration-Tab
>>>> Per this doc, and the original commit, hotjoin configuration is not
>>>> permitted when ibi is not supported but can be enabled and disabled
>>>> separately when it is.
>>>
>>> I am not sure why provide such flexiblity, only difference is that compare
>>> address 2 or other value.
>>
>> It's not unusual for FPGA IPs to provide extreme flexibility so that the
>> consumption of resources can be kept to a minimum, often to the point of
>> excessiveness. E.g. for a ethernet MAC IP each individual statistic might
>> have a configuration option.
>>
>>>
>>> This feature may be quite common for i3c, if other soft IP provider such
>>> flexiblity, still common property is the better than vendor specific one.
>>
>> I'm not at all in favour of speculatively adding properties for
>> configuration properties of FPGA IPs, particularly given the likelihood
>> of abuse by others. Without multiple demonstrated users, things shouldn't
>> be considered for being made common anyway.
> 
> Rob:
>          What's your opinion? I predict we will met similar problem when
> I3C become popluar.
>          Do you perfer use vendor property fistly or direct add common
> property?
>          There will be back compatible problem if change vendor property to
> common property.
> 
> Frank

