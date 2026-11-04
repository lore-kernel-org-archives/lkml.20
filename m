Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792153;
	b=jm51r1HbgijyRSKjMlVFWyrlSsivhmg3oijVeyin8w8J4h4T8oYqOy1kE/xwGIQlyi5i
	 ZsZUp0HfFMNpb7K3lCYkW4H+KupZgCLqatwsCWJpu/WO0kNBUXlDDJ86GyKvyub5V7aZZ
	 V731NCQjtf5vP9lE/k1dPMwYlqbrAwisXF3rKQjA89nuc21/5J85ao2U2t/5tw3kEj9j9
	 J9x0uMoVUoE21bL9jT48cj8LlPNIkWdHZTJmxtdp95TymtFSQfP7ZH+ih+xXR85CqT0pN
	 AYk+r98aXqGxTD7qxzwpg5K+cp5L5qHPd6VdVEWYpb/z6yIIOXG6ggoDLr20/81fIJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792153;
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
	bh=l7DohzCIHf10qNuJDvDwIx1bpPJpGYgB2VxTVUnmOs8=;
	b=lHu68tltqK4ZKwuuHxmRj96QhvXq07zanggXAgZiAcVNskIwzdzQ0AO58mQTuUbH/USt
	 h7THcYf8WahWNU3y6Xa70KgYmjFMM7ipUwxOUCPsoEbS3cspx8xtOsxLUoELkFBRzrh2y
	 eSgfypBb6I682iL1xtm/U1PhmTW2OxUMEpprxsJ5iN9KbWZ06QqxjF5bCQWS175mGfcvG
	 h8WvRX5oTUf/CfNLoTQxNefURb4yzj5PewvwL76yglG/+3xnTNIzoUPQClem7YbctlSRI
	 7puA4V2m+4PL7AhPZ6kxQky8uNd72IeEi4KXaKfKI9seIgmsPWadv+TZlDYVEaqRorA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eaKt2gw9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.15
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011015.outbound.protection.outlook.com [40.107.130.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B91606A31B;
	Wed,  4 Nov 2026 11:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B91606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eaKt2gw9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0jaMzwdaJDfXfKT9OD+ABz6j/yE8+msA0Mt+IAQXVFTDYDBfClQaelGd29cohoESpTrpTLBOUTFwaV8CXjHKyMFHhRwiH5SkShrWX3r1y6yEGfQwcmwwQqBy3Tm0YG7A/mWBh9t8pEr/EmJfVzZyQEsNn3l8belR91ztwpIqRQDXyD+/CHnzWIXg2OmUoSWwXZT2M4TNa9apGeRIKLYfXGqwXugc2Cxy2209j/oRAzUcFgbua89fCWBmf9UPQs8yGX3hIvdD87LGsdeQIAK5I1oGspd6+U/XZv2T5GY7YQ1ksx3m/FStAzP104rN0Q5hiAA6DiA1AOgvb1ykBezeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7DohzCIHf10qNuJDvDwIx1bpPJpGYgB2VxTVUnmOs8=;
 b=TynuzlpWgFr6wh+rDxbLh9jOdB2L6UXafDQ2B4671mVmTvQ7YmSrxuU+3TBXWx3aOr6+ZPS8v5n9+fIiVIh2PH8cJnhPk9VgmVQ8gzzk4g1SfSJ/U7PxVzYCpl17szw1BvemAZVMlpfoZ8bqwCauUg1oCABtcu+9OjIzwAUjQkljaWal7hWspC6hVmDLWCbOSTceg/SjWwoS0XCV59YeKTTInvgb4RSeX8YFbXj8ThOn7CGrYgUGZYYBf8/y2iiAvFVdoVRO3RjI3iH0PrgdTLcRh/tPPayWZaDNgJuf3SBVMHHE3bDuK4uyOz+AOf3CfPAj9SlwrGmbCfrCrutm6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7DohzCIHf10qNuJDvDwIx1bpPJpGYgB2VxTVUnmOs8=;
 b=eaKt2gw9/pZR3T4MbA27A2Uy0Xoo7fYTlPb1yBDoIHy6Upf7GKdLEcozfsyaFoTCPcjt2Gt1erGaKiQsbOVKeMEfP5x44m1m3641lZHMQIn9Yop5DZsvRp7E2ZXhYfWjrbOmgxd0oIUgfWmDh0bDPGZV6+Nb2Aq5I7tkXt+2cfF9nmbHzloCw+91sCFrNDrl4Kjhtnr6tK5dNkicMaUSBjIrxeyLcs/J5c6URmJXFW1xuaz8ggFRht3TlwP5TT4vtS0bsLNDCqvs0I4HXDG2NTeSAfAD6T3mTZxyKOkRq394I0CbYL6hOQnrISsg8lbgo9NigZUE5/34DOeF+53thg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB10331.eurprd04.prod.outlook.com (2603:10a6:150:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:35:47 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:35:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: imx-audmux: Convert to subsys_platform_driver()
Date: Wed,  4 Nov 2026 19:32:28 +0800
Message-ID: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB10331:EE_
X-MS-Office365-Filtering-Correlation-Id: ef58942f-ee69-42d7-beb2-08df3a67c4d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|19092799006|921020|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261102123227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ASgcd4wBf666O+mzZ0qVfNehh3kVdO7hAAi2W5wVVVj/gfNdBkXKi03A1yv7znxfniAD18VxnPFX0uxgoIB9HKYBbQTD5s+fE/hCXadgGnm7X1TkY86YSvapbGilQxfedkV2WccYaTz+0oh5o6e4erbIDg17NLDbkyJ59zAeLqHvUY8pTlJy6kxKBAabghRdCnqHE3Bfx9GePFzK60Fi4XJlkQ+m7A3VmVh2r0CbxBtBjuoAKxWZ1uOMwEy71MHSOF/vfrbOduTAeJYqfbRNQta/gE1UCvwUmNL6iLoEbCzspJ7jVunXzf1aLfZx8gT0NLhAK5y8M0zXYGaTXgui9Bw0cBu5H15BfU78p8OTDKXe76O4MmS8UYFDRsjVu8kvi0l51Pu91XAkARS4GtRIitrZwTpxJRuUiL9lBZifcwbIQkBeuTtF2fFy131OpiM/PcqjG7K9Vr4N2zG2gtCuKqPe9Cf0mOxHI8/E8T23d0uMK14g574KKKg5XQQUP97KJakmptrRGZu0vYtEvRMGCVmIKBRceqqr/o6q+PEtGzWE3wdm9GkavBoWKrrPIq8lEQmGs1Tf1KYA/lrBGDWEP1RQVUOPbEp6QbWKZSdLejmvUDgYUO1nGO/aJOjs2jt6RCaNegZfRkBVm3uVR1w5V9WZXylwi5cFDnt0nLo1tjFAPA/ZUD4uGa6oQu70xoVqFuUfho3s2e3Z/bVv5zvFqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(19092799006)(921020)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261102123227099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e6xQbK3MeLdzYCvaq3p6HAW+QXwU+m1qTv1mkOBH5/OCvp4ecoW8JjGGbD/s?=
 =?us-ascii?Q?a2ZX4dPGrczSRuW8yiMf6KTuUk3dPYRZ8pl/hfkptuSlE3vlJ58H6kSHXCHX?=
 =?us-ascii?Q?nBzX6CJMzmMtu+1jVvRCX/EfYQglyIADBtuYIzkKB2hkiLiSPqhy+Sq+07XS?=
 =?us-ascii?Q?ODvKsi4YR2LsWKgg2DnDjsjZ0eup3OQOXi0VvS/pX1ZsnTyxpeM5gu6M2PFF?=
 =?us-ascii?Q?t5hrV7IcK9fO4/A1Oabn6PqPtjdw+0eMDU4zPYcZA6Dla03FP2PeqesUI6gt?=
 =?us-ascii?Q?aVJ5j2EDFvoj0zkEXQgOCbMj8Xyf0CeQSmhuKYAu2xTifDu5yzmpgaLWJLa5?=
 =?us-ascii?Q?dk9HRVXNoBNTmhIaXSKQYXtA4/SlIdNRMARH/ASqPmNBBwwmxVtQQYFBRNG3?=
 =?us-ascii?Q?Uk1MoY51W8tUOFVR4GvR168us46nCz2VpdYwqfT9p1XKLcbE/xjdhfdd9E2P?=
 =?us-ascii?Q?S3mO3nsO16pwJfHUK39mI/pwbHYerg5qG6guMGfZLUdd5PsKmdqn1TvRez65?=
 =?us-ascii?Q?fojl/cUMQExUZE/yohGIrdBX9CeAC1/otIC4msN/D8vqGYFUqfSJcs4xpMQ+?=
 =?us-ascii?Q?JD8BRoIQ5R+rzidyPsHI53hVtGywHXtwu/UGLcZGzRh+C1kLQ47Qj3dUQVrL?=
 =?us-ascii?Q?8d8empQxYzh4VCG7FhNf52FWqP+W4wDUjz3czOJn6JQ9m4hh3LHtNdkwV46i?=
 =?us-ascii?Q?XYvFXzdt7/fw1HCIBrD99bL4estB75jemGa6iXyRHHQF3ZzVasfNFpsLNKmD?=
 =?us-ascii?Q?sqLI6uLCkOfVLaCAPVIzL1TV56kBHZkYtxoq2GiiPoLVKyKVliAe1EqIBIB3?=
 =?us-ascii?Q?CZuRqSoZSWEmTg3eRCaXJa5P59fJ06AOJqDwbDtJJoByw2+HTCyenKKVqWOQ?=
 =?us-ascii?Q?TUD08N3ND6bhf9+qz/Ky3m+joL9HY64MAGVOFDXrx3xM9fMLZ1kO0SyOboaE?=
 =?us-ascii?Q?XgwTashCHvjikm83WfCU9/tGEkkYVZeDyEe6toADhfB61FoRyx/HDcm+Legv?=
 =?us-ascii?Q?mfCWxV0WZYlxgik5V9Qcp1JM1CYFSa29pnETfyLjy2hVHaqywPwSneNEzy6C?=
 =?us-ascii?Q?Ns/vzF34Yx7jNvUlfdY+CpBs1HtArB00NaHIatcGZWumqHjN+VWUtr59FVh1?=
 =?us-ascii?Q?C3hckbHQ4nEzd8Fs5AgkPkS4h2dvOlfXW7MYh0y7Bx2CEkGMkDhmudlqd/g+?=
 =?us-ascii?Q?CWMleIfIjk4pTws4ffWSaOO9zPMRQ8QFl1RASjbePy4SVHLvD/UA9Yl1UB9x?=
 =?us-ascii?Q?svoPoaMNgsR79I0qLtjAMWanrEdkWjGEatDet9LYTmvwlsULeJAPQtqEOW2T?=
 =?us-ascii?Q?he7Q5cnNhM7eFAO2mHvgDHDs4qMt7GA5uayPYeIQcoWLTY9+JdRfOB6TNWlz?=
 =?us-ascii?Q?vo8z+MjU4oJfWs4DgIm1pWqG6fHZYtAuNhRU1hvKHfgkilLLbOKvYBdb6iOy?=
 =?us-ascii?Q?GNMLTS+gb1UmKFIgHXcMFhkNi/4BZM0afeq/j3cBv1jROetcmrVhbr357HZq?=
 =?us-ascii?Q?3RuXRzfkarpnNQjl3xvosv1tPqL69JDcrNw676jq1I0j6kLwbn280LXLfclS?=
 =?us-ascii?Q?U0xWMpkLROxmsETlrlDrZ5LJwZ5qT+SEuSciiDTo3OK/c9nbWlSFfT+DsJMT?=
 =?us-ascii?Q?8hE07176+UwSwCig5j0/9BHORE7n/5iarIdiTEiO833J6NF5u6XOIKKNpzJ1?=
 =?us-ascii?Q?Yr7q4Z7Ql4Rdxf2CzXI7EsY8QXlnw9Hrf/zH/vV+m5kL52Y0SGkfLCUEeb+g?=
 =?us-ascii?Q?eZIntUQ116FlBXQTPORh6ED+nVLex0BhFAhn/3oZXUxandmASDLH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef58942f-ee69-42d7-beb2-08df3a67c4d9
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:35:47.0670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLnsZ4kgmz6Yle4spaJ5c9StxwZUPS+GYHMdRsFYnZEdx2itoyEkE3bACUgQZClaVAJGHwpHlb4UhM87kcfAk6NURx+3TLzZSMhN152c88fDksQjj/xF/nwE/T7jYf8T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10331

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded subsys_initcall()/module_exit() platform driver
registration with subsys_platform_driver().

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/fsl/imx-audmux.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index f8335a04595a..d46f43ab66cf 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -361,18 +361,7 @@ static struct platform_driver imx_audmux_driver = {
 		.of_match_table = imx_audmux_dt_ids,
 	}
 };
-
-static int __init imx_audmux_init(void)
-{
-	return platform_driver_register(&imx_audmux_driver);
-}
-subsys_initcall(imx_audmux_init);
-
-static void __exit imx_audmux_exit(void)
-{
-	platform_driver_unregister(&imx_audmux_driver);
-}
-module_exit(imx_audmux_exit);
+subsys_platform_driver(imx_audmux_driver);
 
 MODULE_DESCRIPTION("Freescale i.MX AUDMUX driver");
 MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
-- 
2.51.0

