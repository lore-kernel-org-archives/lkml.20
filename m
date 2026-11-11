Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794380267;
	b=BP8YZtyLVQLtTAi4Pq8nxYMIvfzBDtJ9kSLbmhmbK7NHQE7NuSfjP7CDUm+j3F4S+0vR
	 PWJrpAbfbNVQNkjoLQ5EgxziAW3N33q2O0Nv5CoG6XkOjZxORnG0s7TyEK73NBqLmdZa0
	 BTtRuRNCeToeVxhKS+jVw4iQ90SzTSMOY+pz0v7Db8lHyk+D0hOn3rvP8+u6yxYcpbNto
	 ZP9/pVqinNGEVKPhFgw9Oh01N8LkvzsoWtczZ/Ca23pd2Gy4pLegCCubb+kank0vp0gTD
	 Hp1SR10AnEHnG0Q6MrviteHD2ydFpdELdkKZUpLOyYl3+Y+eoKbldWczZFddjRFSW4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380267;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
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
	bh=m1yY7gP3zCE1rvF0SbDtsF8YPpNZ+HAmhfSnwN09JCo=;
	b=sVQZL+fmELkTGVTXdXb7obcIJvaxBx8Akel4d6gA/wRXai1SRaVwWTq5LuVz0nME+Das
	 QvCWoF7celZh+PIPnz3e3Jvsr3XFCSrX0+CheOTG/pin+XJxAxf0BMVPJpiPlqWeAPwXY
	 aSrS4soHMoEDVhQObWk7z6l1U2wlHGCBVZ7dEEmDh6kN6J3GN7rbvFYL0eGjQobr8wiys
	 vBRmOKYW4AC+GyoAqeWSi2kJayxMuyQkDJUkN7inmHXbeatrLsOqpjJEkUS6t2T0S+s+j
	 dllTtNStJfCDrmE+EWlEa2WiB5uJRxroz9vjEaK+yY2lh2o+wes2Kw4jUxkbJn0GRHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ahtzaed0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.59
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010059.outbound.protection.outlook.com [52.101.84.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B67B60A5BE1;
	Wed, 11 Nov 2026 06:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B67B60A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ahtzaed0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+HMRWAxjRBibOoi+hhyQxtbZbvZBBEw9DLgjvxqU6DMo5u+pwT7E3UwgHiChw+rCk+R6QgizmU5iZtP0r14AEit6NS8CzSmVpMI677dVQpEgOzRAnWMg36Bjxd+hk0Qj6Sv456eD7tYM2pK6Fy6Z8LLJYk+nJ+U9MqYdMLAboWXvTtdsPiYAx+vNtPMoxdTaIA7SkchJC7dUf5LU0TvRRqb8rQIpzHJeb6D1/BqhtcHz6Ft8WOhxIAdEizTalUOLnS650RR7Ml3N99o5c4WNejuJaNnINX02Bk9ByJeFQobo2zvTEiJowEZBpp0bLIo0/Oy8PEr55C18qY+KNg0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1yY7gP3zCE1rvF0SbDtsF8YPpNZ+HAmhfSnwN09JCo=;
 b=IS+YMFFkOdyJBY3jZX5fdwJ6ItIzdtVzZzQoY73tKc277GHJKZ8sDVYpx6A5nqSw72OrmL3XSq7xx7ZhuQeVR5ke/fiGg4aCp9lKK19kIWho39grQ0DjM1tCGWf9Kw2Av3KBEjl5SUnRK4M+hJKIfDqHv8bLmiiSbtSpUSVvutwAlu1WwuqVVhsQIgvDXY/cEadr5X0TfC6PvfKb+lgZwFMdrTBLmXbEYdp+yVkRVD/7JSjSgITQB6X8RGqsaTUZh31A4CtCnC3SgsgqHCy/oXZ+rDa4M6SH95hRf/M0gQHYXcuO6LQ0SUL8IWEAO+NCcBIv8uB7RxSgQBX38X7ToQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1yY7gP3zCE1rvF0SbDtsF8YPpNZ+HAmhfSnwN09JCo=;
 b=ahtzaed0ub+tZp/SndEOWH5j1Y5R4fkwzAJA4Ohm7Vvk1bx9QELaJQSuLZ/hgAU8OKdPzG9YPXR9+leRuQL1ShGV/3A6iMciO0C7LMXIpFha0ZaxOGkl25ltiYXpwltu/Wq1EZZB1ckaeDrlH3SIzdB1PTksBFaExclO8GLMBplFaZNFwzP23zWYQgUYXUdxMkvLXVluh8cV0ey36wDJK7Y8XwFlCZ7Z5Z11C++WjAjFKzo8veXgM+JjXecdkk3RzWRvIcjy3Hvm9ZsbKifJYLHfhdB62r1H0V/DYAxjMClEBYvP960zq9EpoMoT2dadB8yDJHM3jS8uk4s+LJZwjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AMZPR04MB185575.eurprd04.prod.outlook.com (2603:10a6:20b:7c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 06:57:44 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 06:57:44 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Date: Wed, 11 Nov 2026 15:00:17 +0800
Subject: [PATCH] arm64: dts: imx94: Correct the lpuart9 clock
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-94-lpuart9-v1-1-2deb072bb1b8@nxp.com>
X-B4-Tracking: v=1; b=H4sIAIES9GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINC1NNHNKShNLCqx1DUxMUm2ME0zNDY1NVUCaigoSk3LrAAbFh1bWws
 A0Pq5yFwAAAA=
X-Change-ID: 20261111-94-lpuart9-444c85f13555
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Jacky Bai <ping.bai@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sherry.sun@nxp.com, Joseph Linares <joseph.linares@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794380436; l=1162;
 i=sherry.sun@nxp.com; s=20260723; h=from:subject:message-id;
 bh=0MCCQDSdLSPdO968DG0+fZk/HJhOsX+SJLpk/sMPyiY=;
 b=7tH03IcYXnTL2/bM/iaN9X55uyGVsC0tqzpAmpyFCTrM37V5ZSWOQK+p+l1x553pK2cfFBPEp
 50OCdm7ktQQCD9tGGLlBfrFrmF6AnrxZltL0YF+PByScPVjTadAKTLC
X-Developer-Key: i=sherry.sun@nxp.com; a=ed25519;
 pk=YnYnIFJ2l+5v951x9shBVfHhminNi+3LTfFa3PxSdnI=
X-ClientProxiedBy: SG2P153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096::15) To
 VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
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
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AMZPR04MB185575:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2a1cf8-30f3-4e28-043e-08df3fc115e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|19092799006|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wOcXlohgaSsZdTcCvKz83uMultTc7V87yh78CQeIbGR05F6OqYbHugI3yyEv2gA4q372cvscAxJnhIOQdLkOwloStqQAklyP0w2C5DaO+OHSNF2LZ+1WzOtJX0zXg6WOnCl7aa+c/uUhe6wLhpp5VWX9+tBSBKtcXRF118Bb0e0i2aq5uSdAjoxlt4Z9NIuwMxs85WF/HGzL0d6PiHDvX54JEIW/X+k0wX6ioon7lbfZASsOlTd4ZCyvPqNRlScdqM/RBUvUZ79NOX94ONnNARwOrl3Y+Wy/2ZUS0pNFWrBKXyPKWbnQmR4BJzu64uBNsUzq73IEiuXZiqUIGRZ4orxA8vXt9tU3yGR2e8sc/eMtdT7cSOjlcRoa10ZGIMrvgUrMtI6VQKZIJJPPlaDehPyFODMXWWEyVmJmOkPnE+KVlrevF356+sJ/jYMHy1jTspSOaCgVDKRCsI4JJqD0wXQ2VrPbIWqbzg6Yt3UnUYpvtOvq7EcfE/Alt/X2Q3Kly7T9bjDoAJ6jrClxc0fqhhobdmfS/8Lna+7RsezEqd/7/rIHIu6dsVH3PvMFitZylUb6s7n7otPX4LODYsYAkX0SrHiJ5sxf/O6K4JaSOy6ovzHzWWZD2qHDeej0mtxKDig9SUqxUTtlCHqcSxu+M7C121mykAjJsc8SidpeD9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3gxeGZLYUdVK1RTVGpsYyt3SFFWeEJ4MVJFZUdmbnRRSmp1YmRUWnNzeXRr?=
 =?utf-8?B?cCtkVnpPKzRxWEVicWh4RkV1ZXZJRUJibnpBTVA2M1hDRk9NTVlDZWlGNVRn?=
 =?utf-8?B?SXAxVm5pN1JzV0V4VzlQYVRucUFoYU9zNU9WWGx1VUpLb0owYk5NdGxKbHhH?=
 =?utf-8?B?SW0xTDBpcnk3a1NxNy9ZSXdBKys2YVpSbE1WNUM0UHBWZTV5c2loVmRNd2ZQ?=
 =?utf-8?B?WHJDOFBJanh5SGczYnhlV3UzMHp0RHF2cHFZSmRlMDdEeDJRRmw0aXJmWjNH?=
 =?utf-8?B?UXU3SUVnMEt2WHJ0Wkx0Z3lmcG5ONFVrb3BmcHY0ZFJTeXNNVUZEOFlid2ZM?=
 =?utf-8?B?UGluODVrL01mcDB6UlRNTG5qMkJDL1BkaS90MCsrODFRcHZpaUF0bzhpZ3Iw?=
 =?utf-8?B?RGEwRlZCMXAyUGw1T3JJUHBuMk1MbDJQQnhHemhvL3ZRM2d3Yi9IZytFN3Bu?=
 =?utf-8?B?OGZuS2tzWHg4NFBxeUpZUG94WmNibHo3azYvUWR0WW1GcVdpaHBYZFA3M0VU?=
 =?utf-8?B?VndDWGI2QzQzcjFlVlFELzA5TEtnWG5zOEV5cGxkWU40dFJuSVZsWFdITnpO?=
 =?utf-8?B?N1lFbkVCMkxNZWtBUVJKMTI5WHVUNHBXN0hYbmZzQ3FaaHlvTzJyT3BReW42?=
 =?utf-8?B?RkJibC9MWDFBajZJR0VubVQvKzFQWElNVkEwMlhjbkQybmNPa2Qva0R3M2RJ?=
 =?utf-8?B?VjVXREY4UFNBa1lqeTREamtKVzlxcUx5aFc4bHRaWmNKZjQ2T3U2M1lhWDdw?=
 =?utf-8?B?R3kxd3FyVVRMK0tVZWtHLzFXN1BPVjFZWXdKd2lJT01TeVdsaHd5SWRKMHBV?=
 =?utf-8?B?Z0pEKzROOW81NGQ1L3pna0l1SVpnUDBIZFdvSC8wdFllOVlNMHZEU2RYK0ps?=
 =?utf-8?B?YjFLSUllNkNRMHN5VXhHaWNyeFhTR0t3T0ZzZStGUmxmUHovTEtsVkk4QW05?=
 =?utf-8?B?TnJTMUFtUmVxTk52NnhOSXhBcFhUSmJ6ejVGbjNyWW0ySEozZ3ptMFBHQVVL?=
 =?utf-8?B?aVVTRFFZN2dZQmt4bklNWERuTXl3Y2E4UGIxZ2x4eldlWnhnWk1sNTBNYUkw?=
 =?utf-8?B?ZlhvNkpkK3FmMHlOMjcvQmdrYlQ5cjFYZ3VHdk10ZFpXY0tLWTRFbzI4UXJR?=
 =?utf-8?B?blgwYm1mUEE5UzJMY1dreFErT0ExY3NPbUZYZVYxc1VETFQ1VjE1NWR4Uy9Y?=
 =?utf-8?B?RkxDWWZTMU1YbVJjUVIrSVVzby9OelhJREh4eTJoVVZzMzZqNlc4d0lCdi9l?=
 =?utf-8?B?U2UzdjBjUDhnNEZnZGFCaHRyQlhDNDJDTDducGNiTnNJZXZyR3h4UjZOMkVa?=
 =?utf-8?B?WmhSd2lNVW1lUnlGZ3ZJb3pnNEQxbE5hYXpzbDBiU0Y4MmhmSnJIbHF3VWUw?=
 =?utf-8?B?SVlzd1JLb0xUR0JIUEJrVjN1bGFDS3ZWUkZaVklhT1dzUkhjSkpHK3ozc1ZD?=
 =?utf-8?B?dmVQcTlwb3o5cWE1SmJBb1FHaTdJY3U5NmpxUHNaQ2lrM2Rra3lNWEpwRkVI?=
 =?utf-8?B?TzZUZHo0eGYxS1V4SEFNTVJpVk5CWWJzVkxzejUrWDdIc0RNSmh3VmZRVW5r?=
 =?utf-8?B?dkRpazkvRVduRXNzcnRRYWFidmZYa0U4R3VpRFZLcEF3bERoZDNmNkV6Wnk3?=
 =?utf-8?B?bjdyaTR5YmlMRkRDTWFZbXpKWGFhT2o3bHRpUFhPcVpldXg2bGpkdm1LNFlH?=
 =?utf-8?B?UWFPU2VUbjdOSC96azdxRm14amhQcEYvOHF2U2UvVTFwRXlKVXk2Q0k0ZUdV?=
 =?utf-8?B?R3RyZCt6M1BFa3NoazJYWStCb2RnaCsxS1ZxNTZhU3VqZ1I0U25MZFhldnYw?=
 =?utf-8?B?SEQ5eTdOT0FyQzNFaDBtUytLU2pGUVFvN3RJSDdvZ3pkejNKZUMzaEtxZEpW?=
 =?utf-8?B?S1l3WE14bjRON2tZdmE0WWlVMmtZWmpsSUw1bFdPc3cvcWF6ZngzM2VpTUxx?=
 =?utf-8?B?YzArU0ZmSVdva2dsd0dRSjg0MDZpUm1yd1Bpa3NNK3FCek1lOUpSQ25YOFNi?=
 =?utf-8?B?cExocm1JeFVuVk04bDNLUzZsZ0x0ZmM2RG5HZzd1Tk9rYlhnS2l3NTdpTmxq?=
 =?utf-8?B?dFZRa2xYKzVFc005VmpkRTFuMVhhQVNUYy93Vnp2TXpIRk5NRW1iQmFIRktl?=
 =?utf-8?B?SUpaLzZyYVNDL1FUelM5bkZhL3luYnJCSWRzZWlHc0dXN1JNRCtDUnJ6eHhH?=
 =?utf-8?B?ald0K0Npc05tdHB5QXZVOVRZZ011ZkMvbEZXYzd5eWk4djFwN3dSbVZXZ1lO?=
 =?utf-8?B?STFFMGpNQW1yTFpubi9aR1VxSmt6SFRQMHhyZzdoT1RBcTBaRlpERCtPamlk?=
 =?utf-8?B?ZlVxejZ1VGNzTUlmRk1ibHhWZ0M3bXlYaUZKTnAxWXNSblN1VGFnU3Nsd29L?=
 =?utf-8?Q?WkDmOUTq25wiLzljys+51H3ZBPx+GDPjjXM64?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2a1cf8-30f3-4e28-043e-08df3fc115e2
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 06:57:44.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVk07Q5k4XVu7QyBSxI3qyTgv66/QUunbvOs1TpB5bex1aGhZV2PyCl0Frtk6BX74Q6pkVDBR6xKapZjXnspJGYe6FAUsdsTfKr3Z1TVpMEt7KBOPU/QrDLxHV4GEBzd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB185575

From: Sherry Sun <sherry.sun@nxp.com>

The lpuart9 clock of i.MX94 was incorrectly set to the lpuart10 clock.
Corrected to IMX94_CLK_LPUART9.

Fixes: b0d011d4841b ("arm64: dts: freescale: Add basic dtsi for imx943")
Signed-off-by: Joseph Linares <joseph.linares@nxp.com>
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 020aa1da3315..7dffbf1dda20 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -720,7 +720,7 @@ lpuart9: serial@42a50000 {
 					     "fsl,imx7ulp-lpuart";
 				reg = <0x42a50000 0x1000>;
 				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&scmi_clk IMX94_CLK_LPUART10>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART9>;
 				clock-names = "ipg";
 				dmas = <&edma2 51 0 FSL_EDMA_RX>, <&edma2 50 0 0>;
 				dma-names = "rx", "tx";

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-94-lpuart9-444c85f13555

Best regards,
-- 
Sherry Sun <sherry.sun@nxp.com>

