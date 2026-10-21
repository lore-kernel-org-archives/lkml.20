Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792573401;
	b=r9ZEVsuOZFlk5XD80bryDs70mJ2ZPe6gXOKGI0OZelbq233k5F2UCRSX5aBrtCjQs1Kt
	 jvGYWkZinUBW3DZAip8J15I/GS/HHHtHADu4acGcdUiGwQpacZ2seqaWsdSFWM9SZiJ3Y
	 AK0HFbx/kECDEzw4QZ5AeJeX9PpCI+n759VYKKH6cemerl+LEm0pnY/2m6gaBQAmfw7xT
	 B7OvJ0BqdDXnQcDafMFn8Cva8l7OQ+DYtIC8D5JmN1gri7mtJTw5zN0I840gJwGGJ4F/r
	 OTgAiineTT5vD5ekYadRhYApxcHbu0LvoLCejjujif3K7l9PzGXdr+e0v2DSwSo81Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573401;
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
	bh=hruwcTtAP2uELqKOn3lcx/65GNiUMUcA+hLMTLAdsAk=;
	b=awRB+3hi6ZPiaXb0WNlsIlwaylnQrBy9tAmgp4m5KE/ICsRSnCAZakysvZdIbUsV2uYj
	 YeTykGx9/MkgLUkkQCNcV9N9icAP6Md7xN4c45y0zfkmqO/Zf5zRagwYAiWFqAvt6fKTH
	 y9chpml1F60MIJk3H1XRji8d1vt0I7Bk6gDLKJW13bPjfsyoS+QaaCXodBs3jCiKSt1YZ
	 jco7RVKwFG4s80pFI8xmyhJWIZ7SJ2dzlyCvZ+RA/yPpAg9inlC23OWBEb1hHpRr4n+Rj
	 F9Qjj8Bkx/agIkAhASYRTVjc9uGP7rXQ4rZSnqkvHR0zmfici8HhY+C/9canOCYMjKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yI1+xZe6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.23
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010023.outbound.protection.outlook.com [52.101.69.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE2606A319;
	Wed, 21 Oct 2026 09:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75BE2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yI1+xZe6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjrGrWo4d1miEUZLT2IdOirGSFPdgoqQg013LzWJfw6KSY31FCBO1VsLjb28l6RourgzVuN286g+UQPpmDQVzYSbcDcicq+R1ztnlVsPbtyLVIYsEe199uu21bH4TSr1V9eyi6JNh5FFixpbvhN3ycWv6rwpkknKFDcoIgNcoZ5TLuhx+ZSlXsTXxRMk+q+B9Bw7piqprXgCme/C559vgESvls5anwAECpkPiw6W5RT7JIXUqPAXXcYnG51Oh+3dIKh+u43IwZhb43zO2AJDBgwk+hOyffjyKcEnWtztC+/rThs3bTeOR4OUg/+A+deoIeKTN6Em9b7M6sgCO2hdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hruwcTtAP2uELqKOn3lcx/65GNiUMUcA+hLMTLAdsAk=;
 b=g8aQjafVJWZ7riLdm9WwvYH6wpJQn/yoORpKrIcYcxPn8yracFCOmXSFZyx8/GOnvBiY0JWiNJpgCGK3GPWu+d4dk5ldCIwzGd+psztHMQnK9YX47ct+W/tWvGCA3fKOcKIrjhYW3TPvJkYulRMtSPGWEh1sQZvm1X4R0wff3oBhVyq5zYJX/Vb2cJJBBE3RElYj5pNfJvUuSuhuIDxhqQreYW58K+FZI4LhVLkXwjSieKZ6qK5q5mS+oHnoRo40T7KPPeorYuilw1oT9C2PJGPIP989eE0nlLhKKoScO9P3N96w9XxbNwDuOYco4YPdtW3mDt915rs+lEk9oGsPyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hruwcTtAP2uELqKOn3lcx/65GNiUMUcA+hLMTLAdsAk=;
 b=yI1+xZe6oSZlRi4bd8I1YWcHtSSonNxOvrpOWM4UZlA5HW6pPdYBy/wi/1hakyE2ph1SNp71S9caym+JD/iC6bVUO4+e0zXMr8+UXfzrLiRgQl5/dwpAmgCXkVIWdijD38J2Z90smuDFkLTWg8+/ibdHfV37byRzb2oHlBImEB74z+uH9gIwxEr5duM7767WhavW8zPCY1Hf+bDivs32tSFwOYd5N160vtbTvdLeoED9pmtEYApRDzlHiIU/KinJsbSjTqxI4QVmYk3bGzumz6MOykrZdBQ2tDIpjRYCU2A5oduruEI4bK+T4xIuDG5mI4Lv2YeUESUVEdKctIiIHQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AS8PR04MB7960.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 09:03:05 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 09:03:05 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Date: Wed, 21 Oct 2026 17:04:24 +0800
Subject: [PATCH 3/3] arm64: dts: imx8mp: Move board Root Port children
 under &pcie0_port0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-imx-pcie-rp-stale-nodes-v1-3-db6590e972b6@nxp.com>
References: <20261021-imx-pcie-rp-stale-nodes-v1-0-db6590e972b6@nxp.com>
In-Reply-To: <20261021-imx-pcie-rp-stale-nodes-v1-0-db6590e972b6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sherry.sun@nxp.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573508; l=6396;
 i=sherry.sun@nxp.com; s=20260723; h=from:subject:message-id;
 bh=BpA7og3KZpXb/zf11CT55anvBy9XlLtbQrHNsmZoqW4=;
 b=NTqxXW4M17QmADnava5HmgmgDsURBHwL3NVpaAu1lWRB1QGmROw6Mt4yiuzPQsXntBpeF1fBK
 UlhxySujBwpBEwAhyNKlEyhyKXaIzQbi5XgT1qEbJTx2l20jhxHTX2f
X-Developer-Key: i=sherry.sun@nxp.com; a=ed25519;
 pk=YnYnIFJ2l+5v951x9shBVfHhminNi+3LTfFa3PxSdnI=
X-ClientProxiedBy: SI3PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::14) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
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
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AS8PR04MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee5fb01-bc09-406b-9643-08df2f521e14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|19092799006|366016|261009223027099003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bFu+qzp0jsvHrue+ZgdWR5qh3kHe0hGL6Tu0uyCbu53D/JHZmndL5Xt2vcrgklpoTtBgaozcYI30YrG9KeqnuHxK8fanD0GSZ/3p3dQgGbqbSEO/UOkBoXgZb9X0AE+qkYbFilS0IjFF7qUjGDXqrHKcqXyokHTSQOsYzFNH5y0esJ539sr4zKMcwFDgLB31nJOh33I61aS5/BFF67677fHYftz2FNGTZXdglyOGxkG9NBiCTJrkwYMw3AO04Rc4ULZ8cYbUNpD7BjW8B/s9wC9Ipc47EhX1UEfwhmtEYj74RGmK49Nix7o4b/s8KHcRVV5VH1lDjBxGbU0aTXse0JaFk7YTfNU/A8DYMDN+kxBo3QbY8hqSfEl85JT8jD6saLqw9T10zVOGdJo/KFHw6qA+KGzdQSqhbo56PP0FbwPTLbkGtk8oH/XGX87HoY5+ox+Sadoh0vVCdwitMx4BGksE6aFACbAy4RsrkJ12x5HwdACFuw7be33CsS/2VXxzA9FpG2mt/VnIZHmscwFB8f4OgJoqmCuVXgJ49DoT3k6bV6zEfj743ze+YE2YUIjzvGERWGkrdL4aqVfS3hjD7RPx7bUgnJbXM5kzX2MinV5khnS+9sJ2RjkRfgZCJDyR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(19092799006)(366016)(261009223027099003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azd4UVIvWGZxU1YzNURRQmhoUWRuMldkVXkyZHF1TjVXY3ZpK29XTVMrTE8x?=
 =?utf-8?B?ay9Rdm5ITjFhNCthWDJNK3QyZmRCU1F2U2RKUGdUU01RcCt5cWlXK2orUCsy?=
 =?utf-8?B?VnE1ckNyMFVacS90NFJwWHRtbmVnRFFWU1E2TzB3RjFKT2FSakxBbzRxbk1L?=
 =?utf-8?B?WFhaMkJWc3hJWEFGK2pocDBWdEkvbi94YlkwdXZIUGZncks2b3BXZUk5ZWt4?=
 =?utf-8?B?VGNUcmRZTDJhL3h1L2d1RS9IUE5XQjhjV3FscUtFdEVBeG54WE9xakVwVDY0?=
 =?utf-8?B?V3FuMzZkQjJPQ01sM1MrTW4xMU40MW5tK1BtR1ZkQkhBc2d1V0xXTHlEUThY?=
 =?utf-8?B?UUFnNXdjKzh2M3B0UjZjMVNKUVhoWmxUV3pZMzlvQWptRE5SUUJDaU5uU2dv?=
 =?utf-8?B?eFAzOFhYL0ZxdDRKVVhCVEt1WXBzVHRBd2xCY0p0NXhzU3BjQndocjlOSE5H?=
 =?utf-8?B?cDIyZllLaCsrN3JzNmhSZ0VhYWUwVWxab0dCdk90K3h0STVpMVJWUWNlei9E?=
 =?utf-8?B?QjNobmltdDlBM3RWeEJNMkYzWG9MOTc0RFNrTnI0YVZBdDZUNGw5M3pzaEtX?=
 =?utf-8?B?Wlg0alo4SmNFTnF1QVNqWkNnN3BFc0NkelBYa1MzUFBRZ2liZ1pGemJpMzU5?=
 =?utf-8?B?a1RURUFHY0xHWGdjMGRKZlhNVDRac01DMHlNdFk1dVgrcTlvMGdLSEhObkUx?=
 =?utf-8?B?ZmswL1RwejR3ZDVIb284NDhtejJ4bzg4SlRpV2dYeHhoeUV1TUpBZkJtci9R?=
 =?utf-8?B?R2xKYzBadGlMRURwWlI4QmdvakszQnNXcGtINVJGYlp5bnJNL2JvOWlSQ2Jr?=
 =?utf-8?B?bE5hVzRFREVOaDBESnV2R3I2dXJEVktkSG5PVWNUWEc1djhuczVVVWNGbmFT?=
 =?utf-8?B?c1FYZVpPYUJpQTNKT0lvQ1BxcWVpZW1FazNDanFOekZ5R2xaWFlCUllFVFdo?=
 =?utf-8?B?dWo4RlJyMktGUllJZW4va2R6VmdGU2ZTeU5VNzVkM3d3SVptbHZwS2E5d0ww?=
 =?utf-8?B?WWh3bWU2WVBZUzRCYXBSNk1UcmVwczdENDgzc2xsK2RyYmVVQ0NVcEtlNlNB?=
 =?utf-8?B?aG1UMGE0NE1iM1RDQ2VlMXlxa3E0L2x0RzlQWHF5czRVTTNtV1BzT0lWdFRm?=
 =?utf-8?B?bThGR2JHTGFDWVJBU3ZzMmloeFNTSWpOV2JEckgzbkhHTlYyZEd3ekFDOGdX?=
 =?utf-8?B?TVJqenhmejNRa3ZvenlNcnhudGtHTzNZU2V3VXhZRmthVTZySE8vb25Jc2dZ?=
 =?utf-8?B?U042NmFDMDZmeHNkRjBUVENJM1o5ZEQ0UzF1a0lyVFRQZGdNYXZWVUFKRHho?=
 =?utf-8?B?K1h4V0Y0emsyb1hlQjRDQWoxK2lWSlk3aXBqUndpNXdTd1NnOC83b0R0OS92?=
 =?utf-8?B?VXRsRjAvZGtLTWdRUlZDNWZ4SDFoMkF1MzEwWHVOKzhPRDNrNGU5MndqeFZo?=
 =?utf-8?B?b3JJWG9QLzBmOVgxM2JOS1RCb2V6S1QramV2cGl0RTZqNjBXbFR2QXZRZktz?=
 =?utf-8?B?YitRWDdrSU9Xa1N5MUE0YldrWStXbFdKVFlWczVGMTlPRTRJNEJKeHpkYkJZ?=
 =?utf-8?B?ODgwZ05ldmhMMndCNjRBbEhXTy9yZ25uNi9vWEszSGJTeVFQVTcrM0NFbEYy?=
 =?utf-8?B?S2poYXJXd0FQRFQzM016cEpDZ3BUL0tZVTBnc3liekt3Y1pyVGU2RllHa21y?=
 =?utf-8?B?bHFZcFpNdmc3L2d1cUxPNmxvUGkrblZiVzI4SGpLR2s4R2w5SmdlOXVTdUtQ?=
 =?utf-8?B?UURLTHJJcG9mbkpKNDkrM1ZFblhoRVZteUFvZ3g4ekU0aGZHQjNUcG95RVNw?=
 =?utf-8?B?Zk5PYUkxTjU5RjM2QWJFTFkrVFRoNWVvbDN4RGhiZFRZTVJ5dk1mVmpPaWJp?=
 =?utf-8?B?MDh4Q1RkNWhLdi9JaUZzbkRrT09tSHBGYVJJMXFNL1N5UGVVZG5TSEtISENE?=
 =?utf-8?B?K1YzZnYxWmo5QjhuNStRdmpHQXprM2xFUzlPRi8rWFAwT2lUSEU4TWVKRlJi?=
 =?utf-8?B?VWF4aTA1anMyVmNiUmg4V0pwWlo5UkEwcGR6cW40R2tLZFZpVi95cXJrbmIz?=
 =?utf-8?B?VWY5ODMrSlo0ZTBWRitYL2loaW9ZbUdOMENhN0c3d2htMmhOVnJLYmcrRTk5?=
 =?utf-8?B?TmVuNGNaOE9jaThJSWRyemc4SHh2MzFubVBaRldyMXNPZVZIWm1YS2hZbTZt?=
 =?utf-8?B?MnVub1h2OTl4Vjllai9OSjZqd0dOSmM5T2RraTczWjRJREZXM0VlQ1A3SkFE?=
 =?utf-8?B?dGprbHFZaWhYOVhIQWZYNFZSRzhaWFhvMmZrV0Y3bGJXb1l0ay8yWW5hVzNS?=
 =?utf-8?B?eTVwNTFpV1R5REVuemM4SlU1cjRBOFRuSTRYeUsvNW9PT1RWNk9makhPWnJl?=
 =?utf-8?Q?VwfE4X+3hh+U1PVscKgViQaBd3V5TbD6Gp0r3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee5fb01-bc09-406b-9643-08df2f521e14
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 09:03:04.9604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3emX6FU4v0qCwtKo8CimM5hUJeYtMQIROk2CZjbzgT7RwWSzDILFiKOp4XNb5fRQw2MmuQdZv6oZkMNDTEnTKaSXRJkPpQbU9k98o/tV2mMSM4inLtSXcGauyHaHwp3/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7960

From: Sherry Sun <sherry.sun@nxp.com>

Commit 396fbe9a028d ("arm64: dts: imx8mp: Add Root Port node and PERST
property") added a Root Port node pcie@0 to the SoC level host bridge.
However, some boards already described the Root Port with a different
node name:
  imx8mp-venice-gw72xx/gw73xx/gw82xx.dtsi: pcie@0,0
  imx8mp-hummingboard-pulse.dts:           root@0,0

Both nodes now share devfn 0 under the same host bridge.
of_pci_find_child_device() returns the first match, which is the SoC
pcie@0 node, so the board level Root Port node and all of its children
become stale. Also, for the Gateworks boards, since both nodes have
device_type = "pci", pci_host_common_parse_ports() registers two Root
Ports for the same port.

Fix this by moving the children of the board level Root Port nodes
under &pcie0_port0 and dropping the duplicated board level Root Port
nodes.

The moved nodes are now located on the secondary bus of the Root Port
(bus 1), so update their reg bus number and unit addresses accordingly
to keep dtc pci_device_reg/pci_device_bus_num checks happy. Only the
devfn is used to match the PCI device to its DT node, so this does not
change the matching.

Fixes: 396fbe9a028d ("arm64: dts: imx8mp: Add Root Port node and PERST property")
Reported-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Closes: https://lore.kernel.org/all/171421fb-d0a6-4e3f-b2dc-226e9c548972@pengutronix.de/
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 .../dts/freescale/imx8mp-hummingboard-pulse.dts    | 17 ++++++-----------
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi   | 22 ++++++++--------------
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi   | 22 ++++++++--------------
 .../boot/dts/freescale/imx8mp-venice-gw82xx.dtsi   | 22 ++++++++--------------
 4 files changed, 30 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
index d32844c3af05..911799db4b91 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
@@ -59,18 +59,13 @@ &pcie {
 	pinctrl-names = "default";
 	reset-gpio = <&gpio4 28 GPIO_ACTIVE_LOW>;
 	status = "okay";
+};
 
-	root@0,0 {
-		compatible = "pci16c3,abcd";
-		reg = <0x00000000 0 0 0 0>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		/* Intel i210 */
-		pcie_eth: ethernet@1,0 {
-			compatible = "pci8086,157b";
-			reg = <0x00010000 0 0 0 0>;
-		};
+&pcie0_port0 {
+	/* Intel i210 */
+	pcie_eth: ethernet@0,0 {
+		compatible = "pci8086,157b";
+		reg = <0x00010000 0 0 0 0>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
index 76020ef89bf3..224b494bc51d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
@@ -156,35 +156,29 @@ &pcie {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
+};
 
+&pcie0_port0 {
 	pcie@0,0 {
-		reg = <0x0000 0 0 0 0>;
+		reg = <0x10000 0 0 0 0>;
 		device_type = "pci";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		pcie@0,0 {
-			reg = <0x0000 0 0 0 0>;
+		pcie@3,0 {
+			reg = <0x1800 0 0 0 0>;
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges;
 
-			pcie@3,0 {
-				reg = <0x1800 0 0 0 0>;
-				device_type = "pci";
+			eth1: ethernet@0,0 {
+				reg = <0x0000 0 0 0 0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				eth1: ethernet@0,0 {
-					reg = <0x0000 0 0 0 0>;
-					#address-cells = <3>;
-					#size-cells = <2>;
-					ranges;
-					local-mac-address = [00 00 00 00 00 00];
-				};
+				local-mac-address = [00 00 00 00 00 00];
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
index 5eb114d2360a..c704a73cdb6e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
@@ -168,35 +168,29 @@ &pcie {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
+};
 
+&pcie0_port0 {
 	pcie@0,0 {
-		reg = <0x0000 0 0 0 0>;
+		reg = <0x10000 0 0 0 0>;
 		device_type = "pci";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		pcie@0,0 {
-			reg = <0x0000 0 0 0 0>;
+		pcie@4,0 {
+			reg = <0x2000 0 0 0 0>;
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges;
 
-			pcie@4,0 {
-				reg = <0x2000 0 0 0 0>;
-				device_type = "pci";
+			eth1: ethernet@0,0 {
+				reg = <0x0000 0 0 0 0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				eth1: ethernet@0,0 {
-					reg = <0x0000 0 0 0 0>;
-					#address-cells = <3>;
-					#size-cells = <2>;
-					ranges;
-					local-mac-address = [00 00 00 00 00 00];
-				};
+				local-mac-address = [00 00 00 00 00 00];
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
index 2b86cc62a41a..bb62a91b6029 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
@@ -239,35 +239,29 @@ &pcie {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
+};
 
+&pcie0_port0 {
 	pcie@0,0 {
-		reg = <0x0000 0 0 0 0>;
+		reg = <0x10000 0 0 0 0>;
 		device_type = "pci";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		pcie@0,0 {
-			reg = <0x0000 0 0 0 0>;
+		pcie@7,0 {
+			reg = <0x3800 0 0 0 0>;
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges;
 
-			pcie@7,0 {
-				reg = <0x3800 0 0 0 0>;
-				device_type = "pci";
+			eth1: ethernet@0,0 {
+				reg = <0x0000 0 0 0 0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				eth1: ethernet@0,0 {
-					reg = <0x0000 0 0 0 0>;
-					#address-cells = <3>;
-					#size-cells = <2>;
-					ranges;
-					local-mac-address = [00 00 00 00 00 00];
-				};
+				local-mac-address = [00 00 00 00 00 00];
 			};
 		};
 	};

-- 
2.50.1

