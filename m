Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021088.outbound.protection.outlook.com [40.107.51.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7077C33A9F8;
	Mon, 28 Sep 2026 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597755; cv=fail; b=BofV6/szRe9YFLX12AmalBji+9U3ufkquoRk7BbGqMRYSPYyO2R7Dk3QUlKNw469MCdk9kMxmL44EhONSZ3jVHNFOf+AlyY67fKz3NT9Aoh5Z5eWnO9i59KkK4oZJ+Ehukuw9Eta1ji1WzVvg6TCFk5EAf0hQlKQiiHSYae//oI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597755; c=relaxed/simple;
	bh=eAGP3EP8G/MV3y2Oircj+kgPDV9TOLFG10/b2bYn05s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QHzYvALpUsCmwd9o80OMGqdB9qwFvhnDIIBqFf+EubywlnSnVgbqh9unduHFM1GxZwI+fttDTEyp7GxmRhKySxFv5Ydz78QlytDj+AvZemA3QPvB87f29NQEg+Omfr5ZIP5CMGJNTa99HmRGQw5xImRmUQpFWS4WMu0nbni5d1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFlRNStwFEa5JbB5/R/wCEl704uyHu/4bi1pSd8beUtZp9J+aEtgFOF7DDmtcbl91Bs8ZTHlpSru/9sQ9t+G05ZlAFsKdoN7PaN+cKSykJPufr1XuxCss0UsY/911JBHQ/0zVzkSOsazgNlfZbvxzWDUJRDk1RvJsQ93O3qZX75iG4odioYTsGp1fzfDEDS+GONTQx9pZ59yzdVIwFUjPyDVa6ihDXNV5Mk/jG2ZAFjiW4+1HZs9h6cpRjftggYsLxOJMLZE+dimT3OIhKsElIeEAcht3xlQnPn8NxxKoDMGhAl8vG+nlLUgY3tQBKc/JRkby7aQy+gKudmbPMPPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AKzdN++uwF3jy0fSJ9Cvjy3pqqyeviCuHzHLwiJSRk=;
 b=qANtajVYU8Emr+90ora/RoEE2DFRn7+iMIWQoK58oxqCZIdYtUwnzFd5ozpZVxVItadv/Dwj0XRhnzM40iFsC3Rvsk1Z+vIPX/BKKMa2w2J6H0yZnv2alOZydSV4SgzMFQH8Fl+oo/4PjclGpyyIxazLK5AULdxDxzfJ/P/iGlwiJJd7DE/4LX/95mtFjWJ6fIzRKmlbm16HonRuLJFOERoczcrPGmRPiqEu7/PiUq0mYhtGPD8Mj/jYE7SB8UmBrbMDleaXNtvVU7LaETZ/HVJOtUbH+jgfC2NebHujRklWcENdH4MOSAfB61+2bs2YXHAXo3hSLTcSq8t0xjBsqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA0P287MB0267.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:15:50 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:15:49 +0000
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
Subject: [PATCH v5 6/6] media: qcom: camss: Create the source to CSIPHY link per endpoint
Date: Mon, 28 Sep 2026 17:45:08 +0530
Message-ID: <20260928121508.1404808-7-hitesh@ebytelogic.com>
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
X-MS-Office365-Filtering-Correlation-Id: 01cdb8e2-fe0c-4dd1-b967-08df1d5a3bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|10070799003|23010399003|22082099003|18002099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	KFxiBb2KAO10/aneHdxACepJEVaoE2Haho9KCAxfM2P+qUTlsqsppbAJ/NYESzOYui1r30kf/HkAktyfRv8HldDWQR2qimdpV03mVyFkkQge7OZg7JKCti1s+BDE+fHjg8rLEFmVnS7tkugME0Yz+mQlJxe379dk9u05QG25m/87OqmFMZhemERHd+NgySAfEp7nGwqwZF4WOGkmgYk8ssQUimZJTbKP6CoubwoW7FH/25I1GnR4ZypDp0GlCVdHwpknS0q7AWG+Vpa3CZLCoReLx9VkqQ7v89AA4PgsJptwJSJWj+yrwGcEoB8r/RVsLBuZ4lXr4+GUtyr4mBFBFXLcjpEDcjp6isUasbZmXfq+96mI5jvqbl4lpkJrETNOWMU10nU1qZnSmpXP2KES+0/tSWRTSnU0hH3W/8/pFfBsh4mAasCA8A0gqhQftyr1qXzy5+kuWXBqn04Ra5ekyBr4k3z5+zS5dLGPT42X0OWcrBFiQI8TVTaLDqyHxXuwQqXsVv0CTsx1tujdDWTqfrAZyDIPumCfoJH3eiV0cfvO+ZCS2bBaiLdtVlz408m34D/Jgps2AVTSClUCdRzi5FRKbzKYBxDYERYHHibmUEpbzgjD8ygwMuzeuMCzikKOtpS2fqvpQHebJKLzHqQpJnFvjlNvLzei1D5pWOHtR9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(10070799003)(23010399003)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?esazZqg0TvcH2ZbSTxeb9de7liJnMzXh7UAHDSgZTTqf72FzRckznWF/BmSY?=
 =?us-ascii?Q?MOemQic98tQGo4ZNIGCcfBST9klWZy8E+qQWCUj4b+uVyEfdTHq479H4Xx4z?=
 =?us-ascii?Q?TuJOJ77pwo1UvLqY13F+/l2UZCZByAFZb7adVP+ioRZvDpfZfPsggJGkGqj8?=
 =?us-ascii?Q?bYQWxoKw1fV3wJKeL9ffVG3RyCcC8dsnNHwDDOVqsh/52wnVYsJuzfydZW0s?=
 =?us-ascii?Q?TKDXnDEbbKAEXfP944/nXPDebT71DxttEORgSLr1Y8qy7yIt8vb7MgWqL3xE?=
 =?us-ascii?Q?IsabnK9PzX8o2sb/P/ZmoqAL25lItgDN2hgytn1MT+4qw8do7YSNkUhf/YiY?=
 =?us-ascii?Q?wZpyZihO3HLCbcZVRCdrUtr0frfHBlFDCjZImgzI9TJ5ctps/PfKraY0zZjn?=
 =?us-ascii?Q?7YInHZYNyCZ6hjjU8GnzXV2I32eIZEwZcU9UXpK9Gd/yMFimzM+eiznFSBEx?=
 =?us-ascii?Q?e3sRnSFAOivKboOFS9yGvLZeZFCEfuMon5ylgXlP7q43glGb8lHvd2ypZOSo?=
 =?us-ascii?Q?afghLbfJ6fAus7B9pMy4oSi9v6zBUjfMTtjUzOHNKvhFqMUT9H7kvxiy9xgP?=
 =?us-ascii?Q?DoTwMWNx1o7jlSz5NKAwaFOrr/w9crmatPNeD+aB7CQPxa4TCCFn2CjWobkC?=
 =?us-ascii?Q?FpvblSPGHtlpz12bnwn75VI+YzmbaheFFgB8Mqa5COdKOhqjz8TKs/KQLs2I?=
 =?us-ascii?Q?zJTKtOhDplKdV+d8Qsjq8qgIRvLn5K3gfTyruQ6rEP9EQDj+BGxHSR66BEqp?=
 =?us-ascii?Q?Yq0yMUYPkDyCfzypcY76va0NAw6pWNoCg68ySVINssWbJ9oa4rRwf3iUPVJj?=
 =?us-ascii?Q?zjbjZSFwlN/htR7efinhPqbZs6EXYE1zBVXR2JWKTN5tRo62GIWXkjMJpc7f?=
 =?us-ascii?Q?gQuSA56I5UVxk6nPw3Up4Mf47qUX54QQ84RxgX6lGiQmTKmDC6V1euAONmdt?=
 =?us-ascii?Q?rKKzFJBpDJUcBuuLaFY2HOv0s0yNUnOUa1IH07h58JLxu8BMZb7HtT5GfP+r?=
 =?us-ascii?Q?JThymElR470EguYae27QIQG/vD7Q/m67Ti+8ckPY3JGE+HYBCQ/gQVSWBqPq?=
 =?us-ascii?Q?t0pLs6JqdjA5h61sBWY8Z+PWu92AzPVgiR1tbOf5necNfItASxW+RLgDjR4L?=
 =?us-ascii?Q?PNjM7wbxcqLBdaY9F/7BwiStSTs3vUBzppwycz7i8m2b5Xr2uupJMCARcbh7?=
 =?us-ascii?Q?A8bupiUI838N5bR0yPJ+gFLLRBJ/iS2GAnylyGESIyvhKeDz6/aalc5UTavt?=
 =?us-ascii?Q?EvAxuE+p8PJZqoZQ5C1HyB+orpL1Iohoq/oivbP+s2YQTG37qzlzRfnMnEcn?=
 =?us-ascii?Q?EY8C/CaX7lO8NEgefqfHgKMTSy/oz4DMHqHkdTdc5YJqBbNq4W75e1jqlvE6?=
 =?us-ascii?Q?H5iR2Ih9DiiyObOfPcEEl0BgDdmtXXeAHkXLqyA6KxtjCFArGfudduwBa6Mr?=
 =?us-ascii?Q?USmH0p8T1bhAItcNJSVc5GxQbb32hMB/ThQtHo/pJACLvwEv+SPHf5D408WN?=
 =?us-ascii?Q?ytnPgoWLO+H45mF1wOIhV23i6pWnv7AJs25cVIRUXtbPxnJB0CbZPm5udkRX?=
 =?us-ascii?Q?NhU28/ekRrJuEUGMISJGD/xWDVJg1P8TBOkeyYzpKI8JfU2zHYqn9CBMGGp0?=
 =?us-ascii?Q?t1H7p97JL/BkyFeYSoJXW86ruorKBQIVxnSYMBENQx7mlUQY4Yg0EnltzfF3?=
 =?us-ascii?Q?th3DYhadj+nkRIVb/R5fw1rT+UZsCVR0OzD/s143BJc02vZwW5vMDWEI9Zfg?=
 =?us-ascii?Q?t/V0wIW/d9oMyBkUa1+zReD3qym/WyWZqRhwW8loDSGHOFnRFGoUapMdd0KX?=
X-MS-Exchange-AntiSpam-MessageData-1: FHQLK25G+5oDlw==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cdb8e2-fe0c-4dd1-b967-08df1d5a3bc9
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:15:49.8956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vo4ARVN1+uZgFv7EsBGeqwm5ujcFO76tb/bKt++sptWrIQ/YmGew3IHLdYdZ/3a+gXhkBeCg4vMPuBxOI8VjPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0267

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
index 79facd0133..552d2ce954 100644
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

