Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793361473;
	b=hHTcmT1ZBMzkPiIC9XLRY0gCXuPH0BwbPDHeFv2IIvJhtcTEofQMHLeO73sNsUch5vLA
	 t4i3h8Hlp0IWHgjIZU+bSSIGpCI4l5I+DqdFVxURnIgIK9aQU8atujTn4hFyQa/Jki2Bm
	 UQEEwN5Jd7n171RsEvRUiBbHR43y1wlbocRKHkGz5P+/fcxixKTzQVmeVsTOkljtR627/
	 ghcFOOw4mj7tUcEVWet3jkd6L3LsZlmg3/LT7Wvuh9zVtBMxRQrhYALg7tqs7UIv3UG0M
	 hrqF5OQDtWiDWrK/2SkeMESQxjL+o9W3Ac8f7uOyx3+aWz6/7h9qMUe0OstWogbGfyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361473;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=Uu99H9NgXa76FMikMpiazKfGSo7sya08+wbTNDnNG0s=;
	b=npU367WMc/xjLVi6Yoe2AbP9DA7EAp+HdIWjDi9Qa+vbl9VY7cQH6LSbXaBIBd7IBPj6
	 X6Nj5x5SdZrWJmE7TdlRTqDy3mVWqzWBLnopSomEstaw+Gpl37zVF9cD80IzxFrAcAkv3
	 Cd06jg43cpLn5b7ejCPrzLACBiKnB1OPBOzMyJbRSXtmqcFTwEMW7039BmWXMsqlSD3xl
	 BwSSwd3ladKzY5P9P8YOwA8J2ee3s7qEdcK9GiFK7MmpwHvjydIQxrkYUbxMkRy+2mAA7
	 7a0JnlztamRr2BWzkB+eSCtLr07WoReUk+EW8TwTmezlFl1z783ME8dKyPk14MfGhaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=pj8+HgGK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.81
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023081.outbound.protection.outlook.com [40.107.44.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5303F606A31A;
	Fri, 30 Oct 2026 11:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5303F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=pj8+HgGK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vy264UX8s8Fxtz+gq2vov6fbQ2EtMFSdutcnM2P3egcaksQp4fdp1YNbvZE/lbAzJm000SCxdgE4/kgZJcn65hKB9kiOwCKM2acTcY3sJozZm2/eZ0I5/OXZI39BT2cxya8nCrKiTcQeWrLhP8Kw7+yKgaEE1Zlaj4/NLaDKwmzPq36fVmh/EOP6uJDYUPtfbiSmgvfiFoHCSX8/eGVcUYRAelhZxio1e3nwAZEcVlo8wk4Er9LLJkDigCM9czCqzr/Jrxeh0Bf1YG5/jAU6be56z4jrbjML6pMdo3wYWVh4ZulsuPWPOjAL+bIW9EhSU7OGrEfQFqO6i3cuG0Levg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uu99H9NgXa76FMikMpiazKfGSo7sya08+wbTNDnNG0s=;
 b=SWVKELBqPD4KwmuzePVMbNo+Hr7oH8m9m/qVZxOBvehfN/dOkdWwNb01QV5uQDyWHBpIRwCdNiD6+0fh5qXsAqXPPP0ZEolU5CfxSu+Ni/9YdhRQMtBNRwo31ygjatXSI5PC36DiLzcVCFhKe6eH3xRcr7YGoNdcR5i5OeaPvBVPFbUHFlSOghsSzgJmby70iYy3GqwnW80ZHLs/2QFALISRfdBALWiSWBtLOv/HDki5cgcX2hOQRYZUvvloetRpwqwYKfyaVaBTBR3b7p0uMGg1q9x54Ft93X9J/fCg28n1mlZg3nEgIUGz1xwVO+klGO6u3eF2RPZBSbvTXvdhHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uu99H9NgXa76FMikMpiazKfGSo7sya08+wbTNDnNG0s=;
 b=pj8+HgGKSeSLAqmwNoj8SVJwh19Bz0nxEBEr7fb2pUKmIhaswBnyllpL3MSBX/4dj0waw00BeLIqoEBtSZtA/25bmD2uDHzhvRO5R4ktYUYtfUOuAc5Kiv3m89I9xvbyXZdhDRfTN+kWoJzqc/D9WxsTtBosVHa5g3scHKrT1l8QgAD/+tgOMTk78EGyvy6FM6ZpFse6tefO5pNXmKPKL4jKZFtFlO0ALrwiYegjWeCwj1ABW5FnqF8p9h4gSvvuKXYEECU3saZp1jdvRraTVcePplGiNozM/ZpL8urTWa64y/LZeX4y7EhnTzxe+lBH7zxMF9SxTyJobdxVcj7org==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SI3PR03MB10031.apcprd03.prod.outlook.com (2603:1096:4:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 11:57:49 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 11:57:49 +0000
Message-ID: <5d8da956-9759-44dc-b647-7303e4e57d7e@amlogic.com>
Date: Fri, 30 Oct 2026 19:57:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-3-616240978792@amlogic.com>
 <f22aafac-3ec0-4a78-8602-227f67c1bf4c@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <f22aafac-3ec0-4a78-8602-227f67c1bf4c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::16) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SI3PR03MB10031:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5de8f8-4600-4424-0785-08df367d0505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|921020|11063799006|4143699003|56012099006|261009223027099003|261026121527099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	idkzFrya3AzpZJ4M3bWthWfgTf0GG5NMTVu9wXCQwgWsYgOAXrJ2Bdpi1qAJCoRDs8jFFp0drvPWgWGlDNNKi3bOMPOgeeTegsJhhy8ujOQl9hfCp8ievPQfM3sNxBKEOnBpzN9HDSypkY8SWZ/oi4gnizz1uZQCZlEjt2HvSXPGr06do6SKAwHYDRcmX2zYVjItHwOrvD5d/rAmu7wIB4RHfG2ehQ4QQR07uSr4iwZvBcETzcG06KDOWCojih9UTfHz0kZX8/KuZ9UTDO4zZOqa7FUM3E+dm+QsTTrMefVUw1SA4kgqJt/hykXEjwMw52RdwMXicoyE/Fyt6SFlyWsIV7zK6PjgUcD8LvvbyE1ckHZViUFLubZgVIM95G9jp6GBASURy6OFfZ5BChDQbOz2CAkWvC1cPbC/knr6sQLzkHTkoz9RoygT6I7CUlR3bfRMY/wPBU7L5cr3VNaYiztHcfnJRDjfUsYt3BAPKuygt95YaPLIsgRnnr/VrHzMqxOX328ygBdRFHTUTw6b3l+wtld2tF2Zg0jhFmpXhb7ej36/zL3k9NSukasQwFfOmMVYujAqwvNxIEG3kFYuoT1Pi9w6D/IGb24xszwfwY88EBXuwxTUvws9Ggw3vDLMqX/hXd3iqsMKimY5kBp5HhsinMIraqj7Q2UAaxhVHR4YIbwu/594yhrHvRPJCic+n1DZG4dfhiQq8WW1KgH0TA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(921020)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDdYZ3NKcWx0UytpcjNVam53c29kTFFEMFJqU1UyLzZtYWFaSVpxU3k2YlRz?=
 =?utf-8?B?QmJHNXlDcUVhVlg3dFVWZUdjVUNYaXUxeWZzUUovckNvKzl6ZkMzY1c0cGNH?=
 =?utf-8?B?ZlVvL1hvQ1hLOGlnUFRnQ1Q1WGpKN3BnZ2srcXJ0ZzZEVVUrRGVTNVFFTzA3?=
 =?utf-8?B?QWV1YVEyVWtTeVRSdk1vWVNaTGszWHBQZURRcVhWd05HN2xpRngvRlI5MUov?=
 =?utf-8?B?QnNTdkFRTVcva205QnJrc0V4cDdUOE5yTWplSlZkMGN5SThQczlnWTJIYVJ5?=
 =?utf-8?B?RDRvSkxIWkVOeDd6VEdQVG9zZGR2eHZxdHRCMGpIY0N6LzU3eHdzU1NOdkJ2?=
 =?utf-8?B?azJMUU1KZm9yZ3hTWTA1bnI1TW5ROVFScmxsa2ZYc1FlT1ovU3FPU2U4MlU1?=
 =?utf-8?B?UDdmWVhSWThYcWk3a1gyRzJuNGxybmh3MEFlT2lkZlhLSDNJdDhramwvYWhI?=
 =?utf-8?B?RmxiYmZKeGpxSW9nZldCVXRkRUNvbGtDMkZPdlYyWHc5T1lxcDk1a0J6UGhk?=
 =?utf-8?B?dGdQTndEZjIraXJIaHBua2gzMnppZkpzbENseUROeDFkOEFROFhsV2RBUXRP?=
 =?utf-8?B?OGFYQnFQZ29sYzJ3Wkpwb2dNMWpJMmYwUHM1Qm4yUnlDb0ovU2dTTFpQUVZx?=
 =?utf-8?B?RDBEcGUwZU1TUGpwOE4vQXBKYThFWElNZWtySk1EUlYvb3JzclpieDNieE9W?=
 =?utf-8?B?aUtwa29mSFZuSEVhdWJnNlFORHNlZmFMV2g0STBuaFZQOHI3VFdhRHBCbFFj?=
 =?utf-8?B?a2VjV29jNzErRXdaU3BjNW41Y3pFUmNpZEwvVURyVEl6ODVYdXBHV0l2S2Uw?=
 =?utf-8?B?eVowaEU2QUpjc3V6SUs0SnhoMWJnN3VjL01nSGJzMjdGeEhCdU4zRnBSV1VV?=
 =?utf-8?B?VWcwc3hRa1hDa2M0bkVJNHlxdittUlpqZGFieDRaaDVMaEFldzVxTEprS1dq?=
 =?utf-8?B?bjl0My9zYUlGTXljbW1Sa1JpeXhISGw5Z0FyV0FXdDNtSERUUUdQOW9iUWlD?=
 =?utf-8?B?RTlHYTBreDFvL29kMlVIWFcwblRQaUZDQTdDTFRpeStxOXZXM2xpR0phb0I5?=
 =?utf-8?B?MCtXdjBKY1gwdXIwTk1Xd3BkZUVjMzEzNkhpeHcwRnJ2OS9oRXVFWTVZZkF0?=
 =?utf-8?B?M05ocFFKNjVvN25Rb0RsQzMxWjhZM3NJV2xKcnZpcHArYkVzNldlUjUyeFgw?=
 =?utf-8?B?Y2l2QmJ5NSs1cVBDMHN0TGNHWG5yY2N1V29reVRzSGRMQXM4ak54WXNWRnhq?=
 =?utf-8?B?cndicmtaL2pPazhnLzA4UkF3WHlWNUErWHQvRHZxK0d1MEFaaG5IZmRXTUt1?=
 =?utf-8?B?dnFuc0d2ZHBCNVBrejVPNFBkMEl5VWlVRmhHOFpvWmExMmU4R3RxMjZtd3g2?=
 =?utf-8?B?QWx3RkRTMVdUbHJ6NWRCK1RDV294WHNnSnZkMEpYOEY0aGhhbHhKeXJlUnUw?=
 =?utf-8?B?eFhkMUZINVpUd3ZCTXNTWnVaaXlHRUphdCtIS2kyNHZXZ3dmM3VrSDUydEpI?=
 =?utf-8?B?dno1T2U2TEhUZmhpcEhmditvQTgzVi9xSk5rNERZcUxGSndjM3NjR1BlN1dD?=
 =?utf-8?B?SVFmZXllenNJVG4yaGNYZVpVaWVESWxKd2ZaUkNEUCt5cXN6R3Y3RTE2NkJs?=
 =?utf-8?B?RUM1YkR6RjNZNG5pdjE2ZnFsZlJ4UGZaZDFoS3N4cHhCNHJEWkJoeVBZelNa?=
 =?utf-8?B?OEgwMTVjTnU4UktvVkM4Z25HRnd3dkdZaXJwN3FBbk9sMnNjcWt5ZGwxRmdr?=
 =?utf-8?B?Z2NGbC90MmhyV0VJUTM1MEpTdEpMRVNheW5qMGw1Ny9KVTJ2SUtTUGNvZDJs?=
 =?utf-8?B?QTMwb21jcU9ZdVhjbHIzQmxPNVYza3ZVTHdLazh0QXlPcERPUnVkbHlCSGht?=
 =?utf-8?B?QThkY1dsYVdqUkZxMUdweGxOWkFsS0xaaXdaNExkS3JuQlFnazJNOTRMZTRO?=
 =?utf-8?B?VjVZWHM2bCtYcEdZUmJOOEtVYWZMZnpQQnRQMmlqdkoyY25MN3pMQUJ3SzVM?=
 =?utf-8?B?VXBUWkJqek9vcXpYQit1TWlDVzRaYU1wSGl0dmxoeC9TdDltemRKSjJOanhZ?=
 =?utf-8?B?V0VNaStOcjZUcUsvd1BvYnQvVSswL0U1UHhMNVQxOWNaZW0xVHJ0Z3VFVWk5?=
 =?utf-8?B?eEtwTFdzUmZ4Sy9VUU1ycmlZVEpCNmx1VHpNcWhKK1lhMmhDaHU1RjVOamNl?=
 =?utf-8?B?em9XQWVuT2YxUXNGRklUR2JIUU9zOGQwaUNrY1U2b2lFdmc0QlRmTS96dk1Q?=
 =?utf-8?B?N3ZHQk4xZm96Tm9PMkdlWnhNWXZKbGFTVU52eXBpcVFSU1o3N0tHZ3k2QWJx?=
 =?utf-8?B?NlZJY0YybXBoVExGUHRPdlBOTlEwQmtmK1VVT3VRdGhwclh0Wkw0UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5de8f8-4600-4424-0785-08df367d0505
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 11:57:49.3945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkoF3wUzJ8Bet1VVzWmoafS+Hhrx2a1PcH9A4Wg0Rg8muYx2ESCqZcDbh2ICN8NaSAz3V7mwJ2vaKz2NYyYA3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR03MB10031

Hi Krzysztof，

> On 22/10/2026 07:27, Zhentao Guo via B4 Relay wrote:
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Add bindings for Amlogic hardware decoder accelerator.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>>   1 file changed, 114 insertions(+)
> I do not understand why, but people have comments here which they do not
> express by reviewing/commenting, but sending some follow up patches.
>
> This needs fixes then.
You mean the patchset from Christian? Indeed, Christian did not give me 
review comments before posting his modification patches, nor did he add 
the other codec formats based on my latest patchset. I have already 
reminded him of this.
>
> Best regards,
> Krzysztof

BRs

Zhentao

