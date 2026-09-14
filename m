Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020092.outbound.protection.outlook.com [52.101.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCC3470E8B;
	Mon, 14 Sep 2026 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392879; cv=fail; b=hFmoDpq41aAVr0omjdIk1p4XlGMHxbPSTCdj5GunXRjTaEtGqnA64AhhGKE9YPoh/M/nn/UNVN93hXD3eFrWF92pg4NoRerLvHBupCZ40lGEGw5M0BeGHoMaDQDI+6fbkYtNQDAobdrC+TWsiUydMc/mw/n+qiCbtUYCLQZYwnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392879; c=relaxed/simple;
	bh=Qr71f091SwxMYgvjElRq6JammAMajrRZIhp79sEp8Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JyQvlt1WRzi2twOPE1emG/FpiTIdtcAdvU11S3W3zmnsHlJqe9YbgBFcJEI967DPHZl+ndQrpPr3L01w5mIh18JkBo+SgFggNSrFrnavxnlnqD9b1buTSZzDRklGpFX8tk07LzlAcg9uEp4GjWc1aHTUD6Eh9EPHTkV+ZgilFHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMT5u746QCvmf4bTd1lqL+ziCpL7CA1v+1UYLp4MI7Z+TGqJuhw5s+f5P/MWzmcVlJoWn4oj83vM2++joYCosS9UETtvJNQQoS6hqEMBXeqmdgOx1c2E1tS+G1siBMeG1+ytDDfvTSnr80cjnUR2YgMqT6m6bwGUEgHYkZCkDshUl9SXVCX3qbtQHefcupuQRkCqItFVsrC9rbgSdZq1PTdAh2j98e0adUjFsphaPQNvBBYymCkpo6pJp9GGC1dRw9CG8uym9+qtGSiLLu4nnQjlV90oSD7PnfHbhghAv0TV03Yiz50/OOHfmonnRntw9bAIo0by+o3Mf24KrzTXJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvLOTocoDucB1qFfOBBinAedd45w+eiWtQHbojCyKvc=;
 b=vBKc4W8d2nQzkYerci/1abjzm5UK3u7/oVtqiwc811DcsidF/PwYhLoeRMOQpi5E/4oVX8sr+0zHhinuntlfShIEaHBrZHgoyTxgneJFmi3iK5lN4a6Ywx0y9eeIrmoG1A6qJdno0B1hxIQyNrSjckOeEoeDVZoPiVaRyyFGo7J3pjEsqsdxz3QgkGF9ZYrK0wNTIB3Lb5tTsH5plc0PdsSqlnCFVt+CVKKHhU/oMLRxMENQqxIeIqZUIm6VJFFQX1DmfOnB2hpJuwr/JFWSx1czuwMVche007VxEvhJX/plwaI184mBtI4O7Rcih1B8zFc45HXwj8MEy2d0QXJe4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN2P287MB1360.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:127::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:34:35 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:34:35 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH 2/8] media: qcom: camss: create the source to CSIPHY link per endpoint
Date: Mon, 14 Sep 2026 19:04:10 +0530
Message-ID: <20260914133416.1030231-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914133416.1030231-1-hitesh@ebytelogic.com>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:262::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN2P287MB1360:EE_
X-MS-Office365-Filtering-Correlation-Id: d20e5760-108d-4994-1eb0-08df1264ead4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|10070799003|23010399003|1800799024|366016|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8xt2IT3BsJEvdl14Zf/7U68FmilYsAO8nuZJEP40hIsAeDjNST7nNWV7/3tc/RsVkflkFgygpkU5X+N7SQcDgQ157nsS+K+tTtXNPkSR1IrAKDFmbE3BLAY9hDC1j7YeQwZHCLnT47WKyO1pImjTwOW7BIgL9Om5viNpapfCIaHrPtSTqGzWDNxug3umCxsdZb4WcY2xrZ2ztr+PCvt5P/jBgdzrdpUsoOK+wS/ZAQ2dut/hpmgMQD6WHGLJif4OISYrAwDceAGuI6Vya5va6L31JvzT8lOIW3edpxZcsEEBB5/6R90zzOE6+S2Cm1dsUoOkQMaDEXmyhXX7JmMy+Y+O41SXcLDDG+/d/dgIvDdsaz5nkcaTu6dqOTSbBVHyVxfpWArAUBz4K89MSGnxA9wMCu9FINCeZKolzlNqH9YkeurbJDhP8xLwDdCU4u1CEk6bwaWvFD4qY8ldYOgOeJpJZLW5PVVyvgKVL8BnPlr6faY1cdsLC4c9QGGXavd0VfcwTKfYVRvoEvznOPl2m9heXJP7UJcXPhOYW4L2uMylCdKFqtSH7CzUJqgBwldnPLfxwJzsDogScyxwAY3IzNW6dKrDh2kcRKZ901SFbcqxKmZ4SygVa4Nq/my2NqCkYK+VgKBWskjVuLz8F7GKV/1oWIn1qFO4vYF81R4Eck0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(23010399003)(1800799024)(366016)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FHEQiqbYpG03whOyD2gj2du6S3lvF7IJ7qfnZpTX6VFGSm9prGQ833lZ5SDj?=
 =?us-ascii?Q?7MUrtkecA/vGWxbO3lwyUbPLeQqcJIkwoPRpBZbP3597naH4HCYHczU2rruC?=
 =?us-ascii?Q?6l6SefAJbYsv835njJov4avmpyTd/ooX5nRp7ISuJbkRijhGL++Zxawt/wM/?=
 =?us-ascii?Q?vGrYhzVwowxbcSuVJ3JnEYko7jR2jpgkFGI6uQZfVS9pRWKO9IoF7kHYwjSX?=
 =?us-ascii?Q?IaIlqOLKatbZqLxdjHfVvegSxHF+pcjw/tShtYk9o1s56CAGi21jUIlt3Z7Y?=
 =?us-ascii?Q?DVdZQS8G+1tVhbw+TYjD/6L1c6uirS3mBiizgBvmApKs8oWN3s+umZNtgOpd?=
 =?us-ascii?Q?QdwBRxpnus0qI6TBfemkTFgZj2nbmYR/ooPdy6ombVveLMBUmbGtMY1CkvJ0?=
 =?us-ascii?Q?RXmUGOPiZo6LQAlFJW7NOMgn8TcHw4Mdz6aFaJiAL9mdw1fqhs41CdWZFq67?=
 =?us-ascii?Q?66dUYR6t4/Q4XbJrGeRCin4e9gpCsEsXlTCbPR+V/OES9v/faXhRlZ2Fp9Gx?=
 =?us-ascii?Q?4nbfsn1xK/HpYEQbSrBXKDxmgDFkNhb7LiP8jApitzuuqDOZ5uw3HxEQctEp?=
 =?us-ascii?Q?dAy7ap26k0BiUga72pjPO889BXBw03gydqiZIgKm6Pmusgoj/Nt4bbY35bsH?=
 =?us-ascii?Q?FxIELsDD3+ADoM7/Mftm+c7grCr22W2EHc50XpAaw/Qy3ZF8BnV9/Zeu8zmA?=
 =?us-ascii?Q?8milo/6exjzxNkJ9+57V+gSKhlxcVw4I9e/naFn78PZuWvPx4wlpo5qjb1Nk?=
 =?us-ascii?Q?aPDblbnNYLBZBtbBwZ84+LrxN6sWUWkDtU9oUnRmLclqN03Csw2QPQhBgayX?=
 =?us-ascii?Q?vq6Wh+GAk63EnaRTjUdeI7XRe112KA+BPaHFb3niGV0rpecHJBwTzv26/iHY?=
 =?us-ascii?Q?Of9O+zsIxpx2vahmVA6g4NeHGgkwidDDbL3rjJcDJMOTp2nieOBTZNYkO30n?=
 =?us-ascii?Q?EytEBsg7+BtVJhurGTckhR+VDUyyCtlg3kkLXG3RntYbcNlvj0aXqZio+95a?=
 =?us-ascii?Q?jxUv7TyhYHJKP/pvSD4CSYLnOA8wysKrT3ONyrn127/wy9u+llDMGoEJUlxr?=
 =?us-ascii?Q?UworlF+u9DYBKXeFSRXfIbDLEQMtNOmX9GyZf13nQbwXMhyr5Dk8h1D6KJwn?=
 =?us-ascii?Q?dhxVvx1k1M+m0ahh9sQFqar48OemBZiA4LNBjXgnwuUq7DTa+emKneCgamvR?=
 =?us-ascii?Q?0tv0XWirKPmiJTR1Q6OyX346x0fC2k0pTuA6ZpsZfgF+7MO95VTMi/HMNeMi?=
 =?us-ascii?Q?+eAoACpyKli8/5W/v+URk/3OluK6K4nrrsEkVQmsNXnM3h6byJD6yRgIFMkO?=
 =?us-ascii?Q?6m5UfExTDLTveKKEAEXYAk0e6+u+38IOO6u45rr6R8k5eqax6EWycEW/nTBZ?=
 =?us-ascii?Q?9rD9VC7s3cUUBJsR1cLL8c+H3Xy2zMhSUlZxiaTJjX1jvr3YU0Hvl0copWA2?=
 =?us-ascii?Q?EGNfBO51HUApAjInR3X0n6S1wrZCDWVVqq+NYgXkk5UC09Avw7+GBvpGNXC9?=
 =?us-ascii?Q?p+KYdFqSFG3Pw1lccDC2EUTZPtvbAVLUHilRgd/UcB1O/NXQoF4OfE+wCubx?=
 =?us-ascii?Q?8ODJdqodnaGnMqFwsxf4B7gnwsGj7DGBiSZnEkEWOSXOtpdoftqT4M6tsMJU?=
 =?us-ascii?Q?77I+pauJy/+wU7WGi6keKUAfTcfYWetX3B1GXja1/9XcMGW9HbKgxnLtWDgs?=
 =?us-ascii?Q?Ibac8tluFPXJoPtM8NNMkeizLFnx93U/cyNfyKRe2gWLUfx+6qzly7LmNCrJ?=
 =?us-ascii?Q?E49na3Ins66alP25SFbTduOtwp5lt1YRQgfKLH23HRS9LflMwewT6vU1wxwF?=
X-MS-Exchange-AntiSpam-MessageData-1: NBv7wpDHdmiuAg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d20e5760-108d-4994-1eb0-08df1264ead4
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:34:35.7002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNiOSWJFdtyEfQyO+1M+cfpIbmpLKlzKAbz78ZuCbnG75VIufomMmvQIndlYl6cogjSDviYzOjZ68TFp4vJNJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1360

The link from the external CSI-2 transmitter to the CSIPHY is created
in the notifier .complete() callback by walking every registered
subdev, reading the CSIPHY it was bound to from sd->host_priv and
linking the subdev's first source pad to that CSIPHY.

This assumes one transmitter feeds exactly one CSIPHY. A GMSL
deserializer such as the MAX9296A has two independent CSI-2 output
ports which, on the RB3 Gen2 vision mezzanine, are wired to two
different SoC CSIPHYs. The same subdev is then bound once per CAMSS
port endpoint, the second .bound() overwrites host_priv, and
.complete() creates a single link from source pad 0 to the last
CSIPHY. The second output port is left with no link at all, so a
second camera can never be routed to the SoC.

Move the link creation into .bound(), where both the endpoint and
the CSIPHY are known, and resolve the transmitter's source pad from
the endpoint fwnode with media_entity_get_fwnode_pad(). Each
endpoint then gets its own link between the right source pad and
the right CSIPHY.

For a subdev that does not implement .get_fwnode_pad,
media_entity_get_fwnode_pad() falls back to the first pad matching
the requested direction, which is exactly what the .complete() loop
did, so ordinary single-output sensors keep the same link as before.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss.c | 51 ++++++++---------------
 1 file changed, 18 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 16ad1c26c..4cf736d80 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5231,49 +5231,34 @@ static int camss_subdev_notifier_bound(struct v4l2_async_notifier *async,
 		container_of(asd, struct camss_async_subdev, asd);
 	u8 id = csd->interface.csiphy_id;
 	struct csiphy_device *csiphy = &camss->csiphy[id];
+	struct media_entity *input = &csiphy->subdev.entity;
+	struct media_entity *sensor = &subdev->entity;
+	int pad, ret;
 
 	csiphy->cfg.csi2 = &csd->interface.csi2;
 	subdev->host_priv = csiphy;
 
+	pad = media_entity_get_fwnode_pad(sensor, asd->match.fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (pad < 0) {
+		dev_err(camss->dev, "No source pad in external entity %s: %d\n",
+			sensor->name, pad);
+		return pad;
+	}
+
+	ret = media_create_pad_link(sensor, pad, input, MSM_CSIPHY_PAD_SINK,
+				    MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+	if (ret < 0) {
+		camss_link_err(camss, sensor->name, input->name, ret);
+		return ret;
+	}
+
 	return 0;
 }
 
 static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
 {
 	struct camss *camss = container_of(async, struct camss, notifier);
-	struct v4l2_device *v4l2_dev = &camss->v4l2_dev;
-	struct v4l2_subdev *sd;
-
-	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
-		struct csiphy_device *csiphy = sd->host_priv;
-		struct media_entity *input, *sensor;
-		unsigned int i;
-		int ret;
-
-		if (!csiphy)
-			continue;
-
-		input = &csiphy->subdev.entity;
-		sensor = &sd->entity;
-
-		for (i = 0; i < sensor->num_pads; i++) {
-			if (sensor->pads[i].flags & MEDIA_PAD_FL_SOURCE)
-				break;
-		}
-		if (i == sensor->num_pads) {
-			dev_err(camss->dev,
-				"No source pad in external entity\n");
-			return -EINVAL;
-		}
-
-		ret = media_create_pad_link(sensor, i, input,
-					    MSM_CSIPHY_PAD_SINK,
-					    MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
-		if (ret < 0) {
-			camss_link_err(camss, sensor->name, input->name, ret);
-			return ret;
-		}
-	}
 
 	return v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
 }
-- 
2.43.0

