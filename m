Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011071.outbound.protection.outlook.com [40.107.130.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB2649B21E;
	Mon, 19 Oct 2026 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399513; cv=fail; b=fRVCNYrocyjDeTQXF+g5kBAhKe+6yqojOmPwsPWwzmEm2MQGJvr0cNxLDetwMlAeIRciy/2kENWQ7Btnx2MO8plO12Yq59LZruyDrQBlgITMd5aT56GJdnxGjCQB67+7LI6gFmcldPlnVN2z6WH0Dpy0phb2onIIJox9tKT9+PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399513; c=relaxed/simple;
	bh=sE3Qwxfjfe8y3nh/Dvo+5n7OPBUlevQI7ENTw+D0npY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OI7+Nc5+YchQnlLVlsZFbmMGJHk392u1pfyluvEH9VcB0hiZKB6i8rcM8cvBkzvWnhySIgnhMVSLGHkpZPavk3RkpslIfCxTbsoj5dUMpMOE57T/RfLx1Rwh0xGbHDPiWGmYWynD1EyOo44ANmcgEh5piv1l0b9MxzOdYRFleD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ju3RU+Vz; arc=fail smtp.client-ip=40.107.130.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ju3RU+Vz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsmLOxRPK2fo1AZzRIu1sdRsMNctkM0I7bBW2K7E3WvBWFiTOq9pANN2PxzqCKCm9l6z//KYxjPWK53OKy8jjMF92Tg9LlvrHFYGsxy2RnY0LY1WH2LvZAqxES+pDEtZmK/4Hr21bCul1blrmRRDwHnxVKIGTqGPLMLCXV3KW2enqqlhwIpul/Kngi8AuBDuLtA53IkgUHe53L1srbeolZtwmSTyzADpgkkWigRcJNekNaoFihBy9zAuBV1W9jZfuLp4GA2eTN0THtc2m1TrH8/VzxM4cMrROu0/RPo73A4OhzrRSSLUumKfL77t+LK+oWcGfuU/LRCzphKfJ4v1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUUcFU9Xqovocav6OJi9B86vmELYtQihEOokhCt6maA=;
 b=o+BeLToYaZjbLwez3R5jmMRrRWzQzPNjZqB8k1oZ1hpTJMocPZP2sK5UyWQrs+Tw5W7uoBIRl4a+3lgVCSCM8WYHXGH3Z6Vy7wMHfyu+VyTlO+UteKQy8BJCTGAFN5QIQPx6vPUwJiQXiEBsYEQmaZPiRCPQ+SajmaCmiCPcmHgB8LoEtsvrcue5isjmrFKwwztFQvrjUva2qw/UjizX57DIQgM7a3pFNEa6Wb9Ts8A1d4KJOM22Vgwalxi5A6NmQkkznh4vsDAkFANblQ+GGd1O8WiYZ26lw+AnrJ17uMqJ0TBnd3WQaqUC8Z3sv/1drt/WkcjFzM2IH5HF14ob7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUUcFU9Xqovocav6OJi9B86vmELYtQihEOokhCt6maA=;
 b=Ju3RU+Vz10pEZ4aHRV2XDWik2Nc76LFIi8EVWJDJcaZ6RV1F4RiVWtwk88bkbRbQdDMvHoFYFLsDifV1TFLEYkbmd33Gynd7ZEfP44uqJeJ+Gw5pZGprPO790IKVE6NEVopeVHW0ECfPHWeLsYEQNkfyRXSDT6opogiH65DJ4HvOWgqkSP6BKJVJSEm9EuzICpDCjQ7wgBcZNv0UqbWoNbtIR6c23VfvdV49vCpUf1HCVGRInn6LUVZf57dP/+VAMNarycGT4MXFCb9U8eKi/WSU0TfWq0KDFIb+EazStSMOV43CSRpX18HIMNK/seY1Z1rlaLzpVZB5e+G2+tam0A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB8511.eurprd04.prod.outlook.com (2603:10a6:102:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 08:45:08 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 08:45:06 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: peter.chen@kernel.org,
	pawell@cadence.com,
	rogerq@kernel.org,
	gregkh@linuxfoundation.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	balbi@kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH] usb: cdns3: imx: fix kernel panic on remove due to kfree of static platform_data
Date: Mon, 19 Oct 2026 16:49:44 +0800
Message-Id: <20261019084944.2051097-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0265.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::10) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: 011b7829-d490-4bd5-65a0-08df2dbd463b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	UzxKrl+PgTDUpmFSJG6wROkoAd3/4L8aVZpGpv4FKBE7AeNoS0MYwzB8C3nM1EYXggxNUhVQgH3oUK51VLmyYXtOmuc2DhYNWhlvTutzvwbt6v7v3dzjkZLOi/6RMe2v8Y8zUqQipKvwxBn1G+JAohMXWbwXvaW+aBOFZLPN4AwZI8hxvUruO7tx0JWM3NDGnSNkjs16grTZkzciLN530/KvYb86V2Ae/4O/PaPyLfGtAKDw5htqcBqiVP2qz4GMr6le8w4Kf7+LMgEQHKEo4Svi7rurCsTJBAv65l9Td3pntPhP24aO6Pcr8h2tr27z9DiafTDjvnp8eoN8jIaTdfXraRMPPZcOaAvzi6rmWPqxffDqMW3lFObBy71sinTqazzPLXVSdERCc1fJViNXKYc+vn3JHCLUwPhgJ3SsKIRqng0oOmvDYMf8yq4UV+zYgPc9i9l1uSFs0EKqXshrjzpaB90a5h6NgbQEuGHkAJANIIqEFafbQpPowSZe8r00Ns5/RErsMBENz7JeIlz8IsK6F9C/y8fST/bIPuN2A0jhPKwT/sDOZXrKp2LR6k0GVS6EIGvRaJaTiUXTgZH4mvrH99rbpfoW/xpOheztG6+5I5wNDYEZ9Px2dRLMeBNfpF77//1zhm2pGZsVcjESzZ69ZluXHicpr7t3+AmdmDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QNDG9QIkUmnNHIQO+PA0zgWF/9NAD+szQzWRyW2TD0ay4GFOVJYUMqpCmRCc?=
 =?us-ascii?Q?R1vCDiFXOYzc2M9xKRQzVzFRjk2+gx0yYbRXN4zAJReF74U0QDuf2RUCzuuW?=
 =?us-ascii?Q?N7akZwaAHNaOCS1Wu6mjhjdvOSzdjq85iJmVrxe5jwGPv7TZzsL5b6RRtXch?=
 =?us-ascii?Q?My70b/Evavfz3DapVEz6GfP9WLfEouvxEVrDvDL8lpLsfU255EiU12lJ3OFV?=
 =?us-ascii?Q?ciglXcpurxMNtaBgxM/iMQxgso/SkRqfe4W2O2mueabbWg6yzEnNnIOrrBbw?=
 =?us-ascii?Q?xsSUJPaTaQ9vt9bdDXE9Ye2uA6Lbg2fj93pUpCuWlCXiOsNZv/2s9HoYHOHc?=
 =?us-ascii?Q?d65JKsfMIUHZgf6XxwU5k0p4NlsiwhC+dW9mI9nSCpRpeM8T/kRFay3yfULM?=
 =?us-ascii?Q?B/OJhLU7fOMybFN6R9D8aahcH3B6HwOyOQOPX+TC0afnWBnEev6K4JfJGGZO?=
 =?us-ascii?Q?cWAjogGNz9Js15d7jNPG56jmJob3q7pzK1thCg3oeBpAt0CgTRP0E06nQox/?=
 =?us-ascii?Q?PKZeWA/C98yt3mRiugeHwWxkoErOP+OdvLxvzUY6Yaa431K6LDxhQVFoZzb/?=
 =?us-ascii?Q?5CxjJv/+q4r0a4Jzn2X23Zx25sp5Mx2P6Wjemsyxnt/a86M6eMQ7fDls2GBo?=
 =?us-ascii?Q?S6A23yU9AwahdpwN8Wl6agEwe7IYq0HVFkLawsnQFcVJ1O/cJtG5xW3RTFkX?=
 =?us-ascii?Q?1aNfTEEiwQgtxdLlf/oC+qVa36XKzaRAmZh7Csl0j0HlW4XLvvGfPYGLrdMl?=
 =?us-ascii?Q?LSg8k9RLzWlURkXwQom4oKp+qj5uXkqvcjF0FzmoVeOvaVF2k/xpmQcEvxyV?=
 =?us-ascii?Q?TNkYSFD+hLsMVI5dYmFkeaTCPiN3gcGLdsE5xg1Om7wz2t2mN4i2SichH+be?=
 =?us-ascii?Q?jzX+VBGduca5NfgtbYElUMdmE8nXhf1HPnF4HNQCrXWnzhLiIYayZ8wkxwfA?=
 =?us-ascii?Q?JxBSlrCns39XnTopV4LEezi011W11+TKbN9geeqKBY1j5U9IHP81jSOiBryT?=
 =?us-ascii?Q?oZVpc+2ltyuusEa0eVczRb+J6Qso5XUXxrij19Zd3wDXm1Kk+DJ8OmR8tmqD?=
 =?us-ascii?Q?fVMh1spPkYFQztng4zevD+6ukZ5qUmG6Q0W0MN4yyqn5HLiAAm+WRrwOPcPT?=
 =?us-ascii?Q?KEJqqAKU+2IQORtKgjM0Zob31+ihX3C9GoZJt3C2l8DaOv7pMeFUlLj0LqYL?=
 =?us-ascii?Q?JXlq8PsJQYomsojBdm6AtreppIe93bY5CE/HzWi4jykBkrmEBQXSRbio8/dI?=
 =?us-ascii?Q?7aMuvMiYj0ocKoPGUTnbwilaqwAfEYdLVMDevV1qgckkeHYn/wiqNoYdw9vs?=
 =?us-ascii?Q?ts8Nu9AzAPBHCdpwSujFawH9DQCXy1ODgcJoy5wNBl1SX0V7u7aGCtF9qI9S?=
 =?us-ascii?Q?hGu2li6QWFCPmpgr/02LrdFBWdtEVLdvL1d6u/vBFOlMhCv/mbvG4SH2481u?=
 =?us-ascii?Q?AYBe0LTTAUvAjZIvbAOOrRzBdrOgdbR34LRGS+XxV9Mozt6xJnSVj/i3m3Qc?=
 =?us-ascii?Q?xjzrQaNw/SX+X1PT8/8P3HUSVpyD3wBhQzN0tyNSjIpw16pZaFtVuAueZJu1?=
 =?us-ascii?Q?+Vqg4TACC0Q+Tte9ak0/VHdKl1hYyuBXsgmtU+BuLfxD65qIR4lx9M2i5iQQ?=
 =?us-ascii?Q?oowFoJNbVonWVhlibMT9qtDKK9zw7rLswWPPK/VsFEfkgt6IiMZbz/PXwofW?=
 =?us-ascii?Q?G6RSvYW16j5kwBdgoEZJKJKWK+kWhchdJnmBOvut1jfdge7Q6sfqVDbom5UM?=
 =?us-ascii?Q?cbVvRGGU783VZJ3hwHcZDO3Nh4790gr98P8VWfcCCq3ssYie3jkT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011b7829-d490-4bd5-65a0-08df2dbd463b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 08:45:06.6665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfNhvCUgU2E9L6AOaJMom+aFBOqb/0izmeSsWe7JXv2BCKrM1Pfo+s9dlz8tlo7+CSXBcDCoEF7OlyGeWvpewNMw/Rz5g4+QGl/EmSlY3xv8mvV0JQfL+48zMvJ9eFAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8511

From: Xu Yang <xu.yang_2@nxp.com>

When cdns_imx_remove() calls of_platform_depopulate(), the child
platform device is destroyed. platform_device_release() then calls
kfree(pdev->dev.platform_data), but cdns3-imx assigns a pointer to
a static global variable as platform_data, so kfree() on it triggers
a kernel panic.

[   56.809541] Call trace:
[   56.811982]  kfree+0x44/0x398 (P)
[   56.815300]  platform_device_release+0x24/0x4c
[   56.819747]  device_release+0x3c/0xa0
[   56.823413]  kobject_put+0xa0/0x120
[   56.826906]  klist_children_put+0x18/0x28
[   56.830920]  klist_prev+0xb4/0x1c0
[   56.834325]  device_for_each_child_reverse+0x7c/0xc8
[   56.839294]  of_platform_depopulate+0x34/0x80
[   56.843664]  cdns_imx_remove+0x34/0xcc [cdns3_imx]

Fix this by iterating over child devices and clearing platform_data
to NULL before of_platform_depopulate() is called, preventing the
invalid kfree().

Fixes: ff6d6e6c6778 ("usb: cdns3: imx: add glue layer runtime pm implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index a2f041e1707c..2c86fadd2cf2 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -218,12 +218,20 @@ static int cdns_imx_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int cdns_imx_reset_pdata(struct device *dev, void *data)
+{
+	if (device_is_compatible(dev, "cdns,usb3"))
+		dev->platform_data = NULL;
+	return 0;
+}
+
 static void cdns_imx_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct cdns_imx *data = dev_get_drvdata(dev);
 
 	pm_runtime_get_sync(dev);
+	device_for_each_child(dev, NULL, cdns_imx_reset_pdata);
 	of_platform_depopulate(dev);
 	clk_bulk_disable_unprepare(data->num_clks, data->clks);
 	pm_runtime_disable(dev);
-- 
2.34.1

