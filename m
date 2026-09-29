Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023130.outbound.protection.outlook.com [40.107.44.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A8E3D0923;
	Tue, 29 Sep 2026 08:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670117; cv=fail; b=PQOuC7TLowADwJgRw1YCKCcOknODw/rRAE9qgswGxQRGZ2elKIAv8Z45PUT5WAnygTcF+WxDob7LrT4oRP8/b6KA8aupHOCV8s/iqAWz4wrRQ4jLt9lqvw61mTjrRRCe1/JmRwuEY622VJpKrIdJ3IixqgnZH2EFzDWlndxcQhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670117; c=relaxed/simple;
	bh=/64K/CgIDu3FPlQHhaUdFcKm3YqOANFF01R939TLkus=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hMOdEoXNvnuHWpDi8RCYpvOO3gcfiEZ8D2YB+H3yfkQbGytpwuPk43lhCg7CkJ8xH0zALgdgyWYAXA5sxrZyA3oAGAX9FhnA/QEWnYZQqCeqDsj9M8KJ+2AVEMS8K24S8Vz0jpwGs1zBUvHrT4sG1ByunmBokj0caqeB6UiOqGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=FmGjib8U; arc=fail smtp.client-ip=40.107.44.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="FmGjib8U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7zcth6OvUed5qONhhMly45/H7S95ZLvG/s0EsqyF2ATffSAbrztzyr2DdyajyTIHL7qdB36CbN8+QGmDY2dhvHegmIA4VwbCM6FiRIZ3R2q/c6ZdzrWdbqQgRODHRqtZMplmEZ5bc/ypWH2DBCmwsM3mHVeM4WhmT2qDmSZtKm07e8vT1JXCuzysWoIRqYBU3s3I9M5Fg+yAozfTCvdMCdZewc/fyE3VDfa2nt6efnDDkv0XvvmSARSwu1fxh1aMqmAo2vJedK2uuJTqq/h4hpuFwjvbdXL2RiZ/fuMtqCAXEg1gl5x0+GvXa2QKsFyR6haSwAopeSN6oXgQ2OnIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKjuiIGKgzM88ync5hWgR+p35TI2WP7Fijjnn2o1QFg=;
 b=cyMrc8vFLSu7EvDZghBWWW5CjE/Li1okEB3CNfEEF21yYlRHnAgexpswTl9CT7KOJWE5pj9TpECzL41mQFjMbgOjt+6Nfk/9a8e1sJLiaeajEC75V3/aByU441Nd2t/lINwBN2DZAs4+QCmEUhlKDAK0kXQ57hVyAEydz4E9z47WQ/4BPuJSsKzsDQKssUK3onFKHg4yClh2viyjvTCarcJqkmnAjznXNgznxHZcl+Enivn+4An+Kcqc1zsMJrYMed8Hpswcyf6j+vlzBr+7EpveNcMveVhcf6pr9+AWlDah4i0Lck9/GL8i3El4Yd7QpUrMdLlCwczxFRtYGVST9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKjuiIGKgzM88ync5hWgR+p35TI2WP7Fijjnn2o1QFg=;
 b=FmGjib8UqVIblaqTLehv4AiWv/bniUrFJvv/epx6CGXpQeUOh6s+2naavLgXXZO9mtSLReENUnElXki2YwOyOWKwc+CyTj8+9rDrrVm/WDyIpvF+JcVeTOtKRGw+rschDPYx8fFuLEIFzC8geCmtKK5SjQhm0r501yDHqjwUr7kyb4d21ivz0IaGoIHt5vpSgUXtJj3IHyF3AnhDWDKXBnkXXVTbsVWfJ921268o3KdbAdohSuLX1kSFWa+7bJ0xk/NqiAv1/Bp+kRYblIEPGSVXXTKeOxKITSeRyRK6EN55QyyzvJ0oaiiBiTykewzSS2L9DR7iYV4+AkCFGPePdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by OSNPR03MB10207.apcprd03.prod.outlook.com (2603:1096:604:49a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:21:48 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:21:48 +0000
Message-ID: <d89c3a48-a90b-4dba-aade-a71c57458f9d@amlogic.com>
Date: Tue, 29 Sep 2026 16:21:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
 <20260924-b4-s4-vdec-upstream-v10-3-1289303a58a4@amlogic.com>
 <20260928-efficient-secret-manatee-2fcca6@quoll>
 <7fe35ef7-e894-4137-975a-9a5f621a8156@amlogic.com>
 <33499600-5df7-48fb-a2ac-5a703df8dc2d@kernel.org>
 <59541a34-eba9-4699-ba19-69e7b5b1525a@amlogic.com>
 <3b1e23f0-76d5-489c-a5eb-0774a21b0f63@kernel.org>
 <ab0e83e6-c0a1-4c8d-847d-81628c49a436@amlogic.com>
 <d4f72cef-0973-4f98-9c9e-277894f72a6a@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <d4f72cef-0973-4f98-9c9e-277894f72a6a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0177.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::6) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|OSNPR03MB10207:EE_
X-MS-Office365-Filtering-Correlation-Id: 3535ce6f-1ebf-48fb-f863-08df1e02b4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|3023799007|10067099003|11063799006|56012099006|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eXSF6WIoyJ+EBvOpnGyKWS8yMRzX0pjmZ+Ev9Kep1Bll2Gt8fCZnnoZLw0MY6ndHFvos+iLAcq5L7bp21zjjX1rrHc9wzKojMVdGbaxckv6p7Wu9dAzeb6pzRO03M3wajgQ0dPtLShlJtIRdsnqfKb79PR6d3mPLCnxrugfQYbfjLSpoZFNBSX1A8j0ONT6EdZwA93NFusschATguDOZBCEUvnu8DqLJpReyviXl1xmBdZ+UXZYhotwud+Fy1e3guKs3eAjWjfknVyEBFThZJrREWTsn0GQsJhHPafKB7Q+PKxvj6vvzfKM4E4C/Ql2qWQq1Rh3h2CgbYbyfBIzRBw67WUI3xWf9SKjcr4ovciLFID4QX9fUQz12cMB4I0CRgHBwQpqv9VZVo/b7Hyg7EhP8AMhg3oDrDxQy1brRRabfFCwfK0QgMdM0Z9k18ElP+Wa0caRtCNO7kv1pCJxGlaUByD6fPaMIEz7tZ+z7in9uREBrhccX1YshPSc3z9QNafKrp9r9+SGZfK57AJlI8bn52mlF9SLj9jqC39yeCULlMtSbazJtTQ3n10wSNPU62pgWD+U+qMo2WOJYMl2nA0BkXbD2+UL/Q1Z936YgLqrz5HBIc1YqK90ycIP67RxJmtp1gXJ+CIodlUK+4+9e/4aG/WDb2oZsU43hDquL14A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(3023799007)(10067099003)(11063799006)(56012099006)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGxDMlJ3UndEdUxpQ2JhUFNmMmlPNFdvWWVVQTVpMXQvNk91Y2tIRVVCUFJw?=
 =?utf-8?B?Mys4R2ZsU2lyNkdic2t6akY0M0dnZndWT1VqeWlEZmI0UVBQV1Zyc3MvVy90?=
 =?utf-8?B?MTNmWlk4aFljd3lMNmgxVmhaQXRuWWZnalgyMlNJQmFLTFYrelVxajRBbFVh?=
 =?utf-8?B?RUxaRXJTR1lHcEhaYm4xeldkdysyVVMvMS91U2s5OUlhT2hua2d4cUV1bVlY?=
 =?utf-8?B?SUZQQUlRb1VlZHBWQVR2MDZkbVcwdjR4aHVlQ3M2WEdpbmhnWUtES3RScWpD?=
 =?utf-8?B?S3lMbk5GYVlpZmVwVEJpR05aWlplay8yNldjY1pJNERlY2JJdVNQQnAycFpv?=
 =?utf-8?B?UEZHOUkwTGlpMWFiZjVtY2s0aW1TUXU4TnlzRFNvRm1tMHJUVmFKcEFSY0JU?=
 =?utf-8?B?LzBneDI0djdaYWttSGtaMU9EaHdjaFlYYVhibk4vdTJWYWlNeGFVK2lBb045?=
 =?utf-8?B?UWozU1hkdUdtakh4L2FPSk9QVVY1K0hCdnRzVTZETlhmSldMbmlhL1hvdnRV?=
 =?utf-8?B?UWxURjR1azVBaVM5Q2czZ0RKQXRhb3FsQ1hVUTVVcktsUCtxUHFpb0hKYmhV?=
 =?utf-8?B?R1pSWXA0d0F5b0o3V3cydkRNRm5TL1FMZjBLVGlyM2k0NlNWTVZaRXF2QTFR?=
 =?utf-8?B?bVNrRCsySmJjT0ZrWE9VUlZlNG9Qek5JbjI1ZFE1RXN3L1RrZTErSDBVaTJM?=
 =?utf-8?B?ZGpiRW91VW8vbmxxU2dZVmdmV3VGWW1xTVZhMERoSjk4bHRQbW5YTnJpR09Z?=
 =?utf-8?B?Y2VueUQ2aUtnRktKZlNQNU40aWdJMWRBU1h5Zk9FZ3h5T1VQUmpLdzFOdVBv?=
 =?utf-8?B?SklNZjljd00rNVFlZmVNS3h0eHFxOXVGV3NTMXZXK0dNOGRjbkdUT082Rndj?=
 =?utf-8?B?RWJNa3dlV1BWbjVhZ2haV05zaW5HVkJNbEYxNWhnbndNbUkwWk40REprRjli?=
 =?utf-8?B?TEJFQXZTKyt3dlF5Zm9RbVZaK0JiWDk2MHcwaWFid0d6aTlhUDlzQWNid2NZ?=
 =?utf-8?B?RVllcHlBampGMUxBZ2p5WkFaWGx5Wktmd0Z4bEoweWIyajlPSTd6WEtWeTV1?=
 =?utf-8?B?d0h0OGV0c3NWWXdtcWl4Q0N5R3N0eW1WdkNYeFB5VWdLYlBLSmJBUG50bytW?=
 =?utf-8?B?MVZrZFJXSEVRMnZKSkUvbTBiZTZEejhBdUdOL0NUS3MyRHhhb3cvQndYTEVx?=
 =?utf-8?B?bWZFaFJLQmxmV25qRDBWYTNMeTlIT3E0NElsaEFNa0pKektDaHNCVzhuWUQw?=
 =?utf-8?B?OU9rYWEzZUxVajdveFRmMllhdWxucmIyRGwydVhCM3dpR0Z6L3JpQmUrTGF3?=
 =?utf-8?B?VGJzQW1odGcyUVFFb2ZCTTJmdVdjNllLSGorUm9LenFWTFNxV29QbTVDT2tl?=
 =?utf-8?B?emVPeWVrT2RHeEVpZm5uSFVVV1FHd1VwUUtsTFhPOXFESG9DVkR5MjJBcno2?=
 =?utf-8?B?Z1BJTGhBVWtPb3VkbHpPb2UyU2ZuVjBXQ2dMa0phemhHemp0ajdqS2JOYTVx?=
 =?utf-8?B?UE03aUZ0d3l4UkdRY3FxdWVQb2FkRURWYUpFU1ZmSTc3VU5wd3c0MSsvb0ZR?=
 =?utf-8?B?ZEIvTms0MmJ0b3c4NUdsbGQyU3BVOU8xNHBrVmw0NEsvMFQvd0YvUENvcmlW?=
 =?utf-8?B?WDNYZkYxRzBqUTJ2dkVSMzJDWExrcUpwcmZ3SDR3ZTNVdmwzN0xVNnRiNith?=
 =?utf-8?B?U1Q4VTFJeWt3dnhESWRueHY0c2dHb0lGYzZuVldiT0dtYnRkK1dNcXY3bTVa?=
 =?utf-8?B?ZUVpazNqakh0NkJMNHEwbVFTeCtadjR4SnNpYVpxdThlZysyeklLQzJZOSty?=
 =?utf-8?B?Sk9LdzhueU1mbGhOejBKUDgxOVlWWXI3L1RGYnVkbmcvY0pRUllBTDRZZnpD?=
 =?utf-8?B?aUtDa25OdGhoekl1bGtHVWhRaGtwcks5WUgzTno2YUM1Ym1SYVpudEVCNlVU?=
 =?utf-8?B?S0dCcDByMkhsQWtYbUlHU2YvNnp2aVBsT1hkaTVDSlZqUHA1MkkrN0dHRWlv?=
 =?utf-8?B?Q3lRemRDbzMySEYzOXFmbHFpc1JYUm0xMVl1NVdyQktRa2x0cDIycEdjVC80?=
 =?utf-8?B?bG43M280ZUlqTk41eTNUYU9vclpGQ3AzdlRHSHRBWHBVMnRFYkRKV3N4VGJ5?=
 =?utf-8?B?SDNKTmxIQklDa09talRVODRadDJ5aEc5NjZDblIydlFjYVRjWWJvSG11QklM?=
 =?utf-8?B?OUtaeFhFKzhqMm1neVNyZTE3RXI4dzFKOHNtc1VJbDhqVENoM0dtZFYvZExU?=
 =?utf-8?B?Nm9RL2tuVFF0ZVdYQXBzQUZSRXA0M3o2VG1pb3o2K0VKcXlST2QxRUIzVVZF?=
 =?utf-8?B?QW5QdnROM1VURU5SSTJJNUFxVFVXUE1oaU9hREFHVHFCY0U0S2pHUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3535ce6f-1ebf-48fb-f863-08df1e02b4a1
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:21:48.3439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdlJHEs8VYOpAoFOzbTtkLNB8XNAvsUYcoZ5XL/hQi+DWJ0AbWEkCjVBdwlmNie8EBoipKH7yaxRRA5kfy6RfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB10207

Hi Krzysztof,

> On 29/09/2026 08:23, Zhentao Guo wrote:
>> In the previous version of this patch,
>> allowing one entry was simply a mistake, not an option we ever supported.
> I do not think it is true, please test it.

I re-ran the dt_binding_check against the new schema and a full 
dtbs_check, the binding validates, its example compiles and passes, no 
failures found.

If there is any additional testing you would recommend, I would be glad 
to run it.Or do you have any remaining concerns about the change? I'm 
happy to clarify anything that is still unclear.

> Best regards,
> Krzysztof

Best regards,

Zhentao

