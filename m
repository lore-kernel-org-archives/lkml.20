Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792633526;
	b=owIDv/Lcw29zyU8lN0u87r0/bWIg9MfVPiyfQabUnS9zybIX9vMUFsx23HbUcQtTsoWk
	 jVudV7O7zhKCS2y6XGqU2yl5dswGrQKw/zdIMcij6oFXsPnEVkw9wkZcbs5R5h7tl8Kjr
	 iZYq4NzqW+0jFT+r/2lkAKOJQ+a7GYHCiFhpMaE2ZhhQHG3nFqXTykHRm6YHbFoMZbOi0
	 R+x8x80/MfXV+W7XvbPTRNfurzRz7YnnW/9LgRBU84HoZ5WdUFDPzBB/E3O39V6Xi1sFd
	 GvwOHC8glf8srr50mlUN9Mbe3Vkf1AP8jyMCFjIiEOXJRmnsvh+jGY092FiqAyKYYog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633526;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=Um7YxCGUX/znCYiTXaHI8iRtNDMOT3p17B5RPSOgwOw=;
	b=ITIdK+qHr+y7X7cx0HPWmCi1Qt0QaX6VsSsJ3YRJY81L6dyze+y3BUCLyrizixIIUQGv
	 ipqM+mULAhgldL0ERofOjBCgrB+ifJYl8vc062pY+KThYqFnbPZSvKWKAdrq1hHeZxxRm
	 CMEvJ8BjCcVRXYCrreFCSgC9gAOrPnmKsrD79NdiXnkMkNZoggXoTAN+PYKmlkVdfcW16
	 YVEr3TQ2G5gOKbZ4hjQ03HeEmPezsQHTicBtxpr/Q3AnBQ6MDu5Z7iM+opwGbT5kJo/Mn
	 d6jt11T/Tkxgavo4swHk25Uew3bTSWZ6yZel/xCDLaP9KBm8ICGDtCB+tybA6t5amjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="bhIKi/Li";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.46
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B11606A31D;
	Thu, 22 Oct 2026 01:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2B11606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bhIKi/Li
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPgyZc8ihHV8DGbV4PThvibQx1qmWA+nfUzAi/+fVmvWs6AbXFGjh/DqLW+J/+KrCR80m51JB9J1pyqu3ZI9AQp/PNurmNQ7/ycI5ujFyw7Y18YZPQMW+sgqc0/o3sgVeDvA18H4du0EC7YNbeGAaHVnlAOpyuNw2IIiNGZK4M3qCQXxrhxjM/lGIGGhsRL3FSM9KtoLPrQjaKylpByFsjzwGm6lhE/Ti2CSxjOmeaCkYZh3oqYpurU1YWOwfP1kXnrfydIin+oToZqEyscJuEMdG6hFSJOlw/k6D1pYow6xXy4zVSLHg3iFzJhsFPwAmKI6NHS5IBaOvou6IMQdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Um7YxCGUX/znCYiTXaHI8iRtNDMOT3p17B5RPSOgwOw=;
 b=lz9U1H2eb2d7aG4C8Upi5z7vlaZP5I68/1WV1/8LL5Jz9/WEaO/9xpwmmqGe8OoEZglZj0b3eacwu8EjTfhm0BpaEtsjtoSF4lf+5Qug5gfqtGgJHzc2Gb/kM8AdF4NxnmOV8yKDbuRv9gbSDVL2yZA+6fMBvg6HlHWtA/OXSLR6ZTQcmj/3r/HIMeXICwfMrhK8un5/0jA/CQBLmstIT/+iFHneGPUWqTClpxEq0h/8Y5780C2Nheg4gf3axYEWwSmg+X1BBx5GoRm7XamDplsmqf5D5v8ney25rF2DzWfOQlNrq2GBF3QkzAwnZzM7M3QfVBccbFmyG7qqeOiFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Um7YxCGUX/znCYiTXaHI8iRtNDMOT3p17B5RPSOgwOw=;
 b=bhIKi/LiJMa9FB42dybBqHy4lCDl5fzkmUc1fC+tIbljkuuP+hXzOJHR/E4hH5sOaOM/nOsTngPAJ68UuivQK4GKfnIqVJ4qqXO6LoE7jUbLz9/Cz6Tf6brUrSyHoVHt3YhPLjfh0Fw38Jfv5suAHJiMRpthvbyZolZ9HyWLpz8DMCsEIRXQ/yQ3ID0FkiTvTMzHt5rxahUTrfqU6G5D0wbQqiplZMroqggka/ct2ddkq//EDJfAsj+G4NW6/GSwUWFRp09FRLk2AcSDNPLkImZqtBWiQ9sNnhIQovcquYaU5Q+a2qyXYE5iJnAa91MDVF2zKy0LauO5ASyCEd5VWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MI7PR04MB114164.eurprd04.prod.outlook.com (2603:10a6:290:10f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 01:45:22 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 01:45:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] arm64: dts: freescale: Re-enable A72 cluster on
 i.MX8QM boards
Date: Thu, 22 Oct 2026 09:50:00 +0800
Message-Id: <20261022-8qm-v1-0-2a597cb3debd@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMlr2WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyMjXYvCXF0Lc9MUgySTJONU8xQloMqCotS0zAqwKdGxEH5xaVJWanI
 JSKtSbS0ATFjAAWcAAAA=
X-Change-ID: 20261022-8qm-875d0b4b3e7d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0133.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MI7PR04MB114164:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b5de21-c199-44b7-0a2a-08df2fde22d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|23010399003|7416014|10067099003|18002099003|261021123027099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	a5WTakVlEiU6bZrWTt9Sk5FMBiPRing10lqi0d0r28eB/O7MQd+pg22EScph+IXPBPPCQdb+pc4j5qgMXu+8FFT3a3wxIKoqaLrhVJHlY2NHOpZ7R+WcQofs/EMmY9dR9TnoPQr8XDzRGtO4TvFr8Tlvzjb5TkdYgeg1TaEvHk9A+Ij1jwHdXBPJb9Qqrt/Uj8e8WVpx/dflc7bFlMve7sQCxAPLE8xpRnIbm0W+1oyFJx7drP0xPQDPGDnfW2nsuOLfeUOLH6/d/gM2WFq04/bA2wSGB09NteyfcQdoEfTgHOuT8Kg9ewIhmZpStPS+OJLq3Pk8sWPca2Qd+zqGyfWEQGcbka4bwgkfu8RsyBw5eWCHsV2lqUCDMK0cJEwNqkxsXeOpVREds768NVj2U3gmbpNV0oROPMCVgMn+3X0ElIlFF0JRXuQAIWoNFu+0WePzc9xG37sFmpN5QJYEXM/BX99hTRXBBf+DJ6PGsDShpVJTguuQqrTITbD54T5e4KqA4gLzQI5bceKY6zjpJ3RknFVAXIj0/WTUslBlpMC8rPn63CDbyqhM8mphnIV9kZh8HzJHVG4/zKKCq2G8/WUbGhs3NUjt/Cc8QJFwgrTmoCojLdoef3/Hr3Qrmwxrgtjbhc3JWaTTtKqXZNxFouOtbpkueDnDEN+MbI5DTNg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(23010399003)(7416014)(10067099003)(18002099003)(261021123027099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDdZT1hjRkV1MHVweHBUWERFMkp3a3pWTmx2ek5oaEt2NTM3dmZoRExSOXh6?=
 =?utf-8?B?WkQ1dWRiMW5oMGEyN0tZOHluODlYYkFYQ1BiNGwwSThRblZzYW5hOTJmTEVJ?=
 =?utf-8?B?U0syY0lwc0NUdzVobDk3OWs3cXVYcTNWMzZCa2tNamxPemZiaUhqYjJFb0N2?=
 =?utf-8?B?RlFCRnF6WEtIU0JNaHNYNUYzRmhvdEhLSytpTCt5dEtrS1g2azR6QW92N3k0?=
 =?utf-8?B?OHdOTGhURm9BMHJ6cGY4L0tUQ0llMDZKNG5zK1BQalZleUlzQ3FMNWhuYTJU?=
 =?utf-8?B?bXNsaW80c2l3RlN1VU9BMmRtUXNtWnhQKzdOWDc4U1A0VG85Nm9oNkVSN2RQ?=
 =?utf-8?B?bEZxQWdKQ3NUYkpQSnhnclFCb1VacXhDSDR4R0IzQkhTRkd4bEdjcUZDU0k2?=
 =?utf-8?B?SlhNYUU5dzB3c0pWY1RxbzBML1NJR3lMWDExc29RNDlYSEFzaTVSUlIraHJW?=
 =?utf-8?B?R3pBeGp6eVhkYlFUNUNEZUpZVFhyTU9USDg4MCsvS3dHazg0NGF0VHl1M2Y4?=
 =?utf-8?B?YjJCcThWNmlJS1k4MlpNM0FETzEwaWdQVmVxNXBaZ3RPQnIyaTNiaWZiNGVT?=
 =?utf-8?B?VTllQjh3UUc3bHpZYzNUd0YyUTd2SmJucHQ1T0F0UytvNC9QTWJ0cFhVY3NZ?=
 =?utf-8?B?aEhNR0RkdGtnRnN1VHNPbnhMNXZYMng5WlZHcitRMGVlVmtaUzhGcjhwODJR?=
 =?utf-8?B?VzFoRXVjK0dPSFNaTFJBWitXd2U4L2R6K0lPU3U3QWpyb2cvS2ExWkdVbm5z?=
 =?utf-8?B?Z3d6ZGFwU05rWDNwQnphc09VZjI0OVFKL1dIZ0dKR2JsR0N3TEdVY1hsOFBS?=
 =?utf-8?B?djNveHpQWTBoN3JvYU0yUDhKbWN4a3k1NmF4RHZmWXhDZGJzVHJYYjIvYklB?=
 =?utf-8?B?ZlRIcExlS1V4b0pmSmFZVmZaNFQ4M05JK3FlS293SmM5c0RtQ3dlRXVEZTVJ?=
 =?utf-8?B?bmlvU2lKZGozam82aW13YStwRHlEYWFiMFg4UGNoWXYxc29qbWN1aWNxOHZm?=
 =?utf-8?B?b0R4cUM4NjRRQmJ2OGFBVTV3TWQ1OHhuSW1rQnBQQmMyQkhwU20xVFozVjdR?=
 =?utf-8?B?cjJKbFIzTDRhTVI3TnFLUnFaZGtFazFaVThjNkIzTVlLTC9vcmczc1pWNHRY?=
 =?utf-8?B?TDExVE00MXhaeHllN0syOUduY2lXcEc3VDg5WDVTYUkyY0I2cCtVaWh0VGlS?=
 =?utf-8?B?L01Xd1c1R1p3TC85c1VyektHVVlMaTdqQjhOVFcvRlRGQkxtU2wrSkFsRUY4?=
 =?utf-8?B?WHNEZ0V6R0o0Q0VOUmNKOEp0SHZRc05HVmg1UnZGYTlkYm5lb2p5Rk1DY3k5?=
 =?utf-8?B?akxNbEZLVUE1Qm5qc3pOZEhrQ09lV2VjWmJCQzZUMUtqVWdhSERTWVMwR0gx?=
 =?utf-8?B?MmtBcVVSS3pWUG5ENXN1dHJSMk5oWHZydXNRQTJaOG5jNWt3aUdIQXY1OVlN?=
 =?utf-8?B?dlF3b0VtOUZGVDRxUU5TSmEzM2ZMRmx3QXM1ZnhYK3FqMEI5b0pzMlZVcWpO?=
 =?utf-8?B?anJOTHVsdlpxamUvV1Fra2g2d2tuYWZnT2ZIWHdXenQrNTM3OHFFR1FyL2xQ?=
 =?utf-8?B?QjRQQ3VDMURwL3R3WGd4cUxPRmFzeHZoL0t4Y0k1MTNvMVY5TEsyRllIc0Ir?=
 =?utf-8?B?eWZvdkxuTXpLQWhnY0o0eE8yYU1sdW9jcGxLaytjdjVSeXg1MFR2WDJjN2tF?=
 =?utf-8?B?ZFBzVEltRS9uRXdQbGVvc2owNkpKMWtQVEhPeUxOa3ZGV2xocUxvL0pTUFZK?=
 =?utf-8?B?TGhDeitaVFpsdmQvdlJiZzNhVUtqTnR4OHBCZWJOSjVwU3hTTWlLVS9POXRu?=
 =?utf-8?B?VEpkd2ZEUlZJbktQWmRyOFVERit3QktDQkxTWXhVTXpHdUxvN09oMkk5dXE3?=
 =?utf-8?B?MTNJRDJWc3cvYlh5eFhnQVB2L21qWExjOFhBTVNDVFU3eXAvMzdlR3VYVHpr?=
 =?utf-8?B?eW1hZkJ0ZmxwSzN5b1cwbUh1RU85VWFVRDhYbVQ4YnhkSGRqbDJJU3h5UXZP?=
 =?utf-8?B?cDdlZDdUUi9kZHM3VWdTNW5lV09hbEh1bktjdnBnWWFlV1dtMFM1MC9vQ0tv?=
 =?utf-8?B?RlhLREpnaDlBZFJST1VLUFZWRHVyT2hUMnVNK3BUSUhUeE9UZ1FwazNCRmdl?=
 =?utf-8?B?L3Z2a0VCK1BqbGhxUWRFQk5JOUloZmVXZTN4aHBGeXIzYVpxLzZKRkIyYjBR?=
 =?utf-8?B?dGpxamVpUmlCU3NFdzA3KzBidVNFZnZNWHoxSS9YdXBjZU5XUUFaOXFCd3Vr?=
 =?utf-8?B?NzEwU0RDR0ladnA1R3laUFZ1NitiUlRIb2NiL24wN1hObHZWUXVyY2JwUkdp?=
 =?utf-8?B?bG1vWVRQWU5YRXdOUWl1Nmsydkk4V3pqSTEzbDNBRnNrMGM4RkpKYW1jNkRZ?=
 =?utf-8?Q?uzYmxxbO9jZJahhOXpeWc1Qzjs+hnW9Nt5H2g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b5de21-c199-44b7-0a2a-08df2fde22d2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 01:45:22.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvWfpiGE9MtJdn7u4/2IAcyKLEGBsRejXy97+Dcnn8xJJjciKqXRcJD5D2a3+lsfKXTTK+BNklpGgo38SB/oPiI/dDkujODqI50dClJxxurKsxgKjQ/s9+HhlrV2sL/f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB114164

The ERR050104 cache coherency workaround for the NXP i.MX8QuadMax and
i.MX8QuadPlus SoCs has been merged upstream as commit d44e08dab27d
("arm64: errata: Add NXP i.MX8QM/8QP workaround for A53 cache coherency
issue").

The workaround addresses a hardware defect where the upper address bits
of the ARADDR and ACADDR buses within the Cortex-A53 subsystem were
incorrectly connected, causing TLBI and IC maintenance operations
exchanged between the A53 and A72 clusters to be corrupted.

Before the software workaround was available, affected board DTS files
worked around this issue at the DT level by removing the Cortex-A72 CPU
nodes (cpu@100, cpu@101), the cpu-map topology, and associated thermal
zones, effectively running the SoC as a single A53-only cluster.

With the kernel-side fix in place, these DT-level workarounds could be
dropped.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      arm64: dts: imx8qm-mek: Re-enable A72 cluster after ERR050104 workaround
      arm64: dts: imx8qm-tqma8qm: Re-enable A72 cluster after ERR050104 workaround

 arch/arm64/boot/dts/freescale/imx8qm-mek.dts      | 10 ----------
 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi |  7 -------
 2 files changed, 17 deletions(-)
---
base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
change-id: 20261022-8qm-875d0b4b3e7d

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

