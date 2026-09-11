Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7102445A29B;
	Fri, 11 Sep 2026 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113572; cv=fail; b=GqRPyiQnB/es6V21p7LedlO3FUjcrOEvH3MmPFkU6o+AheuwNtcHGtA1EtPa88+TkUwNPE48Vo7ujLjH3U0p/u+tcSGThp0vdN52IX5sImNTHPJENpCHrTvcb5lSspG9NS+vn8zNAJLDmi3xZyhFOdbnjKVENCwedyy0KvQvkG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113572; c=relaxed/simple;
	bh=klhzcm68JxRt9kblDYpZEZYce+rIzaH7I4/xK5MfjXY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k8s9Hc/KpOCWLWCY8ydAJrfAMFtt/cvx2+J4PpEa/s8hIq8IhR6iiGTs32pN08vuaGTlK2a3Ded5/XIJVgicnThSggelBfRwHO0Kjb55EIW7TqZyzD1hOSaMiQQjPvRc22ZeQ0fgAiVI2JRc4BD0zhtjM1h5Bca361WD4V/NM3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=jrFYWQLV; arc=fail smtp.client-ip=52.101.48.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="jrFYWQLV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffg+PJA2H92t/dRGT8ymoUwrh6awoZGWJHVOJWzHePpNP0IrBpr8gC6H4TudE9aPd7LrDucIu6KKL3PFgjcbQVWrCv/K1FtYvW2OBvAf2OEiUn9nNNduxWzErv3Ysh2AaqXcpkLAIMj5FCLEFOw/45lBjM4gLMbhUAwvSWWGKel9Ken9/qwEjmSQi4o2dcNBwr8vYFBQm0/e9YkR9aSDuBLqN7RepooigYLDWfThlAXV+ftiGdhlCmdPLlgVh+tldpxfFzk3qgskTexLYHKHbhW2GSZaOvqveGb5WsddVaOq5gF2sepfQ03wKARPRU7pCv5K4eTO2nL7/A/LXOk2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klhzcm68JxRt9kblDYpZEZYce+rIzaH7I4/xK5MfjXY=;
 b=DHMPRPqbTjlXfSXlM2xd3JLLzuiG7dvOl9/dmaOne5JED4h9F6hA4zILakmAzZP0qGDr8cnzzAl+wFJUCLysSociciEb6KiL1JAhOavn+uoA5KCTPdVSNWxgoGKQYXcXcyUSSZP8aDR/TYx+ezNT/ljWxDWXt4P0rAuVF6O0L5MDXRhHPawwkLqp1mIFBLGku8OoIUYsaoNvSWOlK4P3/rZeVDvVqBeJr3bJW6ZcF4+Ocb5Y7jbEqWSf0JFmUcn1WSG6q8Npj7YurzB7akB0RoPOXFfnCc3PF2DBPdWmwx62OpSUvDPsvCdp8wDotwuy1TlnNmHE6JP8ljR3GDKOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klhzcm68JxRt9kblDYpZEZYce+rIzaH7I4/xK5MfjXY=;
 b=jrFYWQLV9XEZvwNPsfLM1DB0BtSjm2eB/+iW/929rypxmTpD/MSWBtE9Nrrwfyg3A6UnlMZyHgvBFmJip4JzK6C6XZMawVd8AdBfMMG1q7TasuCYM0IJBFNnr65PlHse9UrkwQszUVsAKIvcIHa7aUEuxWgykig1fmeDfPmeIUiUr6GWd6UPhjHL6ix8+DB7EdH8KHS2KSF3K0pEpuX7zJ3VjngZRwbL5xUsdfvboJ5sfG3yn8/s2apJk5399GrT9Y7DIYbl+APP/5LRPob3LWSL8pK1mlBHzAupf3tkG3s6MeFDWi1w/owYXubmOJfF8hPPwcoI5pwc+bQgziPrmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 EAYPR03MB989276.namprd03.prod.outlook.com (2603:10b6:303:2c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 11 Sep
 2026 07:59:29 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 07:59:29 +0000
Message-ID: <cb2831d3-8c64-4de0-b61b-4ca5a25baa83@altera.com>
Date: Fri, 11 Sep 2026 15:59:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] arm64: dts: intel: agilex5: remove usb0 in Agilex5
 SoCDK
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <6c324c1953c6fb9e217e878bdd42c06bc4b6bceb.1788886615.git.adrian.ho.yin.ng@altera.com>
 <20260911-elephant-of-great-certainty-4e0bbf@quoll>
Content-Language: en-US
From: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <20260911-elephant-of-great-certainty-4e0bbf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::21) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|EAYPR03MB989276:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9a8638-4590-4891-3680-08df0fda9b78
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|4143699003|10067099003|11063799006|56012099006|6133799003|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eaJ0D1pujN1J3zOg5so3a7qw8b932gyX1EpZ2MllA6RJ0S8TnZ3Zy/khfF0do7CM+BZjU6YDYpAJNDU6hjCjvHgGKpqQPoj+6/8ioKxN7z5sb6n/etL3npKfFKO91i3F5DNqPINS+G05DFlYGw5aVhygNvRGhBKKwRg/48W92tC03b+6b1XhTzWZytuiPWgD8zdi9RfOtfAHKygqZsooevhg2hqCmZWmjVwrGTpR0vIoPDUyKV6p0KrbzYFQ2JcVZvFLO50qNdmhQzCZXxt2Vp9Pi9lhzMUd6rrcoWWDZnFVXE3h4AxaOTUicbSRRj2jbupDCOJQqQDxibVBebfCIQL0NKTxUS8mU2D2CAtXxW3Suog49yUycoFaK3iJusOR2Vznjf3+NF5ZDf9eWjtEOuHA8hBPcC6Df4pOYYhz8z/AUmXKoi3OI6XTcJ3WruMqqzLgQNOv0fXlyWiPZmkWSblp4pypczI15zc877H+vwKIqcwnnCJunqMIUI/yhRr3BcFfkXIZ3RWOq6eJbbBBU4XN+XS00wFagmudkeX9vLNxiU8ZpIlVluEelQm46U8tgHNj22KgL+KHW5m/rXfLqsw4oZ/8voIHH0NiHfGgPbDFTgSPw2aCxJyVi9mbb+D9MRdbfi9bx03T+qfTDwQcHw1hH3CrZuFma3uV0HJLYfo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(6133799003)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGdoR1ZDREpTOUZwLzNYMjgzZmhhWXdUa0ZKQXVrYlMxeWx3NUNCMktUM09T?=
 =?utf-8?B?MDdBc0RmbndPQ3NvQ3VURlBwMlVnY09naElCdUtVQkxJeDJaVmpiVGNZRlV2?=
 =?utf-8?B?emc5WjltRFJyT08zcTdWSkRtMk9OSTR1SDJOWC83aTNiR1BpWlVrbW9WYTNs?=
 =?utf-8?B?V2FuUk5QSHZROFp1bEwzb2h5WnE3emxZZktWaFpJa2U0Umx2OGEwVDE5bkU1?=
 =?utf-8?B?bzRtL2VMcEU1SThVMVFLdXNTbUwxbEo0ZElGem93QmsvZ0FvWlk5U2x5Snh0?=
 =?utf-8?B?OEx1MmVJYkRTQjlldlhFMGlXeDRUUmY1T3dJWTA3ZmZuWFhBKzkzaEJoaER6?=
 =?utf-8?B?enZTekFOa3FHQUp1Z1VWVFBoSERjVXZTQXBIV1B6ak9iSFBZa1V6UDdGR2dY?=
 =?utf-8?B?aEl3MmZHSVNSa3lZRjNYcVhqTGN4YXBjckZkSGpEbzZWeUgxQk14Wkd3NTB4?=
 =?utf-8?B?Mlh1QVZZNjU2dUF4WkZlNnNPRHVBSFRsSHZRdFlaZGRJWWM4U2xWazFOSDZ3?=
 =?utf-8?B?cXhKdVBvSVUxYUhDSHF2Si9VZ2dXTDM5d3FqSTZCdVA4UHpyQ2tSZ2RCU2U4?=
 =?utf-8?B?MHdkdmhUd2gwWlFjQUhIcTJ6UGFSbERZWUpmRDgxRklhak94TFBiRFdWM0Zp?=
 =?utf-8?B?N1ZwL2RkWk1Rc1UxMUpOeE1KNHFNNDh0WkF3V0xRai9LYU5wLzhJREdGSENt?=
 =?utf-8?B?KzhoWE1jOEp4NXFkSjc1cVNEa0dJNS9YRllOWUZWMGpySDZFb2xXMlZ6d05K?=
 =?utf-8?B?eHA5S0lIZzRnb000VmJaa0laMU9hOHhrRnA0VUhCU1ZMUGIxTDlhVDNTK0pm?=
 =?utf-8?B?Z2xiMmhHTzBHV3dFaGJvb2pFMTBpRmw1bFFqeDZ3UkZEV2FGblFTeFphWVN6?=
 =?utf-8?B?c3RHT0szV29zRWlxYUFyOTQ3cTBPUDRJT0Z0aUZ4anJjaGgzWVpsT3c5UWZK?=
 =?utf-8?B?YjYyRnFQZDhxZGNkOWovdGdXTDgyQ1h2RGdzQUF6M21WaFVDUk1DRWZvZ3p0?=
 =?utf-8?B?T3NmczE3K2lWczN6MFhudWp3bFBnejRwUXhhSWRSRFJLZXpmSHFKeFFWc3BZ?=
 =?utf-8?B?aXMzRDN1Zm90Z2ExMVF2a0gxZTB1VDBseXBITkpHZHR5VmZFQWNRdG5GR1Yx?=
 =?utf-8?B?UVJtK01FUUtnUnptQkFhTzZHMVBaYy9SdVRrUnV3Q09xSm85WjVjWGJKVlBx?=
 =?utf-8?B?Nkl0VE96Z0ZGRnN2OVI3SWhLWmNaUGV5bUhyZ3B5aU5JUWpyNEJWVHowRG1P?=
 =?utf-8?B?NXF6T2hiMUp5ckFsdFVqS1NXMDZVVUJzR08yWFdlcVlxVnh1L043UkRuK05l?=
 =?utf-8?B?MVdkZWhQQnp5U01jRlBRNkRkcmpzaEpmeWpWRjR3KzE4NzFQbmY1WmpsYXN1?=
 =?utf-8?B?TzR0V2c3OE9VOFNPTUx1SXUyMlQ0bVpyM0JHNzB2RU9MMnF0M0xDbStieERD?=
 =?utf-8?B?OEtraWx5V1krcTFFZGlCL0tQb2xLOHJPbVhqN1FUOE9RS25sV1BveldvZitL?=
 =?utf-8?B?SFFwWWpaS0N5anZvSXRxWW0wQnNJZFBoZ2ZVUnJIY3MrZUxlelY1c2xORlNT?=
 =?utf-8?B?RWlOMWkwNTVVNDYyd2tZckppeEVpcytudFBnK2FXemNnMCtPMXMrUVRGb3VG?=
 =?utf-8?B?ODM5K0pyUy9CVHN0NCtVYlA4b0ZtR1NKbk9LQVY5UWhrekxPRi9ITUxqV3Fs?=
 =?utf-8?B?dnQ1VzhKMk1UcVY2N29UOGdqRllsZHArb1ZmRUw5WitQQjRyYnFoSFk0TU9F?=
 =?utf-8?B?dXo2NjVBeWpzcFF3Wmt1alF3WVB2RTR6WktUcEJpTXczT05sdGppNHk0MEVM?=
 =?utf-8?B?bnF3bXgrcmxMOEZtelZPL2RUem1ENXBjUW1YQ1Y2UHZiUExXdmJFRS9md3dT?=
 =?utf-8?B?OFZJTW5HdnVZSGFsbEM5Y0xjZzVBMXovbzByQ1dUWDVRSTYzUG9UbzVRME9C?=
 =?utf-8?B?U2QxVXhmdkZ5Z0hsK0F5RlovcVhlczRKRTRlVWVBMDZyRDVJejV5MEh4YlZD?=
 =?utf-8?B?UXM0akZsZnRmY3g2NVBlWStWL1NjNjBYRUgyT0VXQTloM0gzUlBUUmkvVkVF?=
 =?utf-8?B?K3p2TWZMaXlSZEgrSVFYMm9ySlFrRVRIR3VGS3cveDNaMGlzSE8vWm81WGpo?=
 =?utf-8?B?Y2VjQ2lDQTRmejVwcFk0c29tRzVsVnBnQjgwbit1eVEzWkxQdHdyWHYyS1NJ?=
 =?utf-8?B?RExiUm5sRk5Qc0ZBZXdQL0dRNHNNZXFlV1ZMQU1ZS1oydkoyU3lmd0dZYXdG?=
 =?utf-8?B?M1E2K1Qrbk1hSGxweTdIeThVL2dHZEdpNWdGQmtKS0E5elJBNEFnZEZTdStW?=
 =?utf-8?B?UytlS3NaY2VqTkpvOTc0WW10a2JSaWZnNUUvU21JWnBhUmp2TTh1bFl5Y2hu?=
 =?utf-8?Q?vIrYgg2v9bcfUerU=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9a8638-4590-4891-3680-08df0fda9b78
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:59:29.6983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fs43P4egu1+Yin0O4lNannRQ7m2prc+HUebVqb30UhPfXxzCPMv7wyVZdYb/E3/PP8FSKp1t5CirsO1EdX6My1BQga/iTQMbaCsGnezkAoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB989276


On 9/11/2026 3:22 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 09, 2026 at 01:04:39AM +0800, Adrian Ng Ho Yin wrote:
>> The Agilex5 SoCDK daughter card only provides a USB3.1 interface (USB1).
>> USB0 is not connected or used on this board. Remove the USB0 node to avoid
>> unnecessary initialization and potential resource conflicts.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Same comments.
>
> Respond to the feedback or implement it.
>
> NAK
Acknowledged — dropping this from the USB series.

USB0 removal stays with the separate arm64 DTS posting (SoC/board
enablement), not with the USB bindings/driver patches.

Best regards,
Adrian
>
> Best regards,
> Krzysztof
