Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792237;
	b=PDmscEoJuqieyU4TknR8IK4oioS+5cOeYPVGvxDhFSJj/KbpVAFQ8y8D0aq2KhNSQbeG
	 gdKMb0Lg6mQkI/fcecPnvdOnVDf1qtE2gG1145o13p5uNcJBXUVmFF+c96oigDXTQ0rZR
	 PzDMlmk/6LKxkeEE82V7TYgVKN0H60kE1BHtrBHkq/AHr3ctgp1149Gf3EptoGkxf3Kao
	 mU77Il/6Zg9jp9ZVvbHPVZCx5hgsP7Iv6K/oCSXsn+oyqSfGZV/Er289NshKWmCF4xU0x
	 wo5jtVDeiEUJZhs5F9i1DFg6A6bp7el3SbmN3N02cQO6SbfuqcQy0lsCdZ7z9WqLqxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792237;
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
	bh=ka/+X5eTOIlg66kAxQJM0dG4osgQd7MO6LFRAr7+Xiw=;
	b=a5z4BRzBX9UbuGSCXyV0XRK0BlSGHmQ4gKvzEvxv/I/j3JGUUkfp5TUNrJ+6qxSJi78v
	 s/FYBdUof9tyX1gs9SrBUqhcKA9g68ttqpH954xbqLK67QXEtNXrUWaKEswKaXDZ2eMXc
	 JWhDe/I2jZzlHT0GHKAZfzfjSgabScgQTuhGs2nqhz1dc2lzWf66TcQ1H1PXqW4iQjK7G
	 w+5VKFoAmCZtZe/Qjr9MQdCmF3D/6EtxIWWr74qBoy6ZeNf3FEH2wlG5kHRNrhotjhx0m
	 Iuw5q+DvnZWSOo48EAg/Qrt/4YqkWFulfQCxcZ1FRfTzW0toiMJbdQ/fmZteAxQyqYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kpC4oIu2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2DC606D817
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B2DC606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kpC4oIu2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/LJOZI0jQXWvCFLTDb0XZdQoDRS4KIcBMAc68PmThU8/7jE9kEEY75hBvX6YJSLNnGN7gT2+GB+fFeonv+ILX2UBCHgPspfA3mJo7hRP90B2775QpcJ0c/vbdglh/mRUwlKhQlPEoXJadQqeAgOqwLijAFh4WZXG9+T/JAgsjMVN5Koqj1344hBBvaQ1aUBfr5yhAdoks0HQsi9H9JUU7Adkt1LWv59AieyYfBRqqKLOZx5pDPPTiAqEOFgStYdGN2WVze2H6bI8VGmnZE2NOl8dSd3UJobWqFKvSfvTqGcxrXWsiyeafERSjEojHMgQRCbE825wqWJkJZGsFFqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ka/+X5eTOIlg66kAxQJM0dG4osgQd7MO6LFRAr7+Xiw=;
 b=J9CU8Ioc7wXwCZRvKbTtjT1FBy0dnpIWckfZxHntBlUQ88KNmcjBAYglU3brEukjKrtw1qE4vImP2hPUaqYjvmmqbs1lszw/Q+Zzt8dwoFH55v7R/rvmQDHERf36Mmq7sxrVZGOHLsC7hXkS9sOHmqpX/3lX9UHeEkbyOFSdzD+VgiJsQX2Wmna8MlTAxzrvNl8qDcg4APzTYv18I5r3uopLVr9gUzfDDPeqK3TZlQhQ9khstiFZcQk+M9b+oB0vDuWtDEeuVLI6T2WqmyAVk8hGgMIsjmsmVLNx642bO+nqA3lHW7tfooCBh1xgrx86o3wd0oiXFGHvRPbYUGDBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka/+X5eTOIlg66kAxQJM0dG4osgQd7MO6LFRAr7+Xiw=;
 b=kpC4oIu2+a905zuCX8R28KHHGnCPahXRRu4/jJ1rqB6ULI7b3nZiUC2AFspYP16iWK0E+dT5C/tkDZWKT0foZLHjbHVJQxsO7D7/tjDxcHM5C6fg5pXDJGQ3RU39t0cjEWUC33IpftIioORmkseDiJqIv/989PmpOVQIuuepTqjxazk01rb17G1ze5Ukp/MoidJGz+CAZj3ea1bMmCjwHDcR9gc3MioXb+tw3Doi/xrwcMm7VOxj4dsggrNDyQnW/U6CBERKWgU0TJpexudPtH9QZUHxPoTJxqYyc/ufdy6FNvoBorGZ1iShG3oL2xjyxI8jxZ/GVbik/+ElHpHf8Q==
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
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: ti: Convert to subsys_platform_driver()
Date: Wed,  4 Nov 2026 19:33:37 +0800
Message-ID: <20261104113337.1634199-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ac466916-90de-42d4-d4f2-08df3a67ed27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|10067099003|18002099003|3023799007|56012099006|261022113327099003|11063799006|261009223027099003|261022075727099003|261026121527099003|261021123027099003|261021121427099003|260925022911599003|260925021311599003|260925021911599003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	lAurfrJRUlaymC1AUxo6Li32+pvL0TTtC812KW7aTx4QsRJTJVv5oQkE1/0zQtIrZVvj0p0z+R4c73+ow9hjVMmvskrTlp2Vu9RZ+6L2aOiZNuVcES2mkK8pgbUfdRvcFUTTvlYA4neACpC8+nwip/cgrnNZj6MG7/sGMM3Gk5bFUtPIVDovcFwYRZrw+HuEnIk+YAsfS99NEi1RVWqwZ1S8K0VuXqK/KtYd5GLaFl5GKdGZe03gLtE84zx6V4Cj6lL7t7v1jrx1I0igTISAWuoV42ktZMGQ9xFYZtzglF5pWHX8ZN5qezVHtkm4xgIs+g6mKf2FI6iFPvAqyp3+JkO7QjOnzPHFdSlRYR0mPEJszKBj0jj6bSgfMfsMnaV9L1wJlWq6p8KYM3oK+VWHnjeZbVMYmNADPJqxgFcv75/2/pfHVZKUSi5bdMcbOxdtKThR65nhxph9/SQdAxlkD4jxqYDRVGXKq/2+KE4LbbtfiUNQnLWYY0eWpy4NUlVTiZ3GybSHMB2fHBOwIKmfdLo5lRZnpxaYrrFv4Xj6O5Tudc+7JfyAyjcjp7UtFLrbIYu/3qAD9vaobYe2HaQwq5P6fWLmavhx1YQ2xaW+ywudfK9XoK2cXHcaNWr6s2RneHMFlV9/fmLQMK1SCLJYA92YY8E0xMyf3G/bcsnrHXc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(3023799007)(56012099006)(261022113327099003)(11063799006)(261009223027099003)(261022075727099003)(261026121527099003)(261021123027099003)(261021121427099003)(260925022911599003)(260925021311599003)(260925021911599003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?epIftu674jKzbQoxO/kOgqUIYH6rGudsvNgZW9wMzjjliYbM9xfCrPXtw2Qz?=
 =?us-ascii?Q?yzc/ZQrKI7kLP/M/wGNso2rgyOzWvK1htMQx+BiucHLChVAE1b0naQ1UhGll?=
 =?us-ascii?Q?5K1+HjmxE5VVy+Vj6ptgO/smV2l5NUoVC+iaSEXaQmT8i5oEJJ3sRV3/NXET?=
 =?us-ascii?Q?eGjzoFMnMf8PQ6DFQ20cdbshCfz5GRZ2eBQhrpICXZvlTD26GxdCIoXcU0vA?=
 =?us-ascii?Q?SaUYS/OVrjeimPWrZOl+ptik63G4Wk9Ooz7DDHjlgLI4BF04GAA9/jTlCIuB?=
 =?us-ascii?Q?tVSTOku20RnN8ZYAVd6PqOLd65SyRLyNiXdtPTAfSBW0QKijp1WkmML/Unfd?=
 =?us-ascii?Q?Hf1H2f0d/FfX9oMEYiC8owNByeI8r5c38qac18XljEElbKnYXHYJYginhxJ6?=
 =?us-ascii?Q?vgFmNOIrJAKO4H/vK2jTBl5F6wskBXOvzx8EpKAKogp6+1zvCG6Npt0LRfyZ?=
 =?us-ascii?Q?JjZJZgIPmMru5xbNBiT+ND+Dd3G1eNU3DsmJKbxNeC8UG2PAKJvpnDQ4othj?=
 =?us-ascii?Q?9rMGP8AWQ8VlrMt6fNOr/OF8eGLoKLGR1XjjTfPM+hTyCZfQkg8R3fBzJ6Do?=
 =?us-ascii?Q?Tu6QkSgKykidQ11vao1G+bNhd6OFHshsHigkt95DCfWPWlpYqVytGy9qM4ln?=
 =?us-ascii?Q?keEpFTzOuCxxR2+oAFxJiW5SO0ARYypOXfLpMlccK/MM5PKjhQijvfJGA4FQ?=
 =?us-ascii?Q?aDYPWx5mL5Ksh8AC26Ano9bhcMAqQpMjbS8zvUi9fCfR144n0noEVp+77np1?=
 =?us-ascii?Q?jP3a6DTNeG5KaddmzDDh7hy6nzi9vquuPxhNpKBISQjvuL+XqKcoy38iRjSs?=
 =?us-ascii?Q?BhFVrDSc5XWoEp+kzQe0OOPHO5W35HsdO7Vq0z8xmsUrmK+nL6oPgg2bY0TZ?=
 =?us-ascii?Q?Bxtt9aIBJm4QKK7Xyvg//mVleegtvA0tF2fq9tSBsLhvQZygARSHSJPwn7KZ?=
 =?us-ascii?Q?faDpGgFkxRTR7SbhCQRDHTrRJeZMpgX44Mi4fyR94uPidrWh1bA9IBMog6QI?=
 =?us-ascii?Q?ZCEBEbhCRv6E4kaSRoVsuvghRaW7af4tEk8ZHMQ4WC/OvNEcY9thAy9G+3aE?=
 =?us-ascii?Q?Rbb7a9FSpZXedz6UvtBehuLLdMRipFF3OIfX/8qUTKOmBS8nquoP/pt/mO8A?=
 =?us-ascii?Q?LeAI3sJ8PC7oDKB5hQ0haA0CMy3qKIHysoDNECb052YCww6Bfl7n7K1hJGNb?=
 =?us-ascii?Q?+0W9r++ekoBCGV0J4rs62JnC3uXR5NJbc5wQr+DzykoDZBBHKMcimEp8Bp/8?=
 =?us-ascii?Q?ic1OPtywr+3hAq2VEhLewrAFHofbk/E7aEfa3qIlKZ4vvdw0EAwBYJBXX3N5?=
 =?us-ascii?Q?2wBqev+mzM5euaQABYmynaJlGqtewxHu+qtE8w+FlqEh7xyBVnkOGqtwJEFk?=
 =?us-ascii?Q?9BBIPlllLefEEdvK8BtCspjtmg6r2d6aa8gK2O2+Lbb4/mihPpwc9fXtOae3?=
 =?us-ascii?Q?H+XziAzpnqfrXcf/FTk3y1gQYzXqouLGfoAP1Knm/FJ3vm/1FSD2d38bVm/1?=
 =?us-ascii?Q?/t5XGAbUTA1fQ3ewPyuh8Bz6KNOQfyPwnQO6Vu/u/p4ktgt1wAknTGHwte4c?=
 =?us-ascii?Q?MJQdIlQdwCgc4oe2pXbOTeeVISMb+iUdhleepzH5ZrXnUmPuxwjTkUkImPks?=
 =?us-ascii?Q?8pmPZZi1wUGPCNqcBuiyrC3sPwZ7JO6GPcvEi8j2YKCffCaThgzkpR1xlt5T?=
 =?us-ascii?Q?Cemg4UL9MwLfu4r8jcZgXXtOdWLT/H1A8IwDxDsTzRlj12pMxiklCWLMBJxs?=
 =?us-ascii?Q?avuWO3/NbCCOhpfNkp+f4hPuRDzAVEu5L8M1Cu5pI16zdssxvTNA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac466916-90de-42d4-d4f2-08df3a67ed27
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:36:54.5810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mte+VPNAyomb8yFZSu8AG9JfQc25kUlG/3aoTukQPgICH2h8I//ZxLXO5w53utJZKF+gHD+/fUrbnb444Qb+kgPUCbd5qWJnz4Er8znj0DgpmMfJ2kgfzUgFrr6oEqgs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded subsys_initcall()/module_exit() platform driver
registration with subsys_platform_driver().

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/phy/ti/phy-omap-control.c | 13 +------------
 drivers/phy/ti/phy-twl4030-usb.c  | 13 +------------
 2 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/ti/phy-omap-control.c b/drivers/phy/ti/phy-omap-control.c
index 4968434312f8..802ffe1ee6b5 100644
--- a/drivers/phy/ti/phy-omap-control.c
+++ b/drivers/phy/ti/phy-omap-control.c
@@ -321,18 +321,7 @@ static struct platform_driver omap_control_phy_driver = {
 		.of_match_table = omap_control_phy_id_table,
 	},
 };
-
-static int __init omap_control_phy_init(void)
-{
-	return platform_driver_register(&omap_control_phy_driver);
-}
-subsys_initcall(omap_control_phy_init);
-
-static void __exit omap_control_phy_exit(void)
-{
-	platform_driver_unregister(&omap_control_phy_driver);
-}
-module_exit(omap_control_phy_exit);
+subsys_platform_driver(omap_control_phy_driver);
 
 MODULE_AUTHOR("Texas Instruments Inc.");
 MODULE_DESCRIPTION("OMAP Control Module PHY Driver");
diff --git a/drivers/phy/ti/phy-twl4030-usb.c b/drivers/phy/ti/phy-twl4030-usb.c
index a26aec3ab29e..75977bf26f90 100644
--- a/drivers/phy/ti/phy-twl4030-usb.c
+++ b/drivers/phy/ti/phy-twl4030-usb.c
@@ -840,18 +840,7 @@ static struct platform_driver twl4030_usb_driver = {
 		.of_match_table = of_match_ptr(twl4030_usb_id_table),
 	},
 };
-
-static int __init twl4030_usb_init(void)
-{
-	return platform_driver_register(&twl4030_usb_driver);
-}
-subsys_initcall(twl4030_usb_init);
-
-static void __exit twl4030_usb_exit(void)
-{
-	platform_driver_unregister(&twl4030_usb_driver);
-}
-module_exit(twl4030_usb_exit);
+subsys_platform_driver(twl4030_usb_driver);
 
 MODULE_ALIAS("platform:twl4030_usb");
 MODULE_AUTHOR("Texas Instruments, Inc, Nokia Corporation");
-- 
2.51.0

