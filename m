Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387574825B0;
	Mon, 21 Sep 2026 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987664; cv=fail; b=SW/iev5DmzffYq0WQUp+NIUshMwQPbQNSzGxVo+ay8fIUW7bsszSPxEF/T52Ew3kRjfKNkUJMFULg8sBBxGrNuUtd+zcLW1pnFk2jalBudkSjbQSu3Pb2uCfqPV1wLkswShqwTAikMAHJ34DsGvjj3LNk75KX2ICp2sqgCkvLLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987664; c=relaxed/simple;
	bh=PgK0+gRG8n/xAyp6jC++w5seWnYOcf9w68CNq3/LyX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VRiKQaD0nF/MV7e48QD/y/iYMKTI/ZNKim0/tJLNJG/dxxZSnykF1IA/qhROIENviVZgKobvvsuvRDmbKHChYgNFcX5qJl3hH6fpzhrcAvFCfseH2s5stPQZFegIM7oIbzO94T2KNw8SBVZhQj+er/p2F5U/eCgzLwTIO30Hed4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wJYAbxbD; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wJYAbxbD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9OaeDaY6c9GBASHdp4LVJ4cp69FTtq4AVWM3p6kxkHH28Y/hW9egVrFQMXRJ5lgLoiNEZzHLA8KxOaWRdWVVo0JYnRmGb4bI8LoNQH+80Io1GmJuWJ7yoZdQ/+beZjBlU7Dj/KvVkumnrt2MKLflhxtii7wI2vHQgc+f78W1FKxZHWpa5cc+q44aE22JBgt6omDrBWgFtTtVzp+JQi0lwGPlkKUcap7NtyEd4b3YK7D8FI5bWIPq+6bKZJJkxUDI9IY7ie+SssSdqZkujCJayxyIM+PguA8ReYwqgaT/9Ch8MIseuWKv7OLJ7txdDwmhU9OgYr/ucORmNBGQEr44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYRk6dum8k/ZLlscthqEH5dcpW8CX9F8697rr841jgs=;
 b=iHkXiE1RG5fL6taU/P9Oa0djSx8nkpCQ9O/cYwkIiess8b/vC8oTjQzSw4AJY7TB7jxsR+wfsH03BpXjpX0IeHu5ZhazWi0o7XDix0Z97XfkaUgWTk1RzZdO/c2obnv5YnXVtkVJOFk/Sjdcq9V6poZ4ReroRqMx6/8DJYP3QJ6e8ewUflUAV4VwKFjPOlHJ9ZYVjjyHE2HEm/J9//NBa1lOQHGne4WLiJyfeOGoZzkTZCgmWRNg2KChIIdsuy3dgP982n6HQML9em32b6C6rjBgryxbmlpx4bh6AqchyhtPAkPXfS7uMH1wqMiHECNNRfdDtaE7MInn7dF585HGSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYRk6dum8k/ZLlscthqEH5dcpW8CX9F8697rr841jgs=;
 b=wJYAbxbDvTzAOShqNVe59V+n7rRwdcqf7z1vBkRuGtH1H2PaAizJg7GJ4c/F5T5JTUyTwzTKLVqusSepUzQ8y7rlvQcnO+S4YkYjb/0SND2ipsFV/5W2W80/jZQSBLdSATXB+QA880wDApgrEXRe/MS3yijK4l6LkG4m5bMWbQ6ww8CxNn7/9y12NaRWipOSq1hzwClSyndSEKNfWThKKQTKugxPkgKmaza7o3tQXYsJWrROdmDnF3GTkG/vmw/mZFeQGrVtzlHJGCQUKtulAQ/hRwVqWc467p4k8fce9azoqojla4K+a20TnBFw1AP5G3etwoj6cOVvzPpdM0QRaA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB554873.eurprd04.prod.outlook.com
 (2603:10a6:800:361::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:47:40 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:47:40 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 07/21] ASoC: es8311: Move mclk acquisition to the i2c probe
Date: Mon, 21 Sep 2026 19:46:26 +0900
Message-ID: <20260921104640.1941554-8-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::13) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB554873:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b7d0c3-a456-4d03-48d1-08df17cdc22f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|10067099003|11063799006|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/YeoDOSGxnfuWURK59QasBaSEApflSVRH3Aa/lroHq7TLIzLMUqppjfb/2yZjFklMicKNIi3QM60mEblv7WL5Tnaw0kmRGYT99ZcpWadbPH/EXZjvtmxuIOmL0GUgNm9fn5oS6US4EYe7UdFVDbLmGqrQdDEk5c16eP00LAbrsySsOHmhM+K9hnEFSIudV3hlOREAuwYslxEtaM/Pw9j1mPbVT+Y87PYe3BlGkMHM0uZyn4QRt8kDEC5Yb/aGWh9TfXlpVofx1ohLN1f/PSVM/yid4kpnC7SBo/i8bKq3sMPLt6UYEJhoHq/MgyLofnyQM58/QTiNILkXF1oMFntKldzwOC4fPE6CP+7/RxFq7gwoAvHIvlRAdN77zfJ3Uzs6PfRTqWgKYotQzvX5kM5UrqEjI7qaz9b6w0ttYS3eYrpWkiqk9bcRWZCHBIf8dyx7N5Ydwfb8owkna6ficpyzejmPhQftWPioMFnWd1X+OTScXiu1j9QJwPtw5FS//YdmPCZuYPd5A1ZBYySsVTSlupUNCQLzzgxSNT+Sp2Ne7vgCGkqx3/RYhmJGwiwzamXFK13OYlghKYfesUJvCW8rrmAGps+/QqDcGhy3dQxuja6iwtY78sPnzv/DJUOR7OOyq7P610RnOruk+EQ6A/ih89bGMH+4Yarl8RLXbkWYZ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zBnsUkuOUU/nXp06aoCVo/0P6x7owaWGhPaEqoIUq/YBd4XiGb9Gl/zywkSa?=
 =?us-ascii?Q?0pYiXsiq6QRkgsyWPiJ9zvVHXPxLfhMYbzKVy3JsljTlJ4qgr0Ylrt45RWpT?=
 =?us-ascii?Q?JXfDYXX5FqLeXE/uONpeZ4J+MbrBe29UUZmb3PTV0jc/LnzDb0jABKFNX0PU?=
 =?us-ascii?Q?tWfcW2rh1dFpJZZdfOazN9ffqs1CNGIHUYL0W5NS3lbqf2AjZ0g7PNyuCXVw?=
 =?us-ascii?Q?rxymRdtvLEuIWWiyfNVyv4LgqMewKtVHWU0Auh3tSpFCOieH8Caun2AB3cxK?=
 =?us-ascii?Q?I8cugTu+s0vcYcYEeL06sB2yEi5ifnYwbWj+3jz4i5bc2nMI+YaG0AmtUndf?=
 =?us-ascii?Q?0QMtliyjGwX8s+mNh2jtKOYiyqd0JxCIjGB4CNLWe5JJ0gOOxB+Tb+6cMgvR?=
 =?us-ascii?Q?pxGo6WTONyXBEKmEHoHcZqHsOIJUCoo0u+CGtFXKAH7JGVQxJXTR8NFSdA9I?=
 =?us-ascii?Q?weD6xFIsvGHkD1i97Ay2JXgfFTkfT73Fcp/pPMkioLjwLkWW+dMZGgDso06N?=
 =?us-ascii?Q?47ge/a1Tr87K4HV1UP5UaLNzf574U22v4zT3LBrsrKxffHbzxL7ecrFNkL+j?=
 =?us-ascii?Q?7IFPHtWChIbi/Zr2FWrLOhkxVM8pfXzpUBi0tw/WalJa6shC7NIcoP1WKDMx?=
 =?us-ascii?Q?P774W43AMz2FRJcDDPpl0kzY3+cQNqSVwSr8iu4Wz3faMKJPynxxtGWqGLSi?=
 =?us-ascii?Q?xHNXHUU/qwePuHk9uKO6705ZscppPduk6nGQAelu4fe63CMUyXi0fa/6f8j2?=
 =?us-ascii?Q?JAaOC7rGakcz6V6+dV5QbiivDddU94TamVH9hoVtT9zLahF/xuL8u+VBFN8f?=
 =?us-ascii?Q?U8qRHxh6cH0oIRM6pHxEeQVCogk2+kDm7alrL+ish60s6MY/+xfXAGQXmFXo?=
 =?us-ascii?Q?QN0IQNTH6erpi831ibbmHzSqGvzCEhuyUNoXtahsjYb1wwxVH6P6pJfs/JkJ?=
 =?us-ascii?Q?YGtN9Lwqm4rlboY76urXjQh2PPTc74EI9iXx4AFAD3eerTKFSikeKmRF/dbR?=
 =?us-ascii?Q?85qG6RcHqhZK6xVXa7ieIAYK7h1xGiyP8iXQTNc/S4+9t/n7KoGaCtjAsFpa?=
 =?us-ascii?Q?9cYXRYhyv72eEVf7Urbf0dv4JvDp0Fe7Xu44RFA3cuvngZSNna354VkYW9VB?=
 =?us-ascii?Q?AvK6KHjyAjXN2zmCNAXJHieJeA8uVU1d3Wu6tN5+LeBUJ66zLRJkNKRjSnA9?=
 =?us-ascii?Q?0W4lGHE2QQk/3DcFPXWMhaKwsaUqq7kIXD3CeKpGyV+6vW84tQjMTL3s8LFJ?=
 =?us-ascii?Q?RxMYSCNiUvkl2+t+ojI+U2pNW+cg33b3k83acZruAiYFYiYMrh9DlEBCvpMe?=
 =?us-ascii?Q?UpNlpknoLwBeo5chVsIEgNZPXyBtA0wvcnh/Xfbl8Ck0grYxQfzuKJNFY/7f?=
 =?us-ascii?Q?UyUcOzbpka++VeZh5PqMpKWMCzaR3LXXpyePCAM72GsK1hIMyp59Xpe7t1Ex?=
 =?us-ascii?Q?/pxvWu9OuLD2XUKuUKTdE+YtgMAEvNK4Ge7+azP036cHTpHkGLPs2VeGssrQ?=
 =?us-ascii?Q?3kNu/7rP8XF4JFY0B7sRVKxiMOfpJxL1rHCd9Fa9fszSG535Xuk/DDP8YHx2?=
 =?us-ascii?Q?QW0QFP3a5rgLC7GFCdHRs0z8Ipa0h4ih5GulePtR+xib1W0QAvQbAE1WGrI/?=
 =?us-ascii?Q?PBkt3S78Q+93Yo+TlcZI7TV7LlwOFN28rfTzAFhzTjQ+kX+CUmWhk/Lfytps?=
 =?us-ascii?Q?lLxgQbC7jJyyxJYJ2eNZiMXSHptnd+v8+4O7PIhX6NtH4jpjMeO0VxOfS7DY?=
 =?us-ascii?Q?Yad/+Bala9KwlfU+GKvE2XUFROa5nOA5YggTnAvSImdppbOxXh0x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b7d0c3-a456-4d03-48d1-08df17cdc22f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:47:40.5088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMQ8lTcud/noCL69Drvpri02h2cs9FuKwclgRU/VRzKo/UlfFD4NyVo/Ao2DbmQZ71/HSEUaHzbq5bff6vuufpI0a8nVTWs0dsdO4QM1seQeilG5mV3SUzvCDjqMqgWW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB554873

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the mclk with devm_clk_get_optional(component->dev, ...) in the
component probe therefore leaks a clk reference on every card
bind/unbind cycle.

Move the devm_clk_get_optional() to es8311_i2c_probe() so the clk
reference is tied to the i2c device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/es8311.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/es8311.c b/sound/soc/codecs/es8311.c
index e46b85f11d57..ddbbfc2443b3 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -906,12 +906,6 @@ static int es8311_component_probe(struct snd_soc_component *component)
 
 	es8311 = snd_soc_component_get_drvdata(component);
 
-	es8311->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(es8311->mclk)) {
-		dev_err(component->dev, "invalid mclk\n");
-		return PTR_ERR(es8311->mclk);
-	}
-
 	es8311->mclk_freq = clk_get_rate(es8311->mclk);
 	if (es8311->mclk_freq > 0 && es8311->mclk_freq < ES8311_MCLK_MAX_FREQ)
 		es8311_set_sysclk_constraints(es8311->mclk_freq, es8311);
@@ -960,6 +954,10 @@ static int es8311_i2c_probe(struct i2c_client *i2c_client)
 	if (es8311 == NULL)
 		return -ENOMEM;
 
+	es8311->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(es8311->mclk))
+		return dev_err_probe(dev, PTR_ERR(es8311->mclk), "invalid mclk\n");
+
 	es8311->regmap =
 		devm_regmap_init_i2c(i2c_client, &es8311_regmap_config);
 	if (IS_ERR(es8311->regmap))
-- 
2.50.1

