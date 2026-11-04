Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792231;
	b=BEwnjlbqaAPoNr1iNrnPCFyuvBviuX4elveRH5EPf1gB2p5Doi17hl57KuC8lxy+WJtA
	 Zoo+hdlHPFG/jE7rLe51ZVF13JPMofDvep+5j148iOlUfzkYACvTYXBHFUOenXqthfUIV
	 NFsH0h70UzqtB/68WhCaownCsgjIOzcJpVHKcMKKY5A8e3fj0XBbm9XFpXPi3aftXx9ZP
	 c7KEP3oxCDxdeHUUivOx8JnoLGWDX1CibRFe05j1sTvFnwOn3kg/R92PWCBbowmjOM6uB
	 yTIlANeW4q0HcZDhszXY5TDQddwROpjxIF8gvnCHsb5FCjTHwGXB2sXTzPCuiHmPNIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792231;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
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
	bh=r9xAVyrfhy7+wuC+myqZzRDC67OCfC4vf2ZXhc06NCM=;
	b=OgePkdh91aAWECQzKr+DlSzhkSxARxyBBd+1lFCfSSnrTod4A8yen6sXFrp5TwMXInR1
	 2JK9EKEuiml++hGsdq9XsIt435abF+AUXguDEzVG0l389NC6h0j8xWnabRXNTlOnUrd31
	 flxCAirOBs/hvYIG8ty9ueB/9Cv2pPj1LtB+Y0Or+A+hCXzuQYktR+JoOQl5oICwxMvea
	 mU6uV4opDoUkRTA0RZHvkkGbXhUFicM2E4lAkvCnAk4biiDBQbds3P2Gf3KHBd31IeE81
	 jAdErHP87FAq//ygs/vKm/hDv41uOdU/zsNdxEmeXGbINGA6g0qMAV49Y1a7Duz6uQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=E5dniy5M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52863606A339;
	Wed,  4 Nov 2026 11:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52863606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=E5dniy5M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOQ2SCsZKYUNIRwTsz4PYd+AJTbRqPLjpus+uJpwmrlhnjwg/xF8k/1DLxkBCHTbpIPD6FnJ49WsricE56Qc4Gz3fNngiswyHGl93bM6R6GOHzpuvCjmbYOhcR1vL4txL6Sm2Mch9S3EY78OGk+igBQiNOf1Dgpo7ew5VyMWtprGpzbplYGCwaX8gF6mq1D+GKH8CdPeRt3RomJoQeXvzd7Hfu2CYpt+LnJlEiSmZl7PQsUb2guJLr5UULjPRFlDijBW63aPGHJsS5f2Jxl8HuHMm+Ydr/N5ulQUrZ6+mIUgBoAwONotXtrAwq+RPK65T8J7Jpufo/bL/vdDRq00UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9xAVyrfhy7+wuC+myqZzRDC67OCfC4vf2ZXhc06NCM=;
 b=N7cSZ3CcRVtz+M2gSZ1rYk5kNbnmOTxQjXQGOf6FxHY/QU4lBKtolHEB3gnAuZPQ0EMMdfyQy8vzP7LkM/nfcTH7HUYQrx4S/Sf3NHfkVeVs23RhbsdFAZrZOkyHVSt8V761adBE1Fad9XBW49wEA+s8sr5xUOVc8Px7j4PIruSrQ37osdpwxfUex/Mxl23CEtpIwkbNpSl70TaG/y9ePxtADXpMr8i9CR/UCnxb1BqqnuiCVE3D6/QhQjms7Jm+rNN756yAJa798lLEcFdBSJjiazU6mry0wJihzXqCoVNZKZG1S8XUl24CZ1DYwJlORMnz96bxnQ5RO8U3cjpOqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9xAVyrfhy7+wuC+myqZzRDC67OCfC4vf2ZXhc06NCM=;
 b=E5dniy5MSyn+i+AlLx64QcAU0ju/57hVd5exzunw6lVbmQITssez96MQyN+IyTh0dfzpbUANY7hvq4mshQGnSKqVk5tInPo2C7I4T2L2qzgmEKs5+ziswEpXsgQYsv5sPeIHpstGkKrKeDQIwX6UI8ZmrBF4sa2KI1WY3sEWfhzFdb4JRTFIwvnHK+z8eYUaLrlzBP0YWXL9qr/dzMe2d2EpBTn3dTvgURj//lRDIu8QHmefPemVjil65wMLjmtYrNQydU+Gct+XCzTpbRIZONYXMyrC5LfnfcM6kn6WJgI368hnine/X+kQ/f2EtJNV5HHphJqSlWB/PGsoNxWXbA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:36:56 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:36:56 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: Convert to subsys_platform_driver()
Date: Wed,  4 Nov 2026 19:33:30 +0800
Message-ID: <20261104113330.1634180-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: aad6ff2f-19de-4e82-e109-08df3a67e9d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|10067099003|18002099003|56012099006|11063799006|261009223027099003|261022075727099003|261026121527099003|261021123027099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	Rby5sg7b27WeUjxgxm9yLKaNG3dgfMyFFJOntwFjM+NIcwQY/43cqg3U07aeCIz6lxJDTcP4pClluvSjrY30SrfdT49debv5qOxWvkfDa2X17/0JD8fxMfBLImoZaN1R1ZjiyjX2V/eYzbxWhLIBLHQO8o5EFpyczj7Tex305OO/cAvzJ3clXsLLQifdc9v5XVsoEgCelLf6kIIucSwn1u0a+/MdJYDHYsLs9dkHugKL4sRH8GzFySDeLikZAzMfg98dAHGRgzwTmO13jY718H1nd6B3k1re+Id9/Qts1J91wZqPEDD+JDeJhwQA2PpeyqVSXDB7EYwlOp/JRDOAryQzFer7LE2p14dGCcEyGkiyuNIdnwuhD9bZQcRqrKY75zLsgoV7KlXPsJMbgWQFtNsRvenCMhhG+vlIhpgXbPZqbRJbZSz9lyqlVBFl2tsOILMoGo08vngGGSWHQD+V7MJ2hA5Z5ld0A6NyzO3khoFKzmRqKMQ7RKx0d4w2q94Zcgg5QfVXuXRQh/LQMzeNaN4ZEZ4BorvZLo0sVLE8owpcKY+udcnif2JFFUhAP21iWQkIyKgnuXC0/1JZ/ZFaF29gR8xO+Ez6Th4tgdL+Syu7glp8wshQ0zVkeaNPJ2kxLwAwkQlj8GGzndDYiifGDPU8oRo73g6yT1w5gLLheGU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QjMoXc7m7TK0piVemv5Nou0zRNk/n1knm50QXfYzCnD2awq/NGOqLWYqhchi?=
 =?us-ascii?Q?h3ZZBZCXQzrEjcCamaUDolVoicY/g9G7oZsCLlM4n0YtgLGDHSb1YcjJSQaQ?=
 =?us-ascii?Q?+0gHsXQofH8zDNX+uY9cxbOC9/TCaNYPAjgJz9cD5rXkkP5v/RGv2nOX8e22?=
 =?us-ascii?Q?rJ9hFXHNjWM3cG1uynFkZntS0Auj6sY9DsbxKM6rB3KTDNeNfTSf00KmAfFu?=
 =?us-ascii?Q?ZLPPi7BP2dVcQsFtbBPHXO85vzPuLmM0zu88xoIYmaC73RyyZJ84Xthu8HEK?=
 =?us-ascii?Q?RlIkh10tvrvEKOmcL90dbz41l8rz+D8MHZeDlZi1tQZRMv9z92QAQBMDFuZQ?=
 =?us-ascii?Q?cnGNvuYEQVeoGbLHGy2E4JFZXloEHcaWM0eryIvdFfSx4Z8ZPJP/9Q7K/mMk?=
 =?us-ascii?Q?3k5FX26OOV5KLgfqfUxvuvUVehk87BMl+5/P7OkGxBKP9kYo7RusiSX/cj6u?=
 =?us-ascii?Q?2wJ7ikznmAb/4n9YqtpAS1bCyPaHOQ65EJC4OzfGx8yQXOOn3AR0cseOjoTa?=
 =?us-ascii?Q?727FLWW3l8Am8CsQLKsIuOTf2GTb2djD1HH0lKwh/azym1IoVwjulmmYrVoR?=
 =?us-ascii?Q?YkR1I1rWofhoC4vtZl1weRjQCf+NrlheN5qaKBoyorx8iT0myZLykiFI0uTy?=
 =?us-ascii?Q?WH/oFapa2vc4DJ8NE0Cq9CoLItT2bsRBux38+poiNje44ONAUwVenF7xn01w?=
 =?us-ascii?Q?ebxfNHKx9RhZbG0d9xtJ1Wa86JzVgYK5jWzmubbaRyRMTqhyPBCEbF1Mz8AF?=
 =?us-ascii?Q?oMsEKr9lYNFkDC4Pu6UjpAKVCvIirZI1To4p/dpGWGXqywfF+3pdTmPTR+3Z?=
 =?us-ascii?Q?NJUdklIDNCVAQKbJLzyzVDUTKMJt1t1Z6SrKpn1k6W1TOtluHZgX795px0Fc?=
 =?us-ascii?Q?37o6Ig1TfhN6QnyQ+DBASJhtLJ+efGkaCBnTkaFOI3UzTTjW5Zf041eQ7yXF?=
 =?us-ascii?Q?QWYafnjFHQu8TTZahDThMGT7ow4XB3gHf7aeTWuyoD2tsvbcgNRdlSlN64kO?=
 =?us-ascii?Q?Opf3er0zNrvd0klQw7XC+57aXlub1bRWyDKg7c+VI185l4U/k+W/mZ8dfoee?=
 =?us-ascii?Q?D1N3BvfOrO6EocSRznOhPHxKDhA37jJ5hOTXFfx3DtWaAKfPmzcteJfvrte2?=
 =?us-ascii?Q?fkGSl8kPqjqe7eTsrXxUrjLdXFXjaHY1apLc2zCtScorFLaFqX4YCA8yM1qC?=
 =?us-ascii?Q?Yw407RuDAM759LKO/ur0ST7VFRyiIQewnb26kYP+gJ9XUblqumGhgQJfsM+8?=
 =?us-ascii?Q?uYE9IEd5bQY8ZA3aAgiaGzspwZQrjmxy54Pi3BObtMt/BwDHFfQ3qn1DoBgO?=
 =?us-ascii?Q?2LA84D+4fmWjUAW854G4XGUDrfrMVO12Gvfm+dIhZVvWb3K+1fFFrK9DBMBb?=
 =?us-ascii?Q?T+7JjXK8PF7I4E1HvsLDzzfUt6CMZ4tG+SifVrAaC3t3YX+j9gllmvEZ933G?=
 =?us-ascii?Q?RcNSyO1vI8uX0aBziu1bLsFfPed8bjBgGlcUQ0an+DinHbvxMNHZxXPJIED0?=
 =?us-ascii?Q?3det/F5mNRjrDbdZC22sxkn+qXsb7xrnBOfFTifw5//aYyf/JHeAnpKCfyOZ?=
 =?us-ascii?Q?hIJyBVPMm1Pj44aPvvWuEN7C38CmMYUSdNxGLYuNeQ6JMYkOno2q2qVM9GTK?=
 =?us-ascii?Q?W/Cw5qCEZ8wG2+B8XdOoMIbqNRdPAP0v6Us4xlF9NV9dGzFwp6DrOUP+yfmC?=
 =?us-ascii?Q?aCySAixm+tVdzJBoUHMqeiwq+V/wokwazoMo78FWnTlZfGG1yrF2TwcFEJRg?=
 =?us-ascii?Q?rDQXG29n4ZKryDTymy1Wb+yF1IcySsskHWVBD5B0QY4v3k97jjTE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad6ff2f-19de-4e82-e109-08df3a67e9d3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:36:49.0473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IabL4Pa2CJl7hAMYmjW82QdGu8woQPrEz+p8AiM7+F2zTB9tXI5rLUYSQAEi5FTnpdlr9OHf2JbqRgevlB737bWQga57QlXsN+VBwwlhyt9kizxX02fY2Cbf06to52TX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded subsys_initcall()/module_exit() platform driver
registration with subsys_platform_driver().

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mfd/qcom-pm8xxx.c         | 13 +------------
 drivers/mfd/tps65911-comparator.c | 13 +------------
 2 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 0cf374c015ce..e1e236239fc2 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -593,18 +593,7 @@ static struct platform_driver pm8xxx_driver = {
 		.of_match_table = pm8xxx_id_table,
 	},
 };
-
-static int __init pm8xxx_init(void)
-{
-	return platform_driver_register(&pm8xxx_driver);
-}
-subsys_initcall(pm8xxx_init);
-
-static void __exit pm8xxx_exit(void)
-{
-	platform_driver_unregister(&pm8xxx_driver);
-}
-module_exit(pm8xxx_exit);
+subsys_platform_driver(pm8xxx_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("PMIC 8xxx core driver");
diff --git a/drivers/mfd/tps65911-comparator.c b/drivers/mfd/tps65911-comparator.c
index cc8545a972bc..59ca6f475402 100644
--- a/drivers/mfd/tps65911-comparator.c
+++ b/drivers/mfd/tps65911-comparator.c
@@ -156,18 +156,7 @@ static struct platform_driver tps65911_comparator_driver = {
 	.probe = tps65911_comparator_probe,
 	.remove = tps65911_comparator_remove,
 };
-
-static int __init tps65911_comparator_init(void)
-{
-	return platform_driver_register(&tps65911_comparator_driver);
-}
-subsys_initcall(tps65911_comparator_init);
-
-static void __exit tps65911_comparator_exit(void)
-{
-	platform_driver_unregister(&tps65911_comparator_driver);
-}
-module_exit(tps65911_comparator_exit);
+subsys_platform_driver(tps65911_comparator_driver);
 
 MODULE_AUTHOR("Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>");
 MODULE_DESCRIPTION("TPS65911 comparator driver");
-- 
2.51.0

