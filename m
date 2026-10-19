Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F6D4E1C78;
	Mon, 19 Oct 2026 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407983; cv=fail; b=D7i2tGzQeEmO/9TSgR7L5HjoreZZnpBHvCubaYRapy8Fh2L6yR1DI4uaXMYduzNApVPWfHzY2J7VIEWZekYkL3+9mQYIt/a/5St0lWxhVd3Ub5bjBEiK/jLiuonfdhvfrpOkcknxYDH9MbNMTFqIcd+3kVrNwq50Q6zdrkyoQd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407983; c=relaxed/simple;
	bh=lpUjam2+V/u9xTUv9mkGGuA6eprBHnJ9HFXTv2d8eBw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IHEOwSu0+dSib9d/qNKyRjG3VPBzcXkC3ipyZ9MjsH5sfM7GwRKtQV1uXo82VzR6BFzwyxsapJcXbjYHQe7v8GMYHuMaAu+G23n3kpCF11iG4GE2d+dBgXuo21Dc21lpCU7UOSwaFOBNNlfTtoWaK/hKnZO0NMWpznCfkLf03L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TAIsDySj; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TAIsDySj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDBFoRxqQGNgaYyqhOmEkhLO7W9LvsLuWlcOIvSLhPtIDVLOOgBYqZvrIHxyqv4xZEbLHHWAqEKU2d4S1x4GHZjXoZLfzmCS2YN/EEOy0Mp/joFeyxo8pAhTP/tHfHj8goF+3nAqYUNUNvn8hzXizchd6NR9H8fAFEGBiq+s6Fgqb5czBxYSgvQeDOEkljXBDQ57uZhIJ4E6OyYQm6mJV3CIxV+f1fKCZ6D1Znm55gv7FmLTqEnnJBTVEWDFL5/thdppVPESMQkF7DLLfs1fgbgFtjZ1ORpftel7m/DLmJyns3YdewRHLxyUAv03ResUDab3Oys50DIaoCsvP7nULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M0EsXXU0l4ojV7rBZCmyL8cdOOKYACrvd6ZpiApoV8=;
 b=f/CtMyk9DIxVvLPbRcbYmOV4wj38/I91hevJKYSGzOpCvYK1GbCbDHSZ6Yez93v1D8Vl+Xjf4Gblk243QWUxZYzled3n7BM2JYflnBhXEdldsDBwa+ajXzJJV1nDv7miOiePNYY5HDywH0zKqFW0SlFHXyX3CiPh0BxQsFBLlljqPz4c/jbOEJozEkaw/y2l0A8+uOS0CyHMeAEYJd9SYKJb/n2+qZLD7hIB8jWtjSe2rGLTcOsXJsgOOXwBIPtPGjcviZx2mBGH+M1aFzqAPoQSsJd5DOhJdJJE/HTM4geuaSCLHXVqctiTOli3o1or19/mVkYkZatGu9jIswP24w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M0EsXXU0l4ojV7rBZCmyL8cdOOKYACrvd6ZpiApoV8=;
 b=TAIsDySj64+KnDAY1yWewcs+duYJXT7P52+Q+aC8pyVn8lBbL9ymXkIUfRamafmptgxzFlRIAyDre24eQgGb2PfJ41wUYZuSrLfKHj9IN8iiMa3QPkTXb6KZOjAYhsiIo1NsCH2bioc+DckJjwZLgTDLJt7o23CkTOA3+2zoztcC3BxUgncucdGIrYwR7pPApuotyctMWYs/bVbZPvUXhCTqgyRCwB3Wu7gXXbgIq5Q7k3zHNm1ebl1qfuZlDcs/2qwWimFYplIu2cxWr4IYM4889wZ0IAmV10nDJqB6DcXoQW1M7LDpk8kgoShF3kmi4qMtNSJpEgWPsNz2ezGnMg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:06:18 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 11:06:18 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Mon, 19 Oct 2026 19:10:33 +0800
Subject: [PATCH 2/2] arm64: dts: freescale: add i.MX937 FRDM board support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-imx937-frdm-v1-2-76d949a61954@oss.nxp.com>
References: <20261019-b4-imx937-frdm-v1-0-76d949a61954@oss.nxp.com>
In-Reply-To: <20261019-b4-imx937-frdm-v1-0-76d949a61954@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:295::11) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 67af9bed-d4e6-47a7-d2d7-08df2dd0fec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|18002099003|22082099003|10067099003|921020|260925022911599003|260925021311599003|260925021911599003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	j06T2/tFquxiD7/8U0Cu7WWF3R6yvII+HhIMLpP+J+2daWJHRJ2iSGE7uUHd6gBhwgg9RECMThWVuev8xdj3zuuMgBYh0r94FOYZhrGtsK7Xxw3GdbpGPbZQUVpEqGNr/IGmn/Jy/AOTxWSXGedA9uZy6jN7jZoivLHCkZI4gLFqzBPy3nsV9HZ6GA5TWUVOdkf+nBclqJu3t+AgAHTBnLsnNLer5K/3aYSWnaWgRjg8c8uJVyicYSdrKhVPO6AnZqZ438Vl53vBXuK+T9SlQN2t3vKCKzIoKBZdQoe+HoqjwsF+FGXR4Z3C4REDG34bZbwi/rg0pOgJPTm1Bhjp9bWlX5VfWaVhwwO42/LtUffWOAgbNNuNNueoRStYb/DHqmfe/14UYVqxFZDDV2Zbj78Z27oTPKvZ3GsQQmIzL408fh929FwT49gl416ZIdXoeRUPAEi+bDFPFAq2gZJxgO1X3QabYrG8m0J4fbc9ucQjUMysJmxYzj062HcoL/QYcDhhfJk8E6llrduUxQOh3F7ElNjAeZEfnroAcPjMBzLeQT7DBANAkW6cpUGxuMTjM6hyHtD6DhdOMBQmjFYHszT9t2jwhl1490+svl1Ja0l2OinFu28ohRxUaj1MYp27oE9nfKcT3M0Yv6qLxFubiWJ/sIlGGVVbwy78fW3o36w8NZoHlWzYBto5r5QinX/jMcKNTILJt9gZe3PfqdEJBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(921020)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUFJdGt3MHZDcURSSTlLQzBnVEZheFVicjFSWjE1Szd3WmlNZmg4M1BtdW14?=
 =?utf-8?B?SU0vZG1CYzRFdkw4NUdGT29LMjdLQUVrL0U0b0tqOUJ2SUdZSnNqaHd4RWNR?=
 =?utf-8?B?WHpqbEYzSUp4M1ZIOHltZzliQ3R4K2FBMXE0WHNRVks3NU8rR3VxSkdoTnZ5?=
 =?utf-8?B?dzBwU2lvVmtzaEcwdU1HSnd5d0FHaU5yZ0tGM3hzcmxtUVRiYzZNSld2Zmgz?=
 =?utf-8?B?UnllUFRhWEttdGN4WVdaYkVHSndkRjM1Mm5Taitrc043TGg3MmZhMXJJM2VZ?=
 =?utf-8?B?SUhZU3lYYmFGdUV4QWRYMnV2UTJmeG91b0QrTVdPT2Uyenk4aTVxMkR3YkF3?=
 =?utf-8?B?N1R4NUxqUFlyN1VOSzhqMW04LzFvUGxZVExlZnFBQVNieUJqak1HSHQ2Uy9s?=
 =?utf-8?B?L0tWMmdEeHRxOXMyVjQwVHc0MlcvRHRFbDNKVW9ucldYV05mb3QvdmdxcUlS?=
 =?utf-8?B?MC9FM1JDc1FzYXpMUHkrNXJEaWJFSnE0UGdJMVg1NjNIcGVYT29CQW5tYi9I?=
 =?utf-8?B?UFZwUzY4OS9aTCtFNGxZamNvODh5bHgvWHBXYklZakxZei81c013dGhBZmlI?=
 =?utf-8?B?K2xvTVpvSERJK3c5V2VRZjV6aG1PN2YyRW05eFdnWnlQVEF0NlJKVHRuZ0Jj?=
 =?utf-8?B?bDNkeGd3VTEzVWpmdmdJcHRhRTRiYkRBdFRKbnVsZTBUVWhrY2xONUMxc0xq?=
 =?utf-8?B?TWYvNGkvNnRpQzlYWHZEZ0R0WmZPSy9wZDdsaXVqT25CenhwVVFaWEFWWXVX?=
 =?utf-8?B?dmRsTU05ZEdrcVVqY2xFM2hjdTVkWFo2N2ZqNkM1MWpoNmxiSjJtd3hJNmJ3?=
 =?utf-8?B?RnV0aFlnT2FaOTNHNWdCdTdWa1VwY3FXUUVLYlFVUE1BNk13Vkc1Y09QSzlK?=
 =?utf-8?B?ZnI3YnZzd2R5SThJcXdsbGg0T0xzdmhJaXpxaGdUd1gyWjhiK2xxelArcWQx?=
 =?utf-8?B?bjIyazU2SFVTSG9NN1FFWHpIT2RZZi9hOS9Kb2xyclNzek9DU2JiejBoVXVZ?=
 =?utf-8?B?RE9EY3hhV1lNWGV0YmphVTd2U2ozWms2MkRRU01XazFVOXlqSmplU0RKL1B1?=
 =?utf-8?B?ZU9rUmowUWhVeHJXVE1weFlGMTVoQjRSQjU2UXV3amhudm9RdUxVWG1qdy9n?=
 =?utf-8?B?REkrSGtkdXdUL0QrRnFwbGwxRzB2VU5ycnVZSWZ1alFmMzAvYmFmVlpDdUJo?=
 =?utf-8?B?KytQcmNuTFJHYnRCTExLUGx1UzdhazRMSTlpb3p2OHVDOVE3TzZCOGRwQXo2?=
 =?utf-8?B?MWI1UTdtc3ZyZFFjYnFCVlZLTTZDZ1lhQVFmNTJwWmxZcWszN2tMVWdTME9y?=
 =?utf-8?B?NjQrWmtFaVZjSFFkbTlKWUJtTDVyMy94RVhDc1Y5WWFZTW85eW91ZzZtNVZX?=
 =?utf-8?B?RElEUUs1WWRWVFpUaXNELzBOMFRhV1ZHUlZuSngrSzcrSjZ0K0MrWElJM0tl?=
 =?utf-8?B?QlcyTDBYMXRzY0NaS25LZ3ZjbnVsci9zUCtJbzkvay8vRUQ1cjgvYlZNM3pn?=
 =?utf-8?B?dmYxek1yYnM3cHowTk1MdENTOU9tL3J5WDdncXJnZDI4R0V3Z2JkYXduaHl2?=
 =?utf-8?B?ck5aM1l4a2h3ZGxrTmNyVUN3UnhhaDhYWnY4TjgzemYrdVFqaUoxMVd2dVVq?=
 =?utf-8?B?andDbFZEeEZpcVdXOGhRWjYvb2NtaGtjWGVIZmkrZldKdUk0UFB0NHRFQWZa?=
 =?utf-8?B?UFEyVTZER3dJbUh0bjcwbm94RG1MUVVyRGZOcWtGTHQzdmg1d3dhZ1ZGUTFV?=
 =?utf-8?B?WjBUZ3FhUGZxQzBlWkhEaFFvV1pEY0lNTTlyS0ZQRkV5SGdOVlFRUWV2c2ZS?=
 =?utf-8?B?ZWpnWlJ0THkwUXJPSnJ5L2FabW5zUmVSaWdzR2JCTnJHL3BuMTJpZ3JKK3I3?=
 =?utf-8?B?VWlCQ2dDS3dQOGJ6OVNSbVBuYzI5R2g2TEpxVGlDdkJ6UHhxWlliZno0TGRq?=
 =?utf-8?B?U0dheEt5YTRwMHVXa2xZZm9MZjB1WHRUMHU4bXlMTEZ1cEw4T3pCZm13cHV5?=
 =?utf-8?B?dGdHMUdtWCtEM05xVTMyZUU2RDRpak9yRzhaaEx1cXZNTEhlMmFqUGhpak15?=
 =?utf-8?B?YU5Sa05hUUtqcThFZFVZNldjM1A0VDFwN3N4MDVCUUI0dmFCTWk1RVBwd1hY?=
 =?utf-8?B?MVdHc3gwSkJkL3Zmem9JbTBBR1ZYNTJkS0RCM2x3RUdRWlY5RlNmeWRlL3du?=
 =?utf-8?B?bFBGUURuS3JuRGhSUldXVnVvU2NjUlVzT1E4Z0hhM3o5alpwYzBSMnlUdHlv?=
 =?utf-8?B?TmNuNWFvMnNGZjVvRS9kM2VhMXk3aDN5dWMrOFBCVmpVWFVzRXBhQXdVdjVW?=
 =?utf-8?B?WlhuK2FJN2ZncjU5NzBHSkZpNDNRM3lMMFl0em5lelFHRjFXY1VNK0xEa3Ru?=
 =?utf-8?Q?QjW30VkVNa6ynee2C/pTdGz7dFpJlP9e3w5Nb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67af9bed-d4e6-47a7-d2d7-08df2dd0fec0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:06:16.1647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgqJPTD/s6VfKJf85O0dRIZQF8DANp1R4x3CYsSuA0bzybOiyA42KgnTwVFs+NFC5uLHD8P/X8jKCHKQ+/xKKH7v6iL/Y5txIG6RlIa9Bg583v0QTGOeosFNvbRsmB8G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866

The i.MX937 is a derivative of the i.MX952 SoC, so it reuses the
i.MX952 device tree as its base. Add imx937.dtsi based on imx952.dtsi
and imx937-frdm.dts based on imx952-frdm.dtsi to support the NXP
i.MX937 FRDM board.

Compared to the i.MX952, the i.MX937 drops the local dimming and ISP
blocks and runs its Cortex-A55 cores at a lower maximum frequency.

The PCAL6416 GPIO expander is at I2C address 0x21 on i.MX937 FRDM,
unlike 0x20 on i.MX952 FRDM, so disable the inherited node and add
the expander at 0x21.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx937-frdm.dts | 111 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx937.dtsi     |  12 +++
 3 files changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..5945969ada9c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -944,6 +944,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx937-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx937-frdm.dts b/arch/arm64/boot/dts/freescale/imx937-frdm.dts
new file mode 100644
index 000000000000..d6be48c81057
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx937-frdm.dts
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx937.dtsi"
+#include "imx952-frdm.dtsi"
+
+/ {
+	model = "NXP i.MX937 FRDM board";
+	compatible = "fsl,imx937-frdm", "fsl,imx937", "fsl,imx952";
+
+	can_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		/*
+		 * PCAL6416 (0x21) pin 4 selects the CAN/GPIO mux:
+		 * low selects CAN, high selects GPIO. With GPIO_ACTIVE_HIGH,
+		 * mux state 0 drives the pin low (CAN) and state 1 high (GPIO).
+		 */
+		mux-gpios = <&pcal6416_21 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	can_mux_pinctrl: pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can_fun: can-grp {
+			mux-states = <&can_mux 0>;
+		};
+
+		gpio_fun: gpio-grp {
+			mux-states = <&can_mux 1>;
+		};
+	};
+};
+
+/* Select CAN on the shared CAN/GPIO mux when FlexCAN is enabled. */
+&flexcan2 {
+	pinctrl-0 = <&pinctrl_flexcan2>, <&can_fun>;
+};
+
+/*
+ * The CAN transceiver silent-mode line is on the 0x21 PCAL6416 on
+ * i.MX937 FRDM (the inherited 0x20 expander is disabled below).
+ */
+&flexcan2_phy {
+	silent-gpios = <&pcal6416_21 6 GPIO_ACTIVE_HIGH>;
+};
+
+&flexcan3 {
+	pinctrl-0 = <&pinctrl_flexcan3>, <&can_fun>;
+};
+
+&flexcan3_phy {
+	silent-gpios = <&pcal6416_21 6 GPIO_ACTIVE_HIGH>;
+};
+
+&lpi2c2 {
+	pcal6416_21: gpio@21 {
+		compatible = "nxp,pcal6416";
+		reg = <0x21>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		pinctrl-0 = <&pinctrl_pcal6416>;
+		pinctrl-names = "default";
+		vcc-supply = <&reg_3p3v>;
+	};
+};
+
+/*
+ * The PCAL6416 GPIO expander is at address 0x21 on i.MX937 FRDM,
+ * unlike 0x20 on i.MX952 FRDM. Disable the inherited node.
+ */
+&pcal6416 {
+	status = "disabled";
+};
+
+/*
+ * The 0x20 PCAL6416 inherited from imx952-frdm.dtsi is disabled above;
+ * re-point every consumer to the 0x21 expander (pcal6416_21).
+ */
+&reg_ext_3v3 {
+	gpio = <&pcal6416_21 13 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_ext_5v {
+	gpio = <&pcal6416_21 12 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_m2_pwr {
+	gpio = <&pcal6416_21 11 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_usb_vbus {
+	gpio = <&pcal6416_21 15 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_usdhc3_vmmc {
+	gpio = <&pcal6416_21 9 GPIO_ACTIVE_HIGH>;
+};
+
+&usdhc3_pwrseq {
+	reset-gpios = <&pcal6416_21 8 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx937.dtsi b/arch/arm64/boot/dts/freescale/imx937.dtsi
new file mode 100644
index 000000000000..7912a9c282d8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx937.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+#include "imx952.dtsi"
+
+&gpu_opp_table {
+	opp-1000000000 {
+		status = "disabled";
+	};
+};

-- 
2.34.1

