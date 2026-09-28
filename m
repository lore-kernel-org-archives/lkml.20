Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021109.outbound.protection.outlook.com [40.107.51.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF7B4503EF;
	Mon, 28 Sep 2026 06:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577843; cv=fail; b=mjovASMo2xTK+hQzyIFT5dQJn4020nTYVaiYcNZMw7v2w9vUjbGTeQ6mNxN7dky6SsZ2yPlQOOXr9mWsDyNKAcVdUHTZs7xszMfRzzq+6HMV4QQCE2pL+J3O4/oTgtLBsgFyHyturu0PacxY1qGiqdxvlBnZMsV2yO4WNf4B0WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577843; c=relaxed/simple;
	bh=4h4C8W498SVZ91o5UXvrJ+OnASyYkBHq2UgM0wHu5qA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hyCI1IKTaJ3RgAXgk7kU5WtVvkaKGtSlohmIRtKxJSvAXo7qcHSxnFkfzmPryvBKo3bkhhPZlhZ7E5hJgWdgEaYGrbY07q4+f/OcKzVH692Ny/ZO3xoGrm7MDOderTjaCMGJfVtUgjwjBcp6WqrC6hKn02TwLGAfYkoanM2cCXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqpL3hoaXyYT9tGaico8o41Vyq6i+c8u2aRaxC7G0ghTpM+bP4jAGXFiOZ30fWbYQ1jGNs7X9E1LLgqwrgCsl2iNQiKYTwRF+ULwLE2RE0TtONcKer2zspfn0w3nS/0FVHyNvccT3IZ2MUVpDEJPKl1zKIA2FyTua7PHmS2r3lWMlSM4F+ddNzaGVuwT2lIuETI3x8+ifuTrAXe02eq8ElIH2hBttqdbp+07i94AMfVBZyMw3Dc0OvXjLf2zPg4TTq2Ma5myeYFv8KBUTvWHsZL73fwLW4oRodQAkQpkdZhnsw+4PlY8AQgdXGSNNnoRJ2pP/oP6FcPMB/aeXnjSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXW4KME4Si79nkjLmGsrhfI5rktl2cH3FDQ7E1vpYNY=;
 b=kUyFlNRbeFBkf0+kW+VlHPgI/nsR0nkGYz3XTvdHKg4NXKNUDmBmJ8p4R2acAZCR74JfCRUQEqkmbK4P0chyQAs21eo7+cR77gm1b9wJOOhliltUZQIk3KwkhI+WN+W+2H+dUhbnT077OV5gTWrbTAXVSenHTbz/thHUnZ6saFImyEweEA+Vb+g3WNgkumu3uFhW4ghRNGx76ZdLuV9WlvjzenAaq3H9CUdfF4pIVtyKEQE1Y3zLxktzsZo8HY6q225iuIjCDRfhvbRJTDto0pBe13431K2+Biw3Q/shEpERjxF6lx0SEvrdj8Vb646VOrT/KAgx2P01LWTfY8glZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN0P287MB0963.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 06:43:56 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 06:43:56 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v3 4/5] media: qcom: camss: Take the link frequency from the CSI-2 transmitter
Date: Mon, 28 Sep 2026 12:13:35 +0530
Message-ID: <20260928064336.272659-5-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928064336.272659-1-hitesh@ebytelogic.com>
References: <20260928064336.272659-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0048.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::19) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN0P287MB0963:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c6b9bf-a8eb-4ad0-343b-08df1d2bde57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|1800799024|376014|52116014|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1g2Mz0JwPghFO2f++IljwZUigqgsp7Jr1N0r5VI18fdhvSwYL4c7mlrt9l8Pe3XOzgim6J2P6UK+Ca4ATe3tnub10djDS3ke8CrinWU4qrl3aKUKWHGMaHfw0J18DvzaTK5pzimW0G7KmHOf8uHIPBvCFi+5pu3ramtKvmn9H0B7aS9LqAxxB/5edcLphAoBC9Y00ZwHNUzZ60rSbw8f4yKXKzEBum2vQq4Eq/GyUipb2shXJxbytmMk/eOQEY+PZgOAd9vLF3K8NaRTS6Z0xxAXxcpXNdlGSDjV+gefnaXOsfx02YIUo3JlmkemMpTxW6theTAO0RYqN4ctepXyExjcPUX4sDd5Lwx1lyxd1+NLLN+jDYxyOEQPjqFu7O/2XtuMJxR3e9ussQhzYIdd5098vO3/FXaMU8oUFzmBRt99H/Q1brSB5yXjxawCOByQlsFdJyKwF14mTi5parjzqL2DCy3FKGwH3hvbbG/3uEtHqjlcqu1ciRv7YTtD4eP55U9nVdbx9C+yMFC76vDHpvLW3gaWjfPECw3QMo7pHQjohMVZCp6t+HwTMBNgsaUCHlQYjHXiLPRtGJeGmsipgG6Fi+vHnPw9xmZgJSc8G7UcHW4oxdgZpGUeJ92pP1KDQKME1jP3fs15bmnaz836Kycwzi5Z4bDVf+EktWcOxQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(52116014)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hLg3kp3aux1OAr+M3kMs7gj7vfZ7+vj7evHIYUBDjwhkUuEyAKKsqEE+yIGu?=
 =?us-ascii?Q?XwBGHnjURIoTkT7jJ1IjgAvFFTdruEFpYxP77e01j9jNX0uLDOAtER4PDoLD?=
 =?us-ascii?Q?jSSGHUtOYzL52/Khb2woaxmSF5/HhiDkxBudfe51FnW+lWsI51IdBavbsidh?=
 =?us-ascii?Q?ktNuJKwey12D3ZG4FHAbVK5a9yRNtLYOQdceJyIVjGmg8BRBjsigbXwlvUM0?=
 =?us-ascii?Q?Ej5FYm+PBzdJLRZKT4ZSAGyTNICTlK8Xb2IXZfUnFRYS4PJCy9jByiV2y7NS?=
 =?us-ascii?Q?xzZUVYoV65N3CxbbMbEo39GJqlw6/7W+9ZlapPiIfb4vLU7yQTtbQu0T9O72?=
 =?us-ascii?Q?v7VPmfbsRCDItd8LoyoCMmcXE3tHWo/TLQusewiWgBRtDtmscex62YEzDfbM?=
 =?us-ascii?Q?IEqAmpH3dNqWkw6ueA3gXjm0nei1S816nEvxljwjZGEc4JppBlSI7kcYQXDp?=
 =?us-ascii?Q?pCuqvafIrx4ztXsIVPEMyDK++EVECJ1szBqEawGaW1ITHPOyETrTD5wxdm36?=
 =?us-ascii?Q?GGjOYNK1TOCI4FF2R5+qWbWaJcydPZE23xXySgOJWJqI9wj4yqKX5LpOnomA?=
 =?us-ascii?Q?3Dm92L3qWhwg85b7ibBwSRBoE2C/pC3bcRgXym/RbfOITnFAD08zDcRWt6c3?=
 =?us-ascii?Q?7QwZwcCKsTvhXtfInkqkd74Bp2CwlpDfg+pfZZmg7+alY3I+8tpfFxTnKUMO?=
 =?us-ascii?Q?nWGHxR3WaFhVYmhSGMRUdA5QLElH+HjHk1YzxzBS5GBZNO5PUZwSEN7X7Lws?=
 =?us-ascii?Q?AzCthbjiVhrQATHfsV+WHer2jmA7ReAYNu5OGsF4OofdEIPxO2Mv/qgK1Bdf?=
 =?us-ascii?Q?ZP07Jymkv7fuey8juW2JfKzCHrWixBqr2gjWLOP2s1JxRQIdqOaoYTxoilQX?=
 =?us-ascii?Q?TGg3OW7dAMreToqEfmM9zw6RLSdbzriYLP9tIJZ8hK/DAed9BurtpXyNfUGA?=
 =?us-ascii?Q?7UkTxqD6YMwPKAPEz5VbOiyxpwaPtJEoXx6EQ1PwXghUhAV0UluUgyn6W1KR?=
 =?us-ascii?Q?yuZVcWYiiKDZulbiOU5YB0QOXlXg2/2xWk8t5o8Ntw+fWGxRwvM7zgazVnUF?=
 =?us-ascii?Q?qSrbpX3trkRMs6kl5FeoHIm0Wvnb/J3DEY4vPGw78SLzYYpVUbMGkJhICUpB?=
 =?us-ascii?Q?FskdOAeBSuxwUKKMXVOB5+HPXCTpXO7It2P90ZbHInuXShz/TNJc4WHFGOAs?=
 =?us-ascii?Q?n1oDksOLeUQMWBWytCQ3pKTB76AM2rgSHelkbK2otZrJp1fzceslJj/zJs67?=
 =?us-ascii?Q?fCWtBpWDHJxA0t7RxprAotICj26SZbLLYtF8gRzaL6Uw7xwk7v1UXhfcHQgV?=
 =?us-ascii?Q?roZAAlkNEirc00XPVpdb2kgDZwN90vWxE8GWxID9RT1kusijtmm6bxgjRpqn?=
 =?us-ascii?Q?cxYHARv6RnwgBDAlSnWQUjTfeAjtT2NwMCW5zM1UaR/YhlWVdMuUdkMEkiq1?=
 =?us-ascii?Q?21DrH1x6HAhv6Gi2uyUAtMWkILNnc7gdKeqaApG4/XDMHLpQOzroUieDUg7i?=
 =?us-ascii?Q?HD9j5dcwuNy/qYeMbG3wOd5x5tXHXkl5bm9I9lszeMlZkiD25nCQeQNUA14e?=
 =?us-ascii?Q?7mx4ctd21Kss3D2dHTZBAoxjFsTzBIrKSPaIwMaZXIVLXMi3pi0urL5CAyJm?=
 =?us-ascii?Q?j416PFK4r/L7GZecCKyXg/54HE74ktMwmISGDS12ZkjO8jGW9jQ8Ac4WvfFB?=
 =?us-ascii?Q?vzci/PuqXc0yqaNqfDVfuG9SS3TGlNdI3pg5m873kX8nRclTQO/oZD17KpHZ?=
 =?us-ascii?Q?Z4wo+PKfWmEPtjQRIHuHQe0M7anUfjSyOpc8R9PfHt6pX9214IwynQCcUQl+?=
X-MS-Exchange-AntiSpam-MessageData-1: 2tbAUJBnSBZx8g==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c6b9bf-a8eb-4ad0-343b-08df1d2bde57
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 06:43:56.3128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jlyik3jgkLou6VemwoDS/+zRCkaV62JO5zFuHzT53fDRhvNjuGYM9Ig2MbaeOep4DQamc6dxSGN5/af/eqzLGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0963

camss_get_link_freq() walks the pipeline up to an entity with the
MEDIA_ENT_F_CAM_SENSOR function and reads the link frequency there.
The CSIPHY settle count and the CSID clock are then derived from it.

The frequency the receiver has to be programmed for is the one on the
CSI-2 bus, which belongs to whatever drives that bus. When the sensor
is wired straight to the CSIPHY that is the sensor, and the walk gives
the right answer. When a CSI-2 to CSI-2 bridge sits in between, such
as a GMSL or FPD-Link deserializer, the bridge re-times the data onto
its own output at its own rate: it may aggregate several sensors onto
one link, forward one sensor at a different rate, or generate a test
pattern with no sensor at all. The sensor's rate is then not what
arrives at the SoC, and the CSIPHY does not lock.

The walk can also fail before reaching a sensor. A deserializer has
one sink pad per serial link and the walk always follows pad 0; a
sensor attached to any other link is never found and streaming is
refused with "Cannot get CSI2 transmitter's link frequency".

Stop the walk at the first entity that is not a CAMSS receiver, i.e.
at the external subdev feeding the CSIPHY, and ask that pad with
v4l2_get_link_freq(). The helper queries the transmitter through
.get_mbus_config first and falls back to its V4L2_CID_LINK_FREQ and
V4L2_CID_PIXEL_RATE controls, so a bridge and a bare sensor are both
handled by the standard mechanism.

For a sensor connected directly to a CSIPHY the transmitter is the
sensor, so the pad found and the value returned do not change.
camss_find_sensor_pad() is kept for camss_get_pixel_clock() and the
frame skip query, which do want the sensor.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss.c | 70 +++++++++++++++++++++--
 1 file changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 23f3cc30a1..327ac7b280 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4619,24 +4619,82 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
 	}
 }
 
+/*
+ * camss_is_receiver_subdev - Test whether a subdev is a CAMSS CSI-2 receiver
+ * @camss: CAMSS device
+ * @sd: Subdevice to test
+ *
+ * Return true for a CSIPHY or CSID belonging to @camss, false for anything
+ * else, in particular for the external subdev transmitting to them.
+ */
+static bool camss_is_receiver_subdev(struct camss *camss,
+				     struct v4l2_subdev *sd)
+{
+	unsigned int i;
+
+	for (i = 0; i < camss->res->csiphy_num; i++)
+		if (sd == &camss->csiphy[i].subdev)
+			return true;
+
+	for (i = 0; i < camss->res->csid_num; i++)
+		if (sd == &camss->csid[i].subdev)
+			return true;
+
+	return false;
+}
+
+/*
+ * camss_find_transmitter_pad - Find the pad of the CSI-2 transmitter
+ * @entity: Media entity in the current pipeline
+ *
+ * Walk the pipeline upstream through the CAMSS receiver subdevs and return the
+ * source pad of the first entity that is not one of them: the CSI-2
+ * transmitter driving the SoC.
+ *
+ * Return a pointer to the transmitter media pad or NULL if not found
+ */
+static struct media_pad *camss_find_transmitter_pad(struct media_entity *entity)
+{
+	struct camss *camss = container_of(entity->graph_obj.mdev,
+					   struct camss, media_dev);
+	struct v4l2_subdev *sd;
+	struct media_pad *pad;
+
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			return NULL;
+
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			return NULL;
+
+		entity = pad->entity;
+		sd = media_entity_to_v4l2_subdev(entity);
+
+		if (!camss_is_receiver_subdev(camss, sd))
+			return pad;
+	}
+}
+
 /**
- * camss_get_link_freq - Get link frequency from sensor
+ * camss_get_link_freq - Get link frequency from the CSI-2 transmitter
  * @entity: Media entity in the current pipeline
  * @bpp: Number of bits per pixel for the current format
- * @lanes: Number of lanes in the link to the sensor
+ * @lanes: Number of lanes in the link to the transmitter
  *
  * Return link frequency on success or a negative error code otherwise
  */
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 			unsigned int lanes)
 {
-	struct media_pad *sensor_pad;
+	struct media_pad *tx_pad;
 
-	sensor_pad = camss_find_sensor_pad(entity);
-	if (!sensor_pad)
+	tx_pad = camss_find_transmitter_pad(entity);
+	if (!tx_pad)
 		return -ENODEV;
 
-	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
+	return v4l2_get_link_freq(tx_pad, bpp, 2 * lanes);
 }
 
 /*
-- 
2.43.0

