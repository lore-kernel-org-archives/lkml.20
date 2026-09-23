Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8626944A40E;
	Wed, 23 Sep 2026 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144136; cv=fail; b=UrdkBybMEgL3sl22DfHZ0dF2/S7Vj9zvXF9MK0WxQHD5YcvfSfJSf30NP3nm8Y2ftbRTy/bdTQjy1zxp43zQhyufiLXMI4INZt0lr7bJUtk/3wqBF0dL7ycztdWLcioZ2Jz2LjdMPp3klts2iFgJgfE1EcKSxyCKJkl0+fhOgSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144136; c=relaxed/simple;
	bh=9H774+t1Uub5k3GA1r42SOUm9CVtXbuC1L/ntqg2d00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DHQjdg3uSxz6czWEf879EiPAgPsDVYCMr9dDgVLL6iwnW//eroNn73PTbpcsN7vXmEg6Y9cFnGh/WCCm+Mh3bGnF3gIRgOOUV+n5KvbmCzse9Z8TCUZGGP4NfSUUsDDHDPl24omYXN05S04wbPIaXKjT45Ntftg16OsNYPbplAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xpOL/YeZ; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xpOL/YeZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0osfySTm625sE3lUrUyeVd7B80gWztw/RX+qBvED25TK+/lMxVoGVsskxrYwjg2Z09vFDSxzcEOxffyYJuSPtPVT7kj/K+LKYgDtkAWJ6NW42aOjsamOD4LwZbXIkxOAYwCYChSR8E4WC9vlS7H1WYUFunOqrrBOkWEqPoSlSiiZkZX+peOtHjmZVLJfHPLJ7bxst8z3rS5s7ByHHmx1QOShZdLSgYcoWeHD77Hjpfa2VnVbhChZo9cOTZYr1kTXcxNoZLftb0aNk9+Ibit4TqnFLLgcekcjp0les/xEik4pTaDc1kSRgQ8irWk0WKZZ98VqutJTuggPXeSRnDrng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UE5dyCfef6ONhryPkxCyPoKlQwpR2ejQdk/RxssJEvQ=;
 b=WZY7tdGqrizkHZMhmRaCLZSYHgc/NNLD00Bgwt8v6Cq52qx7UOjApdtZpOC/yxhF/teyC9OVDzALiEPx9RYG8+Ftd2itTzaESi+H4KeLV00JmpaIigRf8aBJpLEBCerN8a3ZHl7vUwuNfO8Zl/JE+ddLJqOKAFKu3noaXZnVIYBHF+0MtAgNqTnL1I0R1Ta33h+A8jaxPnE+ZzL1W+MmIZFlmwB9YG4oAMcaAsTjcYCuGxPblTtqOeAS/+HbvB2qAGfLmyufPoyiBx7IlYbAJJR95jFqyQE5c2K9/zOiE7o8CE3LdiFGsKl/vsd5bqlFwlh0/PztCNhCGZTlIeGg9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE5dyCfef6ONhryPkxCyPoKlQwpR2ejQdk/RxssJEvQ=;
 b=xpOL/YeZYgkj5Jpn7yic1T/vzmaiB1yDXR1qGQZlOY2i3kTymaXm03IA1c+nx2oMpk+xLIki6s66zHPushOxHMlPgu6LsXcBuKEDg9Vh/tPFBx0n143lvOI01LVFF7sr4fH5bEl2gbmeF+1vAnfmnAGrkpVXy/ejKRPV1HFlYqYNXeZf3gxGKGuKgi4R09dNSyKXAlQnU63sSAAykQYYkPykn9c5NSJpg38SyNv3Go0ZDMBOiyxDZoYKeqb8qzns44TokUQM8yAbz/x9j0s4j2hi+nt9/q5+t18EDKuw6qagqc+3uaYOSm6b4RN2v1oR+e8XjSbcfCwLfWzvvUi99w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:15:26 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:15:26 +0000
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
Subject: [PATCH v2 18/21] ASoC: codecs: rt5677-spi: Free the DSP context on component remove
Date: Wed, 23 Sep 2026 15:13:02 +0900
Message-ID: <20260923061305.4041197-19-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0096.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::11) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 92026272-ec55-4b9a-45aa-08df193a0f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Bt/Xwbw5ytkHt2pre9f/JbIeOXbXcDIzeWuI3b6xXoQrvUU2/bo6Egw5zibSwWtpStpu/Cy5Vo2xPeJrp1WwWHWEJGjBxZ2DLYwO7SXzusdpwK8/SAT4l/1wtZzH3C9+ic7n0vS4XkRZbw5CWHRbgNiQQfk5rgS5ryUjUCcZc7GdgilFjcYtMgcHi8yP/BaQjWL0UxRzX1cYgFAtV9IGWjE/j8taitX3ifKMQ1B2Zg5Gb1d+O3flVIF0S+6ffx2c9Knon7Kaze44SedbQmqyFD/hg6jVn30kYVwsti/iiiIGJkqdkHxkzAf5yGeTruLHFzF+O6sHtlU9I1r1JBZjvZKET5D3XRDialDxV/LqmpXwcB34gK7tInx/9xJYHlTvqPqiZsFQR4qBhKd7pGBfGX2qW8nNjSYZwFgfaww8TMk7rfiTNtYcmurqImQEbo9S3Bc3LZOxFLVAR8iPWj9gQMSclZntb+sILvrjHAxUalYcjriPwa4PKOmAofX6K+9OUNjrVoXfJMQNCzR6sdxhMqvMrONyKDokihrlnNrGl12Agifb+EIzcSA35addZFX8gHtxtFoj4t/q0ekDit34oL1cTH5s7Y3uy/EIUIHOOoijQrhqQ4DHCbsxn1WU+UpZ0u3+7f4vEoAnjoKM9mRtO2FmeeWKv7xdauaV38geC98=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?23eM6HqOtJKSV3QyFq7kNSlfZnRcIzGuLPlgwtZmcE8WHBocjabfcC40+C8i?=
 =?us-ascii?Q?1rrh/07P03h48MqsIXlAg/cL3HMjUhZaF59ZdtC9FJUZM65uMlb6A5mExnSo?=
 =?us-ascii?Q?HK3DviUsKULfQ0pFKAcREg6tNuBy2Yo7E61jWw8K9mbB/zeHFq67LSwkdZii?=
 =?us-ascii?Q?kjnzcJSyQJU/84xXBW9eypdcw/nFvpxbX1vtKzKU9zc+vYL2plO3o6eLJM4n?=
 =?us-ascii?Q?/k9sHw8RIzth0n0xMwosa/XoYN0EpAd1PJxfXuzoGWTiCWVIaSIFoZFwKNra?=
 =?us-ascii?Q?pxS6Z1Hj5jLyxUcYP/D0YW35eNWQ0t7RDOR0r0yBjiE5He5USZMMhfYtmurg?=
 =?us-ascii?Q?QQhdKOA9FuJkVwpLIEede5lnjehNZiP2RVCRvMDcesA0SF6rmH4uYxJHeXVU?=
 =?us-ascii?Q?+OoDlUekVSqHdmLZwQ2DOZPia945mVQSvDuQyGDGJHE8oQCV4GjiL3HsQB7w?=
 =?us-ascii?Q?ykIyZ/LRQM6PjpUsUDrePs6dLjbDYsgfubazUw65JYbWSD07qrMSu+uV83uu?=
 =?us-ascii?Q?E1+ULLD8BrrZ77NvEDOlU/GewtOFd0jWoNYkGaSlcDvMCfYoTO4wySlylHRq?=
 =?us-ascii?Q?VCe62is5X4l76lOf30NLAxox42golj3FxoOM9yveEOQ6pIkdAVBTsMw7dsIP?=
 =?us-ascii?Q?fOa3aDcMgz0s/p5HRFc/MCLJgv19r7caJfKV8eXfcI6TgCCP1k1aDH9TUQts?=
 =?us-ascii?Q?HbDLIXD9KprFoF54g5hn8nQatWwBbpmvZ0wu4jSzHi82WDN/xx/7PzTUbzx1?=
 =?us-ascii?Q?EnTPOpw5SuspTgqK3J/TdGu5kvM2/FHfYj4ad3jgoEyUdyb57RU+vGr8OcE+?=
 =?us-ascii?Q?/E68xrGJt0Dvr37DRQQXCm6Or7qLP59H2EeLk2yi015dEneTfEqD59a8x5em?=
 =?us-ascii?Q?pSJb/sRV4BzDyIlg5OhuieqQNA2rbTYwMmpkKNdsEBL/PhhG8w/yodW0pHH4?=
 =?us-ascii?Q?2WON6oDjlGa6geor6lgXEyC5JjWUdW1gVSTZRomwej7G5HedMGcNjFqPVa1O?=
 =?us-ascii?Q?noqWPw0N01YmGXKu2VyUiaYzCqq639S0XPRsAcDypZPZ1xgTO7CNvyGnP6wz?=
 =?us-ascii?Q?ug0ZihTswKUaW2s02iULSv9HnzUbHzsNPytP8bMAq01LEBnNGTIiNnHioa0S?=
 =?us-ascii?Q?ZerUZGLlMig0h5Z+MxdQNOTZbsVdK5GDXki/chXda4pMn4D2Q7LqWdLPhzkM?=
 =?us-ascii?Q?dfgf8DdCTeokVoxR4+VF5M2xKk9VRq9fK/lK0q6V1OPeurOARkTwsVsrHLbq?=
 =?us-ascii?Q?S/OJ/1KmokqdGMstSCfupvEl1cLvPt/DoyhGahPfmBFRXmZTCMmE0kJ9mF2R?=
 =?us-ascii?Q?8fU8Mp5oOlx04PniGBi3TKY3FxO0O3Z8hn3zLFArL4uLKcNkhDFxqA3vVX9V?=
 =?us-ascii?Q?qpv90h1R2FutQ8IYImUesjA/S7UPXiBn8McLVOR8klUX1XmWarPi+LSnBQvs?=
 =?us-ascii?Q?ijM60hef8q2dkTSxDoOv8acmIaSdHpsPp1gkbuOK9oHbJgEiPSS2LD+mmvDR?=
 =?us-ascii?Q?pg8Tdll0w2Obci8EDWwneGA1xuvzmUxVHib6Qz65TZtuwXGeI1dEh0Ut0mxd?=
 =?us-ascii?Q?9FrtWB8/dtqyvvCSjWfOL4zHpLnywTTMkYhOQqrIFacLXMprgiPntolVgAJC?=
 =?us-ascii?Q?MN8bmTmSbgEpkpElhZUZTkvDQoDklwcK2CBc0rdBvm85i1eJFB/i7JogHXgJ?=
 =?us-ascii?Q?dIsSynyYOSd5XvYTjjVqjBjilb5gtjabZH58Hodm8E5Vj9TpdQ1EYVg5pAJa?=
 =?us-ascii?Q?OKZbJEedk7P+HQAQgDERT0CaQ9tDvQAzPBMB1g+PoF4lYErEhJh9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92026272-ec55-4b9a-45aa-08df193a0f21
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:15:26.6770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8tGvT0a+cjsxrA+j/AoGkymMHxU8PzURNl34RhoSgWDuewGUqtF8OHqRKZxWr6JQgjlJ/X4+DBexvSdv6vvsoXgVKEPPqglLfkKvTMSE7EHfOfeSRLHozSNcJVqVr4H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying SPI bus device, whose devres lifetime
follows the physical devices probe/remove rather than the ASoC cards
bind/unbind. The rt5677_dsp context allocated in the component probe with
devm_kzalloc(component->dev, ...) therefore leaks on every card
bind/unbind cycle, and the delayed work initialised there is never
cancelled on unbind.

Allocate the context with kzalloc() and add a component .remove callback
that cancels the copy work, destroys the mutex and frees the context.

The exported rt5677_spi_hotword_detected(), called from the rt5677 codec
interrupt path, fetches the context via dev_get_drvdata(&g_spi->dev) and
dereferences it. Freeing the context on remove would let that callback
run concurrently and touch freed memory. Add a dsp_lock that serializes
the fetch/use in rt5677_spi_hotword_detected() against clearing the
drvdata in the remove callback, so once remove has cleared the pointer
the callback either observes NULL and bails out or has already finished.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5677-spi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index ebc527115ea5..0b2166082437 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -58,6 +58,8 @@
 
 static struct spi_device *g_spi;
 static DEFINE_MUTEX(spi_mutex);
+/* Serializes access to the DSP context against the exported hotword callback */
+static DEFINE_MUTEX(dsp_lock);
 
 struct rt5677_dsp {
 	struct device *dev;
@@ -380,8 +382,7 @@ static int rt5677_spi_pcm_probe(struct snd_soc_component *component)
 {
 	struct rt5677_dsp *rt5677_dsp;
 
-	rt5677_dsp = devm_kzalloc(component->dev, sizeof(*rt5677_dsp),
-			GFP_KERNEL);
+	rt5677_dsp = kzalloc_obj(*rt5677_dsp);
 	if (!rt5677_dsp)
 		return -ENOMEM;
 	rt5677_dsp->dev = &g_spi->dev;
@@ -392,9 +393,23 @@ static int rt5677_spi_pcm_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static void rt5677_spi_pcm_remove(struct snd_soc_component *component)
+{
+	struct rt5677_dsp *rt5677_dsp =
+			snd_soc_component_get_drvdata(component);
+
+	scoped_guard(mutex, &dsp_lock)
+		snd_soc_component_set_drvdata(component, NULL);
+
+	cancel_delayed_work_sync(&rt5677_dsp->copy_work);
+	mutex_destroy(&rt5677_dsp->dma_lock);
+	kfree(rt5677_dsp);
+}
+
 static const struct snd_soc_component_driver rt5677_spi_dai_component = {
 	.name			= DRV_NAME,
 	.probe			= rt5677_spi_pcm_probe,
+	.remove			= rt5677_spi_pcm_remove,
 	.open			= rt5677_spi_pcm_open,
 	.close			= rt5677_spi_pcm_close,
 	.hw_params		= rt5677_spi_hw_params,
@@ -579,6 +594,8 @@ void rt5677_spi_hotword_detected(void)
 	if (!g_spi)
 		return;
 
+	guard(mutex)(&dsp_lock);
+
 	rt5677_dsp = dev_get_drvdata(&g_spi->dev);
 	if (!rt5677_dsp) {
 		dev_err(&g_spi->dev, "Can't get rt5677_dsp\n");
-- 
2.50.1

