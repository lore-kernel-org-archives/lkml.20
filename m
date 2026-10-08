Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B5347C10B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450220; cv=fail; b=g5Hj0b2Otwy01nP+hoh++Uv8UqLXEKQKC2W0MzrEkxVwJeflyAVlOHUHY0fgYLbh9VfNpKVMj5VXgWtAdbsL3RjRaweixYymoV4I+0UmVoocfS5kO1FV/oTUN+9nSPs0mgQaxH5BZ/MPgCkdeS/D2haYHPDR3h1oN5p5socaKqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450220; c=relaxed/simple;
	bh=afzhKkysXacHoaQxTOe1rPPYYHBIhaL6xDof9gNewls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZmXJLGJEMWV0GanZ8y+30zo+Fp4iTdVNV7ajtBWXT+FakChaCfk/BghQZOZAM+1WwrJAg1P+CJpr7O9zSOcQx4PRSA1SV4F/mI6jczaW8t/4kOe0L3aJjekxY+YXoztXhxdsaWgrGjgR8EshpBc4TWHH/jDVI66VQGY4q6geCvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OOM7eCVl; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OOM7eCVl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYlyKX5YH2LcrJ6+8n0H9xYj28KGqhbw+UzepZvpFnvpyNLN+sKEIrmU0BL5l15ky4aTOl/qmA5GvzavgcwMtGLWG0tPvkgapIT706W9j+bhT/9lu4t5zIJzDZyHXx/l/LT1XS5FzM6r6v4SRNIVGTOKjbiZGBEBUb/pvEF7ovfZ7rTRRsGtez9JlmLNWD3cngpa0kblVXjR9dKzwrZUKVRb+0E9si8bZKhKiClOB/81vW+JSxJP8NILj/9B3kxxnhdr3ZkFCFyxmjoimicXzzeY/BLwhSoLKead0xD6gGQa2MTKVJ/FAqJPrRYWpEUD4vtEc5ZPJNakmBTrtpWugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85gy66KCSAlErNKHgfO2oIZQOBARYbPwDov2n55zZic=;
 b=rKzKY6xjOZGsc/PXu2HwhF4+cOl5A/iW7gvYGwkfoaRqm8P7x77r6XGojf8X5jlus/6HsuF6jnRgJgqwhzg+xrIxsoWvaGaPwgbX+J3i5x4SskjsV64b1CGwUqLombl9Ltrh19fAsGcvcSZV47N49t01L4MHuUSf9qTyUKAeCwULlMlkBByjojS1Z/Qis2i7Ta/uXjrgrskqbQbt6H+LQFC1wTb3w3W7Mybid5+TLed61kpAta6OJ3rxpI4SEI9coGm7vfp5nsxFodkyaT/m2/7QH5w9BWINInFUk7zRAX90RN7rwp8Odc2/Cl/uFJcID39QbUd/47O6TomTZYuSig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85gy66KCSAlErNKHgfO2oIZQOBARYbPwDov2n55zZic=;
 b=OOM7eCVl03lx0NDrKZHZudnepvQrgNGfw6hZTHAI5z5A1vZe7QJCuKmiLHLEazVA5gGjwitldywNGg/7TZ8nX8EEspCDPvAFMpFVyHYLNJJ/ZVSO+Oe4jOhIEh03VxpIFHfsp0uXdmBnufH27UpPKR9GyDfnIs0kXoY5HSa2unEXJfGRGElos+VhKjpQ1vkva9u4d2pNEY3fbaP59AeoiC/DastFdQMcNdIlPkuFY9Zm8D/x6ZnGA8jWsXsE/GHT0T0ESsHm3yNgQp9uj1VZEFkIrpInxsJFmnvlzCbfDxu39gAzQX/8irOPmC+lGh+/Nc+DlZv8SPTBVxuNMm0fDQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by PA1PR04MB10099.eurprd04.prod.outlook.com (2603:10a6:102:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 09:03:31 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:03:31 +0000
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
Subject: [PATCH v6 3/9] irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()
Date: Thu,  8 Oct 2026 18:02:25 +0900
Message-Id: <20261008090231.796511-4-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0294.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::8) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|PA1PR04MB10099:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b4502f-9677-4620-23d0-08df251b0659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|11063799006|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4SHKpv+BgLudoCErsHpVTeN4QPflZ6v6nRgIhlP7fxnZjd7BgFa5hmzb10USBtfw6DRYibdGLqMVG8PkIWi6wFAt++BeBpemoqtXtx97ZeDG/R7O4D2lQg+/rwitzX3hVQMiZ9bcrvcY+d7SON37hdVPF907iNCO+aegK+okpTeFn9SgZPhCwh6666fKaNcMqukhr7E/pWg/vZdjVK0reEf3nADxNLVrP2e/tIFP0n+zivQ8xe9GdWIAw/odcxs+CUTgQGgYevhwjv2Gb1/YImpki1AnveoWp6t7H1qX8Z82iULDucXKB4kUi+Ed8eSVwWpDw5e1CQJxUXSLcmT7PXNuhmclS7ScB64dhNuk2zmzP4z6dkXPtfdSYpZ8e2FLo85yp/EaBaiRVhTI6GNvllLQW61FndK7WMontxM2zGaSNDr/2WeyKUkvMIWedlY5oSI9XNbcBToR7L28t4jRoryKRoOXJMrw/iBfTT5D4OiLy+EhnKATiczLkIpq9SBeZv0zmgcvdXOQ/ldLafkqXjlwra7q88+LBCa2fcWRnCnBY2NxpBn/glMr6N0o4rzaoRtZ1yuoSl5bUWpm/ynP1FLsypBUTGFzwyT3V+GBmi+yOX3NWaVvdySYm21+JgUjSPEJ5Pz3/i+5iRywcz/5nrIrd5/vbOjqTH83/2SnjN4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m6WRnjsNvbdUbPlMTfa1VLbGlwe24eJnTSyNtZEcGtDv2n7mLFxgG76rTlzd?=
 =?us-ascii?Q?kqsdJ6XMUQctSjbQ55rY50m2kpHXSA+MgC6tXFlnrGBPE/MNz+2/ekn/nk4t?=
 =?us-ascii?Q?IAfCNCmnjWrt9aSKFzPw2ghruUUE6T0p288Nqa0ZkFYrPaUNGNQt+SQUGLni?=
 =?us-ascii?Q?12rUYA8L4FuK5cz/OFeM0l42alszWIQIAxt4Xy7IbDOEVrUJa/PUsu7pJBFI?=
 =?us-ascii?Q?wcn3qcrK/Dp6athFFxHMh10R9c72gXuxt6lkNFBMkOOZCSMySL6Vmt7Yt/1y?=
 =?us-ascii?Q?3iLob6RVRUKea280PdESfRfjODJdboJ7zbQhttThieCZnrClSP/zINjhkffj?=
 =?us-ascii?Q?or1aTX0NQAxu33ov2xfXFl+/uVN6jopuU2XNukW/emrGpCmiMgBOmD2+W9DR?=
 =?us-ascii?Q?tZ4UrZByrqNO3Sm4PaupGZzuFvp3Z3OHlYYF1LZjn7+JnVmn01FqoXakg7Et?=
 =?us-ascii?Q?c18dkiTBrZGbl66b0BuB4pokGVQevH0pJEfKAKHO7t446TQP4KUqM1v/EE9B?=
 =?us-ascii?Q?WW7Jq+8zdD9J4eg/bxiHZ27GR1KTT7lVP730zW2uRgmUnI3dlyLo8Qbnm8dh?=
 =?us-ascii?Q?p14mE5i2Mma7F4YHnvVrxHjn2YN/IF3Mgu4RXjwMtNzdZGF9G9G6mFs5cI6u?=
 =?us-ascii?Q?s5VColwyygHtf0ctskr98ttGyvYC16NpHrrt+PEzT0aVGZMUm4mYZaEgHeI6?=
 =?us-ascii?Q?u5pFjyaf41yBNN10d3Ql71CwJNsjP+6rKTW15VQA38RbPbUP+HFbALS8PRgP?=
 =?us-ascii?Q?dPNES7pSTSrpCEmRuQELBIKtXpH9AqsQe/i6hENLERyjq8BLvDtXF+dz9Rxb?=
 =?us-ascii?Q?0k3Ou1HaKAPWl5cVMhcgJ4yDHl4FKyhYlSoGuOHbKP7IFzISLIzaepSVJx6s?=
 =?us-ascii?Q?4kfSdXVWhQxLxF/oxsKIWuSi52FL7HtcRL7NJfNM2i4uPpnVNOT9vq7aHrjN?=
 =?us-ascii?Q?dM2DiJJy3MAfTrDlmNn4kCHzUVdekvSUN6y3anzxKu1O6Ptm6kTMIK2Fjzmm?=
 =?us-ascii?Q?31KjMjJ/jDdgTEz2GFNKwL1PovTDNhk4w2ODxJTgnmMBIdaAsDpUZFYjg0wz?=
 =?us-ascii?Q?z67ZqAy55qZglWtv2ynoE8sAWKBBrJCcNZ723/lq0urHRdsio3MqW4kp+Ykb?=
 =?us-ascii?Q?iCLMeUv0G1iDyRidIynZXuQi0/G+kvquvKR5wg7jTEr7ADm2+MPrijAB4yEc?=
 =?us-ascii?Q?AEF0aZ+IAZlEYyVwDK45jshT2fIIIP+B9VgxVxuZpv4ndOrS3t9dhotJILL/?=
 =?us-ascii?Q?z5HFrMaDiuE5ccl+wHCdcqXhORBUNqag5XhDeRZwUOi8LzcbryZOmBhitsf2?=
 =?us-ascii?Q?oklNObozlY4LajfbSW2mGsY6/2v+Tv6CN8LK/F/ut5dN28Y4+iwH/13LsLo4?=
 =?us-ascii?Q?yXXOpMb81iUa75PUkeeV6jYwERfV7B/XFkLu8qXbrz8n91sPiKr/vQRj0YRS?=
 =?us-ascii?Q?dA48NXMuvo1CLXeZTBtgxznTKhMwSY8DzXxPX8Sn/TCMVwSv8g/vUgmUWbG1?=
 =?us-ascii?Q?R5R1WwmZIs6qS5JtCb/WVkW/aa6GTonL/usKTuswY5ENeW4siDU3yRhRExca?=
 =?us-ascii?Q?PH97yBGXgzgEoJsF+0TOL3r98leYDeGOQN6Yf5amqgq75v7qGbhbclhe7v6m?=
 =?us-ascii?Q?FefjTzhgaYWc9aGgGaYxWqI8aMIb9szSSfJYYpIFFMQ3XfkKGfWwBuwv21VY?=
 =?us-ascii?Q?RNCdNCqrWS2Qk0nM2cdyx0/OqXHFYsjdhSYwFi0Xf/y1TSu0q6FIWypYeEjR?=
 =?us-ascii?Q?AMpS84j9CQIkjSKkyrjHCNYdR8xbTs99lBTjE8LdTeqsQQsSt/lo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b4502f-9677-4620-23d0-08df251b0659
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:03:31.3493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/cIux67JFLB3oG+emsoOfoDw/cwIJ70r9y4MM7T2OdBwhXezwWQzDFb/Dl+NmJ4phzvF0v0sc+yeAa7oSuj0XATfLuSIsfumdp4uEJJvocYwnxBXckLF0a7Kk1z3snS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10099

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

probe() maps the parent output interrupts with irq_of_parse_and_map(),
but remove() only unchains the handlers and never disposes of those
mappings, leaking them on unbind. The child mappings handed out by the
domain are freed by their consumers and, together with the domain, are
now torn down by devres, so remove() only has to dispose of the parent
mappings it created itself.

Dispose of the parent mappings alongside the chained-handler teardown.

Fixes: 0136afa08967 ("irqchip: Add driver for imx-irqsteer controller")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-imx-irqsteer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 766756e76c47..d05de3d26fb2 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -280,6 +280,7 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 
 		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
 						 NULL, NULL);
+		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
 
 	irq_domain_remove(irqsteer_data->domain);
-- 
2.34.1

