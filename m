Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D8944F548;
	Wed, 23 Sep 2026 06:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144158; cv=fail; b=P9SQI6yW1A9c/Gnx1nbk9pj1Th5q6reQsuNlRYGNJjdLXaZkutPVTGKdNTiEOLiIykk36pa+wfKLNTGWCpBykOAs3bYs5M1fQtZsCFqsVrhi4rQ8JGnX3QOqAjmI5Pl1oxWgxZJpWPruAzE+xUXyLVJbx2y/RuXXQHswodvL760=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144158; c=relaxed/simple;
	bh=K2mkXQJZxIca1urFYEl0Gdtf9H1PwGa62QRGvqEv9zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kC0ZhE7o/CZQ8wDf9FzgexeZDebqxn5dBWNNuCZ6KrGt+Siw77h/+pz7Bo/VlnmJrLqhPRz+8q2dM2YMvauY15IYG7Whj//o97XmeGB7D3/x/OfcTVMAwbuX+q1tHN9HrFgvuNWqiSBvaNPq8UQpIqw9bh+G4v/e5cp2+ybk+h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RxPEaSu7; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RxPEaSu7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwMt0d8nJ0/XVFOSUEtM8lZN2xSqVA/SQHG+lfIC9va/RbMcF3FkU5sE4w3PgwfF+3RdbE6DLZYpnzayd7BXXMzIiBWhmZ5jiRE6oAbtrHma3ZrLvEJ6IjYkp0x0x6Dwx3fMEgPBBGt/uQixfHlyQjJysb1DtRAJqJE2ngeFGbHOtNTFm35qL9btriMwOikU51LCmJ0y14bIlG7f0XsvA3tZsmDMiZ1xd3lpPxUbuOgVNQW+Y2L7oXLIj5tTnNxQr88lJ/0QaxsxO0QuRHpTWkU8vWGQ/VtFpHtx+83CYNFhqJfJWz/1pY10aeuuz5/lMzGD+QRfgm79x7RwI/EuIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buSu9JsCWFIzKvQseCcX30I0P+VbYIoY2XORuV1Dj1w=;
 b=MMuGSP8FTWJNoc+WWjxKiyOIrZ4VpuCegSwniWGGpTXNM91Qg/J8nlfKzPSc9eCqg12t7ue5uh8tvrCc1IFnq4Z9kGPI27AnKEf7gVkWfgsCjexAOe0NHe8CbMcibpXq0Vg9qkte4AzIWBJ2d5+IvSXtRsbYH9aqcAa4uaLvYhFY8qWMu0xt4AO+Tya137SHRfR6GSbXr+12/tFwT4go0ue8u1f5sDbaVU/QFNV5/d1uRHoBEHaWsewwJeJtBKicw9DC0/FpAYXutZP4cL0wsne/tBEpB8UMkJ0b6wfEsqdlijEgAlsudwiAfnAnwabVp+aE9HQfZPUBuCudJNcH/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buSu9JsCWFIzKvQseCcX30I0P+VbYIoY2XORuV1Dj1w=;
 b=RxPEaSu7QmDRUCD5Cuj2qnQUjR6Cw3AWSeMuFZSQvYt24QsGGxXtdxC5/840Ev4DoWHfb2STEjtW4EhYu4q+GlLv91VY5KeibavmXJkrpcdFiJfsHVN/8jjSZ5zVyj7SmfZfgiZP8VfD9pHuraQRSNpxyy9b982ueoQKBTa3L0bwCmO1e1iK6+ENSvstWHm+T3Vtt6oNMDbHLrkO9RKHUwN+zLPLetjpgfMLzZXVYQXjcU+c3gyNlIUmpAUPl0GXsqSJ0SL7v+8yLWlkCOdm62exdmwFIWovZJWXsByNpFOOpwc+oghwb/0gkD9jUnjqzO2GCNY14g2MkVuRHnmLsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:15:50 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:15:50 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH v2 21/21] ASoC: codecs: rt5514-spi: Free the DSP context on component remove
Date: Wed, 23 Sep 2026 15:13:05 +0900
Message-ID: <20260923061305.4041197-22-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0202.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::17) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 853cdebf-a06f-42c8-342e-08df193a1d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	naqIhBpmkJZ4rU8Omqh/7dDCYLPal4PJ9sepgQz+jKJcB5ShrJqFftiAa3D1h4ol6YKe6/MLQ4FuB5JKOzs4r8itNMevvdV7V88i1qL3bFGpYmYgrqlPFZLmlVK17WxlwALOcuVk7JCnoXecPelq4M+Ew/gwvJNpCkLP7OtQhA2EF3VSOnBBHRHCbL1GuuYQxq7vIGQFuBWCUratupYT++bzSGdK1Q5AgWbLyPA9kF4FUPK8KfAZBTMMG4hMpuJipo9gcnQV9chfOpfyRE2ckw2OB3G7uBWHme4KQ5Jg5NkljjcGl4iVyqKGVQVQZHVk8uaHiLafj5j9tucd5pJ0wgbrPytMxVnsSCkBBNEVOE30Xy0eP3VUpHOnuW8UsXAxVNseLjaPUzZOZa4IVOArAOuS3vIivGrRfC/6QE3yVtNBarTv+5cG7GvCgaFrviiUhuhatgzZxfvn34o+dLauNZdnJzgb9G7NX8BU9r667g541KXNtJbMlzDuyeK3TjMpjle6GSeMZtgH8uLtwaMsyl5Hk1l6PrSHSqWYYcRF5y7BltA8sWs2yjQ2VESM7P001W3PqhaKWU6bZPpgWP1XgIKbxmCp2mclRjr65XeHnVwYHlf+jzbS7zcH9ky39jUp1lxgDqR1AXQ0uqZbJSKQgqWLkBOsmanv0HA7bP9SkB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WQSdooEPYWUJJSWG0jPvB7sxAbD4uZWHV1M1m1Xm1xR9cYzatDk9suT6uisk?=
 =?us-ascii?Q?ld7dOHJGy6kvAJJwE8gv71iokm+frGpsQtS4oqU8hK3hdQmsb7AJVyb1n+SU?=
 =?us-ascii?Q?fQqkWIM7syXkL9kq1UMP645KkSDnqRQu6igwrs1NQgtFDOvOjKkZEnDPaQlE?=
 =?us-ascii?Q?Dx7LyDjWnxbCl6NwIt0Ogdgb9/RCVQTgEnEWICV3F4o7ibe1jXWz8Sk12hrP?=
 =?us-ascii?Q?NifPLdnAmgLnOsLdDD/+MSaoPE5Wy2aGY/wZHPxf24wWF/OmSmCGZf66C1WM?=
 =?us-ascii?Q?ceA661IyY1tycdG2xrFrG23aAjJUpqEi5VBH/b3E0o4NAXf2Tj8aRw2i8B4p?=
 =?us-ascii?Q?X66w2aB1W7wHqjgaDTC4nZWoxO2HL4xuzXcihOOpgMq5hUiFYdg58UCPLUWl?=
 =?us-ascii?Q?9SjdtpyO3E41IMiZ6h8VCR+mrHfWJJMvA4+w7AAEp09SS2Ol+GZJFRCeBPHp?=
 =?us-ascii?Q?nt9OL5PKbPPn/2Ofa3eJgESiCsMHO9D2lE+o5GglNRxlXysPld6Kz4IDt4LJ?=
 =?us-ascii?Q?5C9BrMCSrEJaucbu7vCxDWgjpE/to7aY0VsjdjMyVvZ9fZVgydXxvU0T0tbS?=
 =?us-ascii?Q?aW1Lo8vDG893Fprhl322deVZivWCZYGm2SzM4SwpaJFkgA9Tw7pN5xyFZ5b7?=
 =?us-ascii?Q?Ut51GrRMzD3/68yExojt3Xu2K8lrVyf/cQU5l8xK5ewqryM//6SPQbSqDADX?=
 =?us-ascii?Q?EvOqPeFY1SPFAOvAYrDvk/AdfVwIqgOdMUBNugEPa+UBsnUZQ9sC1AYs5/UW?=
 =?us-ascii?Q?TlHMogMPYbt2tUsHdNmnswHIKJvbkLh3L0QglkFYqsc/yRNeKzatKcAzyFHa?=
 =?us-ascii?Q?q1Ul40TtWaafW774G1IYg8jE5s64jfro0HA3tkWUxQGgtoMsem7vOQoc7p6C?=
 =?us-ascii?Q?NWnNwCznEr0TK0PLKCxwfzZUpxWsBCq2XjOEBzUkyzxYesrVNLjXGF38UPhW?=
 =?us-ascii?Q?JoVv07q8qsjLmEh2mWegQoaGCCRPpfYz5endF5EhsJvPJ2ejjDHuNdGYffxa?=
 =?us-ascii?Q?h6/zD2t2mj5yLrF8dfuAYzxH82HD34RArbRVLYJhFRwqgWCRFJqys8+ObZdr?=
 =?us-ascii?Q?qnzbnZYoeBacU6AVsMKyma8qvtCD5p5LZig6+QMQQXRUMxsukdjFvyg1Q6js?=
 =?us-ascii?Q?r6irF4FHHWGRVarpUxWLF59lMlG1a6uuDMzHW0u1W50aVDHKAuARuHq32oOF?=
 =?us-ascii?Q?JBS8bAbxEL5wyYrVLGfjSZ2ZC9sb5Exnkp2c34N8t/CV23uIp40CXabNZtBV?=
 =?us-ascii?Q?xwn5XPMdP16A48Xgtr+ape22HYnwunXWID6BgKO8kWwEJ6mJMMdj8pBPP/Fi?=
 =?us-ascii?Q?4FiezHuW1BPiSXRYfP6FFR+f/suyj0boLnIyZO3bdo/7eBhAoL+c04fOzLrE?=
 =?us-ascii?Q?5UxaqsLDlvqWZjkRyhMrU9C7Y21Srs7WulKcZKq+q6zlrlXCiYn1BWL1zFG3?=
 =?us-ascii?Q?DYD8rMHkYfIkJ7VA/XvDKqxXFtOVF2HkDSN+Qwp5huTErfsUCvcEcVcxr7Bn?=
 =?us-ascii?Q?e2GVMYUOL9rBChA3vfvQzt/j7F1VYJRRB/GD7Ew/huVQLUFNvQVyNFcSWIIb?=
 =?us-ascii?Q?ufIk2AdwJiCMfyXsNdaX50EzCMvjThDWOpyvONGy/KYonbrp9vziteRfRFaK?=
 =?us-ascii?Q?SGQ+zAt/KpRP8RrT8WdQvRfEC50W1vKIAPv+C6kD2FKJRPNq2IHVlem92onY?=
 =?us-ascii?Q?8v4BwXcnaud8eK8edpNIJMszRh4SFj4N9lLnG8xsSGToKbGvDDveTkHUIF+S?=
 =?us-ascii?Q?glxBMQwW/qEDjUvA9GZG1/qgfWDKgW1L5/8T+h4rEUPXvWcwgIn6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853cdebf-a06f-42c8-342e-08df193a1d40
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:15:50.0819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+LUSxhwYeJCdgY7UCA2RuaBxPwPUFJwC9rMBUcXbrt0059zpa9L214vhrfo9cF8lMgcVUhb5fye3HkPRBZKYKb2aHE/YJy8XNe0VIidZDgtKZi+NfwpTjStrbT1G6yi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying SPI bus device, whose devres lifetime
follows the physical device's probe/remove rather than the ASoC card's
bind/unbind. The rt5514_dsp context was allocated in
rt5514_spi_pcm_probe() via devm_kzalloc(component->dev, ...) and its
delayed work and wakeup source were never torn down on component remove,
so the context leaked and the pending copy work / wakeup source were
left dangling on every card bind/unbind cycle.

Allocate the context with plain kzalloc() and add a component .remove
callback that cancels the copy work, undoes device_init_wakeup(),
destroys the mutex and frees the context.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5514-spi.c | 37 +++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 91290bfe8daa..bcc2ff28b125 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -43,6 +43,7 @@ struct rt5514_dsp {
 	struct snd_pcm_substream *substream;
 	unsigned int buf_base, buf_limit, buf_rp;
 	size_t buf_size, get_size, dma_offset;
+	int irq;
 };
 
 static const struct snd_pcm_hardware rt5514_spi_pcm_hardware = {
@@ -257,8 +258,7 @@ static int rt5514_spi_pcm_probe(struct snd_soc_component *component)
 	struct rt5514_dsp *rt5514_dsp;
 	int ret;
 
-	rt5514_dsp = devm_kzalloc(component->dev, sizeof(*rt5514_dsp),
-			GFP_KERNEL);
+	rt5514_dsp = kzalloc_obj(*rt5514_dsp);
 	if (!rt5514_dsp)
 		return -ENOMEM;
 
@@ -268,21 +268,41 @@ static int rt5514_spi_pcm_probe(struct snd_soc_component *component)
 	snd_soc_component_set_drvdata(component, rt5514_dsp);
 
 	if (rt5514_spi->irq) {
-		ret = devm_request_threaded_irq(&rt5514_spi->dev,
-			rt5514_spi->irq, NULL, rt5514_spi_irq,
-			IRQF_TRIGGER_RISING | IRQF_ONESHOT, "rt5514-spi",
-			rt5514_dsp);
-		if (ret)
+		ret = request_threaded_irq(rt5514_spi->irq, NULL,
+					   rt5514_spi_irq,
+					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					   "rt5514-spi", rt5514_dsp);
+		if (ret) {
 			dev_err(&rt5514_spi->dev,
 				"%s Failed to request IRQ: %d\n", __func__,
 				ret);
-		else
+		} else {
+			rt5514_dsp->irq = rt5514_spi->irq;
 			device_init_wakeup(rt5514_dsp->dev, true);
+		}
 	}
 
 	return 0;
 }
 
+static void rt5514_spi_pcm_remove(struct snd_soc_component *component)
+{
+	struct rt5514_dsp *rt5514_dsp =
+		snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_set_drvdata(component, NULL);
+
+	if (rt5514_dsp->irq) {
+		free_irq(rt5514_dsp->irq, rt5514_dsp);
+		device_init_wakeup(rt5514_dsp->dev, false);
+	}
+
+	cancel_delayed_work_sync(&rt5514_dsp->copy_work);
+
+	mutex_destroy(&rt5514_dsp->dma_lock);
+	kfree(rt5514_dsp);
+}
+
 static int rt5514_spi_pcm_new(struct snd_soc_component *component,
 			      struct snd_soc_pcm_runtime *rtd)
 {
@@ -294,6 +314,7 @@ static int rt5514_spi_pcm_new(struct snd_soc_component *component,
 static const struct snd_soc_component_driver rt5514_spi_component = {
 	.name			= DRV_NAME,
 	.probe			= rt5514_spi_pcm_probe,
+	.remove			= rt5514_spi_pcm_remove,
 	.open			= rt5514_spi_pcm_open,
 	.hw_params		= rt5514_spi_hw_params,
 	.hw_free		= rt5514_spi_hw_free,
-- 
2.50.1

