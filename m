Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793271142;
	b=iSpXva3kgbp2LLsC8I7MP3rfhg9GTaawjPqq5AYPe0Fuq54qJn3w1vJqhUbLUJGAxqpr
	 T0gZfey/NEbWxAgrkdcaZD21eux4Of7aFO687y0rleP40I1pJrqzCkdQxNezxfdKURDsk
	 WFYo7DIWa5a/HZcv9eTjxtbtIZwM4SFVc5DH86X/0k230SQ6VE7xnhBmwMnZowB3ywIuZ
	 oLAfg6KxDOsJpsBmGOQ1wmWyw5ywKRW0ZGGH/NGG2FiSR1h6m5JEPPKkCIGKQcPdKdqJd
	 51v0i5sctD7OVfecwNp/TiLIXN0kTJGrD9cR3bsZ11njBNBhlUfUZHnF8bz/wZYkjVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271142;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=pcWR6zS22eLlXCNdS0qqggx14g/DX1D/igW+y9lxbMY=;
	b=gMxOhYUC4FQcOCsvp1cebnmsj18M9Yan4L0FsDTONCNGJEnbD3DcLj091Wv7okvM5myN
	 ++faYdj1bqP4LvJJJvxQeVNgw0Xr8v9E8VLMJc86dCkbEsnM1sge8M+kXpYtSUVy/B8YT
	 kwSCVXqllzvtkpIM9pG954ZxVvKv2RKt1ZY+MyLz8wTeEVXQ9wOIP+3U3IMLqz4Q7Ui9C
	 Y4ix+W1qFnsDFi7plHpbE3e1UrcX90P4TkKQCjiEB2guQR19dZrAE22821vaWru3j7LgL
	 DuoCs6zaZIL8tjPm1JOp1P1P8D0xrNeUabQxIii9V9EuCafn/l/CwZJ0b8jq2kKM4MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=oswG3FqJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.30
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010030.outbound.protection.outlook.com [52.103.23.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE54606A31E;
	Thu, 29 Oct 2026 10:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DE54606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=oswG3FqJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqG6xM/Np2e0FcqZ5zlfPQUL8wUGXa33reGzp+ISHXpOK1idM0UtehIPG4CCe6rDP//umWE9m+UUPokXx6jbRAer6KS+QKFkYEfLJrF4HJzAcBfj//RS72qT+flPoEm3qCkxGAbsPwkBAXZZ/fo4GDhFLanRWrUtId1PLnOJQx9AKlarK4a2zOtuZ0jXAhR8BhJqfuEa1SUSUUYqihZRfsN4zefKAMxcw27qtvohsyhSbDj0PhjRGtm8hsHFJRx5tS+GPSRxNV4oppUD4CG0yTXcTkjXrmCTdh8uDO3Fqr14NuaIwuXVwgjf7Xh1u7hrnOfWrFkeA//EhOQUPJm4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcWR6zS22eLlXCNdS0qqggx14g/DX1D/igW+y9lxbMY=;
 b=tfj1mnsu+UkDnP5sShOCYL6h+YCtOLQYIxuU4CciIi0RSRtIwppvKvEJSCPvri5RXBAjtu0L2yesq2jOT3oF5S62HN6xefEc6uRKBH6D2NqM5nXbREzLYH6bO3KRcjz//ARkaGjeeUjDyuwo6kDAae2EfCSyAV6iY7NmGGAVskPkF3i3DR9wQo36/MjWw2UZq/wAnk1x1JqbEQS+65PWZ8J5eAfgoc20k8UO1G8ciHTUVTbkwlqvkr6uArCaO5fZc8XavODdCPUNiHBnDzWEP62sb1z4w2wV3n16VLDgu630/ZkIyyJ69+OoborbcLTD2b0KR4zLfS7N5tnGODxFag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcWR6zS22eLlXCNdS0qqggx14g/DX1D/igW+y9lxbMY=;
 b=oswG3FqJnSzVLM/eHJJg/cafQBciWUwHS+NFNb0flnVVQ2GcqesqmcmYg/Aws4j0rcbmdFnUgzvDxB4S7F/rzt2FTvP3/m3LCzZ2D7lWNfsg7z1m7skuNyLl6cnYumEoYKwtpshjc/kuNr6QyaDiP9/sYzLW+GuUGOzfc+07GzkQ7ajSOzBBa7zpH+Bm4BNPO/WgKw0mt8HTYQ2zWIo/Uv5mu3z4HxQi5C8a3an6jva2pA/LNbzZLcIPwyz7xiBiDNC4IxchrsF0qJyZG4M2lklNZrVLlOHWNG+8U14VRoDKFVwdOQmY9W0RayzRswDrUfe9YtyndpSs6md8y9DZPg==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by BL3PR19MB6492.namprd19.prod.outlook.com (2603:10b6:208:3b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Thu, 29 Oct
 2026 10:52:20 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 10:52:19 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: aw88399: move library exports to SND_SOC_AW88399_LIB namespace
Date: Thu, 29 Oct 2026 11:51:59 +0100
Message-ID:
 <SN6PR19MB2303BF7F0C1B1BE767351D98FC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SN6PR19MB23035A048BCAF108507B59D0FC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB23035A048BCAF108507B59D0FC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0345.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::6) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261029105159.16954-3-marco_giunta@outlook.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|BL3PR19MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: 75965777-d102-4501-f56a-08df35aab403
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|260925184616899003|12121999013|24021099003|25010399006|15080799012|51005399006|41001999006|5072599009|23021999003|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?76G9RLJ3m0f+RFRc75RxVG4AFEGK2dTyTjymqygqnZAXmjxMaomjo729nT5v?=
 =?us-ascii?Q?vsh2VwAFbNtwahtmPVdG29qjTdZw4j8pTb4oV5OLUW7iUMvLH6hV+H6nRegQ?=
 =?us-ascii?Q?24TVeEfXFCFg4Uy+tmQC+rr3IXHtAakWeRiVVJj5Xm6rHBfrCMtKMeP5yCko?=
 =?us-ascii?Q?XvaJ6iCE+SIkrB4GpAW28wcl2p8kUq/GClH0NZG3PkRPE+qA7Emci8SCVQp4?=
 =?us-ascii?Q?fl84htKH6W92bSykGHodawPpTprU8NOFy11oqXTw/MnDPr6IpV76u5Z6kQj3?=
 =?us-ascii?Q?6Pzntpd8+tpqiEvXWcNnKHeVYC+cZHe53Q+EcIhepdMHicDWBbZ84wK6pnu6?=
 =?us-ascii?Q?aR2Ka922WEbz1183JgxfNdeXTh6KTk0mn4kkw57x/Tvi5e4ABAS0eLnl142T?=
 =?us-ascii?Q?MBPb6DamX/uZfWf8aPzPILDeOVa9L6JbP+HSJP8493ZYhgVPEIMt/LLi1LvG?=
 =?us-ascii?Q?G0EWvGN9aQjJTM0/N3RueFHxWgU6Xi+j/9MFst4JMjGqcNF3ReBv7gGD5y2m?=
 =?us-ascii?Q?S7Ez1HFQJmijkyoqhITaNUpCRTuXciSQgUJP3pBHRY17fs86keWaWa/00fd8?=
 =?us-ascii?Q?gS3XOu6464it688kLmzmahz4qE1VFmKLI9m3KX8gfoH+1oL6i3uh4gZPlogT?=
 =?us-ascii?Q?eRy6fMNb8CNSmX357LI3dY9OSoVP4OV1zADDrASeUxS//lzbbLWVxqNvk6f3?=
 =?us-ascii?Q?vwunGH2PLmz/rP1bExYzt2skhGn67lPTYQ76qMU4XC1rn6M/mlLeV25AJnEj?=
 =?us-ascii?Q?dule98ZCKaIkcRCTnn8x7V8SDHS+JlH+y30XXcvQc8QpXRuq8uAgHelILouc?=
 =?us-ascii?Q?5REN7JBFPZtl1BVmkPWWBpt9lagL5MZTNCMGvuKgZsKCOqdwGee7zLIXmW2R?=
 =?us-ascii?Q?qG704uPRUxJb9WhVUUMrGvz0x59fCLghZKf8jVahTPKwfU5GACJzzinD59EF?=
 =?us-ascii?Q?PvkvHf0EUSCnjS6Sp18vbTGidYmGMq1VtCcGsxa+NBW9VfyLasgyHgGmgng2?=
 =?us-ascii?Q?jSO2XZC1Xe/1iRMMGRXKY8j5e4SyaUlTjjcGXYeoVK5/9Wo=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T1si+T9g/b+XOWu58Zs82vFyVT9QSDPLrtQgllY68qpnkYArb9gyzsp8gnbS?=
 =?us-ascii?Q?WUsmEfPnXwWev3MOFeCunh1i1b3C5XidiJYL0IIcSGFFQcnbYq7r+aqKtX4M?=
 =?us-ascii?Q?LLqb/885Cd3S2TEeFYzfwdlkK9DNSJoCvAnTg2gofCO/1nwQNp/etY9l1lwu?=
 =?us-ascii?Q?fMfyv1eXPHnEy3cfCcgHdwuiJrLKCOWAH5uW1os6KUyFJHk843HS7JjuTrD/?=
 =?us-ascii?Q?3ODwB+3cCEQPx+GlOOH5nV9kp4WbK1tD2cS/N0B5OWSnSliF+Zm26qB3lSb6?=
 =?us-ascii?Q?ZyJSKfT/TdHCh6Znt+mcNdQ/tvmMQjU4bsaT58bzYWmnYsIUrmKzrRrKaDMR?=
 =?us-ascii?Q?/gbs2i+ifZG9ikwMokGsLWkQxIp8SBhVMVcNmIKpzVDPyvTXD0bHZ7qv8Jae?=
 =?us-ascii?Q?c8YRWgzoS2HhrWUNSpS0W/M+z0qdTbBk3dRYE2rYs6WZSIJ8aWULSJZs//lk?=
 =?us-ascii?Q?zF0I/SQEadwlMNC3bxBZN4KbVRg7Ya6trW2vN9q2qdacSCsG8EbRR59lRFCi?=
 =?us-ascii?Q?MCCAKhSlH06ZkuenhkTdEnfZqjUtevWw5aDRHQWHNz32C2KGaE4mtmgZrIC2?=
 =?us-ascii?Q?x3aUF2v3D+zvEXTzN44ikCIp3YzzOWUSthmscRgNau0A4kYNZrhhxEAqMQRH?=
 =?us-ascii?Q?ompQl2fRqafsKs7W+rmcOYOvGsmyaG9+wSkIVS7E+nRWOQR206dtJ0y4K9P4?=
 =?us-ascii?Q?bpHYAUoH68kn3lKXfrpxD+MRN5qyUfKwQyS2Yk9QdoTNU8Mxe1Cy1p410mcu?=
 =?us-ascii?Q?AXUMSP+WBOE4WilZnd67gbJuQ2goTnYd0whi7Vfyn8JWRdmxcj+Mte2i/BkD?=
 =?us-ascii?Q?WNwkJbHsOzoE3Wn7o8PzIbtq5dkqTyryu60HPZtJU9MhyNNkIqZG/xc5jE/A?=
 =?us-ascii?Q?Sd8JyYB8o2+2IdfjpczLgQjggsaSMUCEA7nty1ZlVCSaoyHBQP/1F1EZMFry?=
 =?us-ascii?Q?PUO3Eh9FFQ3gBzVi8nLS2DuwsT+2571l6a9OHy884QtaL93sf9vb9r986QqN?=
 =?us-ascii?Q?aaElnmFAlBFx/GHPDedCKgcVz6O210Cn1tJ3cMlov94+hS+jkOXq0gbuu488?=
 =?us-ascii?Q?ONrprBtWFSbJxpOhhHOMPFOsDsFvvCZnWYb5GiYH/vDnjdQlrrhHOAndqE59?=
 =?us-ascii?Q?DXkpNedxyDl+PJRdmaeYsOPkNJZitMC6usp1NccrOSM2vYbwuqL7clR4/5Y7?=
 =?us-ascii?Q?YeJfM7l2OubWfgl+YPAIFOKbDDL839Gkfo0tEgZqTx5r6WdCOc2coWjb1V31?=
 =?us-ascii?Q?Y5egrzKjAExfXAA4SRutkynM+DFc+hTkBmAoERPYEN1L/76mhvmUzXfXx1TP?=
 =?us-ascii?Q?SC4miVHWafhg2kext0deVGsTdNN0Mcjr46ij8F58cXANF8vviiZVsZ0mFSRP?=
 =?us-ascii?Q?9QPIl3ugv8To7L0FD92ihRaph3XP?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 75965777-d102-4501-f56a-08df35aab403
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:52:19.2549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB6492

Replace every EXPORT_SYMBOL_GPL(x) in aw88399-lib.c with
EXPORT_SYMBOL_NS_GPL(x, "SND_SOC_AW88399_LIB"), and add the corresponding
MODULE_IMPORT_NS("SND_SOC_AW88399_LIB") metadata to the ASoC and HDA
users of the library (aw88399.c, aw88399_hda.c, aw88399_hda_i2c.c).

This makes module dependencies explicit, consistent with the namespaced
exports in the HDA side-codec driver.

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/hda/codecs/side-codecs/aw88399_hda.c    |  1 +
 .../hda/codecs/side-codecs/aw88399_hda_i2c.c  |  1 +
 sound/soc/codecs/aw88399-lib.c                | 30 +++++++++----------
 sound/soc/codecs/aw88399.c                    |  1 +
 4 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/aw88399_hda.c b/sound/hda/codecs/side-codecs/aw88399_hda.c
index 5d5acf87ef3c..94a4577cb2fe 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda.c
+++ b/sound/hda/codecs/side-codecs/aw88399_hda.c
@@ -355,6 +355,7 @@ const struct dev_pm_ops aw88399_hda_pm_ops = {
 EXPORT_SYMBOL_NS_GPL(aw88399_hda_pm_ops, "SND_HDA_SCODEC_AW88399");
 
 MODULE_DESCRIPTION("AW88399 HDA driver");
+MODULE_IMPORT_NS("SND_SOC_AW88399_LIB");
 MODULE_AUTHOR("Yakov Till <yakov.till@gmail.com>");
 MODULE_AUTHOR("Marco Giunta <marco_giunta@outlook.it>");
 MODULE_LICENSE("GPL");
diff --git a/sound/hda/codecs/side-codecs/aw88399_hda_i2c.c b/sound/hda/codecs/side-codecs/aw88399_hda_i2c.c
index 9443ca887431..0b3fa75e09c7 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/aw88399_hda_i2c.c
@@ -50,6 +50,7 @@ module_i2c_driver(aw88399_hda_i2c_driver);
 
 MODULE_DESCRIPTION("HDA AW88399 I2C driver");
 MODULE_IMPORT_NS("SND_HDA_SCODEC_AW88399");
+MODULE_IMPORT_NS("SND_SOC_AW88399_LIB");
 MODULE_AUTHOR("Yakov Till <yakov.till@gmail.com>");
 MODULE_AUTHOR("Marco Giunta <marco_giunta@outlook.it>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/aw88399-lib.c b/sound/soc/codecs/aw88399-lib.c
index b4e8aae56805..b08baacad87b 100644
--- a/sound/soc/codecs/aw88399-lib.c
+++ b/sound/soc/codecs/aw88399-lib.c
@@ -23,7 +23,7 @@ const struct regmap_config aw88399_remap_config = {
 	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
 	.val_format_endian = REGMAP_ENDIAN_BIG,
 };
-EXPORT_SYMBOL_GPL(aw88399_remap_config);
+EXPORT_SYMBOL_NS_GPL(aw88399_remap_config, "SND_SOC_AW88399_LIB");
 
 static void aw_dev_pwd(struct aw_device *aw_dev, bool pwd)
 {
@@ -165,7 +165,7 @@ int aw_dev_check_syspll(struct aw_device *aw_dev)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(aw_dev_check_syspll);
+EXPORT_SYMBOL_NS_GPL(aw_dev_check_syspll, "SND_SOC_AW88399_LIB");
 
 static int aw_dev_check_sysst(struct aw_device *aw_dev)
 {
@@ -241,7 +241,7 @@ void aw_dev_dsp_enable(struct aw_device *aw_dev, bool is_enable)
 	if (ret)
 		dev_dbg(aw_dev->dev, "%s failed\n", __func__);
 }
-EXPORT_SYMBOL_GPL(aw_dev_dsp_enable);
+EXPORT_SYMBOL_NS_GPL(aw_dev_dsp_enable, "SND_SOC_AW88399_LIB");
 
 static int aw88399_dev_get_icalk(struct aw88399 *aw88399, int16_t *icalk)
 {
@@ -418,7 +418,7 @@ int aw_dev_update_cali_re(struct aw_cali_desc *cali_desc)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(aw_dev_update_cali_re);
+EXPORT_SYMBOL_NS_GPL(aw_dev_update_cali_re, "SND_SOC_AW88399_LIB");
 
 static int aw_dev_fw_crc_check(struct aw_device *aw_dev)
 {
@@ -572,7 +572,7 @@ int aw_dev_get_dsp_status(struct aw_device *aw_dev)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(aw_dev_get_dsp_status);
+EXPORT_SYMBOL_NS_GPL(aw_dev_get_dsp_status, "SND_SOC_AW88399_LIB");
 
 static int aw_dev_dsp_check(struct aw_device *aw_dev)
 {
@@ -625,7 +625,7 @@ int aw_dev_set_volume(struct aw_device *aw_dev, unsigned int value)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(aw_dev_set_volume);
+EXPORT_SYMBOL_NS_GPL(aw_dev_set_volume, "SND_SOC_AW88399_LIB");
 
 static void aw_dev_fade_in(struct aw_device *aw_dev)
 {
@@ -682,7 +682,7 @@ void aw88399_dev_mute(struct aw_device *aw_dev, bool is_mute)
 		aw_dev_fade_in(aw_dev);
 	}
 }
-EXPORT_SYMBOL_GPL(aw88399_dev_mute);
+EXPORT_SYMBOL_NS_GPL(aw88399_dev_mute, "SND_SOC_AW88399_LIB");
 
 static void aw88399_dev_set_dither(struct aw88399 *aw88399, bool dither)
 {
@@ -1038,7 +1038,7 @@ int aw88399_dev_get_prof_name(struct aw_device *aw_dev, int index, char **prof_n
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(aw88399_dev_get_prof_name);
+EXPORT_SYMBOL_NS_GPL(aw88399_dev_get_prof_name, "SND_SOC_AW88399_LIB");
 
 static int aw88399_dev_get_prof_data(struct aw_device *aw_dev, int index,
 			struct aw_prof_desc **prof_desc)
@@ -1163,7 +1163,7 @@ void aw88399_startup_work(struct work_struct *work)
 	aw88399_start_pa(aw88399);
 	mutex_unlock(&aw88399->lock);
 }
-EXPORT_SYMBOL_GPL(aw88399_startup_work);
+EXPORT_SYMBOL_NS_GPL(aw88399_startup_work, "SND_SOC_AW88399_LIB");
 
 void aw88399_start(struct aw88399 *aw88399, bool sync_start)
 {
@@ -1191,7 +1191,7 @@ void aw88399_start(struct aw88399 *aw88399, bool sync_start)
 			&aw88399->start_work,
 			AW88399_START_WORK_DELAY_MS);
 }
-EXPORT_SYMBOL_GPL(aw88399_start);
+EXPORT_SYMBOL_NS_GPL(aw88399_start, "SND_SOC_AW88399_LIB");
 
 static int aw_dev_check_sysint(struct aw_device *aw_dev)
 {
@@ -1244,7 +1244,7 @@ int aw88399_stop(struct aw_device *aw_dev)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(aw88399_stop);
+EXPORT_SYMBOL_NS_GPL(aw88399_stop, "SND_SOC_AW88399_LIB");
 
 static int aw88399_dev_init(struct aw88399 *aw88399, struct aw_container *aw_cfg)
 {
@@ -1323,7 +1323,7 @@ int aw88399_request_firmware_file(struct aw88399 *aw88399, const char *fw_name)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(aw88399_request_firmware_file);
+EXPORT_SYMBOL_NS_GPL(aw88399_request_firmware_file, "SND_SOC_AW88399_LIB");
 
 void aw88399_hw_reset(struct aw88399 *aw88399)
 {
@@ -1336,7 +1336,7 @@ void aw88399_hw_reset(struct aw88399 *aw88399)
 		usleep_range(AW88399_1000_US, AW88399_1000_US + 10);
 	}
 }
-EXPORT_SYMBOL_GPL(aw88399_hw_reset);
+EXPORT_SYMBOL_NS_GPL(aw88399_hw_reset, "SND_SOC_AW88399_LIB");
 
 static void aw88399_parse_channel_dt(struct aw_device *aw_dev)
 {
@@ -1401,13 +1401,13 @@ int aw88399_init(struct aw88399 *aw88399, struct i2c_client *i2c, struct regmap
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(aw88399_init);
+EXPORT_SYMBOL_NS_GPL(aw88399_init, "SND_SOC_AW88399_LIB");
 
 void aw88399_dev_set_channel(struct aw88399 *aw88399, int channel)
 {
 	aw88399->aw_pa->channel = channel;
 }
-EXPORT_SYMBOL_GPL(aw88399_dev_set_channel);
+EXPORT_SYMBOL_NS_GPL(aw88399_dev_set_channel, "SND_SOC_AW88399_LIB");
 
 MODULE_DESCRIPTION("AW88399 common device library");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index 320dc1b87841..c398f66a5262 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -818,4 +818,5 @@ static struct i2c_driver aw88399_i2c_driver = {
 module_i2c_driver(aw88399_i2c_driver);
 
 MODULE_DESCRIPTION("ASoC AW88399 Smart PA Driver");
+MODULE_IMPORT_NS("SND_SOC_AW88399_LIB");
 MODULE_LICENSE("GPL v2");
-- 
2.56.0

