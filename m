Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4A847F766
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450243; cv=fail; b=oPyFlJvrj6BaaGYr+vdvggBA8lzuIRDjrBN4XnMEo+NrDj9RZlXiyzvbVnyqZfqfl1PzDDUaGRT39KzoNJiVA9dJ040MrAG4hbr8/n+AEDNgAA897NWIkt982dZtY1qe5kouicm6ru7Kqv6oux3ZYHduvzjn/LWn/QWmk7AoR8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450243; c=relaxed/simple;
	bh=XGxd5eb87wdHw1EDIIOFLMLElywZ+WZPepbeFb+81Y4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cVZ6ytrFN9vGdGXA0azIJTDjH/r8lBXNTO3G7xlMf0qBV0v+qaplPuEy4xsbpYkZzZ18VG5l2p5WYKrghhaZHISrsN8htZjR+AkGxpIm3FADy8KjV+2rpfbwYK6+9cY+qmVc7vwycqAGNXHj12L6KIH/8FHfumc1EKktW96nk5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PShUEiTF; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PShUEiTF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqTNRTzRDKVww2lDSzIdkFPKvu+7BD23VbQHmOG/DnT3Su48ho1YhvyAMWMZIPDOcmy/mHkij98HbwukjDzMCdSS6y2wpHZSZ5neaW1exiuaT2dFnm8fdlEDKlkGo5wfDC14OWLoUQxh0ZRsbU79ZGgrRdtptPDtR+n9eN8dIt2wJdVQCFzPAXiM2X73qeBFX/QltLr9bWux8NG+gQCoV0fxFdVaC4xzUK7PZj4z2WgyAmWZZHnyu+30uZ/kPpiZb9SUhyAVUBQEb2UBWwyLwbBkcE+yk4hJ+zsY3SyEayi6YDQxBwmVw7W/S1Lqj2ZQmHj1XFrH17M3KSjVB6NK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oi1Cupzhe2kXXmf7z7ZZgTby9eoH+i8Uupx1swiNzKs=;
 b=re85X3Zx5sTSvAfJOl1zRfJDt8uhbsuJ/d/QJcgOMauBmsT0ib56JdfBDQyUVWaslHpCJkobG4mxnR6MCQTI2613SrupLnKoxNxS863OJ9+ewGvEu5Ee8WI1WbLUBcmldeb1Q+8wHvkVhAPRU/JpJCbSXaVUwvOMa4CCXgzcCzEhPLEMRJqyWjF+1eHwE78ZspJlJ9vrq7xzuJV4U1v717MA7dFur6TnFKnTUPAsfexa1vN/AgU5QVvF6xoE9Sw+ltXeezIcdE+5jFErhr+Mt/i9I3bmtXu8nN1FbP18JU7TKftklHprLD0IIss9Ukt9VWSd2tY5NCLX7s9UZ+0SHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi1Cupzhe2kXXmf7z7ZZgTby9eoH+i8Uupx1swiNzKs=;
 b=PShUEiTFdGni+RX2oKypoq7egyw5+gIJdksCTwyjsY+a3PMNjIa1j+/gLrQFbrmi5bq1F+ZSABP2mRrTnXVx7e35jztmF3E2V2rudtIGeSM2gtgK8XIE92mpHSXXeiPlnB9xUfZ2F/HWQFt6sr1bVLfhm5z8hu8X+/5iAZ4iH44iqVW3ZkCDPgT9MXAaFdJr7grsLBUKtW4qbY4buxvgw+jjJu6VNJFE4zkc29ZtXhZ5lw53WD5QTQGKDQ+w2z6Vb4uv1fiPd/e42w5WUd3C1z9D2wbtDh4yZXAzYWZGX8tYNEU7COK6FA1H58OeXYFb1UBwnMC5xE8Z2RCxYqTJ3w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by PA1PR04MB10099.eurprd04.prod.outlook.com (2603:10a6:102:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 09:03:51 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:03:48 +0000
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
Subject: [PATCH v6 5/9] irqchip/imx-irqsteer: Mask all interrupts in probe()
Date: Thu,  8 Oct 2026 18:02:27 +0900
Message-Id: <20261008090231.796511-6-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0100.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::7) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|PA1PR04MB10099:EE_
X-MS-Office365-Filtering-Correlation-Id: 53502c3e-28de-40c8-eb5e-08df251b1099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bA/SxHNX59eFL97vd2bVKx3DUyKuxe1A+Epzc2Tl6301QeHDRQe2VFjnvkBnUzfHXP7la27k8qz2VsCpN5emoRpkZbDWM/jXSTZWFNzjOhC3Gupi0sQprHxlQa3YqWf5GbyHjVpBzgHNlBspN/PjfqgVhqTLg4tROB+YMbnLkhep4NRU02WEwrOIRHd8+ALao0bDEbdbDLHQR2JPS3Cfhn7S2ENUqsNdZHx2b6Ten0axW1/i7XTxA7DkjnKwaLRdvno8RPSr0m2X9z9LbooftxW/UbgNgVqZIeggZLMY1XB49B5gSPlaZjLXQjxsff9qwiwv6QJ2sp8MNOvWmlRg3oph4daz6eTJIIw+aMdrzH+CFpmSzaTMXCEzSdwZFWB4UubqnWBJxEqZdBTbSc9PvbTCeL7mROhTnj6ebXWnFCB9Sh9bOr/tQQlsB8lxJB0lu5s0H/PkPw8vMOFLx6bHKEf72ICN8LRo7agqMwoTCo2RtCdDfaWNF+d9Bvb17PHgZxltTZsiwi/6K181RME9OQK2UxpP3hdy0Y4w4dUFZrAWf9uVElfNruK6kgf7RDQkyllWd3uS482FDPJaDCvg8a6zlDPV5Kft8UGkinO/g2HGjn9N8Mgabn2gg3H3Kk/M9hQG+wuI+DNgK40t2yFoe3U520zwv95YO0ixPgHBju4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hjyu6Hug9laTgHOx1RzlByAvYE6S8RBcQ8RUEy8DNvVr6o8w2WVcX1Z8xi6h?=
 =?us-ascii?Q?DLTZxZoUr9o5pBhhlpMSvYeC5I+0GLKutBksITcNrBNR/j+Wa0rD9nVR7Sh+?=
 =?us-ascii?Q?cJ3HwQUBQdCAKjoRNQDxGQhPTdcCRxZzOx5jru8bQKlFItFtwTaBgTnEmd54?=
 =?us-ascii?Q?VTLiEszPdjGxavyvevqDPUp0Ptk1mkqQumMm55Al1NvKvwKg5Cy/j3lIxeLG?=
 =?us-ascii?Q?0GKOn4WHq/KSmbPKcoiX4eNChwjafAE6vuUlwCuzZxTWYWojLuSXLlEyxM30?=
 =?us-ascii?Q?JtN4jXyuYy1r6SlP69fQUqBlA6YGkiAoEiTrNI3tCl2v92dKjygUjaxbXgcy?=
 =?us-ascii?Q?fkaeX6/rXzKcLuDQnaDhncOwhgHXST7tbMuwewt85yAr82n98/FeGkyMP0K/?=
 =?us-ascii?Q?qb47AuBSvTVep/3qAFLmXAGb4xpzZVxICbS8kW/swqac9lUEsf7LUb2/Vo7q?=
 =?us-ascii?Q?IH6idGg+ynrvYfPXhqRYREyo1J2Y7jIt1/DmD18Rg4FAfCHSI3J5xhlJVIn3?=
 =?us-ascii?Q?aNZToFX487oVRownbalcRVtpEhck7ky+VJWZUdsGEotNiMYE5df2t4U5d3lz?=
 =?us-ascii?Q?KjnYxFJnmi3W03od3FriyfloZSv3mwGEJ4m2nYLc7J1zIlZOPQh+ZyHQykG/?=
 =?us-ascii?Q?9u3o2/Tzx8uaqg5yUphvCPQ8Tkbz8XZInmEfWsJMewWIgt53hAgfb5wOeihH?=
 =?us-ascii?Q?I6Hd6l0aWwM+Qa25mM48W8geOFPd38Oyg9mxkZrflLJAMnJbjSFZOfuClSKa?=
 =?us-ascii?Q?Mu/8NvJT11sk2WZhqUcgDwkU2lxq8dcs8bsZswHlqFZWHr/OpT9/zwqvgrWl?=
 =?us-ascii?Q?j0P5yqbNbyAi3s7T+ivi2kS/cdYLzc/zhG3pNCyclbxByamLe0YkxZY5j4ks?=
 =?us-ascii?Q?kG8I4NyVH58/V92EqqToiemA2bO73XMHkT38BTlOJg35rOWCfg/GIgwR1TJz?=
 =?us-ascii?Q?xcjcK12XP4Sh4H2bDxXOV8NdbOlnqh+PL/RCi247knrV2r7BblYID7y1MebL?=
 =?us-ascii?Q?xVXHOm7RCcwly+VcTfMjE3RncI5AKnrnRQn1MYM2Ze0/ertBWVZDCGmT1CJd?=
 =?us-ascii?Q?Jv1VcYRIAXSBN4NqKlEmQBIR3EEvK9B18ZC+Q1Hh6+3MlmUc1Y3WS2gmt3qK?=
 =?us-ascii?Q?PqnUagBMLQO9jDlUkVrETWD4IeqCsnO0rZKI5GceVgOSBpG7BxcWJIFVAusV?=
 =?us-ascii?Q?zOKE8sjEBx39QYhIPhyjXvWRB1TiRgA0mCejYgKei5oO1c9qg00TyGyTMDAC?=
 =?us-ascii?Q?3sNTxZLVidwhhXVbklS/zrZyrRzA4JSbnwXlu9vHfSRDjZ2DylYXGf3UM7UC?=
 =?us-ascii?Q?sRWpER12zGU3CnzqYnF1Sc4Ah0CUe4Dbc5GuF5JlrwYCiyjb0X7ioUiE+y++?=
 =?us-ascii?Q?YSRqbvzGIQWEJdGqkvqn3TFIYiH+lxQhjUnMrGYkZahIOZPZSvE7HmYSE9gy?=
 =?us-ascii?Q?bq0gRN4/0BosZv/e+1qy/4nibghe3A0FJ2HJYTTscoi8iswCIn+qAS4aPc2H?=
 =?us-ascii?Q?AZT0pBzkdsiwEnk5TEaN9Yo7dNDRsxHlpDAqH4/HfE1iVcAS2CpQ6WcEIqNi?=
 =?us-ascii?Q?PaTGLFmn43go+IjUl24aW2OYVp/kTorzRuZ/cTZEBcZnf8WWVKYm4Iv3esp1?=
 =?us-ascii?Q?5A8D57VL1uR4TND43uLSSHKYW5OSYRj4LZmSNEO0fY+JkgIcHvWUkF1wv8MM?=
 =?us-ascii?Q?6iO03OtXlSlkrfhKlM/M0oSdkQT6ZY6UMWG/0rpnrAZIcUIPdjjVAtwieM97?=
 =?us-ascii?Q?x5RCm3GxoOkQwU84zP78rTe1wsHoc/S7DEHAd0a7gD8ryhQntOkq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53502c3e-28de-40c8-eb5e-08df251b1099
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:03:48.3827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjJg33SQfcp+R7/57QuAEp4U2LbeyfldqoCoRvYGECnJ9PDak8svaelP4nxDtz7krlN+/0a/Oh9SKYB5VlGpR4H58Ag9wRgopVcyJI/k1iMJuUc8SROhF/JvxctvN3TK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10099

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

probe() sets up the chained handlers without first masking the input
interrupts. For a built-in driver this happened to be harmless because
CHANMASK resets to all-masked, but once the driver can be unloaded and
reloaded a child interrupt left unmasked at unload time survives in
hardware. On the next probe() the parent interrupts are re-mapped and
unmasked before the new domain is ready, so a still-asserted line
immediately storms the parent with no handler to service it.

Mask all interrupts in probe() before wiring up the chained handlers.
CHANMASK uses inverted polarity (a set bit enables the interrupt), so
masking means writing zero. This mirrors the sibling NXP chained mux
irq-imx-intmux.c, which masks all sources at probe() time.

Masking is only done in probe(), not in remove(): the next probe()
quiesces the hardware before it re-maps and unmasks the parent
interrupts, which is the only window in which a stale line could storm.
Masking in remove() would also mean touching CHANMASK while the device
may already be runtime-suspended with the clock gated.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-imx-irqsteer.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 5acc04504e52..fa233de9bc2b 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -239,6 +239,14 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
+	/*
+	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
+	 * has inverted polarity (a set bit enables the interrupt), so writing
+	 * zero masks the source.
+	 */
+	for (i = 0; i < data->reg_num; i++)
+		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
+
 	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
 	if (ret)
 		goto out;
-- 
2.34.1

