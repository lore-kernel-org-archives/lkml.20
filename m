Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B25C47ECCE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450289; cv=fail; b=d0La3X7PZ/UE3Zn50l+G+83o0m6FcHu3Y2LLi+051vuLPdPAz6SI7u88XG/BfPinVBVvWObc5D+JqnehcSESN6Kwetu2SKHtEjh7bGTsJUBmuRd18R2w4/kwW1IWukVE7Q4IEnqB5ljqkShO0KnriJOvDQQUo/zb2EY73eXd4/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450289; c=relaxed/simple;
	bh=UTqvS6QIWsqAcHGC8osbHFsLhRCrfaX+7gnkivybp0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r2Zqf7L9ooM9dHGeYgvncrgzgc3S7q6uQwDT/FgFr4wT7A0wPEQgLd1g9Duv3wHLGVWmxXOhsWfF/W29CQWM2+TMdj+WICiIMwvyaWyAQmn63U1a89fcvC8FkNtKWq/o5znRyo31dQ3kryuOllmvNRPDW56F5UhS70FrXTT9Dnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DnZKmm7a; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DnZKmm7a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0D/cexRpf/ZoWXLiNXA+aWJGXMn3oQRBKo72IXHEEhwmz2spMe3dho43wtxD9z8xkw4w1CQL46EU+CGZzAhJOKruE8do0iJTl1yrt7ZZ/KyVWAR8cytzCoWu6cWXRZb2WtQOGHleXOThSuf6XfTM1iY6cla6dBgen8JkcqwFLd5NzTKI+uWkPABS3xXQdkWyBMbsUn38M2iXVsd7/4IJZnf2H/HOLjBVc0IZfmQokzNT4xlXXpXZwd+px2k18AWT/gxtXS9Lyg6zCbCd14l8WDF8YSORIycw/KYRAM3TVRqcO8BaczAOGmk4wUaRtTW4wX8zTkbHYaPCg7ayI8JSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY4zLrJDYEWAnzylnIDGmuMGGMa03zInz6lhsAvzXZM=;
 b=t6jPUZXAEmqT7c6FpYQ3/cjlhoqAVzOPNHe1Hd/DrLqjNzS+JhMshWN+DnM5DmcsUgVyZs9WTfPRS+tbtmdQluBw4ANV//LCLJqunBYSiJIcsH1VR8gt+SGC7I7eA4VrAnYMcj3OXSm/9m3gl4NZ6yCM+RngCmmKGb1yP0/wL1il45DB2bC+EKmqTpBjQASKqNo5fPbtNHfM4yJ68P3sa1LQLpwP22ZTm8FxBqWvgw+vkbLQLZzl4dMpTNK6yPukC0qlCqiThFQfT6rVwCiz+nrM9tuqfred5+SS+t6gTux0S8N4jJmsmbH52vonjhMr+/NS1+lAKRBEOI2IYR2grQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY4zLrJDYEWAnzylnIDGmuMGGMa03zInz6lhsAvzXZM=;
 b=DnZKmm7a6zsTfWKB5iRl0Drymjn6v9sXOzy9dyfo+6nhVJo87SOXSAVpUna7n8UveyleP7w+ZZptDg6NmUYSZx22O1vzXjChYa3ICuGpCn7GA0I6QboymJmsFSVNuYov+mLXr5RgN12mY3+vq3LaCRG8DDU+tylTcsWI35Ljyq575r10BhJuBjZn4es9ZKu9R0Btaz1ZQEMilL9Js/Y4De1csqTA/R2ALuO27WYvNVEhMDyA0hTgbWKHLLcWKDjNKa3xPsJx7FeiuAxT58xBRI5nmyBwdeTA0kQnFYDPj8yhagWizziOrJ6j4iUpztJh+3XQDfhWIIeN2yCykmt9Lw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7459.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 8 Oct
 2026 09:04:40 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:04:40 +0000
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
Subject: [PATCH v6 8/9] genirq/irqdomain: Add devm_irq_domain_create_linear()
Date: Thu,  8 Oct 2026 18:02:30 +0900
Message-Id: <20261008090231.796511-9-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::11) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d31e9c-4c25-4e50-15ba-08df251b2f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|11063799006|18002099003|10067099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	F01XYQTDuD28kDPagC7SO7PU9bLFvPBFTcMFj31/O2vpX46DhzjAD0q8jiqFudvU7z9xL9bcEhelby/hyk+QxTI5OOlBCpRkINT7JNYk6JX7qpmvzw+9MqulJe7Yb1727gYS7inyNJFBCHFYz3eyUTZFoexQkh6BijpR9BHFMMRehH0DCU9f8uJXKqczKzQOaO1Ehv79geDiZB06vbSgac7D/MfKM9M5M9EWiCyEt+oRhUt6azuAiwpJGKh5ub2BNlTk6/NRt1MyviO9PexhtXclDpOouSGCII6nOqzylDhlXJv+ANneX8X9+rJ5oECA1sgqsJrHYaypW1be843P/p4oczqw3jeaMzw4xBAK8nEJ73gt7HwldE9K/KxH/XfqNCb+Diiu9CBdeFu2Ve3iyfSZh/O/dOceH+hknDkMnTnys7m7rXR1lNDf56EukibXHEV7OPwYOWPAaumiB8d+TYuxt6OkB5Sc4jFKYmbBcFjx5vrkhhv7clidiT5If+k8EUUDge3ZKHHQK8ohLH3sMsFlzH4B0fw2BEX4JO9nnnME0MBU4SbeuIdnEWgfrRpFGErpKE1yhbI8Ta5wS/UlPSVnqcsH2TuzkSIYoU1nnJfEuJ+ecqwsKP7QGxvKRO8WcDoFQcaTD8FOSao0u19dMZWlW0Zcr6YeX22R8ypbYZI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(11063799006)(18002099003)(10067099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OZbmNMua6O019znWvz7yED6nUeUNG0qegVO+Rehhd5823v5o3VxlgnCnJ7AV?=
 =?us-ascii?Q?g1QScMST4ia7m2YeYiTjBEDRBtkL+yiaKKt3J2B1BPahjh7CTv6sbKFMBSYg?=
 =?us-ascii?Q?H8OZx1NuJqXJPCmolksN4xvaJ4omTO78aJD9ASxfhTeiozwdYPw3rJHxd/PH?=
 =?us-ascii?Q?0vK7QiHed7KDkPWHPC7QqmncyyCoD2gnDNxkV2k/83dt1hxe/G46Axo6IJ0X?=
 =?us-ascii?Q?vRgvBiRgumv6jyjEbIcTHAezJb0PZBhiWlOEhmXs6bCMYClk3Of7L9KDXs2m?=
 =?us-ascii?Q?LBk2t40IqAxE4TkWb2j8v5ynW8mT3pPmJ6ABU5tjTCcSw8Ixb2Kfv7b2sXxw?=
 =?us-ascii?Q?vEaaNipDbsbHdGWwHZIq7NUbvQlisYF6rvjyHsz3WR7R3U+F/XOX3pnl+Axc?=
 =?us-ascii?Q?an8b9jNPU9IJs2Q0+Tx2tOWiYyRqz9Yi6IqyIYomSMyNKvtRtRRBNT+d1gWg?=
 =?us-ascii?Q?jjXEzD+AAMIWQ+GHVxSdHrmPPLxuXJ6K41gH+yAiMQBxSl21nmUqxXs2Oz3g?=
 =?us-ascii?Q?rVuJSrjKPmufgII8O8EzsdLMRCCvI5MR7LcUYS530/rW9fQhjweZEfbH7ABe?=
 =?us-ascii?Q?q+FiUJtYMA1LQfsRFYTcG+dL0FjUT0EdegGgzCIKB/ZWvh8RRInRLOo93Cfc?=
 =?us-ascii?Q?BAD/IaMieq6JHJvbor2UYjI3eFObGPV8Sf86YKnW8S4gAqnfrT86kiTJF39f?=
 =?us-ascii?Q?FKEmUL/3jckVCAgY7O+OQCnpaAXWT+YLibs9zXdj6a6Q99dnAGjT25BG7ojm?=
 =?us-ascii?Q?ABX8usKxTy/vZ0Z7tgwNcQ+o8P2dfKsMkIBNu8/Hm+re1J4Lm0tsGu/MTaku?=
 =?us-ascii?Q?CHrm5SZGwDWsp5GCrPghjeVbs/+rPY8zjtIHI4XqftWi5Zb1KSEJ+9saGpNx?=
 =?us-ascii?Q?rEHc937Ztwap3AW1DpGzw5Nb9Wky9xVKXXNu6d53mcRNh5vX5Y1sJMQ4U8yK?=
 =?us-ascii?Q?iNQ6XT/3iW+55i3cpERsRoJO4Sh+GcvSwDvfZJArgvmWDRD4fRNqI0D+PS8s?=
 =?us-ascii?Q?XUyHmfa53x36OIXEyJyKtQKrTshQOB3s9SfRI7z96p4gh3z+8vQ1JheBc201?=
 =?us-ascii?Q?5SSROBxuvGCJdL3HrxWoRqIs+fVUs57iOcMxezTcHxGV4TD+WhZneC1L4LQU?=
 =?us-ascii?Q?t7S/8rW6ztD8szb0yhINuFgyT0tvjgYLhyLbxlcc2syHAfeSjy2GcKJBoQHm?=
 =?us-ascii?Q?cNCbMmz6zUyinqlk148ISpd7yGL4ozH/IURr0mri8QYTRo2bFenUHCt/ZTvF?=
 =?us-ascii?Q?CRi62LbY6s9iQBiXs1858DuNjsTAm+bMwnnM2ailxg3TVtX7KmNa0aN0gJsm?=
 =?us-ascii?Q?Kea/ATBcir2PrMvKISuiagNFamwnXjwoETNnnBDuyNnFwj/6IL/tIRCc+D/C?=
 =?us-ascii?Q?AHze307dwwhzb0x6ljhVZMFb1/SI7FelvRW0eW8SDtNYGhM2ZXax33DV4A9c?=
 =?us-ascii?Q?zRtdwOxPoU0nRyfvyb3eKUSKV9xVwaZihJ4ZZHsI3YO3oxvK02cDf3azH0H6?=
 =?us-ascii?Q?XKWB/7LTu/9AwRYZKSpbHTz/1KGuoBnvkVEV5jZMxl2uZHFnaltKHtNstHhE?=
 =?us-ascii?Q?5JAyPDf5cmGYrXZ4GSQmY4ZZS+A2iaeFQPrFfKEQ7SsgpvOwRk2R4X9jw2+5?=
 =?us-ascii?Q?b6yT7WNiEz3tMduNahWhqDCvt89GUyvGRwZxMvwjRq4KLy9pTuLGPRwLdla3?=
 =?us-ascii?Q?j+i4kQ+2DS6753JsecHfMAQBnuLvw5ZtT8s8lFOZwm43aMYVyqKaxYyT1nyK?=
 =?us-ascii?Q?X5HFINJP52yARLbTF0nJ6yXwrknQxgGswFbq+5O2ofhgjrxlzBJH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d31e9c-4c25-4e50-15ba-08df251b2f9b
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:04:40.4220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kc/ZIojCfN8xObAO6T4HLzxzxMoo5czYnnzNRF5Qh8Jj5l4WR8LaMZX/giX31QeR2Jx9h2BnbAiC6oiRFAN9po1zpJ4vV7CjY/EH7p5E4+4Qvsu8jLGIFtckUJ0CDrlp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7459

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

