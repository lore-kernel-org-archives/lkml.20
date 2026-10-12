Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020092.outbound.protection.outlook.com [52.101.227.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19897481223;
	Mon, 12 Oct 2026 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806765; cv=fail; b=CFlXOw2Z9QikFi9/a6gdiPIHxwYa+ZmEl6YHDQysGFUjIbIVKiVASs+5OzI4qOfs034aSdFLCd+0D/nv9JZ9SuHBDzPE15Uo37dsaRxxoQMvOsfVrdFMr9gF7QLNELNfPZgDfFql0Ebhs0sKJyCO/88SJZ7peqTPQSmrNKvo9M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806765; c=relaxed/simple;
	bh=cf0DI7gUyBk6qc0d6p+daMbEOWnCxkwduy4fhy7V7Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hpAf50mEFihwOG+HOnNocJUwygI3U2PnOfFm/YzF4kGEOsoRRPja8tABVqFljHyKiUEZdmReHw/g8IoBDX+qW/kGxK5wskkVXwUcAWSh+9MRt0+8Mn3ZkD2IbItgfsSrcWcKG+eoKaJERNHK0aJnQ92VUw4h2DlgDdpThYLRWG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PU4piDERH/FVh3u+/soXw5z9XeftUxER+f3CGy55MaQ/bc073GF0RdEfi/3nsCBdHGzDTuSHBVk49qPhH34sAWWAPxVuDZHjoyKD5iq9+w/tWDeWxOWBfAQx9bEuTtdfLGWAVu+4QesyNmNlOWnRwOikMXE9lxRqQ43KE1V9rsoHAeyj/6L9xriCzg29Hg7jR6jfA0QEKESs2IhqNI0CaqfukSY+c0ZAqk7rxUar4YvHInnFpDAQ/UJzVuwhgdMpjMD/Jb3UqA1Yn4ouHTwcpFcbNyDN0yQfhRX+SPF2oV96NNZjs5XFo1R4pYowkB7nL63KWMtkoNCmAxTDXAKPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1t2PTWb3U3CXJbOXbvF6jjqZ6SbRe0+eM0wyxS3OJk=;
 b=C2nF6DvUJxVE2p2QjcBLpcTVLuqxJiQdI6M3Y3O+wE2+oau3Yl0fs0MVkO3J4TgYnSlnI1VGes2D2+eMURmW0TRcFq1m5itkS4hY7QkWl/h7xkud/3ycMEMeyv4HcsRQuk+dSrNhDXT9HutJtOLQfrIJYVFHF6ESXThySa5sXuSau3VoiRAzBTUOiLfmjiQnD+TA+nHnK9Pg2Fa9nVKpSmeso1DciZ1lB0cTTXK5mST29DWTrraTCiASkDuEiqN7mDejXTbbMc5Sh/Sp9DZYDu0iLX5wAXAcHaFl36gNNQbGxGEB0x8k75w0IUUzg2xqh/NX0KmpCohZ3hcmphNnCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::104)
 by PN2P287MB1987.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:05:55 +0000
Received: from PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 ([fe80::3a7f:fb1:6998:b89e]) by PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 ([fe80::3a7f:fb1:6998:b89e%3]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 12:05:54 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	loic.poulain@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	atanas.filipov@oss.qualcomm.com,
	jigarkumar.zala@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v4 2/4] media: qcom: camss: Set the streams API flag per SoC
Date: Mon, 12 Oct 2026 17:35:40 +0530
Message-ID: <20261012120542.1140157-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012120542.1140157-1-hitesh@ebytelogic.com>
References: <20261012120542.1140157-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0057.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::26) To PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::104)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PPF076CDA63A:EE_|PN2P287MB1987:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e8d30e-4796-4c5a-0cf8-08df28592aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|10070799003|5023799004|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	CxRM4u6fxkg94QG3J+DlINS1+CQ8Q0CVg2Hd6tjQaL3Q4P27tYJPl5RAJLlfPvxlpj66eL0mThvVbBJKu/aoNdasTY9D9npoCkLSzHuaIzzd7R5JelhqVcMakZ9pcxUSsNYCvI9Ashl95f6aUyqFjCRCRN+MZSjQLe03GjNrJy3wpYzy/Vhe6hshKKVEG/maR/D/19LYF+Cv/AJRUG3n/0UCi/YajL6aWNf2j0S6hcFMjq1e7IK+IuUIqxal/swBBAIOccQKOKQlqNNbP6LDKCImmSXDy7OBWB6WcL2lBNZueKUCKdVMU0jqNzrB2huv5vgvDORBfy35CeqGjhHAoqODjKwcS/YqKzAM0Tv7LzbYQecBdSs7yWgr5JZkNWmuslvAtTSpSScVsOA6OFtSeAgIGZRpoFjjVSuD5XiEMpetayjXrZ5KJxh4rbqMEm22R6yisNMIasjEvHqEigYpqm/mI6yVT9ihuwkt693sPwr0yhXD4/pFwBGJcM5ZtYS6CbI45tUT3FPsC2XU81EtQNjsAtWFZ1g+b9Rgxf7Q1Nyn4ithj0f3OND6HsW/1G0L2xuXxRcNfduVDKb2Zfca5ZX6TMS/VtnU9kZjTvXhn4aqAXYiUYBY1ZOpzi1W1I6fnO9SXVI+ArhMv4wevJJXlelvK9U5wCSERTecDwtlGDw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(10070799003)(5023799004)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1W0NompUaFBS2mQINgmnk/JqyskMVhJvQSasMj62B+7ODVWTwB1HBG46PQwR?=
 =?us-ascii?Q?2AK5cP6zBfg8IbgdNqeKdA2JzDqzBj3T2VpZhbdhVejxUcfoprefLUcLICN1?=
 =?us-ascii?Q?VyTo99T96SDn3eugGn3gcL8jY51mzj15C6cwzhuwzCFa8oghSoZRIjUTyoiI?=
 =?us-ascii?Q?Guynn0VNSF0K4YXnNZ5BMhQAcvY9nUcFrVSgmg6C5WUjrbG8QN2M0HjQbF0+?=
 =?us-ascii?Q?vAvdtWQsfZq0n9ZHRgO1n4yZwz8eZyTTTFE3TEAVHVHf4x9GVDJb3Bm+qNXU?=
 =?us-ascii?Q?uhj9MRqws/InsY7PgGX6nJxQU0g6Q7YYrdv5cXKh2q05wepD1uW+BVLMgX7P?=
 =?us-ascii?Q?QvN0Vw1ZEZ5eWmyl0hB3oc8MrlDYi4Eu68K/a0KIrCTUJLZhsUrSTOFAHfys?=
 =?us-ascii?Q?WloTHhKcoDIKXvjAgGokgXF5NcVY5zVbg0DKn7JUNXgi5GIHirWifq5X9or0?=
 =?us-ascii?Q?PTwciusnTl/V50xoGTaTfPmrw5irksrrphe6cLgxMkumocLSbwH8WA9kezsq?=
 =?us-ascii?Q?aCHiypXkiXHpG7C5zVsvEezR8XwR9Mn65Nw1jBNUXDy8TjWdgI/MS2THhqb1?=
 =?us-ascii?Q?MQpB6OIdKDv0Q5wzHTEHScTgctgAs+YLRslUxgzjuGMM2ftJEf5bmT6PTdye?=
 =?us-ascii?Q?WuUBerPuYJHDhBIFHPRuosDEHBc6dcwWr5SW4BXqjnkUNHtz1jc79AaVruff?=
 =?us-ascii?Q?ZG7noBTHkMbxGIzEW0jE2BSd5f1CZBRYZU32N+6R59YDOhZ4+CTn8Gec7Ofg?=
 =?us-ascii?Q?80itNwOThvk9/fGQgezYXXvMcrP77q1GT1EITEOI6vIvOgtqk9p9kwP7Wbd+?=
 =?us-ascii?Q?1WdI9P5/T9vx5v1fKx02yhdXsjHx1dH5ZC9GDMUo1JDiKqlkjLC6dmDHQ2kR?=
 =?us-ascii?Q?GtCspBmqn8FiXNKRHAkvih5T5viVF/CaPXLBOd4wByUDefF0DGDfANdVcz3G?=
 =?us-ascii?Q?FkqOHSUPwyKDhGon03gPm2twVvZfzL68skYC12p5/lLcTzOJDRP4eddib+dE?=
 =?us-ascii?Q?ePGD5Z0/Go0P4cnIimx1ilSlsxzfGtO9nKHdtYA4ITNt+Ihi5nMF+PIRV3Z7?=
 =?us-ascii?Q?RmVpG0kU/BDku5XdgcPRbryKHF6RcnJBxYd9nEayWkKML80EHv2yENLwVtro?=
 =?us-ascii?Q?U+91k7VVyeX/4CV/REKyPTgn5jGn1gudvgbhmQoqzw5wlXTNqDuQpGhPifCg?=
 =?us-ascii?Q?Bc5D9mv0F8EzS/NRQ6K7v3+BnREZQAZEFroi5GPOChLVJ3JCwhuMseUdsY1R?=
 =?us-ascii?Q?clbzYiSVC0ZZnh/Uj4zhZOqmgQilGEIHjfDpNeqJUs5fQa94zXyz+vGJwQsX?=
 =?us-ascii?Q?nGvYAsz7nir2LR+oB9l7OEew4bW7LPMm8NKybDoPi/J+YK3hUyb4EEjq80fC?=
 =?us-ascii?Q?wO7Mm8o8HbM7srj2FRLRpJ+CRlCULAgSkB+9G3VrR8HynREdJHBB6YymPr2z?=
 =?us-ascii?Q?VSWQHO+ykzNxfbUGQHnh+0o2cVfarhSQb8GPuF5e+d99r4x9MSaTPt652nqB?=
 =?us-ascii?Q?M4RKZPf9QyAgkBfT8V1qMLIXKt41WzjeQygIhiN0XE74NwLyvvMRy+yVcXi3?=
 =?us-ascii?Q?CfRPHiGDhtnuc34g4oRxETkVn+JANsrdvmMc0r+rIFdm3aKIYCRHpN5vZI5X?=
 =?us-ascii?Q?fZSNfR+z6BZJUti1GWW0c0SFCpJeRw65HgKy1qx8t8xiLjg2Zgr+KK/NppGF?=
 =?us-ascii?Q?5IuzSn60WSRx+IR1vthbnsameiISmCkLH4bjQEH0EOvYRJGDQA3fyztPDwdy?=
 =?us-ascii?Q?w9ITM6AgJ+docoEyqeIztdwevV4ebLP5ZaGQCQkd1QYQtBqAdwRC7iJKbgLF?=
X-MS-Exchange-AntiSpam-MessageData-1: WRnso4gM1Qk8kA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e8d30e-4796-4c5a-0cf8-08df28592aed
X-MS-Exchange-CrossTenant-AuthSource: PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:05:54.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyNEc5kflMV8Q7GE5YbJUAPcXPL8Y8hw6JIt0R0nvnb0EaaKhc2+od5dlVK77soK+pPQb8dYbIUHuC0FMoxVjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1987

streams_enable was repeated on every CSIPHY, CSID and VFE resource entry
of a platform: fourteen assignments for SM8250, and fifteen more for each
further platform enabled. The flag describes the driver's support for a
SoC, not a property of an individual subdev, and nothing reads it before
the camss resources are available.

Declare it once on struct camss_resources alongside version, and have the
three subdevs consult camss->res->streams_enable at registration. SM8250
keeps the same behaviour with one assignment instead of fourteen.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c   |  2 +-
 drivers/media/platform/qcom/camss/camss-csid.h   |  1 -
 drivers/media/platform/qcom/camss/camss-csiphy.c |  4 ++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 -
 drivers/media/platform/qcom/camss/camss-vfe.c    | 10 +++++-----
 drivers/media/platform/qcom/camss/camss-vfe.h    |  1 -
 drivers/media/platform/qcom/camss/camss.c        | 15 +--------------
 drivers/media/platform/qcom/camss/camss.h        |  2 ++
 8 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 991275398..57c8f13f6 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1828,7 +1828,7 @@ int msm_csid_register_entity(struct csid_device *csid,
 	struct v4l2_subdev *sd = &csid->subdev;
 	struct media_pad *pads = csid->pads;
 	struct device *dev = csid->camss->dev;
-	bool streams_api = csid->res->streams_enable;
+	bool streams_api = csid->camss->res->streams_enable;
 	unsigned int num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;
 	int i;
 	int ret;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index a312103cf..20ea67b96 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -184,7 +184,6 @@ struct csid_hw_ops {
 
 struct csid_subdev_resources {
 	bool is_lite;
-	bool streams_enable;
 	const struct csid_hw_ops *hw_ops;
 	const struct parent_dev_ops *parent_dev_ops;
 	const struct csid_formats *formats;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 81ca1b0a2..cece9bcb4 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -1157,7 +1157,7 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 	struct media_pad *pads = csiphy->pads;
 	struct camss *camss = csiphy->camss;
 	struct device *dev = camss->dev;
-	bool streams_api = csiphy->res->streams_enable;
+	bool streams_api = csiphy->camss->res->streams_enable;
 	int ret;
 
 	if (streams_api)
@@ -1238,7 +1238,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
 	if (!IS_ERR(csiphy->phy))
 		phy_exit(csiphy->phy);
 	v4l2_device_unregister_subdev(&csiphy->subdev);
-	if (csiphy->res->streams_enable)
+	if (csiphy->camss->res->streams_enable)
 		v4l2_subdev_cleanup(&csiphy->subdev);
 	media_entity_cleanup(&csiphy->subdev.entity);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index f93971bb1..ca3160af7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -86,7 +86,6 @@ struct csiphy_hw_ops {
 
 struct csiphy_subdev_resources {
 	u8 id;
-	bool streams_enable;
 	const struct csiphy_hw_ops *hw_ops;
 	const struct csiphy_formats *formats;
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2cfca1b62..13cbce9f9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2168,7 +2168,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		pads = vfe->line[i].pads;
 		video_out = &vfe->line[i].video_out;
 
-		v4l2_subdev_init(sd, vfe->res->streams_enable ? &vfe_streams_v4l2_ops
+		v4l2_subdev_init(sd, vfe->camss->res->streams_enable ? &vfe_streams_v4l2_ops
 								   : &vfe_v4l2_ops);
 		sd->internal_ops = &vfe_v4l2_internal_ops;
 		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -2199,7 +2199,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 			goto error_init;
 		}
 
-		if (vfe->res->streams_enable) {
+		if (vfe->camss->res->streams_enable) {
 			ret = v4l2_subdev_init_finalize(sd);
 			if (ret) {
 				dev_err(dev, "Failed to finalize subdev: %d\n", ret);
@@ -2255,7 +2255,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 	v4l2_device_unregister_subdev(sd);
 
 error_subdev_cleanup:
-	if (vfe->res->streams_enable)
+	if (vfe->camss->res->streams_enable)
 		v4l2_subdev_cleanup(sd);
 
 error_reg_subdev:
@@ -2268,7 +2268,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
-		if (vfe->res->streams_enable)
+		if (vfe->camss->res->streams_enable)
 			v4l2_subdev_cleanup(sd);
 		media_entity_cleanup(&sd->entity);
 	}
@@ -2293,7 +2293,7 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
-		if (vfe->res->streams_enable)
+		if (vfe->camss->res->streams_enable)
 			v4l2_subdev_cleanup(sd);
 		media_entity_cleanup(&sd->entity);
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index d1c54a516..ae9dad353 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -138,7 +138,6 @@ struct vfe_subdev_resources {
 	char *pd_name;
 	bool has_vbif;
 	char *vbif_name;
-	bool streams_enable;
 	const struct vfe_hw_ops *hw_ops;
 	const struct camss_formats *formats_rdi;
 	const struct camss_formats *formats_pix;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 452afe16a..2c9c4ce50 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1954,7 +1954,6 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy0" },
 		.csiphy = {
 			.id = 0,
-			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1972,7 +1971,6 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy1" },
 		.csiphy = {
 			.id = 1,
-			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1990,7 +1988,6 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy2" },
 		.csiphy = {
 			.id = 2,
-			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2008,7 +2005,6 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy3" },
 		.csiphy = {
 			.id = 3,
-			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2026,7 +2022,6 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy4" },
 		.csiphy = {
 			.id = 4,
-			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2044,7 +2039,6 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy5" },
 		.csiphy = {
 			.id = 5,
-			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2064,7 +2058,6 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
-			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2082,7 +2075,6 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
-			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2100,7 +2092,6 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.is_lite = true,
-			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2118,7 +2109,6 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid3" },
 		.csid = {
 			.is_lite = true,
-			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2148,7 +2138,6 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife0",
-			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
@@ -2175,7 +2164,6 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife1",
-			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
@@ -2200,7 +2188,6 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.vfe = {
 			.is_lite = true,
 			.line_num = 4,
-			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
@@ -2225,7 +2212,6 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.vfe = {
 			.is_lite = true,
 			.line_num = 4,
-			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
@@ -5745,6 +5731,7 @@ static const struct camss_resources sm6350_resources = {
 
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
+	.streams_enable = true,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8250,
 	.csid_res = csid_res_8250,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index dc07ed5d1..5cfae3f3d 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -106,6 +106,8 @@ enum icc_count {
 
 struct camss_resources {
 	enum camss_version version;
+	/* Drive this platform through the V4L2 subdev streams API */
+	bool streams_enable;
 	const char *pd_name;
 	const char *pm_clks[CAMSS_RES_MAX];
 	const struct camss_subdev_resources *csiphy_res;
-- 
2.43.0

