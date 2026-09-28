Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021105.outbound.protection.outlook.com [40.107.51.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1DD49AA56;
	Mon, 28 Sep 2026 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590988; cv=fail; b=ib1PsbO1WKXKYgNy/YICNrZaXNP1kM0vdDnGbDr5/RbgBZ7bDwFfV1WIWuv2Qi+siTLXycZ2GwYURTiFFeoLBCYv2IBv6u118/Fcdp/U4vdfVybn8t7+/bUZQOIPZrLTrAruDU70jQHGRA0Vn8frl9I2E5qvrHpWRrXweq6dfTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590988; c=relaxed/simple;
	bh=Oo7rxCLCUKM5Feyknh5ybAj41e1uZvWnI/ju2hMhTqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BoNF2IXsQ5fxyyk1bo5LYzJQab6DWDR7hAj5Vy3LAenY0bSNosdCp1lgbW2sTVIKrdaf4hQTB7MLYVaBNhNMQvG82wKjlNTbyq+U+ZycTKcpG0YETCNxHpxdbmvQCfm6UEzD2SOOjXChoQZPYPQE7CHK5BmeaE5HAj9i75Judp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3v6y4vAAHBcF+2v+zIjuMZJButZuWhuDVNcafa0RQypR/p3d3nveNm7++LQT7DNGvoKyQiKGNU9d7fouVGmnlI+uY/fQ7iiWOy8AywpW345v4gu+D1XRqd4dBCU9m8RrsPLe0XjN5hzhvfVBfydlhHViHuCqk5NqZi4dIcar4yHKsP9jKt8BdpNSVbchnq9eHtVceMUb21H+Yn+S/vWInyScYnH5LqgWGYC8pQSbqAZ+lDp8qrnWn8EbBXSWJ9JhRCJwqG81GJb1NCdqXZFUzm91x1vgdjEMA3PjipQjduP8XNkqhEDrym+Ak2Q8BfwK6yKnr9AyPgan29cntvLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SKf5W5i1EhiZsuWkDMijEPNiuBJuxK2EntiQFy9/ek=;
 b=Yx+EtiLK1SYwGBWYeWvyhse4s63d/xGIdAHB9xq05mq8mT5eKHCIKQGPFR+7QP86dQNz8XWKk6RODkIDfGI9lA6ZMYb1GD4PdpNqFRGdbotYN+AQRNeRc3z50yx47HdOwYAXVZBWl7GrHF0Rk/rTMmVcTP1gYdQ5ZGpiqm1HADCdp93/ZIpeZ3pVr1hx0w0QSlMBtPhumrMIZa7XeKoTKhO3DyB6PhL7zlkbWMcv4yrG0rxvzNrlOyPBq1oEj6CMjqS38E8ZNoSPPgrvJQO6PoyglV/R3dbvGkZX/6scqUxMl7Dk6WrE0l0VRw2ESFY/NSRQ2h5FXUBH2VTt2pofYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB6171.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:226::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 10:23:01 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 10:23:01 +0000
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
Subject: [PATCH v4 5/5] media: qcom: camss: Create the source to CSIPHY link per endpoint
Date: Mon, 28 Sep 2026 15:52:37 +0530
Message-ID: <20260928102237.533341-6-hitesh@ebytelogic.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7b2a8a64-d981-4229-86c7-08df1d4a79cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|10070799003|23010399003|1800799024|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	V2OfTAtGCsBevcN+A+nDqOGpoyvWzHs/2urzVhow34o48GyuS/I3dJ7GKVwUklJ72TnoQq10SbPPn+IlEZDpSvhsbf7tTHEkTZ6SVSKndegX6b2N13+sh02dVkMLKBtuKZXasPetf+2TCPWtt8NWPT7gAqhJtokQkhCbAqSiCyReSPicdmExV5BxV1IKXSfK6rZJgkfAnzG+4z4xn3KwqTHVAxMiSP6UJ70RlegcsZrpPQw5knAgQpmc3z9CdimWby8tEiVmodHTV1XpvWis8Pw111urtWGWmIvng2DpVPBZNNhpJ9+2f+4IJAYzIr0B6B4ihYoQyQv/0simXWId7033XC96kjMqWuVzArg5gmCXfaQbuypxVO7rZqd+xYlxQLVfNadDVjSKs/bhd9sYcOkA9kGHc+lfgMmh90Kxw4Q/z1wVk7gwysmEQCkxIO0VtIiXW6ge2h7uLj8QV/E663CqmjCM1rnCbJuC4yR+3mgIcaFRCvCReus43xOTG8ry+Aa0+F7qgffvRUc//qN2Wv7mj7ISj1RqmWN7A81MFncX6u53CIYRMQHWzQ03vnXxxup/fqUlAJIATjXq+bklqF6c0O9avn6qfwlQdmrHtMekgLq3hO/3NwG3CeEpT0fWgVe+vqi1nGTtIKSb1KX5OxL6I228QgDJS0VLiq1b+RM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(10070799003)(23010399003)(1800799024)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gZ22UPuv4L7cq/mG9h8+1HkbAuacigX8v3Dp3z0lh+uFLKoJ7eo3pmmIiTfp?=
 =?us-ascii?Q?H6uBjDOFmEJqUugdzNyn3fd/r/FnzOdtq1H0tSbXw/SViRLQ/syQ6vAI6gHJ?=
 =?us-ascii?Q?AEtl+JyT8UKQ0DREnMH5Kgakjpg7oiIlbIH6RbmTAJAbFl3SguWEuC4gt7se?=
 =?us-ascii?Q?w9pFtXjkaHJbBpeb6gq3S0jxqMem9PrS1P4LEa3s9OVWbnlTuIX8P7wT0Qs0?=
 =?us-ascii?Q?/N69xtrK+hGDHbTf6MYwaJc8LNOuschJr2gz9UKrbPJpZ+a8tyNdnYJNDVjW?=
 =?us-ascii?Q?por8IXG7KElTMiI412L3uHSje92MoIM6LMeg2E6YnhRuHCp3dhtYEmoGxeyy?=
 =?us-ascii?Q?MiEPoCrvSCeIqpwjlDRLTz9ZLpUxIWZvGv91SVBoIXipIpNhL/TlCjuWtaGJ?=
 =?us-ascii?Q?tRupQvwVJr+6CyzbojHi9/FebU/zpozjVvoUujtWIXLsD/e2GI6gRR2/rRQG?=
 =?us-ascii?Q?4KfYdbg/j1ZqSzqE0krnaLQJ5rth/PWBQHDaYfu0Vo1UKfkcTdHDwttBcWFl?=
 =?us-ascii?Q?PWEvgis9JjXNewd2kXynT6y7ZYqcrOGGsrysaaTl2tDTJzJa0Vgys8ig9CYl?=
 =?us-ascii?Q?87idS78ifJBVeLgAhbUNptX1MvGZSomcB9Tv5bEnyFmYGzmj+ImBYdFmZpvR?=
 =?us-ascii?Q?eppOhSQr8+lN4/5rZv0mSCPyW+5BIbOkWIsdDIwA+OcpssvI9dE1qxO+zGLi?=
 =?us-ascii?Q?2xEi9S0Lvcbo+J5/X+/XXpIcVsnUJMZQgQlThJ/iYHLnpfm8qTdIBIY3/C8W?=
 =?us-ascii?Q?DfgYCkSBTzvGPcuzIhRfyEJypMC+QfJIU0+g2X3u+2JfZHH51sImLF4H2uOS?=
 =?us-ascii?Q?YxiefaqBT0sq/UOIRVGWJaVhPzmi3F7j82rQtP3W+SGAGgDE6TkvjBn8pyjr?=
 =?us-ascii?Q?js8NQReaOQiVDy4zlYMRD6sfju3I7D6SAtKmO5zrLYCW+KE13fLVeSnXBsM3?=
 =?us-ascii?Q?ZthW9pHeyJ8OHZaCd3RvxYkpoEtvpN5abXlt6X7a+YBDe0T2/Tt1ANG/UGp9?=
 =?us-ascii?Q?kqyUkZohvV0HInNlgUDEsK7icsFCDqjCH1SJaQfDXU8MURqb1knXs+aYmsB6?=
 =?us-ascii?Q?wfyA+GTZolW7y4Ob2ko9FQGIdGeFHmP0DdJBcnGtycu9eIId6qMcl2tsGfBf?=
 =?us-ascii?Q?0kAamjLSlICmxTgnS9gOZZYuzEBfWecMjCllnx1q5KWGuucH6SU8hPhbsAjK?=
 =?us-ascii?Q?m2tn0hMXI4t2NV02dX/AcF2yrF/EmfEBjXmEwqnhD/CkKipgFUlPvR0cL+lg?=
 =?us-ascii?Q?zKsy4We9y26h9n5jbHXVFvvfBaIBmpBBFFyGe7dbbpzZWH55zI3lfqQ4+x7c?=
 =?us-ascii?Q?3zsPj7VwcMgmy/K1z8Gt6IDiPu6LK/gyE7owgt/E1E6+8coqyrwMWjpKtGWI?=
 =?us-ascii?Q?3sd8d5hg0VIKwbTYK9H/KXtijscI7ogTxC84/buRBLUTyk8DKj7l2cUWgOd4?=
 =?us-ascii?Q?vGNndmQTScUHoFdIY0SOd7KmsgvlIj6Ib7OUJ63AFJMXbf6QauHjswBIju5j?=
 =?us-ascii?Q?TuI2KZOB7rEnA590e3/PL1pFut9XibM44cVgYeIpgC7nq8KJAs81HFLRedzq?=
 =?us-ascii?Q?2ehrwnJ1K21jx5SP04SQzB16anTFwJdtYpMbPrLGQ4OCzbohNK9ke/+JSiCc?=
 =?us-ascii?Q?YZcZ02crvVHlUpzTp6ilq4BXTSKE5pE9qW7sm0124tFVOnJqJWLOy6+94y4G?=
 =?us-ascii?Q?NGiNYrcP1eEQ5YluKiqx9X6IYeTo4phci+SCPdRTtgfUlMo5k2XB29+wHkBp?=
 =?us-ascii?Q?FhrRpbaa27r8foQzoMEgKr/UDwLj0N89ZZKHmEJD/8gOqeJWkzS32xbPAvJS?=
X-MS-Exchange-AntiSpam-MessageData-1: 9NSz7Ni2RNKKnQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2a8a64-d981-4229-86c7-08df1d4a79cc
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:23:01.8964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSdkuP3f5Kmr/8sFWrTmXwBkJHyj8d+6d+0VU5fOs1MA9CW4l0Nv098qwiOPr0nSMQb0UQC4c8TI3a4uUX4cng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB6171

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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss.c | 51 ++++++++---------------
 1 file changed, 18 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 42d8654fd0..c58306e574 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5198,49 +5198,34 @@ static int camss_subdev_notifier_bound(struct v4l2_async_notifier *async,
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

