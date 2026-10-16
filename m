Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013028.outbound.protection.outlook.com [52.101.83.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE303D6690;
	Fri, 16 Oct 2026 20:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181467; cv=fail; b=qzDoBMpsYm/6CW3/y3zJdcbt7Rjb8PPVTFMPiuvOeOrObptJk1kISr5ayIqyjUTk4MQW4O0tVP5muTekRWBhHCpPio4IIwtjp687HQwcZGrYC9oUkKXxR8zsoEAwG0G3/z08wVRWtCey5D279pfVeGS3eSJkT2lBx3WtxopQjjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181467; c=relaxed/simple;
	bh=D54kRPY4vqblvZDfN0g2W2LQ8UfstOirxq7SAkrG4uw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LHoDjajznIYLZlw/Q4Cr8vP7NOn1LGEOr8G2zL0ufikKgijjmjb9lFZDTYm0myeokxeUhHhc6SC1s4GbU9tRJW7qAS+iplJ+jMIrGWY+kGg+tDYu6/H1wifsOWdEbk5afYSu0KMKMN7DbY/Cd6zw5BG2ZMnmw0Z3IWTx4/n+esc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K5FUR8S5; arc=fail smtp.client-ip=52.101.83.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K5FUR8S5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/S4Tg7CbfG5dfdxpwKu+ebGWMKgd7cuig2ffXXb9hhH5Eq3estpwHmkIJiSV7qhaiY1VRqM1UPQtZ+Asb/vKwbdbv47AfDqhe+ToknU0OyQ0gTxKGDYVY2S7DgiGa2pcjTOIX+SBfKdkSWbvkSOUpeuZSJhsxrE3bIEGcIe5hZ04b3GlaJza5qMBgmZ1Z/NOEiXlx+UrTXFmtu18ueqd78l8VFxwYwvFcFMZBpesVgt3mW8aToH8M+8jDdrB7iKf1JI+avZI6SdtAhRT1B+hDx1uvaOnYFpOMD2dJw7T5ajbx0iCoCAs6WNx0tQj4dnYR5SNkV294P9JQfImc5vww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFg2rU68tA2UcEctW1PdrGrP3H1THO+/cLSHvMb2DK0=;
 b=SY00THh13mM4qs+Uvry8i1Vkb4Wsxn51NkyLZUQYC2QQaJp8w5hrMry2rYXMRX+rOWkCYmh3Zy43NbZUAEWIlI+WF/Ku8H7LveR2yYV9z3b18/g620wytMgWrBWuQemNWTj9IiI3BW5JbssXuSO7EonRqX7F9E0OYArJV/rUW1MyvaA1BE3suXO8uh8XQL4Qn61mkPckpBGu+A6SbZIkEFv9JGE7ZJH5oUon9aLIXvo0lc9AHrkHJFZp8r3gVNFf9Fe20KaMfQIXKgQkKQiuE+KgjR/5ktj+Bv+J6jFc6FNZoNS3nbXtFq9u0At6FNmC90ZcTZIFD54BSdVYDnVd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFg2rU68tA2UcEctW1PdrGrP3H1THO+/cLSHvMb2DK0=;
 b=K5FUR8S5ecJawZR94Ji4cohNhOgn8UpB01kYSf41WdKgblkBnPku0lyjoDY3wC0bg3h5cq7/oUN5sxkjWv6YqQbhv76ewonBLMNXs9+YvQJrVsgGYbQhif2cX7E6Rzv4EEJ0NKXBaorbCpKQPz0DfHlumVE86IEk6h/yurQhL5wv9V4SvT9v2y4fTCBrK2FRd+YYGWtn+KI8f0AKUbfz0H/mFDneIdtxW8Hwbg6fQWbYByECUtT7u5BVfgLgcrFLOmTjD8iVRycKGIuR+uhl6mu6SDX5hn2RGkNjeo02Hr6CdDNMqsBb2VC7ho8Avo13qYyhZlgPFa+X/wqG1gT0kA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11400.eurprd04.prod.outlook.com (2603:10a6:150:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 20:11:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:02 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:44 -0400
Subject: [PATCH 01/14] ARM: dts: imx6q-dms-ba16: remove undocumented
 property fsl,receive-dpll-mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-1-3a0cab9fd784@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181452; l=998;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7o3YrIQ8lxAz3Z8buXp5Q/WrWjZcgI9ir2do6blqL3w=;
 b=jPBxDs4LHtkUB5b9PXlzghb+UFmXnF6y1p26ILhW61mkzJPzKmgu7y34bptuDWSQepM5xUcRt
 1Xk6Ml6I/wkB1KO3CN66xkBv8+erlmwQ3vDFv49A6+5RM3elGX/Hrdt
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DM6PR07CA0115.namprd07.prod.outlook.com
 (2603:10b6:5:330::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11400:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c01a4df-7a53-4a0c-28f8-08df2bc199cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|56012099006|11063799006|261009223327099003|261009223027099003|261009220027099003|261009221227099003|261009221727099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	axyKhiCK5AYnicV0Yra1j8KZkYNUmPUJnZu6H0ysf3OCYAl/0ukuBkOkvqeEXDxSCnQqt936uQZcSh/96VL3mXKrP0O+T5tfzOoBQkLcGFFoXjEMKUv5RdUkIyDIjYxhHQBns1t29/L9YPNxI4glCRPyLwA5hl7fTO8DuDiz+HKwVzaKd2HJuyJ5inYx4C6ChRsPBP4R/KNlS1BQ6l5KbAFg6ccmB0dHv941PfR6azMVWwulhCkuBbjx3qIE++Z0CuyvQ/NnzbyRetm39UT1EAEE4rM5ofyMWPILVmHw8e+QCXLp9mbIkBa5cj4UBwlHsBoASYLQx7cPrrYDobmFkD89oxHt409pFADmfsPFv0Vzt3o6Jufwce6QqTEOdcblt85ZjF009U1RaDiNHS5nordV832vVgJ6LsoAv28OMgP1Pr3afrZwYQaSICR7j1oZBXAeTfihXPpjwnv9sOhckaeMqPB9SEmX0eH5T2T2vOZizUTCa4kZiSER9tbmUsgfpJV9h++9l70MFO8nQ5/fTAxeT++H39MXzw4XZzSzqy0y3VyrArQi+RyAxn1CYRf6S0nL0PFaUCD/x59qMraCgkVMJORhjyatRV3XaQXMt19YuIUlY0T1POjQZkdbODfY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(261009223327099003)(261009223027099003)(261009220027099003)(261009221227099003)(261009221727099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVdpWHZFcWhoQUZEUU9TSmFnR0VvRGlydkQ2MjZHeVRyVFhiaU5PZjZpY3o0?=
 =?utf-8?B?UldnemJ1cG80cWRFVldmbWJSVk9Md1I2c0l3VDVKVEVNR1pBdDlGMlgwSTE3?=
 =?utf-8?B?TkQwcStpdGpoWFRRaVRwNlk1bTMvOTFUNi9wRXdCUHpwTHFZMUZUWlVrMTVJ?=
 =?utf-8?B?VUpNVjZ3WDlNbFlybHF0RlRRWjMxMUZWNnEvUkdwb1ZjRDAyNGkxVFhtbHRJ?=
 =?utf-8?B?ZGZicm54UytwdHE5QVVkcm1PaXpPbVJ2bVBzOEttb2FNN3V2RWpneHJvYUNL?=
 =?utf-8?B?aVdBYlBkazluZ1NoSkozY3pyczQ1WjlLM1dTMXJiNGlzU1dSczFTWklPZkhl?=
 =?utf-8?B?U1BsQjIxb3d5TE9WWktJbFFYR1E5c09UZFRUS2xFd2RQRG5BazVrc1B2Yjh6?=
 =?utf-8?B?Tk1TYzhVRjUrUC9TSDJUZ1hjS0t0T3ppRVVPTWpQMUQrWUNrRjByTzVnWmFJ?=
 =?utf-8?B?Y1luMlh5akFxazNXdCtXd2NxRmRDZDZUbklzVy9Sc0cyUStFT01BNzd0QmdD?=
 =?utf-8?B?R21YeGdtT2tBblZWcDNXVE1QcndjYnpocFpVUC9LQ2UyalNIeVdEZUhFWlU1?=
 =?utf-8?B?VXV4bWpCYmNGcHJOeXZnNXJ0NGJ0OW1sK3Y1VUJ3N1ZCaDdUa1QzNWM5cXpt?=
 =?utf-8?B?UHRHYkJ5U0p4R3dGRlZsZW5RNVlNRE5vY211eGdpOUEyZUEya3lMQTJ5bUZp?=
 =?utf-8?B?U1FJdE1UcVphRFV0YjFyZlJYaitNV3RnOUM3cjlWbDEweW1vWUNxeFRvbTBy?=
 =?utf-8?B?MXVyTUR5TzRIT2ZCbWxFRzdPcXlvNWo3RnJGUHU0QjR5OG9QUFRWS1FYRHJ2?=
 =?utf-8?B?Tm56b0Q1ZzUrOE1mM3Vlb1pGK2lML2wrQVJNbncyNU91ZnBCWDVFUjN6RDVB?=
 =?utf-8?B?NVN2K3pkNHkzZlBJSWRQSGlMQ2VmV1BZWHBoUElKL1dNTkVsMDZtZ3dQeFp5?=
 =?utf-8?B?WVBSd0ZmWVl5SDJtclhxVjRlY3dhdkRVQmhQSnk0TjQxZ3AzZW9jWUZzb2xs?=
 =?utf-8?B?TEJITVBrbENoVHlWOU1GditCdW5tWHROK2lpU1NBT1JST1EzdGRjdmNNdDFJ?=
 =?utf-8?B?MXdrUFh2WTBjaElSTmNmN3JhaExpdzN1S1BuZVgva0lIaEMzd2xjS1VPSlU4?=
 =?utf-8?B?NGpWdm16VVJlVFJkZWczZFhIRnBmQ1l6bElvQVRSYTFNSFBXdW9TNm14TXFO?=
 =?utf-8?B?cXJCQU0zQURzZFRLaE9QeW15SUR1TDVqc05jdmJLc0JGeldYVWZES3JHbEp4?=
 =?utf-8?B?NnEyZkpKMmR4VVJDMWJrbnd5ZEJ0bTlmTC9jSXlQRk53Y1BsQVVZSmdDb2hK?=
 =?utf-8?B?T0pvVmZGQ2EvQU1WSDFNbko4NUpWaWo0NWpQVURyU011eEYyU3lvQXJlQTZ4?=
 =?utf-8?B?Sm5NU1llNjVwTTQrUEFXL0R4UFVXYVFaQVhuUUkrVlZVN2pablFBZktRNVU4?=
 =?utf-8?B?WXFPTHljLzMveDZ0bE1TNFcwdzFSaGRTOEVtNGljc0sxajljRVltMkxWRlZX?=
 =?utf-8?B?QjRMU1lIbFhUY2ZpSGc2UDNoQVdNZ1cxNnl1TW1hL2xzRWxYZ1hwOUF2UEVx?=
 =?utf-8?B?SjhFK0VERVJmU0h6S1lobU84OW1mTmFSY0UvUFhHdEdFbE1mREFRd1hIMGFR?=
 =?utf-8?B?RG1ocE9JdTF3SVNaT0piWFJSUm0rU0Z5Qy9EK2NZOTdrTElva3k5YU5tSmRQ?=
 =?utf-8?B?QVdNZE10YmxnWmtteFlSU2ZWenRZODFkTjhsTHJCZ0J6QkFwVG1QN3ZDcDk4?=
 =?utf-8?B?THg1OHFrZWJkWkJGU1lIOVUwQTdnQ0svVDFhQmdzS1BUTUo3L200YlJGUXd0?=
 =?utf-8?B?SCt5cTNYWVFhLzdHTEgvdFAvS1p6dkxqcEZYUFFDQ29rS0pQa1IzZUhhbU5S?=
 =?utf-8?B?cnZxSEEwRVFLVk01blFSc0pDODd2Ukk2NnRTWWxHcTMzVFdvQTNMTE9NdXJa?=
 =?utf-8?B?aWg1amFHSENqL1dDSVQweWdtSGJ6MEpleGRURVBDVWV0WlpPWVlFa3VtNmVY?=
 =?utf-8?B?Zks1TGNVZzZ6MzA2RFVkVDgxSXU1anFuN0pEak5iRVE1RWZHcGRZNG1tSG5X?=
 =?utf-8?B?cEFmbXFtZFFJaC9zejdjaEM2b3Budis4NTZ1NHdUT3hwc1pEeHJIVUxhazFR?=
 =?utf-8?B?RWR5M2tXQnB6UVltK0hVc0xmRlZ1ZWRTeVdFRW5JeHhEMFFtbGZhR0dzOGow?=
 =?utf-8?B?OE9kbzMvb1Nqa0VBWGVvWkpJaWlPT3ZsTFVKWEFJVG9BcE5XR2lvcXdTcUEz?=
 =?utf-8?B?Wkk3OGhYM1dLdzUwdXZaWUxHbTlwUXRDR3NhbE1uSUhxYmVJdEVhT2VyZDFu?=
 =?utf-8?B?QjNHNkh3MlFNZi9nUUxpZ1dWTnBWTVRneUlHbUNpN3RzamVya05RVTl0UnJ4?=
 =?utf-8?Q?JSPlIjQsnCyZ6OEcixuoomEbs5p/axazAUHwB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c01a4df-7a53-4a0c-28f8-08df2bc199cf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:02.0484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jStkRVFJMsNZ8h/H8tgveUcy12zOu2dzuJ3I0yNpMO+LVarKl6kCNXXF3+dZ9B4mYDn4ES+ONsuLP6GkWhH4oKOv1tVGJlZ0YXeFPueQupBPOLTzspYzeYvVACE2cROz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11400

From: Frank Li <Frank.Li@nxp.com>

fsl,receive-dpll-mode is never documented and used in kernel tree. And also
not used by known user, such as uboot.

Remove it to fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dtb: sata@2200000 (fsl,imx6q-ahci): 'fsl,receive-dpll-mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts b/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts
index 484a60892229d..766cd50390bc0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts
@@ -115,7 +115,6 @@ &sata {
 	fsl,transmit-atten-16ths = <12>;
 	fsl,transmit-boost-mdB = <3330>;
 	fsl,transmit-level-mV = <1133>;
-	fsl,receive-dpll-mode = <1>;
 	status = "okay";
 };
 

-- 
2.43.0

