Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020092.outbound.protection.outlook.com [52.101.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1CE4078CA;
	Mon, 14 Sep 2026 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392877; cv=fail; b=lU4xXLWSBA050qXn3vqYvcIwXTTDhhabLy52MK/bHcZBUq2qVHM6WoS4uc+MRjWDu6oaf6sVqX2aPXVZZgsN7nltGXRHq4ShU7ojZxHd14sabOozqvA/E+mCEJRrdP1x27CaSuul2fRpa7EfIx76FQ1j5WXH4O5+Atq4YyWh3Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392877; c=relaxed/simple;
	bh=A9cDvDliHQWTkCYAiXjOY/rOFGbBUnrgZEZV1RtlPDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mbVrzPMUrRPAOo/y3iSMzMclQsB+n7o4+G3AmMdWQwvR4rVrIfBeKsjHqHeS+MT/IILUG0Tv6fgIe9fL40v8cfhwPf/ryVXXapVi7oQg06YOROAVzlKVJaF0BPt6xuiQtpwCfFVsfEr94vTErQk3jDSjCxL3S1JX/29QunPy1pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eo0yrjgwKwbit2F2FwGoezyydNlVU4QwkQlb46VkUCj0XHiPAw0r/dwewcmShP3hgNCwXKhkPb/S7mzPhfnQNcekaYvA812YV/ZzYV5BDJFXmNBRwR0BqQ4LJR08fw0FL58ee0o7MjRyz/b9w6MVPk3/B+gEPYXtejp+wtaFS6ZN3c9Ar5tMi4xD1m3T5kejSxAMWPyHuWgqsl0SN0Sq1xVLZx3QRwSCQLHGGg9k1VGetP2b4gmrlRrpmlPxlmpZpzPX1sZfGOQabcLB/iijs5BY5maQ8TgPyELh5w2FQb1QLPH5Foc5KhVNi2Pidjw51oSqxueYrVzuFfSBr2tnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWj9UjbaMlM+WChAHjwIOH/jC7Uv0haZCHhm1bJjExo=;
 b=vWhCaWDDg7qKBM26UrfUzqoDTTZvmUe+dlZpSeY7C+HuTeS47CX59DVtQCWIjLhrHxYV/pCDoWQpF+HEthT7b9XPziOHemtcoIwEYotU19d3iPueuAtGVI09Dpfvf6TF9AlMZk3gwXzvXgqZQZNFzp9+EKY1DYnB/HPITEPeuzpLIpXR124MFiOHy0cEfsjtMZet/tu4jSRQJPwavwJMXgVt+yE0xTBNolY35zVLaSis+vbGppuYtOI+gB3aUjGLNrR/93ITqhsiPlSOUowDlfaAPa3LqfPXB3ZPRVhdduc6X/PUbjCYcUuRsW2Yug6pkQXEO2CzdYwchX9jT9kX5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN2P287MB1360.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:127::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:34:32 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:34:32 +0000
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
Subject: [PATCH 1/8] media: qcom: camss: take the link frequency from the CSI-2 transmitter
Date: Mon, 14 Sep 2026 19:04:09 +0530
Message-ID: <20260914133416.1030231-2-hitesh@ebytelogic.com>
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
X-MS-Office365-Filtering-Correlation-Id: 40e72e45-a9b0-47ad-6e0a-08df1264e8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|10070799003|23010399003|1800799024|366016|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Cr5azjh4YYdcnJVICYOaAlhavG+zTm/s+5MTXLcbMOYHUxtkDyRG+eg+uPg6Z93Zfk4GaXm2/ASRDdso2mghqnhNoLw3wqkey9F+W1kOfTacSdAngdKLs9LdJ68e/M4TuoYcP/wjW4LqxFxtvQdgOEa5FOxDkxWVyGuhKQNRdPxOjUel2U4pwAFUt0XyFfn7R5aFSCW76NpHI8mSc2hGVl3tK5DaGkLfReuEY9VtJasLM17mHNP2iGm5eqnhahmIEXpV4Gh1MZCfFUcXftxEl3oEL6bnGVKah2sSBR0icK7Y/WawZDQ4S9g4j2Q9ZckKX/3PpU/oXhHW9JSJZpp35KhF8g/oH9tqeXvrzmOtRXWEIRooV77H39696NvPWeqXKGdo+3AvfeX5IkE8neDCOAZEcFx3KJh4qF10XJfWcokycEXcRD5zSKw6svhLJmGsOoococs4uFbf3/m1XGiW221DFNVuEBuFiz3+3gFvT+Y+joAuocRMaKb0wIVaBXdf55iLQSiCPy/da5l5OLf5cV7G554UMOtMKr7up7HF3mMpmEuWIhfYZS4dOS+1S5Wv22Sdp1TvEh2kyAHNM/BDQdR+GF+DG3EgFdXkyXtwEEvH7KmttAkDrTYTu+ajYZrXvPp/v/dmsrtU1H5o9NPbdXjf4KkgySXWo2C3SpK/9gs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(23010399003)(1800799024)(366016)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zrH3dxelMcN6TdnuIUNlhZsBg1qCVAfKZUcIaEKtxNrK+Yx63Ll7bykS0qP2?=
 =?us-ascii?Q?zmdkqijiBEaPmsjR+fcGbA0cipGoY7L5AWbN5//btNNu6HRFTFFR2w4UmC+J?=
 =?us-ascii?Q?xbEvG2DwrouLVuIS07xdb8yKGxyfMbzu7lKjJkQFbEPSArhuh5ufgO9hUHRD?=
 =?us-ascii?Q?RLhcSq656v0nvUW+22JbAEFjjDLuS+FJBFotisn2tBkQ+NZ5a/TwCddYojtO?=
 =?us-ascii?Q?bN4DEhX3yK/5TsvUWomuzyC1yPX5fw7LlipIxXssn4EPwCWXOzBvFRA74gGN?=
 =?us-ascii?Q?OFqDUE76jqug23WFLaQR1pZ5WoEFXPyjiAnibV9qw16P1CV8Evw8GCenlZky?=
 =?us-ascii?Q?MChwN8bwFvrJL76jRaa22g2MLJ5ctgmDW7ez1mgEJTgZaFPBAOHgl1XAgAM1?=
 =?us-ascii?Q?COW2Kujk4VOrRAcZgx1l+XVeiAYtyh8HTLhWoK8ftN8DgKwr7fYtYMopBh/A?=
 =?us-ascii?Q?LCUA0sroxSGs1lLfY3B8QF6idEId3iKEPz61Tt18it6JdRvGcVR+uuRLzOkT?=
 =?us-ascii?Q?mvKzUaVpKN+JXtz3XmNiqffF2xOmzlGxFT9E4NzsEDDv71u74uyjv/L83y+Z?=
 =?us-ascii?Q?XU2ECdffbNP9b0hD/E1t6A0bebUcEPiLD90CiObGbS0vGkAi9a0CrwQzZNd1?=
 =?us-ascii?Q?RWQGsBMxiC9ZtHMdGCTes/LLmGCjLqSEAcBezK2FUCKJIMX+ETf9spwrZxLc?=
 =?us-ascii?Q?hMkoCLBDTtYkhPz8DVoxQcJtJmx3c5uZvtyZkrhd8N3wPfdmystavu81V10z?=
 =?us-ascii?Q?EJ5S6mdOeJ0kHUta/3sVbd1K7lUWu+QNu3jcHLoCuuJZglFGM6uW0xHcZz4z?=
 =?us-ascii?Q?6+ZaeIKLSXKZ+RPEywNEyzddNNG+Ev6vyyof+Yza/AzBXUs2AZmG6R25QzIy?=
 =?us-ascii?Q?vlbqHC9hCmjbUr3jD9EYLo29UA6KK+BEDrrItBraVbuS4iTAeUSglfEp8WPN?=
 =?us-ascii?Q?L2JDYrSLO+rogX2Z68kX2sYjTxzH6QROwOTjERcMBWF//orVy7M6lXs7UU6Y?=
 =?us-ascii?Q?OdL7EBMHIs0LLozPtgViE7j2/CarzAI2ET1bdJZ0LcuXkmEf8kjEkdP0l4Fl?=
 =?us-ascii?Q?He3wjI52fdu+/CTDjXqaKinVH+DmjJu5/mpTOIgOtp8oWUUAMsM3fcFlPOHB?=
 =?us-ascii?Q?bniaF9sGZZIRKQ9kmHdiazFg/z5es12p3zU68/E6CjahmjJDDa+apFQyuZne?=
 =?us-ascii?Q?7yWFqBTzlKjY0Qm6iHd9lYxgDWOwwm6bw0vBCRl/Ss3/xnF1cB9Z7Y9XtoBM?=
 =?us-ascii?Q?RGPd5himRtHqvhMbiNW/FSk+ZTjzSJXHlvskobB5ZUWcKlPwqscp9G19QWGb?=
 =?us-ascii?Q?dvFyr48QlxJA23x054eGVzcySPDs1cjakjyMxBpd5+jYQJCkJQVNsr070uX0?=
 =?us-ascii?Q?JcJB85Y/FXjf8I7SfkbAsZpD6wxM9BObq2TyB2c70eKSfP/YRdUD1e/Q0dVM?=
 =?us-ascii?Q?AMyHF9egd024oTvRm+xkYvMvYm8GCo6HOsZwMUaIeyBdMwBrgNMbCMkP4Lip?=
 =?us-ascii?Q?L3cni8wKYJuofdb5MgXycy2Vi36y4ovq7LOmaIz8HpSC4nvKSJw21jSNAZU2?=
 =?us-ascii?Q?LiU0bw4LHBgA5N5uTbTrifnDu2d4Fu9ntrO/7WiUArXwHfdrRNT6Gvh/A4Bi?=
 =?us-ascii?Q?JBlQpkHD7UuiVh+TrD/kg6zBEnexpT0kvDtdm8kqSd4vhFPqfG0hBf6L9H82?=
 =?us-ascii?Q?qiQ8npC7wK7fOz+tqZCSc4xQpqoHaCWuOaplMUZpVhSrEAJeOwTG/pmCEGID?=
 =?us-ascii?Q?E4xQtR2g+3iGZC+bnJJbKepYnLvx/1iOLLHhyObbFZ6lBA1LViymwAkstmNk?=
X-MS-Exchange-AntiSpam-MessageData-1: llpbqeZvf9oPsg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e72e45-a9b0-47ad-6e0a-08df1264e8d0
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:34:32.2646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okZ95jIsFuqfghBrJG+ffzVt25O0TmnNarguJsFcYAaAPZsmjV2qYtO75D8UWZC1dmfVdJpbwU0+z+GSzodCXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1360

camss_get_link_freq() walks the pipeline to an entity whose function
is MEDIA_ENT_F_CAM_SENSOR and reads the link frequency from there, to
derive the CSIPHY settle count and the CSID clock.

The rate the receiver has to be programmed for is the rate on the
CSI-2 bus, which is a property of whatever drives that bus, not of
the sensor at the far end of the pipeline. The two coincide only when
the sensor is wired directly to the CSIPHY. With a CSI-2 to CSI-2
bridge in between, a GMSL or FPD-Link deserializer for instance, the
bridge re-times the stream onto its own output: it may aggregate
several sensors onto one link, forward a single sensor at a different
rate, or generate a test pattern with no sensor involved at all. The
sensor's rate is then simply not what arrives at the SoC, and the
PHY does not lock.

Walking to a MEDIA_ENT_F_CAM_SENSOR also fails outright on a
deserializer that has one sink pad per serial link: the walk follows
pad 0, while the sensor may be attached to any of the other sink
pads, and streaming is refused with "Cannot get CSI2 transmitter's
link frequency".

Stop the walk at the first entity that is not a CAMSS receiver, i.e.
at the external subdev feeding the CSIPHY, and query that pad with
v4l2_get_link_freq(). This is what the helper is for: it asks the
transmitter through .get_mbus_config first and falls back to its
V4L2_CID_LINK_FREQ, then V4L2_CID_PIXEL_RATE controls.

For a sensor connected straight to a CSIPHY the transmitter is the
sensor itself, so the pad found and the value returned are the same
as before.

camss_find_sensor_pad() keeps walking to the sensor: its other users,
camss_get_pixel_clock() and the frame skip query, do want the sensor.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 .../media/platform/qcom/camss/camss-csid.c    |  2 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |  6 +-
 drivers/media/platform/qcom/camss/camss.c     | 74 +++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |  4 +-
 4 files changed, 73 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 48459b46a..c631119e2 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -546,7 +546,7 @@ static int csid_set_clock_rates(struct csid_device *csid)
 
 	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
 				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
-	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
+	link_freq = camss_get_link_freq(csid->camss, &csid->subdev.entity, fmt->bpp,
 					csid->phy.lane_cnt);
 	if (link_freq < 0)
 		link_freq = 0;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 539ac4888..000fde129 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -145,7 +145,8 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(csiphy->camss, &csiphy->subdev.entity,
+					bpp, num_lanes);
 	if (link_freq < 0)
 		link_freq  = 0;
 
@@ -272,7 +273,8 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
 	u8 val;
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(csiphy->camss, &csiphy->subdev.entity,
+					bpp, num_lanes);
 
 	if (link_freq < 0) {
 		dev_err(csiphy->camss->dev,
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388..16ad1c26c 100644
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
+ * @camss: CAMSS device
+ * @entity: Media entity in the current pipeline
+ *
+ * Walk the pipeline upstream through the CAMSS receiver subdevs and return the
+ * source pad of the first entity that is not one of them: the CSI-2
+ * transmitter driving the SoC.
+ *
+ * Return a pointer to the transmitter media pad or NULL if not found
+ */
+static struct media_pad *camss_find_transmitter_pad(struct camss *camss,
+						    struct media_entity *entity)
+{
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
+
+		if (!camss_is_receiver_subdev(camss,
+					      media_entity_to_v4l2_subdev(entity)))
+			return pad;
+	}
+}
+
 /**
- * camss_get_link_freq - Get link frequency from sensor
+ * camss_get_link_freq - Get link frequency from the CSI-2 transmitter
+ * @camss: CAMSS device
  * @entity: Media entity in the current pipeline
  * @bpp: Number of bits per pixel for the current format
- * @lanes: Number of lanes in the link to the sensor
+ * @lanes: Number of lanes in the link to the transmitter
  *
  * Return link frequency on success or a negative error code otherwise
  */
-s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
-			unsigned int lanes)
+s64 camss_get_link_freq(struct camss *camss, struct media_entity *entity,
+			unsigned int bpp, unsigned int lanes)
 {
-	struct media_pad *sensor_pad;
+	struct media_pad *tx_pad;
 
-	sensor_pad = camss_find_sensor_pad(entity);
-	if (!sensor_pad)
+	tx_pad = camss_find_transmitter_pad(camss, entity);
+	if (!tx_pad)
 		return -ENODEV;
 
-	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
+	return v4l2_get_link_freq(tx_pad, bpp, 2 * lanes);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8a..39ea33e61 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -168,8 +168,8 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 			struct device *dev);
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
-s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
-			unsigned int lanes);
+s64 camss_get_link_freq(struct camss *camss, struct media_entity *entity,
+			unsigned int bpp, unsigned int lanes);
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
-- 
2.43.0

