Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6081E3B05A4;
	Mon, 14 Sep 2026 19:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412495; cv=fail; b=i/z9YQWrDQWu9sx3g4H71i8oxVF1iK+QPRgjpHbTjqYZ3GEep2a5ZFlXZe1sRuArpje/D1Q5OZM97HM7r2N2nLfddaWWsu4JYaR7QBX+boRX8ArIBigfa76PJ7zgt9WGwgs2iF9CL8uZNW9W9HuB+B1fKIHd9Et/XzoUDcU9vJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412495; c=relaxed/simple;
	bh=JW1luJM9ttKXDrhws9upPtkF4HOSw47NTOYXbTmK0ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q7q9mUYAxEryWm7cyMm2+8sYyBXW0OyJLbmnbQ6eoYZo3M4jq56SWchiIJC0TgVrV/vTnOFazdq0cPaLufKC3XgFQXro7Dx7BbUYwnXAHUIH6oXXvwoAt3kbAgD4FQtL4vuNvcnLvsst3dRM6YsqPU29ylLtwSyekLVsqZAXPDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WsS2/Ccl; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WsS2/Ccl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSFDXeZoPbLFOkVm74FgaGBsWPNLV2HCsHLIfU80IC5kc3+qRggyAsIADw43PdFH9tBTZ3SV78B3AG2B1AIH2DVAzQYWr982i4MMhtBhWpTdNMg4H2xa4kxxMUbDTyCOWXQhra6VK7PdUo+50ZHcVYcDR+k3Rw3lmmRGNql4ngmfzWAoKBSo7Hs6m0XupjYmX82Jou4tuCSEOYX/Wy5bN9EzlzIk5rfAtRWWS6nMcr5dr2RzaH1Uo8QON+gUNi/acrK66XfwmmEVxsk6SLIk87t9Gjo4+beTbcGiRXZANk5wsqLa7kdgt4iSaViFkwwm7Bd+O4Mrxg1V3jCI9a+aLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP4mdyaz5reydNYF+FVGGDA9eGJ+Sru1obBV8O3MFvU=;
 b=E/ll2KMbYSqXJdNYiZ68m5EIYaWVZr4Pr4QdIYRZcj0CEROfOxmHTKOyVijoNNYDLG+gR+a4icglgQ/vLyxJYkx6lQpMveK2JL6ZYDBVbqGeC+lFAgImJ7tyTAGNVHwkunqtVzuYdRuZN2bJUzKFuhpff7sHGK3R7YUPXqQupVVPVyZ+lv7zigSx2PKtv8m1h8KbXItV6782/qhWzJb0aawDv8D/LttZ2KP8JEWan5HxgtA8ghOsWt3JNodeH7iW/grEnWWuMs9WA8OM8L3VTn6+eYDouXpHG+w8fo7QMI1vmf+mfl5cvGcN7gw1WNNJIfUvRuW4qUU6gEumfs6q4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP4mdyaz5reydNYF+FVGGDA9eGJ+Sru1obBV8O3MFvU=;
 b=WsS2/CclXG0e4hRpcSo5ZzBZcw+L1acNrQPd1btvXQX0gfcjnpz7ZwI6OsUul5kjq+KdDX7/U6UGR6rrC3QCx0/N618bh/GjXBMu1v2xuPaDUJSvO5FUaT5pJfGBNC2KoERXFxviJrNvkQofF251/j4gLrpR/HJXfxC6CBvsyC5UoZdnuJ+iymqfp4Do1Z8UHu+UWXzgRIP0Ib5RLv2sWju00o1c4UhlOBYLut0nLpNhApS9ag1xFdtX42PrblMKdIvvkvi/KviQwUvO8Jr/K2L2OVDdIgX0zoDzoEWGxrJywy1NrJ9TyniRQZG051rGqsVUDmxgJYdLfLbOwRHDXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8426.eurprd04.prod.outlook.com (2603:10a6:102:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 19:01:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 19:01:05 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 1/1] ARM: dts: imx53: drop fallback compatible "dlg,da9052"
Date: Mon, 14 Sep 2026 15:00:57 -0400
Message-ID: <178941242600.1798943.6188335256585353065.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902191324.2084035-1-Frank.Li@oss.nxp.com>
References: <20260902191324.2084035-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 07618972-f6ce-41c1-3c78-08df129286ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|7416014|10067099003|22082099003|18002099003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	MMGHcI8TN6ROvNA5HxmBI8k4bhxD97TILvgDppP+VwmrefpjI305s0zmZO2b9wpNu1n9/dh+EwuD+rqyIohgj+zefxM8vwgSdz1G2M35Ip3n2j+bb3e3Ueca5dpVs/6u6xlnlYHLJipxRkH9bxoP9GqrlL++P1MvzYnKsOHeXasqkONu+Qz4UNoGSovc+uR5+M+3xzU/oCIIz7lFL/JQ51YsBqXnbNNP8uvZRa/siOhjm1VJkXFCRVSR/mQQUdCQ7VgcbyiNq4WrRyl0c7q7Uu7IxcSvr7INoop1RmqvuExReBlEndhCCvG25MH0mcXWqPV6DdTfIPo0ck982w6XBtTDLuiolpXtFZ9ubgP4wKQbVe2xJUzeoLA6hib9eE79AO7Ja9W/KhCZSKCkwYNxy0+AstjP8+pgoVj1g7jGY/+xTJbluglQexN1HL7ofc0R7vgDfjSMmVuoWxp1FK5A/ATkQAjqqAYuShiglCbB3D7TG9gNcF9AmVZ82OktoGuMxAFQoxg9qpfMLuhN7cA8z5cgV//nrL9YOCAPdEwoxrnerEfxiaRn7L9vtU0yyrjpoltnNx6G8VqtTLZ/WKvoyquSD86G3V3aj6AU57NSI69HGlEN43jhdP83zd7T227EObQAVc1PNCNSmkNukzyjf1OQODu4pyQyi+aADecbzhhGZqmUhuPNfx8KUhem+mZ7j8hh5d2d95zWlFPJ1ZAaBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(7416014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2ZDWEpaL05sR294K091RnNNUzFpWi9VeFJ5R3ovZTFTT2UzNmlMVU5yeEps?=
 =?utf-8?B?KzVKUVAvUmtxSlNtd3pkK1FHS21DM2R0aWdPUXFqZGFMcnhnekJJbU9NdEt5?=
 =?utf-8?B?REZOM200bWlqaHg5elBBYmZ6SVY5YitOZ05raFRCcGhBNmdmNVJkaThsZXJa?=
 =?utf-8?B?dVBZZ3NaZ1g2ZG5WZGh4MVVLcStsRTJpZ1FMbVdvb3B6WXlCaUlhQmhaUTdC?=
 =?utf-8?B?RUxEZm80ci9QaDhhV1lKSTJYTVdaby9zbFN3TXVvNEhOdlFqTjc3Z1JoQzNm?=
 =?utf-8?B?bmhKYUt5UDBoYVJkcTRjVFVMajhmWFd5S3JsUENvR05XZWVHY2hvTzliU2FG?=
 =?utf-8?B?NW5iN2ZldlpxSFMraUJWeUJaaEpQd3M4STRwU0R3NUNlS2M3RzRDbjZpM0Qv?=
 =?utf-8?B?em85RWNjQlJqUThKU0wvRXZCRW1jOU9qYTlOejNqM0pjWGhzOEtYVlFDZEgv?=
 =?utf-8?B?YlZiMDhOVE1ZbHN2VnVWaEpJdm9iVlhhUFZVZkg0RUFDR09QUWRadHpVbUtS?=
 =?utf-8?B?RTBsOFl0Yjh6bmgxVWtranI3UGVwMDk3RVJtd3ZQTVhDVGxYRkZaOE5JMmw1?=
 =?utf-8?B?cUhMcUl4bEJqNWM5L1ArOUhhUDRaeFpKOWJQRW5ITnVobjNzQ0x6MFdnU3Vv?=
 =?utf-8?B?emF0ajJXMHJDWW56aVZ0eUFpVmdxZkM4eERQeE9sNERiZC80TlU2eGkwd0FF?=
 =?utf-8?B?bFRyd2MwNHdTQUJaWkh4NmJFNzFwRXpBSUt3OXpReHZrWE9TZnNmS0JSaFdF?=
 =?utf-8?B?TDIwaWtXelc3citNOXlaUlM1cVF0V2RrS05PaWlpZG1kQS9mM0wrV2JsQWx4?=
 =?utf-8?B?dTVNWEZ3REprMnduYmloWUQ4dDBjUnJjS3I2ek90TVhtbUVUTWNWVkRtSnE5?=
 =?utf-8?B?djJWWFlzZEU4SnBsNUY0dkFDY0VFeUlJamhWdTRPVzZlbHVPd1hsV1AydVRl?=
 =?utf-8?B?NzRqWDdObzd4V0ZIeTZhb2ZlNy9Gb1hCcGNLL3RCeFZwS1hjV0U4eGl6NHhV?=
 =?utf-8?B?MEg5c0pqUlJzbFJRblhVdlExdjRFbjZBRzhnMW9JbjVmb3NwQUNISTZ2Rnkz?=
 =?utf-8?B?QlZheUowY2tYaEIzTUVtWDJZTFNmUU1nK1dEeFV2MDRCL0hiQ3QyYjY0OEtm?=
 =?utf-8?B?OUF2bWVrM1h2Y0czd0Q0MlJCNzlXTGxOTE4ra1hOZlJCb1VMN3dPQUo4clZS?=
 =?utf-8?B?N2lQd3N5WTNST0VBcUhRK1JBMG5QcFZ3VGtPTWViNUxpdWwyOXBaVndzS0pR?=
 =?utf-8?B?RFlGNFFrNDRicTljQkVzcmkwQk1uV1ptS2ZQcllLV1kwWGRnbUlZbFRMdFQy?=
 =?utf-8?B?K2NiVjBMWnU2eWRCN0pRZTJGRnRQNTNZajROQmR5MlVPZ3lJOFFKNjVzUDdM?=
 =?utf-8?B?eFFwWVVLMUUwS1RTV0ZaOGxLa3Y5WFhlZDBvYlN4L29zT3dSY3lJVVpmRlJH?=
 =?utf-8?B?QmphMVgwQWNVZzRxelpkRXhOeUdhTHIxL0xPemM1aTFPUEFJOVVaODYxeHlL?=
 =?utf-8?B?MGE5RU1jR0tIaTE1MzlpWXlZZnJFdWhnR3hPaytqdFc3cmtjeHQ3NHQ4Ykk2?=
 =?utf-8?B?UE0zUUFtbjdXMi9ieloxckZnWlQrRUhZdCt3VUF1OEIvRG1GYVdleEZtRm5L?=
 =?utf-8?B?S095Z1JrbVZUV0d0ckIvTzVOTEp3bkpEaWQ5Wml6VVgvNElzc2JNWWZ5dUpW?=
 =?utf-8?B?WnFpdmp0Qnp1azIvQkdOSGNoYW9pWUlDQTRxSzd3NWIxZnRHY1ZFZXJFT2tO?=
 =?utf-8?B?c3A3bGp6MjBPUUpIRFZkVDBBMnBESy9SQTNrK0VIRkNhUDZaK09GV1JJWUpn?=
 =?utf-8?B?czNvTXVzbGZiaWNFNS9KQ0dTdjFjZjJrTGRPcktNQ3JNc1RIYytHSmhMdFJu?=
 =?utf-8?B?MFdwRWdzaWdTWnJJbmY4NUZBMy9KRExFYnhMUG8rNWRsZlEycFNRM2lNOUNI?=
 =?utf-8?B?cWxuTHl0K1pwa1JPcjJKdURuUHBVMlVrQ2xKNTVDZmxWL2ZGU1AzVVRBaTAr?=
 =?utf-8?B?amh3czNyRDdzV25KRncvL1ZJWWdoNE1lU2YxZjhLYXFuR3plZTN2YTRNcnlv?=
 =?utf-8?B?Z2k1Rm0yYVplTXNJa21pK2Z0OFc2TnhyWFVySDArTXJOajVhNWI4TWNvOG1W?=
 =?utf-8?B?UDB1dWVvdlJaUW5ySWMzNDEzeWhueGFRQUo2cFpKeTFZTVUwUFlhTVdRNzRO?=
 =?utf-8?B?L25qWWJhOGFBVHZEbFF3R3V3R0gyK2Ruc1NnTlVzY2pFTytiU0s0dnhkU3Ay?=
 =?utf-8?B?ZzF5TEIxelpRVG1BZWF3WlVOZHowSDFUNEFuNC9CS1EzL2ZGdFV1Wm1vUTB3?=
 =?utf-8?B?WVpsa0I3UGZRZVVmMVhzVTNOVC9TNmpHMExWSWd6QlI5SXk0VFUrd1E0TFRY?=
 =?utf-8?Q?udpRSLz/crxFcxf6ichsQwmIgB5h+5OrAoC8S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07618972-f6ce-41c1-3c78-08df129286ef
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 19:01:05.0222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YCnR3fdlmtwtSNCX4Ou/63LnsjBq89dMvsiQgZm7pEGKYL0BK8XGoY50xa4017AR1Vo+3j1arsh3XGz9JKfRCZTtUieg1QgOXz9ptcAjPw4DfE67WdpemQsKFqWk3TO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8426

From: Frank Li <Frank.Li@nxp.com>


On Wed, 02 Sep 2026 15:13:20 -0400, Frank.Li@oss.nxp.com wrote:
> The "dlg,da9053-aa" compatible string is not compatible with "dlg,da9052".
> 
> DA9052 vs DA9053-AA Differences (from da9052-regulator.c)
> 1. BUCK4 Voltage Range (only regulator table difference)
> 		DA9052 BUCK4	DA9053-AA BUCK4
> Min voltage	1800 mV		950 mV
> Max voltage	3600 mV		2525 mV
> Step size	50 mV		25 mV
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: imx53: drop fallback compatible "dlg,da9052"
      commit: 1fa2b2c7b7b8563161412be16880651e197d2bb6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
