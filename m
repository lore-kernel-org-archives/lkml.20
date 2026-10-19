Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434387;
	b=kbNyU9i4NIeVvQc7vVPm8GPv301YEJaTJQBVgPY7CbZZzIKhigWwAMVHT4EQPcwSlKWo
	 D9DHs5iNiAZ5xuyK5DoOAQH2lEeuoRnM5AYTZH4i2a1AFSzHHNLE04n1uA/DrvRW6UH4Z
	 GJAR7mhstXNb39jFQDjzQzOk6VQjxX+UNCFsFM3fHaaO1CcbRtdkLt034OSQoMMjCnjQZ
	 CZQUQtZWo124nBZdIw1RB870tlIsJ06s8r4YNxNmNq0Ymmml3tyo53f63UcbaVhabCQKI
	 1upohEz0O5iffEePgKxJ7fqSaJBRPGk9DA+xDLVVqChU+VqZaVy0NLnNwWNT7I14wmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434387;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
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
	bh=EMHQ+eucC1bd+VJfDAFzm/dbmXijFfhu4Dx6dG5i99M=;
	b=Jvj8eqBZmhm4UYrRrsKYdNkWPJjkpd+1LtN0l7nwU3Bo67mv1ktr7KH5c5Q6anYJLl5C
	 TnpwKjW71unAUxUd0siQJ/qxsjUPR1eLFz7IHKGsVAYhvCgcbHXU+9kDqE/gvulTOCoD+
	 1WBKYrf+2i2A4F2mbXyntdUoYcugvKL1zMS4X7GM5QmKA5gT9tYZqEUTUz3abuq1AMb86
	 4C/gl5ns5KowdmGw3lDlOzAognsJXB4qgiE3FP5qkkJ4sXH/sX63UpLIAeCEWyHErfj/1
	 EQxJyoFNGwyXVumgZCH6IrJM6aKLEPI+TiYrLac9XO2bgf32JAEFV/HZa1ecdw6Zfiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LeyGUvl5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.35
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42015606A324;
	Mon, 19 Oct 2026 18:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42015606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LeyGUvl5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/tIw4rmVoipwwMvtAgsguY1mucxY/ItEwJ7fTMl4OJCLj8ZACkubarld/XvKM0EsPR301451gFq2TieDOP+McD9/U9QCK0GP/paf8dWxWCnavhCyBvgUgBE2heWI/CYPFJvYadE+HpFgtTSGxwetqoxHOZtA3OkK5buLYaaxG8ocRIlbwOWErJXUbw0B/u/949Sof/v6tpZaVYFvGnfU7H2iIe8goS2kCKW3z+voghsdhLx9Lfskx/iC61QQA5t6aZwvl28gvgXYu5PeBW+YresENKQPjD6H6Zz9gkZhjGiEgDtpVUJDTketrr15cQrxkbnLU49arBr3AXkDDIU0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMHQ+eucC1bd+VJfDAFzm/dbmXijFfhu4Dx6dG5i99M=;
 b=Yl83HTk8kburdo78AOibYOkZqVpYzk5ArBQX34gmR3ZR9ScmFoejUvo3O/jr2Waa6aIr0GuLrV+Ku+Qb15CGUdp2kuvpMCiXc/E2mmLA1VCgQqUcg6eqkxOm2yR06Bhs/xwSNsGNeyOtTVH3SBBcGyzQqBtjBtfffbs02LvlKmgYv0FqwphSamQpIhCy/rDbCV2GZuFgDmQlKGaRunBuUT5TP1oSFH392/h8+O9v0HP0MqSWgtGnpLkRzV2SbZBmkIe8Os5COuz7Tn7NGM2jDSogHbzb8hRX9QfAC2qLcJA7BNpF7Qz3zXH8u5QrskRnUer4gOj7DqXUw6GQbyrIQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMHQ+eucC1bd+VJfDAFzm/dbmXijFfhu4Dx6dG5i99M=;
 b=LeyGUvl5LX4IEs4S8O/capAPAfyv8MG1Whnv9WBTAmHyyBmLeMYcCprkI5mJnhcBt/txQH9m0DSCLvFe0fyOi5rxQnpNglvd0WKKL4Md+P5KTO1NMKDmHgeDKN+oBLMZ1eNbAphhowoAtaeOKs5y4c+a0ZPXUtUsN91oA5UbW/NVmV5dpX5REjzzVRMaxFPyyRAXuy/WtdFGpA4olzoC4EvXfsW1ktx/XuQAwLoUnIOAqINVexghqyo/mVJunIEj2cpNKHr7dCusDZW2aDYvdvJ/FZp46uOzOfk4vdJOtPfmKXiukMplHxYa1oOtcumCpvtSCVEIr4Hnb8bCufaQ4A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11557.eurprd04.prod.outlook.com (2603:10a6:10:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Mon, 19 Oct
 2026 18:26:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:26:24 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v2 00/13] ARM: dts: imx: cleanup some CHECK_DTBS warnings
Date: Mon, 19 Oct 2026 14:26:15 -0400
Message-Id: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMdg1moC/32NwQ6CMBAFf4Xs2Zq2KiIn/8MQsrRbqZFCWiAY0
 n+X4t3jJPPmrRDIWwpQZit4mm2wvdtAHjJQLbonMas3BsllLrjIGfqu1mOo1ZvQTYNkZHSRozR
 4kRq22eDJ2GVPPqofh6l5kRpTJxmtDWPvP/vnLJL3Jz8LxtkJucLmZvS1ON/dMhxV30EVY/wC9
 fHlPcAAAAA=
X-Change-ID: 20261016-arm_dts_cleanup2-efd86a2fa52d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=2366;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jdDe9Pg0rJ4g236kqJqe5dcYgRY//pbJpgO9u0FB7aU=;
 b=Ta8XeFwpZETdH3WRy0aZzcdBkRTkC75QLCI622XUdsoVhLTMf+Vq2HCttYp0ihEA6g/q7q6eE
 PFJ/hOBTF8hB6ZeA/uW3nmYrUr0FE/Rx3AHzukj5h9a6d8TC6Ip6+HS
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 0d38b3e9-1fa4-48f4-dc6b-08df2e0e7aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|23010399003|18002099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	naY8nhh2p79m3SSGyDrA5Zt8wpfXXlUuBIxiB+WKXjDryaxqhW5CW3mCLURry676pn64kHYJOLit2LBTZp+RjLkuWheK/gDI4bkWUPTOIUU30YnDTiNExYEPwCA1mSKHGVUzbuzCd1k/nM6WbLXz5+nV2CV/GhdN0Jj5DsicWhLilL0Bt6jH94vf7tXp7duOx6aYSS7FJdI55xjqKRn19QwX9WWEWXMmKdlwB//CPLdCqKLYc9d8Cs7JaYqesKW3dkoBmOqVPkDj7NCc6C6tFNOJ6Jn4gWaciSdovpJVgYQkV9NTQwESVGhUK4AauyMs1FCbOeMcrJZzCvfX60p1GPRqKGu5O4M3cvD6KfTjb1tlTtzOypSyPbRbE37wQIwCMWcP4DWxdiAEK9icrgegz+epGjZhzwQanraOWy3D5fOLbsToZNpzyOedCls4Wl4ovAuJc4wJGiXbDshGPcYmo/fdrDpFfXSH9S/k+UESDSvO4Dzd/SDc+5qSxHlo4VjSqSBPLW9awg6PMMscFjLmFTJvYSQCWKxCy6riyPasSI4bBp2n8wZkbCplWNgoWNrnpXW9EarWqigzxev5FTfcKj4/1P6Jdsafp55SCUxLLGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(23010399003)(18002099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1g4L3pqYmZOcFBoK0V5U0NlWllrb3d0clVRdU1Ib2VZam5JcVJ0YW5zd3Ux?=
 =?utf-8?B?TzR4dk8vMHhZN1ZSYjVYKzEwdTVJUkNCaVQ2QitxcjVJZmZseWZTc2hpU1p1?=
 =?utf-8?B?SitFTzlSZ3F1a1hRMFBGb25ucEtwdUl2U1haSUJxTVJFUThPT3k4eVowZWRD?=
 =?utf-8?B?WWVlbHA2MmJnbmZlVUtXTStwUGZCTnVnSWpSYWEyUWNPQnZ6WE1RVDRwZU15?=
 =?utf-8?B?YWwxZ2I0ZW9hUWVWK05YMHBxczlxS3N2U1pQT3U0RFFncU40RVFMOTM4MkZW?=
 =?utf-8?B?a2x4bElvRWFCdGRWM0hPOUlBayt6RlpkVlFUVStNcEZ4bFFSaFpZVHpWSmRu?=
 =?utf-8?B?ZWFZdXRRWWxlVTBmMGNIei9CZnRzbnBKWHlISHlVV1RvenJjcXdKcEVQSUxK?=
 =?utf-8?B?citORmVuNHptQ25uWFpIamV6bjNOWlE3aWRMYjA2NGlOQVY4Lzc2ZnJ0dXov?=
 =?utf-8?B?NkM0N1A0R21nNnA3Z2dDbHlXSW1sSml1VXdMTmVlZGZqdTJod2k4cGRTS3dC?=
 =?utf-8?B?a0Jvd09YMkV0T0tSeWFlQ0ZBRHRwS1FwdVpFaUNLUi80YTJOaVc3eW4xR1Bx?=
 =?utf-8?B?OXRDc2NyU3A1UFA0aGd5NzF5K0hqRHIySkNYdnUzVVc0N2ZpWllGSzJCVUJH?=
 =?utf-8?B?OVRwbFVVN1hQVnVmYlBZcE5jcnplZThBQm5UaGc4WjNmOHNMd0lMdG1vSXlv?=
 =?utf-8?B?VzlYak5SeERQVzlmclBremtUMEJvYXRZUE9hR28wVnkxMHJFR3JpVGhFQkNv?=
 =?utf-8?B?d0NuZ0ZLd0RjK3JlbU1EUzVnTE5ZbEczTFV1cGhzTS85UkxYWCtlY2JEbHZu?=
 =?utf-8?B?clUzTHJyem5idW5WZ2V0eEhoSjRBUHRCb3hsY0VQWi9ZR2QzcHJ5SVdab2xC?=
 =?utf-8?B?UmhFQitZQkNKM083L1MxdmxoT2UwdGR1TTNXL2xlejFmd3ovT1FYditiQWpE?=
 =?utf-8?B?ejk4bSs5amZaMlJ6emRtSVQ1Ym9NZHBXbFh6MUxrNDIzdS9pWERKbEQ5dm5s?=
 =?utf-8?B?L3RBS0tORngwbnhJZ1ArSTRJSUhkNjJhM3N3aEFsNEIvdjUvV3lKNVliTkdZ?=
 =?utf-8?B?YXgycTBnNURGenNUbWoydVhxUUN2VVk2MW16UDlGbUhHMHFmVjBLSEhDbUpX?=
 =?utf-8?B?Qy8ycEY4RjlmOVU5MXRoSGF1aDRzSnV5NmdmMHgzR1VWZEtpcDYwT1VoVHJX?=
 =?utf-8?B?emFlQkJJY1o2L1E1WEUySy9qZkFXUktnUEJPV1pkWWJES0I5aTY5MTlEUi9U?=
 =?utf-8?B?RFJyQkdiZFJvZlFibkVHTWMrV0RwTk5Dd01GOVF3YkFySFZzZzM0Tk9hb05D?=
 =?utf-8?B?b0dBTGZKOWlhSDcvK1lRQkZMRHJNUWtqeTlhRktVSy9VeHVWTWxXSEJGRXNv?=
 =?utf-8?B?MGFWMkN1eE1xNFBwd3ZrMnN2bzViZ0pTb3hDSFo2RzZqYjdKSEtEQlgwV0tU?=
 =?utf-8?B?cTczSFBmcmhjZVRGdlRHREkyY3Jvc29HZGZJK2c2QnF0VlJoMkJnY0RsVGFp?=
 =?utf-8?B?NXgvTWRlNHlQQ3Y1TWdQVlNERG1UbTI5QXVlODdWTWVMY3FBSUMvYmVkcDZO?=
 =?utf-8?B?cjRyQ0hMNXdVaUdIMnY5dVkrTGNTOEUvcXpPOFVDd1A5Rlc2aytuZ0Rhbngr?=
 =?utf-8?B?V1BpOWFhdXNZVFlNR0NRbXplV0lGUmFndFNDaXBxRE4rYnJXVWFXWFN2eFIr?=
 =?utf-8?B?ZEwvRWExZUk3R2NBQ0thWnFrU3BMbDRLZUkvLzB6dXgvdHhlQ0RDK1M3dHVl?=
 =?utf-8?B?UFMvOHAwdDVPL255allDVHZoRVFhRWtjSHNMYkpRQjJUNGxUeEMrbUgwK085?=
 =?utf-8?B?SHRYRzdWa281NGJ6czh4NWdEcmZ2cnQwUW1lWjB0RHd4cDZibjBhTGptUTFw?=
 =?utf-8?B?UWpSL3BNb1FiSkRUQ1FaUG4zZTVUNUlaWDdWc3paL2tyOWd0blBOam1GQ0dU?=
 =?utf-8?B?NHFGMytzZTNtTVlDaE9aS1ZjUFdCRFJtU0JFRXVneXkwdkkyMGhPM0dKUjhz?=
 =?utf-8?B?bGE3SkhEcWo2Qy94bFZrTmNldTJuS1MvdS85UXo4ZHJ0SXA4Zi9veTdTbUZq?=
 =?utf-8?B?MTRzQ1JKenZURE1KR0ZmTFdoZGl0WXBtaG5pQk5FS3k3WFFieHl3bXVzRXQ4?=
 =?utf-8?B?YWNPaVc0Z1Vjc1BxbFZWOW0wd29uTC9PejBoazhKMHlDTzZXNUR5YzV3VEI2?=
 =?utf-8?B?cWNYbGE3U1p6NGRkdjNTSXV2eExYelFKaFBQTjdrR3ovZkxocDdzR29PRENT?=
 =?utf-8?B?SXVhRW9JMHFLYUNiZ2xIYmdXZ0ZFbjNqZ1JIOHNsWXhUMFY3ZGdXekFHcFVo?=
 =?utf-8?B?MHFyWTNxUjBUOWQvWFpocHBDRGxjU3dOZ2UzeHdWWkRMbWp0a2hJMGJPUk1I?=
 =?utf-8?Q?YRIpM2SKXynXGKHg645y1exm9l5UPsDUpNrzm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d38b3e9-1fa4-48f4-dc6b-08df2e0e7aef
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:26:23.8257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzdWSOoZk0tMzOli3TANpjAp3JQrLy5uG0XnYdSI04C7SL283Bzor7YPzLotGWpDDyeF0t+yVH3V0Zl8l3n/jBlA9xJrzQynvTmtkbmVxEniWK+3f1GuYce26RmBWyB1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11557

cleanup more CHECK_DTBS warnings.
less than 90 line warns left, from 267 line.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- drop patch ARM: dts: imx6qdl-apalis: remove disabled node "panel-lvds"
- use /delete-property/ pinctrl-0; (sashikio)
- set touchscreen-size-x to 16384 (sashikio)
- Link to v1: https://patch.msgid.link/20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com

---
Frank Li (13):
      ARM: dts: imx6q-dms-ba16: remove undocumented property fsl,receive-dpll-mode
      ARM: dts: imx50-amazon-yoshi: remove undocument property min-frequency
      ARM: dts: imx6dl-b155v2: add touchscreen size properties
      ARM: dts: imx6q-gw5400-a: fix SPI NOR flash vendor prefix
      ARM: dts: imx6dl-prtmvt: remove redundant panel compatible fallback
      ARM: dts: imx53-smd: change compatible string to dlg,da9053-aa
      ARM: dts: imx6qdl-savageboard: remove undocument avic,tm097tdh02
      ARM: dts: imx6ul-tx6ul: remove front compatible string karo,imx6ul-tx6ul-sgtl5000
      ARM: dts: imx6qdl-tx6-mb7: remove redundant pixelclk-active for simple panel
      ARM: dts: imx6q-h100: rename port to port@0 for mipi_csi
      ARM: dts: imx6qdl-sabrelite: fix typo vync-active
      ARM: dts: imx6q-novena: use interrupts replace irq-gpio
      ARM: dts: imx6sx-sdb-mqs: remove pinctrl-0 and pinctrl-names

 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts   | 1 -
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts        | 2 ++
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts       | 1 -
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts           | 4 +++-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts         | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi     | 3 ---
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts       | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        | 3 +--
 13 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: 573f14ce666583abc3a87c855e27cd78252195e7
change-id: 20261016-arm_dts_cleanup2-efd86a2fa52d

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

