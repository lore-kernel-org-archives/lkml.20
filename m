Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51733DAADA;
	Fri, 16 Oct 2026 20:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181486; cv=fail; b=SagFnjyeuJCZHEyFLuUWrUNjY7HgICXA0rS+lM0oNjkI7PbcYyUFdBUIM3OzX3B+0a9fakQShLm4nOkWulzrsp2r585ioiRAcIZBDIWENrzL2TNnwpU5Hhm46gIuTKP21B8OKh1+nwSnDI6C2KU87Fuu3urX6WeNTCvTk/HbXsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181486; c=relaxed/simple;
	bh=RS9pMMiNxloxLcD9GbZAZuNHXR0mgmJHXPFzwYu+LJU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=odYUlDsfdvpc2mgpaSb8yoLdcnSd/KKC3tCcQb8ETz96R3lweapHkf0oMVjktYnyGH9erUDuyhHzu9hj6heYusz51lLlvzYSNbEjQ79qO/3mTHSDFbjdGyvrMop12xI3+3JBZN6EPxlxPAz+9Ybo2i2OktBeSp89JutKT3zgkdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BBUuabwf; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BBUuabwf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMlfDtwDoMZAmSIbrJzczB5s9zsX8YcoK5Cwwa8DZeEtxRnKut0NpjudNpJzY7Y66HYYjun0K515KRpU795HspSxiJlYXQ2twJb+m+GR7jhl0luK29nDS2ztUJd5SKtHiFSFBMG7fFU2jNEcL+3csTcyRu8a3aK1hiaYw2T1A1CAFnzdLNFnEMzS52PAxG+U+ZiGsTt5XgmWspoBCkj6nh86ETEYLf0x0hboJmI5tCpJ6NSBur+af6iE+kjgv02MwUHHvYdrQaQ6enIas+mD57qnQEXBgZ18389fp7r6ixEdBvybvQ9NGDlcmQ/kLvwACYmFHshzYjJbLwLm8k7dFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06AfgjVHEQZYMpBR9AwmPe4uhEcSYJ4GnwvmpRUtTpk=;
 b=BiTFeAHsnQ/FKPgKilL1URJbVJ4t39x/RLE6hXmJORCAQoS1o8OQEyfGf0WVBvOMIuj3Nf/VlmFeGUviPC5XHaMFCWbp4g8U16ZJJ/QnY9bzSS/lYfNCTKi0Gd+Qer2pNZkiP5dAiAzeSdmFDITDAaP38XLlyzwUI5JK/kv0trTRrKpB/AYOYTdl2lrPqGnMcjUcKOlmd/eIW2taf1Xk1FR3VondSuLpzTYhkrpm24m4zecw4jQNClOlY2GseOeJhUoueLZ0OWekmC3zyon9FOwgAD6GZiE5l7TyigXq9T/ThEpclEyZfSdXEZxH6JXWLes+xIi8bYbjCtYKdoRmDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06AfgjVHEQZYMpBR9AwmPe4uhEcSYJ4GnwvmpRUtTpk=;
 b=BBUuabwfKG1o9DbJUxrdUEC/woWpDslKbRcDyhQnCTDjvh+UhxhiB3I7w4lkgFp4WgBPi6wtmCLPDkNg3wWZYtwYyeGe+eVIRwUNTsciXyYRjCZvyYhHU/xUUBnO/cN++9on3VCOFLozBsGCkbeOXuN8y/kLkshf7I5hnsNHu9pRVgdtcv93d5ZXtdL0lGu0LnHLIpS+YHOUo3yKpGygpbBmqOMLKRD+OUpFSBdXtfnU3SvZgdfR85R2CLQw20VAzikQ4sBZhV/LBojtHJVBlb5PFn2CQZkdbJ/sy9vd0NnCxvZR2lXYr7dBmUu0SsLDP08LmM9vrI/vKu/vLqS5sw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:12 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:46 -0400
Subject: [PATCH 03/14] ARM: dts: imx6dl-b155v2: add touchscreen size
 properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-3-3a0cab9fd784@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181452; l=1183;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Fy2d1/sLoc+UeNHPY5hiWubFU/9uLjxv0jPdPHqoVi0=;
 b=tuogGNxCNBhaCQ/IBHfeOHFEJb6wuK3+PN5BEBbXJQ0JsokYMc0v9B7Mg3LjQ23OwPToOwVMR
 TypTRMg2s96ChuvKHUcm36mqQaRloVPjJ0jFdgCbmHOHLzzmN4cZDII
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e283e2-4e9d-40ac-828c-08df2bc1a025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	SUtptfEicGUyluzK+ljC03pn++KBclFmGBnKZy8q4g86rgfGVeUt1PEP88yb2lPsVfqQqOiOndvsx5HtW4sHYTYlZoznTuO1ES94bdsf3xVRB+H/OraV2olqpI34/H9fKZtypo/AchlGUQ97ICPfzyOfg9ToDfsr/Ovu8q2uFB+gj2Wqlu6uDh/TPrhTgHqH1cbY5mzUJHiblDu5G7sSlbPx8hcznLGoZ5DVl7s5OKsHLwNdUq2fG2jWW9KjxPGz2gxBB5PzCIp6BvWkk3bpILUl7sobIaV3miYQvoFPMxoBu6HA95TFG8t7cRznXQPx1hFfxMJ2F48TxYScNu6JWvwVRbN8usGBcVRoDZ3PqLYDt/YIHZfe+IiWya7MbOqwd3m05/siRdAbwX605vbagufZ8JzldGDeuQLiEaLR4hvd1f1FvEvA1of6hxL1wG61wU6Uw3R8xmG1T+syhismQgIFaRW9vRFAacNxDjU3d6IV3tg15+fT2Y1aSnOYfdMJvjvRock8uZPansfyP0Ll8fYCRMnRv4sEs7GZty56wEx87mFgLeSpU3pP46pUWrvtzbFclo3SvoOiIDO8LB246ggG7AlSh+1zmooHYOiQ0P53TRXrvCVONHkezKxWp3Iw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ai9hdE5tanlLVzlyUFAraGdVTkY3eVRiUXVRSWE2WEVjNUxHekY5QlNsT09R?=
 =?utf-8?B?ZHJLT3JKYk4waHpJdms3T01UUlUrb0ZBamdGYUJsVkpuVmI1K0tJeEZydTRp?=
 =?utf-8?B?MU5kcVJ1d0NKVjBCYU1GcTQyMUF6TVU5VUxPWGo3bG1OQXV0b3BOdFhPV2Nm?=
 =?utf-8?B?NjdrZHQyS3B1WEsyK2dZZWp3d2lqeUlpaWtTdmgzclM0eHNaWkVXS3dFd2I0?=
 =?utf-8?B?WFlraGxwZ210Z3JVUWVKd1JOZ1p1aVRYTE9sakRraUNwc2NEWkFudkZINDZh?=
 =?utf-8?B?UU1UVitnSnZDZy96Q3o0UFJ2cjEzT1d0cDVoa3FoYTFJSnFrek94MStLa0xE?=
 =?utf-8?B?NnIwTlFjbyt3Zk9rZ2RsNkx1L3EyWlU2c09hYU9TV0Y1bDc1TW5DK1dleGxp?=
 =?utf-8?B?NWUzd1lvVEZleHJ4U3A1WkxSYmpsaTFxN0RjRnE1anZCY3NmN29ja1JoQ3ov?=
 =?utf-8?B?WFM0S2hqVlowS0VqVEw4TFZIWkR5bWlVWVVvTGhoVEYwTVB6Vk9STXdiczVo?=
 =?utf-8?B?aEhMMjN1WVdvNUpJYnA1My9ZTE9ybGwyeGpsNzlaVTY2b2czaG1tNElTOVFq?=
 =?utf-8?B?YzZVZDVuWUtjZXU5dU5PQ0JWRjE2bDlWSW9palBxVWdxM0d5UHhaRnJaRnV6?=
 =?utf-8?B?NGkvbjdub0dDWU5vcnQxM1F2c0oxbGxSRkkvZ3Y3ZjZoS0JRYXlSTlZ4aFJ5?=
 =?utf-8?B?eWZXYm9CcDBTWWthREZEc0t1ZC9CT1NFUUVXcms1aGROanN1TmJCMTArQVJ4?=
 =?utf-8?B?c2JYejIrbko3dkowR2l3U01BUy9aQ2dMbzVSVHIrVUJmKzZRRVRKT0pCUlZx?=
 =?utf-8?B?MHJtQ1BQR0dTRFBMSUVNVWkyRmFtZXcwaWY5S1JtWEZWekUraTh5eDFsZVZN?=
 =?utf-8?B?Y1Jta1dMYnZMckJydkh0M05HLzU3MXJUOHJxVCt5b05yRUJLL3JLdFBHeGw1?=
 =?utf-8?B?Z1p0NUlaVFIwK3BRUG92R1lTK1B6UXNJV2NTZWhWR3VkNHNkQ1ZVaHp0RVRi?=
 =?utf-8?B?Z3RRSGlSYy93ZC9IYkNUZGIxQ0JpbnRZdjc2VDZubmc0bTZkbUM2NjFIU3hP?=
 =?utf-8?B?Smw0MmZtZjJYdW5iaFltQ2FpeVVkQjFGWDVkamZDUUdheHFMUFV2bVRKQ3BS?=
 =?utf-8?B?dUk3U3ZIZEh3azVpTEV0UDJCUlV1TVI3MkRVcTdETTBDYSswWVpyN2llaWE3?=
 =?utf-8?B?amFDVk9pakREdTN5bkZTZnFhYzA5MlpnelhCazVpTDJGTm9WVmFvSjYxZ0NI?=
 =?utf-8?B?QmFiQ24vRjBlbWRVYkVIODlWc042dktyOFpmblNONW43NHRlYWRzUWw1R01K?=
 =?utf-8?B?QUk5VklGc2JPKzVPTk1QRlNnM3RTandkSEtILzRoeThWeGZHQzJZbWNHNzBW?=
 =?utf-8?B?bEF3WjYxS0ZISkcwTzZXSk93S2N1SFFBQmI5aG5QNzlqUkc5M0hzVFRGSkYy?=
 =?utf-8?B?V2tlOWFzSE9pZERYbGQ0VmJxVWo5SWpZQVBsM0dlVTk3QiswRnRvTm1aVUVm?=
 =?utf-8?B?TXd3cDVrdlY1N0dGTjhBY0FXcUZ2QndHb09GRGIwNUlkQUlscy9tRVlUb2x5?=
 =?utf-8?B?bGp4SG95QXFGN1B5cGhaWUNBS3d6VG82ZUM2OXRncGdpSDZqQWhMdi9hem9q?=
 =?utf-8?B?bWlnUVlMeEkxOUdhcWdEUWhFdzZmSUlJamROcTBCYnptSEI3Q3lWeFNsRlQ4?=
 =?utf-8?B?eithNkhvRXlGd3hJelJLdW1RR3VCUG9mZGtKL0JSUjVCUjh1M2JVRnBMQmQw?=
 =?utf-8?B?MEhPdVQ2YnhMWmlNcjBJSk1jYVNBKy8rdTZ6aHAzbTBZeDRFb1NWd2hGdjQ5?=
 =?utf-8?B?ZUhJUzYyTzZsMSt5eHZtRW0xS3JGQ1MrNlBSM0FNWW9Wd2hlNkdaaWl1YnFN?=
 =?utf-8?B?OTk1Nmg3M0c2WUpkdDd1RXA4RmJ4UFZ5SnJWZ3BMM0JDeFBiaFVyTEhBUlE4?=
 =?utf-8?B?NDRGZlV4d0d3VkNQQ3M3c0Y0RUpuajZ6dXloQkVLSHh0Q2JmSkkvREpNZkxL?=
 =?utf-8?B?K0Fob3M3L3RWNDRsZExnelpBdGppWHpPdjhVR3Z0Z2lHdGlpNmJFbmcyZ0VU?=
 =?utf-8?B?UTBsKzhyZVpvNktBcXhyNVI2eXBWTVFVSDBaQk5Bd0VXYVJINnZFQ3Z0Wmhk?=
 =?utf-8?B?NTV5d25oRTU0T25ldk5vZzRTVEgvR01LRmw1Y1FkS1JTUDkreEdRZjFKdVBN?=
 =?utf-8?B?TnB2elM5YXVOb21IcVgrZlJldVBVSkVBenpDYy9VaktwSlJPT1VEZitML1pj?=
 =?utf-8?B?V1VCbHdacUNDWjNJWllYOFJvWlEzSFVEQTU0V1hBQXpjNWlWME95SVBHRnha?=
 =?utf-8?B?eTNGQjMzTE5STDMwNE1OQmdrSFZaT0s3WDJaR0w2b1NKUDU4WHVqNFEvaUha?=
 =?utf-8?Q?u0MllapiJnzusaQKw3miZqaL2TtClIqvWFL6b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e283e2-4e9d-40ac-828c-08df2bc1a025
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:12.6620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZ9S7GdwqTPakdJXWbfAMD/qDjOP+RFVQ7iNkgxi+fB7JGu8PyHbXeQu4d1+NTAEilam0bLik5fherC5WcnbmyXCpdHSQmncbv4WgDB6OBp88/K8RRttiCoK8fvGf+FG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

The eeti,exc3000 schema requires touchscreen-size-x and touchscreen-size-y
properties. Add them for the EXC80H84 touchscreen on the B155v2 board,
matching the 1366x768 resolution of the AUO G156XTN01 panel.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dtb: touchscreen@2a (eeti,exc80h84): 'touchscreen-size-x' is a required property
        from schema $id: http://devicetree.org/schemas/input/touchscreen/eeti,exc3000.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
index 7edc788bcb8f3..54db44613df66 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
@@ -25,6 +25,8 @@ touchscreen@2a {
 		pinctrl-0 = <&pinctrl_q7_gpio0>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		touchscreen-size-x = <1366>;
+		touchscreen-size-y = <768>;
 		touchscreen-inverted-x;
 		touchscreen-inverted-y;
 		reset-gpios = <&tca6424a 21 GPIO_ACTIVE_HIGH>;

-- 
2.43.0

