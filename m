Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022107.outbound.protection.outlook.com [52.101.126.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DF74078D8;
	Tue,  1 Sep 2026 02:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788229019; cv=fail; b=qTWLFu6iOYBHK4dfEbNV2wI4NV6YJ1lGNBa9gJB7uKoSnW4lZfcdRC53D+S0m2CtOIKaPUbWwYriKfESa3wxlXM84OLePCBubyEL6HKX/FtY74qQbl0/xK0FNmEuWk0EC/TdoxElBzrsv6IHcIzfPTdzSpth3xbp7nddgWeiGk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788229019; c=relaxed/simple;
	bh=1qZl2SFVx49LSl2roWXvGGHvx17+8DnXRkZqT75H25U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ne8DIPnkIhLWEhdMfsX6eQkoTfOlfkzv3BuZi8WTxJSMBqBJ7/OwWwjrWVlgVuXzFyP64hZiPHJqjJrIxEmWT/Fjv6quCGd9eLY4aS+MY5WPHphYWeaUBTmmChnfE8OtMraJaeZARp2uEKgUyFqikA1fx/UKGRtyyiBR9qrUve0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=HOZdKUbv; arc=fail smtp.client-ip=52.101.126.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="HOZdKUbv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQZSJ21hUQGY+Y0a/jS/oAWmnJRwHJjCLcalfVdjnak52l6JkHFw+leXLdAwrSjUVGj6RLIwM13EiuDPkuul/lvuqFvMIrM5ERvQc8uMy5RMma4BuScSmaIP542QSMPO+3HhQnPAO1XfzrpD727q1bTNSNflEW63VC/6+/zsg6aNeRjPRjzqqMzB8ttlGSI8w5tz9sibejeZEVeqbPUWm1lkJ4jb61xhRR9TVHnGwPeiHZQsc5HCwN86tBtwsXRDC8ZMgE6b/SEbCUSh7MEjk1D9WiYtybTW+WEe94hG5hvcZwxJANBLE8w7tSs2mBqOn2nDLfY8/h9NYcBivGnKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u+BsWxIufNk6mowVwboaYqH3iaIAYQvqT1E1/BbuVg=;
 b=Y7uZh3mU+TJYrvlRD+P6Tf8hsjRF/LghD+/zH+BHpVm+mNgZ7OG5QzWZu9PcmM9h34YBvjueHETgW3WV8HkUpkbkuhTtHg0Kud8+JObAFHcbNrN8VOwNJvN1y/G0riXGXUljjYGkdmFxf4E4xHCSjrr3q9sp0x966qRn5xLgGbSDJZd3rCwLDuZCiPxd/TBJwq/Jivd277BCoC3aKxyRVoonaz4Ma7XCsDk1a+3FCkTOo97OEOcb49IP3H/8yrZfpUxdtzULAtthK3Xot1r12kZ8NihfgyQlJpJuDb2obLc1iIWK9GDeHQFKWo6/6N2dtFWiprg26RP292ZcfKpAXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7u+BsWxIufNk6mowVwboaYqH3iaIAYQvqT1E1/BbuVg=;
 b=HOZdKUbv7i6BjELdkDuu0xrDmmg+ngHwxbPxQBqN66iLAcM1/sGhMFPyYYSMAys9um767NHfIaqeo/R1m5CG6AXFX+NpnrHWFH3WWSANPZIRxgL1o8zIEfx3MqiFVF8B8mtJCKQq+SdD73gopZfCt+soU67Qh0a+Iv0SdL8iQWAXT4/iv27hDskW8dPvMzCOh8R9T/lrjCfbaHctIn24LB/UHkoxjZEz7bEBH+8UB5csZiFEqtaevZQehcr82L8qNaxRkTge9wFg6WyUZUrB/RVv9xGZpifdfwPE61sN50OcpWkvgEWuy4EJp5StpBUqIOjhhMsrzlHf0XHc61Yagw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by KUYPR03MB10608.apcprd03.prod.outlook.com (2603:1096:d10:77::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 02:16:52 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 02:16:51 +0000
Message-ID: <559dde2d-2e41-463e-873d-79ed62b71e0d@amlogic.com>
Date: Tue, 1 Sep 2026 10:16:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
 <20260831-b4-s4-vdec-upstream-v8-3-830195b9bd91@amlogic.com>
 <20260831-matrimony-ability-e5fcf150d213@spud>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <20260831-matrimony-ability-e5fcf150d213@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|KUYPR03MB10608:EE_
X-MS-Office365-Filtering-Correlation-Id: 8449b1ef-70d8-4a1c-79a1-08df07cf15ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3a92iujMlCJcptlfm8SXQdNGP7lUigrv+CWbhgNw7S+PDHYXH/BejjxYiohsgCCBVkz8sy6kQBifVn5/0hI9PyIHJI87iwUzYL+O+fa0EVwho6VAjHZhfr+o6v+dWMQLkd6SoPDpF91GVWwpPev/L4kwK4yEEkdR1P93bQGnaQuEb5ePjGCWey03Mk+7wDCsK6Zoq5jCbgWAXeYyMAE0m9fLy2hV1Gv2gHRxB9Jw32on1OXOR+dmYJNDmZsRqVx2VS7ozD8+a1/QzWikyIIVC0PF6wvK+FOANf21K30kmE5NtBBV2pwvzTZvnDrN5uEZgDxVcHbDcfs/NQOByMSybDc24VnXYHYaLFLXKogZs4i5CGA8ZrboSN3IJTONQtbP3vRxsmWEPH8fhgiEvVB9EdG6vFN3ormAS9oovy4ml23P4dK90+AElyllYxUVX3YSvBp2E800a08JHmJRG+mQJjO4mKd9j865t5nNdvOtYMRO+gPDnvzlGViqdkbFeFB1EdlAC2c/InE6v8GSvwcCL7S6ahlkgUhuRhnYP6z0XltMuG5KvMBq7xv3XnMqfDaQGG0zgQC4ohhIDEg1hwN58FU1Y8HGGQWsLR3CqsrU8rbeiv+Kxsyz5hRREgoirCwQAOCHflgZsz61CrUQ1hHOsWvPbQqsBz38YH9fNuwI6ZI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkJsS0dlMTdNemk3ZVVWMXduTEt5a0Z2Yi9paUM5ckVycUZDNkpDSEZ3VUFj?=
 =?utf-8?B?Qk44ZDg4OEVsTkNqS3ExY09RSE1hVDA5MS9NdjlvSGtVeGR1UmtwbkFwYXVX?=
 =?utf-8?B?THQyQ1VnVVYxTnBzTTVCWm1vNjd3UjMyTGlHa05XMFhTbTQzMUlENy85OEFN?=
 =?utf-8?B?TTZ1WXdDZkR6NjI2dzRIbWh6MWYyMlptWmp1TXprNHprbVdCazIzQVJLS0dD?=
 =?utf-8?B?dzFBZFlHbW9vL2pjcEp3TlBBRlJOV24wWDJLVzBBQ0VmeHFrdXJnYWd3K09D?=
 =?utf-8?B?YWZTNWtqTzRNMlNSUVJISkx1ZVpsSVhZLytDUVBuZXY5WHRydEpmelhXY0hX?=
 =?utf-8?B?REhVUk42dWptZFJXL0xNK1lmTkV0TFRJMmNWSjdFbU5xV0w5SmJ5bWt4TGp0?=
 =?utf-8?B?VDl3YXN4WXEycGZhRC9OMUFiZGpOcEZyUlhqQlV2RFZSUWhveDlFT05kM05Y?=
 =?utf-8?B?bXV4dDB0WVEwZG9rL1NpU2lHdmdyT1BQKytMMEdlR3k5VS8zN3hIYWEyRTM0?=
 =?utf-8?B?MWtpc2J3Qmgwa2I2TWtiRG94M0p3V3psQkFpdVZlMnBNNzFyVFdzSTlqUExG?=
 =?utf-8?B?ZU1sK3I4dXNKME1QWHdlN1NSRWFZNWZIUU02cWI4SDBUcnMxRXlpUTFIVnZ5?=
 =?utf-8?B?ZnlSbmRjRUJMeEFTdzBtQUFicUhvVXFGTGhDR1U3UDFjV2s0aUpsRngxS1k2?=
 =?utf-8?B?c3lBanIvaTdXcjRMVURJTnk3SytQbCtSNVZYOWdET3MwYUZaUGFUWjVNczhw?=
 =?utf-8?B?bnFYNjFvSlg4UVVHeDcyYU1mcERUU245UUFyVG8vbGp2aDNJamQ5dU0zZUhT?=
 =?utf-8?B?MHc4bEpaODVlS2VtNmpvNUVhRlFmdGMxSjdJWERNTVp3OWRLdVVQR2dLNml1?=
 =?utf-8?B?a3JQelpTV0czbzJ3eFlDbzhwV2pTdlhqclNsYzNZbkxaMnVlYUlMNHhQRzhU?=
 =?utf-8?B?TDlJTkwyeHhuOEtNUEVvclR0S21OeTY0TG45NW5Ra29Fcnd2MXRFNWNrYnVB?=
 =?utf-8?B?MitlQVR3NTVIbEREQmlXVFVNOTZIVXBJOHpId1dIcW1NdXd6ZjRkMGN1WUZ4?=
 =?utf-8?B?NWg1YWRXNWYxUEd2K1hWTWtpRUNkWkFwcDBrbkNKMkdjaUhGTjBIbmVtdi9S?=
 =?utf-8?B?YnRSdmc0bDdZSTYySE9JTkgzQXVaZ05qMXpSQysrU1MwcWViTWdUMzhHZVE4?=
 =?utf-8?B?amkyNUw0U2JSS3pjeUl5aS9GcFdkV0oyVXdDc2FOYlY5K2huRnd5Z0ZlTkNY?=
 =?utf-8?B?RG95Q0FqaWZabFVoWnhDVlp1OUxObVBEcGtqLzVCWEoyV2dGa3lZbHM2YUVI?=
 =?utf-8?B?UHk3emFLNTMwVFdUUzYxRmFKeldSVWI0N09EMFBpaWFlMG5RYVVnUTl3M3d6?=
 =?utf-8?B?d3dGMkkrMGVjR2dFZXcrWFJzZUp1Qm5uZHB4SzdNaEhoRE5qUiszT1JENlBq?=
 =?utf-8?B?eGI0dkkvcXU5VFZJaml2T0RHTVFoYlNnUUNZNStHb3o3RzBEcFJVaVYrTEhN?=
 =?utf-8?B?U21Zd1ZJTGlZanIxeG43SFdBV3d0U0hoWWNiRWpOS1NtUHpCUDdqdlhoWHZZ?=
 =?utf-8?B?Y0VkYWdOUEFlSVg4aVNzYlBzNnlNM0ZwaGNQRUU1SldlbndUdDNKdzJMWC9X?=
 =?utf-8?B?NTVPcDlNT0xWczJiRmpJV2ovZEF2emlSZHY5R3ZQbHh3MEtUQmtsSkJOaHpn?=
 =?utf-8?B?YURkOEthc0Q2S1NId0J6ZTV4THNBNElmdGpKMHI3em1xTmI2TmxJNmlvRXdo?=
 =?utf-8?B?OG01dWNXTGFGd3pVU1lNK2EyMi9SeUxYMmwvY2xybmV5UC8xdlZjeXNIMkZs?=
 =?utf-8?B?VCtQR3dYUi9SNWF2V0FDTllsNlVjaEFTM2wzbk90UDJDalV5cFo2azVibzRs?=
 =?utf-8?B?cFJtSERUWVFKRE9xSVoyYnIxQkc5NS9VdUpDY1IrYkJJc2NnRjhiREFPYkIv?=
 =?utf-8?B?bDRSMmpvSzVFMlRqd2FHd1h3YzRVM0Y5WnVPRjNqTTZ4dFJkaHdiQytnOVF3?=
 =?utf-8?B?S2FUaSs3SE95Z0ExVXdJeWsyZDNHdWxwWHhiek56RFRWOFFSanpLaFNNb2VP?=
 =?utf-8?B?T0ZMcHRTK3owYkE5ZXppNEtacjYyQUF6aUpHaUtRVGtxczRFU0czNkF3bTdW?=
 =?utf-8?B?THB1NjJRWWF6R2VpcTZhQitoam8rNGtqTko4ZWxRMUwrN1BYcmJ4MDBhY25w?=
 =?utf-8?B?Vjk3djlFZEJCZUwrRmd4N1hFMWx0NG5DRFRVTU5VdXpZWXBHelNta1JPakcr?=
 =?utf-8?B?c1l1Yk44UWJrV0tPVnY5NFEvNTFvNWxTRzRXdldFdWNjQVlQVHovMk9LR2ZU?=
 =?utf-8?B?VlFWVGt6SUNkTkxsZjJkSU5ZeUdvaWs4RW1OR3UwWlQ2SUJWdFVOQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8449b1ef-70d8-4a1c-79a1-08df07cf15ac
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 02:16:51.7636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddgknXkAGya0kBCbTLxYw/VOU4dUT91fPNmvyOD33f2xRlS/err6ACaewkEAqeYsdWIfEAq2C0bjG7hids7Z2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR03MB10608

Hi Conor,

> What are these interrupts? All other properties convey the info via
> mandatory -names, but interrupts don't.
>
> I don't love the lack of items lists on !-names properties, but not a
> big deal to not have them I don't think.
>
> On account of the interrupts:
> pw-bot: changes-requested

We didn't add the interrupt names to the dt-binding since we specify 
them in the driver.

But per your and sashiko-bot's review feedback, the interrupt names 
should indeed be listed here as guidance for device tree authors, even 
if they don't necessarily need to appear in the actual DTS.

BRs

Zhentao

