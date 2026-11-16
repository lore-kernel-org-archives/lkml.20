Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799461;
	b=W3JwtpgIHE+aKyqhEGg9EDw2bY5W1FGKWrtWAeyAsa3wjpGFejBcSWlrTRFfMHsuMzO2
	 vTCDvqYI622pxfQJYngsWl7X7zHzr+ug9nhopxz0i8TmoH/ptTZVDUQyiDC11rURgqb10
	 GDu8yskZBoOoi/aG91yQogzmKLqr14TcUB3TpTLrz5d/5P+VYQMJgC1Gwt3jDrI4N6ZRB
	 15V3HKkzUjc1i50UQkQjqOAzjxsepn9W+LG6c5Tew4mytgmGJT8Jo+szSEvhz+s93g+fO
	 nZhN+WvWauqWgyVxhgqTGdrR0tTpHJKCDwKEcGuz9hXcUvSQLieXEzdxPJsldvZ1O4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799461;
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
	bh=x8Ug0kLVA1pgsG8CcOnQqZW0ynHuiK6cIIKzpXK7gao=;
	b=CYQOf94uz6O4urblZO0kKl7dAkEJD/vPxbx8bGx550Q0WPlYFalcIPpAV1AINRPyA3hm
	 ZGF+oRJALQtqGV2+M6JOoLaFIZqRCYh0eoxRGOgeWJp49g8w8nYL2KI+dYzT4u/hERiG8
	 mIYt1x69CUfYiizFX5WAP4v4v4NkEh2Dv2cO1JQyIHkZJCLyccYWKCD2pVfg2Nf1F79j7
	 66Lnaq5XqrYKhVNjuyDqih/94cmBhY9sdgdBKNRXIL/GFEUO4o8b2HDa0X9NzCOZdVpRt
	 KBNEjGsEVOHY4XljraMoSMRjplzQAwkS7Vgcxeby29kDDO972/YM29pWxiS3ioGaa2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Tb7uIVj1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.55
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56E9606A329;
	Mon, 16 Nov 2026 03:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C56E9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Tb7uIVj1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EED+c+wL+CWz4fgES56bQualUWPaeCObDvppvNlWThwgG7BTg6PL5R0zCs1hyvbdtRu4ElbShQXy+db3SdPyiGXe4rL8HqNN5Bx5S9MPL+/B8xtl3aOH5YtqR1AO+TsLIUnTX66LyHFJcAGeCxI7NVFkk+cGXUub9FA/rw+U97b8tRzmArZeUdVE/HPHOCToo5ux4S/zR8/RicKbVS96rb9spHCPDvb4QmOufgR0GWvklsxQfl61WZuv3fgsq78yQJEb23YNBhwyeYMZec8fm+BA+gQCkiXHYkCLlOgeA5WwG1Din2NlYdVsKk3GzZ1r/FEXWm8zgUaS5PPywr+b9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8Ug0kLVA1pgsG8CcOnQqZW0ynHuiK6cIIKzpXK7gao=;
 b=Wg+Obn5J6k2RyE2nGSaLewf3jjmSnhNcp8BSSe33AI8DPW6aqQTljzOgAevxXpN770KUizMI/OC6hiQMCOegFKkadjwBByOs+i8MkcwIU4Vrdxp9k/o2Gg/BfT2kMc4nYFnFV7wP9+QzrqzzdGRBDnTbBFtZmNKlepKYL/dmguFplDSi4cJjHh24Auoiz7VvUGg84uwkKve+mRMHSqyFJy8/jgMPRu0f6sXUlYpFXl0yjVJ7o/kkRyl1YuX0Q43OOu3qMTomjWQ48rB4L98lhLsizOQ6raHxkgi//qK1xZ6qNZ3gMsVMyQaTg1bgq4xeNALH04rPbgORn5H2SoE5hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8Ug0kLVA1pgsG8CcOnQqZW0ynHuiK6cIIKzpXK7gao=;
 b=Tb7uIVj1A3NWK331WDi6QHCsyqKFcTZDyxjGDcwI2BCSFnYpDoFyEUCkhwC3fO5okZIgeb6JZ1yuha0hVup4LmeW18hEF6NXXICOGrlarzbVo3jh7XXSey22CvynskvcnRkutYIlW9YJN8gBf72ME8FvRWeot11gasH0GMzf8YmtnHM+J/8p2ST8W08+J8w06ZsvYvyA/bphXn4s0IHEJiWptYmweUANfoV4cjsjF4d+l4gONXQ9j+L5ql99vMO3+PfvK0tv7SdKidMluh+F8ECHOaZmAk4SS+UduVe6YND7wglxd3391BeVK/TKayNC2jH7pCr5Ko+6CUbnzSXzRQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BR0PR04MB591767.eurprd04.prod.outlook.com (2603:10a6:2c8:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:24:16 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:24:16 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:28:26 +0800
Subject: [PATCH v5 08/11] media: imx8-isi: Exclude RAW10/12/14 output
 formats on i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-isi_imx952-v5-8-46de1d24efd4@oss.nxp.com>
References: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
In-Reply-To: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=7446;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=MbR84hTKJnfprWp9XxrgnoA1N6UyPaWCEd2l7/J9BEM=;
 b=Pw+TPD1srrAP8Be/FlqrS2Amz7QNqLRDiDgeEzJQwUpwHdPOA8GkYAtez7+ONHJkM8JUc3RcQ
 z6AxygmEim+Bb0KulPu5ViUhAiQBMPJvSxh7ibgOufVF4vXIB3T7x+B
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0043.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::12)
 To DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
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
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|BR0PR04MB591767:EE_
X-MS-Office365-Filtering-Correlation-Id: 853861c2-763d-4fa6-534b-08df439117fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|921020|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fPVOENBl6plD4ShYcO6sFEGJkogwxKOw6Ds6rKJSaiHSaDJJDdDfnT1YJbO3sHWJZeP3zSf3z2176Q3LLHRixhNnfzBdVMk7QMeC4DpeHGiyR350VVXurQY9tgQuRcyjg4cemiY9ApgxXK8tWarHGnT46x8jFa6mePTHCd9LKA3+06Lbr/MJnsqLkSuug5W+EJap1sxcAjwmVWRNKxNe2Ak3TW97xcfJh+JRAmr3CU/Y0qRGKPScJSkJX/F13nHVIQwAqBPGynSayohOhuKrhDlD0GQYzxhk0yyImDvoEUmUk6tBAmcuIE/bPOcaNVM/Ku0VGez/n6cmLUgwc/SoxRmBG9aym4Th8u7rOasoOSOaMwUorQk8foE0xlumaH1G3MSjQvt6aGnn5V/F6M6Q9fB/c0Z0PVJclbwXhDHU8HkC/Q3Dy2OFjsyzM6G1s0DlW7L51M3ORTmG7QZunDo7SVVsjRdD7u4taekrFRgwIVh9dSpFPgrj6FuvMYrQYlS89y4awigCHDSkMBKVBm9eTYaVl3qIofhJxQyvnncmcGsYU0YPhJIQCIR/VoUbJaeXLQ9060cQmdZnf5reTb1iDuC3aPaJYeK5ECvnoK2JHnkvHSgPKajTRTuiVTDGDdr2XGUlfxhm489gTuAGDPbyU4Y78MRRtnRSZuSE99PdJuxpV9YneQVV64n25RjJAJ4YXd9NLtk++KLUg3SlO1l0pA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(921020)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlRPbFBWMFRuTlRzeXp6eVlHeVRJR3hPRU1CUTNiTjV5NWRZMkY1bFhhdDZ0?=
 =?utf-8?B?VGl3UWxUV0JBT3NlNzNqdlNFWlRTM2tSQXN5dEt3SmxheUhRVytYa0xWSmxm?=
 =?utf-8?B?Qy9BQ3kyOTlnV3BCN2krR1UzS1ZTeGRKTUVWamJ5TktwbURQYmlXRTkwVHFG?=
 =?utf-8?B?NUUreDJMam1wb250b2tZOXF5cVlhWjBTUlJ0R1RDQmFsWE1uTGNmbS80TUo3?=
 =?utf-8?B?WHNpUmZVaTIyTnVoZFR0NE5VUXZwTlFES1JTVVNHRmVOQUZPZnEwVDl4a3E0?=
 =?utf-8?B?WWtSZGl6TElteDlmZUk5ZmVDY1kxQ2kwN2RrOUFMaE9Wc3JGeGdUNHhNNzk0?=
 =?utf-8?B?YWFlendFYjhjRHYrVC9ReGU4ZDdJVjZCS2J2WGEzRzlIQ293RzhmUXZreXAx?=
 =?utf-8?B?cE5oL3V0Kzl2Z1ZzcGs0ano3cHRtSDl4RlA0VnZOdyt1QmRCaWhiVEl0S1dz?=
 =?utf-8?B?TG9YNC9xUi95cXdiRVV6MXhna0JXNnRDZ2VNaks5ZTAvdWc5UEw1ZFFhYXhl?=
 =?utf-8?B?cjZ1bDZyYUlQWU9peE04S1duTUF6MkExdjNRZGdsQTRwcjVYbEluTENUcFVx?=
 =?utf-8?B?cUVwQTFTZndGMnpHZ1UybThieWRTQ1piVjNGOE9Ya0xtMEE0TlFVOEFZQmVl?=
 =?utf-8?B?bU4xamFUSG1DKzBBS2pNSjQ5NXpnMGRGUUNXSmVnQ3ZjWm1CTm1telhvRkFX?=
 =?utf-8?B?S252QlN4ZndkMldQVUt3MEQzNUtCM0V0d1R5Q1FTSDVDZ2tldUgxRFBzWEVY?=
 =?utf-8?B?WnRrYjJqZ2dOMHYzVUhuY3ltUEcxVC8yZ2sxVzd1WFU4VlBOQ2VWcThKU1BV?=
 =?utf-8?B?anBqV0ZsRjNnc29iSVFPZWV1dys4OWE1bmNzWGc2aVJXa3N6Y296SHFsZ0xW?=
 =?utf-8?B?eGtNUWJIb2dMQURxUStzRWFwOWIra29kdndYNG1aQlpMVHJaZnFvZE40aDJr?=
 =?utf-8?B?a2U0Z2xoUnFndVVHKzFQdzY3MnE0eXBmNThmemkyQnFhcWNFcVdqN2VLYlVp?=
 =?utf-8?B?N2hRVWsydVZRT2x0RUZlR3A5ai9GWXRVUXJkWE1tSkVMMVZacjdDOW5mSnRE?=
 =?utf-8?B?ZndFSmtnYVpKeVhHNmNPb2JhZVUvNjM2Y3hjTnVaaWpRYTlHK0hjcXBibjZh?=
 =?utf-8?B?b2pjUVBIVy8xYlU4WWZTeFFSUDFxeWo1Z0I4Y1hDQzNkTEFaZzZGTFNaOUdq?=
 =?utf-8?B?Q1N5dzNxYmNsVU9kZzhUL3hYR2xJdUVxdThyUmlUZnFPOWZxYldmREZVZDRL?=
 =?utf-8?B?SEU1VnVGbStMUE1ERjNkYmtpVjBiRG80VCtQOUtYZEZHbkhMZmw0Mmkra1VJ?=
 =?utf-8?B?TEltcEZmSk94QjlLbEhWWEpGS1NnSVk3ajU2dThJRmk5NGs4QkZvcjl5NE1G?=
 =?utf-8?B?OXpyQlVEWlpYL0xFc0VDTGdQa3p0WmN4bis1cndjYVVadUFrTGFLaEtpNThM?=
 =?utf-8?B?Skg3U0tNenFZZXNJRHQ5OER4cHQzZVVjR2lLcXZHTjNLTGpMUzBRUjl3QTFO?=
 =?utf-8?B?U3g3dE8yNHlDUXIyNi9tYzdHNU92VUZuS1NaWjZpWkFBK2VUVjk0ZC9BN2JO?=
 =?utf-8?B?TGU4YzMzdzZlelRRc2RFODRwbWZZMExpeFUvd3RvL2JGNUhrV1RoeVNFNHps?=
 =?utf-8?B?dDRMSVVraEQ0YkFHbU5mc3djMEhqUlV3VUpNRFAzQmFGRk4xeXUvUjF2Z2lQ?=
 =?utf-8?B?bWc2c2tvUzllOUJXZ3Flam1vVkdCN09qVGJMQ2hyMFJxUEdQQVNTTmNUNGs4?=
 =?utf-8?B?alFoZlRoeHB3MUoyaThRTTRQU3p5bVFTUktrRUhYNWV1SjdOTHk5OTZpcTJR?=
 =?utf-8?B?M29qUUZQK1BvNllRMzFOUnpkK3dPWThYaDVMaDdMN0VNMUF2eFgrS3JveVlv?=
 =?utf-8?B?ek9pbzNSS1luSk1CeGlXSkNIbGpSNEpGQnJveXNIWDJDZFk1dlhteTZ4ZWR0?=
 =?utf-8?B?cHVvNjJXQkVFUHpabkRPcVIzUEFRMG1XaFVld1BmQTdVV0VyQ3QvSXgxQk1O?=
 =?utf-8?B?YVNrWVRLUXZBN3g2UFFZejduZUFzZTRaUEZhcUxSemJLZjJQay9aNmFSeXVI?=
 =?utf-8?B?blU0cyttOTN2Zm8zMk9vWmFjQmJyK1lLa0xHL1RsYTVSa09SRUkvQjRxemU2?=
 =?utf-8?B?eTYyVG8rbUtVRXhNOHJNdzBJWFJjeFB3NkVzM20waGxBaUM5WjlUWCs1bXA5?=
 =?utf-8?B?c292c0t1ZU1vcWxuQVRrMEVCTnFudDFpR3piaTVzNnVURW82RHFrSkV5OVJr?=
 =?utf-8?B?VGxiZHVjZFkrK1VmeWI1NzR2eTJzYzY1TEJxMFJVK2tkamRHNFNlT3RUM3ZV?=
 =?utf-8?B?cDVUaHU1dUNqTjlYTTRZbFhCY3RGcUJnTnRDZEcranpidnEvTE9MQXl5MnVY?=
 =?utf-8?Q?BYbNJKLWoAan3FMG7H1RB3UHzgFwbSd+hyCdf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853861c2-763d-4fa6-534b-08df439117fd
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:24:16.3409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfK02Zq9NJ6/jcpiw7sr8dCKKpBCBIgdXQiCR42bAM38BujvWTg3mvz1J21+uYaZUM43bKZAztq22vpY0Ko6QmFtyX0KkPHsChe/R7/ccgAbU6Vaen06wSt5rlrSpmUt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB591767

On i.MX95, the CSI formatter provides MSB-aligned RAW data to the ISI
via the Pixel Link. The RAW16 passthrough that older platforms use to
produce LSB-aligned output now passes through MSB-aligned data instead,
so it no longer produces correct V4L2-compatible output. Exclude
RAW10/12/14 from format enumeration on i.MX95.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- New patch
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  6 ++--
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  2 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 10 +++---
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 38 ++++++++++++++++++----
 4 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index a30633a7e2e9..ba0d6df98fd4 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -320,9 +320,11 @@ mxc_isi_bus_format_by_code(u32 code, unsigned int pad);
 const struct mxc_isi_bus_format_info *
 mxc_isi_bus_format_by_index(unsigned int index, unsigned int pad);
 const struct mxc_isi_format_info *
-mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type);
+mxc_isi_format_by_fourcc(const struct mxc_isi_plat_data *pdata, u32 fourcc,
+			 enum mxc_isi_video_type type);
 const struct mxc_isi_format_info *
-mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
+mxc_isi_format_enum(const struct mxc_isi_plat_data *pdata,
+		    const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
 const struct mxc_isi_format_info *
 mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix,
 		   enum mxc_isi_video_type type);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 1178947bb548..1ad0fd1af3b1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -492,7 +492,7 @@ static int mxc_isi_m2m_enum_fmt_vid(struct file *file, void *fh,
 		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
 	const struct mxc_isi_format_info *info;
 
-	info = mxc_isi_format_enum(f, type);
+	info = mxc_isi_format_enum(NULL, f, type);
 	if (!info)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 35438abf3172..b83a25a58ebe 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -425,11 +425,11 @@
 #define CHNL_IN_BUF_XTND_ADDR					0x00b8
 
 /*
- * The ISI shifts the 10-bit and 12-bit RAW formats left by 6 and 4 bits when
- * using CHNL_IMG_CTRL_FORMAT_RAW10 or CHNL_IMG_CTRL_FORMAT_RAW12 respectively,
- * to align the bits to the left and pad with zeros in the LSBs. The
- * corresponding V4L2 formats are however right-aligned, so
- * CHNL_IMG_CTRL_FORMAT_RAW16 must be used to avoid the left shift.
+ * The ISI shifts the 10/12/14-bit RAW formats left to MSB-align the output.
+ * On platforms where the Pixel Link provides LSB-aligned data, the RAW16
+ * passthrough must be used instead to preserve LSB alignment. On platforms
+ * where the Pixel Link provides MSB-aligned data (i.MX95), these formats
+ * cannot produce correct V4L2-compatible output and must be excluded.
  */
 static inline bool isi_out_raw_shifted(u32 format)
 {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index ca8fe8782af8..708aa4c775c7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -458,14 +458,32 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 	}
 };
 
+/*
+ * On i.MX95, the Pixel Link provides MSB-aligned RAW data, so neither the
+ * RAW16 passthrough nor the native RAW10/12/14 output formats can produce
+ * correct V4L2-compatible LSB-aligned output. Exclude these formats.
+ */
+static bool
+mxc_isi_format_is_raw_unsupported(const struct mxc_isi_plat_data *pdata,
+				  const struct mxc_isi_format_info *fmt)
+{
+	return pdata && pdata->model == MXC_ISI_IMX95 &&
+	       isi_out_raw_shifted(fmt->isi_out_format);
+}
+
 const struct mxc_isi_format_info *
-mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
+mxc_isi_format_by_fourcc(const struct mxc_isi_plat_data *pdata, u32 fourcc,
+			 enum mxc_isi_video_type type)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
 		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
 
+		/* Skip formats unsupported by the platform. */
+		if (mxc_isi_format_is_raw_unsupported(pdata, fmt))
+			continue;
+
 		if (fmt->fourcc == fourcc && fmt->type & type)
 			return fmt;
 	}
@@ -474,7 +492,8 @@ mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
 }
 
 const struct mxc_isi_format_info *
-mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
+mxc_isi_format_enum(const struct mxc_isi_plat_data *pdata,
+		    const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
 {
 	unsigned int index = f->index;
 	unsigned int i;
@@ -482,6 +501,10 @@ mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
 	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
 		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
 
+		/* Skip formats unsupported by the platform. */
+		if (mxc_isi_format_is_raw_unsupported(pdata, fmt))
+			continue;
+
 		if (f->mbus_code && fmt->mbus_code != f->mbus_code)
 			continue;
 
@@ -509,7 +532,7 @@ mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix
 		  ? MXC_ISI_MAX_WIDTH_UNCHAINED
 		  : MXC_ISI_MAX_WIDTH_CHAINED;
 
-	fmt = mxc_isi_format_by_fourcc(pix->pixelformat, type);
+	fmt = mxc_isi_format_by_fourcc(pipe->isi->pdata, pix->pixelformat, type);
 	if (!fmt)
 		fmt = &mxc_isi_formats[0];
 
@@ -803,7 +826,8 @@ static int mxc_isi_video_validate_format(struct mxc_isi_video *video)
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	info = mxc_isi_format_by_fourcc(video->pix.pixelformat,
+	info = mxc_isi_format_by_fourcc(video->pipe->isi->pdata,
+					video->pix.pixelformat,
 					MXC_ISI_VIDEO_CAP);
 	format = v4l2_subdev_state_get_format(state, MXC_ISI_PIPE_PAD_SOURCE);
 
@@ -1222,9 +1246,10 @@ static int mxc_isi_video_querycap(struct file *file, void *priv,
 static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
 				  struct v4l2_fmtdesc *f)
 {
+	struct mxc_isi_video *video = video_drvdata(file);
 	const struct mxc_isi_format_info *fmt;
 
-	fmt = mxc_isi_format_enum(f, MXC_ISI_VIDEO_CAP);
+	fmt = mxc_isi_format_enum(video->pipe->isi->pdata, f, MXC_ISI_VIDEO_CAP);
 	if (!fmt)
 		return -EINVAL;
 
@@ -1281,7 +1306,8 @@ static int mxc_isi_video_enum_framesizes(struct file *file, void *priv,
 	if (fsize->index)
 		return -EINVAL;
 
-	info = mxc_isi_format_by_fourcc(fsize->pixel_format, MXC_ISI_VIDEO_CAP);
+	info = mxc_isi_format_by_fourcc(video->pipe->isi->pdata,
+					fsize->pixel_format, MXC_ISI_VIDEO_CAP);
 	if (!info)
 		return -EINVAL;
 

-- 
2.34.1

