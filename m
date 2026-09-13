Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8E3E4500;
	Sun, 13 Sep 2026 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789295143; cv=fail; b=USDngCUF6uVWrrKpALrfZV2ji3ppAmBMkXYekaraYDxt++onK1Wkts8fbrSFanVd62r51oQfQ3k/mJeOY4cEEip12CuFqDYlSpoMQ7rH41DAzJ5QMdERiZVPyb/uV/HQ4DhWdRLxvW4pxdUwK3FUittxuK4I6lnAXe7v4zwzXHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789295143; c=relaxed/simple;
	bh=XM+NNCiL2n0Vy2tzgdVhuCuQxF6DD1XdZ2ZGAtaUetI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rMLjQLUjKHy4x6eztJejIVkac81YukZ94JI8Y4y99jVUNJI40j3hf8+t+yhMW0ZcTkojRlABh3KaGidmynI5TM5NHOJnqAtYiW+eOhoAQXObMUR3ms1kfkWt9G1W55ckMSTThgu1t2hdy4P7o7U9QfItOfFkpO4x9VXlJwKCGLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UqRVhSrr; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UqRVhSrr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvq44xe6so276Aa1ULFCtAXIR23bDav/Swc64kY0dDW2FOUEAocaGAqCrzlidV9DLk3fn/wMgpePnX6ibedJd6hQzN+cQe3+sDn7goGlYzxQk9BTRVubAyAL3qwRlvn0jUJafMEEWv9p9abna/WSBjUIS0gMsiuh+k8+Ww4iyr7fTM3JNdzacXpbWzNMei4ENsMvFLjkcDsFnFNSF8MYQE8yFDN1hau+l4jIY1MQ1mIqeiaJbSafsO1mlnICUOtG2bykjLYJnWbtFlLH5m8ttzA14OJ2eyoHg0DXR/d56/ojA5qiVPxKP3pEGyvYa9p4rF+OQX/UUFR9rA1JYS26Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ci4nd/5C6hyI4D4TFBnMcKwYbE8fdmy7HTv6nXZ+zkk=;
 b=IoeWPIe9SAloQGrJVgD9puNmiF58KQ3XNikxkAhsTUX/H53+bIqQOBZG56CU3A4ApN3IXkgrPKR7uLx10M5VUN+EeNpYn23qB+CQqdmTf1BV4fFima2NWwfwuQBEjKwwVcAWkSu0V2W3vGR7twm9P1n31/hhA3VIP1CXSEhF5c5lNuJhTGV0M4hKzhAtFzQjoNBJwNMVjWP5Y4RVGxTpO6Gwkobq9rR/aXXnEiKAUNGS+44kfSEOgF9q0I3z1hlQVcZh9jLP2fT8z8xluodfJLsiAO7GjwtnJ1tThTykwtEqBjzYicn6lBmSms1osdhpmu6wojLVaWidLSDbY/wNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ci4nd/5C6hyI4D4TFBnMcKwYbE8fdmy7HTv6nXZ+zkk=;
 b=UqRVhSrr+UXl3PGf7D2rhfQcbXMDaBDUdjfTvka3r9XAOIDLY7g7a7deCKcy6sHsplv/XxYMoEDy463ktazjRcGgYxwBZk/SvGHE3T7/mLnbuOYZvGDkTEP6YFmaj60nznVL9UYS6D0ANkijK7Q2xOT27exwoEheXPY2gJeeqtjZr2E3i/pib70olAI0Du/JZoTV7aW1NC/qOSYpIokeIWlJZ0HmOUp75ACc3l5Nl3loza2AoLYJFUwDhrxYFcwvR4C1R2HewbpjouRiCAnHUK8awqemCkACJeY5zESS9Po8SLtWbDA8L0S8BGvi3uGRFV0JKSNd9QTGGTIs+/f6XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB7006.eurprd04.prod.outlook.com
 (2603:10a6:803:137::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:25:32 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:25:32 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ASoC: audio-graph-card: Free jack GPIOs on card remove
Date: Sun, 13 Sep 2026 19:25:01 +0900
Message-ID: <20260913102502.2805912-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
References: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0043.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: a77ba83e-7c3c-45fd-7794-08df1181570d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZzxdNbipPrgWaAKrXzCuKqgairu3f3uZT/oJw6OWUv7G0waWHTovbxy1tb6o3gqK44HHtIFmOhqY7FlNmx7XrBanOn8skuBFOPBczAF6dycEEXpnTBTtcZZNGQsWK4cJai7qp7VQV9ZYI/5mehnoHj1vgOkEGgJIs1LpbXDVGm0x27uxvEqnh64N+6CdS0aaefzW6da0kilkrEJMqDQrwJ/7mTz8GElbzl457nKHwB0XlsmQhpRlunM8/li0wzbAsMhAsG50xb4+RhHCRLPrFZDRsEZWIEaT8qB3N+bOk+NwCrXxuTdQ8FCB2W32DrxQxGpTAkTAMlZPd/nX0ps7wjnS9XnY4vPq21TK+3vHZMhZJAd9oibhOEry46I6roC/R17LnLgL6QsJh7srilS0yYNAKOCfP7F5+BZljn/pCmvSl22IEgotaAjM1Q/zg3V7Vzj5hn5yN+kiaFzeZzWu3IZJrh5MWiMceZdEmV2J9T8VEMoOqdEqrstnfpaaT4pIvaVinb6SbdQoeliRfRYQ8/X3ECOxyDFEr/djQ67tUqBPNVMWrw0NjjmwvCRaurS9pj+dyOYeVTaZiubi1WIoruYvAliI/LIIagIhnq4C+MkYQjsIbnss5boARJ+sFzH92oZKuGhtTD3tBwSoxcsmL0+WEXj2uqvequELdwfY3bo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/mVySa1XDAacl9QizNa2WWS6rLna+RlRnaL3TSAezlcEjKhNAAuoLS6RjDb0?=
 =?us-ascii?Q?M2I0oN1QChywRyzYxC0xIIjJIM0x+TW/FqYbDtNmxpe+sd0sQobXz0tmaAAs?=
 =?us-ascii?Q?y/qOV3cdNFvRnjwq4f8CB1xQtiWzW3ZHlt8BvThfHpzanGpB8XDewqN3FfhN?=
 =?us-ascii?Q?A6bSeDlX3Kbr81b3/ZwxTd0G/zI8XXZY/Twt/GEuivxDptrWuc5sbWe19dk/?=
 =?us-ascii?Q?1V1ZDmcEGVFW2YrOQ7o7odDHuTLTau8w0940/Beg/AMP0ObgjFnmXo2X5nnO?=
 =?us-ascii?Q?fGdOnSxBSozyuLdTl2tXF8RAezejlm/I23ALsJbk3ignWuYWt6EblE4A590I?=
 =?us-ascii?Q?IRhvmYcDpvtc84tbJYuxLN1TTaiR8d9j9nkVBZg+KJk3rRRwFhEcAaGyuwIh?=
 =?us-ascii?Q?SCoUJmb9XacZ1NubWadMAVliW9XHW7v73n+eNk7QgUffQgumkWZQnKGRnMQQ?=
 =?us-ascii?Q?F/3UAWoHAcw6MvRGF1wfGgKpl+FPAoTOI6tx+MsDcyxqeh7CyBIYfwdzTkl4?=
 =?us-ascii?Q?eEtyGBx0t1uRC4NsQuLXvQOBEKZbUv40RWQ84ENBiBqntSezwthBSZILZ/bp?=
 =?us-ascii?Q?/LWQf0xpAc7dsIvDpCj2goENpAewaKYXjbfNgFEajC2tKh/fRL15p1a6w9p0?=
 =?us-ascii?Q?xySbwXLYR7qrJVackIi6Pr5FIUeKXTpJRTkdrLr4XLKb+cDBa8r8Ax6PLRom?=
 =?us-ascii?Q?hAUD05rG30/Z/6algkQbcZbam2kbM4AMrVVO7uydUAUykjI4blr1P49aS490?=
 =?us-ascii?Q?YWD1pH8IO1l1EJZtTwhFCL5AmKZR8I3x+sGi0c8ZnqaoK0WE1+OSkbTEl9US?=
 =?us-ascii?Q?9n1Uloi6YRYPEW1dL1a8WggxAlzpFPxyfW73jEVBe/C6+3ST1+kfVakuy0wg?=
 =?us-ascii?Q?6rjWQsziBsQD/w7BlrsV35p1k9CKwykYxm8gCnOaA6QlP1DxBP9WInSH0gGB?=
 =?us-ascii?Q?H8IzBdRuw+P3T+mYYDxcuuQEXjcpYPwG0URcI59kcQGpYWCa1v2e+B7kcQgZ?=
 =?us-ascii?Q?VbO1Vx3XZ36dH1I/schyOazNr1VP4zt8gOFW+ivKdksijejreR54Bh5JBnGb?=
 =?us-ascii?Q?y0Rr0M1tpl+5YchY0gy4JBZYP7ureAMlSnk4SCPJG3rH8hkHoR1mL0z+vv+Z?=
 =?us-ascii?Q?L+t+lP4oU+PJaOcLToCap0qddBzhK5BgsfVC5Dj2cOtQOOogO5tDJZzCpe42?=
 =?us-ascii?Q?VXrrbuYfD/ybcho7a3EufCNCfoO71fgdEJlHN/q1VEy7VHIL//bnDpWHfnG9?=
 =?us-ascii?Q?dEzvxtdJggsRH7dT8l/d4+AJW/QmpX8PZ25t/08zDw9SNbdXv5wYk3oVZ4Ku?=
 =?us-ascii?Q?9pdAgREYAhNDCb64WpEqYb/JRVGKaXCUK8fj5xXX7o+4C3qcw9+buEAvmKvs?=
 =?us-ascii?Q?nhEGS0HcGAwCW39YjXDKHY/1xF2xwmMI+XIj2z4jySWRuhTXOTwO//6NBV2e?=
 =?us-ascii?Q?twL2WFoq1LhAxGbxRhMeaQ3BepiCoZ21zmTVwY40RhCHDfryu9MokdZvECk9?=
 =?us-ascii?Q?UTmlufNlwCveY0g31O1tj5JkdguQB99hSNpkHRUL+5fxnej06mOj64vrPUNp?=
 =?us-ascii?Q?GMmRSc5UN3xNatsovBtRx9UJWOtCqaP7j9K0J7VzBeFOGjqIWZIvPmpvVvER?=
 =?us-ascii?Q?NRKyexwu42D/g9suIrT3daXoHF7CZ85TMbFj+UJmqQ7/jEjeKgqFu6s+6KZh?=
 =?us-ascii?Q?r8dF1H1+ae7UN3ekac7qPaK9yanUY33Hm6F6I7ExL+eu5r0IbX4B+qEKf5aV?=
 =?us-ascii?Q?u3T7WE3/P5zTSahzMKBpIUSRTMrwihyPwg8byRvC4zmoVW9At+c6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a77ba83e-7c3c-45fd-7794-08df1181570d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:25:32.0178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yUFPcsXfv+CtUP+RwIRsVdyrpWEVzVPFH7DlVHQ+q6ZTG8EppDUreh5Om5pHw5C1SoQiYuxJi+S//1luxm2susuntmWCfdIwOpmd5pkd74Wg/K5Nd3Dm/nc5N0Stfet
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7006

From: Chancel Liu <chancel.liu@nxp.com>

graph_util_card_probe() sets up the headphone and microphone jacks,
which takes a reference on the jack detection GPIO and registers an IRQ,
a PM notifier, a delayed work and a sysfs export for it. audio-graph-card
has no card->remove() callback, so none of this is released when the card
is torn down.

This goes unnoticed while the card is only torn down together with its
platform device, because the devres cleanup registered by
snd_soc_jack_add_gpios() is tied to that platform device. It becomes a
problem once the card alone is unregistered and registered again while
the platform device stays bound - for example when a codec component is
unbound and bound again. card->probe() then runs a second time and
gpiod_get_optional() fails with -EBUSY, because the descriptor is still
held by the previous bind. The card is not registered again and audio
stays broken until the platform device itself is unbound.

Add graph_util_card_remove() as the counterpart of
graph_util_card_probe() and hook it to card->remove. It lives in
simple-card-utils.c so that audio-graph-card2 can use it as well.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 include/sound/simple_card_utils.h     |  1 +
 sound/soc/generic/audio-graph-card.c  |  1 +
 sound/soc/generic/simple-card-utils.c | 11 +++++++++++
 3 files changed, 13 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index b0e00555092e..68faec56970e 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -226,6 +226,7 @@ int simple_util_init_priv(struct simple_util_priv *priv,
 void simple_util_remove(struct platform_device *pdev);

 int graph_util_card_probe(struct snd_soc_card *card);
+int graph_util_card_remove(struct snd_soc_card *card);
 int graph_util_is_ports0(struct device_node *port);
 int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link);
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 0a8a6d891d1f..127c2e6b308e 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -629,6 +629,7 @@ static int graph_probe(struct platform_device *pdev)
 	card->dapm_widgets	= graph_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
 	card->probe		= graph_util_card_probe;
+	card->remove		= graph_util_card_remove;

 	if (of_device_get_match_data(dev))
 		priv->dpcm_selectable = 1;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index b91924d31c1a..de27163eeb0b 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1028,6 +1028,17 @@ int graph_util_card_probe(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(graph_util_card_probe);

+int graph_util_card_remove(struct snd_soc_card *card)
+{
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(card);
+
+	simple_util_remove_jack(&priv->hp_jack);
+	simple_util_remove_jack(&priv->mic_jack);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(graph_util_card_remove);
+
 int graph_util_is_ports0(struct device_node *np)
 {
 	struct device_node *parent __free(device_node) = of_get_parent(np);
--
2.50.1

