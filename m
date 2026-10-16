Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B11D3DEADB;
	Fri, 16 Oct 2026 20:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181507; cv=fail; b=HHaKALUiEYJNMMHUh94HMrQFGnTacH/bpKbNMGFJG1xZ57oksPiBbJ492MD+6HBw80LmcX30RWm0zhYZFXijrduifKNBCnLtEg+EHquxAo9kgjbfKGy3XIgpLs4CSe4QYP34P0SMmR/pX4Pf65Dwarhi296rO0+CaE761QllF7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181507; c=relaxed/simple;
	bh=mD1exLMQeE4CKL4MXKzVc/Jqe3LC4Cbe9EddlLNySQw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rVlfB9zfeLMPtd2Dls4I/AVEkkKIjJwgXM5A79X+pdZg5Gjww3oNfnPtWfTEx+eekN61TqA8QwkqNGGzzGilMg9xT6wQr+Lx+oytRtRjyCtyJISTEcs0tE92JnwWLn+3EQMCQJSxisoF1zreTfN1odoXIWwm+7oJGZtcgYdI0QU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xCK1A4Pw; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xCK1A4Pw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByS/necRL8Rt/p6tsxQ6Y9mwsbIzU77wTUPEuXFSwQg8LESkckr81E4tzezrqA8vH39WJUM8mUYLpQdGBhW1BoQ5MN2UsHR2qF+IHVrlh+NCMancdmyolUn/OIHd+Pp7aPg8ViqET2hUClqY8fglQdClsf93bwLabUNqXOKn10vkznntRQ5lDTYyE6EzQX151zp1edgzzpFyKFB9h//2ClxN3xM0NxlpF95RfryfeNZTLywHvFJ0sPmMN5t0QtzBp+HXC+mI1W5AKTuvpbQ+GY2Z9vdzw4zsiALbMnPR4tJvS0s4vbSG6QQFFBAhtINwsJBqXYUHFS6Fv1S517zBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxRbkyT6PHDujjmSogVF6TYgY5hv2ktCzyf9M2XDxT8=;
 b=njCWAbgkzR6+uGpEbuGsIwiFd37ihKRRTy9eTpO0uDLjiATuMd3K3vpYDR5uUvzPEAh8qx5FTfDwU4S7mo2sWXx+8fylGf3uf5mfS5APSXFmxEvMKuwcRTSTOjMqTKzooIZ39ey7MpKgm7dpuMujCO0OrOEReGQm0+swCL67gg73rbWFiPzAU1w19hebxz6Sru5/8nbd3ThXUzqzRYnxM3Gqzw99A6Tl0O/C3RGyBvp99ZOTg1DUcBxsGTzVW+cwLvUyn3KICh8BceQLAVaL/LyVDPPxcL7/cpH4W1DsYdWqb4xA+GClR6ZLZLisSVwRRHQ6Rt+DsMpZRUNH8Ihixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxRbkyT6PHDujjmSogVF6TYgY5hv2ktCzyf9M2XDxT8=;
 b=xCK1A4Pw8UlnRsW+wxziepQQUrUKQ24fV3qNoRzXxqMHjw1nyKQqlSJoH/JBWNeTVvXxEz5jWm2NujexvK5jMO7pUKGHA6rbGHW7dhq5q9CP5zo65DzHhNAzPW1IeAvcXe1V4VtD5Z0hxhIC8ZFLN0pCOHzInKZVFZ+tE2R9pG36y6lsyLJyGhS4X42sS0rB51+c97FBmSTIVWh1utnnsNy0v30YSMqPbmO6BS6Mgl/At+whwl8klB5yepm3XkWnl5ohTiVv8mkX7ByicGAHDKNHjr3q3S0cHUa79l3NDTkb5imuT1HLF2oe1VVrHmGzZYWwgLX66+fbe+ESyEoaQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:26 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:49 -0400
Subject: [PATCH 06/14] ARM: dts: imx53-smd: change compatible string to
 dlg,da9053-aa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-6-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
In-Reply-To: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181452; l=1043;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=qd92WqHOI4u94VSaLckCwcWeR3x3cPQJS9G5ccZsukc=;
 b=Oy0MfTbPmWw6Sx8/+hFA6sDWFj33YrvLX9+8Gr/+aQfeYCKCIwyhrNIREIP9NmpDL8Rt9MI9P
 y5feg1DLWl6CgKkZIm7qa9mGcTms/1VB3szGGrm/4qr0TIQRMXbUz0x
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:44e::8)
 To GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bacacd7-94a8-4a1c-5db4-08df2bc1a886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009221727099003|261009220027099003|261009221227099003|261009223027099003|261009223327099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	rywe0X8BlthfjkWLY9fBAoo1HFLvffyvKdw2AgV0a0/FXV7lTVQr5sC/d4X7+HdCtPkPrrTmuHppTqTqFTazrSabSw/CPC3v2y9lrEi/mzVdusT4VaML7J3Wg4LRMbDUtTcbPYbNRvLIgi+WEjupKKdpo0K9mujgR71kTW9n3T1O26OfkS1SJ+GS4pEPsG796UVpidR1LElC/lta62Jfc42gG60J94aGVgt4GASWtmJ5oH/9SqGWxO8ylRnOdWHAhcMZhrnGHTb0MAuH1kYLheJfIPmy0G+IvMjuenFz2lC2rxN6aN2+2MM36VHBOJUHb+mRLtwRZwayAVIPJui6rVquI9U6KJpOgYgZuxdvXpdt9dVfzaPpBk7iHfTDQ6GjC97iwtlRFhMB6KhmmyRh/YjnE7+LTbh8FZH5QwIue3m36GcIoN9gMcV91SxXVbDy9XV5SsBklR/KmovZV2tK3HgL1wN9bgUbSwyuPhwX6tI0KP0uijlLb8rgS31Dwj84MnpRCePh4PegoAZOCoOOFEDnxf5EK9zBvtPZ6tCYUjRGavVtqMvkpdmQMXWSmJe8mlr2H0Lwg1w9zmUvuySbaQU59sVxaNpLLBVqvZp/F4Zu9A3sY/s7KCWtmaMRk9Jz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009221727099003)(261009220027099003)(261009221227099003)(261009223027099003)(261009223327099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmFFWWF5aUtUUTIzOVgvUWQ1NG94S1ZKNDFyUCtNUEU4Q2lIYUR6T28zM21S?=
 =?utf-8?B?WVFaWDVOWExZVXF2VnpNY2t2bXJraS9rZmpRbWNudVFlcHlYL2J0WDZCRHZj?=
 =?utf-8?B?VVZISmhtYnh6dUE3TmdGNm1jWjlhVkhMOGhoUlV5WFo2VERJdGlCR05nZUFW?=
 =?utf-8?B?cTRSaFREbFM1ZFJTRGlwN1JLQWptTzBVU29IN0hLMmplNTNVc2tORHBkTUl4?=
 =?utf-8?B?WVhkREJmVFJob0MvMVdjb094MzBUR3M2S0lrckJmQnJrMU4yZ3JScWo2VjNQ?=
 =?utf-8?B?c2FtclVYclRPd214bUt3MHFWNDl6bGdyYmFVTmloYnppL24yVmxpOEJFWSsv?=
 =?utf-8?B?NzJxZTExKzdCenVKTkNiVlZsU2FMWnExdDBkeEpEWTYxZ2VUaGd5bHU3YjZO?=
 =?utf-8?B?aWFUTjdWT3FjUC9GamZneUJCSkU0RVltKy93R29GcFBnTjVPemtLMjJublli?=
 =?utf-8?B?cXo4TnhCZlZBaWFQdnBkME9Fdk5sRDF0dGdPdEh5WittT2VHSjVhVlR0N0E5?=
 =?utf-8?B?cmxzYlZGdlF2dUNrSjhjdjdCRVI4Z0cydGo2LzZUMy82a3dtT1h0MnUyM3BY?=
 =?utf-8?B?TmxqQzJTMk8xY05rUXlWTm5WQk5BY1Jxa2k2K2Z3dk5IRS9zQ2xHMUJRaVBD?=
 =?utf-8?B?SExUNnRLd25LOGdCY3ZMMk9kb1NoR3hSOEZOVGpVMGdhKzluVjF3TE1ReVBn?=
 =?utf-8?B?NUU1VFg5bk5kVDhPUUxzUU0wTStUSVVsc3VpQ0FpTHFQZkZuL2JzOEM2QlZx?=
 =?utf-8?B?SDlMNmJ6U2FRd1JCZDE4akJGMi95RG5HejFLUDRIb01JZTljeDFEUDNXTDlQ?=
 =?utf-8?B?NHY1KzlZdlV4MzZUQnp0cGlwK0U0QTZSY0xqSG1RM1JBVDFwV3NkaWxjSEJQ?=
 =?utf-8?B?SkdsTkRoQXJVR3VaZUY5OUxPSjhnT0Ezb2ZoUGpqa1pWNGU4eVJXcjZabFRt?=
 =?utf-8?B?SUVRYzFvV3RrMWZvSlpmUjZiN0puK0p3bXlJdGhjZ1dCajNYVHQySnR5dndy?=
 =?utf-8?B?R1gxUm52Ymtjak01cGxuWUJWRDQvclVudWtuNEZMVGJvN0g2ZDdISWtZdGJR?=
 =?utf-8?B?eitaa20rbmYzc1dNWGluMElwR0dBb2o2Y29tMU8xeEZDYjlVUlp2SDhZdHRy?=
 =?utf-8?B?cEJHSDMxZ3E2bHoxSEdRMlI5a2JNU0Y3SjZidVBWNUw1RENYUWJUSlRZeUFS?=
 =?utf-8?B?TkJIYTFDZEtwcjEwb2JBYURMeDVjZElxTEhNQ3lLNmdpS01uWldvVU03MktU?=
 =?utf-8?B?L3RzTTBla012bUJ6TS9DbWtua1RzT2Y1KzdneUMzYlpDZExTemo0YmdhemNo?=
 =?utf-8?B?STRjdUhJeDNlZVYzcStSN1BKMnV5SVFnOGVlM21nb1V5ZXJlTENYT3BsUVBp?=
 =?utf-8?B?amN3VVhsUjJCK01xU2p2K3hGcU5hRzN3NVhhcktKeFBFTE5WbmRjY29nSEVo?=
 =?utf-8?B?TDBPeFQ3UG9pTkpYcHExbnRhM1BMNWNUUG4xamx5a0xUVGMyTXhWUWlCcXdl?=
 =?utf-8?B?ZjlBRDEydC96SDd6cFA2WE9RWitQU1VFN1M5UlJCR1FPclJDK3lrVHdpWTNG?=
 =?utf-8?B?dHdySW56N3IxRm5RZFpRallrK2Z2TFdNdEVuVnpZQjdVYTQyZ0dNRUtoTjdX?=
 =?utf-8?B?dS91MWRCVnVQT2d5dFFtVHBVNnBmUUJVRW5KTDhsMTI4L3NoNFBFay9mdC9m?=
 =?utf-8?B?dkptTldGbUIyMHBaYnhRQTJEcXN0Q0FFNXVUdi9ud2dZeGYxYUpXck0vOW91?=
 =?utf-8?B?c0tDWFpTRTk0S3JYZVVaQVdHY0ZIVlVkR2NmRjcxSWh0UTNYSzdoQzhmeVh4?=
 =?utf-8?B?cDFnNFJzeWNLenZEV2NsYmIvR3BoeFExbWJ6TFJpa0hJdG44bG9mc29aMDJ3?=
 =?utf-8?B?UlpKSkpKcWJGa1FndG8vM0QwOUcxcEpvY3BRQzhZNlk1QTk5b0FuM1ZRUDF4?=
 =?utf-8?B?UGRkS095YjA2VnhMTnFLejFnRG9IZ3FRaGlTVUJwOUxrdWk1bERtWWhhVTlw?=
 =?utf-8?B?NE9tNDZJUFpSSGtkNVQrZWlGVnRtSWY1dXV3MWsydWJmUXBMaU5CZzQ1eEpI?=
 =?utf-8?B?ZG96U0FHZkNEakxYWUNWbVFMVS9ZeVQ0R1lEQUp4N2dOMGFmdTE3YzNUME5P?=
 =?utf-8?B?NHBVajFJdDMxVVVxbHYxL01ETWM3VzNQbUx6Q3B0R0FUZU5GR3RzUHVVNmpK?=
 =?utf-8?B?eW9PY05NamJsdVhwb256dmVtQjBZWE9WOWZqZ0hzZnFJR1BYcjl6WkZNZG9q?=
 =?utf-8?B?VTZLcE1GLzJVOSt2YjlmWWdWS1dvSERFd0tkYmFOOUlvMEMxa1Fjc0ladWZa?=
 =?utf-8?B?QWhFOW1HVFVzSGdCaUNYdzhmV1JKUUxERHRIanhpUUZybFd0eDVrTktzQWJF?=
 =?utf-8?Q?qlp/CXIZxpIOprMmQ/xX7EIiNCXq/EWev5s/K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bacacd7-94a8-4a1c-5db4-08df2bc1a886
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:26.7476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OFHN6iyWbojESekRxYXVDbS4PFFn37uG1VtnWxUg8FGoW6OCbZQptsaieND/TublGkaj7PtXbL+xgggOsSgkeWMNNmjEsukP34GVpX+XT9QhatD6zTDetz/PLJFhjRe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

All imx53-smd use the same PMIC with imx53-qsb boards. It should be
dlg,da9053-aa. dlg,da9053 is not supported by drivers and wrong fallback
to dlg,da9052.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: dialog@48 (dlg,da9053): compatible: ['dlg,da9053', 'dlg,da9052'] is too long
        from schema $id: http://devicetree.org/schemas/trivial-devices.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
index 29d38484cd386..aed551566683c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
@@ -323,7 +323,7 @@ ov5642_to_ipu_csi0: endpoint {
 	};
 
 	pmic: dialog@48 {
-		compatible = "dlg,da9053", "dlg,da9052";
+		compatible = "dlg,da9053-aa";
 		reg = <0x48>;
 		interrupt-parent = <&gpio7>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;

-- 
2.43.0

