Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794430407;
	b=cBnG22r3ZlQsEZ49pIZ1zx9F74CIYOJY+bZnItjrnimrwjyjiD4WdkV99bEll8Ow50ko
	 shyElJRKvGYJh2MW6EhL9DI1BzgCwH1bOP/51ERVbQb4JJzNR/8FsTcos1wJMntHUlHKv
	 Oi+KbCz6Rp/sLrQqfL382xiy4CeweJEL5aW3q6njpjAIPTrCt+Onkuiz0WdLnOc98BC6r
	 F2QgGFrv4BkiZa1X0p8WNRFH5643xLA0SaM6uj1WgKehFr7urZLwN9S/Na8YlaVADRM2Z
	 Sg0oma+WTEdpkPMrkTMw7rk8wHKu6/IvxEwcmdfIR3YbBlrxIdK5ajV9YfvMRX83GKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430407;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=hrFkBN6Cr4Z9PFMlwrLY+4yggKszQBo26RECFxg3Xpw=;
	b=ozki2esubwC7EQn3NZEteWc8/VNj8wGNsecwaHNFqatPjBOQizXOQvk29GdCYBuD3cHG
	 TNP09iVcMpHn9/BlqnuRqMcljaunlnCxHuskWVWYukGDPjkUAc2M7MoKQ4RyW5GpHlAtq
	 W7hXzKqBcAIvaT5DNXDQTjxVSpHV9SkfAB5IzZbsn0Yj6UYBbLO8ZGrg79+lwhQKzpKPL
	 6yIei6FbkQh+pZ+HBj/PNBA/bGcbKnhOlaElgRXK983986obXQraMrkgU7Y2BwphwtYpZ
	 ghekZ6G75ZMeBDe4tn0k5MawCR0o50RNBHVaLIomhzVwLoNLqlhZC4vs9cGRuRLQ5vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mVfs92ac;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.6
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CAC606A31C;
	Wed, 11 Nov 2026 20:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91CAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mVfs92ac
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuQ2pC0BaUibOznXPOQ6I0u/2W31vRNSDykuZ8avk+lXjqknUT9XFfnqXNSlin3+64Wm+aCZ7018n+V1zyngZyxyu3ElazK9hSJTla3cA3O2oSuytSBsZtqcIR3U6bYR7gKiw5eG9P84hZz1GPRc0/+AiT/qFSJDnqowahAtXX3/d95oVdC2K7/UT+px1JFhn1fjGLaTJf73k6LrqqmR0+cu3HblVh7jjRtchnEQocD/40XDNKT1oNmveb/Pf/Y/oJibE8zyJTmu3/ZxRIdb79nIYAfzm2c02O2dRD1mcx+UtQOZciU3C3hZ5GzcR3plhbChSYrIhK3Ie2fN7WzsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrFkBN6Cr4Z9PFMlwrLY+4yggKszQBo26RECFxg3Xpw=;
 b=UzlYwHlrdqVKTz3DDdivwU6+++zTZ+NhgNdXvVpgLLLuTtJD+JXMWjJ2NYLsrwXYd9FHjLnxx6Hyg+fOr8iy2pec8yrSQJGeEPoCrOToc0yoewhe0II7pYRPuCoBKTW2jpW0CzG2nv+coxDV5RMOuk8GoNNy4zH1euMKs6obkxYPWt2tyDxl0/ajrIGLUdYOae2Y0Sqe7YYYerJ6Tdq6pyiT/M5mnh/EJI5y+nLtP5/70/4hdthIKHWlAx8mM++4+7oDnVqLGeBelP/XGTsI1zavdL3KMNkeAsohlVRWEmUD6Rq3KbagTcvsu6mAageJ8tJwgNt+CfFueisO2squfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrFkBN6Cr4Z9PFMlwrLY+4yggKszQBo26RECFxg3Xpw=;
 b=mVfs92achQsFyEs2N4fdHRg3FN5Fv+1OtudAlaBI2a2Nj1JKu2ueYVbpgkQDOYDQ8zQiuCbDTrec62lObJkZ//GfVo4Y09z/j4lqIvH6amdF1X5Wg84rQi8oQbVU7U4RWnT4jUjUopPgNCOiXSyvd+mVkCk4GAcZNMTXarcG6nbRYKj8wyDBI77QNq4+Sc+ey1UBYiWEjRBaoR+I/njRfRicSoMIAu2jJBQqoyCnaIteysfqBrzA1qsnZLoo4yICHmovW7DzJe4zrda7HG+wKMiQWXUH3aaS2kB6tJQjh7ahZHol+vNp24gzOoKOflEnjMgSypURCPuFOXtMfqVefg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAWPR04MB11609.eurprd04.prod.outlook.com (2603:10a6:102:50d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 20:53:22 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 20:53:22 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Drake <ddrake@baylibre.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-11x11-frdm: add HDMI support
Date: Wed, 11 Nov 2026 15:53:15 -0500
Message-ID: <179443026886.3949758.2047996172987393051.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-imx93-frdm-hdmi-v1-1-5b05a83ed208@baylibre.com>
References: <20261106-imx93-frdm-hdmi-v1-1-5b05a83ed208@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR07CA0116.namprd07.prod.outlook.com
 (2603:10b6:5:330::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAWPR04MB11609:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4a011a-bfc5-483b-9e0d-08df4035d2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|23010399003|18002099003|22082099003|261009223027099003|3023799007|56012099006|11063799006|261102123227099003|261022075727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ICuBaLTWMjXnB6gVoZzcvAU0AigQ5vgCi3V7ToC/JV9YAcTL2sPISZzHvTqHvl/4GLxmqzB/RagY4cIekxQpM7FHIFyURqnKoV+mUmrQ4Gk/duiohvzn4wBCECpvg68Ni99zj7bUwYofdJ1kuZjCIEy8OlnyRkA/bn8rUvCM8V7lprYG8ersJiaT580AS+7eZUv4QtRxIz3Pqpv7uvusD4Tc5BlsN9Ysjpld50ptPI4amGofxIb3LofJ8BaXt5LNeyb2o5oww5xWgA+4hVk3v/gJRhcUJTSlVs612Z3UhKycdSn5hl6NekfQcUkK6eRu2emBF4oegaQZhPPIBcyFnAa1PQ+tYYiqh7/dfZBHkawNWHDtkYTXQQ2+k3f0WsWaBsNWbJ9mWgSwCEdkFpl0fH+aC5tAjGEUGuZ+fysAxUEClm1islh4SQi/UTgGrrkRsUCJauAbVAAJfJPP8Qno15C8hCCePr/DrxESACg4iylGoM2+sAOwrjSmn6+1D0UfhOwKfDhtcsTA8XTKSDS0toGEt/d++jnt/x5fgaeoEmzxNYYQ2tZDpOzLkxUN+fCXUgE1+o+mLmaPwzzkALyOEFSgTeRc7nC9pJ4Ytcq80LtVxJ1IpEC7VzgX7MNGTeicJK9ckn52tJFKxZEzv1cJx5RaY2sDol0ad7FpR8CIe3M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261022075727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enB1R2NiTnJJQ2xnZlBCeTJRZGIyM2tlSGhvR09GQTRxYkx2Y0grMVZaWVNW?=
 =?utf-8?B?Uy9hdVBnbUxsWlM0dzNCdWNzSVBxOXcvMG5PVUUxNkxzY0JHTzRnUjU5a1VM?=
 =?utf-8?B?KzVjVXY4c1l3Si8wZyt6WUV5YU9kUkhWeHJLUlJTV2VybkNmUlBDKzg3eHo4?=
 =?utf-8?B?Y1RJK3pXUDBRY21HZTdGZ0F4UFR6YUZ0bEp3MXBHQUJ1YWdIay8rWjA4Z2Q2?=
 =?utf-8?B?YUVDL09kY1k3UUNaejNPNWdyd0NrZzE3OVh6em8xcFJVeFBEOTdTZEJiUzQ2?=
 =?utf-8?B?OWtvM3Zua1N1c25wZndXaW1pVnRVYlFEaG1NV2RjSFpKcTcrMzJmU29aWmNE?=
 =?utf-8?B?YnU4a2JQWWgrUWhWNGFnSmNXd1R6bFNXcUdHa01zSVBqZStqSDhqSURpMVJH?=
 =?utf-8?B?RHIrRTlZTFY2VEpQbFErRWlYZlVOTm9IVHZZeEJFVlJWUjE2NnBzZlI5VVRW?=
 =?utf-8?B?Z1pKTThqWGtibXF2OHVjUmE0bW81R0RudGYzK294ckcvUDY2YlBWb1Q4TDlr?=
 =?utf-8?B?RDN0R2pCbGE2SzdIdldZUjdkYitiSU9HSmdEbWJHYUhhVk1Kd0hlZTl2UUhj?=
 =?utf-8?B?dGoweGJURnR0b3pYTDI1RmY5KzYwQVIzUGJpRy9hbUF5dWhqZlAvdXN1WmFj?=
 =?utf-8?B?OWtTMVR2Rm9STGhZVXNHNnJuTFBobDd4bUk4dGZQV0JscHBrRWRNSHcwd1Jp?=
 =?utf-8?B?eW9aRWl6Q1BmMnBieDZUQkVPMTRwQmlSRVRCa01CLzE5akRBN0FsUHAyQUN6?=
 =?utf-8?B?aGJSMjBqMEtjcnJQeDNINEJqZFk3U3lSUzlSSnJwOFgrOUZvQ0JoQXltOWNL?=
 =?utf-8?B?WEczRjB4TnlNQXFPODRmM0ZycnoySEdyNVZteFIzenB6cWZZWmsxMUJJa2lZ?=
 =?utf-8?B?TXBVMXRUQ0VnZ0dWZ0l2bWU1aFMyWWVCZ2F2RUZicFVoTHpyOEVVakxZR1M1?=
 =?utf-8?B?dUVraDdSYU4rdjh0V0FFei9YUEw4UDdkV2tFZFhmSEVrdURZV0tEeVNhYkhu?=
 =?utf-8?B?NDArRC9FUkorU0RtaURScEx0NDJwNXBJZzk0Z0thcnlZZW14RGlyb3UxVmZr?=
 =?utf-8?B?RndsdWFIWXNtVjZ0NnR6MXk4MGJDcmFLblFyT0dYVGYxZWtLMEVhNWRxcDhC?=
 =?utf-8?B?OFp2K3FCbUZ6enRBMGpiWmxWQmZ6T2g5OUlGeXBnRGNZSi8wU1dGam8ybVNn?=
 =?utf-8?B?ZG9Pam5wVytlM2pYbGN1NTZ6RnJjdWloTWVWdmRzMU9YUEpZSG5ZOGJQUUd4?=
 =?utf-8?B?ay9OenhmN1I1bkFrVE41OVFlMTdiSmRYREZKYUp4SGxOeXl4dk52MHROeWpp?=
 =?utf-8?B?bGVyRzVaQXgranJsd1VaZWZHNVZKek5zaUhvekdnMTlHZVFlUlVXR2oyeHor?=
 =?utf-8?B?RUpKTXhuYzVoMXRleUJEd3pNVVo3amZUdm52Nm5OL3pNQWNFNmtHVUNaZDht?=
 =?utf-8?B?Wm9MWEx3TkFPK1VOUWpJbkRwRC9SMW80NDJVTFNGMmVzODFGZExrY1JHLzZB?=
 =?utf-8?B?VnFxWkF0SGx5TzZ2bHJERVVVS21KNTJwMXFRMXNweE5rc1FWZlNGdUxKSTR6?=
 =?utf-8?B?KzRvTE5lMHlzUVAweHNDd1dxaGFrV3d0VjNBU25QMGRQUDlqa2ZaaDNLZlRy?=
 =?utf-8?B?YlZZMHdYbjBQQk1lQzZSZ1pGSVdmRk1NcytLVFRHVmRndU42eG1xNDRSMzhp?=
 =?utf-8?B?VFlVWWprZ01IWGJIU1d1YlVOck4rN0dDTE1SOFpHeE81TDNhYTZZeHpGVHcy?=
 =?utf-8?B?OEdCdTFHVGpkUGxtM3B6QUtqN3IzeFNsU3grcHI0WXRYNmxjSGNTaTJ0Vm9y?=
 =?utf-8?B?R3NlVUtJbFRUeUFiUEFucUVyWkdCczJQZFY5cmQ0MjFLamdYaW1sSkYzSGx4?=
 =?utf-8?B?T2pRZ1YrUnJvWWdvdzY1ZEhkaThDWUFBeS9TQmIrUGpYQjJqY2pDaWVkd0VH?=
 =?utf-8?B?dE51YmNyZHVLQmpFSDRCcTNDWTVSMzR6NGVMZGlNb0tXNUtOUGhVSk44eWE5?=
 =?utf-8?B?ZWE1SE1GTWovZCtEYnJBUUM1dENSb3NpRSt6K25RWlAvc1NrejVycWlGMUx3?=
 =?utf-8?B?ZFZrL1FranNHUXRaV2J3OTJod2hXWUJZRUYySHk0TEpNcGc0ZS9SbDVsWjdE?=
 =?utf-8?B?SHFNVUkxM0E0ZFJOcGpuN29qTW9rMlByMTcyNTdvZUplRm0vTlFTei9Qb2dh?=
 =?utf-8?B?ZU5lbGtpTHc1UTJoQVZwUVNOREN6OTg1dTBEWDdGTnRzMUx4NDFlNjREUHow?=
 =?utf-8?B?bDNka3NsOXo5aEJHc3VHUE1xWDJXZDFCRE5PUTV2SVRIaU1KeGtOcFlOcEps?=
 =?utf-8?B?Ukx3WE45T1ZDM3NyZFpHWjZFVEtKYmh3YU1peWR0UHJtZkxLanA0Z0V5UzNB?=
 =?utf-8?Q?tJcA6IkSBcs9xZhKZYVHu6d8RvCkiWsK/gxgF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4a011a-bfc5-483b-9e0d-08df4035d2d0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 20:53:22.4806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsYvJOb8b3NO1SCGChznWI4tQyxLcNKGv/o66FSVjw+qB3qrIh7TAp3Eeo9tLnQuAtxUcT+5nqnqkLpPnFFvEBJuZcz1wHhx/AvjrT0dpJCbiPcxze8aUXXVNtvLPFFF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11609
Message-ID: <20261111205315.Vi8OdBE9hL5qDXZaVo-JV_oUTsvDNIeBT_a2YxOrbss@z>

From: Frank Li <Frank.Li@nxp.com>


On Fri, 06 Nov 2026 12:59:59 +0000, Daniel Drake wrote:
> The FRDM i.MX93 board has HDMI output display path:
> 
>   LCDIF -> LDB (LVDS channel 0) -> IT6263 -> type-A HDMI connector
> 
> The product schematic shows that the reset line is on the PCAL6524 GPIO
> expander port 2 pin 5 (which gpio-pca953x regards as offset 21), all of
> the 3.3V supplies come from PMIC BUCK4, and all of the 1.8V supplies
> from BUCK5.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx93-11x11-frdm: add HDMI support
      commit: 8b779a264407d718ea96ca34d0e09abacbfa8b6f

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
