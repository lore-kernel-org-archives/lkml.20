Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB6F399013;
	Sun, 13 Sep 2026 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789295123; cv=fail; b=HoH/35uYCz4GSp8wzVZPuWA9t/EXa0kKb5vgylyO5nfA21t5rgGXt5i4jCVLkEJHeXS1U+ygDfROcB80LrrkmOw/sJ2ulmFYW2U75EmxLWcmxqEbx1/ZqW4J6tb2lGJ8ID3wVvw5driark/b8JAvnxyzObQ2RZ9OUEkzFpmi50w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789295123; c=relaxed/simple;
	bh=uzXSMxCnwOtG3p7LxpFlD88BoHiEBJikDuixF8j6RLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q9sBi8HzLuokoocoVzEprsB4R7ovhmAFMKtqbUGQk8SmV4kXmYrqZSmqx11qV5Sfzft01Sg/bGpK4VMLO3rEL4XDbvsqC5Y2KyAtKJ0LLgWysiVQepHpxodVDDS0A11WpB+TInokH3EVUFHo1Thhat9DkRkaB6l8lpOceREe8J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X+UJL9Ik; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X+UJL9Ik"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5DCU9oRwl10UkV4q8Z6J6gv1/I6mFI6Jx1rnxzv+KOGVwuHGjaHJM8brH4AScaWfRaVXnkMZfvpFUeG7CIQshPEpNHU6NXC8aCMYrQREBZl2l2zcznSO/wqxpOul4ulDAnI3ITdQY0YqJywK/rk4f9C+QOrQFtc4woqM/KXUnJoJTLej7HTJCJVdyxkM52l/Rqa3COGTADvo0BKKvImTogf3C9m1bWk7GWSe8uXxOilQh0rQbRYNw9OzZGItO4jhieGW1pzXP6TzY5msnQqtjV5+V6rLEFpdokbG+lst+QiuTr41/bwM+MsGCJp/sRjM9vSCWsJ7uJedL9IPk5zUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmEtEprRXxTbOYw8Gvjd38oBCXOY4RDIk7O4QrZ/NJQ=;
 b=Fec8qRzNy88/3vI//GeEtGaxSa+h2fl7AF7GkPwteC38pFuGA3KIe9AgfWmkxgULTz8r4XNFad3c3V2aZAPKzkA6crhdpRdvnUHqYNqtFZaz8ecpG4LvxfGOnAgvvroR+KW/zG+WyQ1xj2GDicrTjGwXOX3tCDYPGnrVCZa1zyJh1CIb/LlCBv7A0zp5S2AP7jSMiMkyIApXNjgQy4DXOADOpdZtE7kQcgBMvpLtBcGerFCzMwsjQ+HFwg7qmWasobH6T5nSV2l0IUWvQPMdYl1VqC/vg0+nk5AWiIZAOzMBKRx+6Ku8QTxX4Oi3pMQNOCkORN4PVBrlMOtbJUD9CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmEtEprRXxTbOYw8Gvjd38oBCXOY4RDIk7O4QrZ/NJQ=;
 b=X+UJL9IkwdXfrshTBFBDmvIt9UVKUwEmIa9MzPqgHWXQE0yFu04Rq2X+DjUONVl/hoW+EhYZr8UdppLq2Yi/h64WtWu8OzBDI6qIEeOel/jzQNPe0xAldescNvDjDqExXii95wn0YfPAEPF6sc65YRLg97cgLYslUkGjgNObVvV3hs6YowAIOspnw3IT1i3Kw3EqaxH5+yKKI52joUvavWmjzgTmZoV3292heeeCHB9/4msPAIp63dyqvpjny3GXiXC6vaLFyNfQZhpIbL8iDP4UVZ7pk8/SxFlo6FwNc1SADOD46yGbF43y3Tr9JnqTXs3V1Xi3O7FhIjqYCGIntg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB7006.eurprd04.prod.outlook.com
 (2603:10a6:803:137::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:25:18 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:25:18 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ASoC: simple-card-utils: Add simple_util_remove_jack()
Date: Sun, 13 Sep 2026 19:24:59 +0900
Message-ID: <20260913102502.2805912-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
References: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0204.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1c529d-2ced-4750-51a4-08df11814ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	1SX4s2OWYJECUcFzodVLMfa2Ei1uXGAhQZF/wO/6Qg+L62ahVGs1krzR9K98wZ2OBbgi5TTRdkmduEki5eAZOZP2DTag7EAEMOjXVWKdoBm1IB04zstjdBNwdktaRa1BkwPXnPlbHPuXCuQXVUjvcsH6XbwAUMUcAXuTk2JBMztm7hTjZY5dT2Y6hYQfmW4T6izc43wGnAn5gz1Em9sdVf+nw6pSMN8u7UhaupjBQscy7Zqkt0kTDDoYWqiExdWBzAJMFz7V570zi7ZhHrIvBFn6bjhi4Y8RUKEBkMOHI8Uir4Njq54uG1cMNctWkTMIU0Ome38lPGnlvodFVcUfvGY9QK0EStImlP83m8yQt/zdnyi3bSUTVJUxdC9Ax7MjpqiWJgSGa8eBbi8zemsTaBS7gaSgmx6GrtWT9R6j3l8bOBHc3izeMVs+R3TXh7f1zaStOnDj8ZIVcLTs0HXGYEXZDLMHc+9RBDAfmHVkrK663N0P6OXihBsG/mtMj6X54gVsb6+KgzoKPePCJbTY9HDoVPA/GPtrGjIbRQv7I40aSHQnZXlc9KB2nlmY+GDdHwdsdyuShi8MGxtXrKmUg77KTIo2COZuNM96mLouQJm+vfQWjrUhEdwoKlE8HZqr6pBt3Xq+elybrT1JD3jXg7mpecm62mFTUctYKUjhd8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PBdeGybR2ULpqiA0wkbLF1a6WMqYCfDud7KsH/qv3TPxGXEqjHlu/ZKJPq5S?=
 =?us-ascii?Q?J5Qft0uD5DJL2cF1Y/WVqvIRgSkxd55EwUIQ8l66WIDyThkSVxEceFt9agzU?=
 =?us-ascii?Q?KaHxgvGpjJd9yTcLmGkfiVRchz0iM7LJzVBabuZW3ayoEkSDNOql7Af+WVqJ?=
 =?us-ascii?Q?gSYzcbzX/gTaid8kx2ssT/hi7phh6HOWnVMAFXhnsM39TPLIC60/+QpGRiJ7?=
 =?us-ascii?Q?FuOmAqbafZTSjKaJMK2jTZAOKUslcbu7PrbiF4qB0L9lCqvCLJoiD0zTJgt9?=
 =?us-ascii?Q?xrgGSfbUzqrffo5hESQ3iqvIP/Qr6Pd6e6e4m3mr1gpaEVbnmVa+XDOxLMbY?=
 =?us-ascii?Q?XkyeweaqWagMgiGgTkQUghBFet45kAe2RF9MihRRY15BHhI9I4yPJ6c3uheY?=
 =?us-ascii?Q?HM+CbTLKYaSvLkTQU4LlDKsnJAkN9XNHjxhQa5n9SguBvaZ4mrAcUFrYpMsf?=
 =?us-ascii?Q?sGzNPoZ6LVn+3VUn3RZm8EwTOjKxsIsN+/V2/RlHsm9w7D7vbN3srhCdkJ3g?=
 =?us-ascii?Q?Gl9nAakE49VGzoi1qFaZ2sjFGTFjSb14zYCkvq9YrbeIrD+zmlrK+/eGfkE1?=
 =?us-ascii?Q?G13hx44BafSDwg6c4GRNzTp7dTLXuOIuGTerHE852sWzcByy2msiBI5IFNf7?=
 =?us-ascii?Q?0P4k8j4kAh5SJKYVclSkcoW6IthIPHq9CTaDuGDIk8lMPvddvpSkRPjLZ7BL?=
 =?us-ascii?Q?AegaEBHp7khyRh5TyHZ+Nz0rDxs3o/AJe9odA9WRPZx0BFjFcc8JTuQ2IDsc?=
 =?us-ascii?Q?wocuXNNixImqJ6o2PTbaDVP40Zb5dcotKmS9Cd+t6qT7uXEdRqR2IQdRPkEU?=
 =?us-ascii?Q?vS2AOxthqx3LWnprfthhzDket31Uu95zVC+LAkKDVADJw6S3Z2mLj6xEdfUo?=
 =?us-ascii?Q?Ej8/5CsiH3bhK+oUMUGcVMzvUUQXrzsqdNKRQ9chJcfujAaZpYLgrpVV0uKb?=
 =?us-ascii?Q?yxuZtrSt0Yrl6mCwlKF2eBVMQc24I1hW9pth+Wav3fBfZA9cEJzsVBq6fTAT?=
 =?us-ascii?Q?0IXTw42X5crrLoNs/iZssdF191/6gpfnLIanITHMAUGcXErJSkq8/W6igpDl?=
 =?us-ascii?Q?8EsQ1F2oD+YZ1eazGbdnPIlBqip98NS1gepwMQP3M312K/BOb9dz0W+UQZ3+?=
 =?us-ascii?Q?T2dDqduijIVV9ZIaTRVVoMzetX7WB9t50QL0NDkvEgtG5wLL8QQ3GsIrexpt?=
 =?us-ascii?Q?jXZFHwP9U3S9HPf0nQTtHmHr0q7qQuSYUizY3gnWMmgR0m2NyblGtPZmq+DE?=
 =?us-ascii?Q?GsmYlMKnwxcAOyx+ppJAjdtQKVXtp6qrl0JqMNAkeLe9R2RA2/xuKbmlysHl?=
 =?us-ascii?Q?tTGBsD/FOtc5z9KK3NIqvYT/SYEqY+gi+7TVzAaPLsdddoNoTYn1N6shR9nn?=
 =?us-ascii?Q?jK7CAMicHnRmoDQP4a0DedsN1G7W5G1UVxMGkjz1rKiNft/CwpmiVSZOKl8Z?=
 =?us-ascii?Q?uI0e4phIDx73PJj4yb5i179J40W4/q+mFAMSEltcgpGmKZWppxtA0ZBtzk7M?=
 =?us-ascii?Q?wsjDnVT320Ziu0j08VayhdLioqEuIpY7fCjacJJ+DTedYVDJXYDPtqeNbbwT?=
 =?us-ascii?Q?X/HVFQmUMCySxYOQEsH1xE2UIN3LeUaF0GEjMEgKsti6ywm1fJvOLDyzSUoE?=
 =?us-ascii?Q?cEmZwjo6H07BUgT2brzy2IdW+nhKBII4lcSoGWrC/gxD4TfzaQd69u16D/GK?=
 =?us-ascii?Q?VXF9XHQ9eD9RP6OdfpO2sVDkgCddGIh28N8+dqqu7hvCw6nbpfJqyA8GzQOD?=
 =?us-ascii?Q?6nMYs0J6jsLvMZieIwck9uyfVkvHIWGBOJkflI1xkWqJXujLhLpB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1c529d-2ced-4750-51a4-08df11814ed6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:25:18.2245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZ4MHsO6oORnhcj4K8xZVo+Lqt2bWXDYsMQRGd6w1EX5nJdkzfblxxxH/5TDt8dUCR8ByW6C4O4dhr9WgKqZqld9CYldULswKrvkmfebRLI0scy4w79mpxNOrZ+dOdgo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7006

From: Chancel Liu <chancel.liu@nxp.com>

simple_util_init_jack() acquires a GPIO descriptor with
gpiod_get_optional() and hands it to snd_soc_jack_add_gpios(), which
additionally installs an IRQ handler, a PM notifier, a delayed work and
a sysfs export for it. simple-card-utils has no counterpart that
releases any of this again.

Add simple_util_remove_jack(), the counterpart of
simple_util_init_jack(). It releases the jack GPIO and everything
snd_soc_jack_add_gpios() installed for it via snd_soc_jack_free_gpios(),
and clears sjack->gpio.desc so the descriptor is not left dangling after
it has been put.

This gives the generic card drivers a card->remove() path to release the
jack when the card goes away. The devres cleanup alone is not enough:
it is tied to the platform device, so it does not run when the card is
unregistered and re-registered while the platform device stays bound -
for example when a codec component is unbound and bound again.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 include/sound/simple_card_utils.h     |  1 +
 sound/soc/generic/simple-card-utils.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index bd8c3a033577..b0e00555092e 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -219,6 +219,7 @@ static inline int simple_util_parse_aux_devs(struct simple_util_priv *priv, char
 int simple_util_init_jack(struct snd_soc_card *card,
 			       struct simple_util_jack *sjack,
 			       int is_hp, char *prefix, char *pin);
+void simple_util_remove_jack(struct simple_util_jack *sjack);
 int simple_util_init_aux_jacks(struct snd_soc_card *card, char *prefix);
 int simple_util_init_priv(struct simple_util_priv *priv,
 			       struct link_info *li);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 7df5253499cd..b91924d31c1a 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -825,6 +825,16 @@ int simple_util_init_jack(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(simple_util_init_jack);
 
+void simple_util_remove_jack(struct simple_util_jack *sjack)
+{
+	if (!sjack->gpio.desc)
+		return;
+
+	snd_soc_jack_free_gpios(&sjack->jack, 1, &sjack->gpio);
+	sjack->gpio.desc = NULL;
+}
+EXPORT_SYMBOL_GPL(simple_util_remove_jack);
+
 int simple_util_init_aux_jacks(struct snd_soc_card *card, char *prefix)
 {
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(card);
-- 
2.50.1

