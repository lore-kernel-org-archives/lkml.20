Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2872E3AE1AD;
	Fri, 18 Sep 2026 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741090; cv=fail; b=Vc786Md9QNyWjBsls1ZE9dfDsU9I3wg9osITzRI0L4HMhJrEmjd/WzC9qQgniVAvjdCCJiHNUgRbid8e6c8CKAOVeRLcwuvHnnOKctiq03XT8cB2GC2SnzRezhp6nlnomSWQ/V2BhPIiLUS04iAD37MnVyudwidnN/glOZnd8OA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741090; c=relaxed/simple;
	bh=/m53tyHgvSx38YMzhg5qGCzxsvO3rGczncRR5AEmyQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UpoTgCedYxptTHsfzD+Zpujhl2U1gLs5w5WsHoKRQYVWjnVlHkpa4J7LcvLEg4evrBcdxmbM47OTjxtHl9hfIjKpPUFgarx8hLsvLImx5VUeMlh6U3QReTjALGuUTOyEzL2fbjxEvcnsAmPt2ScOcH2kQ/+h/qnu7qgMyPVGNXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I9b0C64Y; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I9b0C64Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glLbQVVh0nsVendL6/1YNzXivqhYABy27BrdyCFd9FBwvF/1hSu/KaGKGiXKOmIpM+xne43YPI85vIhkRuRzr9nAtmbBG9FYAw32evDTcOApdUtWHlw1vMS8W5PSRO63gUG3FInEZ7wfBDpML0GaLXwVXmBPa8+nG0f8Zrrrd7wXL6+O+oRjtRjt27rlMhiufaDNa3jsH33ClAZ0xlf4wkuyi6ILFHyricWNz0xzxUNYKjBsR3APay537XFvVK1C6ITV280JlB/ZFt9MpmsaPWZpUVKTxJNBcKtxE6FwsbAb6GuSZWZFSw4eQ5pJGN9b9+7qOcoanbfK4txlosfDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxxQqH1hwMtJ/s2iQS0WWLp5maPnzk+qbBK0DivWjfM=;
 b=p/bX8uAioAaIQXOQm2l9Ifr7o+Xtlpy4aaRffIOQiK+huU62abxQctD6DVklj1pk8ogyTUrb/A512KawKDiOoynAZp+VdCIYHvYNFvYesLA3FvajTT3vbpEVB+m/VCM0/3V9yJmhPeaaED9grith0BoxqSflO9H27QYLMVlfsMkx4Us3p8Nv6tEB6W5Q+C0eGyub+ScoyW7WaykTtvAflKc+W8Bc92BdwF9SyT152oJ/ks3tfnL23s6zFWLuBJ+U+jxd8mEzOOq8NMWlOC+GRFUPes/E2H9xsLNuTfTODHH0FeJLmvq08Um+i5tZHYVOgpui4GezybRcKPtDDgfONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxxQqH1hwMtJ/s2iQS0WWLp5maPnzk+qbBK0DivWjfM=;
 b=I9b0C64Ys5Qq5OaivNRqw8R3ERVvvegIAllANw5mC7fe+qSeFUgNdJbqEcy97wNgTg6qhNwbSEl0BxdQvA/0nYmxN5AVRI2dUuJ9xADgHRNk+3mcD8/U8EK7WkwB2bekRwros/GIqDychQdY/xSEcB5Ep9Eu0e/T9kSKQAnDBM8UIw6g5ulctJl/tStxiHnIw3b8a6GKV7O5+03Op9dQaiClSaRVJ49ye3mle3oEZrJjJAnRBZ5K8Tkev42UVBlc/TE1qMOiFXd9TaaszFPbISLsdeYPc9JlXjP1bVqkWS8RazIAP4Pw/JH0K7OqiNpMfhZYn/eXsBWE4pURcy20nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MMZPR04MB960486.eurprd04.prod.outlook.com (2603:10a6:190:54::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:18:04 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:18:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Peng Fan <peng.fan@nxp.com>,
	Zhao Dongdong <zhaodongdong@kylinos.cn>,
	Arun Raghavan <arunr@valvesoftware.com>,
	Fu Hao <fuhao@open-hieco.net>,
	Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA/ASoC: use assign_bit() where applicable
Date: Fri, 18 Sep 2026 22:15:20 +0800
Message-ID: <20260918141532.3022761-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0267.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MMZPR04MB960486:EE_
X-MS-Office365-Filtering-Correlation-Id: acfcfb31-e654-40ef-b7fa-08df158fa6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|19092799006|1800799024|3023799007|10067099003|56012099006|11063799006|6133799003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	uXbEUANPtOwhicQy0q+4cxC0OE9zkYRJc3CG62OdNyNNCtP0V0/GIvormg3P+f43QclSdOG2l3zhP2PpYPIpTXje4ZJp6i5yBmmnEaDlHNUHOaRiXuF07acNnhi+M8Ve/+Rt1AVdR7BK+0faj8hhhzBDImVy+Aby1sFLSoqXhctLx81pVNCUo1McTRYnGG1xD7Y8x6Si5HcQkaE6EbgkTIVrCIh3JMHjOqoSYotci59tcmJDPsGSuD7RL5PFlsqWJWW2Cqc9E85FA7+Y99xXBwBtdKfX0fDtQCRtiOuOBy5a+LUhOJ7/TTydjQk380pB6042xZ6R8PDevdfX5KSdLkQ5HpSSGvieGYpj2TiMUzlti8DT3o42Dfz0nCzS8N5jnNNBtk1r8dSb0evYFw90qVhLUtDUOyMXiLHuWxTaMnxiAtnVAYwYtH9T1JAr6MreS2m9k7+zYTG0WiGPPY4Ajn+3hJdz54hoGj5OXBSXdeS+NREh0TlGn4MXw+qzP0Z4ugL/7F79LfQvUpo+PZjBmaLDemLm/17OX/ulJVWFN+BSz/IUAHLK/RWES7fWuJeEcJAOYujl/kXjseyKLc/kbGgxO/SBv0HB0bdMV6tWthMuE4fyLw0PTm6EFefG8tbAGsK1x6GBNiyTpM4v/0cYf2N20dlc4YsP7H6bkKmfWBJu91doqZMWPfglxb0oP20kwxeDVAfHVUwLVmygaQKndw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(19092799006)(1800799024)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wOFaqwg/uzKFQKyD9rJMB5mG4mdO2ZqP+LbTrRgbCpsOE/O1pC/K2ToEVCfR?=
 =?us-ascii?Q?N5cn7lcliwsaaFYsFiFPeVkgBU+LlSlYLT0mTse0rXVPziNzm/bcMDh+bcVC?=
 =?us-ascii?Q?FcF1vSLatIZ9hcivav+LeKkX0cmftvrrwN9jOjwhHJvRvSnpdMBC6DeDRxJo?=
 =?us-ascii?Q?ej7jJg75tNOMIYAqLc3/qmROk06wmiU+pGs07xUxfl+QMazxXaB5zlEdIVE1?=
 =?us-ascii?Q?UjUuO8Z65MWx154Q+lYkxqQ3O9ZlQEHMpSU8W4Sbjg0xOpIK8HId0lR1+ps2?=
 =?us-ascii?Q?Xs610FK0mRJEgSQLI6vov+tBvdOozgEFAZKzyOcpaeYm91ki2ATn1MnuJs7/?=
 =?us-ascii?Q?VFBBdNdXOsQL2bDwU7F3bLwAUMWXspHpX2350txbriyo2bsDr4u4iCJfxEs7?=
 =?us-ascii?Q?3aX3lUsfqlXpk5AKzkGYoxapvh50FVa2ehuT1EczwvNudMY7yrvQduVY9irV?=
 =?us-ascii?Q?w+g39mb4ZS86hfvTYnsjFc8ooiZvFT6bZqvPKfkdAg281xwZukduSsTG2feX?=
 =?us-ascii?Q?R9bVhromsegndQNLtsYtITKl063m8OXZM2b7Uem0UoEXevvCB9JhMHsE36TX?=
 =?us-ascii?Q?PyLC50ouU0haxJd5lmic1+6zTiM7Nh9ul0mKaEz0rwADrvhWvRYX4cwl2IXH?=
 =?us-ascii?Q?Imiu2qsHAeqzvmcN7Vv2fRh2E4xug7zqWpJ0jeYddBgplfKM81f33bcDA9U3?=
 =?us-ascii?Q?d8sCvI3+2DA0259CRERC9TZhhSB15Ga97sndlMwn2jh4JPn5XZhP+bSw/+D7?=
 =?us-ascii?Q?Lqs5XsRKD9SFdZ/0x74p3PAurVSK2odbMi3oexJH/UQgFKVhhS+kCHrWcW2L?=
 =?us-ascii?Q?MckgyZpcOmUlC2soaH2BSc0Wl/tmrYBlHQaj7kH7g2/p1kjOo1hRk9su/ppu?=
 =?us-ascii?Q?WVLWUt0Zen+CHLcKb+eo3lbinNTOscaEruBWrXXP1UQv27iX5tVcH6IWNM/f?=
 =?us-ascii?Q?5dkOcsxLwHQ09gfEL/r1Eb47XJ6i1s2NU4AM1Echzw3DH5LVJe0vLpP0RFiX?=
 =?us-ascii?Q?pO8ZXrFcK8LdU4hjMpiLe48OdTnaZgu7n1pmfEIai3slCsr6JlJmmSTH6NqB?=
 =?us-ascii?Q?t0cdnRusotS0il/VvR8OxaVVGwIs30BaHraXmQSG3jg9hiCYlJeYNIZC8wf/?=
 =?us-ascii?Q?xDH5VYIGlOGUwi3ZChkBGetzD51T1ov0QCrGCZvGUA1PZSZwvMPdKkiBBmOO?=
 =?us-ascii?Q?HQDhb/9DhS0+2jvlVhKJ1e9jPXNVtcOYgxSOcrPqN/m4OdqxsMMbkSdc47F4?=
 =?us-ascii?Q?ZJdu8AP0jyQZOwgZsMlt/83+K0LCGWzvpVPSVIFS07OJ10bbSfC36445zn2R?=
 =?us-ascii?Q?pNrY5jGBho1qFxds82UQwu/PFhdmVWSb6Ik0/qESWjO9FMpIsPo4y2R93Di3?=
 =?us-ascii?Q?REN2uD1uGvKM8JXvm3CbYttAEOlxhr5Oe5y+5iC1tjX0uXr0tttz/cb0p3j0?=
 =?us-ascii?Q?UsaHLrMxxg+7fzrDWJuQ26895bZyNPvmbEEtSaXyGvHhf919UaqhzZG7EVZ3?=
 =?us-ascii?Q?VoFMDRlWtLB5kAFzDbD9dw/9+BzKwUT5vz+Sk6RL8TddTzn+mgOYVzutc2/P?=
 =?us-ascii?Q?Awy9qllvmWoNaTrYpzxeVhw2m2vyH1v1C/+fUUBmAx+4O3T+Ing4dRlNYuYr?=
 =?us-ascii?Q?syfQrNf3XE8b662f3d/j2gK3li7p9o7s9d5HDv+MImsWMHdmMhjaLL4WAixz?=
 =?us-ascii?Q?SqCLFih9MX+Hcpn7iHyxjw1o6NJx+1dPdrrNMzEC1R0ncUZOdLa4+pX7fMQT?=
 =?us-ascii?Q?p/8V+IbYFF9APbeN5HJyrNE7nc7kk5K8BnLIblScdjnZoL4jKSGW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfcfb31-e654-40ef-b7fa-08df158fa6e8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:18:03.7355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCBh2ecb4LOHLPP+S1bkiYouZJpcwR2CIna7m7BNAa18nemgEUazpAzPR2Y6/WJMx4rBZJMZr4XeWOrN2gDQ8t4oVXDx60mAIKrCoSaKY9wSTWAPchDVifXSTA3XHmTZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB960486

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit and their
non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
API.

Done with Coccinelle semantic patch:
    // set_bit -> clear_bit => assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        set_bit(bit, addr);
    -else
    -        clear_bit(bit, addr);
    +assign_bit(bit, addr, cond);

    // clear_bit -> set_bit => assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        clear_bit(bit, addr);
    -else
    -        set_bit(bit, addr);
    +assign_bit(bit, addr, !cond);

    // __set_bit -> __clear_bit => __assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        __set_bit(bit, addr);
    -else
    -        __clear_bit(bit, addr);
    +__assign_bit(bit, addr, cond);

    // __clear_bit -> __set_bit => __assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        __clear_bit(bit, addr);
    -else
    -        __set_bit(bit, addr);
    +__assign_bit(bit, addr, !cond);

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/drivers/serial-generic.c | 10 ++--------
 sound/hda/core/component.c     |  5 +----
 sound/hda/core/controller.c    |  5 +----
 sound/soc/codecs/tas675x.c     | 10 ++--------
 sound/usb/midi.c               |  5 +----
 5 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/sound/drivers/serial-generic.c b/sound/drivers/serial-generic.c
index 766206c6ca75..8ba5e35af4a1 100644
--- a/sound/drivers/serial-generic.c
+++ b/sound/drivers/serial-generic.c
@@ -183,10 +183,7 @@ static void snd_serial_generic_input_trigger(struct snd_rawmidi_substream *subst
 {
 	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
 
-	if (up)
-		set_bit(SERIAL_MODE_INPUT_TRIGGERED, &drvdata->filemode);
-	else
-		clear_bit(SERIAL_MODE_INPUT_TRIGGERED, &drvdata->filemode);
+	assign_bit(SERIAL_MODE_INPUT_TRIGGERED, &drvdata->filemode, up);
 }
 
 static int snd_serial_generic_output_open(struct snd_rawmidi_substream *substream)
@@ -230,10 +227,7 @@ static void snd_serial_generic_output_trigger(struct snd_rawmidi_substream *subs
 {
 	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
 
-	if (up)
-		set_bit(SERIAL_MODE_OUTPUT_TRIGGERED, &drvdata->filemode);
-	else
-		clear_bit(SERIAL_MODE_OUTPUT_TRIGGERED, &drvdata->filemode);
+	assign_bit(SERIAL_MODE_OUTPUT_TRIGGERED, &drvdata->filemode, up);
 
 	if (up)
 		snd_serial_generic_tx_wakeup(drvdata);
diff --git a/sound/hda/core/component.c b/sound/hda/core/component.c
index 04755903880e..83b31186b027 100644
--- a/sound/hda/core/component.c
+++ b/sound/hda/core/component.c
@@ -70,10 +70,7 @@ void snd_hdac_display_power(struct hdac_bus *bus, unsigned int idx, bool enable)
 	dev_dbg(bus->dev, "display power %s\n", str_enable_disable(enable));
 
 	guard(mutex)(&bus->lock);
-	if (enable)
-		set_bit(idx, &bus->display_power_status);
-	else
-		clear_bit(idx, &bus->display_power_status);
+	assign_bit(idx, &bus->display_power_status, enable);
 
 	if (!acomp || !acomp->ops)
 		return;
diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index 78855ac357c6..e8d40c24ed00 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -781,9 +781,6 @@ EXPORT_SYMBOL_GPL(snd_hdac_bus_free_stream_pages);
  */
 void snd_hdac_bus_link_power(struct hdac_device *codec, bool enable)
 {
-	if (enable)
-		set_bit(codec->addr, &codec->bus->codec_powered);
-	else
-		clear_bit(codec->addr, &codec->bus->codec_powered);
+	assign_bit(codec->addr, &codec->bus->codec_powered, enable);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_link_power);
diff --git a/sound/soc/codecs/tas675x.c b/sound/soc/codecs/tas675x.c
index 404706b62156..82eeaceb1dac 100644
--- a/sound/soc/codecs/tas675x.c
+++ b/sound/soc/codecs/tas675x.c
@@ -1379,10 +1379,7 @@ static int tas675x_mute_stream(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 
 	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
-		if (mute)
-			clear_bit(dai->id, &tas->active_capture_dais);
-		else
-			set_bit(dai->id, &tas->active_capture_dais);
+		assign_bit(dai->id, &tas->active_capture_dais, !mute);
 		return 0;
 	}
 
@@ -1391,10 +1388,7 @@ static int tas675x_mute_stream(struct snd_soc_dai *dai, int mute, int direction)
 	 * The TAS675x has two playback DAIs (main audio and LLP).
 	 * Only transition to SLEEP when ALL are muted.
 	 */
-	if (mute)
-		clear_bit(dai->id, &tas->active_playback_dais);
-	else
-		set_bit(dai->id, &tas->active_playback_dais);
+	assign_bit(dai->id, &tas->active_playback_dais, !mute);
 
 	/* Last playback stream */
 	if (mute && !READ_ONCE(tas->active_playback_dais)) {
diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 353217b3629b..0480a9b89e8f 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1282,10 +1282,7 @@ static void snd_usbmidi_input_trigger(struct snd_rawmidi_substream *substream,
 {
 	struct snd_usb_midi *umidi = substream->rmidi->private_data;
 
-	if (up)
-		set_bit(substream->number, &umidi->input_triggered);
-	else
-		clear_bit(substream->number, &umidi->input_triggered);
+	assign_bit(substream->number, &umidi->input_triggered, up);
 }
 
 static const struct snd_rawmidi_ops snd_usbmidi_output_ops = {
-- 
2.51.0

