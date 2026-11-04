Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777950;
	b=0hhuLiVs4/yaOl19wEQLm4hs8pB9fD9YIdT5/+2NKTZQYS9CXO4KTGcSR10NLVVco1Oo
	 LiY8vMZ0pNCImbP2Z+cxV9BvDaZriNuwXniag/j8OfXB+giHr+LjnpdQa9+XIKw3MzbD+
	 /h6x+025kK921e0VJTVDP0hZbHj1dxaIyI8kgN4yv1cXIcsYS/lbfFbf77mS/tV/T38XK
	 Jw+HfyFOqePFSOOdwXJ0U3hp0M45dF34mYvGQRzp9m0OL/IMJ3BufnHhLABlKOdbADraC
	 XQRRA0PdvunlqcWKIxeTSmxI/5b334vgliHps394bnk1w0P/MQTaW+jO3DZXgTVanCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777950;
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
	bh=QySj43ltV7z32wtE413/a61rMvQ7rD8vdID7vtBGMG8=;
	b=H/kuAZRIsIk+nWLt4Hh8YLMlx9AB4oLfKeSK6PZhyHFPAQVFDqZBDsCPpEyo3XT48KRp
	 uyG4cZ2c1O+khbTlEV9XptRe6lnL4DWgoiYVFUBIg2X9pcd/M9F7KalQ8C9hEoAqHcZK4
	 nRG0KFdo7ru9bmlLbzOhZ4g6kJNuJP1NtF2pELuL9DRYy0+Bn/4lVIiKdA+mZ4f9nBmWA
	 WWLMf9zQDdY28RGkbYePaprrccDtyfsPWeiZxxOzapSCkk6lBifMV006RlORmdlajEU+I
	 cyAwvuKCIXz+hh55aN8SvqhRH3GNSiSLgq3hM4UrqiSQIlVWHPhmER5Fqx5TD9Wlm2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=doPsZWDA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.27
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA625606A339
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA625606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=doPsZWDA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5Hqyo51W/DxVaftacnfPxXXcv8PFj6Rl3hFbJYGp9S8gAWUN0vCVJYw6eyNiH4SsMPpiflHOnAebCIJwU+VyFDPOi3eHRKpvtBboHnirO8zF4rHFUPJeY18kWbkYRKKKBBTBCBdRjZyujOcoFTmNsygM6BIZndRQ8T90o0R9ekHXaTXR6I3KVIorJmm3/Nc+w5SC+DRd9+mQpo1Jqkz6E4nPUJ6cSNpFuErsSl5ji/Y6cEUm5gg4jB3KHyOTUv1Sd3fhvWqoi/QL+UM6Y8uVNTMlwevWVh9LNUlag+OTtwIEvt2vwJV/KSbsCml2Y6MvB+WABS20dtWbvCUmkPR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QySj43ltV7z32wtE413/a61rMvQ7rD8vdID7vtBGMG8=;
 b=VMiqyJt0oO6ZX887pwAI3tKtG79gVMnSWiLv9Ns09n8euGv+zC5xUZw01Bbcf/BUUQRcGsR6h4iK18ITJfVuoNrMauRRdfueM2i6g6hc1fnJhdajhUakn14/Ob1/ZZiN2jsP0Q77mdU071KY96NlP7ih8ijT7JdV+oGlEe86NfS2u7ppuOAGPaF1kEUToqnBykRQDo+G4kuPJJoIPNTLscCdapoKZEo2nDT7ev63utA6mTGDHLKtJ9wmIFJkd9yn5mEM+0l28JSXobbE3S+2Qqy3sMOL+W71TM1gqGwl60MKtjhuuFObZr/dSizvfcHImiMQ1PaD1WulXGCxO0PXMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QySj43ltV7z32wtE413/a61rMvQ7rD8vdID7vtBGMG8=;
 b=doPsZWDAUO/Mkf2dVltpN/9wz3Oq9J6wga6amrSlZyeD6px8IJNtbsi+DZukDt7aCoiypOo4c3/NMdoecrV0k5ZeRSQTYn3r/ACeCgoEE0aBsGu524r3IGDvQ4vvdU2ShjxFXyHKlWSNHLlucb+0nP71NwpqyhQa2OZX58ACO1GeBoDiG6w2FTC7TZTBJLWkbtgpBm+EaenR29EJnFHOVSr/9cDlfLVBe3mTThrwuaSZD6PccmfYwsPOkpPkd09DW1Cq+vkpojFK49eWNjE3ZC7eTRuY+tTe37TEOMcu5SYhUmGSa9Nh2beRyJ7q5iNJG54Em9SCleKhunvlCPIswQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by BR0PR04MB013570.eurprd04.prod.outlook.com (2603:10a6:2c8:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:39:06 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:39:06 +0000
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
Subject: [PATCH v7 09/10] genirq/irqdomain: Add devm_irq_domain_create_linear()
Date: Wed,  4 Nov 2026 16:37:57 +0900
Message-Id: <20261104073759.386777-10-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5c::9) To AM0PR04MB6849.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6849:EE_|BR0PR04MB013570:EE_
X-MS-Office365-Filtering-Correlation-Id: 79acff4b-6abf-4856-d0db-08df3a46b474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|11063799006|56012099006|261021121427099003|261009223027099003|261022075727099003|261028144727099003|261022105027099003|261102123227099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AHGieKfOb6T+Oer5LrweR23XNzmeGunePANtrIgRCMH/28V70wNUxKzIuZoUFwgqfBTeS7A3KzOe3X+gtxA+huxZ4KPihitvHZLFiUkSx4+yOFpe8V4Dd4/RRd7nDahsAUrJVjkx0FABIGq2JdZv5ckuZ2SoP3uoQDYq2CuVbWrl4geZUPDpZ0f58vOeJRYcmCOdCMZA2ks5adBsZlw50P37gEb9swdBq+0qAmh8OJmiSO4vACo7LDECl0d3X9qT8IsWrqNp+JVQNRMn00CKQSOqPNJTh/YckqaJ9h4rQpVEw2HMJ06C9TwFDeiKKjKcWxdKGxNdCiRvRferZMyKThK0dgt69OrDaCDqW72I9pUhFZq90gZ79FxiE+yNolHnz7G84qOLRmWCuxTq5KSE8ah/AeYVT+zz9OijJn8ByijuqGJ77p5vDSXvvRCM4NHv7m8hc48HLN99S7hbxkSLQvY7TdlR2k2hV4noviVPB1Tn1LDbXu4JRztVBUgV9prQKEHRMbbQcQQfJ4lgY3vLz1bkeThlMkoIPQtAPNDEJ6RD+XsQDF1REseAWOB1Sro/7VUyCzBxNYWt8ew3/KWg3P4rOTzZIC/pgD7lfarRYUL4M1jddGDTBP5RmpFF5iuAA3Cp9ZoSiTR7K1Ev6M1HfyhPomz5DF3B+TPv0vwEgVk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261022075727099003)(261028144727099003)(261022105027099003)(261102123227099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BCjKLXPi1udvgWN2IFPMmybSCNbkhydkOrDPgUxWAeAYfgHuB+87f+cB1jsn?=
 =?us-ascii?Q?JRyoNqnyuFkHRbPYosWScn46L4SA5tQpUcg9EOAzbQvEYH2UZe5SFrOsKJou?=
 =?us-ascii?Q?N4pZlInVHRdwJK0zrLQODJgjlcEia7UrlGT4/WF6/BPwkDW47A2q/VqnSRCF?=
 =?us-ascii?Q?wuA7w/+sdEh8MaZKdnhJZRpDYbMJBqtAzX/X078TOa4COljI8AYgOhUDP4mZ?=
 =?us-ascii?Q?oI4KX8LtQKECZnGvSVb+ZfiQg/ZEPxkazVr4DoLGWmM78uf+u7nj9Qyc8ppt?=
 =?us-ascii?Q?tThP1klatmHCtSRbI0WBXAQzsRgH0H3p0DDgwVl3wuYeAzQ2ItVFVdfRyNwO?=
 =?us-ascii?Q?XsFz9o9ZuB2PwqZBfC+9kHQemoIz4qelfdy16waN1mwRUT9hMyFl5NCZ9BFQ?=
 =?us-ascii?Q?TjosqoaHj3NzgPknaT/Oxf82bfkN4Hkgt2X5p53JtXeJDnFgXTva7+L9FTR1?=
 =?us-ascii?Q?MN4cqtMsWB2pvMpA5NMn7Kgg3xRFuoHkEj7OkjSC2p0l+6HmYifBuHr0f4EV?=
 =?us-ascii?Q?+IkeHoQU7sP+ohqfRzadlajxHPxhnwOvhl6FAdljLrvDaEGv61Co/jZGnOpY?=
 =?us-ascii?Q?kTkng1GRUM8WN8dUIHLhpOYHKSCnsuLYdh7ojbVLuvFadJLPL6BDGnptUECi?=
 =?us-ascii?Q?hhI9qaH6I7gyscHkCc/I8EXMUHwK5s3mgYTV/AiCngHdHIN/5xSg7UQGMl8j?=
 =?us-ascii?Q?XeXsdDlf9IFLrDfJFVd4XIGwE5xvpYQmT4ntHlupj1r6xN1/ktgh+SctUulS?=
 =?us-ascii?Q?Byf2zh7DY4hIcIp91u/Vtak+3SSlO3BBZdwtNzCYTZoO6M4F/MG8/AgwXVzL?=
 =?us-ascii?Q?ghYrTcPYtEfCDN/2w8a8/mbF8WqO+jvRKNmU8QotGtTLFx4MEqqDsEHIJSSZ?=
 =?us-ascii?Q?YyzcoDSvID0KVs2OIH09YZeT7HGGmTBE8CMnhzk6DYwnvXcAfh6sv70WGtyx?=
 =?us-ascii?Q?adsRUbRXpyXKEHxi3qvrtHgbMR3IBG3nF+WN+HWbR6AmMJ4BF18qVaIjYmct?=
 =?us-ascii?Q?Fz+C3AbarUStsg9+vxTE6GKPylNkefibEuPwcFjVGXammrD3rIRi9I5hO5L2?=
 =?us-ascii?Q?xkupseOkHdDMeQT6S4pHf3bowKRkN9Pxpwo6RCljq7QiONasynEzqI1fd84y?=
 =?us-ascii?Q?aJAB8hFrUV1VsHggw1z9hErwYZDJoR90otgPDKd7LNEew8bSoB0IITbkUuTH?=
 =?us-ascii?Q?fPJdPyzDjQ2JZAvuyflAjtdJ5DGvw9OeBWeF7OKaZAgi/c3JptQ3m9OUhu2I?=
 =?us-ascii?Q?1oaqZZIuWSxkGG7AcwkCGC9nW5ygLN3QCI5yDoioCOgDYtL3OijyfTPlE2d2?=
 =?us-ascii?Q?djCF056oat9FQW0t33mbKgaYMEVc5vlnKiGceFIo+R1u6B3HHmd/Vnrx1UF0?=
 =?us-ascii?Q?hjemhEoUhXFIAArB+5/BC9PHqLR9WgeTJRqhOeQj6Q14GMqZzxoaGid00Hbl?=
 =?us-ascii?Q?HQC2QUdM0fNSqyg3dQDEiXrDHPwwYDiO47o1ZB84fw7v8Y7O35EO3rdV9uXh?=
 =?us-ascii?Q?++9hJeYa2cfJtCExOJNRxV2flP6IiCrAB22NuyrqVI5/Fe0o3pS0CGWRuyae?=
 =?us-ascii?Q?0kQR7finXXi6Z3VnkIpzQFfh6IVUoauwfZsUvxeIShiIWtEqBJu1Gc2AtGiK?=
 =?us-ascii?Q?z/0SSuEqVIXRtA5QFp6nWSQH4Ih82IAqmHyMTEr0fjladNVscgky9wWH7vmH?=
 =?us-ascii?Q?tsBact56YhDypBTOhb/PKYkyMJAUEbmDmbAToA/1iau6WzdbpU2kCUrf+OL5?=
 =?us-ascii?Q?g1UCk/HE3ByM7LaF3NeIwZEOTS1tv3OlfYTHz9/98eJrX25nmr35?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79acff4b-6abf-4856-d0db-08df3a46b474
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:39:06.0626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gsEKtTL7aRuSytOt8RZR8BikIboTVaRNVfS3Mx8bxPT+iCx4eBJuy3gOh5EExzVeQyItxyZOTxQhKYnMz8gqNFre33ddfOr+HPUNqnTFmSXNwMvGYD5j04Hi5MmraVe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB013570

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irq_domain_create_linear() has no devres-managed counterpart, so a
driver that wants a linear revmap domain tied to the device lifetime has
to open-code an irq_domain_info and call devm_irq_domain_instantiate()
directly.

Add devm_irq_domain_create_linear() as the devres-managed sibling of
irq_domain_create_linear(): it builds the same linear-revmap
irq_domain_info and hands it to devm_irq_domain_instantiate(), so the
domain is removed when the owning device is unbound. The return
convention matches irq_domain_create_linear() (NULL on failure).

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 include/linux/irqdomain.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 73c25d40846c..b6b360cb6525 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -457,6 +457,36 @@ static inline struct irq_domain *irq_domain_create_linear(struct fwnode_handle *
 	return IS_ERR(d) ? NULL : d;
 }
 
+/**
+ * devm_irq_domain_create_linear - Allocate and register a linear revmap
+ *				   irq_domain tied to the device lifetime.
+ * @dev:	Device that owns the domain. The domain is removed via devres
+ *		when the device is unbound.
+ * @fwnode:	pointer to interrupt controller's FW node.
+ * @size:	Number of interrupts in the domain.
+ * @ops:	map/unmap domain callbacks
+ * @host_data:	Controller private data pointer
+ *
+ * Returns: Newly created irq_domain, or NULL on failure.
+ */
+static inline struct irq_domain *devm_irq_domain_create_linear(struct device *dev,
+							       struct fwnode_handle *fwnode,
+							       unsigned int size,
+							       const struct irq_domain_ops *ops,
+							       void *host_data)
+{
+	const struct irq_domain_info info = {
+		.fwnode		= fwnode,
+		.size		= size,
+		.hwirq_max	= size,
+		.ops		= ops,
+		.host_data	= host_data,
+	};
+	struct irq_domain *d = devm_irq_domain_instantiate(dev, &info);
+
+	return IS_ERR(d) ? NULL : d;
+}
+
 static inline struct irq_domain *irq_domain_create_tree(struct fwnode_handle *fwnode,
 							const struct irq_domain_ops *ops,
 							void *host_data)
-- 
2.34.1

