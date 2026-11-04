Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793771625;
	b=rELT+u63v9Hz53S3s0knUrYo7/TWlNKzO/0f5IAsMqqUu5nydjJqGCkUVfCuIf0bLlVO
	 T+2tGXQ29Jq4g0C49fLKdz5WhNOmapt3DjjSUDe4cXgNbzJwTXobmQQwU0Rz9H4CebuxL
	 aTaq7/ldwMlXSlzTueEW4+Tuyn5AcL4736i9r243DMlmysMUdOYSsrrJDlqzH1xvSJMu/
	 5VPCWwxaEul/w8E7e+aZalXpaS547kR5cOzD0FcVhrQvRjaTEiSCZF775PLQpGSNeF0Wp
	 ZuT6x9bPp8zJP9attM882NTNVKWA8t14mX0BlMZX8SA3AYXHjwMUpldKf5/XaxzjQ5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771625;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=BgMbRmHvl2/P80S1zJh93L7i95YaYJcGvwaHIQoOCyo=;
	b=mcf+vTbe9b+R6kNXHX7hhUBi02AOZFEJvm9bPZQK4rymbC4lxgYj/XrSyo1/Pgx/3zBp
	 PTaS7F7pFu2R4H9nf71l95YwOGb1pvWuwameIoAxY/AezusaNsnVMuZGYR4crvu1r5mT7
	 xux2gMqKi/2HTL+ntvzzkNH8lUd9YUus6w3R3y/iNMAMpP59u5AmNVRGWmebhOxEzirWA
	 BwsY4QPTDgOh/KCyo1I4EOMnGbjITPymAs7MCWUjHo8aLTO7uhfJ2wwUth8C6zldNvZtZ
	 aUEN0KT7wts32/TZ+GWW76vgSWcH4BAvJJVxhvKveQVRnbc06gKVhoSerQ7X0YaLEeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LZJJmZXz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.56
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010056.outbound.protection.outlook.com [40.93.198.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99910606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99910606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LZJJmZXz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFra5ECAYsGtOK50eTQIwcjNa/R0Zwetwl+H+wtQaqyEL3TcHp7FDcDxkKeijyReSlO3NXagENKnTA9HAro6dp6XPTwZ/NrNzOGWwJfrvGtnylpQqtpxDSVEPcY+Pt8VpMX/1fSJGNB5k5Tp3hAqDL9qNohlUahctpYDyQ2K77kYzZMM4cHY8a/FCJnf2FjlSIyoT++kS86s4qvgA1Mm8CfTkF6l3CJEbZ8YdjinvsWMm4IFK0IR7FBbdjVFUJV1uon7RYh2H8Jyo7lgj6TY1ZpACMZgoFvYGaBvqrjlBwBwy66TLSRBVRj60Ln8jkz9F0db5SjcrMJx5VDxPAnLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgMbRmHvl2/P80S1zJh93L7i95YaYJcGvwaHIQoOCyo=;
 b=mFRblCC0+dT2jyZg438r7wIpmWMFp8nYenJ8KQwKw3TFsY815BHRXsPXTZ6EdOg9P5sTbDaE/iwZE1QVq/GqOIBB+NU7ahOq/SJ7DNjnsLj7fPT8E0wpaOqizBszclSOUllSk4w7Khu9hNiTQ60uTkXwOriCaLHkenYgwZkwTxTUzaHYqLj9FrlFqoLcZjNBtYH8mDR6yzxgceFF+bFMT2Y5a6AoGz0aIcdUgkOnnmnuxB0ZAx2kZVUyI6T0oZ5O/UF5TrvwVmNEUO/BZV2c8MsgfzNEoTsMK9hxtyT91o6OmFJXzn4GYrw1GlCZhm/Hz3AciLoOEGiyy/S+VAlNZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgMbRmHvl2/P80S1zJh93L7i95YaYJcGvwaHIQoOCyo=;
 b=LZJJmZXz5rpAtDSYypZgcz8jq8bGIoYUEhUAcZzxXeWUvMHU21TIHdMLMih4CxX2WAFhNLgXliAIJGvI0D3H8RPjsw2LP3m5AiDf4aQ/wsBPYGPlQcprv+szv4GTN3+AfBZ7BMlt6m4rZ4gjgfBwpiaCNnhcUpEsVyy/yGoHp+0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0SPRMB0124.namprd12.prod.outlook.com (2603:10b6:8:1fa::20) by
 CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Wed, 4 Nov 2026 05:53:41 +0000
Received: from DS0SPRMB0124.namprd12.prod.outlook.com
 ([fe80::24e7:97e0:923e:68d6]) by DS0SPRMB0124.namprd12.prod.outlook.com
 ([fe80::24e7:97e0:923e:68d6%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 05:53:40 +0000
Message-ID: <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>
Date: Wed, 4 Nov 2026 11:23:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 jassisinghbrar@gmail.com, michal.simek@amd.com, tanmay.shah@amd.com,
 saeed.nowshadi@amd.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ssengar@linux.microsoft.com,
 tgopinath@linux.microsoft.com, srivatsa@csail.mit.edu
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261103062051.676519-1-ptsm@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::7) To DS0SPRMB0124.namprd12.prod.outlook.com
 (2603:10b6:8:1fa::20)
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
X-MS-TrafficTypeDiagnostic: DS0SPRMB0124:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: 1907e46d-49e0-4e5f-b5fe-08df3a37fa3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|921020|56012099006|11063799006|261102123227099003|261009223027099003|261026121527099003|261028144727099003|261022075727099003|261021123027099003|261022105027099003|261021135927099003|261021121427099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vKrZe5wBqyBy9qtqDXhuINdeMFf+DKQn3aLx03/FimirNxroGZvln7Fdb/ssmRrks8+CCiN48+wuEykrO4Ltu3F7z0+mKdK1lAa91ylKpWoLnKgarcuadjHpzN9mDjDa5E5xLG9zjxJDyaELW2hgSPP4Rl5AqHereAomV77TryhJ5Ejx2y156j6oiQ0rsIiYJcsZRj3a+BlZAsHxKv7YrjQm0nlL5BmDmBqtj8ysgJJqfBsmVTSJh87WnT9UEXIVetHGh6o2Sq3o0X20f9d3M2yIOTu7OyNPv8h9T3VSWFKjnQ/uhPdet7TkoQXkgKRerZMj/XU0pKwUOvsJw34EzR6eA5CEM43u11Lb8HvfA4FMrB3ar9Z1+n4Na2WP+/6QxNYDScqpaScMlIFeQ53H5JuhE43ZsNBSAPEBRvy1ZYB3Zdu8o482uHq6Xl1USSNywBbY2Hn+SMbL0b/684y2oBNLKm4YOKTfBOuHIrFvrP0Ll1exNNC3cyffjPHcTGJjM0yJO1xjCQ+AfnDvmAaaIX50iUG1f5huZYHwCOD8D2mXAHizPB7yh872LRwwhHbkI6t50oCcDD7M0fSMc870CnCrJtLK1O0NFHhrSZ4enT1nEyGFmBiYNgGTdisi+NqxKQYakN2lXXxGzzUGgb3Bv6bGmHf33glsMUsECQEoh5s3UdT7JKAGb03WO5Va3sYbrObkbuF2Ig08CcQJgJwR5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0SPRMB0124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(261102123227099003)(261009223027099003)(261026121527099003)(261028144727099003)(261022075727099003)(261021123027099003)(261022105027099003)(261021135927099003)(261021121427099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3NwUzN4dmV1OUVNekYxSVJkKzJsZHI5R0gxbHAybTBuZHQ0ek1EY2pwMlFN?=
 =?utf-8?B?NVYyM0h5NVJqZkdyLzg1VXV2My81MzNxOUI0WXEvSXpYaTQycnovWWE5MFAz?=
 =?utf-8?B?WG1nZjc0RUgwa21Pc1dhcy9yUFpvT3V5NnZKU3BpaVFneEk2Wm9wdnBlZnRw?=
 =?utf-8?B?VUJHMk5wOEhYN3JtYTdBRmViSVNMS0hKK2lqQ21rRVR1YVNVOW5IU2hYWjVB?=
 =?utf-8?B?OE54Q1hGRnFyZlIwVHVIK1lraSs5ZG5PaFRSUytVSDNldkRaK0R1YklqSFlH?=
 =?utf-8?B?M0hIcHc5eWFOcmFSOFBMR1pIQUxnTGdXdWhZNE1CNkZhMlRmVVNNY0Y5blc1?=
 =?utf-8?B?ZS9heW9POWN3Tkl1WWh0b0hyaCttQ1NnWjZrdkFuSk5LNWZubEJlWVJ2aHFh?=
 =?utf-8?B?ekxURkRydEpaUE1aa3BGbUVxMGdiUk5VQWlTL1dxRU14T1phR3JYS0cwdFov?=
 =?utf-8?B?d1hjZm9DNjZCZlJFb1RlVVY3c28zRHFOUC9ldGxHeWhhbEI4Y3RvdUJEcEtI?=
 =?utf-8?B?N2FHSVY1OVJUWHRQK01CQTZSV1Z2dlZXQlhSdVRxc2VuTkh1UGhyL3RxTHF1?=
 =?utf-8?B?NGtKeG1IWHcrRlFmaW9HNEp3bHlJQlhsUlA1V1I1Q3VOSTNMa2g2T1lJdk9t?=
 =?utf-8?B?WnRzZ0JuNUNSQm45RlNqTjJmWGZ2Sy8xbFhNWTdBVFBnQUFWclVtOGJhK2pB?=
 =?utf-8?B?N3RSSWlSbnhGNFpMK0xKeEdnN2tsMXBSMVlYOENLNkxPQ3dvSWxQNkY2NDZC?=
 =?utf-8?B?NnF2OGNLM2RBempFbEZNclB4NElrYnowREJrYWhyN0g1eVBNeW56YlhPRHRW?=
 =?utf-8?B?RFcyZFFuTGY3QUZkcGZFai9FK1VwSndkUDRlQWJXKzBqTDExTy9OYkdyVTdF?=
 =?utf-8?B?ZjVjR3VqKytyU3pod21CQ0RlWGg0a1lUYzhrU2JscE1tc0pFb1Q4NXhyQjVF?=
 =?utf-8?B?YWhIKzNzSEd2YjNMVitodmlVSVpLY0JmTVdma0VlaVY4eXB5VGY5ZW5ZZ0Ew?=
 =?utf-8?B?R3U1bjV6RFNnYS9KcEYwcExvd280RmczUllTN0ZoM0ZJaGRpTDlkNmo1emlW?=
 =?utf-8?B?eCtwMW9kUzRUTWVMYXh1WUI1SFNVemIvelY1UXJSblJJcDl5eFVzNmRVWnJD?=
 =?utf-8?B?RGd5b1liSmpzMVprZjRzczRrOEFaaEhaN1E1S1NIOWlMMEFWMDhtTUs1ZWFh?=
 =?utf-8?B?SkIrVXVERFpTZW5JSTdLckdYK2I0cUw3ZnloV25zZFVqOXVvTDR0cTlxMXdp?=
 =?utf-8?B?aHRpVVdwK1VYR0ZJc0lJV2NJd1hveXViZTljRjRKR01rQm9SZkYxVjdYcVB6?=
 =?utf-8?B?Y3lBNXl5UHBaN29RMWtTK0tSYXZqaVh3OUk4K2FGS0prS0xmYmRqSDZXSmI5?=
 =?utf-8?B?NGJ0d2lWbDBsdmsveUNOQlNzZEdmRkFGRE1jTmhuSTJSYkpFM0RQdkt2OENN?=
 =?utf-8?B?Tzl0MTByZTY1S1NZUXVwTjRxMWdJa3huc29UbU5PcVZrR2piQ00wMWljSVdy?=
 =?utf-8?B?Y3lmeVpNYTU5eHFGUGJrckNmem5Lb1lNdDdSNGhUUFRhWlZWRHRkSXdheFc1?=
 =?utf-8?B?b1Z4UDlDOXBJK1hFRk04UmI0VE0vUHRpd0dENHdhSGU4cEdMeUtXOVRDVFhH?=
 =?utf-8?B?YkFOVWdxNWZMU2Jpeng0R3hhVUpGanhwUGRUZ2tVOCs5c2dFZEFPanEzQWNv?=
 =?utf-8?B?aEFidk1UN1RmUUlBaUhzS1NHMnhUTTROY2c3UjJvNEdNRTJLVXllYzJYMzBs?=
 =?utf-8?B?cnJ0NW5BRGhiNVIvVURtZkpia0pPL2RWRUhqVHQycjFSWUhnR2ZYc2taS1hU?=
 =?utf-8?B?YzhBSzd3ZTJGREMrbDd2aUhZc0NsWVIwOHQyR0ZlaVc5S2dPOE9YNEJldTBn?=
 =?utf-8?B?UU03WUFGTXRUbXRtUW01NlVaU3c2MUxUd1BZKzRWeUw5RzlFSklydnM1TjNh?=
 =?utf-8?B?cmlzdUpkK0Nwajc2WERWWFhkMmJOekNXZUlKTjYvdGVqU2hIVVlmVktZK0E5?=
 =?utf-8?B?M1V6YStMNlBnMzdKTWNyS3pHRGREcTFCejRSRnp0ZTNmR2cxNVZRL2QwcFhT?=
 =?utf-8?B?anQ2dVRPVTQrRFRRN25xaDR2Qi9qREt6azd5SkM1YkppaHEraHRsaWRBN0U4?=
 =?utf-8?B?L29wWU5hZmF2aTRNeDF1ZDB6OExZS0NPLzEyRHJ1U1RaRTN2bzFsQlF5Mjcy?=
 =?utf-8?B?Rjk5NFJXZEFmUXhpQVN0OGFGQ0RVMkFlKzI2UkNRczRURm51aWhKc1lCaGFC?=
 =?utf-8?B?TnJ4L2YxZXV4emJLemQvZGFhQXpFQnRKais2KzhYaVhuK3FuZGpEa0Q0dUJG?=
 =?utf-8?Q?XdlmA6XJ875pDMt4x+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1907e46d-49e0-4e5f-b5fe-08df3a37fa3a
X-MS-Exchange-CrossTenant-AuthSource: DS0SPRMB0124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 05:53:40.7348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NA/KDy7GaHyyskE827NhClqOGDrkawSo7MQmwU9h76ERfVzDhn8cm3pl1Kbg8qs9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226

On 11/3/2026 11:50 AM, Prasanna Kumar T S M wrote:
> On driver removal, the CPUHP_AP_ONLINE_DYN CPU hotplug state is removed
> instead of the its actual state. This can leave the mailbox driver
> callbacks dangling. Use the actual CPU hotplug state during driver
> removal.
> 
> Hotplug registration failures are also ignored, allowing probe to
> succeed without the callbacks needed to enable interrupts on CPUs
> brought online later.
> 
> Fixes: 6ffb1635341be ("mailbox: zynqmp: handle SGI for shared IPI")

Nit - only first 12 characters of the SHA-1 ID are sufficient.

Also describe the failure signature and how the error is reproduced.


> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>   drivers/mailbox/zynqmp-ipi-mailbox.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
> index 42d2583e44ca..b0643ee75db0 100644
> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
> @@ -136,6 +136,7 @@ struct zynqmp_ipi_pdata {
>   	unsigned int method;
>   	u32 local_id;
>   	int virq_sgi;
> +	enum cpuhp_state hp_state;

Warning: drivers/mailbox/zynqmp-ipi-mailbox.c:141 struct member 
'hp_state' not described in 'zynqmp_ipi_pdata'

>   	int num_mboxes;
>   	struct zynqmp_ipi_mbox ipi_mboxes[] __counted_by(num_mboxes);
>   };
> @@ -863,15 +864,22 @@ static int xlnx_mbox_init_sgi(struct platform_device *pdev,
>   	irq_set_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
>   
>   	/* Setup function for the CPU hot-plug cases */
> -	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mailbox/sgi:starting",
> -			  xlnx_mbox_cpuhp_start, xlnx_mbox_cpuhp_down);
> +	pdata->hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +			  "mailbox/sgi:starting", xlnx_mbox_cpuhp_start,

what is :starting here ?


> +			  xlnx_mbox_cpuhp_down);
> +	if (pdata->hp_state < 0) {
> +		irq_clear_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
> +		free_percpu_irq(pdata->virq_sgi, &per_cpu_pdata);
> +		irq_dispose_mapping(pdata->virq_sgi);
> +		return pdata->hp_state;

  1. The new error path double-frees and then hits BUG().
Please reconfirm.

zynqmp_ipi_probe() sets pdata->irq_type before calling 
xlnx_mbox_init_sgi(), and its only error label runs
   zynqmp_ipi_free_mboxes() → xlnx_mbox_cleanup_sgi() whenever irq_type 
== IPI_IRQ_TYPE_SGI. So the new unwind runs, then the caller's unwind 
repeats
   irq_clear_status_flags(), free_percpu_irq() and 
irq_dispose_mapping(). Before any of that, cleanup calls 
cpuhp_remove_state(pdata->hp_state) with the negative errno still in the 
field, and _cpuhp_remove_state_cpuslocked() opens with 
BUG_ON(cpuhp_cb_check(state)), which rejects anything <= CPUHP_OFFLINE. 
A failed hotplug registration now panics instead of failing probe.


> +	}
>   
>   	return ret;
>   }
>   
>   static void xlnx_mbox_cleanup_sgi(struct zynqmp_ipi_pdata *pdata)
>   {
> -	cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
> +	cpuhp_remove_state(pdata->hp_state);
>   
>   	on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);
>   

