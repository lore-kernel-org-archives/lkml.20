Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020107.outbound.protection.outlook.com [52.101.227.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73644CC630;
	Tue, 15 Sep 2026 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474584; cv=fail; b=deRQ2Mq5pEBju4aa5XaoUwFsE0UMA1PiLj0g5H+kBg15MwoHq8q+ExzBIDOrzFVzCwyCGvCOeMRaKg/AMO9VW/Tbxpl3WQsigXVt1wkkjTjk5wA+8Qz4uizOlDGJM2S3FqcY0VInBbr6iEcFttV5GIST0GlnvA8sZfwHNtuv5A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474584; c=relaxed/simple;
	bh=dxjeigxeTrYJHze7nbr4BmcyEf9/t0Mrjv5Xbww/5+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mcHuuYrY5DEwSfdmVVhrjtqqgaGoIbixE/tWIuyGqQ0qvArlbS3A7PVRgRmh710BhCnnp9b/KBSA6mO9W9yJJZ2lrl1T3C315p/88+hJY3EiVwtUtECDeyqjjoig0JAl1neSYoqvWE3IwzWYhrsN+2TVPkzGPWjjHle4sawauZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcPiPOCNb+7kTwNStks3DZn9j46XtnN3sLrLFYrGmGFhBSnGV4FuD2G2A8ExEITRADKUioFd/OqUAB+ZNbXh3cKAMVdeqUDMt1zbeTz1Q3PZyulGaBSuG6dDKMfzRgruoyaxQu8x72gtueXvsa7tONoFUlJzN3nfzPXkh+rFe6tKedJST4ue6Mv2+R6dDCLUuui6Bn5mbOdFAIDusrYJH8+pepX4IhFB5UX3/Ihl8NqdQG5OXUPJaErJ2v/1NS8TBd2lpDYSj8gk3y77h+JxUPkUvss0c4D4Wm1+ygFIJwSNyypQD4h8qYih68ZF0Lw+J4Oo48OctVHQK8Zu0RYj9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzDst+SsTYCmjY87Nk5hn9KbdCrqfazXCsr8HD5DnGc=;
 b=YjJkXRfrQVq2jOe9R4KS8dddCiQ/2HJ48ph9mLyFP3MJU340FyzE2MI/fNhLg8//nJMnLUGX7a69EuQ9sGldSc+/+0ARhyG+jwURjjwj8j6q6j8ymoykdAhNlf68P6stIzkm5I3xlzGihYPtaS6JKi1El4M+k3IDsRZqaQWFEN6ZDzGY0Lvs1qZM04Tv19G5oNppta6PqLWTQsvcO8WgTfv5ogfwFq8dgRsLWJiBPJgSAY9g6NuryKJVDdC5qhWUE6+/0bep6n7XDMJiko1bZtVAXMsMwT66YYAJqjEaj7QaVmuX5WO9+vf+Rwdzx3wM65nfe+bWnDB5PCmLVVsaxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4525.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 12:16:20 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 12:16:20 +0000
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
Subject: [PATCH v2 5/5] media: qcom: camss: Create the source to CSIPHY link per endpoint
Date: Tue, 15 Sep 2026 17:45:57 +0530
Message-ID: <20260915121557.20910-6-hitesh@ebytelogic.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0898397d-415b-4956-8b48-08df1323267b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|52116014|1800799024|56012099006|4143699003|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mHVGYanKr3NUzEN/9rcdcVCoeNPbF8b329vUy519y8ENDfXkXvXdJMBOJ2HQ110wzDcpsMJQo+juyX1ZiOjEQlK+qt4ItlWtH8M03LDS6nmW/WaY8EL9dApsP/cadwtw/bbn7nee9C3FjNbDarL94/p7QYlA5cU7b5sVwXi1oYydb8fVe8s2GUY41mrPV+HQhd4wh539vHGJ0DjwEoXXMDiteCCwVz6mJlD86Tk+XDzibb+oSofd7Sr1/4fJgH5kLVsrAjkqDw2uGEFzqHalyydjCEEp6z62KkYk+boqo0Kka683eu1By09aXhmkcCHqCCnEfSLEO7u9imwHUyVd/wAcURoEqdr3wJzZltmaQf76qjXmGao2nPG8bIWr8xT0lSuZEYfSwmnT+salWFNH+kaddEjbSC6TOcXH6ENiSUcZTeYIWuMqz8mRU0Y3L/njFkVCC+41eGJWmMDOW3POFeq+Qk/BVTplTdiByrUiwYMINZo9ZJvyoHhngTLYxFIGEbKMxv5VUXKygHZFSl9GjmBZePeGz6dG3SEY3cEC/WNPdJ50SfAozgpQgics2G+xxKtI4MaqcFM50zS+Weapn0UgLP/KC12kFbLlwMwB8eFdNOMku6h7sCCbBE/SBydaeTC1GXQqVpkV0hK1BmMGoQp+/PrPT+VRC3G0gO0t9O0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(52116014)(1800799024)(56012099006)(4143699003)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?97MMtu3b+eoMpgkvRYL/BASAnOTtfD66Cz1ZY1/BWrTiqYegpnxQIuQzYSJ8?=
 =?us-ascii?Q?UK5IN/zzTTs/z4ETgE6Gu7iRdWj55dOSiSuq3xoWVwaxGqCQ4saogyyvx5ss?=
 =?us-ascii?Q?WpK/RXK3IlOFJ9Rh3k/5+mXDG5peYKBqHPVJFg6DckOMcJ6Hbz6NYMsEyIQm?=
 =?us-ascii?Q?rYVJ33Lb0/QuVWeWtlI40B7OYv7mlqgTXZwdvfzMMTgHt8t74TTZXQODejkb?=
 =?us-ascii?Q?5O9Xcx7oJiWp9osBckMZjs0Sr/kaPzQe5xVx+E6JNuLixDGKLQ/+Qn6hvxWE?=
 =?us-ascii?Q?ommGtlmOS9nFXjFeF+6N/cWUnNlBli4xwp7UnKvxk1xsn12mIO0twYsn7xiX?=
 =?us-ascii?Q?M/0kcyZ9LL7Pg/ODpqqGj5Jsf7jycza0czYwveup42gHbavtD4FYol2/iJ0+?=
 =?us-ascii?Q?vEheEuc7iIM2b80Uu+gq9/ApW1zyO3JH5nNdh7q44p/0qdMhaO78vQDJ6rPR?=
 =?us-ascii?Q?YyzuAuJh4VQXpdDHoIj9TM+3vYhkDFoa5cqL3wQX3fMZIBP9jflw7RRdKF4Q?=
 =?us-ascii?Q?u+tYCEbINKtTAGeK+W24DuvV2BnJySuHQJH+dSg6SP9MBjAfu/XimTBbY3Mk?=
 =?us-ascii?Q?PC22VPdTqVvM+Ubc8Mi3iyJgrz0VXm65vJuNUBVpk2VlPmZWhVZSbM5SD7Fm?=
 =?us-ascii?Q?wUmZ5NML9ZXcA0Fq5siaz32mXGbTxUwl9e85JfU+krVGgQt0g1n2ZAS95lfZ?=
 =?us-ascii?Q?0ZI/Z4r0dbPHDEdZRhY7qDoPyCYQFuFJK8xR2Nn7wb3LLC4tw6BXS2tqsEpk?=
 =?us-ascii?Q?pYjKteqoCiBKXFhzpeWMJMdwEbRHJrctrGQpemik4vMlD4gjgJe3qinMgP9y?=
 =?us-ascii?Q?wuOSQsD9AKDs4fl+0zHgCS3QDTxgk77yj3C5CLXZ52cxG6VSr9CnLCQaU0Cs?=
 =?us-ascii?Q?IZB73Cq8zR8N9xMZLp98t2q9c2BqsunX7QAtKvMK63S0i4rGfxm6QEAMa/Kj?=
 =?us-ascii?Q?vFOweFH+PrPJK1QfFOBD2O8wzOKHmfCFZGMWTT3/21KQe0f/Va7ODPJmGya+?=
 =?us-ascii?Q?Vz98BW2RWsBHzg8tDgs56zzILl3WxznSyNBLiHxiG9zooM8h+YU5ffaYH+Zc?=
 =?us-ascii?Q?pj2cycJ5Lww68YtF3t6QYhyATKzJVI6RGMLfG8oZ1jPdq3+CfF9sJ2yTlGN6?=
 =?us-ascii?Q?B3l+LLiX16jaNhvUaE/rGwb2+puLC99ccnPfkqE42J44Wij9hzVBBHlN/ZbR?=
 =?us-ascii?Q?DNltCQ1wfIwUgmAkwqKHA07kS3s9AUc7c9OO02/e5UntsOR+p+vi0wXrSN+u?=
 =?us-ascii?Q?OFu5asfmjWKNS4An6HJZUH0xpIGbKX3hOGd5wec+5U1PpOqFPKjgj4Ch5UkH?=
 =?us-ascii?Q?SeBkmN2uapg9A9zoKi8k032ThG/5KpZW8N5XEVPg/uDRBVxEdW/WVvoO/kXp?=
 =?us-ascii?Q?gBK86sPWd611yM6Kx18U27fWmiCMl6L4GyBpOLddYDqBT7LAMyermwU+Hi1G?=
 =?us-ascii?Q?Pwq+nTMQfs5b3X8wmxQgEX/dyXG50cormDfw9aNiozYwdFslNjsiXi9912TN?=
 =?us-ascii?Q?wKk09Hu/hEEj8R04t9iLMXmlDQ83KxEzTLIl43RCBJKPPvqLBEeC1d4HRKqs?=
 =?us-ascii?Q?adHD0fgSk6lOpKBJ6eLqglsZWsqvhHxJ+oVf78XlSLgEnhFN1pYVh1xRa4DJ?=
 =?us-ascii?Q?obtEe0oq7AU9Mk1pgn2btD6Vcqy5e+pN3KQagMY3bpwwFHBd+CqG0iLQ6hpz?=
 =?us-ascii?Q?SpNA984O2A1LnVnjgxCivzBjwVwFkmKMQLp5Bkf87/ltY2VcYAesIT/F1UTi?=
 =?us-ascii?Q?RNVWaSOAZmDxAUWA+llV295mBl6AuWjzTzeNOArBHPbsVWEqhCWYZdm6fbEO?=
X-MS-Exchange-AntiSpam-MessageData-1: dKLbynluZG1rfQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0898397d-415b-4956-8b48-08df1323267b
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:16:20.2027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXLvTx3xM8F2V8LFy4JcN8tjO5bO25ksD76CEMfEUD/d0LyHYuNRJK8PzTsxKyiOdO80ahlR2R5ty33CtUgXag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4525

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
index 61e98b017..6932211a0 100644
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

