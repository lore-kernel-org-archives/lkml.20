Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E15035C1B7;
	Tue,  1 Sep 2026 22:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301557; cv=fail; b=BVahMBdZ0Jujd+cJBm/3IkFsV16JVBgkUZVDHSQb1+EB7A3JDVYZx1l4zAy8aqZkclol+HdMVCgp2mqX2ihUurTgzpimfRlgYNdK8jcMfhw0v9viaBldaF0gvWlgp55aFvmErU4wbH1rZEVSpaCQYBT3jdbesrPqiQPG7H7ow28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301557; c=relaxed/simple;
	bh=5Uw2ayZLMhWsVTHRu8QkMqKwYdWHilPKb+sfS5flvcE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Gyd/XxkVNW1peIq4v1EwLlBROBNDVcjob1V4pAYlU5PW0CZqW27C+yXBrB0d6bSLugnIIAAlnPBRHM7flFClFtkOfEFgDEfEHHSnZepSElCkhK4RST5vnZVB6th5UphIHH8yuIibuzjVXLFVtVzVKgGbqicJi7G7TvXcQtZyTcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BZdinZim; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BZdinZim"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLYLjNw3CaXsSOmfnj90Ji1BZ6XL8d+gKe/pIuodynQOGsmJRaoczpMnivH/6soUhKN5qCJmc1GGi7X7/Oc99C9hWA88EQFc8Dpc8e6MGTRQRoLR7WLWMNf0nz4UsxjRehqeRm1xbtVg7T7WR470ZB/nVvKDPPoMFz3357t/XPlDxIDRXmzXV319bG/18AEOLNOKaU47CXvyOkw5/6mMhViLnB9vyAn/xypD5Azs6sJ7yTSVnkga4ks8sSgLH06DYrkzVIrp57nE2lyqAiHPPYZlbFNKJrFJIy1ELvmGyrFnGlQN5tCjs7Dsf9RdSWvs2mLvb8KU75gV4D/Uu82uig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFpzCADx3OU0IeL/dEjGKDV9dcvZ73exUtUQJrFDGcw=;
 b=gRCJFQg2dV9Wd4dQk3WEmxv55TS6TpEiyZrNr4IXtKc0yAd6F11E9G6sTUOlEmgu1u+rkvfG8GIvsg/4Gte+Z9uaizRCHLTYqY5OuPgG+cDHXGLL8+7iDx/7y220Rdg/vJwuGHikqE4/bZ36frRwypJO9qo7osO4/DSyGE0X8H2iGxPvnXaSTsyCAQLlf5Na0ZGeEc1h4E9yaeF7oZKA2jvRF+3FX4PZP6zd3rAs7VRjaKJiWsLTkU5d03X5X7W0ZVCzg8CQWuwKI86IS3d6a+MILP0c7vTsGsOnEZpCGArpbjCZn8Yhbx/vNMwY5cM9dBg0nH9QK7Djy6ze22/6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFpzCADx3OU0IeL/dEjGKDV9dcvZ73exUtUQJrFDGcw=;
 b=BZdinZimIZVyc85FG/zBvnhBjjJUZm1/MtY/MOAS/ErubEvC+pVt05Qkq9/cWZdkwCSN9NBN5MG1LEgn3wrvYwimocM5VpyJ7C/QnYd7WjfWWubxzR5Rstf1LH386G5SUhux5np6wPuKcJHPSRFTPfusQk64EH/SPmAMbrrKM2EWNkUCrY/GxE5PTeEn08vdIttUx+R2fZInsTu2KZnFFGTm1EzNcdv6JZruDYhdJgoP71wXHQojD56Mqv4jUK88XVhljED1l8adao9AXvpazETOLrz/Im8RU/FqlmlWwPZBtFdmSxiGVNNIWiH7M927nVJDRYhsCo+FVYcesg8RsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB591767.eurprd04.prod.outlook.com (2603:10a6:2c8:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:25:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:25:52 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 0/8] ARM: dts: imx: cleanup some dtb check warnings
Date: Tue, 01 Sep 2026 18:25:34 -0400
Message-Id: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9Ql2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwND3cSi3PiUkuL45JzUxDxDXTNLC3OzxGSjNBPTJCWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgCyMPIMcgAAAA==
X-Change-ID: 20260901-arm_dts_clean1-69876ac2f45b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788301547; l=1408;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=5Uw2ayZLMhWsVTHRu8QkMqKwYdWHilPKb+sfS5flvcE=;
 b=W2IsiNIJqkZdbTDqTBNmZuZL0egKEVSXgHcRn8QrYtfW2Qt3yqMQCD8RGsc2jxu8E4BlKkwKD
 50jnGnuaem5DJwGJtbBsapxgrhQrKhxXwVGH8PlHLDaer6IyGsAtwyE
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH5P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB591767:EE_
X-MS-Office365-Filtering-Correlation-Id: e60de61f-66f1-49f1-2cd0-08df0877fb5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|19092799006|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	qms1Zu8N6wUeICux4c9PlPH1i+oWVKEoO0RgryfkMicRPwk+dP8VIBvdQMovbbloM3Nf3mZCdzq2xJfod5UIKieh1OisEc1vBBt57limi1Buq4cvnQ+8WtXXKPqrUI39/t1uhYRPbYDi9Gndlaynjz3MysMuVBOI0eV+jhCOJCBcFDQ1Bdec3cASnn1Ix/zDwcVKeBs+XaDBu8LDGMrROokuW7BX82lhLcAPw9zsVRKEN+zI6U7O0WdlapHT6LFmMwYUJ7HWDcC9yhYVsJzLu8ZjC9Ltuuzm91/JTmSpl6DU9Jt2vy9T6M6kpEn5Nfrd7zbQ/VJbRNdDZhDZ8W+XHqBT63rBhAx9awSJnHMv+EgdvxHYuMiXZzI5/vQVbop4RRtTMDJV4zlkBaACFz281Kd6EXsD5/UTYyj/LQK7vk0QOe0kQLcspgutGJKREK+kysA/TdHi6dpKhsS5HwEwwGNLVD6br9k/YWjZtSRMYjffOZpy4GiM82T6xzVWowUQ+46K7GTf+nm/xds2sSGBDGxY2DlFGZce2m8vY6JxIc2OcRmFRiERk5URkes4PM8Dfwv+2xy0bFNMiERug22FnrJZopgMCEvzcKVv9a2+dSoVJZKiENIuQcZPgGgh+uYeqL8AyebCZpCUZuV8ZdGanDlMCnEVkYga623CbpBB+6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(19092799006)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXAzNjFqRkl1UlFkS0gzcmgyaGlvY1lQQXdXbTEwRTh6b1VyRkVjdzN0RnEw?=
 =?utf-8?B?ai9rL1B2M1FaY3o4YmdLK1RiTSt0cWREbUdDbDVHbFBhbVBWdEdWamxOSVkx?=
 =?utf-8?B?WHhLUU9lVWdhTzJ4L0kyRGVUQVE4aUdlWVJCWmc3bVJSWEJVSlFLdGFPb0Vr?=
 =?utf-8?B?S0NGNmdZcDFvcnpMOXAzVGIvalBRV2R1T0F2Y3lFclhKNVNxTFEzYW1UYUd4?=
 =?utf-8?B?YWR3ZE9oMkNqMjhLUk5xOXNTaTJQb2dlc1AyQWpueUtBdURlMmRUT3p5d3BK?=
 =?utf-8?B?Vi9rTkVUTThPTnF2OSsyWkZhVEdwYWJHSG0waUlSeE5rWkNUS2Y0Vzk0OVpu?=
 =?utf-8?B?Z1BLV2VjSFFQZU5MMFhxdWNkM3hyWUVKNDdhV21NQkh1YUkvd3dhWFFvRDBq?=
 =?utf-8?B?QTh4R2lRTERoMTlSRnRQMlhlZC9qeGtWSzYvK05JVVR6UEdJWThQdmlOL2pi?=
 =?utf-8?B?RlVxRnJsd3cwL1o2SU5NZTB5UlhBQWE5Qk1uRlAycGlIYkdiNzJiZHdLZEE0?=
 =?utf-8?B?OXdyM1RZY1F5WkRKaVBjSVNKRGdSRU9reTdnOGFXbW92Z3lKY25LM3BqeXo0?=
 =?utf-8?B?QTR0L3g0c3p5WXN3WmNHN0M5YlhPSjdGbTlTdUhObzkrTVQ1MWJETnNZTFFB?=
 =?utf-8?B?R25DRUFmZjlBMW85RU5NYnpjSEJYSzlRMHBpdVJjcHlGVUFKdTFLL24wbjVU?=
 =?utf-8?B?Vlk4OEtWeHhENHdnYzRSMCs4dW9xRy9lNDM4aVZjcDFSUXFiTjYrTlZBbnhH?=
 =?utf-8?B?bnRiNi9SZnljYWRxV3ZFVlN0aFkxblRVd24wbDhPa0dXRDlWM1VNNlVualNV?=
 =?utf-8?B?MWRNMjgrY1JLYWdJOWlvMVllOVFhMEVrOElyc1d1R1NrSUlzWnpHWXgzWVZr?=
 =?utf-8?B?d0hLSGFOMjFYNkwxMlc3MmZvVHRoWXA5M0VCU2N4a1BIaTB3S3d1L1pzNENu?=
 =?utf-8?B?cEdoVDNyMVZvWCtaVDJqR2RxL2t4THNLOVN0MlExMk9QZFlpdk5GMk5LRng5?=
 =?utf-8?B?MHFCNEhuY2RwY3M3emtTY0R5VU4zd2lUc05BWHNUN29VVU5LeGVMMnQ0MG05?=
 =?utf-8?B?ZlBNWlRCSmZCRExiS0RtUldiYU5QZkN5OFF5VmoyeC9PMW5FQzhuMmJ3MG1l?=
 =?utf-8?B?MlJ1dFJFSGpQdENCQXZSUG40a3VpcTQ5RDlFaEkrZ09XeEFnTDEvaGhLYnlM?=
 =?utf-8?B?MHVpNG5RaFRVL1lXUVN4czlVNjZvK2hjb2JidVNLcDdlWlVnOWZvdVB0blFM?=
 =?utf-8?B?Umt5dUYxRk9LSjZuOEc5TG1EWGhGeUlGTXJpaXlqSURXcWR0cmhybDFISHpi?=
 =?utf-8?B?SVNYL3g4MGRPVUtDWnBubHh0ZEJTVVM5bVMxL3BCNXUzbmR5UjI1bjRDRXRO?=
 =?utf-8?B?OVVhYmczQkVCT0pRV05HWXVqdjRtc0lrajErRDY5TTNoMlpUbWdHTGpBOHYz?=
 =?utf-8?B?N3pmcnkxN0dBS2Y3Nk1GR1Brb0xEOHV4Y0VnM1BMckhZYmUzTnZ3dEZhM28z?=
 =?utf-8?B?czhmdGhabmFRcG9qbjVkN0lCam5XZGNGekxWNHgvbHRvUTF3WTRaQWRGblAr?=
 =?utf-8?B?L0R6OWU1RERkaWJwYVV4ZFNKOGZEWHNhaDN2aE83RWVVQ1pOUUZ5VUE3cWJz?=
 =?utf-8?B?WVBNZHJlZytJcXo1bktuZWhtL3pZbWZPaG1EMzZ2SGd5bUNMRmVOenNmNjlZ?=
 =?utf-8?B?ZmxMNzlicFpBYXN0dUZmZlorNDM1aG9wcHhSRlpFZmxPc0tGa2hVSlJPQ2ZM?=
 =?utf-8?B?eVFVZGdPdG05bU9TMStjWWRJY09MS2lqT3diMzZFOW1WcmJPZFozQkp0R2Ni?=
 =?utf-8?B?K2xYMm9Hcm4vc05Kc3ZlY1JWTWZKa2p2Q2FkMk9HUlhNY1lvdmNiYTZrclBI?=
 =?utf-8?B?b09EOTVYQTBIYWI4Y0cvdXpWaGxSbUtoenM4b2I5Sm9OekNsK0E3UGZwQU1T?=
 =?utf-8?B?VXMzRUV4UDFOcnRzRmUyVndGVEt0dHVWeklzR3FFaEo2Sk55d3dOQUlrbU1S?=
 =?utf-8?B?RWQvclhqUkZlVnEwdmJlVEQ3NGtOVzExT3hmYUpnUlNvUXJZaVFtQVBtcXNY?=
 =?utf-8?B?UFZUMUg0VkVvWWQvUFRsZnRzQTI3c25kZ2xWdXozdy8vVHNKUEFCNUdkOXh3?=
 =?utf-8?B?STd4ejFsbzBnZFNzQ2JHZXpXWTNMeDBtek5UeVd0aGFJYndwVE9vTGdoNzlT?=
 =?utf-8?B?UHRpUzVYZUdIUXBYYUtZR2ZPZmRzZGlFZXNrZU43NStnYWxuVXNmZDh0QWZH?=
 =?utf-8?B?MFBOU2drQlhsRVROcnVRYmtlRWYzemd3Nko4cnIwWGJ2NzhuZjl6cG1BajBr?=
 =?utf-8?B?SUoxWllBb3VQbkVGTUl6RFZLTGt6ZjJrOGN0Q25xblRQbmE3emE2d0thTnln?=
 =?utf-8?Q?xvdlRP1AY1R60DiAsapXB1+O0t0uUdo1lywPX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60de61f-66f1-49f1-2cd0-08df0877fb5f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:25:52.4213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1P4PXtreSvbt5Y0JRN/veunHPLEc4Uxzm20yJO1q/65yA3Y0tDvTW46LPe6jPeRcpex1pDl53bjUcLBiJclKkTYsYRms0TYDpHI4qHl2v9qlVVHSl2lQTRCD8uC7B/t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB591767

Cleanup some simple dtb check warnings

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (8):
      ARM: dts: imx51-zii-rdu1: rename node name i2c-gpio to i2c-0
      ARM: dts: imx6qdl-emcon: Remove unrecognized disable-gpio PCIe property
      ARM: dts: imx7d-nitrogen7: drop unsupported wakeup-gpios from tsc2004
      ARM: dts: imx7d-meerkat96: disable lcdif node
      ARM: dts: imx50-kobo-aura: convert sd2_vmmc to regulator-fixed
      ARM: dts: imx6dl-b125v2: add touchscreen-size-x/y to exc80h60 node
      ARM: dts: imx6sll: remove unused node csi@20e8000
      ARM: dts: imx6ul-14x14-evk: remove reduntant bus-type under csi node

 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts   |  7 +++----
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts    |  2 ++
 arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts     |  2 ++
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi    |  1 -
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi          | 11 -----------
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi |  1 -
 arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts   |  1 -
 9 files changed, 9 insertions(+), 20 deletions(-)
---
base-commit: 76030f63972b16e0b5bd1ef7a29a1c4393712736
change-id: 20260901-arm_dts_clean1-69876ac2f45b

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

