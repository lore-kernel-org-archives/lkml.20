Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B6733064D;
	Mon, 14 Sep 2026 03:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355883; cv=fail; b=E/BpqEVGiEyNwxGsI7IXuoRCK9EKR8kiKdKf+WMvrZHjbNQskzFJ8cHye9jSrUFbqcoV4MrMcO0EE2Libfp/qUe+gRW/Anfidu5miqnWGGY8pkQlxO8fPd5e0+8PGceLj5bibbs5w2Iw+Tf1wgK8hwYdf0kqLWqRgFsQ7QNxD8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355883; c=relaxed/simple;
	bh=jNGfrdR3XIe1WKRnhJcRB74pwqby9GjWeXf9zVpB0NM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uLMl5zT2KRTf0rHQ/vAnHQESq6k55a8GmoiVCWyYtJYVICv7jo+7sRt/fW5TQN1rohGt/d9nt2Py4A9Br/gB0VUv1RaWnKKkZC81JaViy0A0eSsIr2O+kurdvuV73WHOBgwuwhSdWnVGeJFwIY93tByOnivgehlSHFpvpaR3Ols=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fVySD2jG; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fVySD2jG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNnIQvhEAwqRH/BBdyfmpjfFmR2GUOCJ3I7pPxl3NPTkrSIN7Nk0O78Xb1uUs/E+i5JCm6r8CQo61oSwMwwV0rA5nZM3ImSw4pvQM1fpFNqRTrdqdRPB/pa8YcPMhr3nXBu5FCxaIwf/9jQX8SbLuhAv35sSAWpNsXy7wF6Od3pV1yWpbxafSsmjh2XZBDsqKj8yM1oNDC9y2ekht9vpNYSu5uLgswGGyyG1/ECL8xBNW51h0+5KsKkUE95AnRlsnYW9lnh0vabzkxk/sLQlYHVJL9Ix/Sa/sgVQOaiKnQdAxZlOzsi6DSsfkWM0vOOlogWkIWTqX7S4mdiSr8m99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQu9BVF360kfdJ5/supGb0I5NV568UuCE8ILc+VHIpA=;
 b=MqgqP9Vbg1Ur+Ym4ERDikwwgBWQVliXdfjc8d8dKfaSKXqXgdtj2ijskI6n6dSn63K69qWJBlUlGD6zcIa+m4C/fs6Qqy+C/Tn0Yh0hUncNyqhFNYgimeeZqn+VCWcH9v01sbjZnEXT4zANeJA9tfgD/5l2f4Q2nubckF6QUZ8BYbWU2u05GbHPMW/J89z9wfq7i9t7gJGHpEmCIMZ0bclOLLN5pXHfc9dytrcVzhASCrDcjJo9e/OFoSQ4hAY6Zz9va1WcZMA4nR35rbI/p1ZkejscdSj/m9+OoMGDl6XgGNQEyko/8mx5VNI7ygkq+ZlK6t4MbHFHmLFBsqVBilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQu9BVF360kfdJ5/supGb0I5NV568UuCE8ILc+VHIpA=;
 b=fVySD2jGD3nC4cVYKBbnpqD5ShHz68IEzR1ndyOZHwWEkOwx8US3pd1wzvHNvENaKUQ7Tc08sPmoeWLAlev23NDiGvf14SNDunsOyOKNTHMs3YERjuBtbpk3K7rBlcb6WvKWgRUp3X49dUwNUmfmsCk9JtwCDCC1Awfd/rVUtAmQs7TvtUj2xcv+Ry2WzjPGMRpStheM/r4B8u3wGUk0y4+e67cLLt97nvQu+IZS8DoDg+S8GIFXlQOzLWNa2cudFuMJ0WqcKu3Sn/wIksrxGlydB2r9C/UUWqHD/DrftFL91RyKq80ta/FAihPmDJZz86TRRTo+TVAAjCEgaRxr0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PAWPR04MB9720.eurprd04.prod.outlook.com (2603:10a6:102:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 03:17:37 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 03:17:37 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Mon, 14 Sep 2026 11:21:08 +0800
Subject: [PATCH 2/2] arm64: dts: imx93-evk/qsb: add rtc1 alias for external
 PCF2131 RTC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4_imx91_93_rtc-v1-2-daed1cba0714@oss.nxp.com>
References: <20260914-b4_imx91_93_rtc-v1-0-daed1cba0714@oss.nxp.com>
In-Reply-To: <20260914-b4_imx91_93_rtc-v1-0-daed1cba0714@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::15) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|PAWPR04MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 14940906-77b3-4129-3df6-08df120eb9da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|19092799006|921020|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YCueNJiaD7NgeVnFerGEwNQypFX4peQpaCWC3UVn6MWnX42dE8T67uHKxhtxO1rrvCc6lFRWui3klJvg/MtiglodTsD3XZGYJxBD8wYsRYZ9kCwTuozD53RgH/LZZBnZmcqLZMpGmaOQKq+cAS8MbD36KdbIHQVnKQm8FJAezS6lOeZzDTzK9Ek1+fdHOwV3dykYBp0NVRTLedrb9CykpODeFUNI7WikEkEHUTrNnqnXOMP43MxBal4gH9yU5AOQ26XVeZrDCIKmpuf5v9th0a/zngmDPGPhw4FSlT4nNPXGX9FBuNQsod+oqXzGGBJ23Z4w9XCKtFondMzakfli1Fc7teyjzx7fmv0FRRPfL5JCZKsni5zUmQL8QzLxy+M6LSKsa9z0fthgyHlssN/ec7NDUznhrpvD0LElJPdt09svDlzuYTtlNFLeHejdAIy8CpvsAIbiOKkYrOcaxo1DrHWMO2pyigRrBX82MDhHpwLrzGFY0QYtvfWT8/oacrMtmj4r3zIojPWQM+Sj4FbrWRpMvbiJaE+2L5yLMPqyZiz8S5DiFqHIZa7rx9znqBlRhOpWwOA2Fk2eskmiREjgMna8YrG30phctYaiSPqSFAJpNpnAm/Xf9HitWX1LKvK4C5j+7R3zHU+1/k0pGpJpc4vtsPNjOlO62WhnDwh3zcSaXJvRudlnhlgp9koHUpaQYdJaI/ulR3nuH288acf73Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHJJOFpQYlczMW9YbU1sWWxIL0RDRkxZYzZwMURsc2c4blZqM3p2b2h2eEJX?=
 =?utf-8?B?djlYWldTRWpYNkl4eVZ1UWJ3VzBoNlphZTZGYjU2Nmp4T3JwbUdmTmZXVXNs?=
 =?utf-8?B?ZFU5dThYTlhobU9JRmNsME1GRVdEVE03enFGM3htZTR4OU8yYlFibURjaG5U?=
 =?utf-8?B?M21QL1lOb2tpRTA2TU4zOHcwdkpSWmt2YnduRDYzL3F1ODVvTjJ4UjhtMm1l?=
 =?utf-8?B?ZXY3RDg3RDBDSDREUUNQNTdPQmRFa0NWMWJoQSs4M2dBVkJRbk1lV2t5ekpB?=
 =?utf-8?B?VE5LSjAvMkpDQTcyZFBldGRGZGlyVC9xRVVnS2crYXloTFdqUkFRc21nK0x1?=
 =?utf-8?B?RVMxUEpSbCtDSGFTMWdqMXFCdWlBbFdVMnVEc0dvM1NvQWVRQkEycWZWbkY2?=
 =?utf-8?B?V2M3bDhUZHJ1WmZwWEZ2S2Yxa00xaEk5bXE2SXE1QTVVWXNoV0FBMVdISjZp?=
 =?utf-8?B?a29hN0ZXS3ZodGtsVnQvZjZxaWlMVG9FdTlLMkdhbGwwcklPVHBrWmE5MkMz?=
 =?utf-8?B?U3JqaHN0QVFpUDZLaFphZUdYcWVKbmk5V2c3OWtLMVJWdis3aWVXT0pCNW5T?=
 =?utf-8?B?K3lBWnF3ZWdvQWdTb3dYL0llT01FZGswd1JvZkQxK0Y2N0V4WEJxd0ZWa25w?=
 =?utf-8?B?TGhFRmkrM0F0ejRLUDdqZ1RJTXFUeWlWYjNHcmhSd29vMjJlSWdZVitjSFJn?=
 =?utf-8?B?QWdSNVFzaU84SzBIOXV4RGFKRkM3OHc4elNWTTh4RUt0b1c0aUxNc3F5a21t?=
 =?utf-8?B?UDg0NENFUXZqbFY2c0kyVTZST2VHVlBTTDI4bjV0NG11UWpQd2EvQnpLR3pR?=
 =?utf-8?B?RXpUZzFpVVNkRmhtTTc0ajRaYk1pVEZjclhJNmlyK0FqVkN0SS9nZlVRY3cr?=
 =?utf-8?B?TjNIOGU1Y2l3eWpYU0tjdEFTQm85NDRnaUtNVEpmR1pFQ2U4Um9CdVNYVVk0?=
 =?utf-8?B?MkZOWHVFai9peDBPamxuSUxxU3M4d01WbU1ic1BHVkM5NzZOR0wzVjdRN0dj?=
 =?utf-8?B?eUNzd2pkcGVlSjFVbG5jbTdZT0t6aWZjdHV2Z2srSGRscThhTklIUWQydTQ0?=
 =?utf-8?B?WmNtOWN4VUpiNWN3UUg3YVRmUlROSDBoS0NKb0Q4MlJQeFhaSHlxZk5BQkVm?=
 =?utf-8?B?anNjQkc0c1FZRkU1Z1dCajFYQ1NnQm4yTlNjOFZsR3NLdEx6NjA4aXhlSkp5?=
 =?utf-8?B?aTBpbWxuSXJiajdLVXZWZXRzSk1Fd1lTczA3cFphSVRnZUJQcFhWS0t5YkxD?=
 =?utf-8?B?UGZScm03QTRkRWhiWmJjSDBDYjFtN0VnQ2MyaEdUYnZFUHRCdjZad0t6NlNG?=
 =?utf-8?B?REtDSEZzT1pyM0NsRXZEUTBINTdmNTBOV29jdnN1TnQyVzF2NVk0Q3ljTEZJ?=
 =?utf-8?B?ZmJJenBCY3hjRDcxRmJOWkdiVmtzdE9kOTlPYkI4bXBpaC9PTkxZUklvMGNS?=
 =?utf-8?B?eHFzMG1sT1BWcWFiai9EUTNYRDZtM1dpNFRydXFheDRqcG1zNmlLUVlqMnVo?=
 =?utf-8?B?T0V3S1N1OWRvS3htWXR5YXBMd0Rqa1ZHODUrMkVvUHlmdldBRG9KQ3BJMWZS?=
 =?utf-8?B?cURMTXhQSUpRNjczMUM5ZzVNT2E4ZjhVT2s5Q0owa2laVjdtMXNpcFU5eEdj?=
 =?utf-8?B?SjE1TGlJWjVOaVFRdDhrYy9RK1p3RVNJR3NRSGdXL0o0eVc1TGRtUVc1MzhY?=
 =?utf-8?B?WXcrQzExZ01vZU96QmZOUVNpbmVMSzl1WktmUFJwZUQvcnBnUjZjUTUzZEh2?=
 =?utf-8?B?Ky9GU2xFTGcxUjd3VXBlczFheHg1TXdLNlVPOXhkQzhHbkJFajJlUzFhcUhz?=
 =?utf-8?B?MmppRS84elN0SS91MnhiaVZkTWRFUjhwbEtHeTY5OFF3VTk4cTltRTI4YlhM?=
 =?utf-8?B?WDJna2JIT3dwNXhqcFJhOTlFcWpkNkRlQ004b0ZMYnhYb2xRYzd6N2kyZk1I?=
 =?utf-8?B?NTJaZWZNUWtwbk53OVhyUE00ZGVNTmxQazlaS1QrVUZzazFsazYwMEs1SGR0?=
 =?utf-8?B?SzducXFEYkt4eE5ZRmMrcVh6UEE1dHJRYktCK0Qzbkgwd3ZNbDhlQWdzYlo4?=
 =?utf-8?B?U292QnloQzFFVVVPd0oyWTBTT2xyMVpKdzNqcm1OSlRpY2t6SU8wRW10YUo1?=
 =?utf-8?B?N0JhSm9rVDBKbi9GQU9ONU5jMW1zSkFzWE5KQi9PK3gxZnBneThRV0VvdGVI?=
 =?utf-8?B?UENEd0dsWnRMM1hDL0JPRDNNVlRJY01yV3NTWTg5SFNhYjdEWWVrN1ROQVNY?=
 =?utf-8?B?alRvNDR5djMyWlRwaUlKUWJPYWdrdnB1V25rZkVLWVpydHQ4RHYrUllHRUxS?=
 =?utf-8?B?TVo2Q04zZHlkNEs0cGh3R1phUE1wQVk2MVNGVm1TYkdvY3o5Z2ZqbFBPVnha?=
 =?utf-8?Q?m9/okHI1LsKBQviQcRY1lyRPZOgcXjtM1E9hq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14940906-77b3-4129-3df6-08df120eb9da
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 03:17:36.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sN7dUiPFFPFj0bDKAFRNObdighLmLMyzduRdnQQGn+NoeAvLrqBFJlHgBpUp6yBdDpYW1Iw7DunbpdU0FtVZt//Kklp7b6ej3ME8OtbP9COY2kanzxi1dgCGvSoKg6tL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9720

Only rtc0 was aliased to bbnsm_rtc, while the external pcf2131 had
no fixed index. When both drivers are modules, the pcf2131 may register
first and take rtc0, pushing bbnsm_rtc to rtc1. Since suspend/resume
wakeup relies on the internal bbnsm RTC at rtc0, this broke wakeup.

Add rtc1 alias for the pcf2131 on imx93-11x11-evk and imx93-9x9-qsb,
so it keeps a fixed index while bbnsm_rtc stays rtc0.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts           | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
index f48e7947cf64..2f3f9ebd3345 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
@@ -18,6 +18,7 @@ aliases {
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		rtc0 = &bbnsm_rtc;
+		rtc1 = &pcf2131;
 		serial0 = &lpuart1;
 		serial1 = &lpuart2;
 		serial2 = &lpuart3;
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 01c11c517986..4e31a78963fe 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -28,6 +28,7 @@ aliases {
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		rtc0 = &bbnsm_rtc;
+		rtc1 = &pcf2131;
 		serial0 = &lpuart1;
 		serial1 = &lpuart2;
 		serial2 = &lpuart3;
@@ -306,7 +307,7 @@ typec1_dr_sw: endpoint {
 		};
 	};
 
-	rtc@53 {
+	pcf2131: rtc@53 {
 		compatible = "nxp,pcf2131";
 		reg = <0x53>;
 		interrupt-parent = <&pcal6524>;

-- 
2.34.1

