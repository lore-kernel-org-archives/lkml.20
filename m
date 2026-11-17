Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.121
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794907952;
	b=Le/4S9txRidDHWW0pQ7YWkOuR/QA7L1FuJ/AtNVaT/ZhCvAJRuDC3jsqt9algSfejelh
	 NrEIL5y2igny5B6kWc7IgUlaX3ProwsrS6ZKreO8M3EsppkEo1el2Y9co+zYjtTqPi6sO
	 SiKPm7bNyUWy3LujV41OuXb6ysxYmEzwvkZkDAR6L27rcxffjlxOZRwz00VChchZvL8th
	 Gv96TV6JZjiITAYaVJ/g5bndHDesGGZtz4EPrmH7tNaJkJCnW6xqfshmVQHmvXXSFZomg
	 Tpv2Jr0pdVkrS2SaZDfK09ykmhLXS5UNTa2/0wm8WaapGKRyKIMMvJVt/9BcGtOV66g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907952;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
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
	bh=cAohnXRlhmTtbn5EarDJT/yhoqvFcXPLxV4lwVGoOWo=;
	b=WUCSR+m90YLKQTh0X/RMUTlTTuH3Zr8c83D7NMR/HODD3p4zgt2Se1B2MHNMXDiHAtUu
	 jfnUdQCLwM2EmG3rWU6yDYKVRg0hO3+zosQTBiOOFvJFC/SmyMVRLr7qeG6LJk2eYmXpq
	 8WueWxKm9/HYaA9nGG5oPg+C492R9qWOEYb++8CqgRgPWcYJnGGdWKut5TXnCTxD7SWLv
	 7iDdcRsZ4gAyn/N/EABl3HnV4aWuFYhImh9wkCHpeJpvGQ8vP02wdgV7wGnL+jifZIKKZ
	 qYriQKJPLFYw7oLrAqcH2n4MHl8Ye4WNLvb7vlN8cNs1iy27K7KWZ5RhP+jGIzkwkhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b="pNy/HNR2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.121
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023121.outbound.protection.outlook.com [52.101.72.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813CD606A329;
	Tue, 17 Nov 2026 09:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 813CD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=pNy/HNR2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR1XVuH7ly1B+EkyVU0Jm8DgsRpRZkzxVtGCSL2KydRIS5kgY79fbl56sgIgibmw16Kh4QqHdO1WJf7vvRQWVxMT7QcSEt+C8QfVsZnXrBvMxujEIqWeTCC8fFTeLbQZibO0binl3b5oUNw5XMScqG5vggDG6DMDRxkzwaVaUuV1fWbCW6q+i9jYgQzSsFFKYvxTbuCQ5UMw86uBEsTDY1rsT9j+jPgqx3p8r278htuZ3ot3DDXsT3hN4AwCVcCAlV+6BHvZ6eUNtIxaVxKDCJCMj/1adSKS+ggRjvZLNF+M8ZZo0DydbDrJJkt9DRfM7/8DkMmVDkT2wyILy9rRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAohnXRlhmTtbn5EarDJT/yhoqvFcXPLxV4lwVGoOWo=;
 b=y1YYozH+eQYK3aqIU9pd4mEASru09Uc/eQMlR4Z5SSvBhz9K5RboYXEhssHX0C0ZGDLp/INsZLwdBJgOsKQU5THXi5Izkp/dHgHac9ZhT7IQlMj4q5yCjiVRPEjjVJ/g259XWq4+bwXu9tMZqCkgagfP91SEjZW5XK444XDgdowQxxa2spnWtIxuz2jiVz/O7R16VAn1+N7fkpoTyu2ceKdhZxQj72k5it0kLg8eCDjoFCZRo3yCYJpedAOHbNPYzIXRnVqo+WsZNHRaVOOFzRO6SCDviSph5vNd/H3AgTZ6bafslnT09cbXt5pslcI/Y9sWlsrsFqFytvD8ZZ8HQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAohnXRlhmTtbn5EarDJT/yhoqvFcXPLxV4lwVGoOWo=;
 b=pNy/HNR2PHjjO6zElTwGzrsbasrxv/2vqh6Zl0Ffqhm4edWSHHZMQ78CI6kSf6qIhNbKPO8uSjEiHoo+ndULj1xKWsTGztit2cFiezVhgdQ+rWRgZnxY8XK5Xqou9diPICrrwjlw9Ob4cslWjcGjEd74XSQPAl3qnHrhxHjWUgdPYunh9uRbtli2NN3vHj///wZnWgWuEZQRYDyRTJf4g/OxOS9NUbZcIhCFtMGNNvPsmHTygLjl3u9dj9dapr1sJsW3s0SJ+ZJ3KjHTZpYDpTq/rEoFhL2JhlV++JtVayNUCmE35JT2Qa31EjDRtpFyzBm8/hNOBHBM0D8ccS7xxw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:159::10)
 by VI0P195MB2840.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:2ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 09:32:27 +0000
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894]) by VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894%7]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 09:32:27 +0000
Message-ID: <06904f2c-379b-412a-a842-04d7898c56d4@phytec.de>
Date: Tue, 17 Nov 2026 10:32:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: imx95-phyflex-libra-rdk: Add overlays
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Yannic Moog <y.moog@phytec.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 upstream@lists.phytec.de
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
 <20261113-wip-bhahn-imx95_upstreaming-v2-3-3ef58af5e689@phytec.de>
 <avc7o0T0-tSW_c0H@SMW015318>
Content-Language: en-US
From: Benjamin Hahn <B.Hahn@phytec.de>
In-Reply-To: <avc7o0T0-tSW_c0H@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::17) To VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:159::10)
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
X-MS-TrafficTypeDiagnostic: VI1P195MB0623:EE_|VI0P195MB2840:EE_
X-MS-Office365-Filtering-Correlation-Id: 298d6687-9b6f-459c-f084-08df448db1bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|10067099003|4143699003|11063799006|56012099006|261021121427099003|261021135927099003|261022075727099003|261009221227099003|261009223027099003|261026121527099003|261102123227099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	bRhtk6XDlaNFep9CNu+OO9LzoihvTt6yMEfINmMmEYMEAyUpY8YTdejKat/J4yU/kaHHVsBVLpVKAbcAHqN4wnyYcaH2MooBIrgByFPDclp3O3g34JwcHsaULtpu3m1J6cowrSkj6DK3FJ3XdouEGEC+iE6x/ilhLXpWGuOwKtcSKKwFrRcYApp4o2j7VRRFmpFSNj74nJD9Tj5ovmINtvUAKfEysch9PsJvPWz8/LfbQWBNp2gF/tALZ92tjO9igxZSfc1v83TkUXkNuiV+I4kIwVWZVcnWJkf9O8IQyUfNfMd3p/AZcCO/QxqF1HdZa6l53yHx/5d2ryFANxJ3tlNJfz7GjObVPSDryehMHKiQfsksPTjLZoYjwS/J4AnjWvQbmtaR4QSeTLGlIQnWYZNQcidiDSNcmW0QJf+B5Rcd+N3TZsf8LsBoF+u+BkfeYg1aFQzT6q3ZbLP7rBkV6JCmgwWC42MA3dn2edisrVTcBviczkKe6/jqsO/TyOAodirvvrxrp9WhSFV0yStsWSTp03IC0PFMEZzt9XRW9k/ZyCQYrWHWi2yfhDEfyO/3EgNgsaR2621WRV+TcXkZQCGdjqY4vRyJSytT+8KldL4Jl7lOUzBBQp4Ye3NIHAUe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P195MB0623.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261021135927099003)(261022075727099003)(261009221227099003)(261009223027099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rnk0ZUdYRFhNWHVMM3c5Y3FWS1gva3lIM3JBd21SVWd5dHlEdEZmajlDcGsw?=
 =?utf-8?B?R2lpU3RoWmtyanlucCt3VCtVN0YvUUc3SmdRZWx4REhmeE5OcUk5NDRRZFB2?=
 =?utf-8?B?NDRid2hmb0w3YzNlM0xaS2w3cVptSzc0ZnV0U0lxa3FtV3I1NmFuL1lsaFpo?=
 =?utf-8?B?QkMyK2RJOFJ6a0VHbUZsWHZhMmRsUUxpRW85UXNWN0F4bGR1Qm8xemlDSWR3?=
 =?utf-8?B?dVM4ZkxoUjQ2ekdrUW1rb29jaFkxUlZNUk9LQUplb0gxM05zdDZzTHNVeWpG?=
 =?utf-8?B?SUF0djN0cVJMRXVTYmpqWjhWYWxDUlVBNnNPS3V2T1VQdFBxQUZFdkFaYWRW?=
 =?utf-8?B?RkJ3aVhRbU1XY2lxU2VhWlUzcUdPcDN5cmdEdWFiL2dLZm43OFJ3TkJIMzlo?=
 =?utf-8?B?a0RlQ2h2ZitORHZzRHBobzIwTnlGTzM5NGF1VDhXNXRwR2RMb2I0b09zaDV6?=
 =?utf-8?B?SGJXOU5oSmVvZ29LemlXM3NVOHBXWkgxUjFTM1BjcHd6bnQ5a3Fyb0J6Yi93?=
 =?utf-8?B?K2h3RDVObXozdjZCbVFHY25UTGgrSVZ4WmlmRjlUaW02SnFPVDM5dHpuYWph?=
 =?utf-8?B?V0NLa09LOXNPWWZYT2JLMTd6bkttVzlmb1BLRDVNcTVVM3RzT05MN3ZWejIz?=
 =?utf-8?B?UFBmRnIwdGZPV09Hd1FQOXlOTU9Vb2JNWXZJN1lweDZncUx1R3JmTlFQRENQ?=
 =?utf-8?B?bW9paGZFQUlDODNCQkRhTDBOZ0RGYXhCMkJzTjdkSlYyRFUwWTNrVXFnNDlt?=
 =?utf-8?B?UVZOSm1jdG1jOGlTaGZIL1hRcFhGcktJdGNJaWF4TTAxTldYSDV3Vk0yVDB3?=
 =?utf-8?B?amMyeWcyZzVpd2gycmJuaUFmTDB0RFZQaEFmNnhVQmNyT2QzUVU3SWlCcnh4?=
 =?utf-8?B?VmdkWHJJYkN6dk1Jdk5rYVV6cm9RVmdOMXFRWGpubVd5VTZBZ2RHblo4Uktz?=
 =?utf-8?B?U2pqbFc2SmlWaWk2QUF0a1E0T1N0dE1UanJWYUgrL3BaVW5jaXdtTXBaUzBp?=
 =?utf-8?B?c3YzNVJXSTRFWHBiVk9EdHFKcTJOdmpoTUk5aWJSSUY2TEVzUGZPVVljWnp3?=
 =?utf-8?B?RGY3eHFwenk3U1lqSFh4M21COFhMeFRjaStoLzFhdUJTeXNnUVpVUzBZNVMy?=
 =?utf-8?B?Wmo3bHBWSjNSdnBmRmxLNjA4akZOWEJjSmM5eG05LzNIQjVIbjJQdi9vTitK?=
 =?utf-8?B?OU1ZRzlqdVhRM2oxWUJydVRSNVM0RUpsMURBWE5LVXhSZ3JIUlpJQVRwbEIr?=
 =?utf-8?B?VER5QjNqQWxUcXBDZ3dOZ3dYWGVmYnBVVEZHbWt3cmpzY3NmV2hwSXgyUHQ2?=
 =?utf-8?B?QkFuWFcxSWpoZkdBZUFDaytrQ0U1cWdqUEk0d01sYTlSYVNzempoNnoxWXox?=
 =?utf-8?B?ait1NWJLendhdmR0RExpb2ZXQWNEV044QUI1dUNMQlhidDNFRVlGV0QrbEpm?=
 =?utf-8?B?cjFYSDZISjUvNDhmbWE2bjFzWEp3OENiZlo0d0tkV1ViUVJDLzBiVkhPOVlB?=
 =?utf-8?B?MHdCcDBsR1dZQ3IvaDNBTjFBYm1HSCtaUnh1UHFuMjBqRmJNR2doVHlXZEtS?=
 =?utf-8?B?emNIVXpManpJN00wSnF6YVJ3Z1dpa0R5NVphTFZjOTZQSjBkdzlqb2ptUUV5?=
 =?utf-8?B?bDFwYmNiODlvYktTMm1LTWdINjdVeTNhdkxnMXR5NURJT2pzbzRhNUZjMTdF?=
 =?utf-8?B?UUY3YW5vQTRJRFByU2F1QXdmc2Y0aFN2bUdZT1JYcXA0YU9qRWFNYWYrZFFq?=
 =?utf-8?B?SUhZM0pWYUN6QjNLemsya2JUd1VvUFgxL2dFS2Mxb2lQbjN6Nk10QVBsSXNj?=
 =?utf-8?B?d25GOGtJaytOdUJEaURNNzNkRWRRVU9RUDVmditwTnA0NFdSVGVwSjhjODFC?=
 =?utf-8?B?aVowZG51OWU2eVU1Z2prUFp4TE1tbnVqeGlLTlZHM3R0b1FPNzFyYVBkWTlp?=
 =?utf-8?B?QmVIQllMRUVYeU9WbWZZQ3p6QU5zN0VTbU9MSCtiT3llOHA2V3Z5dXlIc3Ji?=
 =?utf-8?B?b2NBbzVsVmE5TnV4c29hb3ZjVll2aFhocjNTWGFhazF0T0ZNQ1dSV1BoWTBq?=
 =?utf-8?B?cTY5M0J5NTZ0bUhaelVrN2wrU1hON2Y3b2p3NWIySG1USkw1Wk53c3g2Tlhl?=
 =?utf-8?B?ZEtqTFJ1aUl2dUE1RG9BME1mQVMrQW96N3lTSkwyMnJ3OCtEMG1iRlZIMGNh?=
 =?utf-8?B?R1JlemJkellTOGZlTVkwVWJRWVhZQVpDOTcyQklLV1hwYkljNEFUTzBJTGVM?=
 =?utf-8?B?U0g4U0FNZC9aVFZtbHVqcFMxbWtPS3lYbWUyOElMVFJqNzVacDlNYlFzQ1dt?=
 =?utf-8?Q?zmWcj6iu8zsgLTIBR9?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 298d6687-9b6f-459c-f084-08df448db1bd
X-MS-Exchange-CrossTenant-AuthSource: VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:32:27.4431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cs4/1PPfSfdIE0rVLqofWVHJ7SsyeVA6Pbb3QyvEc9rnlJrmkz1/0ksNRI2GoWzu/1Y0J6+1VpYkGTcD9afgiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB2840

Am 13.11.26 um 17:32 schrieb Frank Li:
> On Fri, Nov 13, 2026 at 05:00:05PM +0100, Benjamin Hahn wrote:
>
> subject Add overlay for som temperature sensors and ...
>
>> Add overlays for SoM temperature sensors and M.2 Key-E WIFI/BT cards
>> that need the nxp,88w8987-bt compatible in devicetree (tested on
>> IW611/IW612).
>>
>> Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
>> ---
>>   arch/arm64/boot/dts/freescale/Makefile             |  9 ++++++++
>>   .../imx95-phyflex-fpsc-g-som-temperature.dtso      | 23 +++++++++++++++++++++
>>   .../imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso | 24 ++++++++++++++++++++++
> which is independ, suggest use two patches to do that.
Will do
>
>>   3 files changed, 56 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>> index 4eb7508193e7..17b357f4886a 100644
>> --- a/arch/arm64/boot/dts/freescale/Makefile
>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>> @@ -739,7 +739,16 @@ imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
>>   dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
>>   dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
>>
>> +imx95-phyflex-fpsc-g-som-temperature-dtbs := \
>> +			  imx95-phyflex-libra-rdk.dtb \
>> +			  imx95-phyflex-fpsc-g-som-temperature.dtbo
>> +imx95-phyflex-libra-rdk-bluetooth-88w8987-dtbs := \
>> +			  imx95-phyflex-libra-rdk.dtb \
>> +			  imx95-phyflex-libra-rdk-bluetooth-88w8987.dtbo
>> +
>>   dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk.dtb
>> +dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-fpsc-g-som-temperature.dtb
>> +dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk-bluetooth-88w8987.dtb
>>
>>   dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
>> new file mode 100644
>> index 000000000000..84afe1ff9f06
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
>> @@ -0,0 +1,23 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +&dram_sense {
>> +	status = "okay";
>> +};
>> +
>> +&emmc_sense {
>> +	status = "okay";
>> +};
>> +
>> +&ethphy_sense {
>> +	status = "okay";
>> +};
>> +
>> +&pmic_sense {
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
>> new file mode 100644
>> index 000000000000..1601e04b3940
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
>> @@ -0,0 +1,24 @@
>> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
>> +/*
>> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
>> + */
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&lpuart8 {
>> +	bluetooth {
> Can you add label for bluetooth at boards file, so this overlay can
> reuse for other 88w8987-bt module.
This would be technically possible, but I don't think it is the cleanest 
solution.
1. adding an empty bluetooth node into the base dts leads to DTBS_CHECK 
errors:

arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dtb: 
serial@426a0000 (fsl,imx95-lpuart): bluetooth: 'compatible' is a 
required property
         from schema $id: 
http://devicetree.org/schemas/serial/fsl-lpuart.yaml
arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dtb: 
serial@426a0000 (fsl,imx95-lpuart): Unevaluated properties are not 
allowed ('bluetooth', 'uart-has-rtscts' were unexpected)
         from schema $id: 
http://devicetree.org/schemas/serial/fsl-lpuart.yaml
arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dtb: 
serial@426a0000 (fsl,imx95-lpuart): bluetooth: 'compatible' is a 
required property
         from schema $id: http://devicetree.org/schemas/serial/serial.yaml

2. I also think this is a bit missleading, as this UART is not used fix 
for bluetooth on M.2 Key-E, but its default is RS232/RS485. It can be 
switched to Key-E by the Multiplexer controlled by UART1_BT_RS_SEL GPIO.

The (default) state of this GPIO also needs to  be switched when 
enabling this overlay. So this leads to the overlay not beeing generic 
anyway.

>
>> +		compatible = "nxp,88w8987-bt";
>> +		fw-init-baudrate = <115200>;
>> +	};
>> +};
>> +
>> +&gpio_expander1 {
>> +	uart1_bt_rs_sel: bt-rs-hog {
>> +		gpios = <14 GPIO_ACTIVE_HIGH>;
>> +		gpio-hog;
> Look like it is pinmux ref gpio-mux
>
> https://lore.kernel.org/imx/20261023-dxl_lcdif-v4-5-4ae8395a4b23@nxp.com/

Looks like a good solution, will do.

Benjamin

>
> Frank
>> +		line-name = "UART1_BT_RS_SEL";
>> +		output-high;
>> +	};
>> +};
>>
>> --
>> 2.53.0
>>
>>
