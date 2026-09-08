Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012063.outbound.protection.outlook.com [40.107.200.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADEA357CEA;
	Tue,  8 Sep 2026 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847330; cv=fail; b=jMB0eiRMT8xq0UPVa21SgVmT2znaU6CnPfrR7KiizSqqZs9CtqMw1ip33XQWDh0/khjM4uvFsY2Gauq6malSQ/p1M32Mr55NjbhgB33Xriz6GWE+eJpYzUzTJ0GSez6sxJx9TZm8ddvW/qSVflf8svfHdAMKR4hIocDw13me4Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847330; c=relaxed/simple;
	bh=hMS+5SCoV/1tBkIBjxhXBUG2OQR4wBNO4HDnG5UH22M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cIir7mgLaI6JiLE9PT1CMvT+uQBPIAjXSDu5DowYmwRUjT1xglavBeSMacj1/2zCIfBzUDSH+mzhxvCqJN5efqlLDOK+ImAiPWG7WI7v06I7ldme4FXCi3o6F2B+ShObta3dtKzF2fJr+Tm3qVaaUwFOjopmRleyAhwZBtW+tps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=h0Txoyzh; arc=fail smtp.client-ip=40.107.200.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="h0Txoyzh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uX2oKWzz5lDeozILdTVuvceNX64YB8lGpEKgMKpGvbUuN1v8A/CqtCYcnncRqHBRcPEuG6+k423tekM6JZ2Xp0hjW0LOQhbNLt+qbZckmXSeV946KF0PWEeuRtSgLWsObFGw8FCsmGlgSsBKm4JyJSRvWr78bpfpPf9d0ro8IWNoZ1PVyXYZQxOjrpBgSZTwlNkW0W+QoWLu5ox0Xb0kPB4gp8UqgmjFMHEzuT39O+vR0Gv5WKghRp2Pjc43U4Jh5bU6cN+KBuc0Z2xsCjQoWn8w2B3ApDwYE5w2G6K9FSh5qN0vkmuW8db7OitnLiKkcLjj4a8UPzMi52Zh4jj4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9jJhyFdqa2hHcXw568Wt/DAih4Cysxa7bggboxplQs=;
 b=eh1h/x5EPeVoh312QKNvuybVXEb1PabE9TXMf3ltiVUR7ylvYYo4ROjWQh93eAur2+z7NmS4fP/Qw4JJEs8QpB9BfsfuTex8iNWKXromkIUuiz3fAzrmj1cliOtkQvmG3Vvw4SxC+4SFjd2oaWqEp1nadSKnc8YXBOrLckwu9o86Scu9dsBE0JcR3GDCFjPcCV4qGltl39NxE+5XXaqvL3FWgc3BlTLwyeiK8hddCvhjiKiIqWy/TiPaDTMkODUbOreyHLMbFbmAev/2hePhwiNPAeZ7+TFKRaRUfs9Zf2jB3df90JhIFLXN7xckrdmH67dFg4//2YAmZGvK8G6XZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9jJhyFdqa2hHcXw568Wt/DAih4Cysxa7bggboxplQs=;
 b=h0Txoyzh9+zZiYl1N9auOPYZu33xb2VIPcgvbNszPZttI4P4Bs87TFYiT213a8qa8innwJQO73RIINeCFW4l64Arr0V8tNv/MSEOeJLio/mYmWaq4ZpvYlHrCgcu3ecSTxzuqPT2MxaEoxIlDA03LRKRUj6L/zwoVwK/+L9SJbZoRBjo1JonjeXsvHcH23zxmmhaTAXd1hM2/V0sBBSNBaglAUHjcwIqxv5X/hgCoSRzEYEGVenS48ct5XwbQeqpeGYs2dSvh0WislojbCbhcNAzo++uQFor3hrSd+FNBBtd03nT2X9r0bInsyZ0c7P1ly9NGLAOaZRrp2E5op2aKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16)
 by CY3PR03MB8150.namprd03.prod.outlook.com (2603:10b6:930:ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 06:02:05 +0000
Received: from PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::c062:a298:c61e:5820]) by PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::c062:a298:c61e:5820%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 06:02:05 +0000
Message-ID: <8bf38b40-580e-4331-8e18-afccef6f2d59@altera.com>
Date: Tue, 8 Sep 2026 14:01:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: usb: add Altera Agilex5 DWC3
 controller
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
 <19d22389b795bd0883dc481f045a293b400f1ea3.1788757821.git.adrian.ho.yin.ng@altera.com>
 <20260907-overboard-frisbee-64c8b3c09c59@spud>
Content-Language: en-US
From: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <20260907-overboard-frisbee-64c8b3c09c59@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::17) To PH0PR03MB6235.namprd03.prod.outlook.com
 (2603:10b6:510:ed::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6235:EE_|CY3PR03MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 460cd28b-d643-43b5-5c61-08df0d6eb537
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|22082099003|55112099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	TEKSD5Xoky8K22cLrtmYQBmeM/GCCoWO0oTvRYzN7V5vgikQ3fhO6otWsnjNufu78KNZQTpdPAU+KbTQbiI12EBvD15Mz26w3ZeedBCYwV7ZaYexuFgVdVHfE7NSl3hDVcqdfL8yiZEGgQUkz+eXiVBoel0n3RkTFlNPw+7vtmdVUDQfc7ix8tkBeorgHP8c7unaR/TOi/FJ2B1SnpQ1p3uDiDhT3aU0+fDngdvenSdtoxi0mNob2lPdJEBwlh8QvChmJmnm+QYI0CQf+oKfb/tuhmEQ73ID0bKthDR58GiADt0QlSN43M6Ng1ChmfkVIEX+Gk0ljag57q5y/gamZjgSuP2ySkX6ZXIvSYNqwSTTWr2R13h5Oh+v4QNba4tdIg4CFj6HaaTdFGnnlTa0wclNzZM5MMOC9++lpxsIhAz8IxbvSNuQxLjxsKDpjWfR48bC3JvPUMOTGEZOKE+Sv0ybJhXEzTnQoUkwLXxMFcUZFZw0rLefaHTQhlaDNp+gjeyMa60XeWqZraHNHNgSNHEe97Stf/j9vCI6ruV9aV/PinU7XMwRhHWoVwRvv932hi8QxMSQU2QWRvslWE/y+iBX+h26oVpTHo2yOaLKPTI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6235.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(55112099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXRmNDFiYzljUjVSbXdIVDRWaHFWUzVHT3Z6RDh0UzEzNk03RHBieHhGSmhZ?=
 =?utf-8?B?WDdEbDlyMG02cHo5WFE4ZGJ6U1R0N1J6eFZsN1dYUVZ3VVFqVzcvV2ZUYUgz?=
 =?utf-8?B?WUtsTVZEck9wakdld0NyMUdnQ0pSK1EzcENkQTc5aTFSeFRkaVkrNGZCWHF5?=
 =?utf-8?B?Q3d5VmJxcEl1QURuVFNrTTJreGcyc2JOdFJYZzM0aEIzcG5TdE5zUXlNTVI0?=
 =?utf-8?B?eE5qVStaUzN6eC9RZU5XcG5BUzE4M0JPU1kzeVhvclh2Nmt3d2RtcUdiWkhl?=
 =?utf-8?B?RHhMdG5Sb3Fsejlwbjhlam5Ec2QraFFMSm9KWmZ3eC9DS0lWTlZZazNnZXNy?=
 =?utf-8?B?ZkJQOGFmQVZYdkFMTWQ1RnlkUDllWUcwNlk5VDRUd2VBRkVYTGMvdUdxWDda?=
 =?utf-8?B?MHdWem0zYW5YL1JhM2x4NUtwSGFjVzVhRXhqNHBwTVNNM1orQ0JjZkdaTURk?=
 =?utf-8?B?d2tNZm92NERmNFBrWXE2bW5mTjlmcVN3ODNkb2NOZlhLTHhSd2FaSlRDT0dY?=
 =?utf-8?B?Qm5CY3MrbmxBa2tyaXZCRDJMNlJSM29wdlFob0JjZ1c5b0JVelpWYThEMHhv?=
 =?utf-8?B?WExNS3YxY0JYR1BUbmtmditqUTVXV1dHS1c2N3k2M0ZVSnJMRXI0aEFhbXhD?=
 =?utf-8?B?OUNWQUdhSUUzZzhtSDRGWXlMSHBqZGxpaTB3S1UrVkNuTU9HTFhsc3BXZUF4?=
 =?utf-8?B?dGpqZ3BQcEphMUlzZDhaVytueXpuc0FkdzVpb2cxSlI5NXZyazk5SUdCN3Q0?=
 =?utf-8?B?UVR3QUdiYWlYWEVDQldQdzcvVWpGdnNBcTVFM0tJMjg2MGR1ZURNR0dveXd5?=
 =?utf-8?B?ckVTZ3NLSHZONGc2T3pyVkx3RlY4a3BrZlVDbHdkMHYvQk51MUIycm9nU2l6?=
 =?utf-8?B?OEdCVUtvL2pDcStNZGxuV1ZwMjZ6MThEaEpsY2xML3RlYTJsVGxyRGExVmFs?=
 =?utf-8?B?Y3gwejVRTjRkTkdHZnR2ckhHQithT2cvdjdYbzY0OEZWVHNmS1ZYbUUzbUVx?=
 =?utf-8?B?bDJrYjNXNHJuODIrWjRFVTZRNFlCKzY2ajQvd1NIYXhQMENkLzlYM1pRU3kx?=
 =?utf-8?B?WjRURzhJZkk1WXFMRzgreXNzOXRycWdqZnVXTmZqVWRqK0tkamdsajErbW5n?=
 =?utf-8?B?a1IyTHFaUTB3TCtENDM5UEwzZzV2RmJ0UVJXOEUvd0hwTFR2ajdmWUdYcmtl?=
 =?utf-8?B?d3dmdmtVU1JybmVxQnNNd0pDZ01aNmZ5WmhyQ0dkcFc1L2Q0czE4YjZTdi9N?=
 =?utf-8?B?WW1OK2pkWnZGbHlYM3lDOWdvMVNHc1JseG8zdFhubVZEZ0kreTJOYi9NSUJH?=
 =?utf-8?B?NTlJbTB6a3pDdXFRaUU2KzlXdTRza1d6UVVsVkhreHJzMlFKQWxDeFEvVktv?=
 =?utf-8?B?bjcxcmwrZTc0RWpJNUMraWlsY25VSTVLdGJ0SWQ2dlgxUFZJa0JLcmZmZ1FB?=
 =?utf-8?B?N25BaHVlRjl3dFowTytNRUpkZklwSVdaeDNhVGxsS1JldklVZ0FCZVNGVmw0?=
 =?utf-8?B?T1lzeEliN1ZnK0dNYkQ3STlEK2hqbDZnd3MwM1phei9GVDVQUkNqR0xTTVJC?=
 =?utf-8?B?RFlKTGZVZys3aVVFREJSVHozblhKczVXZ2ppMzhROWtURGs3YmdCREN0NkZh?=
 =?utf-8?B?bm12dFhCS080S1dSVElzV3p3dTVEdEx5VHlPeWw3b2tMUXFNd1o4UFZGbGZs?=
 =?utf-8?B?MzhhQVRaVnhCbVlVYm9qSlBtOTh3bGErQTNlZ1RzLzVxeGN4MXU3MkgwRFE0?=
 =?utf-8?B?dDZRQmJOQlZKWEMybm92bDArZHY2OVdtQ2QwQWdhNlhuSzB1RktFUFNlYmpP?=
 =?utf-8?B?aXk3cHM5ejQzSUEwMTZmUmJrNTdJSFZOZ3FBaHJpT0NSRnBzWUVKVjhiU3Nj?=
 =?utf-8?B?MkdmaFRlaVpFTGR3bS9qZGEvM1FTRnA5N2hVUWhybFpyK1BnYm5sbXpTQkw4?=
 =?utf-8?B?RDJXeGxRQXprZkp1Y2RLeWtuUVB6UVBxSnRBY2VZQjkyb0hPdVlpQTluODF0?=
 =?utf-8?B?aGxsMDQvRDFBdXZrN2VBYmZtSitlSzJwWHk1ZFM0NlZydkp4OWhQZVN0d3E2?=
 =?utf-8?B?N3BOanVSL1dnVEtpMVhRU2NTbVRGQnkzUFY0WUNsWnNHcHZMRTMzeHgyTytu?=
 =?utf-8?B?NGVGS2QvOERQZ0lPa2d6REJXVmpZcDZDVGJJcFhFWmdWR0pydCtuTDhUVFNY?=
 =?utf-8?B?RTk3L2djcXN0d1FXNnltZFBrYk4xcVNmTkdwM0ErNy9Ja3JWTjVHMXNUWEd6?=
 =?utf-8?B?WVpPWDJKWS9WYzRpWVhIUGRxcHJJNU5scXBYVUNKenZJOVAvc3lzWDRWZ1V6?=
 =?utf-8?B?NnNoTkZJc1ZUeHovSDhPWmhRcUpzbnZUOUlmLzJ0eFVNWUwyYWNJWmExTnlB?=
 =?utf-8?Q?mxv5n90LNPbkW6Ak=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460cd28b-d643-43b5-5c61-08df0d6eb537
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6235.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 06:02:05.0457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvttLGFBomoD3k3IFQyCxS6O8NTdTyVdXPS1HlF09te99319e42kD37mHERpI3EYeNfncAazi/GW6ZaG+9/qTXM9htVkmB/pEYgC08t1Ln8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR03MB8150


On 9/8/2026 12:59 AM, Conor Dooley wrote:
> On Mon, Sep 07, 2026 at 04:21:38PM +0800, Adrian Ng Ho Yin wrote:
>> Add a binding for the Altera Agilex5 SoC integration of the Synopsys DWC3
>> USB controller (compatible "altr,agilex5-dwc3"), covering clocks, resets,
>> PHYs, and optional IOMMU support.
>>
>> Clock names follow the snps,dwc3.yaml example order (bus_early, ref,
>> suspend). Reset names use core/ecc. On this SoC ref and suspend are the
>> same hardware source, so the example reuses AGILEX5_USB31_SUSPEND_CLK.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>> ---
>>   .../bindings/usb/altr,agilex5-dwc3.yaml       | 108 ++++++++++++++++++
>>   1 file changed, 108 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
>> new file mode 100644
>> index 000000000000..9970d7c9d6fa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
>> @@ -0,0 +1,108 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/altr,agilex5-dwc3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Altera Agilex5 DWC3 USB SoC Controller
>> +
>> +maintainers:
>> +  - Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>> +
>> +description:
>> +  The Altera Agilex5 SoCFPGA integrates a Synopsys DesignWare USB3 (DWC3)
>> +  controller that supports host, device and DRD modes.
>> +
>> +allOf:
>> +  - $ref: snps,dwc3-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: altr,agilex5-dwc3
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Master/Core bus clock
>> +      - description: Controller reference clock
>> +      - description: Controller suspend clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: bus_early
>> +      - const: ref
>> +      - const: suspend
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    minItems: 2
>> +    maxItems: 2
>> +
>> +  phy-names:
>> +    items:
>> +      - const: usb2-phy
>> +      - const: usb3-phy
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    items:
>> +      - description: DWC3 core reset
>> +      - description: DWC3 ECC reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: core
>> +      - const: ecc
>> +
>> +  dr_mode: true
>> +
>> +  maximum-speed: true
>> +
>> +  snps,dis_u2_susphy_quirk: true
>> +
>> +  snps,dis_u3_susphy_quirk: true
> You add these two as possible but not required properties. Why is that?
> Does the agilex5 have some instances of the IP where these are needed
> and not others?

Hi Conor,

There is only one DWC3 instance for Agilex 5, and these 2 quirks are 
used on that node.
I left them as optional because i followed how snps,dwc3-common.yaml 
models them:
boolean flags, not required properties. I listed them as "foo: true" so 
additionalProperties:
false would still accept the properties the SoC DT uses.

Thank You
Adrian

>
> Cheers,
> Conor.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - phys
>> +  - phy-names
>> +  - resets
>> +  - reset-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/altr,rst-mgr-s10.h>
>> +    #include <dt-bindings/clock/intel,agilex5-clkmgr.h>
>> +
>> +    soc {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        usb@11000000 {
>> +            compatible = "altr,agilex5-dwc3";
>> +            reg = <0x11000000 0x100000>;
>> +            interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>,
>> +                     <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
>> +                     <&clkmgr AGILEX5_USB31_SUSPEND_CLK>;
>> +            clock-names = "bus_early", "ref", "suspend";
>> +            phys = <&usbphy0>, <&usbphy1>;
>> +            phy-names = "usb2-phy", "usb3-phy";
>> +            resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
>> +            reset-names = "core", "ecc";
>> +            iommus = <&smmu 7>;
>> +        };
>> +    };
>> -- 
>> 2.49.GIT
>>
