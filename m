Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792697857;
	b=3lewmQtjV/Zq1mN58muRox2L+2dwHYOot7QXUXXU3fXN0EkhmNsjVv6631VccWRjiI4s
	 fs3wTYeSyk/XOCW+eSECY1s1PEJyFtqAlGKt4N8tsTXQ2YQ4sVR0ADU1pGFV66MM6HplN
	 QThTaq5Ev/sDEdPe3SUH7ctL1LLyum2g2d/LjUsdpeChGwiu3GX3Ios4Iztez7CeYWlZK
	 jVzf2Gz01apuFIk93vLIR8ktJ7Lq7REyi8kTKV/QQv+Tjgp3J6q0tfcWWathiXVafepQ5
	 fZBcsqo3rU7HQ/AljBXNhtincuId8IDilBX/+cFrnAFTRm+sOqsjRHzn0QPkvgf4dWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697857;
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
	bh=sisBM2fi8skFUhckybQqGR12Y5cGVK+OBAKpCQcJhCg=;
	b=KQE1BAPRB5T358IiAg2d65gfn1dR7P0oVusXZZKJVKA0Ula7IQClJd/y9CJQ/dwM2kRa
	 SpD1iEDfd2Y1qRjafzj7X/brTNz7eRqnOBcP6hFNTEnc122wYFADTGlSvCSRDHeRX5YoN
	 JSatvStuhmG3NrLqFMdvfhBDFYbmgaEHWHsQFq9t2vJKArq4PfKYFHZVXU2UqQpiLN51F
	 faD3N8xzcOFK+oVyEPW7GbQubk7Yf4pI00TyUHVKbt1alHtz736v4DPDOhf7Uk4Seud9m
	 q/OgYoa5mkvSLsBseN+rl8FtkDAXQ1JnaKV3Rt0DISynR+16P/+b4cY26VGrWQY9AUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=x1GZaQ6v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.55
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4C7606A339;
	Thu, 22 Oct 2026 19:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A4C7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=x1GZaQ6v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZP7i/vvZixcTdg05XCbiBzbA1IYR6f8UbzFmVa+8IxzBcMbzDjNZer6ULUwJ+C//YN7grIUV0wqA+5pBm0c7dGk7SxsIwrVa9hEmOOPQbzxkiKPJ6k6tMWE1wAcOKWZpbiBnBhntv+wkKOsp9xKCeTKWgYFA9FXoPg+LuMELow8Xb47QqxQcBeKNz09a61ozqsXgw6YvyIcLdAodk+qk9EtMm88yiN1ysIQqiLLzWsOlcjl8C4Hs0Yp0QDYUD22XPPhkDVHY8LUpj1EmXKm44nzQZYhSFgVbZbJA5lslMODpOd7yZv1des9FQ2MsTz2YJNpK7eGd4tA66btWpqvzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sisBM2fi8skFUhckybQqGR12Y5cGVK+OBAKpCQcJhCg=;
 b=pOujJj0RZvH0H30xLod4377nkTOl8NNguRAr4bTfWGa5Rh86xK+jIUFOQcl6JWYYInhKnG4dhNxJYOoBWosAjVF+G4ZV1FULOPrIvS2W7doS5/TVFOn8lJHaXK0Njl90eSxSZQH5/UjJApVhOUk+M7Upd4C6ImhuODcOo3ypPIqW4g+y+Xj/tpNBiw19CSdjZq/wHGHHM7StijCXmu0yVoAp4efZou2/POt7GJsaH1w8BBT6QPeuaQeSi1v/8FNGBy9WQV3w+b8GNJ/88cRUjAOXjaYxNBeCCZncP1wL0G5yc3/Irn8iVH5OvmFc34KCUNeBsE8IFu/S4xTlwnRINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sisBM2fi8skFUhckybQqGR12Y5cGVK+OBAKpCQcJhCg=;
 b=x1GZaQ6vwAgfBbHmuNtcLHYt45fEov7q2e3hOpasbpfN6JwX/odKPsr14fZEHpdnGN+aYzHTfGZ6KDA2sg5G7lSDQPaBVAsL/2qfzA+xikrtRIA/tuiNM905BvahGieBRwCdJfwAXUYA41pysqHPVoi5YlqK+z4isZOmdv3zbxY+vwTucdP+EyNm956X6RpZ5YxEeHAkCurXWR4k/I3sx6Ol0YF7Rb9xrMPRYmzja/Gvo3zpg8pDEgE1IXfh91S5d01X+KB5Nbv+7a44bxXZ7OTsKQ/UTFVoHc+acwr+Z9bNkFXv4K4Czd41CBPfKNVEebpkELxxilLp7IiKNduxIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8679.eurprd04.prod.outlook.com (2603:10a6:10:2de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 19:37:34 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:37:34 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 22 Oct 2026 15:37:07 -0400
Subject: [PATCH v2 4/8] arm64: dts: imx8mq: remove #address-cells and
 #size-cells in dsi@30a00000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-cleanup_dtb_warning-v2-4-e9502fafec59@nxp.com>
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
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792697827; l=1192;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=2hjxFYjM184iv7z9soIOe9pHLrbg4LOBg5EeV8Upb98=;
 b=IVRNq2yPawCgzq928n0gNwbRj8QCdVuiI1h9cSsVvNR3K2DXuId12zvNUz3R1dxNHTMMnm0ek
 DVSRo4wVQxBBcoLJR1n4AmTGQ1cAXK6zQFHuzECX+xk44FOOgR8ub7r
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P221CA0042.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 33a0d032-fc88-499a-c68f-08df3073eb6a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|19092799006|366016|921020|56012099006|261009223027099003|11063799006|10067099003|261021123027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 ow2SSC/qdHquSYdan67nhrBJyd/JWCZZgczmgWOOYLV+qweOjCgT1SIxwjKsWq4ypM7Sfz/GE69NAPNE8VRzr3vyztiAoYvqjfVrJLQvg5/vEBBPA8YrGBpbQHobYA1gGTUzzb+dFopiV36PDOnv46k+gcHjdsc1cS5TySGoTNqdkU0phV59112YDmbXnKxq/JOJIraaP+UHqTPSF1hNzVUPbhrhqqf1HlFaC3dtvUrPNLop3x8V8Qk67rLsEauYGGbCgP17O8k2kDcKmqp+j50TazSytKpzBf7GD+DT6CLP1pPHv3WApZi7StROUeCIH9wC8b0VCqg+aY5j5aKVCxBd6SKtsKC9kedmn9isdCMeAnvEJe0ktUvuBxcUED1J2PQeiLOrR3JJVne1fMeZq19hv7Yaw3fh5QvKhG1kLrWYdJLh0kFzvZI+7Upw5f6rq1WcYaMXCU+posl4kuvQ+5pi2Vi4EKbPayKntCxnglF6m/GEEvXYKO4M4KvxNJDrG4Gd2504+mNQ5yEkvVYNapgjYPnX8Xr+iDbuaEiCGa3G17LyeKECTgSYhQktG03K+lh3u7Gk/XSreyHkDazqf+Z5NKsgqxrwZ9GELpqB4i8bxDLMTw0Z+y5ds5Aat3KMOUjsfz6uJovq0M21pMoUitrh0yEAgjNkSG3/CAwwS/d2DlS6smXLZqfPATaEPHrC/oz6GuLwmp9BIs1rnFOTog==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(19092799006)(366016)(921020)(56012099006)(261009223027099003)(11063799006)(10067099003)(261021123027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Tkk4bXdFVnNTWm9CV25xaGF4ak1vd2pzMlJRMWR6dHJEamUwaFlmVnNuL3Mw?=
 =?utf-8?B?aGlkNWVHMVNyQVBFOGlnSEkwd1ZaL0cyNnJwRWFITGtKYk5pSHBCNml0Mm5p?=
 =?utf-8?B?OWZwYjRxdi9nYVZBTE1GWS91T2w1UzJTcldtaG5TUTVyeVpXaS9LSHo0VEdZ?=
 =?utf-8?B?bS9oYi9kWGlxODgvV21qWmxRaDRlMWhad0E0RU1HWU9UdjN6d3loRzBxM3hx?=
 =?utf-8?B?SWRyV295ampSUjFqTXV5YklYUkJuNHkyK1g0dDNIdEVJTjNaY3RsTTBLdkov?=
 =?utf-8?B?N2dHdjRZdDRiaDlVQVl2dHh3UkR6NzYyREIwc29RYVhmcW1iWnZtK2t5dER4?=
 =?utf-8?B?RjhpQTBBaVdCZXFGQ3pXSHNSOWI1azQ5RkkvdXVIOUNpOG1DbGR5cnYvbGo0?=
 =?utf-8?B?cnIwSTYxR3UzSENXbGdGR2JGTFg0SzN1ZmVmNUJqQTZ6cTZiK0laN2wrb1pn?=
 =?utf-8?B?R1NvZWlBeDlGdU9ndXJtR29lOXVDWHBlZFFzTjMzT2x0c1VoQjlzZ3poR0ZI?=
 =?utf-8?B?ZENiREJXZkNuUzBYMkxjaUNhNDNOWnVGZXdzZnZKb0tWZ005b1NxSlg1bXNW?=
 =?utf-8?B?R25YaVp1Yk1scGF1a1RzZ3BpenpLVVExcVlaSnJxTkRqZkhBUXNRaVFJTmdD?=
 =?utf-8?B?alc4aGN4OFlZR3ZCYUJBanlpYWtxUk9KZ0tEdkFzd2ZPMWRrSnhGWTkzWGFJ?=
 =?utf-8?B?dXMvS1R1UDhJTVhVa3h5dkdKbVkwZFVOMDU3Z1M5ZHNmQWprajNHQ1c2bExD?=
 =?utf-8?B?dWJBZExxbjJxVTM0K1U0czN4ZjN3aTZsZWkxcy9kdDVZNEVBb2xMQ3QxVTlB?=
 =?utf-8?B?MFZuVlEzQURwcVBuVEl5VnJkYTNnTGZXZFM4blh2ZHovQ3p5ZkVkWDBwQmdZ?=
 =?utf-8?B?MnhHelQ3bURpWU0yMnBtNWxtdndRYXpCK2RRNHEzN3h5L01obnNJY2tnNDBs?=
 =?utf-8?B?Q0pWSlVkL2djMXI0SSt4Ymo2ZkhsUDIxem9xdG9zdFpvZFBNR2VpSEp4UE1M?=
 =?utf-8?B?MjBia0RUSzVGcWZqQ2NDcldaV2xnanNQNDJxM1dEazQySDlKcmp1RHRjaHla?=
 =?utf-8?B?OW81NWJGQjI4QmR6T3YrYW13cVMxVUxlOVlQUzVVZmE3T3Fwd05KUkZybFV3?=
 =?utf-8?B?ZkcxYW9TcGlTZytMTVlCeWlNZFBKaEVnczVFYndBdXpRaGtSL1h5dmovNElw?=
 =?utf-8?B?Z3Zjdm9pYzZsUm1rUzRBdVNvOFZ2SHhjQVdkNW9pRHFVV3BObU84Wm9wd0Vj?=
 =?utf-8?B?ZzZrZ0drWnBPTTFXRGRHalVaalc0dmtSUm51TFdLejRmcnJjaXRFNjJaZEJH?=
 =?utf-8?B?eFNyZ0NQNTdySkl1ak45K0VCMU5zVEo5NzBKeFg3WEdoZXI4Wi9YNXhTMzA4?=
 =?utf-8?B?V0U0SWt2Nkh4SUtRWjQ3TTZKNzI4d1BTM1BjYU9SNFU1Sk4zVXhOeHh5dGlw?=
 =?utf-8?B?VmVVYXF6cE5PL3NVYVg0N2lHSlJtNFZ2M1VUSXNnc1FuNnpGb0V1NkRCSmdE?=
 =?utf-8?B?ZHV5dlhwU3BOVjFkamN4VTd3WE00cGdyWmV6Y2tnck0yUUdhWEszQjlERDNa?=
 =?utf-8?B?UHI1MENzcGlJUUU0aHFwNW5NSkdiRXkzZmt5RVJwbVhQNHh0VHVtT1YvbWNw?=
 =?utf-8?B?K3hEVU1SK2U4VzZIZlFNdkFYY0NLd2ZYVXphRlNrZGM0SjVJaUJ0SjV0SnFo?=
 =?utf-8?B?WWRrMDMvUkQxdWtpYXJqNFlicy9yZ0p4SkVPaExlQkpZQUJ2VDErOUIxZVVF?=
 =?utf-8?B?UEpIZFFJYVFWNnRRNUZteE04d0x1K1k0K2VFNWJpdG1OL1dJN1o0ZHVmRnl1?=
 =?utf-8?B?eU1RbG9qeFpKMHdDa1lodElDV2NLMGFBOHFaY3hzbFlCTG9CMEVOMzRkczRU?=
 =?utf-8?B?TC80bG5HTjJWcHlieU41MFZxOVRra09tLzlESnBOVUwyOWdWS0JKUzNpV1Fm?=
 =?utf-8?B?L0p5QmVLYTZhWlErNGhINUdCS0cxbDdKQjVseDhFMlFxaE1VMnd2NUpxdU1o?=
 =?utf-8?B?cDYyTUVlZDgxeEdCZzdYa0JBcnlOSGZhbFhtUUZkbHlWazE3VzNOMTNteWpJ?=
 =?utf-8?B?cXdDQjNrcUFpUTNySEo2WE12d2ptS09aeE03alF2cHEyQWRYdVJSRk5aT0Zm?=
 =?utf-8?B?eWcwSmRZdGdhVjJ5K3RzNTM2cWc2QkRlaU43MUVGanRQWTJUdE80UXVldnow?=
 =?utf-8?B?TVFYWklneGxsREZIcjVXblhnRlpVMUtuUHVpTTAwOHM2S1A1WUF4V1RrS3NJ?=
 =?utf-8?B?NlRIcWhrRTdoTHg0SnZiQlUxU2t5Z0Z0SjJ4aXVkYnlvRDlaakFhOUhjeW9a?=
 =?utf-8?B?bERabXdLOVBOMFE1VlRWYmVOZzBFZnE2cHZEODVveWxJalprZzNhektUZ08y?=
 =?utf-8?Q?yHv4ZXVB34u4RRwp5CEol6khlKRUK4l2pnZ5N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a0d032-fc88-499a-c68f-08df3073eb6a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:37:33.9593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzWoK74xdX+1SM65ezcNLTCHy4MGRQqhoU7PIEmKHM3t0ua/HDBMSCHXteDuaPyKouXXMYjbHQ8qXbjgNbb9F1xagMkpmUXUvAEJz/FEj3ipZ2Wb5wQ+cKZ7JQNsO1NC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8679

From: Frank Li <Frank.Li@nxp.com>

No children nodes under dsi@30a00000, so remove '#address-cells' and
'#size-cells' to fix warning with (W=1):

arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
  DTC [C] arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 5545b5b20ab2e..8d53df2be2280 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1247,8 +1247,6 @@ sec_jr2: jr@3000 {
 			mipi_dsi: dsi@30a00000 {
 				compatible = "fsl,imx8mq-nwl-dsi";
 				reg = <0x30a00000 0x300>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				clocks = <&clk IMX8MQ_CLK_DSI_CORE>,
 					 <&clk IMX8MQ_CLK_DSI_AHB>,
 					 <&clk IMX8MQ_CLK_DSI_IPG_DIV>,

-- 
2.43.0

