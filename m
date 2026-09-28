Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021105.outbound.protection.outlook.com [40.107.51.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B701C49AA22;
	Mon, 28 Sep 2026 10:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590985; cv=fail; b=m6GxoyQP0mSjRRV794xLbmPqp3fa6U4ItMABRD9wHpjGbYq2SX88yYkZVO7wXwga30Hg2/v+itE5nnPKAvnafGcm+HNOvB9Xh9TnXpB8XZ1fy3SwJ1x3e75ctIUFjY23NN/J9qTBfWVeQ5t7VX9HIxS4nMQx3lS4Vj7M5EmPNAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590985; c=relaxed/simple;
	bh=s5RJfnVijL7NATKK59Dk0qP0QAwTnfK75THPXI8OEps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sxd0dXhhdMB9bXPvsvb+SigP4MWcWtHeLdz9QhQs9jZ0mAU7/WT0TwceGmYqv7U8PCYbfmNjqUaVaGf151sHwsHj8EuDegjAj6DIEbl1t4IFdn7VQELPqpdFMip+O4SagNiGP3JdWuJEUitWPYGo/8n7eyLhqayZ/Oje0pE7vPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKZ+Xuk276bz48Y+BWAWP7/Afl4hx4Wh+ySJnJrZmFtzBGdluuQGeE9xe8d9jJzfoeg5yqjJtaeDWjV4q3QZ3sPypTXr1lXtUqq98uzlQTx1nvT3fPN2c8Zw5q6TmQrUZsTYcr5V15eytzZ10N1BcfbnmFRPvZN1x7JHdrlW7Q9yzwp7w3pVEU+PMi+xSgMPs/39gaRX5IQwXsWxUgMSQXxy1LVcDVSnyV2VPXppkXULiJ4IdXOoBdfE9YnGlYfriCK5634eYh41NwFiJ/ICJhBUxSigqoGuNNOAqBBNQfOx6+u2GmOJE5VF4MbGTqvJGZVxD8THLZYheF4XE6NP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZk52hNgETBIzbjMYjTHS22xdRTb072cI9SprWlxAqk=;
 b=oKJLTbVk2bReBiZo9TMtZtl/oxj3CJ/9g+A4rdN7zobKF1ZPe9Gwu0rQVGsBIhpj9PLBbuOgMz4C9qqJqYL4oaxBoD9MwNZ782Zmt+1jBij0UIRfKnKCVVKQiEstX3cs0cgh1kDXz99tsJ6XSyGzBkl5nhT6/n4NA28lksZFjDT6nFu+9tiOxZHtBtbbEHosthEb9oTb9P+IpGXirejJ7zWggKmy33wEJTF6x7vK4Kr6wL0MHPFAe+N6gTz4NqdOBRzakkhWvulYPClAyiIhc5u+vnNzeYQ3XZY3JyHkUfVW7yx+8iOFlx/CI2RMGgPbkMoQ4FnsKCqTmxL+e019sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB6171.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:226::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 10:22:59 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 10:22:59 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v4 4/5] media: qcom: camss: Take the link frequency from the CSI-2 transmitter
Date: Mon, 28 Sep 2026 15:52:36 +0530
Message-ID: <20260928102237.533341-5-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928102237.533341-1-hitesh@ebytelogic.com>
References: <20260928102237.533341-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0060.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::6) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: c87e94c8-972b-4f82-d448-08df1d4a787a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|10070799003|23010399003|1800799024|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CcfSYepuAap3KHLAdlkA2AOe+ULY+OFURIf7wSo8Mh7nWUOPUjks6X18tq2xlYj78jk7VjqXB8o2ub3wsPJ2oGcYcIZqlAIG6k4kh3ePqygU0VcheahVX1iPl+g6Hii+bEkEETCy3UwEV2rjmj+INaPKuKEDeegOEhAKXhG+wGSOhmASi+WipPAiOoV7LcQIW78+cVxovBV6OJGZYaiV83uqch+j3zw0R3EqZBNTID1phJ6jIeZRLTSZqF3u1Pae+AGJ2BkOlNmkt/5LSyK3nIUU8BKdyfiXJaQr4rkl90ADthxEoVMzB4DBP9IPe77kLDFWzg+OlxJPi6mKOq7FM23WgenBB7eMdtd9xeb/7gQiFiy0WMz8jRLEOZyr6J6dC+aU78rBRxpF7+rlR8l/tx4DcFQ5pLOW3G/vLRSB8zGpADAo2SX+5PYjRIk4ZaC8OMS0D4DYfrp5RGucgzTjGZnth77FM0LmiGM9fHh3fh9PB0pqIlhaczkpKAasMTFSKGFGWSSNy/ykIcESnNzhCistdEzFsDgWJvx7Cm7OuOnM42jRUij0PFApQrGKNBbT2KkhrKj3Veb+ANXtgUDkd8jiDTfGLBEFCObZt6DEnzrZz+/YzJ2anIgeDv8Xv49UO+j6u1zN/EWEBJHsjq/nvgDhlrg5Ju29a7VbvDXr35k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(10070799003)(23010399003)(1800799024)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gNTrivYREP5zG6VsU3xvKJE1H90tofK8jvGnTk4DjrwUwSm8ivbSiT78tDwS?=
 =?us-ascii?Q?d4AoDL9dDwX7IlTwzjnXdY8nejVNYAv5hqKnvFIIjf7Un5K578oq8NCf8Qkf?=
 =?us-ascii?Q?EVB5ocnvao3MQUBepFGCdkgNUMDrPf/IgGzaEFvLLzhITj2o0nuYVC80dxO0?=
 =?us-ascii?Q?pq2REcndRxfXgCm9ErCRBy41YyZDdypP/fbKKI9ceIC1Mq6YcSz2akzwwTz8?=
 =?us-ascii?Q?Onucsm2o2QB99yPlug7V7ph10S0HFXE4zGwynE3wJbr/GYybhYsPqcRRGqvq?=
 =?us-ascii?Q?LULY5Y7moSRoMu62wUuSGvNxI1NlrfNUG11VPDnxJwytsFfKU7pGzQYc2G3P?=
 =?us-ascii?Q?wXzVOACn8hdMEc5r1qSHYEXYaUoqYNew9PcNdJufWuTgoiCe+UhIHUbkuvBz?=
 =?us-ascii?Q?gjoYCxW/pfsd/NOt2Zw4hX2SAAaSd/zftx2Z1/IyFY9aaK00sMPYYBq9OaZg?=
 =?us-ascii?Q?9ohOtJ1lAy/yYLMSq6tGku2nsSNAoiUVyoURbjAAGZhc3xsBhVUUNt930/ml?=
 =?us-ascii?Q?sVkBIAUL/62KoEZP5XapTDgsQeKcmoLx2keAUUO1zH93UBzvCYqN+H7j9STh?=
 =?us-ascii?Q?m1waoVaHjVAb/IoDA7GZGwqrbvzlerVR/odrpML3Q1d+JQ/z0qOd/EHlrbVQ?=
 =?us-ascii?Q?sHGI/GPjHsfVc7h4Iu4d8LblTR3WxGmiiq0MD93GpjmtWCntTupgiOBEd4Xd?=
 =?us-ascii?Q?1dhGiohdb8VRwsaZ6krsse46pYNcyLrNz/DZ/h59W8cCJLzpUNfFsv8aY/Of?=
 =?us-ascii?Q?mlXqKQz3eTVLLeebiKMRyGUi/O5srtpwTRt2E7X7LJVFYg9LF1/Ji29w1UiX?=
 =?us-ascii?Q?bVjlHAGERpqdw4kf9iI7HqvPIjCO1Himwrd4u60LlyV8wHSDU6NbrrWwIMBK?=
 =?us-ascii?Q?eGwk3r50WpHMd+fb1OVDM8zWoOyjhrJSv7EfxZrxHg/TSTpEFMR/9M/3Xiqw?=
 =?us-ascii?Q?0QBg/jy0zj/BVsY+k9WwiFraUlteydGWz9H9YOkZij9EY2qDHT8S3SJ9bKVF?=
 =?us-ascii?Q?PWiGlk049ezWfKQE9K+JHSqQlp4jqUdT5JdQIjxs4Q22ywIC5j4wQ6H78FMj?=
 =?us-ascii?Q?uHy/tTJ37po3UNnNVSqRUddfmJZMXHA2gBPAaOn6I6ght+RHn4hh85Y7RNzg?=
 =?us-ascii?Q?+c30WawhGriDyBrGwZDdIebeweWTMpwuXwVpHEATLbWNYA0T9MbIIFweYVnw?=
 =?us-ascii?Q?xgjmf7RufNwIxGGvte4wyiQGerrDHZlL8QAnL/wPfEjl8WYoL0PnJNDM5ufp?=
 =?us-ascii?Q?mpeoA+q3urhO3Uo95lLS1EFlW+/Gw/Af2AesRc3pmp3OjdW+F4NgKEBwoXyu?=
 =?us-ascii?Q?I3nwPq/j2CMxhkQaA4G2Ky0MrAtN2CdMDvXoT3+xZlslm0ZLW66TWBAK67OF?=
 =?us-ascii?Q?v3tjA5om1ohJW0PWtQVlvJw0jtlUiqjRp9q2G6zy/udZbwveddIp/0T7ZQsm?=
 =?us-ascii?Q?6O5KJPXcQEdn75XoRbjauTEWfaBw+UjzGHdXhUDYUVrrh/Z5iLDoIY+Olvww?=
 =?us-ascii?Q?WBv9w9f+RydjGvTV0WTMeB+88ASP7lSVmrcAIJoxfIM0hzvylwggx7ufdFDo?=
 =?us-ascii?Q?KnZ3MkEovV1/Cys7NeX6E7uKAXkwqKKbai3vITAwok+Y3E5GSNx5ZdZRkIiC?=
 =?us-ascii?Q?D24Z3HkFQz8w+DZjX9G/N3EaCwpWYDIrsfoD1pnKvZMVefIq9pwI3RFSCCBS?=
 =?us-ascii?Q?ALdcgN7A2My7B8p1duFfeLv++QjQ8+6HJ/5sllSTjO99I0izTxX/a+ca57hG?=
 =?us-ascii?Q?5VCiB6tVpL52gBCif+NDzenJddwRktkRRLlv3rSzP4y9uurAQdKf7EgIDzBz?=
X-MS-Exchange-AntiSpam-MessageData-1: vO0rgEMw9yJYxA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87e94c8-972b-4f82-d448-08df1d4a787a
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:22:59.7235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MU4ThzlyKNXxnAzftQCZE4/EPumsK+Klsa4OgcyE07v7EzMzlSVl0zm69Xq9Z2JuW4nYuUdxCLyaHKco2maMaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB6171

camss_find_sensor_pad() walks the pipeline up to an entity with the
MEDIA_ENT_F_CAM_SENSOR function, and camss_get_link_freq() reads the
link frequency there. The CSIPHY settle count and the CSID clock are
then derived from it.

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

Replace the helper with camss_find_transmitter_pad(), which stops at
the first entity that is not a CAMSS receiver, i.e. at the external
subdev feeding the CSIPHY, and ask that pad with v4l2_get_link_freq().
The helper queries the transmitter through .get_mbus_config first and
falls back to its V4L2_CID_LINK_FREQ and V4L2_CID_PIXEL_RATE controls,
so a bridge and a bare sensor are both handled by the standard
mechanism.

For a sensor connected directly to a CSIPHY the transmitter is the
sensor, so the pad found and the values returned do not change
anywhere. Only a bridge setup sees a difference, and there the two
other users of the old helper now describe the hardware better as
well:

 - camss_get_pixel_clock() reads V4L2_CID_PIXEL_RATE, which for the
   same reason as the link frequency belongs to the device driving the
   bus.
 - the g_skip_frames query in vfe_enable_output_v2() and its gen1
   counterpart is a sensor operation. A bridge does not implement it,
   so the call fails and frame_skip stays 0, which is what already
   happens today whenever the walk cannot reach a sensor.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 .../platform/qcom/camss/camss-vfe-gen1.c      |  8 +--
 drivers/media/platform/qcom/camss/camss-vfe.c |  8 +--
 drivers/media/platform/qcom/camss/camss.c     | 64 ++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.h     |  2 +-
 4 files changed, 57 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
index d84a375e33..8827b51694 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
@@ -170,7 +170,7 @@ static int vfe_enable_output(struct vfe_line *line)
 	struct vfe_device *vfe = to_vfe(line);
 	struct vfe_output *output = &line->output;
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
-	struct media_pad *sensor_pad;
+	struct media_pad *tx_pad;
 	unsigned long flags;
 	unsigned int frame_skip = 0;
 	unsigned int i;
@@ -180,10 +180,10 @@ static int vfe_enable_output(struct vfe_line *line)
 	if (!ub_size)
 		return -EINVAL;
 
-	sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
-	if (sensor_pad) {
+	tx_pad = camss_find_transmitter_pad(&line->subdev.entity);
+	if (tx_pad) {
 		struct v4l2_subdev *subdev =
-			media_entity_to_v4l2_subdev(sensor_pad->entity);
+			media_entity_to_v4l2_subdev(tx_pad->entity);
 
 		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
 		/* Max frame skip is 29 frames */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index d20cd4dfb9..a2ff6ae503 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -507,15 +507,15 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	struct vfe_device *vfe = to_vfe(line);
 	struct vfe_output *output = &line->output;
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
-	struct media_pad *sensor_pad;
+	struct media_pad *tx_pad;
 	unsigned long flags;
 	unsigned int frame_skip = 0;
 	unsigned int i;
 
-	sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
-	if (sensor_pad) {
+	tx_pad = camss_find_transmitter_pad(&line->subdev.entity);
+	if (tx_pad) {
 		struct v4l2_subdev *subdev =
-			media_entity_to_v4l2_subdev(sensor_pad->entity);
+			media_entity_to_v4l2_subdev(tx_pad->entity);
 
 		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
 		/* Max frame skip is 29 frames */
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 23f3cc30a1..42d8654fd0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4594,13 +4594,44 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock)
 }
 
 /*
- * camss_find_sensor_pad - Find the media pad via which the sensor is linked
- * @entity: Media entity to start searching from
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
  *
- * Return a pointer to sensor media pad or NULL if not found
+ * Walk the pipeline upstream through the CAMSS receiver subdevs and return the
+ * source pad of the first entity that is not one of them: the CSI-2
+ * transmitter driving the SoC.
+ *
+ * Return a pointer to the transmitter media pad or NULL if not found
  */
-struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
+struct media_pad *camss_find_transmitter_pad(struct media_entity *entity)
 {
+	struct camss *camss = container_of(entity->graph_obj.mdev,
+					   struct camss, media_dev);
+	struct v4l2_subdev *sd;
 	struct media_pad *pad;
 
 	while (1) {
@@ -4613,34 +4644,35 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
 			return NULL;
 
 		entity = pad->entity;
+		sd = media_entity_to_v4l2_subdev(entity);
 
-		if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
+		if (!camss_is_receiver_subdev(camss, sd))
 			return pad;
 	}
 }
 
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
- * camss_get_pixel_clock - Get pixel clock rate from sensor
+ * camss_get_pixel_clock - Get pixel clock rate from the CSI-2 transmitter
  * @entity: Media entity in the current pipeline
  * @pixel_clock: Received pixel clock value
  *
@@ -4648,15 +4680,15 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
  */
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
 {
-	struct media_pad *sensor_pad;
+	struct media_pad *tx_pad;
 	struct v4l2_subdev *subdev;
 	struct v4l2_ctrl *ctrl;
 
-	sensor_pad = camss_find_sensor_pad(entity);
-	if (!sensor_pad)
+	tx_pad = camss_find_transmitter_pad(entity);
+	if (!tx_pad)
 		return -ENODEV;
 
-	subdev = media_entity_to_v4l2_subdev(sensor_pad->entity);
+	subdev = media_entity_to_v4l2_subdev(tx_pad->entity);
 
 	ctrl = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac..1560ad0dc5 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -167,7 +167,7 @@ void camss_add_clock_margin(u64 *rate);
 int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 			struct device *dev);
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
-struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
+struct media_pad *camss_find_transmitter_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 			unsigned int lanes);
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
-- 
2.43.0

