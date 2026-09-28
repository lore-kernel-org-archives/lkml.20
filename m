Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020132.outbound.protection.outlook.com [52.101.225.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0291B453A4F;
	Mon, 28 Sep 2026 06:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577844; cv=fail; b=UH3N4Vwx3RS4LpMPlfKFBqIW7j2qz2D0o/BOZIn80tWXDgQKCzz6trQm13xKRUQFJzPAag2LD43jnSJYgt3Y3SnDGD7fQOMibDCsjnUE4GAh76sPNz4E97C704yDftoDNxRiWxu8pjsDuPcQVfiI0Zz235Nt6hTPm2Fv8LuV4Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577844; c=relaxed/simple;
	bh=0RNemxBr1PDb3U7J8o+YKizI91dHt/DXL6Z9AvqXkxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ifdxbc+8ZuVoP4M2b1fIXxEkGf+ohp9MENYC4CNNPDvtSYlgS2RdVFeSRSmmR+SOD6JGPs/cWCO3fIn7rdKHGkPZQJ/uemRLjafXSei6MOZI5bnln/9aab4IZPFZroNpEKMJZ/hUq//WgB0NYYWI11zgVmG9cYz47N8cvgP34Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQS3X2zKgpMdwsO004A2X68IchEpkzBQUcHUW9X2Nw/MWFd+M121akEIbitN+ybz/Pgvkw41Mi4DdfOEjp7yjImjyvLQDs/KfXGNKs2xqCllo+wtZidx2gIg5jXCSwoFqsjZPM47XJzKbf1V/yzCam4RyTP+NrGPi4B3Ew9tlkxkM7EDPQexwdidJxL5ZNqbMErqYfV2EjzmZp/pso6XaLbVFdMr6av6iRwsSkxwhhoepwov3uEARk8coLOXQcx526LhjXzJgo9yd6P+5ky5t2/Xqv/7LGbPwrOZJd07RwszJIi++l2DaU4yaBN5xsyXvnmc0HPNNjPE3x8DBER/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcqVma6JmGYMMdXuV/0/KoR6ja2SZgU+Mypid0YDvRY=;
 b=ix8/pnRfWaaTNUPJFVfjXjSoKOOBEoAHium0toL0UB+78emHwpCczVHrLEThhHXTHMizb8Rl5leJvrRoO9jczBMQKJcaRtvt5TMAzOCRww13866MFXIBPlsN/DkwpnsOS/BWPivUMDSf3yO/TFwQtD3HB6QML12q6t0gCw9/TpyuqlnsahreQos9h36HQw/pbPk0fEFNytjqnhobrneyDXSKQJ1zvJMh6fkbIcn4G5/O8/5D4q/gWfOYUpKHrzL9MAtScwTcFvnmYqM+dmGe0lYekTeA04yKuo7LIkr+faruOZ1J0M28ULEnQNfd9Tjv2sOML9lZURMQmgameo/fBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PNWP287MB6163.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:333::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Mon, 28 Sep
 2026 06:43:58 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 06:43:58 +0000
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
Subject: [PATCH v3 5/5] media: qcom: camss: Create the source to CSIPHY link per endpoint
Date: Mon, 28 Sep 2026 12:13:36 +0530
Message-ID: <20260928064336.272659-6-hitesh@ebytelogic.com>
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
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PNWP287MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffc102a-89c5-40ca-ce19-08df1d2bdfd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|52116014|376014|23010399003|3023799007|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gktmIanFwmW/CL9FlRFmjfrj5W7k5pjnz/RRSMAx6eA8mssDQiTJidhyIqSr8pxdPOxD5vu/cJ3fTqog8sLnm0egTgdMIUB6aFO+PCfRmXurGd87Sj8ahSLM75t/EWXVRIsF1eT2trz8J3YqiOtl3II6TE0EKmTEFuU/NoZ8elyI0sb5B5aKZSrR32xMmAmrqsHmDdClLwUByZmkQwa6irZuAL2A8Gn3n4SgQWGRVGdXc4qslcBrmL66RRM4QCj8XBIk2DlL+25cc2/VQgsAFQ1v7o0B0DK/c1g6j1wQg8IhbOS59hQyMzynqaXP6BCSkJzXDA0y9lQEA28EiIQWQutCgC96Tdak/aK/bqS7W+oA2fqj2Rn5SMLkltHxCBPCj+T/aeLC7716sFiuTYN/MkyMsRLrXJngYzJjHQOTmoC8ZeIn6hde/Ms/2m7/y2lflTTi7r3oElSCAKx+odREZghKxlMz+6nvZZDi+HbPjuHoB+ew1LEy9AggX7Qt6uHyrUz+86QUvJ9OWJaKeP2Wk9wlScDK02rMAPJjD7KMM228OlyiXuHfTUnpzro+eBrNG4yWYCAS2XLH16YWk21fzmErdCb2T+PuA28fPD3or1xl7VHg0rPnnqtuXoZXHZKWzlWRnHKexpPo+TVF0rkaArepwdbMwSjnMU4/2FeO5hI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(52116014)(376014)(23010399003)(3023799007)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y7w0QejetIvBfDfWDo9sN/IC8OW9ieTdg7rfeN6QwdDHrX7VCL21aVgI0JQX?=
 =?us-ascii?Q?jMGru6EKgKABj2mL2UbAF+FgyPNpFlVFEobS1pIUDkNcEuw4vB/bLqPhKtAH?=
 =?us-ascii?Q?Fem1GWgkC+fh2JJ8jdb7vSGqg2l+VwDMWWhEm1qteYqmHMG95LfdIUSSg+OC?=
 =?us-ascii?Q?dWmfG7OILAa51QoliUQvaGuvPV37L8qA5V7dG7e2zTagDk3C7vkoIyJB3N0p?=
 =?us-ascii?Q?ycSTXEAeMccSrxGGiy9r1W6ZOqVq4uF/pk2yDAVTLObEVz/gJuy/ppCy4AEv?=
 =?us-ascii?Q?cOlmhMX4ULCuHyChlutCPc8VVcu5tXr6agCr5jwptZdSOqXYozX7pJzSUcQK?=
 =?us-ascii?Q?rCvDFe7iWDSwbHSmFdRti3l49JtGx0RANO+bQitVuDjubGe+yx4mawlIdIg6?=
 =?us-ascii?Q?1s33Cw6vzbLd+u0l7I7mOvba8FFG+aZ+9tAYb/WLBX1sGxU9dXFYxex9I9Rq?=
 =?us-ascii?Q?8cHa86fIqETakwKgZ/knpOmUN2wHlAKvq4BW+mGKj2ppM4pKfG5NGWlsJJWk?=
 =?us-ascii?Q?9MpaXe4X7ZA0Dmsj+zkEzq0ui0VLpIy94MY1AkVFK3oIs7Me2doYkJTd/cYT?=
 =?us-ascii?Q?rAjYDAINxoNgeHx1STx/4/0r9ConrknZnSnfNv2kLEK6zk1YWqClUNjCn/O7?=
 =?us-ascii?Q?2VzCT2G8ztpQnEKE6oyJrs4XXBOoCSpr/iLeVX/CVTYsmDfIgEdtBDyKFFlX?=
 =?us-ascii?Q?FKD+7XStOg2va66L3uqHHAQI690WY3t7PU2CMTzBAqbjCtMeMOTapAQcqA2f?=
 =?us-ascii?Q?4WQvZMz8D/8EmxDBe1OU2YVpR5uWADol5Kz3mWjPGmt4Z8p6N7R9VghXfRnE?=
 =?us-ascii?Q?0YyQ/K3VzsSlHvGt0aLw9diU0p05ga0tnrcWqvbbllq0moETOf/B5Jufl5mn?=
 =?us-ascii?Q?zHbpgxG4tBo4UB/EkNOgTYIo4MYx575LrXC3hW5YdKfKAPbj4Pe/pNSdsQ0b?=
 =?us-ascii?Q?LeGW2H6nHc9SN7nJQFYWX8bka/7nCrt1XRdQdE9DBJp877oQR02n1fSPWTXA?=
 =?us-ascii?Q?v2fXQOPqWsMjtQYlpMPFlcM/gmgpNxq1hI3zq1OVO3F3RYpB3EbPwpqk3STm?=
 =?us-ascii?Q?+PWl2n/BgOUK4d/vX+hj7KLU60sO9TwTqhycXW3wAP3+UJw9iVNM2tA0QgPI?=
 =?us-ascii?Q?Vg+vrft8Y9eDMsIwykJYyd9YCnC30laBBdEGqdXt4MIBYlQbtrCs7YssH6NI?=
 =?us-ascii?Q?3UoWLVvJ1Pgt4K7B3rtG3sTOEsE//bhEKzmU9pyjxjiYzbB5A1e4nJ0m2Tu2?=
 =?us-ascii?Q?YlqDm+b/Hy6tVnONYkmgqaSQulAaVD29xEzvaiN5gpD4WZ4pj3/W4LLBxB7Y?=
 =?us-ascii?Q?uYy7vrADzXdP2M9KAzefFp0D3CnFHLlgAAWg3a9tcMGANjgt0sp6V9t/i1Ku?=
 =?us-ascii?Q?A3GRymNdvt9GndQmX+JCemFvbIO2V9taxPXH9X5vLiWH+w8e5WswPwIDwkgB?=
 =?us-ascii?Q?sRxyw67QIQD5bPvl5If5q9HEYzrRXk8H/Hez9W7cCMmWnzYqkAkhCrIfUzeJ?=
 =?us-ascii?Q?NiJ5quFi0r33dJa1rABX9a5aAEAwMyqHQvnnWj2C70z+G1df04nogrlQdyH1?=
 =?us-ascii?Q?9//J/NX7psY1p4OUSXhetqNpQ/Rclu0OGDVy05I1p0xcwpK1JUOfR9XWBI9B?=
 =?us-ascii?Q?WR0qG4g1G+MBT0mQz2b/w/A3jXZLu0W+mvuZPK2kMGGvpjckcZ94HTIiGizA?=
 =?us-ascii?Q?t3emyDFiiv3XUSi3y2Gl8ywWhMEBj/x8qg5dMEKrsW4KYK+wkr+CxlKMk4g9?=
 =?us-ascii?Q?NTRQjojjrQx4bAI0ZTh3SSJFgkUw+74JJZ6egTTYZ7SRQP3PyPMk0Bn8gR+J?=
X-MS-Exchange-AntiSpam-MessageData-1: MV/omkN4uALMHg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffc102a-89c5-40ca-ce19-08df1d2bdfd6
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 06:43:58.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xc81R6aYKgnobvoUESMSKC0wJ+lvxDXHTdZLmCeOkMKA6MgvZGX0JfnQMF7z62OZ95/+/Rz9ZkL5qepI6qhf4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB6163

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
index 327ac7b280..cd9b66f265 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5224,49 +5224,34 @@ static int camss_subdev_notifier_bound(struct v4l2_async_notifier *async,
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

