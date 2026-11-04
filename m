Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792219;
	b=xbU+j9BG/bT0oUkUil4Eq8ZUtf1/1PDsZ4MMCrwZks6G80B8fVTm7DRUd9Pm/Ucufqnx
	 o78ALpv07zyNDYR1jFjQ92E0aKjFyuF4wkZlTvF5ZtRGaNFt/JZ8Fe0bwqzOwcJTGvY9t
	 mXBXqqMMzYGpc3lAY3JqXEM65sGTtaZo/bowAMZ15YWksmRON3yDd2vg5+/0lP73YU0BA
	 v7hxGYsU1WBSV4Q5MQWzc6oXaGlErl1U3/Ulm9laHGkRB/8am/FMMw6V2YSDRtxRLViBy
	 8J4qFHQAE5oO8HGXp6uFNr1/lA/PuEVZbQHI3Xk7DCpB56XLRcpMdTU0B7lDjEts/ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792219;
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
	bh=MKDPZekyBfZWvRaixCTf3uttdBoVLMNFPUSP/+qOQSw=;
	b=V/vV+EJ8SAYlgIeI2cN9U0ijjbexfoTMtNsPZgpKacDLxhT0iC7aL4hbsYTiNzAcWGdQ
	 9KPrwiz04VBOyu+xO50dl2Ve6UqoSLCzBpX3aQykvttP9Ws8hFRkhJgaObKZwPXP2MoGv
	 0BuA6FR9ZOavZbnksdrWV5ZhWzutfa6sL9xrCA3+umBb7QhOMXfYbH6MoOH+4/p87/tN+
	 QZ5SZz4H/SYtQih1jey5xT5WW/qQy9oN/w0SUwMFRARRYbrU/wwNEObGJ6oMqBXhDpEY0
	 eq53cK7WEZA+ozT/GFOGQKXpytyJ4k589IMQjooQ4kosuGQfXNVCOTdJrSWm7LSak6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wqfFm7Q4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2996E606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2996E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wqfFm7Q4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYW2FbFX6wuUE9Tpqp5wkXaRFx0QQag/M30EIDIjafbqOonVkikVJA3SC/A9F+A31IbvfJx5anEs8OAh+p3A2g94C3VGf2Rq+XdhongLzcMUmA8Qdy4EYztdkkr9deXbZ7iKiMVPKKXhShQ0tYFFwrY3oebd0mj97C2guDCOWya/Vp9DPPTjG7yjB15dxx3Z32VHBdPLroKe1z/d8piSNJJfpm54QMQ02Ztk/lwsaFmUB/B3GBPpFdttRAqclPaf+vHMloJ6+it+v1Qbecre2B+pp8JefHqy8hOGyZEaw9I1ygsN74pGgE6158nUQK/5DRGl7Qycok5uaPaWIXMKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKDPZekyBfZWvRaixCTf3uttdBoVLMNFPUSP/+qOQSw=;
 b=fydJrfXDlcn8+rtzpfCVp3OwD9OCK8YkSJyP1k1sTBs+qQAlOgN/R1gLJQU6pPhHsGSObQM4zDm9Zsv7BGb3XZqhlkd90Z7SGQmgm0B7thRKf7SNkdCOsVX35aWOtqILBZm9Y5aKbPMslDvoY+0blKRErBl6ExeGwSwhhZvoSOF9LsSaPBdH8VYDCqGofYWe7exR2xvYgJKc+Pnyp2wcO/71zuI6Eusz57wWSv2/0t+MzhENF+yGKwrVZVkU1KELgBc9ohkKvxOJtXn1r+2ftscfLN4tPtW7SjqC81+4HmJVqIee+6qf6nQGGfR3mLGwpm7Cpp/80i0gSy4E9bXjvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKDPZekyBfZWvRaixCTf3uttdBoVLMNFPUSP/+qOQSw=;
 b=wqfFm7Q4mCpuuva+FlewOyXMve4PJieJNnf5KMbVOcZb8Dsslki6pduuj6gfAK+nO+ZdE+3KFPxbHqm9Oev7EqNt2PuTlIHMVk6A2ApbrkBwW//LLiQKG2m1goKeCU0CGS2tk8fjiY5poN+TFaXhMvjVWLKPOqCCmUXdx89vjq+Nc5BQ6FSQiiPN87eWooKNRzn/i+w+yeGb/jTzsThiy/S34744nYlYooKxn2CLv3UDnpGvotMW1xC7xGr7NMfJlhIqJ6XHXBAxygKn2u/HnOeCUfc1SLqsNH0z/3nnJbnCQLgiyKWYn3FhOSg3VHkFh8zGqCpNwFV0R0lPNsg8Ag==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:36:49 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:36:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] clocksource: Convert to subsys_platform_driver()
Date: Wed,  4 Nov 2026 19:32:55 +0800
Message-ID: <20261104113255.1634082-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: b5bebb2e-2349-4686-4408-08df3a67d4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|10067099003|18002099003|56012099006|11063799006|261009223027099003|261022075727099003|261021123027099003|261022115727099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	zdZmIPZbOxK1x38ySimH+JnQaAF0var9FggBqW2q0D5jWE2Umv8FwSsIhRsST4SoYWixZEiv5KaPJ0CgoacpyaIsyI1eBtyk4xE1x2wWyxgP1U54eZVUFJZXtu0vRw9X8NFWvwlAAlFyKCM6//4GsCvlT4SbNMsWRI2fayB/r1ZpWu2sgcFTDs3c1T0jO3DZBDLWrG+VYiDENdZopkIJX+ndD/5Tv+ODEAnYJmyCoRyaJspEsBs1l588yRFJDlqinfs5Bn3P++LNrLxqy3pH95Ceh+Ta0mOH13yaSG3VlWtSVFh/gdRyp4tvBjCl86q5yQ8eVDfJ17NsesYAaqcBEXB6OcbmQDHr2VUIJoU9QcT7OyVvvmVZ2FyL0m4s0D9AEXEAMj5X39ayRi7LoqkKyQhAHZ/Bl3kkGFNyMiuwsHX2KqFRCOWhUqarp2f5+vxEC3+QbENES9v3mJwmfVmOq6/ukcQU1KrxAJNTa5fNlLT9y4wbGkK2+ZXrKjdghxR9AchLqwQzb+I3iQ0OU+/KijqwzrTWDmKYEBpCcEb0IZcJmlxrue26P3n2TyGB8hDUcD+4so23AlOzFKuAEH3TB6R6PBfmk6w+MVG3CXkUBrd2V43MWyRSDoHyFmFG9swIICychQG9rRQ7lG5cwrxC8sTFe1lLAHOPxYLqqpXMHis=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261021123027099003)(261022115727099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kBHRXI9M28STgynW3lrWwNxiBY1QUKk/ARe79mmopBQhfG/XKS+7q0nyV9aT?=
 =?us-ascii?Q?+MT96kS+Pil1fQrHbzjj1UjOXYxGuu8gEhi7uEtIcqU9vE/fOtGWMfO49T1e?=
 =?us-ascii?Q?vLuMZPv/Et+F09B36BWRuP5p8Ln3uDCRgc/JIwDt4EmWK9IIUSbv8PtSlXDA?=
 =?us-ascii?Q?vjWh0B/zFwLKxZV4tfTuBl+gDPPhWiTCHmQRaqS4epJBXPNKHwdqpHQ13sqp?=
 =?us-ascii?Q?6DhNtpb+snEWrNYAjNA6hq/7oibCzeSFK0QR8jkTqAs/St9Q2U/O4Ly5z00J?=
 =?us-ascii?Q?UzrozP1Vb6FvVvHlA8ykBSao2l1Vhkdy33ArrTgQOR4Bw+hW59tc6rfYXbwm?=
 =?us-ascii?Q?pjkSguKj+Jsc6pKnBQU1d8hz/GVOWdyYj3bMPxZOtBeKy7DH+U5xVB++RM7C?=
 =?us-ascii?Q?ga565FKIU8J7zFVNJFwQwUH8ERUex+klrMd13NbccWLTqYyeBVPZXbVFuYlZ?=
 =?us-ascii?Q?esFZs0oIDZjU7DXVTdbGb8vCPYLig/SX+hwH1wlg1dugzwGr6pXY986PK9ZQ?=
 =?us-ascii?Q?QBSSJ19KOWW+mH0RlQvvmFsLmLeJgnuW0emLp4MA+VfzUXuNZTd5aCTGRQb4?=
 =?us-ascii?Q?6FlbZpp8NS9d7Be3UJy1p2tEByVtwQgwhwASjvpnSVRrn8EM+SgaiwDFk1KX?=
 =?us-ascii?Q?rEqlHVFs6ocbjERPkiJaX8FNo4bKEHJhX56CydndNU+A31DQsFsYHN2xGLsM?=
 =?us-ascii?Q?RCg5LXYlx9EXc+eFJO7UGavx5GKyqc4hsemKrxGuGwKdqB0smT2CwPbw7+rI?=
 =?us-ascii?Q?mJEbwALytOPS9HnpjI7IVmlovr/jWUpZ8eNGrQPbDZQZU22Xf/+1ZvGc5KQ5?=
 =?us-ascii?Q?Lha+YNsL0gljnpLQ7l0n+FvMLO0GPq2OgJ3IV8IwC3R1tHhwuxuio6NkGqXW?=
 =?us-ascii?Q?Exk6R5539VVMZrTNRIh3tYeIpS5TzzMIG5VrHK3B9Bd/ced+4eC1l3yDHOYs?=
 =?us-ascii?Q?VViSzJ5WPGOUKfw6V083UQacfecoPMEGWBi+qkjnbxujxNCxq6Ugv4ggzEqv?=
 =?us-ascii?Q?slgeUTnnRNnJriMBf94f71n4HBEPwv+LeMt3MSecjKej56cd1ecbD1R6+s0z?=
 =?us-ascii?Q?Cp+zIc9wHXlj4Bz1RFxOoP/ubMHZYR53IZ8EoGBvT6KbF9wq1meCz//IbERE?=
 =?us-ascii?Q?eAxanKlaUzwA69RGcuAOplG8YyCwkJvtQu4YS3ZKOWczq5xKeN7+Ccskpusr?=
 =?us-ascii?Q?gdRmjyVZCuErR+szL8xXy0kwMN3Nr9La9Kz9qDg6BuHuMfmpUqBycJcRTXAI?=
 =?us-ascii?Q?3JtPyy2+mLvmmfi1EvSn/4qj3kpl3k/HZ+cMTp/EWQC/2Hxk0iYgQVYJ84fS?=
 =?us-ascii?Q?HrivqPY7d8sb/ZODXT0LotomHL6TnaREgQExu91AYUvpqI2wxrTIVm9mGwfF?=
 =?us-ascii?Q?5btLSzAofar/YRESAq1Oo+3th06Rt52vuyV6t1Vic7PxOt0nYmT6HnZR+m7d?=
 =?us-ascii?Q?JEz58O3H/Mn2pUxmOZrslEj3yCuh2/rvVcaxVsd714ZMk9YqpWpfy2psw747?=
 =?us-ascii?Q?sUY++cyXiEdK5HuesTeweGgDL2aDiYilJMp0hjuyz6/VEACuxHRFak5WVR/7?=
 =?us-ascii?Q?yJj7SRgx5vZZXULc0fuaPytwazGM4GvLEF8zqL3xTJG212+0UWMCU8JCIBRM?=
 =?us-ascii?Q?88HjfDrBEO3kHMxRwaJwbiurq+qbdEKUam4uGIEV88vNowpCQFOtUZNRrh18?=
 =?us-ascii?Q?Ce1xkU3wjxFpTl6Vn3/m2cuxsc6ZhK/SnNvwXlLJe1K+aEK2m7otw3V7yzp/?=
 =?us-ascii?Q?1MGj0VToxFrSU2kAclzSPJlA+/wfENRPDh96FzCUQzoxaaiS9xjO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bebb2e-2349-4686-4408-08df3a67d4a5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:36:13.6217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/kmgEVvPKKw4Yga7URkFx9HodeSGtiGcp0mHp9J7QJUMbL0hoIvNUUdThfoq3A4iELo5nsI331qA1SZfY0ywlN6UUfiI+ulTTcDa1LDlZyzcpKVYKtAr1cn+6an4/lO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded subsys_initcall()/module_exit() platform driver
registration with subsys_platform_driver().

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clocksource/em_sti.c  | 13 +------------
 drivers/clocksource/sh_cmt.c  | 13 +------------
 drivers/clocksource/sh_mtu2.c | 13 +------------
 drivers/clocksource/sh_tmu.c  | 13 +------------
 4 files changed, 4 insertions(+), 48 deletions(-)

diff --git a/drivers/clocksource/em_sti.c b/drivers/clocksource/em_sti.c
index 73a3357d173d..b35c32fbc539 100644
--- a/drivers/clocksource/em_sti.c
+++ b/drivers/clocksource/em_sti.c
@@ -346,18 +346,7 @@ static struct platform_driver em_sti_device_driver = {
 	}
 };
 
-static int __init em_sti_init(void)
-{
-	return platform_driver_register(&em_sti_device_driver);
-}
-
-static void __exit em_sti_exit(void)
-{
-	platform_driver_unregister(&em_sti_device_driver);
-}
-
-subsys_initcall(em_sti_init);
-module_exit(em_sti_exit);
+subsys_platform_driver(em_sti_device_driver);
 
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("Renesas Emma Mobile STI Timer Driver");
diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 7977507f6ce3..b7170c6b733f 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -1168,22 +1168,11 @@ static struct platform_driver sh_cmt_device_driver = {
 	.id_table	= sh_cmt_id_table,
 };
 
-static int __init sh_cmt_init(void)
-{
-	return platform_driver_register(&sh_cmt_device_driver);
-}
-
-static void __exit sh_cmt_exit(void)
-{
-	platform_driver_unregister(&sh_cmt_device_driver);
-}
-
 #ifdef CONFIG_SUPERH
 sh_early_platform_init("earlytimer", &sh_cmt_device_driver);
 #endif
 
-subsys_initcall(sh_cmt_init);
-module_exit(sh_cmt_exit);
+subsys_platform_driver(sh_cmt_device_driver);
 
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("SuperH CMT Timer Driver");
diff --git a/drivers/clocksource/sh_mtu2.c b/drivers/clocksource/sh_mtu2.c
index 3aca86d6a2d4..c44338d8e938 100644
--- a/drivers/clocksource/sh_mtu2.c
+++ b/drivers/clocksource/sh_mtu2.c
@@ -505,22 +505,11 @@ static struct platform_driver sh_mtu2_device_driver = {
 	.id_table	= sh_mtu2_id_table,
 };
 
-static int __init sh_mtu2_init(void)
-{
-	return platform_driver_register(&sh_mtu2_device_driver);
-}
-
-static void __exit sh_mtu2_exit(void)
-{
-	platform_driver_unregister(&sh_mtu2_device_driver);
-}
-
 #ifdef CONFIG_SUPERH
 sh_early_platform_init("earlytimer", &sh_mtu2_device_driver);
 #endif
 
-subsys_initcall(sh_mtu2_init);
-module_exit(sh_mtu2_exit);
+subsys_platform_driver(sh_mtu2_device_driver);
 
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("SuperH MTU2 Timer Driver");
diff --git a/drivers/clocksource/sh_tmu.c b/drivers/clocksource/sh_tmu.c
index 8b3cfa6727bd..b4a32961aa24 100644
--- a/drivers/clocksource/sh_tmu.c
+++ b/drivers/clocksource/sh_tmu.c
@@ -636,22 +636,11 @@ static struct platform_driver sh_tmu_device_driver = {
 	.id_table	= sh_tmu_id_table,
 };
 
-static int __init sh_tmu_init(void)
-{
-	return platform_driver_register(&sh_tmu_device_driver);
-}
-
-static void __exit sh_tmu_exit(void)
-{
-	platform_driver_unregister(&sh_tmu_device_driver);
-}
-
 #ifdef CONFIG_SUPERH
 sh_early_platform_init("earlytimer", &sh_tmu_device_driver);
 #endif
 
-subsys_initcall(sh_tmu_init);
-module_exit(sh_tmu_exit);
+subsys_platform_driver(sh_tmu_device_driver);
 
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("SuperH TMU Timer Driver");
-- 
2.51.0

