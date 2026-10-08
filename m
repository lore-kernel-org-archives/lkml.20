Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011049.outbound.protection.outlook.com [40.107.130.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE42480DDB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450254; cv=fail; b=lE5/5EbdZbsJwQQEwvlMOvtGqY2nS/FdjpyK7a1IRkC1kvtLugwRTGUiDhaRMJJ68xTaxsScAAzDRnsQCABglzdXCZ9UcmkATZPOBB7NeCv7hKnRNS6bBR8qffOWw4fT8Hg4BkP4PvpbTk0XHtv5AJcUr6huEBGNOm5g2uyMjyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450254; c=relaxed/simple;
	bh=b6wbxc7YQON/BDdk2rCu2+ZIHB4eWDm0dWhf5WCxNT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O+FqePa2kIq5LRqZ+ihj861TD4q4qwaIE75vxqemTXiKnzlHeiLc0pNX+0euQN4+kUe92PXtoL6lETFI5vDJsYQUGflBeQi3iEH5sbEMuYS0hpfpY/jPbM7L4F48skw1hTRrajJv/wlORbioBxnBYOnqqRUbxkAeoJYEAzO/LSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QGCQzs4M; arc=fail smtp.client-ip=40.107.130.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QGCQzs4M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdikTn/49FPzjQ6EYK/oj+Sjx6xM7KF3KDVJ1bXfhmH7WcN7UUlP0nyfEml4qkXRDtO+8cRm40uPF7npGVrzL4UEWL2d4qj2Xe7e4unIC8qLPml8rac2zzdjzh+/vou/t0x/QqCJs9GOv3svJGTZ2NveJSCC22ICFyEl0zcgaCcuEyMhGDabzxVKpAsAQm5fvNm7KfPpx0MMjSUw0xjc+yEpwHsLy+THPFFEqa3+UWB4pnGoLZZP2MMKt1WNjLZzznhW/goL5PtBrEdj3PEt5ucmSiAQWpZyb0SnA78RQraRAO4H828HP/tQw9KlRBjERpT/GhXHod454/lhDNw1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z623zvl7ZYpEt75E7mXFq63hTxnBYbzm8v9ErJ6BLYM=;
 b=EIlDxssgd7utdTveSmeE+XrIZ3ye8EAWP3TZlmAJZ+Ac+6aj9LEIJ07LUMPVgNWeavtb2dpYP9kdbCKsNdeDzVBYDI5PPNv8Y3t5gOW+xFK6X+cIlRc8mvCiDnLW81vArp6el7uxA1AH+Dpwh3mkfpeN3lm821RchA1cU+6QxadwzgUHMR6cqcf2HCluYJa8zXtrRFHx74RvAc9jwZ6nt/cDu5VMevaOBKMCwdWK7QROMS8I0VP+HbffMqbY7y5L7onKlhJNxq+yZbtZyY6COEOChas9J+d6wjMI1qjH54G4WO3LMTe64w2CxVF8HBQzgVLl1FOB89TTS+PXJb1yeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z623zvl7ZYpEt75E7mXFq63hTxnBYbzm8v9ErJ6BLYM=;
 b=QGCQzs4MujS7LrArIqU9hRtfeCOwC+Ry3tSmK4ktUijXOQCQO43fdtQgY30rG+ALqshXrSuNn1Hh+xWsmAQH3mJ7sYNIETjsN0xQrV0JGwqAtyqjKlLUCYBdP0lFUcasdQ5WGZpzX09SWhR3CUuad9QTBaGz4Cprhw7gTQZ6UXgxf98FC3LFKqu61/T0DlM7j1j+gDhD8Ni6fv8TKWf+BJlwoINL3wh4XL5BKvrxXx6DRkZeDOVQhnjMuh3ASK8InE8YiYxcC+8VxDRl/KKf7pcie6lMFk1UDy2qfkxbKQ1/z/3xZzZXVEXPnooSexdhmgb+ZnyxAUXxzPP7CeAjJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7459.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 8 Oct
 2026 09:04:05 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:04:05 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 7/9] irqchip/imx-irqsteer: Allow building as module
Date: Thu,  8 Oct 2026 18:02:29 +0900
Message-Id: <20261008090231.796511-8-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 31595518-19df-4ad2-421b-08df251b1ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|11063799006|18002099003|10067099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	Lo4RflZW9YnEyQTpE0aC4sWWwIiySj4kxsj0lCW/w7R79JFLMR3O9OvOlXuXWSJ0BXKmNcg9KYKxkgwuTBSuQ+sNWMZfg3Ebe9GhJVgdSt3sYh95rc4lawx618ymqGrHw73xRg2T8dCC3MQhZYGDPWSoYrk4PUkd7TdIrkpldEhTucsZWiIhBIijIqghQZG1Nv3peBLadIi3hPYijko2edd89OHgq+n2IIhi094200TbkZc7pTHyEc5WgpuS2JksYNkra1R0jIkHpkU5lhOS4NwCcv0eL5sVjr6BTeQYR1oRuhB2+lpjdtWof83uEhrhHbwRy28/NT8chAKk1pAZ9sq5MBa+fha0VU9g2AFwLBe/W2OiMH0y8i8rLADmn0XthP8ejIfiPRG0JtSCofuUie4tFTt6sjwKiuc5YeuGD0fuEa8/q/28btmCPiJ8XicF/K5PvmNiRL11c/qD8gr20in20rF/phL2taulcO8fp7EEDPWEBd9HBsenLa+U+Cwbdwqu0mEhEMd4f19zgRFRk4D2TYyAJJbh9AYym12y5LoSDqfknFqdeO/Oskzl4qP2PnwqLQaMVCSGPUkwX3Ao6lXBLqRnMYHcfqzphatT+IokZMN80UM43by0krISdtK0fe+97j+BmNIKhhrrnUDmImkEgUFfBDYxg7F53v0d7Ms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(11063799006)(18002099003)(10067099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G7d5FxDPmk3Y8ljHsys0haFnEAOVquebsSUkbtBYm0sdjerHjeATgc2jGo3q?=
 =?us-ascii?Q?6110+U8pBnuhR29DfqTjr3bvjIeZtzoqAR5V2UyGcD7etp2zxNBjSutH/7MW?=
 =?us-ascii?Q?dBfZ8RGoVQUK0XrGk2MyjaHuJ9pqb4KEZvpFRXNJZK213vq365JDjwv2AN8g?=
 =?us-ascii?Q?Uckd4pHGX3Io+RzrUSjCVzftOxc7sxVsJ1X1VC3ViLZWx88rWxAZOpknsnGu?=
 =?us-ascii?Q?Wklpo4zWEVURGhjWd9nnLHIvrJXVJ/P0rrUi09MHIXFWKCZuinu4hkH/733w?=
 =?us-ascii?Q?8W9q/7a0UmAp/mgcwFy/cpPnBGBunCIo7WzYGMKV19OyhKKF/g/wbe+iGMu8?=
 =?us-ascii?Q?UFQeLgMm1Ikc/tAMn8JawaYQf1qogosWgubpw3hyaoifEqU5NuqugiFKftPs?=
 =?us-ascii?Q?rPsc1vb1iMkdKa3zYDj4Vzh4BWksJ+F58YRSiQnK0YupHgP/L4yKRTx5Jpfz?=
 =?us-ascii?Q?q+97vrphNfsrCPsyaAjdgVjy4x4nPSplT7lJL5OYWlyUVnSrqBJUw7Hv/QU7?=
 =?us-ascii?Q?CpBa5UVL1Fi2VToQdlMkHjpfNW7Hu2B45stvi9pcApxSLtP8Y981Vm5NGMw/?=
 =?us-ascii?Q?wIgMGr/tX+eM3r7TLDAdui1NhU7EfSis4FyAp1sowuAwPxq/vo1lcLlMzuk2?=
 =?us-ascii?Q?UwCvUip48ZkB35lhRNmsQC6CPZPF4TY+j14UWdIPgsbEtTYQ5/448/0aNYJ9?=
 =?us-ascii?Q?coW4hN4FEBoglAVEMeCr/uTjcisCizBQmwRHgq9+eEl4WJZHFudYjMDK8j3F?=
 =?us-ascii?Q?mhHrWPSY+Hoo0Zdkhg/k8+61e/8hYSvJJn+sLd8bLmb4zavcpcqo1DDx0yO7?=
 =?us-ascii?Q?I2Xuhu3ErHnz/Qnhel0UF+3T980wBYj5eeZNmEDb/WvOtpRcNvmr1r/uWOL4?=
 =?us-ascii?Q?xFeX+yKslgdgdOZehS9Jvo9WSjx88A3WV2RrS4cGB3nVs5cxvGrYWZTbEA1M?=
 =?us-ascii?Q?f0Yg0qo41gsnPUfW1tyOE+mueNmOUIdBcozJ5BsGQ6cUF9JJ7oCQ41gNoVgx?=
 =?us-ascii?Q?7gM3jIApDigmoaFZcPhVfMyTBJug17wXIDioYbgFMqGnXCmDtBvuExXg1mTz?=
 =?us-ascii?Q?Zzv1vX/gOdSGm7jaMPYdJ9irQphaqGYWQX0muh/MFlw740G4Dj1ChwOzzJQY?=
 =?us-ascii?Q?Y/k/DKbhYuGG5szPlhL+e/h9pDsF0il4coxG2qmC3CFoHh3BD6k5C/UHvJ1V?=
 =?us-ascii?Q?AAOHq+oeTpYv1NcqxUD+44NjNBR6jZMVPY4Gd5W0ersqAkNFF9eIIrMChpaL?=
 =?us-ascii?Q?mzZVWD74sdRljlgGbd8bemga1VkaKGTSKw87utSfwpXmJJqYRo4Z3zUCE64V?=
 =?us-ascii?Q?8x6SxXfy8g4vIwCJL606LrNfGokQlmsn3c5fjDMPwwmKomcfBo7eFjTfegzn?=
 =?us-ascii?Q?I/Q5JCXyEBVoMTZ9jnIlvc8j/xvdiqPJD76BQ4SiRZ4P/IZ6p97uSc/8i/q2?=
 =?us-ascii?Q?TavhEF7pe/mQHtp1C0cykJLpmhLuWY+HVSGn+7uCIkVN58fKP6zZEnc1ZSKC?=
 =?us-ascii?Q?Sk0QTG7rq4er9zrdG4Tg+ZVaZnAnpFRwsvXbYnPUW0G/s55w/RQ3pGwAySDB?=
 =?us-ascii?Q?4RS1OqGiaAGKQ1FT3/kWgfH3ZyHKbjIEkmmzZtwZel5qHnC2qFoKC3ilMvii?=
 =?us-ascii?Q?CTEXJneIvKHUa+EnA/WF0ykUlt9qMUyNqmBVCs/XHFoi7M52x/3jATdfrQnG?=
 =?us-ascii?Q?BmNJrELwbA4dVMSF5loqE8RIbf/Cg8y5FCGxZ1WVuoMYW5gGXFiliKK1xyNH?=
 =?us-ascii?Q?dIssscbforU7Dqj0vaudUDeWw/k1LI7/Bzk1q9VHtPZbX0C9Gtcx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31595518-19df-4ad2-421b-08df251b1ace
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:04:05.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: riBR3R4MZ+chHyO5qI6nyqpwtUe20S5XCWK3BType2bqhvPQ0QYHF8SOf87S1LC6JIaIQUBSCy71nX4bgdPud+xYMk6Z5JGvOwTkmdj9M/VWM16ClSrvz8MJO14PMhvN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7459

From: Jindong Yue <jindong.yue@nxp.com>

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver(), and add the MODULE_DEVICE_TABLE() and module
metadata needed for autoloading.

The clock, runtime PM and IRQ domain are already owned by devres, so no
further teardown is needed to support unbind and reload.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/Kconfig            | 2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..105108d2e6ff 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -555,7 +555,7 @@ config CSKY_APB_INTC
 	  the controller's register.
 
 config IMX_IRQSTEER
-	bool "i.MX IRQSTEER support"
+	tristate "i.MX IRQSTEER support"
 	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
 	default y if ARCH_MXC || ARCH_S32
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 15ee50f65d54..85edd5e33ca9 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -10,6 +10,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
@@ -359,6 +360,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[] = {
 	{ .compatible = "nxp,s32n79-irqsteer",	.data = &s32n79_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
 
 static struct platform_driver imx_irqsteer_driver = {
 	.driver = {
@@ -369,4 +371,7 @@ static struct platform_driver imx_irqsteer_driver = {
 	.probe		= imx_irqsteer_probe,
 	.remove		= imx_irqsteer_remove,
 };
-builtin_platform_driver(imx_irqsteer_driver);
+module_platform_driver(imx_irqsteer_driver);
+
+MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

