Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023097.outbound.protection.outlook.com [40.93.196.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A448044C4EA;
	Thu, 15 Oct 2026 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053174; cv=fail; b=HHdhfJd4FQBiFHvhXniIOtOcuCc9QewAEbCy7ClbgQ+319PAYOP8LWDiPIdPN/bUhsOxkOTv2PUXJpI1WTf+xoUlT1xYErndXv09g0INHBzL4zyApe8YIFibn2kjPN9yUoXe+qwYSrYptzRpcQ2oSCnch+gTjhNTNTz5aPRnMGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053174; c=relaxed/simple;
	bh=HUIDgDzD6QThwd/+xMCNiCQ791QS5GKFt9HgQK/EyNM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NAzLc6Y1YS2srVzO6Kx0r+t4oeB5KgzUzo7tf7caxwc85C0RvCWHmBbCY0uTSmAFrAR/FFp8OfraIaB5E4REvkLjosuUfgCcESRus4VN9QgMq8O36PXS6NSaReJjPlLp9TJmrZa21GEWM9VtZytqE3zX/vFpdioc0+K0Hqnk/j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=fZguNMGg; arc=fail smtp.client-ip=40.93.196.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="fZguNMGg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6WMe8JOXOjPmRhy75yh8dV3uZPhZtgkBhVqEC4BVvQF04Q8p8F53zIVxVfYomOOKdRguG2PtuMJkpR7ycugzIhsYxoU5JpUu2e/OLpp1+XpEnTlRq748LP6NKJ/ACxg3Frt54LQjvS/POblflwHnfdHccW10Rmbt5qQcjDbofNZyY1DmTiXcynSMTTIw6BUh4cD78kTKRCm6cfXV9V2ppYc9KvpLtUReCJ9g6ffGOJZE/aLkY4nGyo2Wyp57XkDtrdB/gcRUVozrX86+gFFmOzZHAuOZUfT+eQMifsL7u5gEOQCzTBoq917I6Dzw2k+o5Kg6PMMgGApTh1Pr7ycqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxyNiaHBBUBxVwNsBM2U0LdF1gPH0NPALF7sZxV7Z8c=;
 b=iKwMQ0V+cMcpeKDqilERDmGN7Up90mMk0Gx/ZlURkLPTeejOTvuN0DhcW2pXFXpEtdecX7XfaRjp4GV3szxHNsWze0HpIHHLcwX7iqbxcFbNwzdzlixWPJLtIFYyNErQ5aUTK/6DyxZRr2LiGAqSyIFfp3ZrUUBkwznfDRg2vi62V3JcEBAq5VlQZneqb875N2xP2DU/MRUz3qnwDP1TgmHzjzLb5OQXQsHsSVR8kNgZBD0759Sl6tVYXPCzRvFOxcXJdmRDJlEu7STVj71Ym7Hgy1wwG+POTapMf6+XM8YpN/VVdnv0ufG4MVntWolADlC7ISWROEzm3Dr1h46jLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxyNiaHBBUBxVwNsBM2U0LdF1gPH0NPALF7sZxV7Z8c=;
 b=fZguNMGgQHKeRJ1yI9Jo1wnIfdxWriOSTXzW5biu/ZDtOTAPmfVw9ERPL83lH0sgt7UxFYbE4O1ZxNBFB37twoP4WfpcbANb1MnpXawb+ugG/pyo3IqufRyxT18VB6sCvqTKDMxkAPasiZ0jAbvhuoxggfyAW0ucWC8VWcnnmwGl6ubbzg0wEABq1546hjQbsDKtf8x0IGUkDvtvTMB3CrOYfk/cuUaLscV/zQxkbDqgylMnX9em09Wlxt1rhbzPoZA/SeVgtyRblMgJ5u6yie/3dCidNRvVZUa6HG4ZcDPl2JYZAG8hG5w4BbktkNVNiqdkIxQZsCn63XQkYaylNA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 SJ0PR18MB4090.namprd18.prod.outlook.com (2603:10b6:a03:2e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Thu, 15 Oct
 2026 08:32:47 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 08:32:47 +0000
Message-ID: <203a57f9-4036-43dc-826a-b51c737cfa10@axiado.com>
Date: Thu, 15 Oct 2026 10:32:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krutik Shah <krutikshah@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
 Karthikeyan Mitran <kmitran@axiado.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
References: <20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
 <20260817-axiado-ax3000-usb-device-controller-v2-1-0ef033dd0a68@axiado.com>
 <20260821-woodoo-enlightened-bobcat-9315cb@quoll>
Content-Language: en-GB
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <20260821-woodoo-enlightened-bobcat-9315cb@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::18) To DM4PR18MB4144.namprd18.prod.outlook.com
 (2603:10b6:5:38b::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|SJ0PR18MB4090:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b95c16c-8262-4f52-7c82-08df2a96e407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|6133799003|22082099003|10067099003|18002099003|3023799007|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LoQ9V1e1h9rYNkzYQSvFOqhOdOz0PX4fNCzcsQJF7iMvV/c1OKVRvQPP9oeHnTOJcjE1wMqld3FHOfnGh2pmN3alMTA5JoUmCgc5rdvwGhnPnAahXzuXeKXStipJaMy92gckq6RmLIQcZVLuoLHHwDagNd/pTFY8ov/vFFsOVrMuo6c5ewreNNVN2mVWP34qXoUbinROgPRNFWZoxuiYpjRfylgWoq0A3u2ryTYjLOQOkxDgxrvH0sqR8dgj/XAHqGH1nazPjwk0/C2csw5WlYFwKBUppvnD+j/nAfWJPP59N3OC9JeU38zUrfvJH4boKG9EooKifch2OAOOraBpGB0r56aJVpxPOmCo9841x5kLymtYtPeP4g9wvnotDQi5l64kbNOQCTxq+vRGCGZSS94Dt+2RMF6faprLWMPpEBUGID7VNwJsTl+n+p05225aP3DCu1zaiPMjYaiCTqn/7PzoNQIK0LF4Xp/MQy9ZKghSsVEyp6FLjhdmqlFMEuk5yUDT+LIKUiqMSyTp0S3f7vXQwf2PG+V4HVyTRq/EFCL5y0jAygXjdATN1LhP/JvpfskxMZaS0+Ks9B3VSOny008JVJcmpBts8gjQ25AtMdzkMTbjCiq3nWH8aTBGLaLCPvks7EOo9NVbXZtuuK2+sovkLKfvYQi7FDQG7tgbLdI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(6133799003)(22082099003)(10067099003)(18002099003)(3023799007)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkZPNVlPcW1TY2M4QitBY3VYT25FcldXU21MOHJNcWFMSk1KVzkxazVlSGdP?=
 =?utf-8?B?YmJJY1FOSFh0NTEvSC95M09wb0d4Q0lNWmNkVFdsNEh6Q2JCcUFtWXVvNlhE?=
 =?utf-8?B?eklRb0hqeVZ2L2g4dnZWYnRUaG93WE1IbUIrTk5iNW9ZQTBWUzJZNUp3aWtv?=
 =?utf-8?B?MFRZMlpBd1UzV1owRllxSmV5M1pQSlAvRytScXUxYjA2d0xKdjVoSERJNE9V?=
 =?utf-8?B?MjFxSEtzbUc1a201TFUrbGM5UnZRemVTaWFIcjZGanF6WlJzaWMvRWRUZndz?=
 =?utf-8?B?Mlk3Z3VrM3IycVQya2NLazRQYnFNSS9Kcy9zaEtIL0pGeG5UWVc0MmIvejNk?=
 =?utf-8?B?SXdxbnI3dW4xOUk0Q1dCL2U3Uy9FaTVvQ2luNHRPYVltS0g4TUVjbUo0ckFD?=
 =?utf-8?B?STEzcGFSeUFqamVOK2pZSjF1eHhGNG9jcEp5WXlSZWM4WnZIQVRRWE1wOTN0?=
 =?utf-8?B?MC81dk5hbDF2MlVxb2o0Z1RTMzVOVS8zZnJvY0tLM1ROSXNUZWh0VXFpY3ZM?=
 =?utf-8?B?U21HbmkveVE3YlhDZE93RC91RlR6S202TjBWamJOMHg4V3Y1WDZXV0doRE5s?=
 =?utf-8?B?cWlBRjArVTRQbDdYeHRNMlFCNWx4OUgyWVhNME40REp5bDdnUjF0TjNhbW4x?=
 =?utf-8?B?OCtEcEJ2NTY4ZVJ5MkFtZ2s3RzlpbExlZjFFL0MxWXBUanpoR2laNi9YQnVs?=
 =?utf-8?B?QUN2enFsd1dsc0RaQUpIVDZMbDFHRncxOEZxWUpuSHRRWG1tNnJtM3FvZnUr?=
 =?utf-8?B?Q2R3d2dqVFRmRlNxMjB2dWhwUjZDUzdJRXJ6dGsvcWlPdFFFZTlUNUxUNzB0?=
 =?utf-8?B?L1dOYVhpa0ZiQVRTbUZPckFZWnVDUml1bmh5NUg3UTFuU3hhemJ6WFE2cWZj?=
 =?utf-8?B?TGNTeGF6WHp4WURhOGtsejZmRDFNOUR0T1RSdmFZbENyOTBEQnFCbDBuLzlx?=
 =?utf-8?B?RDlsTzJ6cWtZQ3dhUW9iUkVDRzdLMnZOb2ZnNzhaemhmYTQwWEZjUStycjFX?=
 =?utf-8?B?S1pKZU1TeEJacThPUVRlWVR2ekVsa1dBRXMzNE9BSjZoZ2ZTZXlJcXhvSG5w?=
 =?utf-8?B?SXdGUk9CT0hVNkVRWHExNzE4cFNqRjN3dkF1TnRsRmgzdFVsVW5rQkVKVnhp?=
 =?utf-8?B?bTI4aCt0bEp5dzVXajJPaVlnMzZaTzVmbVQ1aExjQXJVaDM4N0xvNnkvSnBx?=
 =?utf-8?B?SytvaDhYRGVqU0JpYk5OVUlSeDh6T0xxcmNBbVg0YzFWdHBzRks2c3dsQno5?=
 =?utf-8?B?ZTcrcC9PZDBwRHMrcGgxMXFHZS9UdGZRb2l1SVIvUjl4MklIYlNEY3FHUTdE?=
 =?utf-8?B?ODV5R0FPVEx4dVBuemkrcm5OWHoxdU1VQmZnMldsNkpTTmhvUmIwNUdWMmhL?=
 =?utf-8?B?SkpqdVFkU3NMVTFuSERpSW8xYlFpampFUS91TW5wV0JrYnJMVWE4aWNWNzlr?=
 =?utf-8?B?NGFoNlpEdTdTWFFSWVovZ1VjbGMvSllKekQrVGREb3JadERGN0k5TTdCRGRw?=
 =?utf-8?B?Z1dMaWlFUFVqVkRUR0QrbEdlQTRLOVVkQ0dGVTd2YVo4YUFST2syaUsza1Q3?=
 =?utf-8?B?bzg4T2lwS2kzM2dQREtpZ3FEYkpVWUlSY2d4SitRUWFQTXYyZldsOTRlakd4?=
 =?utf-8?B?RDNDOUtqQkpqZUREZSsva28wa0NkWWVUaU9oZDFMNnZzekVQQWtjUHNQSnRh?=
 =?utf-8?B?Z1R2cnZmZ1FtbGp2OWFMTWVNb211azlCRDRNTG52d3pqTkpFdlYrRDNYK0VP?=
 =?utf-8?B?aDJva3c4RXJwdHFDN0xjTkJtcHVrNTJqRXN2cEdYQS8rSGhHM2t2MFBlK09z?=
 =?utf-8?B?VUtPWnNpVGRaenhRNERsOG5hMXNoRC81dlN6eDRZbmoyUTVsWFAyVTBNVFhH?=
 =?utf-8?B?TkN3UldWNXBFNFA1L1ZDWkU0ZTVDNU5YYSsxeU40U0kweUVGV3k5UVpoWExk?=
 =?utf-8?B?UW5rVGs1V3Z1Y0h2U0pjY1NJWS9NOVdwRlVwWnhyS29qNU4yZzlUVkxCN2VT?=
 =?utf-8?B?Q08xY3BYV1hBR3BpcFVQNEF0aDY3czFHL3RvVS9SSGgyYTBtOGNISGdOWTRM?=
 =?utf-8?B?bHY3T3k3OFowZWJCZXc1MjNGeWxNejRyVGx4a3ArbTJCdkRDK2dSN0xLWkhJ?=
 =?utf-8?B?Y1RKT2JmQWhkeGoydjFIWERqVGhJM0tkT2tKQWJIeElyb0Z4anY1eng0bXBK?=
 =?utf-8?B?M1h2VUpYZ0xVdzhSVURqTVJHUHkzTm1kUHRPVXJkVEJIa3ZTMDFyaWZlT05V?=
 =?utf-8?B?QXRjV0tLLzUyNXgxbjhORXdpZnlYMStXYjlqZzJTQ1c0cWU3dGhmNTN4ZmJl?=
 =?utf-8?B?eHBRNEhzUmxKdFFwQ3dqNnkrTTJkdzdJSDl6ZGJFNWtZbldmK2JYQT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b95c16c-8262-4f52-7c82-08df2a96e407
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4144.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 08:32:47.1657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXu4dZsFg4JDlyvSYPfWgnJ5NQXG8rhPB1vHScYG/34e8/tz8nLTXqDZoBmZydwzJ3LUccet8pE+65xkvpVITQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4090


On 8/21/2026 9:41 AM, Krzysztof Kozlowski wrote:
> On Mon, Aug 17, 2026 at 10:57:13PM -0700, Naveen Kumar Rajgiri Bassappa wrote:
>> +title: Axiado AX3000/AX3005 USB Device Controller
>> +
>> +maintainers:
>> +  - Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
>> +  - Krutik Shah <krutikshah@axiado.com>
>> +  - Prasad Bolisetty <pbolisetty@axiado.com>
>> +
>> +description:
>> +  Axiado USB Device Controller (UDC) is used on the AX3000 and AX3005
>> +  SoCs. This controller is based on a Corigine USB IP core and provides
>> +  SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, selected by the
>> +  maximum-speed property. It supports control, bulk, interrupt, and
>> +  isochronous transfer types across multiple configurable endpoints. The
>> +  node describes the memory-mapped register region, interrupt line, and
>> +  other required properties for the UDC hardware.
> Did you implement my comment?
Sorry, we overlooked this comment in the current revision. We'll address it in the next version.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: axiado,ax3000-udc
>> +      - items:
>> +          - const: axiado,ax3005-udc
>> +          - const: axiado,ax3000-udc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  maximum-speed:
>> +    enum: [super-speed, high-speed]
> You miss referencing proper schema to get such property or you should
> not come with own generic properties. IOW, look at other bindings how
> they define a proper UDC device schema.
>
>
> I also do not see a need for this, compatible defines max speed.

Agreed. We'll remove this property in the next revision.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        usb@81200000 {
>> +            compatible = "axiado,ax3000-udc";
>> +            reg = <0x0 0x81200000 0x0 0x00100000>;
>> +            interrupt-parent = <&gic500>;
>> +            interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> resets, phys. Make example complete.

We'll update the example to include the missing resets and phys properties in the next revision.

>> +            maximum-speed = "high-speed";
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a674e36529f7..36af69fb965b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -4468,6 +4468,14 @@ F:	Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
>>  F:	drivers/spi/spi-axiado.c
>>  F:	drivers/spi/spi-axiado.h
>>  
>> +AXIADO USB UDC DRIVER
>> +M:	Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
>> +M:	Krutik Shah <krutikshah@axiado.com>
>> +M:	Prasad Bolisetty <pbolisetty@axiado.com>
>> +L:	linux-usb@vger.kernel.org
>> +S:	Supported
>> +F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
>> +
>>  AYANEO PLATFORM EC DRIVER
>>  M:	Antheas Kapenekakis <lkml@antheas.dev>
>>  L:	platform-driver-x86@vger.kernel.org
>>
>> -- 
>> 2.34.1
>>
Best regards,
Petar Stepanovic

