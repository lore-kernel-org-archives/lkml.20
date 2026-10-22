Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792697879;
	b=vspzQBfHcCJy/I1VFfSlkAWGx6LWsy0KLhwDMY8cNsJrPpYElsm5gYzkW67o403aF4PD
	 X176qaTVW/8I43PxD/mbf+PFPj7ZqGeAriMJYtoAgNbLv00Upy/R14AAZOvtxO5N64EVi
	 kcTqhmeBIKs8oaBpYPgJaKSOTugqA2uOH2RU0m6cI3SSlS4D/cauny9gN9ZPJJsO/6f+E
	 Y+lPwzHLfgnW36dPZZR+luaAgws5Lsj2VKmVnnuZTrY1YbC1tMS0rJUGXjXM56wI+omlb
	 wI8CZRkQTS8eSeuQTuVW0XwvzO94x8OV6xdsDQiu5pBicFjwWfr+jQK/IPlK39bOeYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697879;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=sMSowazPp8W0dwmPKZwoDlN/Ng/S4USGWuXXoF/2GXs=;
	b=XBQHinm8JeHKEsR+qlfX4HzWGK68fRnt6vzVlaYe0u4Rl+zeU5wGiSCU7qCkbXEvwCIL
	 0C9hBI12ZfnNDCEj9ksbTieLxPY38i6F3tpy5e6rqy4TlsJ/SpsGgsXe/wRW+IsxiE23V
	 1yxOEo/0pmlla5vpTBpmzGsvuCZfeay6DbbHxJtuOvHcxjYfBZ9E9ZFNyD9tFUTzkT7F5
	 G65PXkOfOqaugkO2w2PbEMIkfyRSj0vZPV/c6xPxXk/BTr0YTn8LetOKYT6OyUkPl9LyH
	 4QEuTNtgPt7J+NFWRUa1KNGIw6C/Bz3js4/rQYkzMAeLQzgHSPsbY8YVebPaD7t0R9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RK5v1MYn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.14
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7896C606A32A;
	Thu, 22 Oct 2026 19:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7896C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RK5v1MYn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYlder3ho8wfKseDDysmjGr++BzODBajqX1VGXDKX1e/aII1L5bF/Ms7jSmdq/xdD4x4rsqkbq3yuy520Wu6jre8Nh0t32BHcNAIb8X4JTZkX6+7/mo+JxSvr72h7OQBaibnvuibykoxyOgvFPwVR4x1vqFMsqqtOWeAQt8lZv25wsk8/vi3eRaVujL2uPzM7NgQThmNP4P8X7zCWZ6vopfdGBZYdRfREKs1K+E9o1aw/5JWVcOTYYPsXHiec1/3S1j4+GgAIKL4M7v8NGds2QCi3KPuBhbYubzUjGdU8HLeVslzaILN5xNw+lORMyxKWc+xIAzS3sd4UUsVUqSWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMSowazPp8W0dwmPKZwoDlN/Ng/S4USGWuXXoF/2GXs=;
 b=i8Ee7tLFOO7TWSgXGfHT2jlifm7lAiIaa2VB1hR8hxEbgv2GdWm7EpoTsg8izhAUtXyFND4VLDVj+81FNe0QnLEn7uviaN5PrDXebogWKskQz1YP4t+Jddl73SmrhdwnsdxuyPF9+4g5jCNbyLptM/xvE7WSB08iAbqGoi61HcjBQFctukvxTJX7mfMVpLQM+jMFC9wLj6X+J1I/BKOVRzgEu6Z9RixzjypSKn57ENQvEw1+GljDYpjGlBxCL5fQLSrWJzBqSrAXTNMlIXUGCPZ8NCsomOCNoNDxdU5EAJBNyH4Lzl2G7RPGsVTvd68l4I5j+DkLmmwrpp3qZ8oPaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMSowazPp8W0dwmPKZwoDlN/Ng/S4USGWuXXoF/2GXs=;
 b=RK5v1MYnC7jpE7dZxxkQshI1EZMwhZpoVQu3P7vSfeKzyHL5p2j2HYPhPZgAr5v1nHgmzOHp+echz9rdsublRe3eToI9qud+WuXmFjZwH2cnuBBr3nhl0qloO8CWs5nwg1nzamSXhFFZxbrQWVNSQVapf6AAyvykki0YvOXZKdvVQXYlQW4S3SiZEIwFTaDmR/JbRNUBiKPZZ4HfXzqXfQMNEuM/ochEZ7eVeH/qu9WVfE7wTObTYVJZz6zx1NRVlg4G3Iqz62tyHXCiREuGpxUm0svVchp8MDpS0cmosL6FQ1PioRSHt48fOlwR7vThI6bUETw0KCFhYkt1lWJvxw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8679.eurprd04.prod.outlook.com (2603:10a6:10:2de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 19:37:55 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:37:55 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 22 Oct 2026 15:37:11 -0400
Subject: [PATCH v2 8/8] arm64: dts: imx952: rename soc to soc@0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-cleanup_dtb_warning-v2-8-e9502fafec59@nxp.com>
References: <20261022-cleanup_dtb_warning-v2-0-e9502fafec59@nxp.com>
In-Reply-To: <20261022-cleanup_dtb_warning-v2-0-e9502fafec59@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Guido_G=C3=BAnther?= <agx@sigxcpu.org>, 
 Robert Chiras <robert.chiras@nxp.com>, Tim Harvey <tharvey@gateworks.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792697827; l=804;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=3igV7lDpk9oB7xkxsL4EO4SVhPLHmXmxjeWwul9ny3E=;
 b=mOwG5lhTwZgkiKjNwZoz+8k5TSP52Jl8H+18pSGyWjXWFEcBgqK2Aqv6lydXH7f9lRPa7JvDd
 CN5OZ72yI+UC35K3Wc4HRrnd0ldt9h7h4p8H8GwrKNgoPsenwl+JxAN
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0122.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU2PR04MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a40909-85ab-4f65-2696-08df3073f82c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|19092799006|366016|921020|261021121427099003|56012099006|260925021311599003|260925021911599003|260925022911599003|261009223027099003|11063799006|10067099003|261021123027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 k2FsLIIKYPtXp6YED7jdb+CYzbiDNUrHGLAACGx1A3iLtiVlzKg8wu2RCL2auzcg4aOIt3vc2qpPyclyQ3j3NHb4YjvHUW/hXyakIjyHMJHCp7HbBkpDnHM3gOt4Ao4Js0VUXrdl0s5zIg5Geu9U6EM5XMeHfb7epAMm98PTDOowvrG2UH/vg8C//jhYqdqfIw4u85GTV+RTzBYXtS8OmqVqw8Fh3qwM4Fg0J6b0Ke7CHFllUgv9wbo7BXSWQkEVyTMgYKQilORwU4jPpiVXMeki13QbXbW4SGi7NUcKbkmjvNLAjYLt8zBGC08UEsW2fGY8Q1pRcNl9UpK8OivIJSApN4mrcRNLN25a7YWWJoyoxRo3sI41x0TJvjFKbBkoEq/uUudzHBfxDlnke0Zr+sRs3fWyHEd/+8jVtXcvN+i3QXTiYbjL3X7/RFYqKQ0WiOWEua5nM9B0jILf6jFAhIT+ojtfnQEtR2Dkog4cuDcy118zAiPHzFRKjawTKVzmbHex+r2cLp2ZTAtLP3AelY9o9vlX9+vnvZw4A7eCsb86nMBZ8B8t2YEaoM8CZ+ECvamxF+AGLrPzg4FIeJ80zWZEl1mtFgETqpls0d6ojVHfuazfE5IT5Aq3RrHjnTS0xGfke/b8sYCCiavrgEL9qpdJUbtXABA5ke11VlODSDt4QVec1CsoH8JiybULk6vDkWpjWMWlszaLcymrFlc0/Q==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(19092799006)(366016)(921020)(261021121427099003)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(11063799006)(10067099003)(261021123027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?V2luYjlXWnkyMG9uYm1WSnZPRkFoT3JpL0dpdDBlb0JhUzZ1c0loRnkxUjNW?=
 =?utf-8?B?RVpEbGt3bUU5Z0c5c0RwRlJRYWREU013Q09PeCtCMmJvMmdGV0pFd2VHM2M0?=
 =?utf-8?B?TmR0ckVFb2lnS1Voa1o3TE9ZdTRoaFp5NUY1WldxWjJTK0JqMm5EUG9qdzQ5?=
 =?utf-8?B?dUp1cmNSd05Sd2NFVGtMdUVCTFhJcnU0Smo2citwWkQzK3JaN3RSUXNsUjdC?=
 =?utf-8?B?Y0VYWXM4dE9EQlo0amRnZml0WGJaRisyMEY2VllNbk44QmEyMDZUUjhjb092?=
 =?utf-8?B?RFlQdnRuRlJkRUh4RU1ZaTU1d2VaOHpsWWNzbENXZDNoVGc2cWtwU3YwN0h0?=
 =?utf-8?B?NEwyaVBBZ3lSeFZ0aElYNFZpMk40bGZVZ0Zra3M1SFdmMXVEVjl5a2hJbXRN?=
 =?utf-8?B?Y2hTTFk3SVNBejhndFhPVHA4U2lDalVSYy9kQ2RJVDYvY1RJSW9rcWNDeVBL?=
 =?utf-8?B?SW5Gc2JMTy96bkRNS1Z3STB0N3hDL25wcGxtYWhDVGNLZzI1bzlldnRFeUxt?=
 =?utf-8?B?VE1vd2h5OGtCMEhYamRFOWxYcVZtV2hWRGJoTkVWVjdnSFdlbUo4TkdGdS9x?=
 =?utf-8?B?WEdyZVNHOGJjQXl6NnF3b0c5N2w5eGgxV2ljNy83SllnK2NBSWs0bkFsd0JH?=
 =?utf-8?B?cDc5cVlWWFhFVnNJbXVzMEp6azFwZXJ6Ynp3Y2dyTkI0VG9aS1RIY1VvVm9W?=
 =?utf-8?B?cWRMSVR1RVpKbFFJSzFRankxRnJxWXVFVDIweEpEKzBCbkpUZVRjZStmWERy?=
 =?utf-8?B?NDg2NkNaOC9MdUVOWmNlL25KeVFxYlY0SEtxYVRycVpXNitZaTA0bjd6WmlW?=
 =?utf-8?B?blRibGRRNUxzcGsxdjlQZ0lKcDdSM3FSWjRlM2VMRkpRR1R3R1RBYWpHUUpy?=
 =?utf-8?B?b0c1ZUJTRG5sY0F1WFcyenlwQUhhMmVyUGd0Tlh6b3oydHlYOHlWc1ZtMW5t?=
 =?utf-8?B?em1BNjN4U2EvcjIyeUtOTGtBeXNKMG9zalpmYTZPUW5TdjlPcUVtblcxSXVI?=
 =?utf-8?B?SjZwamNrWFAwaU1WSEJIME1KK1NuOGtTSXFtSjQzVVBwY2cydGFuYTYxM0hS?=
 =?utf-8?B?WFVLazFLcmNYUEYxU0g3RkxRNFNKdUNrdGdzNWtNbzBPaXIxTFlyMWIzNEpB?=
 =?utf-8?B?elBtaktEdHF1RHJScU05NGN2d3NHWHN6b1lPWGFaK0NDN281eFN1ZlRJblZy?=
 =?utf-8?B?T3YyYkJ3alhvK2dKSTNQdTZsaDlPYS9HbWJSUUU1Vkl1QTV6TE12TzdFRFFw?=
 =?utf-8?B?VzJodzBOQVBIblhPQlIxeW0zTVBCUmExNlVITU02bjkyRS9RTW4rbGpWeEQr?=
 =?utf-8?B?cXEvQS96ZXoreEpqdTFaSVpzdVpOTW5vTitrMFFrRW9NSWpXRVBqRms5dnZa?=
 =?utf-8?B?YlFjT0tmOEN4VGY5bUFiZkZNUHp1ckZGeEdSTjhya2RFYk92WDUvV0tSeEVt?=
 =?utf-8?B?WTRsOG01NjR6akN1ZVlaUEUrbDVhRytyUkNRc2E3YXZzZElWMmNYenNxd3Na?=
 =?utf-8?B?ekJXMGxHMEJnM2hBL28rWFhDMTlER1lsZmt0NmR3Z3Z3d203SjRhQ3djTkdn?=
 =?utf-8?B?UGVSUzluVzNPS2E4WDZsWjBUOHZUTzhOQkRPeGNlNHlLMGx3ZTFqRlRqaGJm?=
 =?utf-8?B?QzJvZW9DTlUxZzJjR1BMUWwrQzkzZ0JKaHV1Wk1iMFJtWTloZjlVeGtEVEF2?=
 =?utf-8?B?SUE2dUVnWVJac1FONG15cGxnd25YN3BqWHI1aXc3Zmp6ei81SHdYa0V6NzZP?=
 =?utf-8?B?dk01TU9IeFpFZmJsTVBJc2ROMWExdWRLZUNHdjR5U1VwUVl3KzhZaDJzTmRm?=
 =?utf-8?B?cHVLajVIMXNmY1Rtck1FMzJBMU9qdExwekJycTFkWkQzTXVBaDc2T1JQTE9r?=
 =?utf-8?B?MDdob1pMd1BIb2c1TU1ETGxPblZETVlXaHBDbFo3Zi9INTRvZnZHTGcwdTRV?=
 =?utf-8?B?TmpBSmdiTmNNNVREVmR3d2RiR1RxRWtOdlFSNC92VzBoK2p1bnhnZ1FmTm9K?=
 =?utf-8?B?WUx4OXJDNDBCQzRFMG91TVd1M0RNTnZYMlFpcFB0RXVwa2xIdTBPTmo5aXhm?=
 =?utf-8?B?M29leUorQ3M5b0VlaDF4Nmx3TGtBa3VpTGVnVEc5R1FtelZMYUxRYUltOS9q?=
 =?utf-8?B?TDNPUHJtc29RQXBVSmVYaEM4UlBXckR5NHZyUjFqZEkxNnNEUFBndndrRHkz?=
 =?utf-8?B?S2tIWTVuYk9kVThRRDdRcGl1SHJmT1NaU3A5d25HaUQzWVN5Y2dRaGdWa0FH?=
 =?utf-8?B?T2lLelBndHBtWDFUOHdINy9qWEU1R0h2TkhDTUJvSEhOc1dsYU1PQUJTcWhz?=
 =?utf-8?B?YjhnQko4TVZERXF6Vms0SEsvSGp1WXg2VVRuNlU4TFNoV3NCMXc1WHRlRTVB?=
 =?utf-8?Q?blUpSD1Z/lcEvMYcjjkjrkEGQUpNtgZ2t2NvP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a40909-85ab-4f65-2696-08df3073f82c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:37:55.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQlG2iUjaiSw1J9thexWqXIipwMXcV7gD+lEObkLo4r2LOFxRUcM6TpnEvWSAdcvmMvof+nJsZ3DGxF8kjTLjBEYY+TTy5LEKc2yF01P57HkNYF0oAAMOQqpGru7QIif
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8679

From: Frank Li <Frank.Li@nxp.com>

Rename soc to soc@0 to fix warning (W=1)
  arch/arm64/boot/dts/freescale/imx952.dtsi:348.6-1539.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 1154b66dadb2d..3c51e61d1fc36 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -345,7 +345,7 @@ opp-1000000000 {
 		};
 	};
 
-	soc {
+	soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <2>;

-- 
2.43.0

