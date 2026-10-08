Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065C73F787E;
	Thu,  8 Oct 2026 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445544; cv=fail; b=GstjkWFeKsbmN+yxhHGjZiHZlruDkFdovOMR6HJRbX+cVNOyhiWErIzeMvmncQDqO0i3WbkpDVJKcezc2Icc069h0UzYyl1uBX0C2GoCJAVXe2RNAtz7f2pRktCtvORhuAV+OYhwgoz9yw8TNWJlbBb+ztdVWMjr4St37wjT3eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445544; c=relaxed/simple;
	bh=LO6R5WmRwRaZzbRCptIZYcn5DE6NDqiCo/RXElE0/DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aQI5IYg6ONlKZALcU+c+HK8TOyFTv+sqAGqtGYotIs9pNS6K5cECdT37OX3O+IHrroJUVRPERs2fpWmdJnswP/3mUYtAplUFUDERdn//mbusRBrdW+JRaSgg3qB+d2iWBCn59FybEwUTfYRn112tIm9fXy+XU1qFRyFVXhEGIdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZR7Y9jr0; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZR7Y9jr0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvYTZsHnOvMPj4jF+YYFtthcVwZAQt30z/5B9D1zlHIpRAJefOZkGahhsISUvZ2Jt59ZYAv85vLkYlCK5qUsjRPXE2X6y9vgl/jG4ABNNHjwAKHrlAZfSo1QuzCi/JDBiilvPdfncNEI4SZFDtfHTaKiVIzqN7gxmWXKFjVwceM1u4/vZf8WmzJYH087ZuBqJqwxMUC1eKgxmJf6SIZHMC8eZqFtarCTM0ZkH4kNI5Gm0V0BchXsm7jUn+Vgw8zANsDN5YBm5LILfjjpJPuU3tcNkDNcKR0ZpJ3wHVgbkecodnWnwEdaWZN2FaFhQp8qRg4JNRjEd/WePbZKDcqtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyEHzLxOJtcxgx3g8bvFASAvHBjkvXJwBuKlferE0PQ=;
 b=KppwgU262UGG0fHjN/7eBgH0WdQl2ptDHVQWxH1knNXMHii+MxOwZc6qm2HlLMdZatClhNofFlbR9jrKcG2NJFis2CZeN7w82dNBwpOwweYfW5sJCLv7FrchOVmf/6ZN+wuWdJgLq2fTlDHtkzUKY9vBpPsezHLL9ofsEJpBvP0KZrdS9BB2t3mj0Ii4zNA/6Yf91IlG3V/K+VYQcXBqfhjUsBMK2P7Gwy3sRGh/jCPRp+ltc/aPlkt9WexcqKDmKTarOZCeaPj9gK8eL/t/g5pQvOQWmJHLLZZ2NfBaLgm1OlT3pO8oEE1dL9VMXanHGlDn/dgjCYVqgVgwaAXzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyEHzLxOJtcxgx3g8bvFASAvHBjkvXJwBuKlferE0PQ=;
 b=ZR7Y9jr0S+mpCl8Nmm3CchRW+2m5zAS5QbP1iiUBpuS8uxbEnohwlUQpYFv+4J++oT3h6KkXP0f63rf2OLORUk6ilXOb2GBIg88y0nqN9MkSKgEbEhwVr7IlmcM96t94+koiJKxavu8cWWEUs/vLxVk+tvEQYD36pZbkWbju6s8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYRPR01MB12525.jpnprd01.prod.outlook.com (2603:1096:405:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 07:45:39 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 07:45:39 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@lysator.liu.se>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] reset: rzv2h-usb2phy: Add suspend/resume support
Date: Thu,  8 Oct 2026 09:44:46 +0200
Message-ID: <da95bad94c99855b960b3566c07671f8c15d5dea.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0502CA0004.eurprd05.prod.outlook.com
 (2603:10a6:803:1::17) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYRPR01MB12525:EE_
X-MS-Office365-Filtering-Correlation-Id: 451f85fd-0d1c-442a-9636-08df25102580
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|52116014|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	xB4Vr6Z0BOqD9+PquS1pR3CPhE0/5W/sbvxaH31KAqk/uO4e1Qzg1Z9Fz8NCwxfWaLL8aETZKlSQNHfy63dMRPHhC02oXX+kHED30Lmu9ozNjLOAw9svUTfFvva6gB7/kk+5LKYTwSXqVaDcltP0K1Idsxx/6cqmGkeOeDdDfAvsY3G9+B8TCoNodUeOoJTrLLyyw8t7NYjEUAgKQzMIxrzgpH3ZsujJCP+gQnyDJDD1kpWXv3/0DdW9lkefq4ii+65aZ3n16U5V4VN0crNItzxEjot9wIljkzNsY8xy3eyUDa2XR+AUmiyAHkO+F9tLEnLQs9UeRECCO6/J3bTZoGZsI0yPCRouLzI4dMNl8s9SWYTD5vZoJ8w2JKjCY0ES8O2fZZjTeuCvwASzo5loHsvzkO0iq0Cco0ox9aiAK82oyZp7+MsSiAZ7/GBSyQIeBY8HvrGbGibrfTd88WFIJBLVgpz8vYOFoetPfXHW2G/r5NuzQZQkthyrdsIhwhCJRfoqAln/J559wYunxoiCVKJR/uWthUYr8AB0iQQlboU5GtwODM5Jz65gqntna1BMBFh/i/G25ZDmjUl1FE7CF76Ep2Ibq5OOoJqth3UCx332jL159X+m3O0LgmjhZu5OnYxTJsQfr6W1+1HN3QD3oiDzd526wsctdd//r+OVkW7O699EiV/dxGhp89xNZbaJXCBPRPedIANOreUwqmXyfjdGydp5JbArlzoqCFrbRc8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(52116014)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MKCPVEvtGXyfEMRJcOJfAoSmXRt0lp2WYTQ13xKUWGo0G93QEEiKnKzoGc68?=
 =?us-ascii?Q?kPHqlG2fnSUYiVqDsqqRJW0HBcdSAE9BgGFug5A8W5m0dtsGGyepSTtMF6Lu?=
 =?us-ascii?Q?vuj1K4VB2U2c8JZYi2Vux4+zYKYZgEdDpWv6ubH03LS1LV8wgFyWJEsDOKJp?=
 =?us-ascii?Q?vTjfHvZ2756U2kIgW5V0tIpggNAaYja4PIIYezsvdpABp7i4t+A/lM+z1bhW?=
 =?us-ascii?Q?PHksT5ZpFVqizM0sUyfy2+3oTQIfx7yB0k7RwESFzRC8h28vOFEtFhGJozSl?=
 =?us-ascii?Q?LOTuZh3Nbcpsn2p79JpCqhH3B+Dg66G4KAlGDOom5Z+ooCj4OAHuygexA6t7?=
 =?us-ascii?Q?WPcJ6VsrDCTgNu96KJeSGoUv6qaLJKZz7svQXVM1tsFdu6cBo4Nhq8+WjPba?=
 =?us-ascii?Q?nRUFJbclfxD+zuJlyNh4SC9+ve3CIT8ziKFASB4VVS41b6s4HqZCuZdqNAhv?=
 =?us-ascii?Q?MDz+2+Z+y9jEoZv1A2iwpHFMkHpJ7kxuEJFyarLvQNnCY2zOqB1y6U4/MMhe?=
 =?us-ascii?Q?ZH/SxpB3I/PTxj5ifdMS7KEMgEOSsRcf1quzouHTmAAwPgvmpjulqsEndttH?=
 =?us-ascii?Q?TcW9fRCqi++vK/CsNh1o+b5Seu9xlITOkxvAopWTHo81CqmJjOrVP959OjHc?=
 =?us-ascii?Q?6md5fdi3Cj78nmomcs0sH00qLjFtRW1DdhShQt0E2DdeBPeCU2Ma2+bSZLLh?=
 =?us-ascii?Q?B2cXWi0YteMHSUpeiz9P6shfUqjxGapTCzR6tcRL87H0JjZxhJMlQnt36lqM?=
 =?us-ascii?Q?+W+YXccf4hLNf4ugfRP826JagdD4n6ZZr+PB7hGU879fdlgVGLYFKDYTbKqn?=
 =?us-ascii?Q?p+vIO+eMBgnzKwTd9cF6tjN3pQHL4Sw5Sq0GizCmeXOOwFseMvkkrhq8VRry?=
 =?us-ascii?Q?c2icHYyF7C2kombJS2dDNNA6Yt1ALg/B1hpkw+QFiZOMh23hXG7mRnaMqCzq?=
 =?us-ascii?Q?oppBpGR8R0nVkfredIc7QrTIdJtqhI54f1ifHFv1UZG2fVsE+JWV3QmGe6e6?=
 =?us-ascii?Q?AnJuAGwgxx7HEJgaP1gV+Fr7iDpLB/QRGcOH2DJPva54M+sp0OgE6nk4j0gl?=
 =?us-ascii?Q?HcgzTi2q0lc64da6m+JocexDyqaVhXTgFkQ0GOqHxzDu8N5+9QFZo8kFkIUT?=
 =?us-ascii?Q?pq1pxta3CXy4N0Qq33bUvcxKdI05nP0RPvpFqJbrBby7po0Qb/CVgHhmD97V?=
 =?us-ascii?Q?SRNRtj+kJ7sSyPhpXuZ36dmVej/ct1DxlQb/dYi7w8NknDqo/Us6E+pFp5yz?=
 =?us-ascii?Q?tuQIo0c3WR7mSEEjTQn5jluOf2iodxk2vmLLTVVHMSCPu5kypXnDi0NlHyTD?=
 =?us-ascii?Q?Xs+QV6C+Bgi1M1eUlF17Q12TyQ3riW6LjIyKbJrCmnkHZ3Riy1rYmUA2yWyD?=
 =?us-ascii?Q?6rhtZjZ2dkFxfpem9KJOt6o9dLV3YxeET/MN/NXbj76++wFJIauaAQn6g5x9?=
 =?us-ascii?Q?gHGGHJ6NB7ZwcTS1CYNeBFIoOb0u5H+zE/h7hgfwh3fnstJRhX6VR/am7a/u?=
 =?us-ascii?Q?XNlldKDBIdpIrthLC9eD1spw4JQvDQQzhOZUEuQZ/n5GFRgcBpPtc96fwO7T?=
 =?us-ascii?Q?x4YjvEedVZRgJPr8RuD2YscgxoZl8/cG6y2jEXhOjuojYa8Ie872y7VS5fC/?=
 =?us-ascii?Q?W58GTaRNMYQK93TKMRTgV4k+qILq0PtOTGGBix0LDBXpmYCuIDqQwUJUAaOq?=
 =?us-ascii?Q?ZCcuZ0sOe/4ddhJP0skSnZLcYRcw6ruaYJCNfNVyVNaZ+2yIZDwOU5yYCC6F?=
 =?us-ascii?Q?BXMwZ7BRn3vPS+76NTq7Cyji3J3w1/2GRsL8+kuy00tuOSnhFJuy?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451f85fd-0d1c-442a-9636-08df25102580
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 07:45:39.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAvQchtQrBvKuQeMfzlmK+xa1KKIks+PMOc+lZFh5y92KQL6ZWsbcNdPY/JwjKFZy4WfLCk7R+2CPLfvbk1aUsDaIbfMsVB3Ws9ytw+L8i9m7lCLeIjSi00i4wCp/5V9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12525

The RZ/V2H(P) USB2PHY reset driver is also used on the RZ/G3E SoC,
where deep sleep turns off power to the USB2PHY block.
Part of the initialization sequence written at probe time is cleared,
leaving the PHY unprepared to receive assert and deassert requests.

Add suspend/resume support to assert the reset on suspend, and to
deassert it and rewrite the initialization sequence on resume.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/reset/reset-rzv2h-usb2phy.c | 61 +++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index d96042e28cd5..c14c3fcd7875 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -37,6 +37,7 @@ struct rzv2h_usb2phy_reset_priv {
 	const struct rzv2h_usb2phy_reset_of_data *data;
 	struct regmap *regmap;
 	struct device *dev;
+	struct reset_control *rstc;
 	struct reset_controller_dev rcdev;
 };
 
@@ -132,7 +133,6 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	const struct rzv2h_usb2phy_reset_of_data *data;
 	struct rzv2h_usb2phy_reset_priv *priv;
 	struct device *dev = &pdev->dev;
-	struct reset_control *rstc;
 	void __iomem *base;
 	int error;
 
@@ -151,9 +151,9 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-	rstc = devm_reset_control_get_shared_deasserted(dev, NULL);
-	if (IS_ERR(rstc))
-		return dev_err_probe(dev, PTR_ERR(rstc),
+	priv->rstc = devm_reset_control_get_shared_deasserted(dev, NULL);
+	if (IS_ERR(priv->rstc))
+		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get deasserted reset\n");
 
 	error = devm_pm_runtime_enable(dev);
@@ -188,6 +188,8 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "could not register aux mux\n");
 
+	platform_set_drvdata(pdev, priv);
+
 	return 0;
 }
 
@@ -229,10 +231,61 @@ static const struct of_device_id rzv2h_usb2phy_reset_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rzv2h_usb2phy_reset_of_match);
 
+static int rzv2h_usb2phy_reset_suspend(struct device *dev)
+{
+	struct rzv2h_usb2phy_reset_priv *priv = dev_get_drvdata(dev);
+	int error;
+
+	error = reset_control_assert(priv->rstc);
+	if (error)
+		return error;
+
+	error = pm_runtime_put_sync(dev);
+	if (error < 0) {
+		pm_runtime_get_noresume(dev);
+		reset_control_deassert(priv->rstc);
+		return error;
+	}
+
+	return 0;
+}
+
+static int rzv2h_usb2phy_reset_resume(struct device *dev)
+{
+	struct rzv2h_usb2phy_reset_priv *priv = dev_get_drvdata(dev);
+	int error;
+
+	error = pm_runtime_resume_and_get(dev);
+	if (error)
+		return error;
+
+	error = reset_control_deassert(priv->rstc);
+	if (error)
+		goto rpm_put;
+
+	error = regmap_multi_reg_write(priv->regmap, priv->data->init_seq,
+				       priv->data->init_nseq);
+	if (error)
+		goto reset_assert;
+
+	return 0;
+
+reset_assert:
+	reset_control_assert(priv->rstc);
+rpm_put:
+	pm_runtime_put_sync(dev);
+	return error;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rzv2h_usb2phy_reset_pm_ops,
+				rzv2h_usb2phy_reset_suspend,
+				rzv2h_usb2phy_reset_resume);
+
 static struct platform_driver rzv2h_usb2phy_reset_driver = {
 	.driver = {
 		.name		= "rzv2h_usb2phy_reset",
 		.of_match_table	= rzv2h_usb2phy_reset_of_match,
+		.pm		= pm_sleep_ptr(&rzv2h_usb2phy_reset_pm_ops),
 	},
 	.probe = rzv2h_usb2phy_reset_probe,
 };
-- 
2.54.0

