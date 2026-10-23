Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792784724;
	b=0Jwyes1XzpcR8eqIul5fqBmcur3FhOZeoqwQYZvSRj7EdGRuY2zTSbGM3yNtzwYYwLKb
	 FqzITpDzsxtrxSOHO/o+JrN4Ioqsmexz9zo7sbr+YQ5QhoOK0PBuo94mYVbA6Qtmp4tzB
	 RlhMH1HRE4ZVHD5oqHmPD8YTRtM5c6U35FKAK0cegclapzi/6JH9hA54ROTWOX/Qms/DO
	 8IM7MeSQDopnCTPdWb0E7XWaE6xnPNd1i3bUpHCkfc/TCPJFFL+7tLUSqSjiafqcTtrXo
	 TSHL6wEd/deUX6ZR9Kxldn5bpu0XGCEfPAwTiwqQiPB5mrVVahcXjY0GT5q0fBIykUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792784724;
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
	bh=Z/ZWdmQ8GEOJb+0klCIeUEDnYaMuh01Hk3jhdbjTLEE=;
	b=DArt9DNloqoV1fqCMq5cEuyV4fAFDbfDI05+Icur+wfmFzyJTcbE1XZEuFmQJJ+ItWDc
	 LY2iAfXRT7tmtgo161Rsn76o8mVJCijToKBTwTVyraCZMi7cmTlLonkfb2Exw2wzSjHeQ
	 a86VjIk98l+6JVjuvSMYd1BKfWup5KwgtdzB9zPJR/UW/76KmxkpaLb7bubz+Ky5HOFEq
	 TABAQ9RdP+wO/U31xnZNlmShfY0ElBXIYL+AacF3eKd1VnR7aZfLQ8uyPrG0JP1NPsrIe
	 an4/7wLr8zNG6kIHhe0AwZghzXU6hmIk8/KictoCCkmdy3LZRFGT0cixs+9d4aCKoVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=r94AJB31;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.34
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013034.outbound.protection.outlook.com [52.101.83.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955FD606A31A;
	Fri, 23 Oct 2026 19:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 955FD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=r94AJB31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bA4QhNr2J6WWcbrV2AV69av38Qi1fsE2iSrGi9bzxoA0gc8GlZHzT53D0z6r5WIM94FWO8kGzYur1qrRWivwjX5T8bssp5ijXoUVnqur1x2H6PzTR/ElevBaCuKeppXnitu+mw0Bhkti8/99z//HQDCYZqTYPscazk9rX0cXU3NhUYDogLtumFhiaIJCOcNzckf55mvRivyFEuehB9jaIlaoHuRLOENCLsLFae8W9U0oZUf7akPTRutYqtHYAgeKtMTBLlLLPO1THdpH8qhB9EU4bKB5fzuIWpw4HJXFeUbBsQAPb5Pnr8h495rkhxnD0BBh8aWpgCuxR7BNXHHJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/ZWdmQ8GEOJb+0klCIeUEDnYaMuh01Hk3jhdbjTLEE=;
 b=Or/p+tMBe9RS8ds8znTAPZ2j5MXXkVdzxqsobZ/36WA5oe5hgij18KlODQVlmV7qx3QjoJKuf6+MFMrEMve0L7hG0A6qZ96u0LGAqq6oTj1TPSP+rwbIx2OuxygDEOrjuvSBwT+4ROvIhFPAYRFsBeHK2ATFYe2dS1hLh6TPh6aYSwcc2AREGGf+YavBiLxyxXmaPLDs3TpSxmUpkbUKYL/UyelNNhbritAbVka+0Ds5kVp8MXHGRy/Njjn6rLxBdGIpt8oTEznVIMKyVXLaA4H0iIOwClrLEXk5zPgGlVfM0mC9u5HfEo4uBGmNzyJdr5V8ZO1YeJu01QMKifLJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/ZWdmQ8GEOJb+0klCIeUEDnYaMuh01Hk3jhdbjTLEE=;
 b=r94AJB31doiKCL7i2obBbQVCvf5LL1QwbDATigZeZ2geaQCpiiFiY68kDZvf2pJrxElZYJGyWWy9xg2x7DpizoJ0adZiHY1TvU9ZHw2o67gZZ6KGpf0xOPvyIcJtNygmSkHy0SIXwGHSWF0RshlK2D9XZccBoOMEA7rn/xhoBO/ZxGdKmahWuTfLJlyTLaQxb+p25/Xy1b7qrgacwtWKv1nKadxKiD0GwH59Q3Cyl9CaUn31TQpgZ6Kp1w3PReKlSKsOkITx/8wkEnhIF6fEvNz4QjIR6szL4YJFgqT3kXBSfoAvRbG7RmwNC4bCKBstAcZ21e3KHfxH0311pM3cZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 19:45:18 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 19:45:18 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v4 0/7] display: lcdif: imx: add display support for
 imx8dxl and imx8qxp
Date: Fri, 23 Oct 2026 15:45:08 -0400
Message-Id: <20261023-dxl_lcdif-v4-0-4ae8395a4b23@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEW522oC/1WN3Q6CIABGX8VxHQ0QMbrqPVpr/Jm0UgfGbM53D
 6wVXZ7tO+ebgTfOGg/2xQycCdbbvotANwVQreguBlodGRBEGKoRh3q6nW9K2wZqpqSWQnHSSBD
 3gzONndbW8fRm/5BXo8YUSIvW+rF3z/Us4LT7dDHNugFDBFnNsNgJVnEiD900bFV/B6kaSO5Vu
 Ueip0XN64oRVjLz75VfDyOCcq+MntCKUxrvDKY/b1mWFzTHhooiAQAA
X-Change-ID: 20260709-dxl_lcdif-d6cbdbac92fb
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Robert Chiras <robert.chiras@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792784713; l=2515;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Wj2vRIedjxsmqBUZn/ndaV+Oo6agHV5uPQBcVJNUg2Q=;
 b=+8tx2hW18ofOJNfciHw1nZU9GDY7erSARmmMk3hSPHaZFhrBCBD64MAjvzlfc97bXc5KWRQR8
 2YaU1dbhhQdBoZWHdqqI+7r75fAk4po4/tjtshd2hioH58F1zmbwshD
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:8:44f::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea5dd5e-7f3e-4f03-15a8-08df313e2a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|19092799006|366016|921020|56012099006|11063799006|261009223027099003|261021121427099003|10067099003|18002099003|261021123027099003|261022105027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DnlSv3n49JkNhVw308C2NKvHIHdFvjTDvPlYxall0PLItELoGZ1KcAHjxAwxIIX7aBLegvasJk2ZgvliZh7Hph+Z2JaCEuFgp9A8Z6MxQw3WagxRrcOF/+T9okzribsvgU/8ch9Ehk8jSD8dOJW/4a+MmjxIYDzoolyznrzuGW8cw3/MXk3ks981RRg/ZN0UmUVm4LHsayHBCQfzDbuSIwO6kSId1JoCKSeqb75rmbNrD614JU7DUqYDOdRJtDPy92D0byJr9yW3yc5PxON7WdJF6UYLNzg1ExxAadeR3lCZuor4B+xh2PQ15W2BnBRsfp9PJv89n6G26Dn29tXEhp9SJCn5FCaPexWE4QwpElaMP2krHCDQqpwaw4VFQE0Pua349KmWAuz5GGBSqG/4ULqYOb7pONIPPuNAm1p2Sod6Kt7QzwjInZAiidLG9FpbO0bR44Iv84MOcPHVGMhv7mIKbkr69tKR6cbR0BnDIpQYL5uKw2netr/Fm+9bHc1t512JEISgBGCdRmf/VVGR1jpvXO5ZTxhfNy8+iR10lpHYd29tuo/10g5Ch+OWSaiIRoQ7V5NPEzTy5dyhZ8wrSXEilkQwJBW0DXz+fci/EhdvJ5Wqdf1/p4XZwzFzWX/8tuWmLvhjoRbGnwXV3LhnEYEoysIQGPbTvH51nW51NqU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(19092799006)(366016)(921020)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(261021123027099003)(261022105027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnBtOVgvMzFhK29OS2pDRWJNTTlLZ3VJT0l2TVBBOXhJR2xEb1JnbGEvNzJw?=
 =?utf-8?B?djR0WkVFaE5FV1IyaHNNbjE5V3ZkVjFEQzg4NmhYdjBqUGQvMXo1c1ExbUk5?=
 =?utf-8?B?NEtOQ2pSNUFPam5IS1NpcmpIdndRYkM2VDZTYm9SRTVCOFBKR0dCZ0J3d1pH?=
 =?utf-8?B?SUxjSCs3eHI4NFN4TjR5ZVpqeFhOVWk3dVNwRUZtdndEbjJSdUVuSUljU1hC?=
 =?utf-8?B?TEhQTEtjeUlnYmNSVnMvUnQ1UFhwZEZ0K3BQK2taaHNXM2RjRnV3R0tNaUJO?=
 =?utf-8?B?MDdkWW9Cbzd2Q0E5L1dxdzV5cW16SmgzTWpwSDVyaUM0ZVg0Yjh6Z2xORzM4?=
 =?utf-8?B?UVJxTHVUeDdxM2NDTlZoampYbE4wWG5NbUxiZ1BNSjBtTyt4ODNyb3IvTG5T?=
 =?utf-8?B?eVowODQxbmQ1SkVMSG9WTSt5bU5xWWFvYUFETElBaGZCTUNiT29FNFF3RFJF?=
 =?utf-8?B?TUNmOVVWbWtscGpUMGt2V2VqdVJ5Z1FwZThod0gyYVVqcnN3SXoxZDFFbC9p?=
 =?utf-8?B?a21nOHduZEhJWTl6YmpJNlpjdmQybVBDVnVzdTgwV3lERG82bUNxMWFHajJR?=
 =?utf-8?B?c2NqN0VEb2pVclZ5MEcydlZMdUxwcnhjU3AyWHJQS1lqcWZDNCtPVjEyNkp6?=
 =?utf-8?B?a0Z0Rk9JS1d1UEd2N3VVa3ptUXdQcTFDbTNvR1RKUU01eVFZbjNVRktXc2V5?=
 =?utf-8?B?K2RGajc5MEtyNVpIV083QW4vajRBNktkTlNBWnVFc1NxL0xBbmJpRkxLc1Fk?=
 =?utf-8?B?MCtLR3NDRWw2WnlZWkJxM3M2NG5aVWRodGx6SG5mbGlxSWVDWWg2enhFS2FD?=
 =?utf-8?B?MW9SRk9Vc041ZkZScnhCTWpINysyMFR4UHV0cHdNekhDdFVvZDNpN0NvaDJ4?=
 =?utf-8?B?ZjFHMUYyVFduMklXK3V3V1VQSU1SSStkSFRjdHdiYlMydGduYTlhRWc1SjRC?=
 =?utf-8?B?T1dXWDhXcTBacHUxUmZvTGlWKzFCc2ViL05KZklEK1cxb1pwdE1DVHZvZXBO?=
 =?utf-8?B?YVVSbnp5UUJnY1hrQ0VydHVKZjFUdlpvUUJNeDhIM1VHdkptQ1hBREt3OWth?=
 =?utf-8?B?OEE5YlU5OUdJNy9UOFdNdENRTkkvL3Z2MmVYWVh0THQrdXNraSs0K1M5Z2hB?=
 =?utf-8?B?Um1NcDVwOXlSc2dzYUZpcktyUTZhQ3lMc0orTVcyaGZBWGdhYkplejFQMjdL?=
 =?utf-8?B?NWZpdmVEekluRXZWK00vOFBIUGtkTy8rUVNHd0NrNER1QW1yenhsci9pdU5k?=
 =?utf-8?B?RlN5M2t2RW4rMDdsQUFzNGFPOVBuUDJNZnF4ZHVJYjZUYUxLU0dhQWt1dGVr?=
 =?utf-8?B?T3A1cUpqYUpXeklsbEcvc1IwYW4vbFl4aTZZcVY2NXFnSjJ0K3lOSHZCYmJC?=
 =?utf-8?B?VHMyeC9pa2U1UnJ4c3dNZ2l0QWt3SVVZYmRlb1RzUE1NZlMwU3FrdEJKeU5W?=
 =?utf-8?B?K002bCt5bXdTbGZxclk5WkhxY2RKeFRlN20wRVUwU3VJWHR2WmhzcDdTOXBJ?=
 =?utf-8?B?TGpEM0NXd0V3dGphZ2RDbjA1VU5OTWtyL1MxaU1QY0hzRmdlMmNHZkxzREZq?=
 =?utf-8?B?ZWo5aFk2WEk1OTBsd3QvNU9lMmtXMnRXL1R4a09uOU9uQ3RNUXFKVUN2MTRx?=
 =?utf-8?B?VWNZbFd3QzZiSkFTTDF4VlJBcHE4NTVZMy9yUVM2MzVzcGtvcnZLdy90ejJa?=
 =?utf-8?B?ZGR5UGhTMHVFakMxNE9wNXhiWEFFd0c1OG5iZUdDaDlreURqMGNZZkVTYlpF?=
 =?utf-8?B?M283SmhRemx0TUR0YThlNEpTY3hVRFV6V1hSMmx6WWMrOEY1bEFiRi9xRFZv?=
 =?utf-8?B?TlJYakpEYUUyQWltLyt0b215SU1GT0RON01ZcnZKWHdUMWMweUFqRWNoVE5C?=
 =?utf-8?B?S1lKYllNbFZuc3E5eGIvci9mMWcyemdHVXNoelYzWnpxRjQvenNPZlRwRCtF?=
 =?utf-8?B?bzBhVGZwazJIR3VMMFNYZkpGZnUrOTBnMFk4bkg0b0dSYld1bWZLMStoL1E5?=
 =?utf-8?B?TTRqajZ2dVE3VWQ1VkQxQ1krVTJmNUJkMEZCOFVVU3hNbjVaNFlXZDFzaStq?=
 =?utf-8?B?eVQ2clFBclZodEdRY0FCeC9hN0dHcmpXck1LbEN6NmJjK2F2TU1GV3R1SXgy?=
 =?utf-8?B?QmRCeno5clowMFAyY3NBWFQ5di9lTDRxb1A4TDRjVzIwMTBmQ1BrU1ZJVlFv?=
 =?utf-8?B?dmQ4MVJyaEE4UmNTQUxZYytUM3BJR0t2ek5zZi9ZU3V0aWoxWW5wcXJCTTVw?=
 =?utf-8?B?WVVpMG8wMUMxOUpjZ1paLzd3dUZINkVsaTZTS0JyaDJqeS90b0ZaaktyVU5L?=
 =?utf-8?B?ZlFoMWg1VkhGeWRDUk1MbkdwNVBTVVpta05FeEFYMURoaDlkYjhkbHlGQXRU?=
 =?utf-8?Q?KMAk8cmu6BnnBnCP0oDfQXvyI1ry42kFFt3jx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea5dd5e-7f3e-4f03-15a8-08df313e2a7f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 19:45:18.1396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7UykcERlzyUooUHuA+pUiO+UieWcuMwEvnj6tLRMto+ONwTEUbfhoexgd+wmI3wz4ObGVmgRDm6b2Su5UxZn2OADS2MAA9eiSMsUkbQulxwSJGYa3qpKprM+3Z8m/Dq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

i.MX8DXL and i.MX8QX support LCDIF, which is compatible with i.MX6SX.

- Update lcdif binding doc to support front compatible string:
fsl,imxqxp-lcdif and fsl,imx8dxl-lcdif
- Update simple pannel binding doc and driver to support waiken,101wx001
- update chip dts to support lcdif ip
- add overlay file to enable lcd panel waiken,101wx001 and lcdif
- use onboard pinmux "pinctrl-multiplexer" for on board signal switch

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- collect kryz and liu ying's review tags
- add wct surfix
- add idle-state = <1> to mux-controller.
- Link to v3: https://patch.msgid.link/20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com

Changes in v3:
- add bus-width = <18>
- add lcd panel information at dtb file.
- detail see each patch's change log
- Link to v2: https://patch.msgid.link/20260715-dxl_lcdif-v2-0-da797562636e@nxp.com

Changes in v2 (fix sashiko reported problem):
- add power domain required for binding
- fix 136 height
- add acm patch to cleam MCL clock output pin
- remove iomux hog in overlay file
- Link to v1: https://patch.msgid.link/20260714-dxl_lcdif-v1-0-6761a8a6592b@nxp.com

---
Frank Li (7):
      dt-bindings: lcdif: add compatible string for i.MX8QXP and i.MX8DXL
      dt-bindings: display: simple: Add waiken,101wx001-wct
      drm/panel: simple: Add Waiken WKS101WX001-WCT panel support
      arm64: dts: imx8-ss-dma: Add lcdif support for i.MX8QXP and i.MX8DXL
      arm64: dts: imx8dxl-evk: Add onboard GPIO mux controller
      arm64: dts: imx8dxl-evk: Move ACM MCLK pin to ACM pinctrl
      arm64: dts: imx8dxl-evk: add lcdif overlay

 .../devicetree/bindings/display/fsl,lcdif.yaml     |   6 ++
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     |  29 +++++
 .../freescale/imx8dxl-evk-lcdif-101wx001-wct.dtso  | 119 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |  92 +++++++++++++---
 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi |  11 ++
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |   2 +
 drivers/gpu/drm/panel/panel-simple.c               |  31 ++++++
 10 files changed, 284 insertions(+), 13 deletions(-)
---
base-commit: c27e4587a73de339f2d9f1304c913413055ed408
change-id: 20260709-dxl_lcdif-d6cbdbac92fb

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

