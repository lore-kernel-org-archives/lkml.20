Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777898;
	b=5a/THlIJaUKV6be8MLozh/UU9jK/bRd6fZOaOlrtvIdYXxOTJjnwF4tWsuV2y53I1LwC
	 wLBT1teTQ0tp3lixPGrXn7if7wjd9k8ksqN/h/h/hG4uBvfMnhXna+86YfQYlK7mLnYdr
	 zZqJkKQx3G11YvpcDNVos8yhk/rE6XLUn2f/Z2LyopfCzAF5rzSfuu4OrL/FTHvRsOCfy
	 MhCiq2nipnHyVNrChzrMhz/2vwQwFwo2GMO/MFi/JoEgLLSVdfR7I7hoMCG9oLUw7uuWG
	 5XtJWZtJc0BUVubTJ1WDb5lSPqs29g4o5S9hep9R/uonEOCzTe4Hn3blsfsBUiHn8bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777898;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UzQfDTRTmS+gaX7dqM9/WJ8Qsplgm21FfSEcaEcN9j4=;
	b=U0CKeLub7ENkpoRV82HhNmC/0zFAkiWjvN3W4rrMEtEgvs3+umGq5T2Yboj7qHqkuAbi
	 d7CMOUPbreoDfUK7yzqZqu7R61REQ04J/q5pW2uM3n5VLUGdoR34pPV9IsWBjMMPdS3ww
	 WW6GYwv/JZKNZHcrOxssnRWlPVMWWWCSaJPAKPH7aKUzdiC3Tp+QnNS1RRRfB78zLZN54
	 yQcxVuSO93TH4k+PYScmDEcFxTGRz3CAAmpUXI46pWaQzPZS2RYZZtP7nmYvJG3IDbOHw
	 AyZpUXCBWaMfZIVLk405CCtslPMvCtnoNBurKcHAChF9AlbnzzQqU9PvkNwAt7JHNAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Cfp+gkfy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.67
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D46606D802
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D46606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Cfp+gkfy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxFDaszw6h6+jF1vhYb7DC5HYhiM3/3DHfwQP7Iz86kyKJMLU8h5ClGmMiWkRLKgDBaaqucp9y3bcFM2ixzORuLzRtV2f/uvn5egeABwInPb+UOCWkJurO+TDgodFPpUx3aHosSjoOHK/toqNRBXo3N972TS1orUHtbhI8sM8GvquwKshGmNWg/S5+PNsn2ts2LjtCQMGA1ZXNwpGtdd8F6CulouaQaihZ04A+41fg/JxrxYBfauUkQMvZZY6w0l5UkTFYwX5FiKQ5RlBHHQVSB3Gscu5lG4eCL6M3me0OFIfDTuEDrVLRqvOURa+QNNFin+zLzXzwKYcclzKLwjlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzQfDTRTmS+gaX7dqM9/WJ8Qsplgm21FfSEcaEcN9j4=;
 b=fO9sFnMg2pqvt+7yHO95+4Ng6YZciHrEAhvQKRryF/NKzVwP8mDL7aE9+wQz9lnkKmlVQ08V+QUNbSyPbkad195tBrWyuknTlwwVxemQeEEz8ODNzg9rekX7Dc9LGO/s31kDS9SGePk7nDo9C673jP20vjiRHe1EvrPgKfvbAyQCCeRUKjfhb1Ihl6LAM+RmMcjwhOL2/TeTPmqZ1KibvBFInM512MlfhZPKD4yPqoFeWxQx3Lv7QcH23evXmzG8GFDTp0tQdc25dbegq5Vb3ZhHbUGDhAqFO8TMKU+MeNGTdgi4v63FR4rLds5SCbTHvsgfvIlK+mUFFXaNZPDVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzQfDTRTmS+gaX7dqM9/WJ8Qsplgm21FfSEcaEcN9j4=;
 b=Cfp+gkfy/Mb2+ke8zwqGi50lC6J8NtC25SFzpfyGw6mGuGEp9fv7raGU9sr8w54UnLzOkpFIGDKzjgpHrHSPgOZPwd72DIHviBgVpvZsAqHeyNyNM2xxwzsNIcJWeHE5hGy7O2YrZXTpvUz/dip0rD1ZpIQ14lXtcX7dhWcOmjFSP8zpt08s07CUT3SUmwMn1tyoaxdGWwu3t56hgdbOFQR5YODPPvaUrp9SKY5tLWHBBp9Zmy56u4i27qNyXUF2ILBzjEBzduRvBr6dJmZqYWqyklifw6o8fkHavm2avdJKzrF1bbKpQ9BmbPMuuFQ1DBxKqqf/fbjpMx+F7l0iMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:38:15 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:38:14 +0000
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
Subject: [PATCH v7 01/10] irqchip/imx-irqsteer: Call chained_irq_exit() on the handler error path
Date: Wed,  4 Nov 2026 16:37:49 +0900
Message-Id: <20261104073759.386777-2-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To AM0PR04MB6849.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6849:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: c6413cff-f9bd-4974-8c03-08df3a4695d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|3023799007|261102123227099003|11063799006|261026121527099003|261022075727099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|56012099006|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	gt/JDGuGTkTSFizJRnoH0aTXq3Qz/UjrdxztqozNYXjMuIkeNxvUJh6tPKs1Hy8ZT/oLVqwEsPhR68dcPQy9hkh9ztW2lCX+XRSfIiuciPhygG5vCUibqvuJIFF01mfoyki/SHb4m5WZUFPdLB1uJw9Bnvff5WPxE7UzC3KNgYVfj1Y/4rODKu31zPc2rlwrsyW9IaqP6s/bhTg0qrEVQQ9bfCc6L7AHzn3OlaSoFycMo6i/WQ3uPTZWVbocsem12IJR2HORjiJEP3KAMXermtLAgKpSCvCnJ/bs+trA1ypUmLsaBFAhECC6uo/yF3lcBMmgplZRtA5k93RSA2qfemsQLwoledO0MEQArkux8KKWaRXBEunAWud18Hch0KgAKHmpzo/clhkFkKmJk0jfBHsl0/AQ4PknjRL8pJ4HOAzB8i64gvw3ZKFQ5tHoAoazdO7NuTrh0e0PPjIL5VLnLSW2ogfnn2hq2lFjHrL58U+PVQ0rQfux5vJWBNAij+y7nrdHs9W8N6J2FgMnMmStwJ5pFqhXepXoNEQoBbyN2UawolKsxSBVI0upv1+Pu8goSIQTaOlGySh2D80tAEjV/D9VL+OvBogSf9qDZlU+MMGZHTRleLoEayoPkN4gASPOyr0DdzorQZvj/N8h/E557PwZB+FTa4r4rhAUsqk5/18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(261102123227099003)(11063799006)(261026121527099003)(261022075727099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2EdQ4WWo9YND6qMYfhFngcFjyVakPDnYy6LAnX6+/Fde6vJYIPY3rxF1e/ql?=
 =?us-ascii?Q?00B62K3F16dIGHJDznthkJxVoWZQA09TT3VqgG1Ys5RedQouOhKnrcJD51oc?=
 =?us-ascii?Q?A7rEXf576PNixYJvKoOns+5+vQzy5Zsk0c8Qm1vkrH8bxtv/HWJgCcMF3zVy?=
 =?us-ascii?Q?ncWUt6TMBmEOWyWgEWQmfAqXrIx7gpsFIfFFn/eNn0FIEnhQwMwijTa1lZgy?=
 =?us-ascii?Q?LCyftT2VyF2nM535vHN/QfKUkZwhQiSVMd16NuJFW+wpnMf8LSfhMhP3HjMh?=
 =?us-ascii?Q?lMINJAcgeqIn0hPG8wYkE9lvJk3HWhgJ/1Xdb389s1TP4L0dIN7OKv9FgfeT?=
 =?us-ascii?Q?x5FZHWd5VX6RtFVo1QzNT/zIDZlwcKCg9yKiK2xE5kgA7w+wHemXD6SzkJMp?=
 =?us-ascii?Q?kbsDZZqUjWFogR+ODVvcRbhtJPyGCTIlBHbgH59fF44Hwgij6xTy8PW7C52o?=
 =?us-ascii?Q?y/HdgKovC0WJ+V1VtOTmujdT3ucZJ3FdgSRDB1J2I/JW4YxS6N9SK/QnWcOr?=
 =?us-ascii?Q?YzBRDeDN+mPruXHmV7HfsXmfRsN9T4H0FjRrpVMXwOZonBqUUnXLQ64WiyS5?=
 =?us-ascii?Q?1RdXEbKZKnt+V1UFoC+bHOVR7StyL208WUSlTHBZ+JMW/JPbkQRzosaAxmrT?=
 =?us-ascii?Q?rnPgpIsDultlJUgdniK+M1QoeICBDy1NPSDEynM2NE2yZUGnadNk08f8kLAo?=
 =?us-ascii?Q?/U1tnWMgcFznmsDHEkEoLnnR3OrqYmhRI7lLA28wRKkfi2dvqblwHTDZ/9jB?=
 =?us-ascii?Q?So035vJYebhMS7w36u5VLDLDPpXtzkDOaJHBC/UzdRfeg5dmnG5iqQL6O+AR?=
 =?us-ascii?Q?9elEM6+WgNkmVWJHhnUDbkYBaveOL0X7fUxWjxrIf0rz7gqU52nkdz1wpelz?=
 =?us-ascii?Q?wWmC8K3E6MKB4CaROzxBwWW9m4RZXBF/dsp+el6wGFhkqVo9p+qYXvJnjvNT?=
 =?us-ascii?Q?KMg9V95tfpvYK9FVvfw60V/MitQvTERvVfa4i3XXllTzklx7kpKjt6QJSbGG?=
 =?us-ascii?Q?2yehjvRMbYAOG5oxnh1SrHT55gvkniCsbRyy4Sy76kj81ObLiP1TDBB+Oev7?=
 =?us-ascii?Q?syZN+UQusQW3jZEAY1ZZC/gjltIM7ELvBa8y3GUq83YcnK3RHQ7sQzbZ18wA?=
 =?us-ascii?Q?HWgBv6ztRfwjvjCZNqVCWbj5UOFt77GQKmk5EehCq2NJu0rgKqPcHuw+nzao?=
 =?us-ascii?Q?+fSRmjSCYzKXQ8Lu/ZzHdZack9ynj/x7ga124ByeWcA041eZjL5BqSVNzXLl?=
 =?us-ascii?Q?wq2X5ywg2rLe8UaZbKJG0R2tkuvvuw05SsGsnUgFSSMyLXbMp13auDheO7+s?=
 =?us-ascii?Q?uy0P0Tt9w7FrR5l2AJzVhRySONe3af5mLeiSNFHAuPK/2ALPo7hhkBUNBrvM?=
 =?us-ascii?Q?eeipBc7Yekk6PaicwKVbI+L+JRf33H31QJejK699b/X3/OSJvACB38oPZUel?=
 =?us-ascii?Q?MfHyto5QBx6UxIrSmyYHA/ZD5yO09L5be63dzmtpj8PbBgEDx76hHlQfn8ye?=
 =?us-ascii?Q?9JbILILeZHyeh0o8UJ+cg5d6HV2JUY1K70J+FsKuhTjLFEfTwIR4oNUa0o8L?=
 =?us-ascii?Q?l8gRQOjKo9zUZ1L4P0uajnYVBykExXwPSzzLqRyqqPrA7omYex1DXsz2PWo/?=
 =?us-ascii?Q?Zhf+ho3Nkg6Hn9JYfd82ciTTQhfFawIclhJFaSbNQ90MU1PYCL9FgaoYb8B4?=
 =?us-ascii?Q?9Coqw6iNKevLWZlCf+YFV0IPopGGJ3hruYKKb3fLkSi+0WcoxBRRz1rm3w3+?=
 =?us-ascii?Q?fpSKuYG9zw7KWgKphaxq82bccDWpRzHWsqRS+ByaLg6bFONxvv+58AmHN9vz?=
X-MS-Exchange-AntiSpam-MessageData-1: kKHVA5l+4OTPtA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6413cff-f9bd-4974-8c03-08df3a4695d6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:14.9059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFEJaEVLUJ9VJtYicgxz+MhdN3rAfFlPyijsF3sFyL105eaFwzUd76a5Pxe/hAKiXA6e3myIKl5d0rcj8043e9JfvhdPft0UFK54/yr1QapWCzD+Zud6a6dVB1+CNKnW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

A chained handler must pair every chained_irq_enter() with a
chained_irq_exit() before returning, so that the parent interrupt's flow
control is completed (EOI for fasteoi parents, unmask for level-triggered
parents). Skipping it leaves the parent interrupt unacknowledged, blocking
further interrupts multiplexed through that line.

When imx_irqsteer_get_hwirq_base() fails, the handler returned early
without calling chained_irq_exit(). Route the error path through the
existing chained_irq_exit() so the parent interrupt is always completed
before returning.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-imx-irqsteer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..1b8d0c8eedb9 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -154,7 +154,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 	if (hwirq < 0) {
 		pr_warn("%s: unable to get hwirq base for irq %d\n",
 			__func__, irq);
-		return;
+		goto out;
 	}
 
 	for (i = 0; i < 2; i++, hwirq += 32) {
@@ -172,6 +172,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 			generic_handle_domain_irq(data->domain, pos + hwirq);
 	}
 
+out:
 	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 
-- 
2.34.1

