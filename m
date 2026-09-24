Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3E041E6C5;
	Thu, 24 Sep 2026 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235808; cv=fail; b=VHvS6D9wkXmvUyELymGmTdTknZOn3Agb4G9CuhzKDFRZHad6Djm7DhMW1InPbKmG67TpgGqbc0v7RaumVvZlhxuoKcTYANPA04VihPqv6smPy7zrf4zyb2BY2NdObKiqeQXgi0bYHGXP+7Qt63vD7WU4DHED+r+E2w3WwBFFpxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235808; c=relaxed/simple;
	bh=f64EmOdk1X557fy56y71T3A5NaI/CLYCRkTydegQTEk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mpirog4Z1uGfSBkuq2erpmfbEKV3w5CBk7JBKEpotkw4okLdDezmNSKeCSftPWz/DcR/AZn4Jzv+V1EViSdHL0LjVvwsjw37XnZiqKwL6jt5SN18KhNdR0TgWbcy007MsPk/kbIKRxidW3mJtej8my+SAJNpqIRAoUm9D0/WQWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tr5p4N8w; arc=fail smtp.client-ip=40.107.208.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tr5p4N8w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lO4PJM0UI8UPBJYXOSyvJGuVjujtNWMhOdzQU1Q0Hji8aLVxtk5twfgb4KduK1lj4SxBIikIDtABmSNYWtv2/IAZRHM0XfXlw86F73JZirXGqMDAZuzOtK1i5p+AHaLUxDoKHkFG++AnLe0Yuf2thB18NFuG0Py2DR3XGnoZVDLNhKbKM4EQrRNdiLa8EXoYv9mYhw/Jyk9NDxLlxTondrHvSZRR5wWsbiAmY46f6pSoC0HYhcAjxXkHH97vKPZ33uhziOH0cxaQQj0Bw2k1ctKWYpT0GfVlWRKSiGQfadXA5xfPT+6KkHbVRIWjkx1Asf/iatDE0CYPL3GAaIHf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2vev5exJWViD5aMjoPojNotN8RUSQ7wHozrXS84KvU=;
 b=FukWle+3AGBM6x7JU032f1UZnR9pp6Pj1WE1gE9XCrwJ/2Ts2b8cQOV8LIqq3V0V5xG3iqoGs8CUOdWC/Pm6Z5M+UdlcTiRN0+ZfL9fBm0lrdpu1Xpz+Xm7n4ziwZKfZKQPcLBiT7j2A5iLWmMjuxeEMF0F7bJNBYRkal+q46TMnUDO4KqxOdyVLXgLOiUrMXy6dip7nWzpC50OFZqzpqIoyZ+rhRmRkHBW7jCWfnJ+MCHQNurklZNybmOdEZTkjop66QdEiv8WItZDRzemu9rwx8jCoIaDyKoTAEcGYq7gDKaK+kJfmrKKE9tqkKbGZBdl9FmABr9zKS2yi1vwQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2vev5exJWViD5aMjoPojNotN8RUSQ7wHozrXS84KvU=;
 b=tr5p4N8wVJjbnEFdf0nbiZWuUEXsnezZBF4K1xauMYIgTumGBRWORmUEj82zOhb5PGxozvO7AbKr/SGscwVJOs+YOZ4pXBi6gOeoVXKIT6D4JpgfHpR6Pcx8D256Nh27CsUkjmzoXiuupmGhOOTqieREkYB5exXpzXtUEZbnbo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) by
 DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.18; Thu, 24 Sep 2026 07:43:21 +0000
Received: from DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587]) by DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 07:43:21 +0000
Message-ID: <359fecbc-0f0a-4498-84ec-b0ddac5987d0@amd.com>
Date: Thu, 24 Sep 2026 13:13:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: Add Xilinx
 Versal NET SMMU CSR
To: Conor Dooley <conor@kernel.org>, Tushar Nimkar <tushar.nimkar@amd.com>
Cc: Anirudha Sarangi <anirudha.sarangi@amd.com>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 git@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com>
 <20260923-smmu-changes-v2-v3-1-87bd09ba9605@amd.com>
 <20260923-grafted-undergrad-9356739dd2b5@spud>
Content-Language: en-US
From: Tushar Nimkar <tunimkar@amd.com>
In-Reply-To: <20260923-grafted-undergrad-9356739dd2b5@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::10) To DS7PR12MB9475.namprd12.prod.outlook.com
 (2603:10b6:8:251::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9475:EE_|DM6PR12MB4041:EE_
X-MS-Office365-Filtering-Correlation-Id: afcef39d-690b-496c-d73c-08df1a0f81c3
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|18002099003|22082099003|3023799007|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	vzgNLHBfriKWzA0CRyJw5BekWRIoLprYSLsfWEeqG5RcDO4m346mjgEoBPkPH6UkFw9bTuXTJnCJoKz9XRjXZqwjzcka4eh79wkCxASJJW06NGqLCzcj+2nlemp4sEecLTFD/ltWfzBqIJxPkowqPlmXzZQ2LjPzKOZElsHw2bfrNU5kWcpF6MXkjFJPy8e+Kk0eECruFwPYKIHZvujWgXMXkxQhsQ/jBXgojU38GzQR5WOCpkMZ/xqqHVqQdtCwXoyhsMcShDN8MzUWqUYxD6M3jJB1z6G37QgtbLZarBkGgThJIlVPidizLfVSSVMQjhXsmWXPFJD3pp16Kkgp90Q3Kz9ucpNfxQFo05qDSCe1wHB1hy+jMxMR8YAktuS/f7HtXXZ+P5+QX0ckOjaORJkZhBdhYYm5eb4Melg/lvE+ATdvc4XPQKGtHT1T0BjlB+HU8zgYn1IgwE7MX/cjUvAUCTC/2XhJb1Kf/+rrEn1t8z+j+UXLc5HdAQY8v/B2ZIF+A8YyGbfVoD8bbnSHVBUurKgtNM+B4juEyHfDJkaiB2xsexoZQYi78gj1i2dsAODYf1Te7IYh0hlidJWEMGvqzp6117eOT2EwK8Tb7Kq/bbZ3/AZO6uFhM6+zovfa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9475.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmZYcGtWUlM5Q0d6VFFqcU1LU1ZSd3BkQXhaSEhSRVg2SEJlMnU1MXNnTUg4?=
 =?utf-8?B?YmpoWHhwa1VaTnBHSTdjc3NmNFpGTzNJUlVtSkFDYlpZdHVVYkg5WnQwU1kv?=
 =?utf-8?B?V2lMTTZoTmhqQWdkdnBEaDg1ZmJSK2xFeERrRncvS2dCRjh6Ukx5WXBCU1Zv?=
 =?utf-8?B?VVZzWlprSVRJQXgvUGlTTDZXYWpmTnExYWh2K2swcjViVVVPNXEwYm0rWDlV?=
 =?utf-8?B?b09BYzNQRzZDQ1JsRnl2NUJVcWlmWmdPQWJNL0pBZDFUMWxoZ2cya1dpaEl1?=
 =?utf-8?B?YS9HUVpnZEpFdVdLRFpudWhlUThIN1BMT040ZzlZdG5pSFdZTzlzTktCdE1X?=
 =?utf-8?B?cU1pNjcycjdpUTZpYXQ3ZDdFUXduQWc2ZGVPZW1SNTl2UmRVQmoyVG9hT0x4?=
 =?utf-8?B?eDlUQlAvOCtLUzRkSXQ1Zlo2aWNzYzBESk1JMmNUQ1IvRng1ZWlKdHRpNW5s?=
 =?utf-8?B?QW5kR1grMVlUbytMSjZmN1h2S2RFdERuckFMd21ySEIwMUZMNHFJd2UwR0FO?=
 =?utf-8?B?bUlvYnlCdE0ycDcySTRzTWxxTDlpSXY4QUJxc2p2dmdiMjZQd244TFJabU1w?=
 =?utf-8?B?SjJrQUtMcWxTWnJZN2RjaDNUSWQwS2JQVFEwc3pXcEwyelBieTdjTUdKODIw?=
 =?utf-8?B?L2ZMWTI4QXNDVlhQa3BaVTlITjBiaU9KY294TXFIVzFETE1iaDZYYk9lYmpQ?=
 =?utf-8?B?YW1jY0VQbkcxcmRoNy8ycDN6RjNNNjhwM2ltb1FxRGtmc0J3RTlIWFdvdXdm?=
 =?utf-8?B?Zm9GQWs2T2NUbUtoYS8yTnhLd1ZFdUNMelJMb1pTK2FjTWdiYno0cTh5cUlz?=
 =?utf-8?B?WDBPcVJTRklyYmg4ZjdqOWo4QUVWeElWZjZZYW41NWREY0pRYTRPQlhlczJM?=
 =?utf-8?B?aHdFSEJhOE9KSEE4ZmRCRlFEM0hGTGpRek9pSENJYkdRdWNSdGlSQVQ0Smta?=
 =?utf-8?B?b2w2MXVtaGdRaVc4ZmdUVkwyZWhTb1E1NjNuK1dZZjhOVENHRzdLL0wyck0y?=
 =?utf-8?B?bTNsODRVclNveDU1L1JValFiMWE3Y1pBUVMrNURxVmhqZVExdUVsRTdsOVNS?=
 =?utf-8?B?RFJ5QlNCTDlteitOQnBtWlhZVEdqcGRTMmd5bjg3QW9EWWt2aUpDS3hDaVpr?=
 =?utf-8?B?NDVWdEZ5bkJsM1RoK1RxZzlvOGh2YlgrdHVnMEk4TDB4L3JqTmZ4RmJNSFpK?=
 =?utf-8?B?Q2Y5ZXFiWEdtT0EzbU43eHlPbkNXRkRWcHZHVnROd3hHa2sxb2xjVDRHcGZs?=
 =?utf-8?B?ejYydy9vWUFhNG0xNkZlQjVnOEt6Z2pCRFZYOXpqQUEva01nS2FSaGJ0WG9M?=
 =?utf-8?B?dms1dHBRZUVXYStzS05ocHJ3NW50UlI2VnBkd3pxcS84ajJod1hqUVl0QytR?=
 =?utf-8?B?N3JaaGFYMHAzaGRETzEvMUUzK0lRNVFxN1VMSnVxNUpHb3E4ZlFRbjBtdFRU?=
 =?utf-8?B?cGsydDFsdXJVTHRseFEyY3FuYnVsN2NpUGIweVh2L2wrNStDVVV2S0UraTRy?=
 =?utf-8?B?T0pjWEsvWmo2RkJlTlVGNWdESlhNMlFrZndYYmNDNEZtTSs4TnhkOGQ4SExK?=
 =?utf-8?B?MmNuQzFpejVMMVY4eFhQSWVjSGRLMElDalhQMFVFZ3V3NFdoSzdIa0JoTzkv?=
 =?utf-8?B?MDJ1bVA1QWpmY3lUWVlVc3FjeURSL280eTVPTThCR3I0NUVONVgvTUdIWHV3?=
 =?utf-8?B?UmhWUTNvMWFGSys5cExieitsMmpaYXZIWVkwelFUNnlzZEZreWhvMFRIMzZu?=
 =?utf-8?B?THozNytINENEWEs5RHFzQnNYc3VzV0VGanQ0RWNRQnlGNitGMkVPdEZZVXEw?=
 =?utf-8?B?LzZVaXVuMnJZemJEOURtNU1zMWVZbnBQa2hQY1gwajNKRDhLY2xiWUEyMWsr?=
 =?utf-8?B?N0N4a3BXMVp5eXgvSkpjTjhzbHhmT3NQaUdPUU5iaGsrNml4c2RTdGEyRFUw?=
 =?utf-8?B?SE5Lb29ZcTFQUmIzSVNqaThFM0cxdXlrV1psL2xISThhbVVMb3lGQ0FHQ0wv?=
 =?utf-8?B?WUZYVDJUZmNRSnZuRnFUN2tQTnlseHNwdElvNnVISHM1dUJpOVo1ZmJyRlgv?=
 =?utf-8?B?MFkrRHhxRDlnVWpYbVloVEVGQlpKRjRCWVhzc1J6ZGVQRUxGQUlMMURJWXhT?=
 =?utf-8?B?QVBaM0lQQ1JvQWp4YzFzL2VkWDZZVGphUkx2NWRtbEJERUxYK21JemtjVE02?=
 =?utf-8?B?WEFZNXlYSUQ3d2NmbDdhejdWY2dkTjlEOFN1TS9hSlQ3S29BM04vTnJmZ2Q4?=
 =?utf-8?B?VThOY1FiVFEvZ0xnMng2Unl3S245N1lsK3JxTjNoam9RVVAxK25EMjJEcjZr?=
 =?utf-8?B?MHhmVHFEMW9Xa2ppcEY4L3UvTncvd0dCNXlGLzRPb1NwYXBVUHZQdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afcef39d-690b-496c-d73c-08df1a0f81c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9475.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 07:43:21.7222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WpY7LbPr2xYkWdjSBQb7IByC3Rd2lf3eXqSqWAGA9BuYjyns0zpy0q3Mk7BYFPckzgLjmM8Pgza7qpiHaSKoGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4041

Hi Conor,

Thanks for review.

On 9/23/2026 10:11 PM, Conor Dooley wrote:
> On Wed, Sep 23, 2026 at 12:46:31PM +0530, Tushar Nimkar wrote:
>> From: Anirudha Sarangi <anirudha.sarangi@amd.com>
>>
>> Add a device tree binding schema for the Xilinx Versal NET SMMU CSR
>> (Control and Status Register) interrupt controller.
> This sounds like a very odd name for an interrupt controller.
> What else does this block do?
>
> You've actually got a 0x1000 carve out in the example, starting at a
> round number, so I suspect this is "fine" and if there's other features
> required later you've not painted yourself into a corner by defining a
> device for one register. The driver having a starting offset of 0x24 is
> another point in your favour.

The SMMU_CSR is a Xilinx-specific integration block for the ARM SMMUv3. 
It provides interrupt enable, status, and clear registers for SMMU 
interrupt sources before forwarding them to the parent GIC. The binding 
models the CSR block as a whole, allowing future integration-specific 
functionality to be added if needed.

>
> I'm inclined to ack this, I just want to see an answer first.

thanks  a much !!

-Tushar

>
> Cheers,
> Conor.
>> The SMMU CSR block acts as a vendor-specific interrupt controller
>> in front of the ARM SMMUv3, providing registers to enable and clear
>> standard SMMU interrupts such as EVENTQ, CMDQ_SYNC, GERROR and PRIQ.
>> Interrupts must be acknowledged in this block before being forwarded
>> to the parent interrupt controller (e.g. GIC).
>>
>> Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
>> Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
>> Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
>> ---
>>   .../xlnx,versal-net-smmu-csr.yaml                  | 75 ++++++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
>> new file mode 100644
>> index 000000000000..38b63e51b732
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interrupt-controller/xlnx,versal-net-smmu-csr.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Xilinx Versal NET SMMU CSR Interrupt Controller
>> +
>> +maintainers:
>> +  - Anirudha Sarangi <anirudha.sarangi@amd.com>
>> +  - Tushar Nimkar <tushar.nimkar@amd.com>
>> +
>> +description: |
>> +  The Versal NET platform includes a Xilinx-specific SMMU CSR (Control and
>> +  Status Register) block that acts as an intermediate interrupt controller
>> +  for ARM SMMUv3.
>> +
>> +  The block provides registers to enable, disable and clear the
>> +  standard SMMUv3 interrupt sources (EVENTQ, CMDQ_SYNC, GERROR and PRIQ)
>> +  before forwarding them to the parent interrupt controller,
>> +  typically a GIC.
>> +
>> +  The controller receives one parent interrupt and demultiplexes CSR
>> +  status bits into the following child interrupt identifiers
>> +    0 - EVENTQ
>> +    1 - CMDQ_SYNC
>> +    2 - GERROR (GLOBAL)
>> +    3 - PRIQ
>> +
>> +allOf:
>> +  - $ref: /schemas/interrupt-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: xlnx,versal-net-smmu-csr
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  "#interrupt-cells":
>> +    const: 1
>> +    description: |
>> +     Single cell containing the child interrupt identifier
>> +      0 - EVENTQ
>> +      1 - CMDQ_SYNC
>> +      2 - GERROR (GLOBAL)
>> +      3 - PRIQ
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupt-controller
>> +  - "#interrupt-cells"
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    interrupt-controller@eca10000 {
>> +        compatible = "xlnx,versal-net-smmu-csr";
>> +        reg = <0xeca10000 0x1000>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +        interrupt-parent = <&gic>;
>> +        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
>> +    };
>>
>> -- 
>> 2.34.1
>>
