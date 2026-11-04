Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793790412;
	b=xm3NDCVB+Nk8/ONUK3eElC8nB5Ah+kOkC1vMLMkBBK7WSfh+mfI/ni++HxijsJcREwTT
	 rADM1HGp3GIQJy0NMCoMzxXT394TgsplZYlj7cTjeF/zdc5hd8Go/0+rN7O1rnA5QUoXf
	 mxaw916a9ItMt2Lfzhq9k0cYLle/pSGxGBft2jGJUYtZJYGA8in2pp9MY2qSpdwpT/7am
	 0Vut2glISptVgH8ED8qmbQlQeMgRLgQ+iCKnaIXLGTDyq0j04LKSm0SnDYC3wTpJ2e4XX
	 MDXeVCt2glhKE5qcNBtvQobrxijPIYlIPPNH4fTCAnICtexPjN1PdVRals4ycW5Ieig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790412;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=Qgv5Xqik/ac2ZR0jM/Wc1LlwA7c2nQmToB3PP6/cosE=;
	b=mbjHDQsYziPsNJmeYzBuUXTRljJmSWe5DfRDhr+lwiPJ00jSc41wORRoVG1r4Tux4WIm
	 o62d0iqBE27EWKHaJJd33nLbIfNNijX1Ryy029Mp/9HlA3Iu7KwiziF0imWWXJ7jNmhE/
	 x/9miZWX2QAwUhA7cj6XMOjY5ojiO+v6lqev4ETc1mueYwf2xNJtaIwU439ZcTqQhKvwy
	 OaRtX1646h8y4I884IgLp2HOLQQRwl7T3oFsHhSQXvfnl3aX83MNv1hTLdk68hDJOl3bX
	 UvlIyNRUzWo1gvkWifszxncC6eRb2QTuUnNIO7eUvN9eCDbN9v2RyZODCVwe/V89Fcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SbU0nSak;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.7
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010007.outbound.protection.outlook.com [52.101.56.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D65C606A329;
	Wed,  4 Nov 2026 11:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D65C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SbU0nSak
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K87izcJWlirR5roV/MgEQ9xdHUbQlcqihD5k0WIy9CApPEtmda1Vb5TABnMPqyWNcTkUoWNzBQQFd/tvSmk+vPkNV1D8x4ztWXmgv2PCNxS4JqrTZ0rPyJVIt3PNiLFjRQ7bTKPDBJ4AlDUNLb2OSrXUY2/qPQnLWK0tQtXffqowX7s9vvRg+AXG0jeVTSwfIeeGX2bw+AxJwuoerKjOsIY9tMuCmSk6Rgn/zH7ZYi9Vzt3xJjUM7PKldkn+OXEs5AXvNeZQLgxlHJwF2vWOWnGI4KV5P78hjdAHuR5lBvNPo9Qi76yLB2hIVuMMF0k4x6m8jPAZolr1raNWCJt++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qgv5Xqik/ac2ZR0jM/Wc1LlwA7c2nQmToB3PP6/cosE=;
 b=vL5eK974OwWX+V/mvjIPIRe+GeLbITH+YfTiw7v8qq6esVQEdwpONPm25V4IDe72akV3Fq5YqJFuPQR+Cl+7bZ8D6jPg7zWyIqNDAUiTWsVQAetR7Nrd68rM4JoifRrIvEa9hG4AlcNOVdvn90oEOdnyE3/+dSMkn0ZJEnKCBjYJwz+2CBF3sbOx+xRF2fHwfUXoJXTyK72krvY1cQAGdBR3ya5yjeJihvfpCARV/maxcd4ujQgZjJG2lN8LswnyAjYVAxaacKHWhJimikVMdsixLaKt9YGxaEmscE1R/SAySSxCXdMhipN3mJH8hEPI+3J8aIswhkgS3bMLnKYYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qgv5Xqik/ac2ZR0jM/Wc1LlwA7c2nQmToB3PP6/cosE=;
 b=SbU0nSakJwqTpQVJnrp8zqj6ueHvIGLrr9YlOoASJCHGOSMLvXndFqz1XciHZ6JQMbw1RdD6iTfOq1q6RRsEp3b/F6OuMtIis4ObIdJnPtg8UQNMaewT8sIK1lqcqVYmwNGXkrigWQtavAoElf4S8KVW6P09mxi5ydNPGFcwTP8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SA1PR12MB6749.namprd12.prod.outlook.com (2603:10b6:806:255::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:06:48 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:06:48 +0000
Message-ID: <ab197016-5411-44cc-a896-8787411648ba@amd.com>
Date: Wed, 4 Nov 2026 12:06:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] arm64: zynqmp: Add support for ALINX EdgeBoard
 FZ3A
To: Pufan Jin <cyan2254650260@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch, Conor Dooley <conor.dooley@microchip.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261014175020.62907-1-cyan2254650260@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261014175020.62907-1-cyan2254650260@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SA1PR12MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 01318654-be2b-4318-7329-08df3a63b85d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261022075727099003|261022105027099003|261021123027099003|261021135927099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|56012099006|5023799004|11063799006|10067099003|260925021311599003|260925022911599003|260925021911599003|22082099003|18002099003|261009221227099003|261009223027099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	F37HaEq6aJBK+uIfM/dPrfCt1E/PFIKk6PTN6ybgFT5Q3lnBXH5YednaiRULpBS62Klgt5J8wtcCOFoU0iMgoYSqTNg1kFQMEyBnD5Bg8niTGijVDM8GcAm3Jrr8BnLA6AVmf2FqTFo030F7KdbdeYDfP8Ye3wplGw/bYMYvPqiXD6jdZiVF2nNlsU/reHlzqzPo1cuPeDNz6RGuRt5ZSRThiWgj5RCG3I6dLyD5Pbw8ybTx14+v1VfXnQtboQyN4iEDmzCGF60vFId3uhANjCgGZX+HR99AnG8loC0KemV4sDZwpbqiordQ3jMo6Pf1HLMNZcccRoZsnATcKBhfHI5GzcmDVo2jz6GEKOZFlt41z3vO3hNArgLoJ+Bt9w3CPlbMe/vhWqw/p51cKqdwLLWjDy9ls6r/OmZYnGIp08OQdfY3o5QD36GTfWA0qif1A2U+VkT/B11Pebb9vmbrpnzj5y3rpvZiLUKSywnmvLBtnpBPryi27O4sY/9vh/mgXDAs1nky4mu8qHrSPp6xRXd6Dmj8kPl//nSEt1iWL7DbE3kiGBpxBmauFtGvvRt6ijq1zDJjMs6/kITa7tVLOesjG752lhJUrQ+bj2sUC4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261022075727099003)(261022105027099003)(261021123027099003)(261021135927099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(56012099006)(5023799004)(11063799006)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(22082099003)(18002099003)(261009221227099003)(261009223027099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWtOVG1jODZ6MHJ1RGdkL2NtVS9jVkhPTkp5S05EcmJycVpubUN0emVjNXQ3?=
 =?utf-8?B?elZkOG9seGdjNTVIWFVaYW5POWVBNVl0V01zSnhtRmxWS0R5ZWFCY1JiTzcw?=
 =?utf-8?B?UWFJcE0rTDBPcFFVckNhajVXdkk5c0gxeVFXTzY0bkd3ZzhSUm9teFVOazhT?=
 =?utf-8?B?NVE4cjVkYTBEa1pZOHI4YndjeG9LdGVVUXg4ejN5UnpSd3FBL3JsMThvaktT?=
 =?utf-8?B?NWg3YXFIVTF3R1JLUTB4QndWOUlWdmo4TTc3Zm9vSHg1RVl4Ynp3eVFWclY5?=
 =?utf-8?B?V1JPTEtRMGVGbEtTY28xK0hPUnh3TkU3a0pFaTIyWXlUTnJGNjU4OUEvajJh?=
 =?utf-8?B?c3k0N2VjOG9wVG5UUkp0UnBFS3FLMUFzK2t0cVF2WGNKcG9kQ2tPUkNSVnRT?=
 =?utf-8?B?dDVlcXZDQVg2VnBWVlkrRG0wZGFkbk9mMnB5Tmxwb3pVZDNpa1RKZXgvUmhD?=
 =?utf-8?B?YnN1VFlRTC9DZkgwM1hwSmNMemM5MVIvYkFqOEpNTHMrZE5ZWTgvZEdoZ0Fm?=
 =?utf-8?B?L3hFb0JBZkJ3VVRrQWdPYWtrSDFjS24xWmd0c2ZGVml4UUN5NDh1RzEzRjFt?=
 =?utf-8?B?b3hJNDZpeFVYcjVTRDVJRHVmcElack5laDh1YThRYmVBTFlRblkzZTBsNXNi?=
 =?utf-8?B?ODhOS0RqRXlLNkRGQ2dUejdPaHhEd1RNd01Samk2MFlPRVRBOXgvdmxtb2Fh?=
 =?utf-8?B?dWFEUnAwM2J0RG1va29NdWdhdDhBY3V6MkRwRUdBWkdKWXZGK3l2OGFyKzhR?=
 =?utf-8?B?U0JNYWdNVVI0ZUdGdWlVYWE2NUxjak41QUNsd3JwbzdBaXllcnBzN2FubHpW?=
 =?utf-8?B?cEJMRGtDbnh6QTVtZDRGd3h1NS92NDBOMEk4cjBKQlJiY0lkL1M2NjQzN0lv?=
 =?utf-8?B?TzArVjg0Y2FhVS9QVTVLMlBESWFQYlp0VWFOY3kwVGNJR3lyRjVZQXNvS1R0?=
 =?utf-8?B?WDlSMkpqSTM2NWVMZUFLY0JkTXBmbEpRSDN4V0JrckVteHBQSXhnUktTRko5?=
 =?utf-8?B?VXhETGFMbXhqczdqdnRBazdpSW1QVWpIZ3JZUnNhTXNaTTQwamRUdVdQdThy?=
 =?utf-8?B?T1UxTGtCdW9zWXUyNnF0TElLQmlIQ2xOZVpjNkJLb3dkTHRzZHhtaGZ3eUd6?=
 =?utf-8?B?QUtyWUIvcG11cmszMWlmVnFvZUxsQVA2dlU5blBnZ3ArNmwxdEowbDFnUmJh?=
 =?utf-8?B?MVRmV1NENFJ1REowK3puT3lpSkh6Z2RwTDhUY3UwMlRrRFh2TEc5MXpIUXVD?=
 =?utf-8?B?VGVXVzQyNWtsc3BIMFIwN2o4ZVpGcW1mTFQrdGwzMytFMUd1UXJJNmdPbU00?=
 =?utf-8?B?eVlqeVNudGF0dWlMRGcydEV3QVJ1QUp3ZHUrYStmb0JpWWdRR0ZlTVF0WkRv?=
 =?utf-8?B?ZEhYbXR0RDRVb09qMHMyTTdsS0lRR0wrMEhWRTRkYk1SYis5V1g5WGd6dnpQ?=
 =?utf-8?B?SmMwbkdsV0pLdzlncFNnV2IxUVRpSXk0Qk9PMFlUeU1jbndHZFdhWkY0SENh?=
 =?utf-8?B?ei8zVzFJVDZPZWs2cHFpcTNVRWZGZVlvSVN4UXdQY3JWWHRhV0pnblBGamd3?=
 =?utf-8?B?eGJXRTZ0bTdycUxJeVM1NUlLMmxxL21CUk5Wa1JmUHp2d2ZiTVoxZVFiM2sx?=
 =?utf-8?B?UkVBYXlsZFBxOXh6Nnc2QVJ4QzhJcEZnRDY1RGNOb012NitDZ3Z5dE9tcmpz?=
 =?utf-8?B?WldTb1k0eWwxaThpczJVbkVpbUlja1MvYXJLMVc5Vkk2QXZBVWxmbisrREdQ?=
 =?utf-8?B?QTkwbHZPTHpFZW5UeFpWbGxwNG1zVVYwNFlnNVAxdnB6WWd1UUFwMXJVNlpp?=
 =?utf-8?B?S0I1T2FzMityQVdYbG9XdytyajVZODRyU1Z3cG5NTUhiclZXeTd5Ky9qZHli?=
 =?utf-8?B?V0k4UURlNVg0UGFRM1d5STVPS2tyWUVDM3VDYVhwZWZMdU9raTRGVjJ2SWZ2?=
 =?utf-8?B?VHVFNXZSVnVkRmtMY1ZxYmlFbzNkT2V0TEgvY28rYWJRNnhyM1MwZm5lSFFU?=
 =?utf-8?B?S0Q0YTJ2Z1VNazl4V09WQlhNU0thUnNaQ3FieE5ZSGJvOERpNkg0dGk2MUUz?=
 =?utf-8?B?NWFpelNFT24zWEh1UzFPQkhDZVMxWG01REdoYVBKakZ4TDJIaVo0alQ2UTBP?=
 =?utf-8?B?WWloL1N2NHdGRTF0SE1odEQ5VkNhak5zQXUxTFEyb05HREVtUnpIUVZHeXpv?=
 =?utf-8?B?TzlsTTI3TmtTVlhmZWI1dTNWMjZSd2ZxWHVsM1l5UkJMVnFJcTE5UnJLdmoz?=
 =?utf-8?B?Q3NzTnJBSFdQWEYvZ2JRRW1tMDBIckJKTGx3SXBxUmRuazdGVVREN3JGQjZR?=
 =?utf-8?B?WFRvRkNaUjc4WkNDRlczWWpFYllSYndVeUZpTGZydE5nOWlrS3RGUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01318654-be2b-4318-7329-08df3a63b85d
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:06:48.0016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YRJDIvEunWSZYR0ysIH86RhVjKmiDCyi+PkC/YrZYGIsSzQ861v28YJMI/mUMGP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6749



On 10/14/26 19:50, Pufan Jin wrote:
> The ALINX EdgeBoard FZ3A is an embedded computing board from ALINX based on
> the Xilinx Zynq UltraScale+ XCZU3EG SoC. The hardware was designed and
> manufactured by ALINX for Baidu's AI EdgeBoard program.
> 
> This series adds the ALINX vendor prefix, documents the board compatible,
> and adds a device tree for the board's PS peripherals:
>    - UART1 debug console
>    - eMMC (HS200) and microSD card
>    - GEM3 Ethernet with Micrel KSZ9031 PHY on the MDIO bus
>    - I2C0 and I2C1
>    - QSPI NOR flash
>    - PCIe
>    - USB 3.0 host
>    - DisplayPort output
> 
> Public board documentation and product links:
>    - https://ai.baidu.com/tech/hardware/deepkit
>    - https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
>    - https://www.alinx.com/
>    - https://vd100-20232-v101.readthedocs.io/zh-cn/en/VD100_S1_RSTdocument_EN/00_aboutALINX_EN.html
> 
> Tested on ALINX EdgeBoard FZ3A hardware with Linux 7.3.0-rc5: the board boots
> from SD card into userspace over the serial console, gem3 negotiates
> 1000Mbps/Full duplex with phy-mode = "rgmii-id", and the eMMC runs in
> HS200 mode.
> 
> The base DTB passes CHECK_DTBS=y without warnings, the bindings pass
> dt_binding_check, and the DTS passes dt-check-style.
> 
> Apologies for the threading issues in v2 caused by an SMTP relay breakdown;
> v3 is sent as a clean, unified thread and addresses all reviewer comments.
> 
> Changes in v3:
>    - Update author and submission email to cyan2254650260@gmail.com
>    - Patch 1:
>      - Fix legal transliteration to "Xinyi Electronic Technology (Shanghai)
>        Co., Ltd. (ALINX)" (Conor Dooley)
>      - Add website link in commit message (Conor Dooley)
>      - Collect Conor's Acked-by
>    - Patch 2:
>      - Collect Conor's Acked-by
>    - Patch 3:
>      - Add public board documentation and product links in commit message
>        and DTS header comment (Michal Simek)
>      - Conform to DTS coding style:
>        - Sort compatible before model in root node
>        - Sort children in natural-sort order
>        - Reorder properties in canonical order (phys before phy-names, etc.)
>        - Add required blank lines before status properties
>        - Alphabetize pinctrl children and pin configurations
> 
> Changes in v2:
>    - Use the correct vendor prefix 'alinx' instead of 'ebdee', and rename
>      the board and DTS file accordingly (Krzysztof Kozlowski)
>    - Describe the board as a single board computer with the SoC, DDR4 and
>      eMMC on one PCB (Andrew Lunn)
>    - Add the MDIO bus and describe the KSZ9031 PHY with phy-handle (Andrew Lunn)
>    - Enable eMMC HS200 on sdhci0: drop no-1-8-v, add pinctrl and mmc-hs200-1_8v
>    - Drop power-source and bias-high-impedance from pinctrl_gem3_default,
>      which only produce spurious warnings on pre-2023.1 PM firmware
> 
> 
> Pufan Jin (3):
>    dt-bindings: vendor-prefixes: Add ALINX vendor prefix
>    dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
>    arm64: zynqmp: Add ALINX EdgeBoard FZ3A
> 
>   .../bindings/soc/xilinx/xilinx.yaml           |   1 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   arch/arm64/boot/dts/xilinx/Makefile           |   1 +
>   .../xilinx/zynqmp-alinx-edgeboard-fz3a.dts    | 360 ++++++++++++++++++
>   4 files changed, 364 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts
> 
> Range-diff against v2:
> 1:  c33ea63b7 ! 1:  ceeae5872 dt-bindings: vendor-prefixes: Add ALINX vendor prefix
>      @@
>        ## Metadata ##
>      -Author: Pufan Jin <2254650260@qq.com>
>      +Author: Pufan Jin <cyan2254650260@gmail.com>
>       
>        ## Commit message ##
>           dt-bindings: vendor-prefixes: Add ALINX vendor prefix
>       
>      -    Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
>      +    Add vendor prefix for ALINX (Xinyi Electronic Technology (Shanghai)
>           Co., Ltd.).
>       
>      -    Signed-off-by: Pufan Jin <2254650260@qq.com>
>      +    Link: https://www.alinx.com/
>      +    Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
>      +    Acked-by: Conor Dooley <conor.dooley@microchip.com>
>       
>        ## Documentation/devicetree/bindings/vendor-prefixes.yaml ##
>       @@ Documentation/devicetree/bindings/vendor-prefixes.yaml: patternProperties:
>      @@ Documentation/devicetree/bindings/vendor-prefixes.yaml: patternProperties:
>          "^alientek,.*":
>            description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
>       +  "^alinx,.*":
>      -+    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (ALINX)
>      ++    description: Xinyi Electronic Technology (Shanghai) Co., Ltd. (ALINX)
>          "^allegro,.*":
>            description: Allegro DVT
>          "^allegromicro,.*":
> 2:  888548b4e ! 2:  da2a7b3e7 dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
>      @@
>        ## Metadata ##
>      -Author: Pufan Jin <2254650260@qq.com>
>      +Author: Pufan Jin <cyan2254650260@gmail.com>
>       
>        ## Commit message ##
>           dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
>       
>           Document the ALINX EdgeBoard FZ3A compatible.
>       
>      -    Signed-off-by: Pufan Jin <2254650260@qq.com>
>      +    Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
>      +    Acked-by: Conor Dooley <conor.dooley@microchip.com>
>       
>        ## Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml ##
>       @@ Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml: properties:
> 3:  cd96303fb ! 3:  273fcd977 arm64: zynqmp: Add ALINX EdgeBoard FZ3A
>      @@
>        ## Metadata ##
>      -Author: Pufan Jin <2254650260@qq.com>
>      +Author: Pufan Jin <cyan2254650260@gmail.com>
>       
>        ## Commit message ##
>           arm64: zynqmp: Add ALINX EdgeBoard FZ3A
>      @@ Commit message
>           The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
>           dt_binding_check.
>       
>      -    Signed-off-by: Pufan Jin <2254650260@qq.com>
>      +    Link: https://ai.baidu.com/tech/hardware/deepkit
>      +    Link: https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
>      +    Link: https://www.alinx.com/
>      +    Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
>       
>        ## arch/arm64/boot/dts/xilinx/Makefile ##
>       @@
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       + * Device tree for the ALINX EdgeBoard FZ3A
>       + * based on the Xilinx Zynq UltraScale+ XCZU3EG
>       + *
>      ++ * Product info: https://ai.baidu.com/tech/hardware/deepkit
>      ++ * Documentation: https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
>      ++ *
>       + * Copyright (c) 2026 Pufan Jin
>       + */
>       +
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +#include "zynqmp-clk-ccf.dtsi"
>       +
>       +/ {
>      -+	model = "ALINX EdgeBoard FZ3A";
>       +	compatible = "alinx,edgeboard-fz3a", "xlnx,zynqmp";
>      ++	model = "ALINX EdgeBoard FZ3A";
>       +
>       +	aliases {
>       +		ethernet0 = &gem3;
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +		stdout-path = "serial0:115200n8";
>       +	};
>       +
>      -+	dpcon: connector {
>      -+		compatible = "dp-connector";
>      -+		label = "mini-DP";
>      -+		type = "mini";
>      -+
>      -+		port {
>      -+			dpcon_in: endpoint {
>      -+				remote-endpoint = <&dpsub_dp_out>;
>      -+			};
>      -+		};
>      -+	};
>      -+
>       +	dp_aclk: clock-dp-aclk {
>       +		compatible = "fixed-clock";
>       +		#clock-cells = <0>;
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +		clock-frequency = <100000000>;
>       +	};
>       +
>      -+	memory@0 {
>      -+		device_type = "memory";
>      -+		reg = <0x0 0x0 0x0 0x7ff00000>;
>      ++	dpcon: connector {
>      ++		compatible = "dp-connector";
>      ++		label = "mini-DP";
>      ++		type = "mini";
>      ++
>      ++		port {
>      ++			dpcon_in: endpoint {
>      ++				remote-endpoint = <&dpsub_dp_out>;
>      ++			};
>      ++		};
>       +	};
>       +
>       +	vcc_3v3_pcie: regulator-pcie {
>       +		compatible = "regulator-fixed";
>      -+		regulator-name = "pcie-reset";
>      -+		regulator-min-microvolt = <3300000>;
>      -+		regulator-max-microvolt = <3300000>;
>      -+		gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
>       +		enable-active-high;
>      ++		gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
>       +		regulator-always-on;
>       +		regulator-boot-on;
>      ++		regulator-max-microvolt = <3300000>;
>      ++		regulator-min-microvolt = <3300000>;
>      ++		regulator-name = "pcie-reset";
>       +	};
>       +
>       +	reserved_memory: reserved-memory {
>      ++		ranges;
>       +		#address-cells = <2>;
>       +		#size-cells = <2>;
>      -+		ranges;
>       +
>       +		linux_cma: cma {
>       +			compatible = "shared-dma-pool";
>      ++			alloc-ranges = <0x0 0x0 0x0 0x7ff00000>;
>       +			reusable;
>      -+			alloc-ranges = <0x0 0x0 0x0 0x80000000>;
>      -+			size = <0x0 0x20000000>;	/* 512MB */
>      -+			linux,cma-default;
>      ++			size = <0x0 0x20000000>;
>       +		};
>       +	};
>      ++
>      ++	memory@0 {
>      ++		device_type = "memory";
>      ++		reg = <0x0 0x0 0x0 0x7ff00000>;
>      ++	};
>       +};
>       +
>       +&ams_pl {
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +	snps,dis_u2_susphy_quirk;
>       +	snps,hsphy_interface = "ulpi";
>       +	snps,usb3_lpm_capable;
>      ++
>       +	status = "okay";
>       +};
>       +
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +	clocks = <&lpd_lsbus>, <&zynqmp_clk GEM3_REF>,
>       +		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
>       +		 <&zynqmp_clk GEM_TSU>;
>      -+	pinctrl-names = "default";
>      -+	pinctrl-0 = <&pinctrl_gem3_default>;
>      -+	phy-mode = "rgmii-id";
>       +	phy-handle = <&phy0>;
>      ++	phy-mode = "rgmii-id";
>      ++	pinctrl-0 = <&pinctrl_gem3_default>;
>      ++	pinctrl-names = "default";
>      ++
>       +	status = "okay";
>       +
>       +	mdio {
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +		#size-cells = <0>;
>       +
>       +		phy0: ethernet-phy@1 {
>      -+			reg = <1>;
>       +			compatible = "ethernet-phy-id0022.1620";
>      ++			reg = <1>;
>       +		};
>       +	};
>       +};
>       +
>       +&gpio {
>       +	clocks = <&lpd_lsbus>;
>      ++
>       +	status = "okay";
>       +};
>       +
>       +&i2c0 {
>       +	clock-frequency = <400000>;
>      -+	pinctrl-names = "default";
>       +	pinctrl-0 = <&pinctrl_i2c0_default>;
>      ++	pinctrl-names = "default";
>      ++
>       +	status = "okay";
>       +};
>       +
>       +&i2c1 {
>       +	clock-frequency = <400000>;
>      -+	pinctrl-names = "default";
>       +	pinctrl-0 = <&pinctrl_i2c1_default>;
>      ++	pinctrl-names = "default";
>      ++
>       +	status = "okay";
>       +};
>       +
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +
>       +&pcie {
>       +	phys = <&psgtr 0 PHY_TYPE_PCIE 0 0>;
>      ++
>       +	status = "okay";
>       +};
>       +
>       +&pinctrl0 {
>       +	status = "okay";
>       +
>      ++	pinctrl_gem3_default: gem3-default {
>      ++		conf {
>      ++			groups = "ethernet3_0_grp";
>      ++			slew-rate = <SLEW_RATE_SLOW>;
>      ++		};
>      ++
>      ++		conf-mdio {
>      ++			bias-disable;
>      ++			groups = "mdio3_0_grp";
>      ++			slew-rate = <SLEW_RATE_SLOW>;
>      ++		};
>      ++
>      ++		conf-rx {
>      ++			low-power-disable;
>      ++			pins = "MIO70", "MIO71", "MIO72", "MIO73", "MIO74",
>      ++			       "MIO75";
>      ++		};
>      ++
>      ++		conf-tx {
>      ++			bias-disable;
>      ++			low-power-enable;
>      ++			pins = "MIO64", "MIO65", "MIO66", "MIO67", "MIO68",
>      ++			       "MIO69";
>      ++		};
>      ++
>      ++		mux {
>      ++			function = "ethernet3";
>      ++			groups = "ethernet3_0_grp";
>      ++		};
>      ++
>      ++		mux-mdio {
>      ++			function = "mdio3";
>      ++			groups = "mdio3_0_grp";
>      ++		};
>      ++	};
>      ++
>       +	pinctrl_i2c0_default: i2c0-default {
>       +		conf {
>       +			bias-pull-up;
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +		};
>       +	};
>       +
>      -+	pinctrl_usb0_default: usb0-default {
>      -+		mux {
>      -+			function = "usb0";
>      -+			groups = "usb0_0_grp";
>      -+		};
>      -+	};
>      -+
>       +	pinctrl_sdhci0_default: sdhci0-default {
>      -+		mux {
>      -+			groups = "sdio0_0_grp";
>      -+			function = "sdio0";
>      -+		};
>      -+
>       +		conf {
>      ++			bias-disable;
>       +			groups = "sdio0_0_grp";
>       +			slew-rate = <SLEW_RATE_SLOW>;
>      -+			bias-disable;
>       +		};
>      -+	};
>       +
>      -+	/*
>      -+	 * Omit 'power-source' and 'bias-high-impedance' to avoid spurious
>      -+	 * warnings on the board's pre-2023.1 PM firmware. Bank voltage
>      -+	 * and pin directions are already configured by hardware.
>      -+	 */
>      -+	pinctrl_gem3_default: gem3-default {
>       +		mux {
>      -+			function = "ethernet3";
>      -+			groups = "ethernet3_0_grp";
>      -+		};
>      -+
>      -+		conf {
>      -+			groups = "ethernet3_0_grp";
>      -+			slew-rate = <SLEW_RATE_SLOW>;
>      -+		};
>      -+
>      -+		conf-rx {
>      -+			pins = "MIO70", "MIO71", "MIO72", "MIO73", "MIO74",
>      -+			       "MIO75";
>      -+			low-power-disable;
>      -+		};
>      -+
>      -+		conf-tx {
>      -+			pins = "MIO64", "MIO65", "MIO66", "MIO67", "MIO68",
>      -+			       "MIO69";
>      -+			bias-disable;
>      -+			low-power-enable;
>      -+		};
>      -+
>      -+		mux-mdio {
>      -+			function = "mdio3";
>      -+			groups = "mdio3_0_grp";
>      ++			function = "sdio0";
>      ++			groups = "sdio0_0_grp";
>       +		};
>      ++	};
>       +
>      -+		conf-mdio {
>      -+			groups = "mdio3_0_grp";
>      -+			slew-rate = <SLEW_RATE_SLOW>;
>      -+			bias-disable;
>      ++	pinctrl_usb0_default: usb0-default {
>      ++		mux {
>      ++			function = "usb0";
>      ++			groups = "usb0_0_grp";
>       +		};
>       +	};
>       +};
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +&psgtr {
>       +	clocks = <&gtr_refclk0>, <&gtr_refclk1>, <&gtr_refclk2>;
>       +	clock-names = "ref0", "ref1", "ref2";
>      ++
>       +	status = "okay";
>       +};
>       +
>       +&qspi {
>       +	clocks = <&zynqmp_clk QSPI_REF>, <&lpd_lsbus>;
>       +	num-cs = <1>;
>      ++
>       +	status = "okay";
>       +
>       +	flash: flash@0 {
>      -+		#address-cells = <1>;
>      -+		#size-cells = <1>;
>       +		compatible = "jedec,spi-nor";
>       +		reg = <0x0>;
>      ++		#address-cells = <1>;
>      ++		#size-cells = <1>;
>       +		spi-max-frequency = <50000000>;
>       +		spi-rx-bus-width = <4>;
>       +		spi-tx-bus-width = <1>;
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +};
>       +
>       +&sdhci0 {
>      ++	assigned-clock-rates = <187498125>;
>      ++	bus-width = <8>;
>      ++	cap-mmc-hw-reset;
>       +	clocks = <&zynqmp_clk SDIO0_REF>, <&lpd_lsbus>;
>      -+	pinctrl-names = "default";
>      -+	pinctrl-0 = <&pinctrl_sdhci0_default>;
>      -+	non-removable;
>       +	disable-wp;
>      ++	mmc-hs200-1_8v;
>       +	no-sd;
>       +	no-sdio;
>      -+	mmc-hs200-1_8v;
>      -+	cap-mmc-hw-reset;
>      -+	bus-width = <8>;
>      ++	non-removable;
>      ++	pinctrl-0 = <&pinctrl_sdhci0_default>;
>      ++	pinctrl-names = "default";
>       +	xlnx,mio-bank = <0>;
>      -+	assigned-clock-rates = <187498125>;
>      ++
>       +	status = "okay";
>       +};
>       +
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +	clocks = <&zynqmp_clk SDIO1_REF>, <&lpd_lsbus>;
>       +	disable-wp;
>       +	no-1-8-v;
>      ++
>       +	status = "okay";
>       +};
>       +
>       +&uart0 {
>       +	clocks = <&zynqmp_clk UART0_REF>, <&lpd_lsbus>;
>      ++
>       +	status = "okay";
>       +};
>       +
>       +&uart1 {
>       +	clocks = <&zynqmp_clk UART1_REF>, <&lpd_lsbus>;
>      ++
>       +	status = "okay";
>       +};
>       +
>       +&usb0 {
>      -+	phy-names = "usb3-phy";
>       +	phys = <&psgtr 1 PHY_TYPE_USB3 0 1>;
>      -+	pinctrl-names = "default";
>      ++	phy-names = "usb3-phy";
>       +	pinctrl-0 = <&pinctrl_usb0_default>;
>      ++	pinctrl-names = "default";
>       +	reset-gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
>       +
>       +	status = "okay";
>      @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
>       +		 <&zynqmp_clk DP_AUDIO_REF>,
>       +		 <&zynqmp_clk DP_VIDEO_REF>;
>       +	clock-names = "dp_apb_clk", "dp_aud_clk", "dp_vtc_pixel_clk_in";
>      -+	phy-names = "dp-phy0", "dp-phy1";
>       +	phys = <&psgtr 3 PHY_TYPE_DP 0 2>,
>       +	       <&psgtr 2 PHY_TYPE_DP 1 2>;
>      ++	phy-names = "dp-phy0", "dp-phy1";
>      ++
>       +	status = "okay";
>       +};

Applied.
M
