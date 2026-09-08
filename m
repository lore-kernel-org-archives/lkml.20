Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ABE4B2034
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857790; cv=fail; b=gnIHVAiuhdv4XCSyJw5jkpHmloJU75WRXbi8CUcLG5vch6bW52ApP9BsoHPY47MODWZyO88QvKUcu7UnI8cZ6o5nBwTuLwc01e2jMZyBXR1UBucoomppRGs3GKG+odMJxvCZtXBZ+7frGiC8ZmEcJTps86c5nAD9Q1c3ctOrTgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857790; c=relaxed/simple;
	bh=YZTRnU2wVKU4EF+poyqCRezGybFSseGKW8rl0YsbBzE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=I4G3VkZ2RKEkmxie1dimQ6Oha4ndX8tbcqCLF2P/hPaS4lb2bS/5EEiUIN+zCRvU9lL3x2VM5whstwYNCV98E4gB9JMGHZ4FwVA0pdDVcuU9/168HyVw5pVRsjnUxRXrR2fWwboTtXWWK8TlQ+4NLwu1a87rtrH6PhZjgH4ytfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f62nO1MS; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f62nO1MS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngjUh6JC0ev7jadoGaCrQ251mJ/x2/XfwMyhIcVsMGXdLtnMSo474fGfEjTSruWa+szulFK3NFsZ2f/oBYHAHgi1M7mD66SJ13JOZSf45uu66NWNDIqNYvPrZDELUnJtsI9R28VnDr+pMGOAsoD5hEUEjlqJfW9SPPmrJQJNugr0COAIM8COW5CXOWbuYE223suDsooByYh/2T+F7wzm81eQUIBZgyh7g0Jbecs4KlXzNcJXVLpNj7V+ppmn+l69OWfk5RbtFwrIgTnaVqJg0VVktVAUTcNUtfohDO4aJ1FZaDY/9phoq8s/HVzQEYUVnZ9tpl/5My39ayxQFH9VkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDMRuErsoo9lfOx6JDF8rXAdESDHKjzkDnW2udH6C1g=;
 b=ll+mR7H0We5Ju1ptIhAcn164LXq3ti/9VY5aUxSRkpsbuSGTrff5vW4ZsnP+30KBaip4ZasVtewBE64upgP53r0vU8MYjoIP675KBbVkoR87oeOxQGB+dp7ImCO3kS7UOBcCIOhMwV9npO4aItPqnVs2QZ8FNYTjsF4Lza6fWIOkAsNiAxcXlJc57snUmZaDELf3VNmBwokersJ57pOM0hNaWYMLSZrcxNBcfhti0gnmhxzpvz8rOSqC/WgN8Lbdn1gTAMWBGo95S6bwYTi9FSt+lVwqCMBjGB+U8MNl+Aaq3hLFYif1DyzZ2AVM83WQbr8D82HgzQn6HpgEG3ZPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDMRuErsoo9lfOx6JDF8rXAdESDHKjzkDnW2udH6C1g=;
 b=f62nO1MSlVffPXlLcUI3hlGdXAKpKG3pBr6sFpBpL5opu1CJBqtUtDcqcHMhl2ocdz92A85HoxS+8Km/3Ui9AgETfLD5CQKGlCmBmSkhmod8LqfSfc/vaSAz4OSGa62MjtcM+ucEz1sJjzX46ysqOVM5j6dJwrVsJsE9VxBJM2FB2mjd8ztTUClxHQZVwPOP651U7YVmr43L3K+PAO2DYToiD/BDcKlzW6y/gFAXcBr1GC64o3l3RkTwUIeASOQfb/yIRErqrTXKHi64Jso+o8V70ma5pYicC492XxZrcr9/4/QyERTkV1nrqT1JGdAxxrZVCFldhBEwbJZmPd6Lgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DU0PR04MB9586.eurprd04.prod.outlook.com (2603:10a6:10:31e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Tue, 8 Sep
 2026 08:55:53 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 08:55:53 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	ivo.ivanov.ivanov1@gmail.com
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] phy: phy-snps-eusb2: fix FSEL_48_MHZ_VAL definition
Date: Tue,  8 Sep 2026 16:59:53 +0800
Message-Id: <20260908085953.3315953-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0346.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::7) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DU0PR04MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8aab5a-9f3d-46cb-25e2-08df0d86fcf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	1+mggfrI59JyodkkUNCJmGHzwig9gdmRPDQASRu++RzIcyL5pjjboRcpWRdrxz3kbmyEB0+mBjofSjfbUCPSsdouVCzxBbMNc441yw3Kx/WwA2xRZbs28mQ9zkcfKcrJDDWXGkNUFoyuDuB1n6G1Dy7wTQ+aIrMKx8Kw0oGXMx++FiM56b4QvBiMk8p33CcAVpoVuD+AeFL3PID1foRAKZ6lXpZtdm3r+EGnFmV0F/0ql3C3TPPLtPNieiS8PY1E+h6KXoRopI+ymG9N16YtcGHbzvXEL89Cxecjnag567lZRYz8LCDVemstqZ433J+pgQVqkd299IGqb3TdmnlT7b+uuk3WhfshtKshXciiCCoFQG5AqoN04RQdKDroE+Up2V2LyIeO9TJyMuEn7Qq34/L5KmrFCSVx7jnePfKEWg/+BEU+RHUCW0feMHvHuaVRoBtpUsjKy4Eo39SXAw0AdBuCxiAwnM8zWLWpjGJvtBR4gV6KBGBdtt6+dgiK0xb9l47RN7hxO65dAXEN2U8TWmcUiDh0hWIhtuXWvGBvIlAbfCVEDerXCqCNoufeS1PSaX45EQKVw6T6bYCWeSyiik6kR33ett63xB7nA/SWMKHp0CBWx0MRdDZNmVtugls2F1I7gRpmPjCosaWSRPZOhea8RFx0/mgSM5xnBY74fcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ld+yfiDzMuoVHgo5QcbMkSoWTEivG73XpqaDLK6MhdeB8OAdfhDjYYw0yY4l?=
 =?us-ascii?Q?6OhzDBX/zKw5NtcanZrz1JFp+rNg+np0AKaqp/w0QowiXOg1OCdi1jCEx9cf?=
 =?us-ascii?Q?WN+PB4Y+R5iLO2vgvyqY34RUkwZa/oJbvF3fGkr5k/KQ6wbmhUfNmzqtkbgo?=
 =?us-ascii?Q?RmTnLA3QXl7BHwzH99tBgzB1rF5DhAuYuPV4vcuXhYds3QPxdcVPrYfqnzUn?=
 =?us-ascii?Q?kvd9k3X9uM+0axHRioEeLrIHEh+OrTGmkp/tf0lhy2BCaNU1Jy7FvIZ1qcRS?=
 =?us-ascii?Q?Qit/gOfiZFIAIfWwHpiZNQ5lQzlprPeSkG8ELyyzY9uVhIFpLBoETaFtKWaV?=
 =?us-ascii?Q?PUOjgL9A9cT9kPsodm9vDcn0fDKQB2DnLN+4SnwnavC+ZKqnXvyLXnN8RCBf?=
 =?us-ascii?Q?faizZSiUMeYezPNc2p+R3iHrALs29jWDWOQEZWQu5ICXUBBLZj/Z48MOrnRE?=
 =?us-ascii?Q?KCm7CM3cQ1h/svHKWIaf+Z8Gwda97Wp+RdaQf2/MXZn/X1mqvyKcx3yESd+W?=
 =?us-ascii?Q?n89f7KRt6oudZ80L+Hn4eqwrFQFCfIlJiru6L5KZuhMI2UjVumrzXPzdGwrR?=
 =?us-ascii?Q?N+IUvLAzv+1kfKF3Bf6zJKtlgpN1lRIO2t23uJMinJW5KzzhOu9FAbCzeYxs?=
 =?us-ascii?Q?k2pgMth4O5l60KGr9dyc/GsLNp6MtJF8hBtlHLogauPBe8erRyiTEzUsjdLd?=
 =?us-ascii?Q?Tzqpzh2y8ZREn+IDXZ4cBvkid4tD1QHfbJjszNgkTLZGYPNACtsl26L6kwF7?=
 =?us-ascii?Q?3mwK6Q8lw/m87toHV8YqhNviEpR3YBzgqXrqecjTKmBQm1vQSFrhM1D/4lZH?=
 =?us-ascii?Q?HjvyOooKWA4TUCzmeUY33r8/5iH5j5VMobWfkghfxRbjTKPmV0eIp70erkPc?=
 =?us-ascii?Q?ahYdU9albWvoEYN39NSYhzQQ5F6A+LejuvsYIIxFIU6S3NGdkzAmENCUR6YO?=
 =?us-ascii?Q?VMYz1ExUYFJjYKvlm1cCYkcHDjJksogDjL9k5iRkDnUWnbHcurdvsMO5L/4+?=
 =?us-ascii?Q?BMAc+HWuBBT4T2JNt/NW/dPihNw6AJULd9npBtdrSpZpLxzBmOegWrQRIlsr?=
 =?us-ascii?Q?oqKkF6dSHT/XvQn3qFqrB6IivpOD5bi5gTSL7Az3ts5QF1mSvxAOaJ4dvJuE?=
 =?us-ascii?Q?R5qpN2No8WNdxh0qw7y6/qKMfueg919IDitFO/JmJxl7ywLFy7cXVAW0fNZa?=
 =?us-ascii?Q?3MfKT+A0AtUGli8VJmvIN2KzDnwv1ya8XuTh7thi3gpqUqRRzj8MJTQg7OYG?=
 =?us-ascii?Q?dWsBBpVRZKF6wmf2/yRmZVexscuXCSxL1RLCmCOfJKMFOUJ6kbtfW+lFfzTp?=
 =?us-ascii?Q?XT7uUaI3zk+CC9ezub+RuzZVu8FJrjBJ3QcWL1X5klv6Mbm8Xg6cWoiJXooF?=
 =?us-ascii?Q?+BFM/DwYLfh1TJOjdKmitVG0HIuZlXcL507qrJ3oBQN1Zled7e4+EM+z/ksi?=
 =?us-ascii?Q?577X10lJGilHo5QAx11/0LBoJKCzCWfEO4/f916koCse/sfuSYZEPOucMYhI?=
 =?us-ascii?Q?rCfX8IKKH3OIISU4/teWsGMVWn1ghrvwD8+ZUDOhMN4nrcKRyuvkR7NYnaOU?=
 =?us-ascii?Q?A+bY6AdeGSKeSC+JySKkrStf3OV3bom7Sh3ezR9HSiJHAo1ZvKxP6bwSr/MV?=
 =?us-ascii?Q?OVHNPWdpfCYQ+UYb1ebvAh26ZCNBtPctSRyegnLrp/EpK4zmF7mLycAok1cp?=
 =?us-ascii?Q?kCucJRbr5R//3KzkwlX/n9cIXZu3eL5OfQerwAc/d4lKLMKGB91NVqzSlDan?=
 =?us-ascii?Q?3G3sP86CUvX2a3y+4Z1llQ7DKFcyXQgsA944fTkesKxm+jFzEDOh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8aab5a-9f3d-46cb-25e2-08df0d86fcf5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 08:55:53.5186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THsVD3k+6VrDn9zPqP2gIWk0gy4b/SflPBcTi8VeArQWWKqWMZJIglahqnqR0aiSdGEDNIoFJQekifOrd1afMss92xJ2RrfHyCb+4X+D++LaOr9z1wKjP7F92NsEuhhx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9586

From: Xu Yang <xu.yang_2@nxp.com>

According to Synopsys eUSB2 PHY Databook, FSEL_48_MHZ_VAL should be 0x6
for supported 48 MHz reference clock.

Fixes: c4098f3e6134 ("phy: phy-snps-eusb2: add support for exynos2200")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index af4fa17ac6cb..3cb18d6ebc1d 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -21,7 +21,7 @@
 #define FSEL_20_MHZ_VAL			(0x1)
 #define FSEL_24_MHZ_VAL			(0x2)
 #define FSEL_26_MHZ_VAL			(0x3)
-#define FSEL_48_MHZ_VAL			(0x2)
+#define FSEL_48_MHZ_VAL			(0x6)
 
 #define EXYNOS_USB_PHY_CFG_PLLCFG0	(0x8)
 #define PHY_CFG_PLL_FB_DIV_19_8_MASK	GENMASK(19, 8)
-- 
2.34.1

