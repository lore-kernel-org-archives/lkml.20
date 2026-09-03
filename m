Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013048.outbound.protection.outlook.com [40.93.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5733135C6A9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405285; cv=fail; b=idjiHmp/Cwiz8gezWmD92WFcQbkbXaWfNHnKJPVbGFI2zKpD6KJfsM0d+gKysOL1cSxxCbbGw4fSggBJoAaOOZc6Zy76WFraC7bTeeBfYt5yV2AfDFudv8DrabVKtDEeVz9iZLm7M05q2ZeKKcqqGyb1k+5VuPRM3s2MB14VHoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405285; c=relaxed/simple;
	bh=/Yx7Os7KkYiDtpRC2idp2vJwtZfr6wt4Hi+pLlgqe2s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YU4PYcpmW50ML0lU7tzdlSAku0KU4l8LUjhUsRhi13xQayHFC6HCMa7C+uKBylrFptzfjNR5C1ntvtY+EpKMR/VfnpI53JZCB7bNODtx4KHwLKomDkDrYxBPaDvIc/7LYIMSZVvFpy1uzTvnRPgT+BYFhGcsr6UqH+ADSjt1B3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Ds9ykrDl; arc=fail smtp.client-ip=40.93.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Ds9ykrDl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3uSC/cpw25qhn6KCOmwe07ZHVp+wDeJckpdkmZbVdUwH8wJlDa7E/5EiZZgOPhR+g7bM/i76PKg8OMs8SSqTNv3S0eNsQqh2ciS29UqHn8RZflPGj+QIfB2n/xWxfvRIcLHZoe26sY4ENYN2jxItJyMDFluPkLcF63dDreCOEyKrMOU/GSGEMGlep7rX4zEHjz9C966WxcK+To7YC3m0rQlY90cJhHk/82lzRgSzJwx+go+zssESVHzbYApu2WtPIuSygQoev0G/5UXgznOW3Vh4TvfnbW5tnUh/5xBIDyo96wW/RKM0NNGN+lMi5FLPjovojAb3LgOKTizht2+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MorNBA9OFytyo59EJMC3oXslyh4NETslPXu1eu9W1Aw=;
 b=cAFsoyzXDtrzeKW3KmXYdIs0f9rR5Qy/EBxqA7sMY0MkKiRTjbU3xYR5r9XqF8SrWR8QAU9jC7WvaC2yOBQYRw7VJxKZxLnKnfM+h4rRLHmc2+LCzp7D9/Qdj1WbAfZ+DbYX2RGorQcXvs4gYvhyUMcnvQXZ/TC+TXehXwivTmSmTVrMFxeZXFrr0YM3PvW5fO15ZKTHi7jBKMQq5Skc1dYglv5O1g8wQgOU8LuLfHWGJCKdv3gPeBIHqXZXBuakj97oNR3wBaWOVEjncyTfkVfw13iPdnLjm7esMuGy/yid9ZmzirsNkC2ForMgPulJkSCNe3cnK8oeEEXj3goZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MorNBA9OFytyo59EJMC3oXslyh4NETslPXu1eu9W1Aw=;
 b=Ds9ykrDlEXZUooZaGWbh231H+f+P6NY104PROSJVdLCh6hrP6StB7pp3h0trE8XIJftg0woeVHm/+s+KUWr/NcCYv4Cd5nhEQRWnnhqhMk9WS9Sq3d/5qdeVuRKZxY0F0eK6E1764n1JARyWgjSguclxn/Ih2sGcASFOzhR6RHQU3SAZ3yIuaOnvb9HswtUjKe8PwjgA3S/WpawwutFt2DVnlHZnrYPtQwg+WzMNPqWjX8nO1cvOTDzDPIu6a3nFGptHGvHe84pDuSZR4/ectNyH3KMllyYdJPO57PV4ulWF2CUDVxfEZcKprwaocJ5nDj6uQY3XPRbcR/NRZG2t0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7502.namprd03.prod.outlook.com (2603:10b6:408:19c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 03:14:39 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:14:39 +0000
From: tze.yee.ng@altera.com
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: spi-nor: core: Fix use-after-free of spi_nor on unbind with open handles
Date: Thu,  3 Sep 2026 11:14:29 +0800
Message-ID: <91e1b12d15d18361f77e5cca934fd4b37a47805b.1788404586.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1788404586.git.tze.yee.ng@altera.com>
References: <cover.1788404586.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a90fa9-549f-4e61-1360-08df09697d7a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|18002099003|22082099003|55112099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	jVQ3kcPPgg9s9QMHAJwo/3nPUBD1lJDXBlxLMu0H+fNasWs5FZfIb5okMq5vFwG8haLnhqqHh8rtrwXWqZoufmWM519vnL1eOP+K7nrDvbItVboSmSoaBCbYoYnE1H3DTzFHEbzWvq9DyUZzafl6ZQmRazfktsvt3W1HzjXPH3EPDCLJnfRUJyXOysi6fqiVdtIVv7Med2hjGm56KuzjnxqOBUAQuT0j22aWzplT6dhbZcPlxEbYNtjSy94U4OEcC+i+7Ql06/4kYHb2YD/dltmXUCwgOsLmUNmy2wVsMw0VIbJTRniLiyKhhtbMIGnswG/xabtuudGEHQ6YtYIjjy7EucyIQKy4qTUxf4Hp81g/s5gmQbYMe5bWEDN5FqDik+i8x8voCd0ykZOT85qUnht3nSQt6jtMsOZG2j7gQWIkXGRGWWb6ClsmWMQYatWu0qJveuswOY73u5nz8QNzqlQm9++PVERihJJGjCp7TFBJw1QuqFplLYrEtRgN7Z4Lzmpv+NQAB6u8Dcms8L0DGmlaoKZXiWP0P3gmIkRCBl5ciGMEy9kMaovwiBSPw+viv1cpkkznMbuutj+cui+kvzzKWZ7wsbrwlIOPXug4Z7sWzN92bXXVNgtaja4rLBFQtrIt64DHi/xwwtzFc//A3HGnbOkmiDLP/D6ygzTgbto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(18002099003)(22082099003)(55112099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sdYUAq+1V95nbv9fmVSn1nQmiq1iULaDhxsoBBmXqtRFTV7IOOgdig4c08sq?=
 =?us-ascii?Q?wC0+lxtZecUxfz5zBwmI6RiPvMlgRtvWJirQ1AAiHyrzVf5RbG1Vx89aoBKj?=
 =?us-ascii?Q?jqSJEOnRm/iGIMzQSOb5obwe6l1R4GEGUp4XLJR194SnfiswRphEkPJhRi/W?=
 =?us-ascii?Q?zitjrMq1SXXyFw7GVLO+Ged4Dr9aHyF9tsNqGSReUNpjyf5ZyCkaCV68c1BG?=
 =?us-ascii?Q?VggmdOmAuQCuLknI+0WNGeYnMpNUcovcsn1ngvBXYhBIGpwMFr//Tr8LefH8?=
 =?us-ascii?Q?9GwSG8adXfXzVCc92T0prf5I/bO9xpHuBBW4PTGWNgqCWX04ADBgo3jThnGf?=
 =?us-ascii?Q?ELHD40Bp9J/ZM2QP4ro+tRvQUox9gpSBvdO1JHhJoHxXJnR2xK50vzzkGtMw?=
 =?us-ascii?Q?BAkL0sOqx9+E20mlLcfVt2r7R/hgkMW1Q6ay+e2L0n+PSMornYP9++7O66ow?=
 =?us-ascii?Q?/U8dtanl150P7KZZvagiLvIt4Hyts3DbJ2FnWm6wdynmmzCOQdL8ogri0lLb?=
 =?us-ascii?Q?TGz+dJ4+DBgqNDLs3+JG6zkpa1lbhWdj4+hYxjFlcfO8XHezSHyVBgpWOwK+?=
 =?us-ascii?Q?Ik78D4AyMF+tLfQIeynGJCu1ISy1WDu426uQO6Tcf+Un0/Y5l6f7TnqCioVU?=
 =?us-ascii?Q?naRnVrrfXea8qeqCcB/B6MjmMg7IHTif+pIU0EWNoNtiDj0ckYA8zX5lqWFh?=
 =?us-ascii?Q?LOWvy2AnzRDD2MwVqMqA958sqT2I4Ai4hxl1uiwqFuVp0fDzHcPNveqaCAm/?=
 =?us-ascii?Q?oBvdCNN+YgMHatzEB1v8td30Z90YN7+62cH7Z7nwi4o4JKyKhfkAYb0vmaPy?=
 =?us-ascii?Q?zrO+Pr7PhK/Ux1jlkKhvREQj0LrgyZpCj2vic4RPTBrt1wGiWhJjrETzxF0Q?=
 =?us-ascii?Q?0Pi4vZUDaA1Zw4yvYwCWuNU5QzerSRdLhhZoDGqNNwmPsY1AZEWHOlZS1gMQ?=
 =?us-ascii?Q?jm1ZS5SeFiNoSSI8OfFqFVDV+17scr5mIe5thPrhRXU/IAFGf24iT5gGmmuJ?=
 =?us-ascii?Q?locTlmduopxaVoUWIX/VW6aLRN7x+G2IVfAI3VpBgGf4T+cEcLf0xCTq8M3Y?=
 =?us-ascii?Q?DvaDArLk4lRh+wb6rc6olWVRHlFH5YLLgTJJVvt8XbXqGXFHFn4GJZ6M2qf8?=
 =?us-ascii?Q?Epnx7UOSB/8kobEhzlcbdM7kGMzY8uHeAHCA0Gldkwh8rxS5RUG+Cp4nrERf?=
 =?us-ascii?Q?r6Ro4MRSxjx0oaAClo7gYvV9Dj1+2Zm+f2jCcL+V0fuqlgKkOH/dMA5sa7yv?=
 =?us-ascii?Q?Z3b3WgWn0N1q2q/Cki0FMtoNTfCpj0Uccw7lNaCU8Evh28IUQguhhoA/SD+g?=
 =?us-ascii?Q?3M3KybXx+Z/QGsFp/wb+duY799z5VhNk7RVnElQIBnYTCHgEzz0wzgBzPczH?=
 =?us-ascii?Q?lPeqIapjS6nmvcALqh3L2SoA1d+p2exhSkiWFJj6lU1+1HhEElfLBOom18kv?=
 =?us-ascii?Q?4bdPgBg7tzbprFn01V15L5DxNm13fK7BKrnzQ0jy7UwOdtAmBUhC+IaKNpkR?=
 =?us-ascii?Q?GZhxU6xW5qwVC9DDVJ0p9AOtoHcz1dxByBrbtQXUoQe30SPn5TQNhA+g+ay2?=
 =?us-ascii?Q?c8ssFt4kUxOlAFKz39q7PKUTpjZKgQvtS9hxxM+KeL89utZNOX7zlpzkDnkE?=
 =?us-ascii?Q?lRl1NzSO2f29dktKAqR2rE9oKtD6cyaBYZJRb6V17647SPQeySiOfoDysn9J?=
 =?us-ascii?Q?VYpFjj41dOzGqbyl3TkpG6om5RtrlXoNdB01mwIuSgjKa6s4U/7SIme2Tlpe?=
 =?us-ascii?Q?DsT4aqtcTw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a90fa9-549f-4e61-1360-08df09697d7a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:14:39.4435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ra1L+89vLhSQ82zMQJrC5A0hnBPyTQ8Odw88SbqAEgfShYJbOWJ04O5xfTpjdpcyIEVgo5/8jcH9meH/WdjCPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7502

From: Tze Yee Ng <tze.yee.ng@altera.com>

The spi_nor is allocated with devm_kzalloc() on the SPI device, so a
sysfs unbind frees it while /dev/mtdX is still open. A later close then
oopses in spi_nor_put_device()->module_put() on the freed spi_nor.
try_module_get() does not help: it blocks rmmod, not an unbind.

Give the spi_nor (and its params and bouncebuf) a kref lifetime on the
spi-mem probe path so it survives until the last MTD user is gone, and
cache the controller module for the put path. The spimem and dirmaps
stay owned by the SPI core, so spi_nor_remove() drains in-flight
operations and sets nor->removed to fail later ones with -ENODEV.
Legacy controllers are unchanged.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/mtd/spi-nor/core.c  | 111 ++++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h |  17 ++++++
 2 files changed, 118 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46e02..7fb61dde58f5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -45,6 +45,9 @@
 #define SPI_NOR_SRST_SLEEP_MIN 200
 #define SPI_NOR_SRST_SLEEP_MAX 400
 
+static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len);
+static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len);
+
 /**
  * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
  *			   extension type.
@@ -1345,8 +1348,15 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 	else
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_exclusive(nor));
+	if (ret)
+		return ret;
 
-	return ret;
+	if (nor->removed) {
+		spi_nor_unlock_and_unprep(nor);
+		return -ENODEV;
+	}
+
+	return 0;
 }
 
 void spi_nor_unlock_and_unprep(struct spi_nor *nor)
@@ -1416,8 +1426,15 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 	else
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_pe(nor, start, len));
+	if (ret)
+		return ret;
 
-	return ret;
+	if (nor->removed) {
+		spi_nor_unlock_and_unprep_pe(nor, start, len);
+		return -ENODEV;
+	}
+
+	return 0;
 }
 
 static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len)
@@ -1489,8 +1506,15 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 	else
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_rd(nor, start, len));
+	if (ret)
+		return ret;
 
-	return ret;
+	if (nor->removed) {
+		spi_nor_unlock_and_unprep_rd(nor, start, len);
+		return -ENODEV;
+	}
+
+	return 0;
 }
 
 static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len)
@@ -3186,7 +3210,12 @@ static int spi_nor_init_params(struct spi_nor *nor)
 {
 	int ret;
 
-	nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL);
+	/* Keep params on the kref lifetime so it survives unbind (see probe). */
+	if (nor->refcounted)
+		nor->params = kzalloc(sizeof(*nor->params), GFP_KERNEL);
+	else
+		nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params),
+					   GFP_KERNEL);
 	if (!nor->params)
 		return -ENOMEM;
 
@@ -3420,6 +3449,22 @@ static void spi_nor_resume(struct mtd_info *mtd)
 		dev_err(dev, "resume() failed\n");
 }
 
+static void spi_nor_release(struct kref *kref)
+{
+	struct spi_nor *nor = container_of(kref, struct spi_nor, refcount);
+
+	kfree(nor->bouncebuf);
+	kfree(nor->params);
+	kfree(nor);
+}
+
+static void spi_nor_release_device(void *data)
+{
+	struct spi_nor *nor = data;
+
+	kref_put(&nor->refcount, spi_nor_release);
+}
+
 static int spi_nor_get_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
@@ -3434,6 +3479,12 @@ static int spi_nor_get_device(struct mtd_info *mtd)
 	if (!try_module_get(dev->driver->owner))
 		return -ENODEV;
 
+	if (nor->refcounted) {
+		/* Cache the module: the spimem/controller chain may be freed by put time. */
+		nor->controller_module = dev->driver->owner;
+		kref_get(&nor->refcount);
+	}
+
 	return 0;
 }
 
@@ -3443,6 +3494,14 @@ static void spi_nor_put_device(struct mtd_info *mtd)
 	struct spi_nor *nor = mtd_to_spi_nor(master);
 	struct device *dev;
 
+	if (nor->refcounted) {
+		module_put(nor->controller_module);
+
+		/* Must be last: this may free nor (and the embedded mtd). */
+		kref_put(&nor->refcount, spi_nor_release);
+		return;
+	}
+
 	if (nor->spimem)
 		dev = nor->spimem->spi->controller->dev.parent;
 	else
@@ -3655,8 +3714,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * than 1KB) after spi_nor_scan() returns.
 	 */
 	nor->bouncebuf_size = PAGE_SIZE;
-	nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
-				      GFP_KERNEL);
+	if (nor->refcounted)
+		nor->bouncebuf = kmalloc(nor->bouncebuf_size, GFP_KERNEL);
+	else
+		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
+					      GFP_KERNEL);
 	if (!nor->bouncebuf)
 		return -ENOMEM;
 
@@ -3788,10 +3850,21 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	if (ret)
 		return ret;
 
-	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
+	/*
+	 * An open /dev/mtdX handle can outlive unbind, so manage the spi_nor
+	 * with a kref and drop the probe-time reference from a devres callback.
+	 */
+	nor = kzalloc_obj(*nor, GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
 
+	kref_init(&nor->refcount);
+	nor->refcounted = true;
+
+	ret = devm_add_action_or_reset(dev, spi_nor_release_device, nor);
+	if (ret)
+		return ret;
+
 	nor->spimem = spimem;
 	nor->dev = dev;
 	spi_nor_set_flash_node(nor, dev->of_node);
@@ -3830,9 +3903,8 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	 */
 	if (nor->params->page_size > PAGE_SIZE) {
 		nor->bouncebuf_size = nor->params->page_size;
-		devm_kfree(dev, nor->bouncebuf);
-		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
-					      GFP_KERNEL);
+		kfree(nor->bouncebuf);
+		nor->bouncebuf = kmalloc(nor->bouncebuf_size, GFP_KERNEL);
 		if (!nor->bouncebuf)
 			return -ENOMEM;
 	}
@@ -3853,6 +3925,25 @@ static int spi_nor_remove(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
+	/*
+	 * Drain in-flight operations and set nor->removed under the lock so
+	 * later ones fail with -ENODEV before touching SPI-core state (spimem,
+	 * dirmaps) freed after this returns. The wait is uninterruptible.
+	 */
+	if (!spi_nor_use_parallel_locking(nor))
+		mutex_lock(&nor->lock);
+	else
+		wait_event(nor->rww.wait, spi_nor_rww_start_exclusive(nor));
+
+	nor->removed = true;
+
+	if (!spi_nor_use_parallel_locking(nor)) {
+		mutex_unlock(&nor->lock);
+	} else {
+		spi_nor_rww_end_exclusive(nor);
+		wake_up(&nor->rww.wait);
+	}
+
 	spi_nor_restore(nor);
 
 	/* Clean up MTD stuff. */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 4b92494827b1..f8d5e3ca8371 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -7,6 +7,7 @@
 #define __LINUX_MTD_SPI_NOR_H
 
 #include <linux/bitops.h>
+#include <linux/kref.h>
 #include <linux/mtd/mtd.h>
 #include <linux/spi/spi-mem.h>
 
@@ -352,6 +353,18 @@ struct spi_nor_flash_parameter;
  * @rww.used_banks:	bitmap of the banks in use
  * @dev:		pointer to an SPI device or an SPI NOR controller device
  * @spimem:		pointer to the SPI memory device
+ * @refcount:		reference count keeping the kzalloc()'d spi_nor alive
+ *			past driver unbind until the last MTD user releases the
+ *			device. Only valid when @refcounted is set.
+ * @controller_module:	controller module pinned in spi_nor_get_device() so
+ *			spi_nor_put_device() need not walk the possibly freed
+ *			spimem/controller chain. Only valid when @refcounted is
+ *			set.
+ * @refcounted:		true when the spi_nor lifetime is kref-managed (the
+ *			spi-mem spi_nor_probe() path). Legacy controllers that
+ *			embed or devres-allocate spi_nor leave this clear.
+ * @removed:		set on unbind to make subsequent MTD operations fail
+ *			with -ENODEV instead of touching released resources.
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
  * @bouncebuf_size:	size of the bounce buffer
@@ -393,6 +406,10 @@ struct spi_nor {
 	} rww;
 	struct device		*dev;
 	struct spi_mem		*spimem;
+	struct kref		refcount;
+	struct module		*controller_module;
+	bool			refcounted;
+	bool			removed;
 	u8			*bouncebuf;
 	size_t			bouncebuf_size;
 	u8			*id;
-- 
2.43.7

