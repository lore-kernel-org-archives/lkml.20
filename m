Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9E84963D4;
	Wed, 16 Sep 2026 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551366; cv=fail; b=YYyuDqMpflUHlgaH2ybb02A4OqWF2z3D8YeX75kUiv6FOv4yqQ/BsxYfEKhazrFGiBC9nWj381uEpHm3EYqp+m0WG4jwXOPoLDhH8lolAJepXGLRB9tBxvJ1mghfNPAsqVEF02ran7XoRzybzZax43ScZSHOH9clFcKlLfLii9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551366; c=relaxed/simple;
	bh=7nXOEovJQzHmgjzX04gaO8vVB9J3tvWhFF5M1Upu4l4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Cw3H8r9Jffg7gPMn5S4BdBJRcHTvcsx4OqqO8XaltmwDe4VZtQYH+nN2AEbMQDb3ieWxBXFNcgcqO16YcbFj1T91y71dDAeX5XLxiN4ZYPG/sZ2/M01M8dRQKq+HgsdTlDkgLwK8Rg1h3WKZRnNkwuumJVuIKrBMeiLn/K95djc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a2kten3W; arc=fail smtp.client-ip=52.101.65.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a2kten3W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlDUR0uhn7HOEaDsVzpCVFvXD5Hki2OwCaBrNcG/qyQInlX1kM3kJzAXg9CHWMnWeoiYwckDulWg80c+pbe2aLeubWxX0Yk7ow7GxPsZSJl1nk12E9lirRKfm/5LqmnPafiRiEvxve1s0Qk4EM3MYK1G7nq/tACF/dlkxfpmA7odXKRjqo9NOW0zczNLVdcJQ58qLzy/hKfB2T6dK3NvRj7zD5U/7q4ASdmQ/yV8FWJZvjgMSt2N01yXmg7v9k/YhpqXRi2NGrCcJ2FSlN10GYJrg3YpAgclrPpxBY9y8bMPInAljth5jz91pIN8Rg6UF8WPVW7BJCNaeDceofFsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZbhSdV2coza4ZHHXz+8OoRw3lY4SIx+4jsm6wz2iXQ=;
 b=MW182WiPFAIND7Qo1NLqHwaV7aqyZ//dcNOWD92sjYVlqbgAV0Lb9UGQ5I/yf1HIkHdVOGTmUCLbOJRKR8OB8rSfMyxtI/tGl77S0dzP79pEhpuHZUrciDrQ2/4Ge27P2QjcPzzkD6Ktvlq2n8oDvUOh4YaqkiM38hSdMv0WTDnXSLyC+ZmCsAh2FwbaYBJRnApJ6ZVl9ATk+DMJQWyUuZJC/5kXCUvNJ12ShO5n0oflGlp3mwY0weWps9S4rothN+gYi2Yu5zh/oVrsnmltqTpYtHV6Sga+xJDE/DAdWgRb/RU9nTYiaMlKLbHKXJ0Zfe+tXKt3PmEn8cfFOocgkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZbhSdV2coza4ZHHXz+8OoRw3lY4SIx+4jsm6wz2iXQ=;
 b=a2kten3WM1w5MLTGWipbyWycnkFLmHV3JW1YljPjRKtpZCZ+it3AWFhUMYsB0WAn6fm7OfX8jhTV7fqjX/2ep2BE/gQg9cNBg3cUGcSIpQLb2BDunu4WUIZ7r7N0HxIIqazuIIQK5Gu25P4qkSpCgEAZjBb+Vmvh8RkcetpbsfP2XuUwflsciK6dEyEsKZ1PJ0iJH1R7s/IQA0ZKLOdQ/Q1WOPOCCDMrMpdm09H7+dJ2PeBhHkDLs+cyo3fVC39IIoklvS8C55tfJYT7QeDHFGe3ennH2OPMQS3BzP1Rdsaw7wu6n+Sz8Vyb9wtIcyN5K5oZlHc9iQ6pOX9XKxg97w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AMCPR04MB12646.eurprd04.prod.outlook.com (2603:10a6:20b:770::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 09:35:53 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 09:35:53 +0000
From: shengjiu.wang@oss.nxp.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_asrc: use regmap_write_bits to update clock source registers
Date: Wed, 16 Sep 2026 17:40:42 +0800
Message-Id: <20260916094043.1496709-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0242.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::9) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AMCPR04MB12646:EE_
X-MS-Office365-Filtering-Correlation-Id: bc083fb2-d2f4-49c2-d145-08df13d5e671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|19092799006|10067099003|3023799007|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	eXG4TKkVBYoozCS77uWQSJlgEH+PYDZcx0xLo1Ll4zZzHIW58W8tVXt+QdhWOV591e7YKcoCjTYd5xfpayVAvae17i5ANW4oMFmTVKH8Rx6DvXoYr7hQqHc8jm0lMWumnCFr3X2Iqnl2f4NISpMNf8qYPHnDDugJjRmXk8mMBwXOnVWWVdiM90HRIO57V9tohwAEhSlFQFcFBBa75hCqsk+f6xNwT085Xtdf5ot7QZtY69WNtQTtxGMy5Y/5W0PGsSKItMqC4DOVGhofD4qUL3L7mm+KybweIou3BTUPx3Yoev4xpJzo3KsjNyYMXg/KprF29PAPTRuLLXA8AMVB+wC0n0GZP4DTfDtNom4cGJQjIMHcXzD1DkwHSCtHG2AJnXYkOBiZdnlmI8OO0rZiXeNnmYqBWsP+mghAyLDUP3mOoWIZ7fV7MZWbtwmhg/bxBunkC5O8wEn9NUQXo5S+ymr+44zNGcam91CFl1seVMFe/3aVyS8G7vNRMYHaG6Q1b707gRi0CyD8lAX6kKXMq7C7Ar19yZcDdhlqQ68p/ncr9axfZyik2TLonXi2gXQZYN9prm6c7BnPcl/8k96asZmr36jWQlZyC6wMr+TXgDEEqOHU4NsHvAhbNK3LlIIoaq2JmZxEvq7ENQj79m79LdQ9yapN15o60t15FtORpKvt//9nlwltzekE9jeHvEEgfxaQQBdbbVinWeKxihyOOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(19092799006)(10067099003)(3023799007)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+FjL6t8QsHk4YyVAIvO1leyuZOQYugVVzNs1J9nwusJs3Xl6js6bMU9itfv0?=
 =?us-ascii?Q?0GZdbEkxacbia14iFOgZHug4UiklpImqFkzllSNehGpVSlGXYgTK88WrOoDx?=
 =?us-ascii?Q?h0u4nq8B7jDVVzu5nLg+s6oCaiRMyqu6nVO45FIPUe/COJjqeye9yMtI4X7B?=
 =?us-ascii?Q?zK0PUCjxYr4zjYAZiKpxMGSmdr+5YqHLubBuz0VA9Jb0ccVjOjiO783Ef7oZ?=
 =?us-ascii?Q?AwP4BzR87Pw1umpD5aY64EX1LojKAIxYBjceoXEVOMFdEHSL7RNhatNa/Xcu?=
 =?us-ascii?Q?V+/toUX2oujPtJbj/3mH/UqGaWSzqbSN4QKWjZRfOjgS51JRkE96rY7tgTI/?=
 =?us-ascii?Q?H3y2p/Hi51IJEqxWysHGUNQdVjp1JA+kCLPTTdpg3Mdkn3Qa+2q1x1qkRq10?=
 =?us-ascii?Q?Sunr9OUDjuRDgjJ/qce5SWNNwiT1trE2rO1axj0vtB47Ec1DmJYKCY+P1NQb?=
 =?us-ascii?Q?qz50UCM44sj+WzXInak/67hjHZTC3g+4eVN8IePzkwciuM1JeSqU3epqgr8p?=
 =?us-ascii?Q?V7cwB7jhZCNZdy22sEK8zTvt+QJa4q5fxIu2GF0ouu4rspNmYE+hfR3z1Ac/?=
 =?us-ascii?Q?OVucs6bX+aq3oUxnxq38luKA7sK2EDhklWpBqTUzts5WmQMVycQh29DGsnbm?=
 =?us-ascii?Q?EkSAUYSCDRBND6Gm3zYiqHbGkJRrAyMkhldZKI595Izq6eMMmhyyl4GrIsWM?=
 =?us-ascii?Q?3Mh4YxTMG70ePPqu+uw7VYXUfmJ57SYG0vN/prmFzuosFjDy9Ltb+IkgZq7/?=
 =?us-ascii?Q?hM2Rh0acru+ULCj6m+jkgTXrGfmIztPx7/6c5uUsDLdcE/Gx3goxLQ96vvZv?=
 =?us-ascii?Q?bCi5b5R8j4ct8snbC0Et7RkkjPORzvJCyJZ6u8fY2t1w2gv8H9S7sySGiT/c?=
 =?us-ascii?Q?lliKdK7u64zkhSb2SEcTxhBxb56gn0c75I5x2uVlu8pzqXoyK1IRdb9+Ggd9?=
 =?us-ascii?Q?nF5y5I7rRNNT8lpnUd+emiNw+k8SvIDHWjASNgYvpc5jy/zf3RavAePwE2y7?=
 =?us-ascii?Q?RLU8GgnYiHM5hb/v+YjIPDHLQ8hbqdbwy2mbKRJPGZxuEzFTfAjancFGpQwK?=
 =?us-ascii?Q?Y2mdJ9M80sJhIGRv6sF4l6WRDT8DJoodQs7RtxwJRSIO8VZKGYjU14KmBX4k?=
 =?us-ascii?Q?T+gggh9Er5ySW0O27gi8yQbVUYTg/KxLbIfqPm9npLwDJqLLzDFroyOTt9D5?=
 =?us-ascii?Q?ZQetMz18FEXd2qpxeN9Akrxj41wK9GB4g+pL0jorPUh5hliAmY/2Oa67JJh4?=
 =?us-ascii?Q?Q4w3x5U4uHJV86x2RADZFFKrz3e/2KHBvztVtTArU0I8cIPmn3nLW63Yu9aP?=
 =?us-ascii?Q?0eiCtA3z58Bmj0BLQ1JDtkh89Dn+ZQ0/WSyRcypPK9wveP8XirE8haV267Q1?=
 =?us-ascii?Q?VXRLxDEzCXqUaOnp5Vkw0PWa1yI9fSrqWpVqtBl6bQRrzVRIphnP/EwsYr/j?=
 =?us-ascii?Q?r4jZJVaPRdiJtQfvl2SSH/09ZlJE2J+27z8tITXLkL+hKilaAOoTRyRi6hFh?=
 =?us-ascii?Q?Ya8+resOmKCttCYG+2Uh3IB+iwFBWlrLw6tWprGqb528WzWlKDdKjF2xV4fY?=
 =?us-ascii?Q?yejlaJ8eBQqs2QtaBF5ANEWOjnT/eQiOzwyDDmcw+W5WuZgGw1JmKyjJZpAE?=
 =?us-ascii?Q?/WVhmiUQG+4I4l5pMvIRA91ajiBqgix8Hqrd1hBLfKIknuczlZMhXLaJWraZ?=
 =?us-ascii?Q?BFO9Fr8JnfdqiEXvrA2pYj0UZPPizjNf/C0M2GuESIYi58DYqqIQsPs+66b8?=
 =?us-ascii?Q?l6l/oxebSHfBI6SMh7hrylpSiZZDz8eJs6u6Wcnk122tpQ1h7TgY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc083fb2-d2f4-49c2-d145-08df13d5e671
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 09:35:53.4666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oA4TlLPmUTdZ/DS1+99e7t7IIPaCOu1N07jZowXH4crpzJgyH8oawT2EsPUvBkymG9ULqhhBmXJ9wu/QH3D6r36ZB7pEzVOM1L5qbrPSP/23zZNvGQJHZS5Zq7U29Txc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12646

From: Shengjiu Wang <shengjiu.wang@nxp.com>

After a warm reboot the REG_ASRCSR register may not be in its hardware
reset state. regmap caches the register value as 0 (the assumed default),
so when the desired clock source index is also 0, regmap_update_bits()
skips the actual hardware write because it believes the register already
holds the correct value. This leaves a stale clock source in the hardware.

Replace regmap_update_bits() with regmap_write_bits() so that the masked
fields are always written to hardware regardless of the cached value.

Fixes: 3117bb3109dc ("ASoC: fsl_asrc: Add ASRC ASoC CPU DAI and platform drivers")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 1c611ca89dea..56604fa1613a 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -521,10 +521,10 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 			   ASRCTR_USR(index));
 
 	/* Set the input and output clock sources */
-	regmap_update_bits(asrc->regmap, REG_ASRCSR,
-			   ASRCSR_AICSi_MASK(index) | ASRCSR_AOCSi_MASK(index),
-			   ASRCSR_AICS(index, clk_index[IN]) |
-			   ASRCSR_AOCS(index, clk_index[OUT]));
+	regmap_write_bits(asrc->regmap, REG_ASRCSR,
+			  ASRCSR_AICSi_MASK(index) | ASRCSR_AOCSi_MASK(index),
+			  ASRCSR_AICS(index, clk_index[IN]) |
+			  ASRCSR_AOCS(index, clk_index[OUT]));
 
 	/* Calculate the input clock divisors */
 	indiv = fsl_asrc_cal_asrck_divisor(pair, div[IN]);
-- 
2.34.1

