Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777956;
	b=e2MtZ5OP5jjRsww/loeDZnNAkdx5Y6DKvEZ2gJJipnDWb68GRF4IdSqSKfunZshUsCAV
	 53fk5zpgv0kK7KgIq3dI07aZ9vofRTsSrdFi8EZG0mm6La9yfZKyMPHyN6RzyEkeNtDKf
	 HcLYGSh9KuXmdNMT6p+YxcLpSMegitdrDq6HOeeLV0KNiofylAVRrmNhkl43Rv2YmiSRi
	 83/miGoqxI8XwQ2rh/k6fd7tEkBmKk4kf+DMs6MieKmrQTxE7dGF9sRAgn0/g4jayignf
	 emDh2XNRVW4hbE6HGAQtfEPz3ftVq+6tRNRBS6mu7eJ5887M+kbigO2V04B4ueZJxeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777956;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+RZ9WrWIPx8nRUxENIiXqQQ+XopKclv3cjdScyhyvWk=;
	b=JyCuabZciDPhSZNo+pZ23GfdqJDjL7c5sul28RHzge5XrXenOPnjDxX+fDJ3jZwxz/N8
	 Y2d/9MTf61Gefvd3WdY7bBjcELhOToxs8X4p7js7e25p6QdZiDBke+WDaA5KQ0ngjLRFD
	 GfPl8W+FkVt+LAKG6ztelq74vxR3Br3WAcD4ncWxP/le1grO/eTEZehwawG9z2UU74QoJ
	 u1TKZscIlw7VGBaq2LbZnaKq+cft3tdCUpu9P0iqGDnNKKfdYWEnwRCdeBgbpgSplqV8R
	 kzb+AWHfjtxi3S0btgDjpCcidRkGcXNJ3s12R9K2d082vvAKNbrHevgOTH/Rr7izvLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eLftXLfD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.3
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF80606A339
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF80606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eLftXLfD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWyEfK32aK0vVI2mNb3KWR0qt+amvAogdy9nru3nqTKTD3TnhHjhls/PxbqFCqinMCPeSqCyCfJSOi5pgOATnY19LDErWep2zPm8SrR5Y+2rWmzufzoKBYPWkR5efOblmTBojJaKwPk5RTC+h8GlsCXQlxh0FtO5Edpe/Vn3Z1HIU9raECKppFzTmECOgcH6aORKQrtn7GpEGAvArW7og7QQGrp2ey6Is2iC9pdoBzyJNRtxvY6TYKa+ul/SGO9nhKGNuZ023OItq3DlDmOUrGMS83lmdfWHIdR6M3P7BeZwr14BXPyohKh60xxU+1jbiC+aY2XFPcCzp056xPcKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RZ9WrWIPx8nRUxENIiXqQQ+XopKclv3cjdScyhyvWk=;
 b=xXb5WeHJDAA2tJi+6TCrsnUQz/oGMbWbWV1tDDJFvnrfc6jEb7rKc582ObhjdvgwWIjvl0x72IBgCbEDuzxKvZ6+NUmU2Ox0a4+D9gAbJgjnL6wBSzBxVhBSgzSFkjaJduIUqw+fPqxw69Mfm+Zs7F+FNwUWoYTn3NQNUpeJo+KuFatC+kFcnpbeo0yusT9sDOD/bbXcfFZL9MGSaAGR4hPIw2rt0f684flbdAghfTPICbfXX4bJBGsuaAHlaEu1wgBlW4MTlGT8A+AI/Y3EU+t59PLM/Hxna9lLeMmftPEURpOSKseOUqeryTWtYunE28Cnd6dxYwYwdgasTRPmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RZ9WrWIPx8nRUxENIiXqQQ+XopKclv3cjdScyhyvWk=;
 b=eLftXLfDSP78mDD23yz8FxwupE/TIEaRp7DHgFp42SzzX5pIuZ4kkMDUAVdmWx5EBm6X0USbgauovUkn7aNhrddmsiWntT9WQrE+25YvVmhBTgPZjzXqhF+AEdkkSRtv/ZxSPt/lt3Ne0wWdSCE2PxuSjAHuH1xzkVVDnzYQO6W+VNzyXf/cyzKamHHiIdqjqOCVAxvt4M/Fxwv1BqmpZTpmVrmTW5lkxaBkuczy2s2zfjuh6wbOV06jatpIdFoI19uqBU+BqD8e6TZq05jNkt9O3XaQfjEcl3bJsbcQLvGHMucliySjb8fkDSkK7iLXhMoL5hrHuHmhk2ig/ryrIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by DBBPR04MB7835.eurprd04.prod.outlook.com (2603:10a6:10:1ea::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:39:12 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:39:12 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabio Estevam <festevam@nabladev.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 10/10] irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()
Date: Wed,  4 Nov 2026 16:37:58 +0900
Message-Id: <20261104073759.386777-11-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5c::16) To AM0PR04MB6849.eurprd04.prod.outlook.com
 (2603:10a6:208:181::7)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6849:EE_|DBBPR04MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: a44fa9da-d0b6-4b8c-05b9-08df3a46b825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YzsMpUAlvyQKURsJrL8L6bdHzSAgfbc/KodBT36QYx3or8yszFaGD/m/bVPz8qc/UW0340j+13eHi4nDTNYvoEpncgMQaGlPF5T8li0TaYrT4xuUJHEemsIdxPoSfminyGF6KKfzHKfcCe1bccKPfhsQgF+4jYhiX9R3YMEA7yF4OVuYwvaNcTgnGuWK6XnpEATK0glW0xaHDzSJ7Yg+MChZxMO7IjRhJeorNVJdPzOFf96qvD91ugFm+bz20I28DjLEStTGaPMLjlhJrcZJI8nIO1D5uGWlGWXr8C6e9FmcVNCYlWs5hDJOIk9HNLmflYxQCPTYN/Z9fSwCSqFlqk3TFsA6lDFq3n5JT3EIlM6Bjv3a5hrAXTz3XNU+UGmeVlbFfRlGzuz5DUJ1jb74t5TkzCT5haCtCf6hr4vg6uX3z15jGbTTvTRgWeU4Itr8Z1bjspQxUx2yLf8TS0D0r0HEZEUhqRTZnw3moidpVsBedke+iX5Jgxn9pey3GbAo7ugPvsNf8k7d5Pl9eRmqUW3yIVuPRcDsW8ftB99BJAxAY2LbesEaZBSePhRtH4z1Qm2Gw+QC51Eb2GGFmu4Zfh1Sbxxe5wcJelx6Y4+eGE9Bf5NGrB653+TOBYTURucmBHPFkabyWkedFlKyX7cliJ80sjomfteRaHK2bECSoHQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sgQkfSKKs+r4R+Vqewa0FDyBL9a0qYuiFLZigDGppjP4gHHPAzpviLvAYDcZ?=
 =?us-ascii?Q?5rGDzBxMmPAoJDhDt45bv82MqqRXKKPaoLJlqk71Uh9y7SRSN5iYngLjPYf/?=
 =?us-ascii?Q?7fzcwlepBgm1T6ys+XJiYDqQBQSlPCp6cZXY/Vjj4FdxNR+Vw3Qtrfn+83FD?=
 =?us-ascii?Q?5KdAVMobtGtS4J79+gjQWcsxBkmJY6ToqOYvEcc9TmOU+WxdkMu7CXlFgk2T?=
 =?us-ascii?Q?JJ/ksjz0Jy55cmEHQffZIC9vyfOywosoK6sCMBOTnRNwXTPqWYnU9FjNKbt3?=
 =?us-ascii?Q?0cDrWcQ07uMMh63s0SReIxiIlPjGbLgyWBltuHllKMBktjKKhhMug7ainw5q?=
 =?us-ascii?Q?lge85IZdnZHxH0V/F/bEh/UShVCciD1rMahPH4EkVDgrvU1VXWVUY79IbEdF?=
 =?us-ascii?Q?f/veIBIsViLVge9W4hbubF/sgJ2dbZ3RgJmOuNuGT++79AWdWxhfjgH0Rnb7?=
 =?us-ascii?Q?LINqHMIzaiLKxMcOb9U/nni/+/DdBd3tRMFeXvZ1VfgC5M5xhLScMDp6aKpI?=
 =?us-ascii?Q?LKvVwuW8zpPt/Dpe1/SBZ1ypQuXzZJAkvcpUX+QdFag1jwG3Ji02VSUUphoE?=
 =?us-ascii?Q?LryAxrGlJfm8LVa5QYsyneQ7ForP/i2m8xbhC95gHpswQK3hdA6CN2Pc7WO9?=
 =?us-ascii?Q?lIlK0hvxaY1hNiED7ssEazsQk6n2Diq5cnZ2N7jkwL0Vm6yN80H/Z91H2cAa?=
 =?us-ascii?Q?tpsgO/PmcMFcaz+1UycGTZqRZs8d4ufYssjcGK+Ynlzoud9Wz53uqvl+8x+N?=
 =?us-ascii?Q?+YadGqMwoxvYzDbGtja2FWSFuZhU6sUD7IQxGXI+Auzi4XLFdz0k2eOiSwnc?=
 =?us-ascii?Q?9qR6aA0p+CbrPJkCoWUWzSPrrhNvhOSr9bEXkGyTUa7u7NCgT6eRaPOPrgdm?=
 =?us-ascii?Q?Shl5XtMgjtRmHZ4Pz6oiAuzx+baf7U+AyDqdtu5hfr4NjVNbVZhfyNvkBA1Q?=
 =?us-ascii?Q?9NMe6UEo4syhDJEeUXeC2xgG9Qd/mWsEySma5t2Yw17e9gge1XSO2Oz09Z+U?=
 =?us-ascii?Q?pMHIwTWr9dQyNYwGZuGN9D/AAG/XFi+2nv6HQsdFsyEhB1eCujWFY8A7hO3U?=
 =?us-ascii?Q?UAaApwQhPw866DtZqjQwiZ1XM76cW1YlEM0Tj8aEWbCqCH0KXPbpOvgmux7F?=
 =?us-ascii?Q?2HW2VOewcO19JknS5sLm/voU1qnHeANLalSW9kqzjnAi1xnwGJFqtV2FPgAv?=
 =?us-ascii?Q?SSQBXwizIqZUTaIDD33W9T9dLkxJMO7DHQqjJrFcqVLyfHEq7ARkEdl1zqni?=
 =?us-ascii?Q?26aCQhBM38jLfKBFuUx2+Zf4FZdKRtg0VGhTaITUlUO+OvinSeEnmbGfsU1U?=
 =?us-ascii?Q?RY+ad/ENKPjtbDiqZaJ17g6Uw88hmRQLjX4PhPQYUAMGaTm1Me5OzbYW+jdZ?=
 =?us-ascii?Q?659BPEtyXriLo3uzDLVYUrW+IWK9E8N7CL48Q5qT23MwN2EeP2+7/2Hfnhhl?=
 =?us-ascii?Q?w1m7T3cQ0NGtiAVQuISZTqYp/3Ao0NRu71r7dTf3Rd6z8cYTwSShiZimOv+J?=
 =?us-ascii?Q?yPy07B0L+YXx0IF1eyzYw3Ps72e1WOY0SXJHTv1TAEaCkr73xwGQqFLfg3IT?=
 =?us-ascii?Q?KFhjJ07HjN+C5zSmE00socykKbJbHOSqVofGG4HwKK02Fo5OtKTaARWZZPDK?=
 =?us-ascii?Q?Waf0BLZm5rvVrN+dv/Ks4v01nL//FT1edvSrxyOHKoOsA5OTo5tThzaT5j2a?=
 =?us-ascii?Q?nd7Jyp6E267TFj0w9oH/VjgA2Cu8NLynmUr9X29hZvMpja80rYPhPhajmXf9?=
 =?us-ascii?Q?5qrheRyaZglP2KFxO9IFPkqyDgvzdUy9bnqxiPwrRtxWq/aPYQAk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44fa9da-d0b6-4b8c-05b9-08df3a46b825
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:39:12.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ET37kAmoiwX8yQLL1bsNyIgGDlH9dZ8SqDS6yW4CRSkT/hUb+nvMYAANbjxdJK2rQteSmEE4b4dmuIArwWkXqDOLmYuIDVJ+qkjVY5bHQFAa8KZofahDQAaSGf5r7UYs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7835

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Replace irq_domain_create_linear() with the new
devm_irq_domain_create_linear() helper, so the IRQ domain is released
automatically on unbind and remove() no longer has to call
irq_domain_remove(). No functional change.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index d15b806b278c..da6e8d1bbec1 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -248,8 +248,9 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
-						&imx_irqsteer_domain_ops, data);
+	data->domain = devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev->dev),
+						     data->reg_num * 32,
+						     &imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
@@ -298,8 +299,6 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 	for (hwirq = 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
 		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain, hwirq));
 
-	irq_domain_remove(irqsteer_data->domain);
-
 	if (ret >= 0)
 		pm_runtime_put_noidle(&pdev->dev);
 }
-- 
2.34.1

