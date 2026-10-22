Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792697842;
	b=H3sLuAZ/glTZPllKtB3N7qhYzcS+62Px6canq8LZwCR2w71wzfn1bby/BuKUIbIvr91D
	 bm0g3AGa9+JlxkQ82vXyTt43WYGcDW/KkRLv1JtARKqHp5D9L0rJka/MCFRJgMEFTSPbo
	 pPndiUuokz6guJAaxjVq3SF2whi4Bi2vXd3bB7/pd/jELu/dNOuuCtA3V61dLWNp6iboy
	 n4t26KjF+M93ivHR+CBeLaO4LphUwCEtytAgxRJfx8gGu+cpvbwxjT5x88j6XKJp4+K96
	 HYKNX5gw40fMOC6cbK9SrUwUE+1b/zd1fBSDxmZTYa6sBQVWfpUGPwQbFIgC8nP9rdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697842;
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
	bh=DijqE8M61qQl5FW8e8ecmnJNyrWQ8PEnFevKi8p5e2Y=;
	b=qPFvs6+Y5Lo+ToubKL9VB9F0/7wwhhSIs7Aitye7GHjvCM+H0/7u7CSMdCZ0v7Frp7ju
	 v72PS+JV7ssrcRtMXGHCd4j6vG2U3tj0wskX95fNhiVVW1GHGi33QvRAcDVNMu4yzzS2W
	 8kdwzmD7miIww9MuLP9bRgmgPubi280A9z8hnwBR+XsPKIMmGEoO8NzFxAGnf75DHCZEV
	 s+C6lIL3mwM5UumruCKrr4TOZlwCcQj1dIPBLE7dRgdt8k6FxtGV9paeKwIViql8yQNyg
	 2AejgDsDb8L3wQ+kjj4C6KIzkGm5mANrgiAWhP/hEDW2TX0xOTL7TLcxulEJVxadSCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TBku3t67;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.23
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3616606A329;
	Thu, 22 Oct 2026 19:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3616606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TBku3t67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWPpgvk4uemplU0y2JW9gTL5tro5TpbOlXJG43XIbfpQFWyMQM0eAW8iWg7HLYJoaaIZbOmv8N5IdgjGdQRFVjK0vYjjKomz+AbvcIlPMzMoAWkF7dEhb6ouSWg0b3LQWSnd08n34mVyJ9EQr+Ib2IF5aR1M/IFreU+paCm4pXZYDA5r9+Js1AmROHm9BxFCPMZG8CbnQ0xwDZEivmZ+aof49l2ecNjsUjfEWGEz+bk6XgIShcBE0bbJvy/BdMDJmNUL6EE/M2DnazJcnVhHeaTrDllidgv8NwCXP/V66nmAc2Zf2OsLN/8O6wAeje1KkiG4XG2Fju5Uq0tfRNOm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DijqE8M61qQl5FW8e8ecmnJNyrWQ8PEnFevKi8p5e2Y=;
 b=YcppJ6k4LM1XHaWstrU8wj/AsTCDPfGIBVaxFI64EjfGOB3fEqljz/eVUZP4AKT2+ATQt2X+PGOYVttTSFCNxtU/m60XFjSNZwvnWgEvKLmqmD/jehFH0409cPgc2I00wDGemZzdoGYLAq2expzvdNFpJozOZ0Pw+mXoY7ft4Z6Ta+tl12dIDSK3WoDCaO1LCTPHMBQmfegDOUKElMfn3PyniDpRRtp0IxF7T3NurbFh4YF/96sRUnzsZUVbnJlQ2qOSaSKvKOnjY+nevAJEe+yxKX4F4YmsKugxuVGO9irztub8AOiWWrbq70Tz+KItxX4STc1cvUVIoyqYuDbGmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DijqE8M61qQl5FW8e8ecmnJNyrWQ8PEnFevKi8p5e2Y=;
 b=TBku3t67sx8NmzkfRSYI18J5JmqUf4MgbGmvmE19tDWyrQy03tUDPEkfeNpqp2fLoHKSKhXMiCQMmbocbs5j3dpqlUHnWPTFw7Aueo1vH1Xh2KBD1BSE5Z6jXehEsY9BGZR9/gEXx8T8aY9v+wDSHYvsKUuSiMduFrviciga/v1fafK7uqoIm9o2RnzqCzEIFSD/wa4Zb4j/ZB2SIkwYoOX2vhYySZpk/oSD5zSghGT4CRuqJEYO98m1u9QnVlrefTxxVOal4mW77Wnkut2VI5nsI8DjoYB8QZgueW10lyCNM+yCYlYZpwC3j4Ff4b+npCO8JXh8qVp7UcOhHxt/NA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8679.eurprd04.prod.outlook.com (2603:10a6:10:2de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 19:37:18 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:37:18 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 22 Oct 2026 15:37:04 -0400
Subject: [PATCH v2 1/8] dt-bindings: display: remove #address-cells and
 #size-cells off requires
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-cleanup_dtb_warning-v2-1-e9502fafec59@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792697827; l=882;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=FKf/tb0QpBcm69/SW2n3giFvMVZt+a5/b0p1MnXK1gE=;
 b=aiQUliitHADbA4nSr3j/LXq0pWms3jMAU3kMqiAOtQloYOIhlSSgumYffVwV3O4bgNcWz8qvP
 2tM+0YQTwzpCc4JzgKdutgKsR3d5FVsSty8gjvcegj2fXqSc4t1q/ns
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:510:339::8) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 550c8863-e6d3-4067-1050-08df3073e251
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|19092799006|366016|921020|56012099006|261009223027099003|11063799006|10067099003|261021123027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 vqzr32dDrpxu9+UH9gMh5OWpdSbDTwP8bxVtdGotO4ocWzzruhA/ppCji/OZ46v0G0ilJNgYR84asmzmnrt89Lm12QGWQJrw1wFWP/hG+6SMkSw0XjdkA+O76x6JD3JrQGtsmzaMGQIWgXoN7wYGLPVFRipr47HbsZVR+69DBeR33Frxe0eHLE8TtmP/EJAP3cAkJd9id14O9Al24iyAJJim4p72DNJdIUJXcB+y4+7kae94lwv2Hf1VIYgUAZQB+Ut5jbjWbOXa3//vaKyIsVjo98JVtYbM4T6DwAo8VTBdc8xOW2pfpK5/zJpdQTyFRknizCNdkgMmIjdztCGyqE0Ab+LBsycss8wTcKLZ6Ea8ZgO9N9osviS0EciwfwcHd4ozFdybL3vfQF/uxDL1UMUySaKBFHWQKUpeSIUWwOPQsPYm0Ddf3KyReF4ag4qe8dz7zMl58uAO3hgsK700cMJyvVMUadHwxxLX28hZTcrjiELaYXVEos5grJg10mm6YuE8jfg/Pj0uiof9aU6yW6tNQ5B1IlBMQ+3OR/XldW+zwpa24czUqCZ9mCu47H2+F7IqmdJLfr4pHsFG6ehD37wnZ+7PpFDmLXmSEP5QUau8z37hThMcrpWzYuSXosn1ZxOMpfmN7A1IMKHJjp2oDx/VIDkiwYDEwEhZ82gytn0Z52wfGzOiG0zZ3Jf7D4tBA/B59EzfPyOM0nbMbBBK4g==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(19092799006)(366016)(921020)(56012099006)(261009223027099003)(11063799006)(10067099003)(261021123027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NFFUc1dzSUFseEZoQ05FS2JkVjBpNStJanNQUW4wcERSSGNuR0lTbzV1b3Fx?=
 =?utf-8?B?Q0hRSC93blVZWmh5ZHZXYjk4cEJmM2JIRnEycldmYndTMm5vaW5zWkVNRjFY?=
 =?utf-8?B?YzdEN2pxcHpYMTF2MlNyNVFyV0srNjR6L2hnSVlsa0c1OGFVb2xQeXFDa3Z1?=
 =?utf-8?B?RE5EeHZuMXJ0TG5SMm1RU0ZYMGpub1dlblRRSkFiSVRQRGZVQ3BGcVI2ZjZa?=
 =?utf-8?B?WllXbEZROWUzNGNqMDNGeHBSZFk4aWFNTG90V1BGdzZubWkzbEFsdS9GSDMy?=
 =?utf-8?B?SG9TclJsNk9wM2lQN2RIbWJFS3pzMTBDQlRvN1F1WFhIODdWc1BwcTZoK25J?=
 =?utf-8?B?c1ArcU1Fb3IwTDE1TENud0xaY0FSc0xYeFp1M3pHNjdGYWM4VEJvNDFmZWdo?=
 =?utf-8?B?dE8wSFI5Wmw3NDgvVHUrMmpMaEVWa0JWN1BDRTJYOHNKdytaYlV5N1d1UXoz?=
 =?utf-8?B?ckd2N0xMeTFnSi9FR3lRUXBqM3FNNkJ6MFhaZWlvSnpwajV1YkhUQ3dmZEtU?=
 =?utf-8?B?MGlFY0hpZWNQVFRoQVI2Znk3Yk8zNjRkRUVLN0VCZ0tIeHVGUFR3L0RnZnF5?=
 =?utf-8?B?aWo3THFpZWo1VWN4Y1huNThoS3RaYy80cUoyeEhLSEFCOEQyL1ZDZ2xidUdF?=
 =?utf-8?B?K3AxVFZqdEtQaS9yUEVZcHVkLzQycnpMYTUxNzRta1d1UTJpWFRCbjRoNi9a?=
 =?utf-8?B?VHRrTDVYaDhDd1N4cXU5aE5xeHpLNi85OFM5bStLbnJYNTNFcDZTNXdwd2FE?=
 =?utf-8?B?TG5GOG5GU2dBckMwWXJnNmtyTy9hM0ZNY0RMQnBCV0c4VEFIQmJzK3ROb0Vr?=
 =?utf-8?B?UUZJY1J3ZExjWVBuMjBobFJrOWF3VnY3S0h6dXpzakpWeTJ4KzhIVVljZWsy?=
 =?utf-8?B?Vm42WEUzeG1OU2pENzRVWTVBRHFHUjBnbDZnWGxVdXdnMTRESUhHcHBmMXNJ?=
 =?utf-8?B?aUlaZjBOdmdYZlFBZGdBTnBlcHFRVGx1S2poaWQ4R01PVHptczVwVStkK2ZI?=
 =?utf-8?B?cng4WHU2bU5oYmk1ZHlvSjcrTVBhUU1zTEVOK3U0VEppdlNydzJlMzVyaFY5?=
 =?utf-8?B?RjB6UGhCcUhGUVJOTldlS3NldVlSMU1XNmx5YzlydUZTUHZsYWY5QS8wWmd2?=
 =?utf-8?B?OU5abmovcjZ1eGQyeU81b3FkMkN2aXIwQ0JPNW5GbnhwTVFzRkpjQm9DU1FF?=
 =?utf-8?B?aDN1Vmx3TjdQUnBlOTRFT251ay9Pc0VtNWpndm1QMmFLM1NyTHRJWGhPSTVP?=
 =?utf-8?B?WU5BNWRsdGZvS2granl0ekQ5QWxaSGpRZVhONWVlNjNrcmhiQ0tzQzJmZFpZ?=
 =?utf-8?B?dHdDQ1UrWHRzRS9laEhOMVlockNZM0xLa2MzK1JBOFdiL2w4V2V5dGVSbHBv?=
 =?utf-8?B?Mm1IR01UbTYwbmhDZFl6a0x5ZDR3MVFvaUtNMzc3ZHh1TkozZlRPVWlISmdT?=
 =?utf-8?B?djZOb3I5S0U5ejdQSSt3QkJEeHdJM0lsdDNkTy9nc0wwTTBFWTFFQkwyZ1Mz?=
 =?utf-8?B?b2hlNkJTK0RvQ0NXakNOeU52ZjFkTVI4VG9seDRXbzNRNWZPQmxNa05xYzNF?=
 =?utf-8?B?OWNWb3ZJblFKQkthd3NPNDVreGxLbWNLVEZuWUpDQmFyTEs1YkpTaUE4bE5j?=
 =?utf-8?B?N3R3blgzSVNpYWNBb3YwS0dzdUZCbGZNQlFiSTc3MnI5Zmh4dDA5dW90WSt4?=
 =?utf-8?B?RVJPb1dCS29JWFBtVFpKRFNzQ05EdHR4TTV1ZGxJUllOSXdHM2lDM0JzcjJS?=
 =?utf-8?B?a2NyM3RPUHVxdCtkSDFnSmFRc3BrN3UwL05jMFhtQTJBaDBOazlSem9YV1hJ?=
 =?utf-8?B?bVZqcXpCRUdHUWptMXMxN0QvZks2dHMxUzl5VTV2YlpRcFg1MmNXUWlreERm?=
 =?utf-8?B?b2xTY1pJVVZtd1JXZFdtRUd1UDB4ZzdJejFvZW1oLzBYbGJuNFBZQVFXR2Na?=
 =?utf-8?B?OGxVaVdLcHU5Z2RtVWlubWo4Ny82RUJJbGNBUGl5R2Q0RVVaNEFkM1Qzdk9W?=
 =?utf-8?B?Y2ZibHlPeTIzTlFTSXJmQU1Ba2RBTHU1aG5aOEdsU0gvWnVTemo4RDEzZzZo?=
 =?utf-8?B?aE11SjhDZkF1RlNpa2ZjdjJZWUl0MnkzR3dFZHA3cDlabHplNnJ4akxhYWVu?=
 =?utf-8?B?NWtZUXJEQ2wyN1R3aU1QakVHUnJXbWtxZWRlYS9RaVc0SXVtOVE2RVNDMURH?=
 =?utf-8?B?SmJCb1JEdDVZWkJWUTJ4NDFEbk1MV09DN3p5QzZ6NU1yRWNVSC9US3krYXdC?=
 =?utf-8?B?a3cyRXpseDlRbERENnpZVmd6N1FwOTdLSGpOTU5RK1RwdlVNWThaaXR3L2Vo?=
 =?utf-8?B?QjJoSi8vaHAxWVdiTnRDVEI5dERaQkNuR1NQVW0vUnZJdjBSbTVsSUlJM3hz?=
 =?utf-8?Q?A18loI+T4qX9uiEEODgCuaj9aEcOo2OPUokn2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550c8863-e6d3-4067-1050-08df3073e251
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:37:18.6897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zluM9U+wUiEUQFBH/jvUOmN+u2XeVbDu7SO5V3AkEBCj2me4aB5hLprBxCWvMksQfAsxtE0ZCpsjxSnTibRueCeJ/f3MaXZd4NkXClw3k+yGJNoNuCWcgnLErce8SEFs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8679

From: Frank Li <Frank.Li@nxp.com>

The display panel node is not necessary located in dsi node. So remove
these from requires list.

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
index 5952e6448ed47..a0c3ba9275684 100644
--- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
@@ -137,8 +137,6 @@ properties:
       - port@1
 
 required:
-  - '#address-cells'
-  - '#size-cells'
   - clock-names
   - clocks
   - compatible

-- 
2.43.0

