Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720312;
	b=S0SyGNn4AHivK3lOa63FsGfW3BkbsYwXOKj3iobKxKVa4CLXKZCuaDkMUs2yTGV1z2i9
	 bY0Z8LZaEwsww1OElSQOza8qO6mY/a0O2IY+d0xfM9YjAp5UpNmvXwSXUANqbY8OFHoUK
	 43w5qqbuWTEvE+FT9MA0FgLZWY8pcpjIhjJM6Jmpa+Rsoyy1LEbn2v2Ftmqa2sCPRKpKh
	 p54tPG32dSRexHkOV1j7tmy7dICrygysTb/dUYrdfngyB69sF/cOB26mvaoGVqOw3NZah
	 nfx4oJxiKG5zlb+EsBIheFi3I1vV66nAprxrXgkYIAtpMBuDXHXPgFO403sY1oXzccg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720312;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=03vNmDZlFtlPLYGRDWalhEJZQQxG1q6We/v82Jq3HwA=;
	b=RsC9qSiBLM3TU5ttVZTxJDVd8/Amh6ypt8IWpcoYDkQ3VnWHtxoIbpDV6FYx19t1swGA
	 98/pZsHoMBHpJnNXrFtmaheLJb5BNHe/SnuWMF5lCA/F2BraXvO5JFJlsRrvVHCEAWTLA
	 +z4ZCqwmhLQVdAFWdXLrAHBfLyyiNsUSfGOWuQST6XElhKmhPpFJTSo9A2fbUdc/1gVs9
	 rjzdCcIYnXJzj10OK/7MB8kOr18yRPdiUJ5UQVkMi0n7THOI7Fqq3gbSp+fD3Rj6yJSDz
	 3RSgwQOd+JZwX6UbiyiVeoXOVSJS7OqjRBYQAWnuq0GpjdsYD35MGRms+ddtqP16OZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WMlxV9t4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.28
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8BF606A327;
	Tue,  3 Nov 2026 15:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F8BF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WMlxV9t4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkoMXhtz5c4x9Vf1/OzU4Ut3u+9OcJr5A9VuZaIqPsFldayOJxUGsIDZU8601TVy8DcOHXFgaoh+5ithf7LuwOEzuJ5LIxMVu2kEiAajPedGISj9EXPjFB5fzsPxOkYYkJJi2AAAJ5jpUidXJ9gyPGILAzh9mow9C4bl4xssuOsMb9pgCAFLvhfcpEgpHjpXcKWVyGJicin6cCGmhN2DtQ5/uog0koL9DIJp7V3IayJ8ze4y97oHLNDcVmmUIZcrYVasq1hvMVqpe3Yxcnh3B4oPicgWJakErv19NsM+va4Z3Okbxa1IxuUOaQVeNHeunoBehySMEKugjYqLtZ2JOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03vNmDZlFtlPLYGRDWalhEJZQQxG1q6We/v82Jq3HwA=;
 b=njBOednQ/lQB+RRPi9ry9gHjYyO5zb53u/ymbwqBgf5LPgxTI916lyRopvaUOBVcKgqnQhf2hZibO7c0gvH5PcZ8wUuhFzt5L02JEeZs1xKwrXzkKivPggw9J+Yj/TgIO21UMjSIIiW61O77KiEWtluhNsBQPeQOyVQClhowNQJoV/Y0PSZ26BXyVQuyYBcXMwum1re5mJ2OX6Oe1dCvVtnpYlzaKLHyjPuN8uuNSLt4KODTNzYziUY4f+aw5ax8B54YI1Ia0Joqu812WUPnOz6ggfGEFSUR6cuySFxPO+2sROD9ofw+2/pxVE+uls89aLhEe9bbrX1KdTHoZBC+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03vNmDZlFtlPLYGRDWalhEJZQQxG1q6We/v82Jq3HwA=;
 b=WMlxV9t4oFTR1JEUL7I4cywIfU7gapLr6ODs8D/cegM57FC1M68ebkM7wwZDQBRJdFlS7qJ/Cz8JAIpmtVth6GdWwn5uTcMwHpyfRKkviuLpyosHX6nhAkunhMSpdWW1LWLX7k3aeJkAgb9hu8qMJSFtIY3kSJ/5ETQG8MuBV4Noi9O/NidJxR6tWv5794a6rKz+JgF8+NeDs+ucSjXJhSaArsd1g21ZafHgLy1KfGwA6q1KF+BAwdWNsbEJ8D8BWAU/d/6isnpvPYjRSKIpjg4cTPmjME2HZvYBEnv3ixftnBfKrZJ3LcEEDBbclnCPpFiFWM1fMncF8+kHWcz8QA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6994.eurprd04.prod.outlook.com (2603:10a6:208:188::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:38:29 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:38:29 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 7/9] media: ti: omap: use dmaengine_desc_set_callback()
Date: Tue,  3 Nov 2026 10:37:07 -0500
Message-ID: <20261103153721.1232488-7-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
References: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:510:23c::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a2a148-3f37-49da-9611-08df39c08238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|10067099003|18002099003|22082099003|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003|261026140227099003|261028144727099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	ONe3Mx7kg8pJ/W35laI9i30KkKLyywBkT0/mSJMrcrxnyqVNZe9nr3rDerH0tbzYLPI6p/kd9N4tSrr6rqyJEu2/VE/W1JoR7r40RpJkALXIqt1nKS4nRvfPq9Fe04YGe9PLQOq/BknzxwHmUPUcZmafrObJ6UsB0ZZiB99yyumHddYHiN4rdnLVMG2hfZ8nmYgvvjfHe1X4LCixG4dwcRMORAvTTyBAoT300R2LF/5TcRaJC0qgpRg7R9SzNEv54dZnp00cA1D34jfuFMPP3rolFH/sb3gqM6eu0O2UPMd2OEwY8doYbGmtkJVAMbvvov9N7mDC88G5Q5FTAa2HYpsbkWMZRNJDKwkvzhNXITUJoCrAhuYRtmB58neTBF3ouXKR5SRoPqCc0TQSieVluEIEqygZNnEGPNe/JPPhbTwP9UoCVgDEmK3+WdzmvVvIG4bnzRFKRq6W+qfCmj59x5+kANvcvny9b01r29fiiPx80+z0VI3ZOwVL0t6tHRPJTfFzamCWY49vwt9EloN5AFL7xze0wKvsZNeoXvQI4w8+tBWus3Hk1nOntEAo6S5VtcaWZr2SOqm9x3bQElVmNfMVe6LdYxvBsLNR15WuyosvEj6TTszZ4mAXxWqOM/yO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261028144727099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zZnjyGv4WsfE9tQRS0D4Oatey0prRkhs2mmNjPWugfiaTbOsH8Irg9+f+pMe?=
 =?us-ascii?Q?ezlZxiCv5MWQXCZLV4inF/z0Qa7mOvaBSEJaKMeLBrN0f6SVO7SM6UgjNQLG?=
 =?us-ascii?Q?TB6ywqi2i2/UbrwWz69Ma80ZgQWdYE8qt2ZNuF3dLsQ0FrYtOpxuVXNLhrJS?=
 =?us-ascii?Q?/KmbVNoA+be3cSudW8nFN089kJnqyuJq91IXx40sM4OYyGy4QTo4m3YvcNBq?=
 =?us-ascii?Q?2SxOlkT9DE0+jLYbq9HlVN9AT5Hr012glmtGaP6mWsaK9TofmT/RrqzrwXMs?=
 =?us-ascii?Q?/RXeMzU97d73cIhvyGYM0+Ee9B0vyxq89u91SoA6tD2TXSSmntP1mJHbuLTM?=
 =?us-ascii?Q?kVCIZy1D5g8P0d/KKopVmqz4zWK+b33094hcAA0XlQfMLbv27dILKeoNo6/x?=
 =?us-ascii?Q?2Nv75EQUOb5ya4sqIH0AecwHRvSBkguLrn4bnTFBdACtmjLpAFbqjc/bRgng?=
 =?us-ascii?Q?N/5V1STES1zQfscJt04wsVNwaiq+sez6364cCnZkIbQMnW1hoF3pVdvGPmsH?=
 =?us-ascii?Q?GLsy/JHOQuFA1Cq4sRdJgeuKPuA33uygnsiIqzKTcdqZiiAZyTrvlKaOnlK5?=
 =?us-ascii?Q?WPXPUFGzTTQAaHmpYVPBNDgtkcwncAAhijRsefCTHm7YIsfKCwfcLJAQ6fh/?=
 =?us-ascii?Q?z0QYJufMwFtt4GzaanKsgFZ2dIh59WZ9G5sI4uxdwlrK1/OGGJJ5ZVy1QWt7?=
 =?us-ascii?Q?6EZKEu/fCDXxc0wlbJx+8QBkgrrqbBhnMmY35q5EndkTbxKyBmznU5etQ54D?=
 =?us-ascii?Q?JA4IsNVx+i5sOBxAWEdWiT/dmOyssjcTkHF2pjfRy+qvKzaUQcMG+XHZI1oS?=
 =?us-ascii?Q?KKqGokkEWItXcwbjX1ak9ywuQfbva1UR3dSvFZ5CpMHtpA5EQbats7GxfMsF?=
 =?us-ascii?Q?pLVmz/1rR5C3vcBkjWy7w5IgJ8Q9uu5BEUs7vk/HSxpApZCq8oTDS3uuU3D4?=
 =?us-ascii?Q?l+XS3/jDkXx3el92FRfmEZPuTyDZFZFlRoU8tpOSix8fg4cnPLUw0yhxu3Wi?=
 =?us-ascii?Q?/ocBJA2/5oPPgBdyr1bdHn8n8Nk6+vRfTM6ayVYEi2DAQGEb4Rcp09zoi54f?=
 =?us-ascii?Q?gqFaNOJhCmR2yWf+qjpPu6g9K51hkzGLKhs3XWiKadkcHYK33jmFNMwvS82H?=
 =?us-ascii?Q?XEtXkQ/aiELdnqBPdl38y4SYofvh2vmpKYYQG7qHNCGHIqqK8wjF3OKGFRKR?=
 =?us-ascii?Q?DOmetaPQw/taeH3iFKzyoihIrY70uWhpNpqaQCgvF9TOETFUvB0vigpqy0is?=
 =?us-ascii?Q?snuADpK5ydc/yzHiawScIblIp0Rwj5QHKui8aC5zUJXjAfqKfxrK6TQv2eLt?=
 =?us-ascii?Q?BCHAz7S3XfwKFrK7TsPCEppVhDxKL/RD+qEW9ndhfa1+vJyerVVS8iDx5cCt?=
 =?us-ascii?Q?3KyTfOMRs4uHaKiYZLOkZj7YU6LgpyzWi6K2H9EfYSwmTv+Yq3g/ARgbXg9o?=
 =?us-ascii?Q?OleoqMt1sJNkBEWuoMXNWYmFxh4M/x4osnNY226vIAwZunL4WDgGLzvG0NOX?=
 =?us-ascii?Q?UK6jnyKalSRR6liBOaJ9Qux/sHL11y2272ejyxJESsJ4KYstMNsSZgBAwato?=
 =?us-ascii?Q?11BGntQ+7zHnMlK/1f8uYq2vjz6nTne4TWbAkco/vOi49W4G/tc8W0TySjEC?=
 =?us-ascii?Q?zAhSOYVNbanpDwcCXj6DiR8ilvZ8lOmSBQXLsurMcYLHGRJQQJ/b+2uWQVn2?=
 =?us-ascii?Q?EX7SZg/C5nnx5cGnAym6OFDKFTOJg75nwQ4pTzmLDi9UqSq/y3qtiVW28nAp?=
 =?us-ascii?Q?Rn8sxplb14P9NemHPn+CcrGDuZlKz2YxXh87Gx9gTfMVTXANo2qI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a2a148-3f37-49da-9611-08df39c08238
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:38:29.1836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: un4xELXQk5yxfAfr89TnO/ly022zbXTjnaPl5nMA9oAx+fN50UE1eUfPgE1aTQzsiTTh5C5DNMPjheKaOVlT4amBPNKpm2mUoxIU+I+B6P6ZWVEi80knhDjociJfM7hp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6994

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare to make struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
  split to simple patch
https://lore.kernel.org/imx/38f6a9abf37b06318bb6429ac04807941ca8d558.camel@collabora.com/
---
 drivers/media/platform/ti/omap/omap_vout_vrfb.c | 3 +--
 drivers/media/platform/ti/omap3isp/isphist.c    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/omap/omap_vout_vrfb.c b/drivers/media/platform/ti/omap/omap_vout_vrfb.c
index 0cfa0169875f0..006a4ae45a232 100644
--- a/drivers/media/platform/ti/omap/omap_vout_vrfb.c
+++ b/drivers/media/platform/ti/omap/omap_vout_vrfb.c
@@ -273,8 +273,7 @@ int omap_vout_prepare_vrfb(struct omap_vout_device *vout,
 		return -EINVAL;
 	}
 
-	tx->callback = omap_vout_vrfb_dma_tx_callback;
-	tx->callback_param = &vout->vrfb_dma_tx;
+	dmaengine_desc_set_callback(tx, omap_vout_vrfb_dma_tx_callback, NULL, &vout->vrfb_dma_tx);
 
 	cookie = dmaengine_submit(tx);
 	if (dma_submit_error(cookie)) {
diff --git a/drivers/media/platform/ti/omap3isp/isphist.c b/drivers/media/platform/ti/omap3isp/isphist.c
index dc02f240ee89a..281bd0e3748e9 100644
--- a/drivers/media/platform/ti/omap3isp/isphist.c
+++ b/drivers/media/platform/ti/omap3isp/isphist.c
@@ -209,8 +209,7 @@ static int hist_buf_dma(struct ispstat *hist)
 		goto error;
 	}
 
-	tx->callback = hist_dma_cb;
-	tx->callback_param = hist;
+	dmaengine_desc_set_callback(tx, hist_dma_cb, NULL, hist);
 	cookie = dmaengine_submit(tx);
 	if (dma_submit_error(cookie)) {
 		dev_dbg(hist->isp->dev, "hist: DMA submission failed\n");
-- 
2.43.0

