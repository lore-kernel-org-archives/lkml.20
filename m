Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C7481238;
	Mon, 21 Sep 2026 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987763; cv=fail; b=Kq5QfNSLbBXzPKJ8uR81Y9cwgDxzOO6llCr6t1yAgT9GmbsUoD8irEguRp3d2ho9Iz5dkA5VPdv+uBgX83HOdnVLXIy8RaiCkARjQ2aL2QfUnTzZe7zqRbJb/BlL+xoEJEkU1AAa1dbishv/eNk7QzM7sF6bv4kZlpaulnnR/As=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987763; c=relaxed/simple;
	bh=AGcM8YFKbbX2DYpO/rT5PG+DIe0NEA6v0Pp4/qryrv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MrN8qaMosHvyWwhC2yF3fgESNWdjm0r99+YQgMwGjEFx9STyvh74RxTMnDXb+rOKRtEj24qW5hWwobY4FyDs7IUYibTqQIv/RKGSv8sxTh9uVqk8pWrFqljlYRyx9BaM4ln1nufzP5rwUPy+FeLAMjhLCLwnZxBTkDIteRrOiyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rV/AVWDf; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rV/AVWDf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kC4XNr7jFAK2qdu3sScs5Yj1fFxCUBe6/pLFuJiFZJA7J45DEEme0f8Fea2yDSK4E2001fkFZHaQOqdEt9ruc0r82cwJrfTyGsY4Gm6xkE1jn4abYhiSrv9LO6DsmZcfK/UX6zc5Hfx4XY3V+QqYYC1wdZ0A3BxKjV+OHC2SXfLPprLQuG59eOic7fP/XovQ1lKHYAj3jm0OOP6KYsyPvc83CEOe5oNFJ7wWGW4JO+Foe219vD1DgqYn2+xyJ8vUB8shkWi0V/RWxcYuZbUd2gurpywMr6HSvlO22no3bsA7qhAHW59KufaucXie47eXZB0QMzIW1dSNr8PqjKgUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijai2eVZ1+e9F5nqtTyylMVHjPcyu8FnS1Tii9XEg7g=;
 b=JHkS1K9jMqO+6N8/sU92qTAv7X4IpniE9wzGX65BlQ3c2jDq3+ZeUZkx4ZjFumO636sLrXz7T8XDS4+KmFP7MXwlR4xraT8vv83QMGsX63O97UKXu9MYOPleTELHHkm5RhKzUF/g2lvq3JY7PEzlH/5kqYOp/BtA6IuykFPffk2qneIUIxVdGVFHfinMIzMoaMCCsaj2ijoRSWAgmbKspYDzHBSLdVdnlCajFFV6jJixTusY/fR0WF0mywlKi8YOpWOOEthJfbJpuKkYFOLnKwGw2yzpLD/WZcsXihS+IFwNnn/nOwlWfANAMwuw1YptLP7dOPD8EneJQG0fZxpUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijai2eVZ1+e9F5nqtTyylMVHjPcyu8FnS1Tii9XEg7g=;
 b=rV/AVWDfCA16SRU03uvgsduxxxLNxlHJFxuag1WGMUkfwwNa3EdhRo528N2IFZg3Md/sr0pfx1eclTd6+uaTk03G8KLH75cyZipW2awPxnBpFDswtTgWeCpt2HLpDkVAOpH2X9QF4+Iej+G36uKqn4XZinWVYuCMpClZss+XekmJhQ1m+iSti3ONFdhs7kjQ2SDRTWb36DQF6rICohcaG8LZc+j1VEHCc+yWN5mhTKc41wCuYjaEyuhklq4DqBH7fISId6RFuRNPIUQIAxXvtPA2zeS2crUrEQktLfvjfkcGDdPaAHBb7blRT1Zhw4lI8irjhjN3yV2BFje7y0w9aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6862.eurprd04.prod.outlook.com
 (2603:10a6:803:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:49:18 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:49:17 +0000
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
Subject: [PATCH 21/21] ASoC: rt5514-spi: Free the DSP context on component remove
Date: Mon, 21 Sep 2026 19:46:40 +0900
Message-ID: <20260921104640.1941554-22-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0121.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::17) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: f43deedc-0e10-4114-6759-08df17cdfbc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Gn/oW5pBz6LcXuNq0+OS1q4qpu606W+GitwIAudzAeJObuLl/f1mViWa5cDmnRF5dJLLdWBs0yf43Q7VrzOFfvkIhnIdq9VHaeKUpGyMad1y8Evo20BTn9KaryD6dwjRKVFoXdraPbWJN9um3h1y+vQZTbnkCnRwtMJY9NPtXRG5/27jwCN+9IRjXZvlXqutgCr5VZF/ywD9mJ1LZqXTFwmTjphn2YyFF7wNiDk3xKZNaOnacRzCVCib6TU3QNUzbeVuUpzoiRcmT75oA/zY8wmsw2pUgkz2JE1xvMplTGmAPpx2mJgEE7T86VhYOQqJY7Z0FOh/PTZ8TlBX6aaIc4hwrc1NxqIdvSGdo1hn7o21UPFe9y7g+PYdI+LBMwoCEmiU/rN8QYevJIV0NmZW/xOhy7LZ94GsPELPlLXErT5Z2s8sDJw9ycjEUQCv22AWjUBj0YYC/oluS20ekUYo9COnNjQQ8nLvMk6VULtB9fBaxWo0qTe3b3XI/LsEMIyt18p0ddqHg8Aev1NJPTCle7qVOoBzYVHcJ6jITvAvBIL+M61oxuvVSOUHWIRoranGBQHgboR/U1rHOGm4ngZjGvFJ2HBMeyBvLH2jtZYwiBahS/zX9Cd+ljXg+3Mi6WqdLz6NtBvxh6qcZMFo025wr8Nd86llG7MZcGo1qIpgGV4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vVBJl2NphL54N4yW31Dzy9wYHP+Cqdk5xZHVbBw9TTzU1WwB61M73jKTIBek?=
 =?us-ascii?Q?T09fUBZgoWatf7bVnktw+u/um15rfoOyGLWz6CqqStrhfVy9o71kQ+eUswIW?=
 =?us-ascii?Q?7damXXgQrbKWXkruAz3puatzyUyP8mSrG/npNJCo/EWWB237LOdOjBhNMghu?=
 =?us-ascii?Q?ICQr8d1OBhqpsr1hPqkzi4pCt2BJkNKLK9OOemlzdCAQnznEvswDragMz4+w?=
 =?us-ascii?Q?Pq63H+VsXtODY0hdMDWnPjWquOuii0yVsX3EiEpANgLZqqX5rc/olWTEuCZR?=
 =?us-ascii?Q?Vy1ReKSTllqNStquIM+F9WdxB+UskPFRlBZL/3SbXo42uwtllDA5VNz30mOh?=
 =?us-ascii?Q?C/dkLnF3k5R6iOgjGHXBNgHRm3E3lGa6cKCsey3VfS188oubDa8Zr61AiWrd?=
 =?us-ascii?Q?C8KaNrukL9LmRBeLjfb4Uy2YOmA1FgLMe69Iw73oiCy9LSHN7um/+KdqLVn8?=
 =?us-ascii?Q?fRAere3IHdcifSIGIzY005YVuHlapbv9H01H8LHZmpNQqE+Pc/TuKawOOe4L?=
 =?us-ascii?Q?T2i11IZ/uvizUClc/tHQfocZNOyrOOvKobBxDRrHEasAhmUR7QYLb7hsGmGg?=
 =?us-ascii?Q?lQpzrg6wYmv8j7im8TJyubBWygCcwJ545uGtgKDWu6oKpBlU17XMu4Cp/1Ip?=
 =?us-ascii?Q?3OEaVir9imMiLXxApBnVyPS4N8Xpq2qUBn//zU/xhM+lUSR8LySkPhzx8kdc?=
 =?us-ascii?Q?ucRJob755iyHTH9+U48qdzA3uPozKbTrs6T47Ycix/4ZpOA4ly0q7+KzJOnd?=
 =?us-ascii?Q?NLVZ1o9OjXLn5ULFLO07eA+WoZJb/7NlM+16hkgZNeoSg0WOIzM5t9gegCfv?=
 =?us-ascii?Q?dlCQB5Xq/cevb6BwZR3DaCpvWMGx2Gf4xvwAlD7MErcssz1YVCI/ZdCwqUji?=
 =?us-ascii?Q?37xe5c6yi/rMmmbNjMFhC9Xybmtii3UFIsfp1O95toMt7xbc6nXYQ3dTKmYN?=
 =?us-ascii?Q?cw/HzsNoB3r2+fKTPe0KG6br6exjMRECBYflJIP4aNqiKSBLiiSLE+3V2xv1?=
 =?us-ascii?Q?x/nr1CcE8SMWuDNylqKDk4yqLo/wwEePb8Bc3iH4xGqvB2Xc12/sEvNe4WEr?=
 =?us-ascii?Q?h2bF9XKLQZxYpyKJMHw6174yvhx6rCH8MVGJJV3TnvjcwCOeenSEpDSxQruf?=
 =?us-ascii?Q?N3GqPMyQWnSoTqCZA1WbP8MwNZsu70t2BtgCoJ6hej87zNHwo3TTjiIQQIDb?=
 =?us-ascii?Q?2/8MTwBLV4E0OXS3YN9f5RCOtAflAdu95npDdOAmc7myiEMhWID31DtVUwc+?=
 =?us-ascii?Q?x2Ygu6RznoI2RvUaYTIyxbRWC8BuI7xPVt/qwopkm/kgBNINdeheI+M8+is7?=
 =?us-ascii?Q?ZGgs2tG5p2o8FL9Lw0Mf1z3UihY3CGsMHWrlCTk6OvNVH+ByNUuUHrCCTj4j?=
 =?us-ascii?Q?oerTbPccGiPlcxKQamJ5sg+BQaN5z10nuddXXU9uXGKLV80wsqcIVkg4Wauq?=
 =?us-ascii?Q?ml7fzN0SdmX63hWZRdFAV7M5MahPJnULcgLsuIXxByeaYWU5qIEq7IJHdo+R?=
 =?us-ascii?Q?MGAa3j+gZy/rdC8URlEXXhoMD1xwIh8IBMuvjiRRKvU7McMnGZr/xV/RrHzY?=
 =?us-ascii?Q?Yiac+yq+ChkuAbk3AtxDyB8OkQ1+VDBVLBNLjpum3R1BU+WP8C9k4hPxoZkT?=
 =?us-ascii?Q?SBgeG89zWUgwJfIchA7po9r7lyCq8DPpcsM/QdJiNj1u9P4MzeAc2oo8CpVP?=
 =?us-ascii?Q?asDO8JM1Z9xDk2aB76myyTkdJM6tMrhC/aw5RVF1LHxFtBSlBlZbrZYIf/Wl?=
 =?us-ascii?Q?dKOIyU0LQsIpFX6q9x3p0cv/pz1MDlRRTcBYGNJYS2EMyBbEavJU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43deedc-0e10-4114-6759-08df17cdfbc5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:49:17.1056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fphJDEoYDS7a3cG9L6a/d9nnUcA3OoQAuhtqaVyDNDQnho1nMtG/8++kW2chmhdIM/njb0DA23VvN3n6dMwYMe+t0AFnK/iEmzbv1YgG0Px3zy+PWLKY05ArWBFhg05y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

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
destroys the mutex and frees the context. The threaded IRQ is requested
with the non-devm request_irq() API and freed explicitly in component
.remove.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5514-spi.c | 37 ++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 91290bfe8daa..b7b48a9141ee 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -257,8 +257,7 @@ static int rt5514_spi_pcm_probe(struct snd_soc_component *component)
 	struct rt5514_dsp *rt5514_dsp;
 	int ret;
 
-	rt5514_dsp = devm_kzalloc(component->dev, sizeof(*rt5514_dsp),
-			GFP_KERNEL);
+	rt5514_dsp = kzalloc_obj(*rt5514_dsp);
 	if (!rt5514_dsp)
 		return -ENOMEM;
 
@@ -268,21 +267,40 @@ static int rt5514_spi_pcm_probe(struct snd_soc_component *component)
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
-			device_init_wakeup(rt5514_dsp->dev, true);
+			kfree(rt5514_dsp);
+			return ret;
+		}
+
+		device_init_wakeup(rt5514_dsp->dev, true);
 	}
 
 	return 0;
 }
 
+static void rt5514_spi_pcm_remove(struct snd_soc_component *component)
+{
+	struct rt5514_dsp *rt5514_dsp =
+		snd_soc_component_get_drvdata(component);
+
+	if (rt5514_spi->irq) {
+		free_irq(rt5514_spi->irq, rt5514_dsp);
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
@@ -294,6 +312,7 @@ static int rt5514_spi_pcm_new(struct snd_soc_component *component,
 static const struct snd_soc_component_driver rt5514_spi_component = {
 	.name			= DRV_NAME,
 	.probe			= rt5514_spi_pcm_probe,
+	.remove			= rt5514_spi_pcm_remove,
 	.open			= rt5514_spi_pcm_open,
 	.hw_params		= rt5514_spi_hw_params,
 	.hw_free		= rt5514_spi_hw_free,
-- 
2.50.1

