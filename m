Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020107.outbound.protection.outlook.com [52.101.227.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41BF4CC628;
	Tue, 15 Sep 2026 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474582; cv=fail; b=k0UKClFAS4iSZ4YuZXyxS45QAkbdsIUvVimL8fgOJIOv3xjCfP241XqmVg9fC8m53c/8Tu8YEAiDcyiHjBjoWunOxdCmyzf/kLz3DWBhrEc0r9dLKy/a/74oGEW3FzNFbgyOaX697KmMuTqFnKxbLF62RLdRvEhz8uHWUv/9EN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474582; c=relaxed/simple;
	bh=MYrhuMX3TyzD+dzhFjAGnN5JtEg8d4/KudanZgPstQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YkLtWUoOV7tt2CAysdmvfEes1GYgzZUJX01BlDQFwbqPubRgkry4F4pf++NtbR/K2wbJwytWqPmMS+ZaVGpMmEmUjhGadv/98oMZj1v2ZtKB+ZFY3DMNBMRirevkUYdcQOrozIM7/hSWq/ZY6SwN4Y5NIDHf+1qx8upf21Xl1zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAQcBJ5J5X73bZFQl4yrH2VIKWBgsyulAE5ObkCxwvSQGAGMJw/6A6IZ1pNm48aJz69sPfUjin74vx8H+xnltT7e6DU+OU5M0na7TOT/KbfIy+mWa2Xw/WibIf3Ht6whlTDJ6n3mnjsSX9vysC0stbVmNmhxbmz3fwX4V5pkKM7SoNJmUfMo6TfIE1ucw4WFx1zkeLhm7D8fCeCk1SssXXiU3j8sQ1yc5R46ABf0AXsGSvZVNszncB57vZ1/XXfKLJaiTiZa0BqwPP1zxehYBZn27bDsO3w1MF530i7N3pe18z3nG3qcUwUBrb11dNV2hOlARCtiKZmIFekBZgvrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qp8UCCjTYtdraO9q6doxWP2hCkFU1J5Ft5eGYi8MfXY=;
 b=VhdObfulH38uxBz+5QFZs4P4qYoCg+FP4zyR+3PQm8+x+PGd3C5n86UN4lKjytj3OvRyGzVSEESKlzHTt2TfhgtW2OByIaIqm5awWIZFdIZ3ySUcY+TDCGAYD/iu8tihlhXEFAieFHgJVg5C5LoqvYOjek4EAFcCc4CbTSEIZm+UaDLbfHZjbqD4qVRl8fvp4AYQyRSbzzzGGpzW8wqFHg/qstvFQX5+nOTN8wnbBrpLytcbAmo6vl8Lctq6OlWSSPD1cQlUina1iw66qZDTeXubPFalwziQiAD/CJy9dxh7k/CIH5T7Xx7zSaQz5sCcAzaI6fcsUzZpHTagFPVrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4525.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 12:16:17 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 12:16:17 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v2 4/5] media: qcom: camss: Take the link frequency from the CSI-2 transmitter
Date: Tue, 15 Sep 2026 17:45:56 +0530
Message-ID: <20260915121557.20910-5-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915121557.20910-1-hitesh@ebytelogic.com>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260915121557.20910-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::10) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 146c854c-6562-4151-f1d9-08df132324f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|52116014|1800799024|56012099006|4143699003|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Lm0vAXtQS3ilq15eLgAqVaZi/Mthuam0hb7WP+paqPZXF5zZ3ZDSaX31tPs7N7Fs4Ok8xU9jxeFS6YJndaZQMiSYLO3gu6P1aFgDNMXNf2bOdgefYqbrqTRkRhhfEp9Ymt9M/vL4OBJsrXqM0d3blMLjo8dJ9/8BmPHm847i39lZWEuWYqiVcRNGGN5jwWFr7sd8is02a7jSMn932s4Cq5fZ2wxh0awzWROm28wi7rlFEQozR9TGsCxhGqTkFEAU/pqrq/stq8P3JosbTO3rG67Fsi3YGf4u7CSO1dzQWNayxvNfgm240Y0vHQ6LkHW+p+rTK8jFrghdTWBQ10KOhZLf6myauEdKI4qpmOtbtw0qc7gM04CNiOkc6IODHJYrT/YpehefpCL5bDmFO0a/Gz8aHNnU2puPOpKEuwNDBGbYqa/LIXv6mzuSQstXmawupbLDjtZw8vZV3xjusHJyC8PhAG2o1kFY8gjtZ4dvL1xTCjZQMd+P2dgM6wjXPlKvVym5+FYQ+ga9+U8Vq+QIn4Zj9csFwrDJbLtDZKqkViU3KfycKhN9jC9TiIeTfu4Ur0PL+DQ6Jr9GF/bPfWPY096trExtQwaNRyVHOicemftCaj4DLwWnf9Fd0ybE8NU49ujFcWmdgiGjzDpijB38I+6LeDm7TxLLMEviJQbz8Hs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(52116014)(1800799024)(56012099006)(4143699003)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j2CF+V0ITz2P2yza5N8LY/a01tCoSTKbDJg68zq8zjlhJg+8+FGEwm8S7fnw?=
 =?us-ascii?Q?BEt3Njz/xX1mhrOaU4IuI2NV/SqkRATpCrJQP7yjyV5gurrrwU1YfRz0tnL0?=
 =?us-ascii?Q?GGj2D9yrdOri1jntMjQFT/lDRZJpL0HfM4WnmpZMvh2cLuGMOptNf45MB8TO?=
 =?us-ascii?Q?Ib9xnbYJQRdBlo1LFKbnhNsEZrXAJVgTqjoufYWoQzhE20f0KXenUkq+nhrG?=
 =?us-ascii?Q?H5876vUPYppnsK5zindE2g/lTS6IAE25egNR6FCJR+URmoB3hJemVHupIr21?=
 =?us-ascii?Q?Jfj4ZFPK/ENT6JyZAGy3ksBb3Bm7x1nSt6gyUxcyUo/Upi9FVNoM74aV8292?=
 =?us-ascii?Q?TWFA53qHo4dWgmjJwXFGvO1DDlifxdwMSLHt+tuknndYONQ7AGs7pe4jNvfV?=
 =?us-ascii?Q?ikpe2dgniyfzVnEG+VCMdAGewckgsM/BA4DKEl52T7ZqONb3M6vlaGgT89zk?=
 =?us-ascii?Q?WLoqMPuibAnPEpM1PEBR7d30mcwUXRoFAZhneViAd2y9aZb3uAYudXP3rsHq?=
 =?us-ascii?Q?MmSv8au3ZkBevq3JnRyEN7g81qmt9N5zCOWXwAnLmP6mFtEY0tA4FGOFUWRW?=
 =?us-ascii?Q?jqOjPDJbLWVWbUinNEJR0PnQI4Otq+sizv4CxF5Ar6DbeqrnFvvfblLRiJ22?=
 =?us-ascii?Q?B2MyqtveVfC4cdES09PKpCmYXMzaPIQn8VwJbT9fIgQ1++pr975zqGN7HMj6?=
 =?us-ascii?Q?db2n/bwDkjaEjCSJwKy0JTK60sWZwOGID+Pn5YWmdVJ9bUj6OPNLB6G7eKSn?=
 =?us-ascii?Q?vDNmXzYSO6uFF1omWlYiFkioN88+GIynL1/a9qqXbgXb+qvmXfvcL77xN0IV?=
 =?us-ascii?Q?nu+Pvh6gQlytCrGi2P0i3z/m87uiTNQqzXChEUToB9JXdVHsjh8mJRg524wY?=
 =?us-ascii?Q?/bqyQuDRq2/O+4NfQm7mkvAtClcIe1RNZhRNEC7YBSOIXAyXC8ex/fRkWx6d?=
 =?us-ascii?Q?11ef9Xr256ve2WxOq9eQlF8z11fWJHqSDN37fVipxgh2U2XRYUz0ohgGEXJS?=
 =?us-ascii?Q?A7eeK9Ro0FCjXyeoexPCQbT9gyQ9FcvI2jNXLNc3kKMru2eML2TgqukwiQ8J?=
 =?us-ascii?Q?I5qm/Cu5YQsvW346Tjp0xGsrwZm2cr/eV6hehPRCJcmfz43m1yE7rAn+qAMN?=
 =?us-ascii?Q?GnNCxr3eWhqfUE8/m5VcMGsZX603nvavt7GI9Oo/HQJGr6eVD5pM+5Q2KjAi?=
 =?us-ascii?Q?cy43l2pTSHZqB0bpHIv+xJGF32uW3tU5HWGXGAIkJw5U/VVQTi5oe7R95l82?=
 =?us-ascii?Q?V0atpyA+OyzjGNZ/BWOjYaoQMUVh08l9/zwzm15PpQqahafWSmTw+AFOU0tj?=
 =?us-ascii?Q?ZMeAq9FoqT+qJ9o2so99kKz8IDjsXHJl78nizn0GbZ3StfWH0ALcjBIYGxaY?=
 =?us-ascii?Q?nvved8/yUCwdljypfFFlZlVq3gSffwRy3aA0MEEjoqoT9Sqh71lljo0cRCgR?=
 =?us-ascii?Q?zo48eIpzHEFElHLLW1N/9EDrH1NUK+rfHHFCas9X/hr/vA0jBb4gvgh4nRhI?=
 =?us-ascii?Q?kC0Om3coKOw0dSNc8AqGRXAtbrdTgxZrXhKSwPrHWOm0GylY95NvAhe/wcL+?=
 =?us-ascii?Q?bSzrQBbO8c4H4DbtJB01Ir8Jh0pnfTQUAfmRHJwSLk5r0+aYg+QtQA5O0eWb?=
 =?us-ascii?Q?seoGlGeQ3HfrzUUuAkk8kKj7hJGOM96UHZLz6rRspa8hpd6WNyLtdDYCF78v?=
 =?us-ascii?Q?RKXrY1sTszWxxaC5Q0TS9mU+9mfGbHeC5Y5AM7cReCXjmggC0nvC1ZQMnQFn?=
 =?us-ascii?Q?HDbfbD3J77eYrL14uLi6Y9bjkiaNogSuSFyKcE+0VO5gELQCjr+Qow+0X+P+?=
X-MS-Exchange-AntiSpam-MessageData-1: YjRCQRLRihpQ0g==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146c854c-6562-4151-f1d9-08df132324f5
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:16:17.6788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6txycUw976sNpbgIRRaOs5IqYQ7CssaW1HS5bIjvaXPHo7nZ9v0DQxtQGD0Nkmmuggl1q/7WA4pHjpDS5ARSuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4525

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
index 2123f6388..61e98b017 100644
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

