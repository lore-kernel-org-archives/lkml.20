Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B22F43C7B1;
	Fri,  4 Sep 2026 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513773; cv=fail; b=p0Ky3yGcqGH41Gs5EUfgNMJ9SkPnG7+zEsSGqsA72nECOeR4EpbE3bIM2Lb01KZUi/BL05yCblGZ5uY0z5rFs7xO4ltx0phRELH6C7Hhp8cRKMqm5ZtkyUUMNTm5Dd2Nn2cZIl5/4whiNiWRF5lAq4Og/ND+j98P6gngpr9RyHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513773; c=relaxed/simple;
	bh=vsKaUQMCunSlmWeYEPnMWmm9qCmWNh5oGRkVrreCRJw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fCCN5/aC4RE8BsgBgHafCugyfv/uIIcmTmtc6sX2OsYuKHT7V0cNAIUdlH/brrcJtOEt4WCIqTWeqv67wb0lbAW9RuqjqqP0+jd9G+DAkLGw30VNOo4RKNIXmdh+Ef/88V7eqVsuoH3gzwW2o0OK6n7Jl8lCE1ykqKsO1Kw0N90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bHvWC/q1; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bHvWC/q1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHrZtoXG40fX5VFzlKCafz3L6fsH7AolCtDa2pExIYsx9wSGx2YLsPN+8Ontpvl8VfCywpftxO107K3D33Dyd4jkRM47tL+/E72lZo3fvGhC2bQI0rE6+568rASlU2rf+xXRJCq/eKwoMfUykhnKY00q8WG1adhoR/OI8sSc3qs1hTANr36RYYC0Fufdxe1pRdl5YyFzdpAknG74+etQvwqOCvzx1JGo9nqqqF9T6r2iBLz/XEBEuGDrbiTbgGoF3r7WCOZDtDSh+ZXxjoTqaquDWiZ3GD12fHhd/akE+mSzlBRhxRnBzqIM1jMtOHre49qsKnedAVyG65OXopImDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=bh+B+P9d0eiEis1929UhWSrIFTOdgIHmL3mIEv5RD/wpkmYmHv6Ayu1FOw/8RZnL+rh93NQs4Xp2ZNxs/vKZBo+6zb1GQOv2XRe16zU0Aq0el2GZRKholPe5e2vJqNNbmYUEsFddc01Xnp0Wo3QDENz5lf1V4x5L9cDMsQQIjr8eBo1KF/XmX2gcxdPBtCELi/dZCUw0f/oMF60QQblqVVqBTy7DyFcksttxrS3aL+gOGCy4o1ZvNNB2DGc+tF/wRZMwotQZpJeR8OcQtBhDdjInkiUKuknBvD8stwBt7yFI23p/RZ4TovYQ4ha8zZniDHZl/czwAv54y1WcHcgyBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=bHvWC/q1QdTD0ND6e/93zw/JVhVk18LUsVCLouXiPvuDnJD7kbY9Y/9TxozHSUj6QFghqXCYKjTJXwacTqlkSitT1aFKMYgenrlD17cG/CjTiC9GtBtobRBRyg8vIDytdCVUrObRvDrJhLay8T7FshtwsNXSni/TDKAkjaoCGCff1VnTDlr3w10UQF1hZmHCGKzo/XMVB1Tn1g/KZUdXx9eWasFqeIXf3xmp2vMbLee6zKiNheDZR2Knb/mqL1ORvhbwzvODlajTgrKb9/MwU3h0AAGgtlX3GCBhLHHXsSAZOHJ52se5JEKpp5ivBk1gdy8g7rGZWMYTskt9ti1kDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 09:22:01 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:22:01 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 04 Sep 2026 20:21:25 +0530
Subject: [PATCH v48 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-imx-se-if-v48-7-dad90eec7eaf@nxp.com>
References: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
In-Reply-To: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788533484; l=2500;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=LA5pZ8YRZFeVk56nd//uP0RHiwT4E6voL97vzkkh9tk=;
 b=xaK5BNdkBoGjt/AbGxfzYxx/iEOh/CEVkVjBShc8R800L5lZW453Yf/b/aezGUbnCZvr/t9Zp
 1XJ9nYsP9UyBGAnGHoBnnsY6m8F/VAmVfdudD2/b1qwy++y3jzmXuCH
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5PR01CA0236.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::10) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 036f7885-5e43-4d40-3c0f-08df0a65f9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|19092799006|18002099003|22082099003|56012099006|10067099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	n5pbMk4irTXLMrx1gv9TjynYCXMBGsqOuuWP4XemVPzDKrwIB25P+CjbQ+7iC5TQkAT8B2N+YRTpLaw+6HTEEqWRV2WWBKNC5kEjt2YWaZ+tRpaYRWxPbfp+exL3nK6YaszavBDV3o263yFjaaoQkiC881sKRH647HwSfSjfodn1hbyqaTcbL2OuQPnIXWLDu2obmuFwm3t66NhY3virpSnn5RKryw3sg1YBW8XvD6Gu2jyeyxcAweO+QSwRBHXwEWyXZbLtSZ9muA/oD6COLCyiPXO5zbOdPoZ0+aiKrYwdhIpma4UDykyC3Da3BToPVJkd8RwGpx/3ERYLVN6EAJ4Us9wGi7+KHsYBD7LVjYq+WrSRq/QpAUw5fWByaB6q4Dw6HswF00OtB5yOt7N5uZBQKTWKNtz/zSi2IIWG4DcpIFtBskH0gpK3PepHuPwQo/e3X3k2uUdZfzfD2QUlkqzDRLO7kHb+FtCDKCTmiUHI5uKBIcQEIBFvdyWr/OFWd64bxGAhPfTy82TBgOCs58+FV9xKb+csJ+hd3FoJCemfPSq2oYXxsLMLaiQdwqGf6YSR4/E/n9vq0kp50HtLElMUT/lN/+qzj/rnHdevsBBFpCFy0hdLzwCYd+NsQTyzOEG6Z/E1GyMVF/D9N5mV6NNf9f3hgCPTKN3MPc3DKoaBvWB3UaC2Qn9MYtWhFVtfWZdeWTasuqYeKPL1A1PjxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(19092799006)(18002099003)(22082099003)(56012099006)(10067099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGhFVndoczdKVzJGVHgyWEhFd3FuaGNsQnZ6T1pRMDBMWUtwRlJ2ZGwySlVo?=
 =?utf-8?B?ZkRTYm5zTXF4aEJjUHJzSXZWR2w1clFPNzIwVVQzUXRpSlBlQnJGU3M1ZkxP?=
 =?utf-8?B?MHJEZmgwZ3RDNmtYcjdKQ1hBREl3KzV4VTdGeUdqaUh0alBiNmh0bTBJeHZZ?=
 =?utf-8?B?ak9RamtINU9mSXFUZUxpVnVGLzd3ekFjbk9DeVlIN1NRb0FqYVR4VjJQVDkx?=
 =?utf-8?B?Z1BscTNqWWtBMnI4VW8wMmVYcDhmaHNLVEZMRWFONnFNWU9UNVNFNVIvOFVD?=
 =?utf-8?B?MkdwdDhtTWFXWVFSeXYxUHdiaGsvMWR4am9Kc1J4eTYwMzNpdWpTRDRQa25l?=
 =?utf-8?B?ODFpaUltY1hQajZURi9Zb2JQd1J2ZjRYQVM3Q0tVM1QyVXRJUlRmemYrNXZq?=
 =?utf-8?B?MjFwMXJjYklRUjRoVW5NVitmOUxGRXFBanRiYnJqUm1RQStYdmxzVXdKTGhX?=
 =?utf-8?B?d0NQNk9tbG80Y3JtNWtKV1gwMVBoRUpjaTRRRWhWbjgyN1pvdGJVSlRpRndF?=
 =?utf-8?B?amlwMGdKVUF6VXphaWZ1bTE4OExsUVNnbnRFdUhYaTFRemhMS0luNGkrT0R4?=
 =?utf-8?B?bmtzUGJONThqTjFmSmVteWVuMEVjc3cwa05JNzhUUmpjUTRBYkMwQjMyN2xN?=
 =?utf-8?B?a0Y3cjFEZGlDcXJ1YzlQTS9xMDhZS3U3eklwRk1pNTJFNWFIUW92cnJmSEtw?=
 =?utf-8?B?RmN4My82WnJTYW9nUU9sbk0zc0c5MXM1K2VBcXRGRkp5STVLZFU0Y1hyK2lF?=
 =?utf-8?B?MEo4alhva0tydDFQMG55RGY0eUUvTzhBSVlLRU41TVhzNGptNUhHOUNTcFBS?=
 =?utf-8?B?cVlia0RmYVgzUytJTTBQd2s0bjc4UjFzQ3E3TUZicHRKQ1lTeXNMRjczOWxK?=
 =?utf-8?B?Ynl6SCt1Yjk1ZFJlOFhLMkV6QjRHQkZCN3VxUmZLRTZHRmk3NmdXRjRJdmtt?=
 =?utf-8?B?bjhTNXdmc0xUeDdtSE5qdWQ0OEVPbHVOOWRxUnlISC9LWkdLK0xPczJnMGJX?=
 =?utf-8?B?TDdISU11T3JUdURmbkwwL0xVeWNkc0NDQ0hBaHNMZEo0UFdBZGJOQm1tNnVB?=
 =?utf-8?B?OHVrSUFIU1lkRjBYQnBIM3RJV2J4dXBJYkdBZUdTWndNMUdHMHB1amxLN0xK?=
 =?utf-8?B?SGlYZVdJOTFVdnNwaGJ2K2xGKzNnckFYUVFzdlgrN1p5YTFzekZCaXN1aGZl?=
 =?utf-8?B?YXNJU2xhZEdtZGczcHk3RFVrVmlkWXgyem16RWp0MXh3LzAvTkxjbWhWc01Y?=
 =?utf-8?B?TGVod25ZR3RieFIyTXM0RFFvZTlydXltTWx1VUpCd01nY2tCWEhEVDhNMlVp?=
 =?utf-8?B?VHFUbkw4MVMxMVFnS1prRDBLbFRnRWFiU3lBNnoweFUzeWtlUFNPaHBuUkEy?=
 =?utf-8?B?eWJXZ0VWMlZNWnE5ZjhhOXAxbW9TaWJhckRhNFk5TExWQ2lqMHBQZndjQmoz?=
 =?utf-8?B?UGFZQU96MFhNOXNVS1oycERyNUZUS2NmNU5TZVo4c2dUSzUzRUdqaVV6cytz?=
 =?utf-8?B?NXIzZkwwa1ZDb1VqRzN3ckJxMVJkdFJzK1c2cU96TkRvbWtacUhpc1dwbG1m?=
 =?utf-8?B?UmFyWHlxQjdJNkpmcUsydEpPTEVMcWp6VUdneEJuWERaMXB1RDNPNnI4K3hG?=
 =?utf-8?B?NitYWVB3Y3FpQWd4VHNBMGE0d3pIbERQQ1RqY2daNVlSRXJ5OGU1SVNFc080?=
 =?utf-8?B?bVdiWjlUa2REUHkwT0FXdEZTd1NoMEFseEZ6S1BrVlFhOExreGxScFExalN4?=
 =?utf-8?B?RXhRUkxTTkJZa3hoSldIUE5SclNyWUI1d3ZiZ2ZWTXIvQTNVZkRVeHF6a0Jw?=
 =?utf-8?B?S1IveTNPdWF6ekNSTTZaQ0twUlM0WXVwUnFiOHpkUXlLUVB4SGMxSFpzeG9H?=
 =?utf-8?B?ZXRTaytkTndwTnR5Rit6U1ZLc2hkMGlQRUQxV2pXSWZJb3JiWWZYdE16c29I?=
 =?utf-8?B?Wkl3c29KVXZLQTk2Z0F5RU1hNktIK0dMNjBKZEY4M01TK2FGbXUrTVVoMGgr?=
 =?utf-8?B?Vkh0ZGpBTVdRQ1hUY0s2dEVuQ3pKU05yYXBRWlY0SEFUZUVLV25WMms4OXRs?=
 =?utf-8?B?ZTQ4STdTeGNyS0M1OVlSazFKemdvbEdZMHZTZGdCS1dhUlZyNkVYaXFaRWsw?=
 =?utf-8?B?MXRyMW1nN1JkbGt2UU1ETDFwdmpPdTlBNjVZRGpNRXlHUXo0K25aVjNYcFlv?=
 =?utf-8?B?K29MN2RiSnlqc25TWjYrMU84VUQ2aTIwZU1sTVFNZHlFSG0xellUcE5kMDlV?=
 =?utf-8?B?MXltQ01UeFFvU3F3dFdjR0JhS0VHbktGSXFCZWJsMmlyOXJ1MHYxOEJ4V0ZC?=
 =?utf-8?B?MEQ1Zmdwd3MyNngxNW9od3ZUak91YkxtbGUrWkFUbm9RZzZZRGtDQ1gyVExK?=
 =?utf-8?Q?nZn4P21Kr5EdZ6Oz1RwYGTW3o2GCdowNO7gD9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 036f7885-5e43-4d40-3c0f-08df0a65f9ef
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:22:01.3392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZtDEvulJPnc6DZgwh49pGozRbeJOAM0yMjDK7R+p8BQSfBWOYb7YTueyKuJxAO356Hd1rEAD8Tybr+QyMgncor9m05LkpIl5PV5hV8RulPltKzOdfuHPSxOGVUGrEMC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR for the EdgeLock Enclave. The enclave hardware can only
access DDR in the 0x80000000 - 0xafffffff window, so constrain the pool to
that range with alloc-ranges and let the kernel choose the placement rather
than hardcoding an address.

Provide this as a shared imx8ulp-firmware.dtsi that also enables the hsm0
node and wires up its memory-region, so every i.MX8ULP board can bring up
the enclave with a single include instead of duplicating the reserved
memory node. Include it from imx8ulp-evk.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  3 ++-
 .../arm64/boot/dts/freescale/imx8ulp-firmware.dtsi | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 4b925832bb66..5fe58a025cfd 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
 
 #include <dt-bindings/input/input.h>
 #include "imx8ulp.dtsi"
+#include "imx8ulp-firmware.dtsi"
 
 / {
 	model = "NXP i.MX8ULP EVK";
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
new file mode 100644
index 000000000000..e4bc352f68af
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ *
+ * Default reserved memory and EdgeLock Enclave (ELE) enablement shared by
+ * i.MX8ULP boards. Include this from a board dts to bring up the secure
+ * enclave without having to duplicate the reserved-memory node. The ELE
+ * hardware can only access DDR in the 0x80000000 - 0xafffffff window, so the
+ * pool is constrained to that range with alloc-ranges and the kernel is left
+ * to place the 1 MiB region.
+ */
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: ele-reserved {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x30000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	memory-region = <&ele_reserved>;
+	status = "okay";
+};

-- 
2.43.0

