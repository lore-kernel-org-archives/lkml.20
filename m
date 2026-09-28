Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021090.outbound.protection.outlook.com [40.107.57.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54E3822B5;
	Mon, 28 Sep 2026 12:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597744; cv=fail; b=i0bQDLumH1jFukVamjs3969rKwvQB4xDvfi0gcaEHMlW7JOdSJvXm1S9Q2jVHJoB2CiEeZjCdPBChM0Xr4ePNJWTSw2UWu7on+sbEDfTohbcQs2Nb5zF0J3hSLqUaX70CaI40Jpp/1HxOTYCB+nszJjiHjANz6b/CVPZKpDy+xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597744; c=relaxed/simple;
	bh=HJpVBNhOHYBzJckfg4MyERpYfxOB00miIRWf7ysBPwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=No3zDSxBNjqKredTYVx+67Uxz5WhJci2DtYjiNzIGKm56TqvmOV8POXtup8IltMRbsaanV6X0Ms3qWjbuBJWdpVPxQQGY4BtqhmLoDm3WP3222cPKtJXM8eGLnnMp6HjhXzP9/faaFgA9PmGoqGnX66iYWZ/Fzjv4auNTTKJ6DU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.57.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUrjl3WR+FiKAPLgnNXvt4A9QY5qo7a9t/L1JBCg+4B0CLQBSE9tRFV31H5QIgPCx5eu7brkMnN7d/lDjbFB1w2X6PtxGO+ofcrU9vXny03INlPB3SRq4tHlng3kDZ3iFclXRC9HMEg+fzB2m8cOUuGgkOpJyHxOKXzwfOOkfBl6NVLY3qK0VM1siCJkSiwgwL6Mdy/TFI3/3wloMH93NROHcTwRgM1va0HoiBNO6s2/VxGgXYHwOzpJ6scuCTNc5TOOGZ6xsnApeCIMUVKWqksVIFP2FIyOFtf7tgJSiUYuSBc7ZBzeIawwwsBxDSebldZx3dMN0X9Dealz70JXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i08CYngfK3B7LZ3k/qxKa4RiZAPj7GqxC9S+adUKUrw=;
 b=J9uTisi0VLMOswAduEuopbsW2hN78KPHB3oCjXComl9eICgVKQmkrbM8ihPIKHMkJ/now+znYdM81jYnD4GmUIpdz0rwNE3iixgyO1umHeJudDOVVEC5qoTq/v9vWxhKFNYAIzKC4MCnKInMRSGYTiUt1ytuv1SATGEk0FIikmh6LX6jC1O+xDGZ1yMXe1/EEnR5tpo9JNZDVY7ExxJf7cwjOVFqjm9cF2oCAxTYi1IhNPME2OwIZWz4d/ynmgRz2esK3tDwvHLpiRufNcd+PM5/OX7UDVkxxm4aCScSNgEHl9P59JmrFeGnFnWxq77KVIYgC1JpvmYNMR9DulzN7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA0P287MB0267.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:15:36 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:15:36 +0000
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
Subject: [PATCH v5 5/6] media: qcom: camss: Take the link frequency from the CSI-2 transmitter
Date: Mon, 28 Sep 2026 17:45:07 +0530
Message-ID: <20260928121508.1404808-6-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928121508.1404808-1-hitesh@ebytelogic.com>
References: <20260928121508.1404808-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0091.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b8::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA0P287MB0267:EE_
X-MS-Office365-Filtering-Correlation-Id: 912bf4e3-3bb5-44b6-2bd8-08df1d5a33e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|10070799003|23010399003|22082099003|18002099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	dhnxqDkiT+HZl4RvqJfHitQhNSP/aP9j6vSflJ6Co/7FZwziD3DgIbpZWYOU9S38MzVw31shwFgawbuM7M1tI3CeRxhqKObtikUBOqr9WGlOUWGmJ5ZrvTOQvdXIpfYmDg0nO1cdEHTjJ8FFmd1GjxE5WLzuP7r4xDKTDmMtBWDZKIZVxEdACX6MtBoIYMVHwBZVyqL2IAW7QBSfaQK5DE94SUdDTllgfevJ5Bq1RiCkvEvVVB8Zjwh1yOxt5JmQv0WGrJ083PRFSaTGkaW6EiKl4225nbxGPGYpnLjufNb/pa1e9fvSqXS377nNJHX+J7LFVMLjthrwVjB4AGvh3cd3u1tDqQBeWWRRwkNKDTsVvS83swxK5SYIBZxMwaEf66WzngPvp3eyaaeWLXAdAxPn1NSus+MkAM/vL50j3gGmXf/j+XI02lwdPdit2l3KCBizsOmkTq8ZkjB+zGfKuO+g+I66tnMbJwvnJ006jpDUWJ05k0mIf155HEGuceSItSXISd8jlcprR5npFbSMVUfLWKVhZro7L6OGEakCNwMwYabCfDD285RSj3KOIwgev6uLKDmRuuyoJCW0gLazx2g2BiZG81FhsJ2R3pme+mGKuF6NGKoGEAKl7pm34kD+uX6qUzs5wK+xtOMRR/DTFXt4u3xnJ2StN6nu/XsFEi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(10070799003)(23010399003)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lR2b1iOJBmz8P8+B7t9OsNaFUfZCT4B8VR8ktin+o73wqhyFyv8p0BORjTNA?=
 =?us-ascii?Q?GQA4t7EMKlf2PxP4sBIu8JpjegqTmaAZdjH1K33yS+zVEZ9Uv+/fLOY6hfN1?=
 =?us-ascii?Q?k5xhzB90soS+kMVDjkjtTmhOnvMoGIsDsiuJSPpkATgi73en9rcG8E/7kYXg?=
 =?us-ascii?Q?GhNXbzQ3MwIA5BHTIKU0Qp7Uxd0bAiki4zTMInKSHZFrZvD+D4MIiEoVHdRc?=
 =?us-ascii?Q?dE9o3Z7KadfvWphcjdZG1esMchQ+JJJG6a4lZ44rV9TJ/Fk7bVDlmD9ryXnv?=
 =?us-ascii?Q?gTDull98hwwxttTddW4eKLuKh24HFFcQXOOv7bqvvlj2mveeUX07YA2L2Kyh?=
 =?us-ascii?Q?uyP5ktdkBFEATpKRF5wdJ4+BUnzrqlUFr2E9ibpbIeJMnrCQOy05TbnUUE1+?=
 =?us-ascii?Q?iVt59pbEVCH5eZeHnKFuy2/OTf55PVrILzOAvx+bMJY7yH4OlAKuG4BPfa0F?=
 =?us-ascii?Q?2UvVO8cL+OVon9vfESC13AEOJZE1zjP7JoAaZRRDbOw8W6Me36EV6+iOp9JO?=
 =?us-ascii?Q?XegA+JjJKWc5o92iB6o7FIRSKojOeLWhSUCGbu/J+Vn8jaEo+UIMYQdJm0Pt?=
 =?us-ascii?Q?o0YHfoeGBD+L/lVkgsnb1h3rI9+1ozI1V0Erga8/tHb+zFnO7BmGOKIOdbux?=
 =?us-ascii?Q?hD/T1jSg8grCIoMEn2E06Ii0blXLPcFl0y9CTknUHew09oAhhw4RCFwBVki6?=
 =?us-ascii?Q?sBbsUN0k0/1mPged+dfSRLNgSSv34JfK+UjNwGCFV5dYYVjSGz4a6t8tTg7g?=
 =?us-ascii?Q?Q0odNmDyaILjJxr7fa/nTz8jOnp9CsuM+tUBRQnWqyHh8DP6SJ4UgSpnYdCX?=
 =?us-ascii?Q?qCMLvKNgzKcKpftJiYenxTQ8qZst6NMwWy2shM2IGsEbwJG3dRECD3u0aGAj?=
 =?us-ascii?Q?z+OJm4DKe1+1Deg/EzvOr9RxErZIWC0Lg2Ds1OpntbGOeIuS//8OnAKJizUt?=
 =?us-ascii?Q?tKGkvHgDSTZxMnzqNjGJ0IpD+/CwUggQRCUhg9X8WPkh4f4mR4G0sSUCoxfr?=
 =?us-ascii?Q?npUTnUd25m3YUE2/7x9ezAH7Z/TXJpWiQSZV5T/RlXgouqERPfpLdHbe7LpU?=
 =?us-ascii?Q?bHP5YqSyU++pQecit9SVOWvqLOdQI5PkIeq7v4stkc+St49OQMLvySvUte95?=
 =?us-ascii?Q?bLkAekxlW7/+fF+uzkCgYfRmdiQPqeRsp7ZXkF4HnlqpnrsusFYt7KKLwu8X?=
 =?us-ascii?Q?AJEsEOkg+puFtUahVAbX2jn0DjjR1rAOTrq3wYswXdiDry8/lu3q3dWRcza6?=
 =?us-ascii?Q?Tgn1urX0a8+8CBaftu0mpDV+c33wHQgBdUF8iSjk+LRMI1/dkHSPursANLNo?=
 =?us-ascii?Q?Zgg2Nci01BtL0eQJcvD3BB0Kld0IO1KYpU80QHFUBLmldblLVYSLh/4VG1OE?=
 =?us-ascii?Q?YYJK+w3fgDiNtvInFFumgjqWtSFuMDSZncd14ihiHMBA5bW6B4ZyZirw3Txt?=
 =?us-ascii?Q?oX0cr4daxR0mQLrHTmUQJPMogGGs40Wp4aOmlxeSHa7T6/BOwXPacVLXGwtw?=
 =?us-ascii?Q?uQsSrRINqACQongULo8jb4AV8vB1Yv5l1RNr8l2vf4r6lt3I7M31C2/ebBin?=
 =?us-ascii?Q?QHiwSaYWMztXm14CfDlVyK5y/+JbgaE+Z1se4f7LylXXlTCL9LIbZFsIz+1f?=
 =?us-ascii?Q?Jc02B3TAosty7BlQxg75lEgIFmFziSN3nxVCFj9Qy7tKnjuGyU3EyH+YPTGn?=
 =?us-ascii?Q?uIJtwNt+Eky3QxuykowDIait+ZPVIzgsji31RK3VBSGaDRB0pFDtMC5v10/X?=
 =?us-ascii?Q?bgvaCrM+T/K5YUKAG3JWatDcBKbJFzByF0r9Pp58QE8WeeeScBF2NxFfc7Al?=
X-MS-Exchange-AntiSpam-MessageData-1: F6VyeNFD/OFFig==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912bf4e3-3bb5-44b6-2bd8-08df1d5a33e3
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:15:36.5876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /htU3AFkP6KhJLn+BEK7Hmt6+2MRTMV3YzdWTPVupGVFCZjexjHMfOLbkdTyJpJiG2SGzxQmk3s2tlPcJBhKFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0267

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

Add camss_find_transmitter_pad(), which stops at the first entity that
is not a CAMSS receiver, i.e. at the external subdev feeding the
CSIPHY, and ask that pad with v4l2_get_link_freq(). The helper queries
the transmitter through .get_mbus_config first and falls back to its
V4L2_CID_LINK_FREQ and V4L2_CID_PIXEL_RATE controls, so a bridge and a
bare sensor are both handled by the standard mechanism.

camss_get_pixel_clock() reads V4L2_CID_PIXEL_RATE and describes the
same bus, so it uses the transmitter pad as well. For a sensor
connected directly to a CSIPHY the transmitter is the sensor, so
neither the pad found nor the value returned changes.

camss_find_sensor_pad() stays for the frame skip query in the gen1 VFE,
which is a genuine sensor operation and whose result that VFE does
program into the hardware.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss.c | 80 +++++++++++++++++++----
 1 file changed, 69 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 23f3cc30a1..79facd0133 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4619,28 +4619,86 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
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
- * camss_get_pixel_clock - Get pixel clock rate from sensor
+ * camss_get_pixel_clock - Get pixel clock rate from the CSI-2 transmitter
  * @entity: Media entity in the current pipeline
  * @pixel_clock: Received pixel clock value
  *
@@ -4648,15 +4706,15 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
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
 
-- 
2.43.0

