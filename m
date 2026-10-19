Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434400;
	b=bDYFB/DJKOuN9x3UZTZgNTvcCmkOUUA2wQEuDyfHiyjO/72j3lwtf+ganoIUHU7TM5Dn
	 qRYWLW0gqGc+V2S1YqGtAUyJOoVBxNHXIsQ5jGzm+gB2fRGL1ADuPON7t2+iOvOOb6Tab
	 OHwjvTZ7TZxdZWYOAEYHfGllT/gqduJiatzsuxomXlCfDAWmVgzlOlyUJppUOAgBflPmm
	 0xzeV5zBiW5b7+oqdxz9ZcluJ1DHtpa9HnStEfB2A1xHmUBSzIdHeMIX9fFZKRMCm3lew
	 9MaRDJZ+z4yfGq1yWclS8ZAfwlY31wj8H0GsqbieIuAyPLwtq8hBUyUozQiPQkY+0sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434400;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wae7bGq4/YQzUGb8b0Ex2RM1LgcHY3n5cb45FZY0rEM=;
	b=CAuDNxSPcXbe2dBLBAecgSZwzvNd/seOFyniu9PbKkgOkcqECVbNvIsHsG5zmleIwYVk
	 UEIotEU6dfKWzc5ls3FuNo+xVw9+vQB2d9GWjhaExcovHiPFwnP8FDc3cfKL4Af9R4IbM
	 h8RAVoPW6lQl2NPpF9nHzl9i/Kf1wkUeRtqCY66v5Vrc8tSGdp3Eq7uWF7uDNsAnah9L7
	 Xaa6SL5xcHC8l86ldfWu+JWK7fsIqjkinzVjnTeFWX5C8CDfo4LigQuiVeWZ0m3+grMDX
	 hIRj9+uy7xymMuxXLTz8LCwDmNb37bynnOVHkNx/YfgYP3iqdyvS9VxPR6S/XF8SYIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hQUUfdM2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.39
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23BB60A2603;
	Mon, 19 Oct 2026 18:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C23BB60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hQUUfdM2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPZTQlb+dbK2503mS1q+WAsAfk1nedixA1EiAtCUrrLVKfL94BVC3NzIhBc6tNCnR/GmrCmduLCbkyOJTMAiPgagfRrKv7Vp6kuPlERMwcI863h4eNTcMPkzXH9SX7cX2UwXy9pNoUqUbte0Z5ipNGjdojHfs6AU9MZaijtZfAxxKsemqXoQY7kjhSZNyh5WQPRwQOUz2GPMAemyX3gHTGCEawO77dFmZngXpfglAHAECbTMqBdMVDIiUml25AICCUySidwzpl8lTLz1oHS4I9+jSxHpiLhf9Pr/LUw4b9Md0e2m+iwm5IXqqWwi2wUAoxgTktRuCgsQ3HmbqJxPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wae7bGq4/YQzUGb8b0Ex2RM1LgcHY3n5cb45FZY0rEM=;
 b=hcQv2gQah7PBOiSwEOt+UCwKH9WJfXA2JPjaFENA/Y0wSK5J42P+J2Kxt0AnkEpVJzPBliAuih7BFITxTzp8InHj5YmrMYA/x+21yddrKSBBu6XGy/PUTqAoXZvwxvzeKtWUKcVFUnNnIUZL7kXnxD/RblC/owdAx5OiksxDJgvdtEsnQJukwHrvAQjv19YuO0TmveLjc94J8yhGBdic5+DyuoCKOcgY/jRc340OFCo4YLPh5g9BwRFrmjy8HOl4VPTeKoa3aYTCasLQreV3NeN8kbg6/WjazqIEydf+brX/vOUPAZgR+tJk+IvWnC83fwPhvZ/NjD/V9XQVjev53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wae7bGq4/YQzUGb8b0Ex2RM1LgcHY3n5cb45FZY0rEM=;
 b=hQUUfdM2PDavFBXfTEVXltK1n71kQdE1TrbrhlMAp7B8MagXkBoh+xJDt+wT7cNe/toadhw8wFWy7RvaY/hBwK6hhSvJ6mByxodPiC+KZUdg1KtIZR9SofAY82jNC8WSMESxmMlpwep0vuIJ6g4uV7ST15r7AxuxZHKXjAOQIUxpITwwKujdGRvDVKX5cIeh2vGGNaF2xVVtAONKO9MfRfH5ue1J5qK1zLA7alrP4XuCK5sJQFo9r4xtnigRAZ9u3QmRxnXP1JU8qMWwfoaxkTskeOdREL9zkxCfe2DzAY4boeUcx1jwhnO0VhHntS3oIrd1f1t3NNah/s63/EBfJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11557.eurprd04.prod.outlook.com (2603:10a6:10:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Mon, 19 Oct
 2026 18:26:37 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:26:37 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:18 -0400
Subject: [PATCH v2 03/13] ARM: dts: imx6dl-b155v2: add touchscreen size
 properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-3-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
In-Reply-To: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=1186;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ff7LcK0Y9Qo7R1VSXMsey39qhUWG083xJ3BF9hL2654=;
 b=RY2BOOr/q7yPkBEohiJj8b4IS+Nv7pnONut+JUhmjq2oouiM9Dy69jlveFPQ3WFN+qShK8zx4
 7FSAHTEQhYTCl8povlpPDJIozsrw1uMHd6uLhGSUMpslGtqbHR7Aw5H
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:455::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: 45583133-02f3-45a0-95bd-08df2e0e82e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|23010399003|18002099003|22082099003|3023799007|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	iLL5ObvFov7D7thnF52oEhl2b8yj6mfuOAsOkWS/YU7BFBMXxg9xuMKqaXOgsXK3kHoQphfbzE93Hi6+xroD7TcvSCqIoBZd4iqYXb4Qz5hdVJ7MRBTwHiaeKo563L+h0a59luSqsjK/RlOE+fCQatBJ3Z1t5oTvyjJ/a0Kg5YX6zdp2Ks2FmTG54bQ5AdqmyUpTvoz9q3OoVMRRiutKqbr+6JfZ/YHnOJSAGgTt0Chk6tbVD+vqsGDu+1cwdVjJs8WS9WXcs+a4E7LYpNntohH6RJRq86PLlHrp/kaiO3pUJPOAxKyCJtbaZloGog+U8v2CNtmVPTUuPpBbQCfAKfLcZFBatqLJ62j38cubrR7LaZV7peaRgRcGZAwXUNFepMLfC/oTzgtfTUluQaM+lnYt/aGVqVl2bc3vqcmRtLC+ymXlL8yO0R/pyfSZCkdxrIIfmNEGF0ZsRjStkR8bk0WmMTHTUx7VI+F0+9a/aIkbA7os5LZqARh07KTrVK5bQ+dG+dDBXEEfnejWVpKR1YBeJbAfwOBtke8yRhnrLyr8fAlKI/vfAn0RdQQLT2ItVfV5pAXopDG8neZPkWy5TdjC1pc02JnJPaCO6h5ExlTIzkDQVYGA37EkkLsuXT8p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEhQWkpWbE92cWRjUlBvdGlpbldxby9ZWGtyaXFXVENFajNKcVRRVy9zcmMx?=
 =?utf-8?B?a1B6SEZ2MXpaRURHUjF2ZzBNb3U0K2JuSVhTM3h5ejhSUTdRMFVpSkhJcUdw?=
 =?utf-8?B?d0ZiT04yWWNDbVFQalhZOWdwcHgzTTMwSDZnMXM3eXl3YmV3ejVQTSs3NXhw?=
 =?utf-8?B?emkxNWNqT2VJM2RIbCtDTFdyd2VoaUpaTElzRU1vRTd3b2VGRjFwOTlaV21v?=
 =?utf-8?B?UkxZWVlXb0NNOVRCbFYraXc4SWo3OGxQaWN2TEU4MENFUnZHa3NXbmhtdlBN?=
 =?utf-8?B?bFg1d1Rnblk2SE5qZXpxbHNIQkdzeTBySURQSVdEbGwyOUJxUHlIZGJxbjd5?=
 =?utf-8?B?RTNuMUpNYm1HZUpQdGRKQzV2dkZHWWQ5MWFlMGZrT2ZBOVE3RFFYMWljYU91?=
 =?utf-8?B?aitYVzhRL0lvM093cFBWcWpOeld5aWprWGJ5L0ZKU3gwMFUwOUFYSTNId3FN?=
 =?utf-8?B?K05memd1YndwVUgwbWh5UXhFRXFVUjBYei9tZUR4TkJidGRuTkk5aTF1eWIy?=
 =?utf-8?B?YXQ5ZTRLVkM4SDArM1d0MUpNcTJLWEFuM0s5ZXpUbjdncTRLR3k1emdLc1VR?=
 =?utf-8?B?YXlJcm0wV1RlK1U0M2lsMG1mS3lGTmZweFYrTFBnUmRmRVZJa0RBc21WNUdT?=
 =?utf-8?B?MU9NOUpNS2ZNS25JNlJxSlpIK2UzdUpkL2F3bWFUbmpQNmhoS2dhTlp3OFIy?=
 =?utf-8?B?UlVLL2xwSW45YWQ2WEhkUXFpYjdCSCtaaDU5WUJjdmt6eXh4UllpVS91S2wy?=
 =?utf-8?B?cDhlWDI4ZHVZOGRBVU5yd0RVbGhhcDNVY3dlc0FodHhaMDZ1RWtpOVhPWTM4?=
 =?utf-8?B?ZHU3Mk9UV1JTb0l3VmNsY2k0LzBRK25yUERLckZGTmQycDZEYXF4RjM2Rk1n?=
 =?utf-8?B?WUc3YlNsWXpWTmFjRDJqb1NBcFpHNVR4SUs2QTc4ZHp2YzkyNkpONFpWVXI4?=
 =?utf-8?B?N1ZWSEhjTVV0S2RXZm9ha3NJd2NTS0tCNjJIYU1BVVZxN3czMjFDU25KbUE1?=
 =?utf-8?B?N0xYQkl3YXJUbmNXUUxCMjhYSnh6aVdkK29OZEQ3SWtiWmVhMTF6Q1ozSi9C?=
 =?utf-8?B?UXhreDhQTmFzeVlESml5TG9RRWZURmY3bWpZS2RyZytlT3F5Sk03bXIyRWdZ?=
 =?utf-8?B?bWlZR1A4a0krZUM5eXhWU2Y1Y1ZOZjdSMWc3elNlY2dlTkFKem1pMmxKRklm?=
 =?utf-8?B?MjFtZkhrT3A1NWRST3NCVTRuOGxkRzF1V0p6eVlPcEhmd21FMDFDSHpSL1o0?=
 =?utf-8?B?a2VPTlNPZmtuWStpUk9DZ0pKazVJbGQ1a0l4VTB2cllZdE5hUTRuTnFzRmZm?=
 =?utf-8?B?Z0xKdytXbk9tUTlRQU9TejRRa3Fwa0lkVWRnd0IyckN0RnZid0UwYkgvbzR5?=
 =?utf-8?B?cEgrK29rTnVudzZaYnZYZ3pqZjVTL2kvYlROc3FET0JKbHJyb25wanF3N3pT?=
 =?utf-8?B?ckRsTDdnU0MwTFJ3M2NpVWJlYkhwZTg4Mk1CdVVwVjczRkJhU1ArQzljZFB2?=
 =?utf-8?B?VWltQWFNRkVEbEJFcG5UbTNtMUdZN2cwRTNyeng1Q1hNWml6blNvVUVVdS9s?=
 =?utf-8?B?UTZOQ05BNnl1cmdMOEt0b0NIUUR1aWxua2tZeXhobjZyNWthZFBxdzhLZmJE?=
 =?utf-8?B?ZGp0dG13bDNQTWR4MVlKQ3Zkbld4MWxKR0NVc0p2Rm8vZ1pEb01HK0ZGbUJr?=
 =?utf-8?B?VWl1V0swby9LYk9jNit6cXQwTWRIR280ejBEWlNtNFgyRGZWU21OdHV0K24r?=
 =?utf-8?B?akJaeGpiSnNXM0NqKzNSOU0yWHFTYjlMWnZVb3pySUovZnlidXlYWlNGTjR5?=
 =?utf-8?B?ME5ocXVIbVJPRnNXSWhJK2FFWlJCQVJZK1FjN1dsa1FrUCtGM2pTeFBNZENl?=
 =?utf-8?B?azY5VmFQOXgzZUlvSXpYVEJSeTBDbEhnOE52TmxSZHM2UDVaUVV5azZwZzRi?=
 =?utf-8?B?RklRTW1SSTh6b09VeEhsVVJ1Uy9WTWtRcDhRUTBGdXltMlREUHo2ditrcXhj?=
 =?utf-8?B?SDBubHA3UHlOblk5a29pa3BhSWt6SDU0N3F1RWNTb1lxZ1hzM3BLU2toS1cw?=
 =?utf-8?B?SXlWSkRFK1lGVVQ2M2EzdDlQVE5EeE14RU5kaTk2a0ZsRTFjYkoxRVg1YTdK?=
 =?utf-8?B?VHNmaGo3Qis0Ly9RRFRCdVpIMGZIVGdqQzZEa0tpZi9Db0tIVVpMd0JpODdB?=
 =?utf-8?B?dUZtS2RWNFptUDNHeXU5UnNzRkpPSThYeDREbXI3OHM5cmg3bHFPUVNzeThr?=
 =?utf-8?B?b3dwWlRXL0UyejhSaVdoWE9Yb3Q3U3AvbjA1eHBMLzY5ZGdhMXkrWmhzcEJM?=
 =?utf-8?B?ZDhuNmp1NnI2R2hWMzRwbmJNeUJ6cFMwMUtxa3FIcXR2RU9FcCtwYmlhQkFm?=
 =?utf-8?Q?HDL576taqeE/8Ioo=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45583133-02f3-45a0-95bd-08df2e0e82e1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:26:37.0702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Y6mIMX62aNy8kpE+cg7uUK/OHVTdFs/9zdK2qQ1Q9LWhGSWJqa7YNkLq1SOXsiC/J3TkeuQBJpaK05pj/ex6r70Qd5Q9l++O8cwQWmvK/M4F/SQqoy8m0pEadt2iAWe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11557

From: Frank Li <Frank.Li@nxp.com>

The eeti,exc3000 schema requires touchscreen-size-x and touchscreen-size-y
properties. Add them for the EXC80H84 touchscreen on the B155v2 board,
matching the 1366x768 resolution of the AUO G156XTN01 panel.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dtb: touchscreen@2a (eeti,exc80h84): 'touchscreen-size-x' is a required property
        from schema $id: http://devicetree.org/schemas/input/touchscreen/eeti,exc3000.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
index 7edc788bcb8f3..dd7b892cf0722 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
@@ -25,6 +25,8 @@ touchscreen@2a {
 		pinctrl-0 = <&pinctrl_q7_gpio0>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		touchscreen-size-x = <16384>;
+		touchscreen-size-y = <16384>;
 		touchscreen-inverted-x;
 		touchscreen-inverted-y;
 		reset-gpios = <&tca6424a 21 GPIO_ACTIVE_HIGH>;

-- 
2.43.0

