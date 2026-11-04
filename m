Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792254;
	b=ou/xSxKhvDHa6Bxs/oeSMRHULIWI4ya9ocawXNyH7e1prJmrSLVmKyrzLerRD1gnDYVj
	 4K0sgpXUWP2Sp2zLO0ibJ46IdWyYk1IwdfVM8IFCvH3u6ANsuoja9ScIpwIms0GaoVzHA
	 +cB3GyfR0Ji6pExmsXofp8ZDw1XcUIrnKtqezHFqui5ydXi178VFZr+NHMEeN/zHBBvxu
	 J+4cX4/keSK3Bf/cvRr51PC0Fw+ID6SuYDniGX6ePSFfQ62BYjIE7ehBAMfLlD074a6w5
	 oLJzSQ0mfK3YlheWgykCfPzJb7Zb2SFUal7L+7PwMbbLAK7rtXF3ewOEG75DZkIJ7UQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792254;
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
	bh=mt8l0zW8XFCea0dURjMqRdvS5GvkDo6I4SeCYDBOdEk=;
	b=edAIjLetGMUNZanvEJe5aG1iAJWSRGqpm+L6wrXjDYlu9vLwOWzdxoEjxgo26iFm/Tiy
	 P/eXYxuGWrn+1y7ASk4e3aWPJtC9YtjxLskbW12wd6bpjTZelW0aqYN/XwhZx8hrA1qOI
	 khsIBQhrlFdWNRsmlHlJTcmTvMs5xGr6IA+PSXzVfcvOM6tckr9HKoIdSUROoZkjhSU+E
	 xKCwi3LprtWUtHGjUuSrmi3kDjsWPGOgLsVNyYRBAsRuPU4EZBYtRohEUnWncnAXoUneK
	 qViefUOQom7DFX0Jvv4IIFiB/ihWKCwtb/Iq5K2P+TjOxuaIYU+LSXMjwBFYOS4rORg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=laYbPBsU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C816A606D832;
	Wed,  4 Nov 2026 11:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C816A606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=laYbPBsU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMTddqE03L0/IPThCa4gVNkjWvhbXQ/EE77D6i6iqEJ+paNyydkJidpAp6u0e9NYv7uyL4PymYMBJdhTsDFOq+0/6FGuxugGzFU43A3HZlY9ahWTDWkD3/zcJcsaXsbFDbtMBW+Rh6drAY3MaLFO/g70PvEsXrgVe2EfeQuQuQl+/nwM0m4tPYPxGRc8n7dG4+tqi213R0sMEdAg1lgRTQYfEE14v319XRBinEArllJKvyN51d7WqFzbLhG9uMdbsI2WFvSe95HiI/xnbU3bQfOK34OjmD6zlswBu+dWkXZdPnvpydPdEj2PalwRwIDlGvKTDWnS8GoK9si1N+Ul7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mt8l0zW8XFCea0dURjMqRdvS5GvkDo6I4SeCYDBOdEk=;
 b=NQ5i9EQlzTSWnh6dxvHrThf8yIBgHsCoanJeeecEwfXANj0ABJU4cr7h3+5oXMmx1QkGpNnguPYLsgFszJNZ5ouzLvnhtFBX4eVnQRjwKScEVgw10ZTGbOZXNhBiGSWjl06bN5GTfu2w3oLMFTkMUaTgTKNE0mMzG+mwj++CcSsAiSlArH480hXcpSlThpRnmECbEx/Lb+luGCPvGBMzsVTLaQqd/uW4I51YXDCLk/+EyiWfwJKNH1rox1uN0DXj77+3fGjgvzQ54LZEQQLHqzmCoX3feO/oCjJI60Ww8N/AbjuHJcxxD2misOV3JUO3oknYGzFChakE/CJlGe43kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mt8l0zW8XFCea0dURjMqRdvS5GvkDo6I4SeCYDBOdEk=;
 b=laYbPBsUjY3IRXFOUrFrKJjkwnm1eOKCsrgS0UJ+hFrRkHbaLNU75yzNj7h24cPr3nRdVvHlpw4F0z5fTeMcWx1aO2455txApIzdymc4ly2DKKIfOhlpl6ZSHpN3Sogwz0NO3dQiDmsbe6B03qynPAyAfkvZEwTuEZg9gryvfvJO1AfieczKU49ftzNDXyFgB8Dd6lbfCxaEFSf0bRLFeyzAwS6UyS9FjOGlbCRyaLC4ytpzj5kVt9LsOPv5oc7Qm41m06piW6shqo0+bRXTLca8gQ61kf+eP5vBqi6YdXEst4rRaaA7W4GDYut6tNrF1PXxMTgeCfV4YT1T6B10Xw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:37:31 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:37:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: phy: Convert to subsys_platform_driver()
Date: Wed,  4 Nov 2026 19:34:12 +0800
Message-ID: <20261104113412.1634294-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 8bc2be24-c17a-4695-5fed-08df3a68033b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|10067099003|18002099003|3023799007|56012099006|11063799006|261009223027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	mFyZPqDm9yP4qs4DomzorVnc9rfQin9mNhWwjItShtywnxAjhxEFgU0oirb6fd4z/BfX5dWlKVC+uzYUpN8vE/ex2mDKnu6vRBoEhKutX1K7Y9TJf8ayZFNMRjoemjXBnadJtpjncd6cUEBwqtKKSxMJIa3vj1HBaL410wZ4NAmrIGfYC5nf2JeX9/B2GL6JqB0a3XguCoivYAo7Kt8zw8qXnx25hikFD6QEkiDacPOUuwxRrI6ScyzGZVqfoc3oGZqUcfn93b/jB5sP7Q/3ZYgnsFHr0MAFZ+UQTK5ocqrsRNNY17FgnD1uq0jOCP3Gpc+Yls7awZr2Z/EZFgTi04Yj/PiD3rRj69teyDHkB3EdxkeANoszgYpD7qVcnXqQ8CH9b0G7URs32OmFEfQ3zoWU1Hk2yE8/rIwToUSj9C/kLIWOmBUEYUtTTRYSfvBI7TIsKBTJDJw6J0Ebp40B3mekHoCq6K5atjG09L6UVpR0c4lrwpK7u1h1cLriWqA1S/0roL3jCYv25zaKf0NiWfpBF/WoSGgGjWT7dkRlG0Fc8nrHx/yzuvvy3zFyO4MpnJG2Eezn2bsEaA+hh/1dMTOTpAtck/I/2wfkPB3+W7JYCLLEsZJuDxzp+NvvJL2t1Jra4EexW87C05sQ2cuqkb8nP/7iK/OQfdHzBMRkfs8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(3023799007)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MQQyce+iFR9h+ePdzyCN/5LiT6678A9PPm+mNNIuBChWYStnu/k6ScNFeLIE?=
 =?us-ascii?Q?EMJ/rWNHtsvIDnAO8IoF58d6mSU9S7JaZ5FTn4GKtp/SCoNyttFBW8DQwNKX?=
 =?us-ascii?Q?ZhMgap1iHdwWrxmQW/BgPyGwzutABmz9nwET9wG3+BDVnIvccv2/0KAUe8DU?=
 =?us-ascii?Q?xpTEeP/0/WJVa1brYPJ4LlDeVlLrYr9qJBapwVqEr5iBf4WzGOelwOp12dZ+?=
 =?us-ascii?Q?CNQE9etXBCEpnurSr40rmGjPvCYME2Zr4aSgLxfyTfbhh/I2UXZbYanV0yej?=
 =?us-ascii?Q?DX+Ma8rW2o6De1RJXu2W+4wDSnccT9LJzQF0HTzhKoh+Snz0UJ4KviTTlmU4?=
 =?us-ascii?Q?vjy3rgirLsbXf+SU3mw0PM7u3n7g/FAVXb++zD2c6FlWtDENtUTXHY51XJ0M?=
 =?us-ascii?Q?DkD71U1H7rbjDrKWt/AdjNoUDzziDKuoWFZJQgksvSdl23CsooQnNUU8NAzf?=
 =?us-ascii?Q?AMQ59KwNqRsQHB6l79QWXaqYKBOzKO39kOrfORICgH/KD1C+GRZof/i3Xtqg?=
 =?us-ascii?Q?Dum7K7HhThijjjfbiXUae+1KDntkLJkW4ZMwHKb/CQCdylRmOHhoBJL9+RB0?=
 =?us-ascii?Q?S+Xz1ozGRPVP88jUSkqlxC13fe+pZopCQcQaMaXBcawuEBZkRUQwLM4X5MBN?=
 =?us-ascii?Q?8eu2TQrbohH/StiSsG2I/tRVZf8o+yaFlBN71BMblxyoHfQhuvTqbMKSaCqT?=
 =?us-ascii?Q?dM82KIpqMB8D6St7pHH+efecpf9nmaevs8YsZzQko5ArCR0Dnhrz9SRCBBWB?=
 =?us-ascii?Q?McFEiejHHHlWbyBrX2huVZtp7IBM5EV2ZNdPthDSWL4S7I8TQywd5iblHrlo?=
 =?us-ascii?Q?wzZIl/riAEwGWaYmPbO6WqA4mDMT4h1ZJGyqvCkqII5g2Ntf5yhMOcXzpUwc?=
 =?us-ascii?Q?/nQgh2ZBErgyjk7G/CqixNcRBvv14pwBS8+j//d1C9QafE7xU9bwfvC0llst?=
 =?us-ascii?Q?75yj+092sC4U5RbLvL2s264HEDNeVpF2cLZdriq375J9fPAWRCB1OKQsFT7c?=
 =?us-ascii?Q?9ZR+EO6vT8x2JDOLO9o+L09P6vvQBGR5tQUtn3K9Qn7hYZJUALzyTceuGzfp?=
 =?us-ascii?Q?8fozJpUDGoX1Og0nyrCRWsMyA09s7YhX384oyDWeRHVcivLNMw5bwasl8XyB?=
 =?us-ascii?Q?2HHHh3HCZJKlkfhZrkYmvDIu1fbZLtXPnMw5EX3Qb7x9pw2hEf6Nk7/87pfv?=
 =?us-ascii?Q?Jyp2qdRqQ87qC34TwxDqx22pJ8Ds6FbsW0MMZiVWl2oMa+5iXHV7VOpVvDRP?=
 =?us-ascii?Q?BjQs7HnP3ybV2kJOgjUIddoCj19P7eGYeYXIvugpWnWO+xZsOQkMmGFsuE96?=
 =?us-ascii?Q?GVQOAOC15aDddRqbrlyyN4mWB2DW4qljpSL3DOhPCbmYx8D0zQGqsAIv9Hfq?=
 =?us-ascii?Q?nk4Qr+TlBRrvg6n0SLtLYLveEOlD4OnczBHOYqrrDV5W/2x0t4SiYKSwYKXa?=
 =?us-ascii?Q?nZJ1z/fW9t/oPlwx9o78EFBh2LtH4IFv8ClVIrMghzeXxrKJ+Z7PmV06sg4/?=
 =?us-ascii?Q?Op6HrZSYv9nqbNefW4T7Fy1f1GLxKytEsaTQg0yVxWrgnVsEYctdcyCExy1y?=
 =?us-ascii?Q?PsBZj1RQJVYTExAiRT8T5L8qOeUTQIQ0XBh5ZDQ0NjNehkiTaTVX6IGkWRqv?=
 =?us-ascii?Q?UYWtkwRUeMXAaeWtGtvAS+qOBOHdwE0ECI4fdzBhUf0+ROlJpRIXqh+XV7FE?=
 =?us-ascii?Q?1JNqiPPE7FGcz41PBU512efn8btHJtHjW+ZQoVswnj7lkjfK8SNp1oQwV2/r?=
 =?us-ascii?Q?mxGDbJtt5YmXVd+pE+9Lz7rIwZu76ECQIebrS56Q1PRDzVAU6lyC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc2be24-c17a-4695-5fed-08df3a68033b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:37:31.6487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTN/DPgLzPZxYQUMw9B+f5EBS3RvEuJbUXb8+AzKvMyAorosoRv4e6bIbpikMXtF6zgx+TW7TJNGiCjonRVbTccRFM/0nWLcgJLHLunDoLqmOXUKyd8Tulv3xiL5uSFF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded subsys_initcall()/module_exit() platform driver
registration with subsys_platform_driver().

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/usb/phy/phy-ab8500-usb.c  | 13 +------------
 drivers/usb/phy/phy-generic.c     | 13 +------------
 drivers/usb/phy/phy-twl6030-usb.c | 13 +------------
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/phy/phy-ab8500-usb.c b/drivers/usb/phy/phy-ab8500-usb.c
index e2e06e57dced..ad568e7e3d14 100644
--- a/drivers/usb/phy/phy-ab8500-usb.c
+++ b/drivers/usb/phy/phy-ab8500-usb.c
@@ -987,18 +987,7 @@ static struct platform_driver ab8500_usb_driver = {
 		.name	= "abx5x0-usb",
 	},
 };
-
-static int __init ab8500_usb_init(void)
-{
-	return platform_driver_register(&ab8500_usb_driver);
-}
-subsys_initcall(ab8500_usb_init);
-
-static void __exit ab8500_usb_exit(void)
-{
-	platform_driver_unregister(&ab8500_usb_driver);
-}
-module_exit(ab8500_usb_exit);
+subsys_platform_driver(ab8500_usb_driver);
 
 MODULE_AUTHOR("ST-Ericsson AB");
 MODULE_DESCRIPTION("AB8500 family usb transceiver driver");
diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index a41671eda2a1..a443ddcddf87 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -328,18 +328,7 @@ static struct platform_driver usb_phy_generic_driver = {
 		.of_match_table = nop_xceiv_dt_ids,
 	},
 };
-
-static int __init usb_phy_generic_init(void)
-{
-	return platform_driver_register(&usb_phy_generic_driver);
-}
-subsys_initcall(usb_phy_generic_init);
-
-static void __exit usb_phy_generic_exit(void)
-{
-	platform_driver_unregister(&usb_phy_generic_driver);
-}
-module_exit(usb_phy_generic_exit);
+subsys_platform_driver(usb_phy_generic_driver);
 
 MODULE_ALIAS("platform:usb_phy_generic");
 MODULE_AUTHOR("Texas Instruments Inc");
diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index 8c09db750bfd..a3cdc421ef1d 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -438,18 +438,7 @@ static struct platform_driver twl6030_usb_driver = {
 		.dev_groups = twl6030_groups,
 	},
 };
-
-static int __init twl6030_usb_init(void)
-{
-	return platform_driver_register(&twl6030_usb_driver);
-}
-subsys_initcall(twl6030_usb_init);
-
-static void __exit twl6030_usb_exit(void)
-{
-	platform_driver_unregister(&twl6030_usb_driver);
-}
-module_exit(twl6030_usb_exit);
+subsys_platform_driver(twl6030_usb_driver);
 
 MODULE_ALIAS("platform:twl6030_usb");
 MODULE_AUTHOR("Hema HK <hemahk@ti.com>");
-- 
2.51.0

