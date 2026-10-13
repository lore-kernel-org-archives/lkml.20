Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020084.outbound.protection.outlook.com [52.101.225.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07CF3B6C14;
	Tue, 13 Oct 2026 08:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880408; cv=fail; b=sjGXXDCo2EctTpMevGBI/W8DOAagIwbar3IhH3FCYJEeMPARMO51OJH3o8dmoS4rXjJl6VZ1GjG12zqewSO34Y4B/04h87XqwU5bP274gCmmjXrfXFHtBeyn2NuuRmmPj7tjW3hSqb5VJeUtEXipx8VY9TY2tmhn/jvcQ+7dCBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880408; c=relaxed/simple;
	bh=hWf7J8d11paALjPjN0xrrMHoEG38Jt6YUMAp4oTAn4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YNYQ6IIlFTAB6/Wuc2FqfiUZsiUMfpAvjxF4fOnXzJoDZ/L20VxflCnZOY3nMMPyfcgXxuYBr+IdzFY9fvUV7jVBDVHt/s553ittykQ/bcnd/BGBiOZ2KonYFKDB3mWQYhQbOX34jAi9xgckEOYlLt4NdKs+UsB3YiJH0Ha0JwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9Lqle5VSVoHIpsPBf/tOCmI/rQ6DyEuOIYMP9EenqGFrbIBtjAFaRGEnuHDPCXpp517wlV4JTIkOKg7lj1JZTYDUJPyG1IFkWwwBhqqn55NybH1a5i5K8bWgcTq3uqtXSyTYMb6c5Y95Ql4TNlPzxvyuCjauOf8bi3/PbcuLp7wMBRec3EJg3ZHzhSJWsNXD5hDY/T3/ufPjoUSU8wiSdlGiSp0OtW9AyFh6rvmOh7hNgYNqyJ5RH+6dYv8zlNs1uPyc/j1JkDSBfI4fG+ShaIOeualbtXOKLcnXPZLbLuAu8PoAcwf0wjwZqoC/Zw07ls+jLBsatgSjKMVlNVMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAr5GpuLCFiYfc+EPKEhf6UT5D+rtG7iwZqvB6h6UIs=;
 b=Q0A21wdWkO4huBiEPmdiBGrIvSA+DnGvMT/MbzkrPSXQ0BUWB9ff9+dH54bl7JD1mpsTAig5083X2lEnbmwenJbjiGuj+jjraJqyOou06f4/AM4yAEu83n+CUDNmTLJ25cjTlTzDzsgNU6whnhBoZHBS4LyN8ietPS0PqV/0a1hugWHm4ugOdATwhXyrk5qTV2kVgC1YdkWajHodFOidDNwcaMmAbE5xkyLS2dA6kSfThD6yVcuDJeqGcl0sX/TPgmGSkC+t9zY5EMZG/J8W1Z/mdJNrFU0ZKxnTAb99rz9Y7sjlGUvGrF5O9d8ur0rGS7UGYlRm0cAGvWMXGuSMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4631.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 08:33:20 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 08:33:20 +0000
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
Subject: [PATCH v5 2/4] media: qcom: camss: Set the streams API flag per SoC
Date: Tue, 13 Oct 2026 14:03:04 +0530
Message-ID: <20261013083306.1132036-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083306.1132036-1-hitesh@ebytelogic.com>
References: <20261013083306.1132036-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYPR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25b::10) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: a999c900-86e8-4fb3-93ed-08df2904a2cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|52116014|10070799003|5023799004|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jWQNf4M911VX0alUkA4zJB8uwDGuIfSI7z2xr1xbFq5Af9VAUPlva7AFsK0GeNdRFRVqq4V8reII3JxbayoI4skcngSvXCoJPAZaINBiFVuT5IGf+jgfknafyDej+yV3MBOEbz9x+iLe33enSitlagYwZ7qmWoJhW8iwViukqvrZSd+OwAbjO46tcU208ASSw5zYMtDapj56QJpp5vzMrCUJHV6dc2diQKTQUNj7IVIU1KdGaO5ISG85ziPXnkFE+douqS//07SZUJJfps/wN1B4RQ/+iiHIFMBftm4HfUEZed2eLOwXwvkmDyPvJVdaX86/OftIWiNLQW2T41VZE80R5MwIkL4VM2FOFkZMpOhD/C1/r/W7e+p7xzu1PvMjDDAmI3C934vZURmuGonIomM6pCxfcQq7cgFtVNk6BMCMhR7fWdhKOrs/i65Lrt5AvMpscG1hpT1ITmESrIlQBTbDCWeKJM2i93HuqscSTlsyhPGVZVjV2iuMm72OTEMOMM76bU6clbbvctB/QfGgIp5U7b87+musFEG05VOaALWXeoamdirU0hylrhQ05wbO1ybX+WWolDjOwbZR8Y8pFuMZxXn3AMz7uSeDCc0n4cN7i3bv5pzZI+p9hbdmiqGjl8wPP/7xYGSgI2/0B/2KGBkQY4bzRW15NdwDQW49Neo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(52116014)(10070799003)(5023799004)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gq8HIqJ5bCn0kU7W1XuylSByKeIfSp2olmqpOiEltCwDEw/wovXCWTFy6Agr?=
 =?us-ascii?Q?X0b12RUPdW/rFEnJA+GZsNrxVaTmOWsjJ2TYmnc4fsn9dBdZ92j4qCyxrPwl?=
 =?us-ascii?Q?TSO11xNLdMV5SnjglIJzd5KKUcPm4tVxZvvNulIdPvUX2jlwrw/SsK2aNCF5?=
 =?us-ascii?Q?/KbMaiCT/KOuQWoHKhIqMKmMHp3J/era5YgCRj1JmNItnA+OZyPZFGlaEhlW?=
 =?us-ascii?Q?9Lt8FbH0w5yyK3Dr3mib+QpM3UffqrJnNqvTJiTtQm4ZKXLuVvtXn3InxNRC?=
 =?us-ascii?Q?ZjzpjZtO5FfIu6rGr6VTLC4kdEp2fW2gLW3mibqBW8SZQlOZwMABM+YxLTWc?=
 =?us-ascii?Q?VvOG4CkZ1LAD4uE5Bzzg4cS+CaesYNfLCiSGW60xpR2fc5x10qfafRil9tOS?=
 =?us-ascii?Q?RZ7QjKVifz2LbdQbQlrVWAt8JcopJdOvyEDUV80mJOPbybld3svIbsJoEThV?=
 =?us-ascii?Q?rOux0aiV6U+OQUu3SwfWdo12xBDNI9UgdkaEipcRjsygb8ckpty4cYTq6su2?=
 =?us-ascii?Q?a2TcfjQBE4Un0DvTYDuRc49GR1EiA+cZe7ooZ72kLnJ37pXtGJr6qB7iHzbG?=
 =?us-ascii?Q?z/7w+ISJ9VdsxqOGkxjWmD0F8WKunxmG8GF0htUp5uq0fZjE2ApuXsgnFiNQ?=
 =?us-ascii?Q?EgWLZ3m7Gk5d1dTqVUP7bl53HUaB+HK5h6q7f3ymf8AH1Hi8xR/3GFnOPBz8?=
 =?us-ascii?Q?GkygZCTqYPN1KmqyKgxRy277vcRXBHMf4AZKhY5r08Ir+EiNkEfmb3ynQr7e?=
 =?us-ascii?Q?r2oThwtmhpEAfKGWWC/y3OqybelAG9JdKGq4TE2vTSWFCpTJQSGB+s6uWdR8?=
 =?us-ascii?Q?XGNVPd5Gp7eF7WZ3qihFSIv6ACnW9kzDTISoPFOGwChdc2gWtngxdKkudnsm?=
 =?us-ascii?Q?7zYKuSuk8mjHJKax2rhWxdvoVdqtvIkmAZWc+i6+drhmjtrXeFETYMkCEHDg?=
 =?us-ascii?Q?Tn+195JeMtAuI3c05uquGdPtM/WshXw3SBjRygD48If7K6a3tSeXpeazT0se?=
 =?us-ascii?Q?VBkx5h161QdoOS7TGvdlwikZbqnosqnicwbUmuE2zkLq3HX9Yt4/85WkOjnV?=
 =?us-ascii?Q?hi83htRsvkAR3+FkGFRzGV1vkdhqEewBpiPDWS7vxbAotfBvAxLUosRiliIo?=
 =?us-ascii?Q?tpT9RpfgJet3NMIsrPaYi79tuq7Lz2ERrKE9N30LB6E5HQKWCyqDUJRewf5r?=
 =?us-ascii?Q?vITYSGIXn2PtuJrZPEnfPNICulxKpgJJ2TzkeqhiK6gNDuDF82bMcsLilmP2?=
 =?us-ascii?Q?gbN2mNviVanx0rNYdhd3h74CkjjggSYV6t/EGgpl7Zr6gjlyRIDGp1WNfRVm?=
 =?us-ascii?Q?KSxxM6GgJ/aGPwWNkCc0cvNpFGCmzkKoxZooUnnPkI6uYdq77i8M5HhHY7lA?=
 =?us-ascii?Q?ewesH631vccnXMPgYZSTZu0XNKgLJa5JmKSKwC1BmNjc/xF4mqZCAj3a064j?=
 =?us-ascii?Q?rq0XBkM0tRjOrAFo2sUYBZxqzD34tW1TPAkIJSaou8yHHgQnl9XHnyKgDKZM?=
 =?us-ascii?Q?3fupBaZ4syL7q9bkyjdTSZsYTbI9+h4nNsYODhbuk5En1Fxz79eN9PBMYpNm?=
 =?us-ascii?Q?Yd1GiuvjxPtw/6DIwVvrJfI6uJUWN+3YBqNNuUOsG0nvavfZzfh4u3qU0/jv?=
 =?us-ascii?Q?Z0NvgV77qaa81A7MdUzCESRhr/N3cga5uMGd3oj0fY2/O9pn4p4qxXmzH+hb?=
 =?us-ascii?Q?rW+Rmc3KybeHmlzVpVgSUySGqDG6k7liQ0Xf5ajHdu47dEYk/MOAbN2Nw/UC?=
 =?us-ascii?Q?HXoa1uimB5Vqa49DdU59L7ALbwd3Bat8IaC91+huBwc/PGdYRZU+uLSWqIZc?=
X-MS-Exchange-AntiSpam-MessageData-1: QcrMz6KoGFV1XQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a999c900-86e8-4fb3-93ed-08df2904a2cc
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:33:20.2056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qrg8jdcq8XHtHQR2mdlPPqMLFejbpFODtQynKgVUQMDtsTlh1Rt8iTFc5DgYyX9NB+8LcxflkGD+0rxS/VUoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4631

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
 drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 -
 drivers/media/platform/qcom/camss/camss-vfe.c    | 14 ++++++++------
 drivers/media/platform/qcom/camss/camss-vfe.h    |  1 -
 drivers/media/platform/qcom/camss/camss.c        | 15 +--------------
 drivers/media/platform/qcom/camss/camss.h        |  2 ++
 8 files changed, 16 insertions(+), 26 deletions(-)

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
index 81ca1b0a2..aa5182c30 100644
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
@@ -1235,10 +1235,12 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
  */
 void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
 {
+	bool streams_api = csiphy->camss->res->streams_enable;
+
 	if (!IS_ERR(csiphy->phy))
 		phy_exit(csiphy->phy);
 	v4l2_device_unregister_subdev(&csiphy->subdev);
-	if (csiphy->res->streams_enable)
+	if (streams_api)
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
index 2cfca1b62..2ae5bc436 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2154,6 +2154,7 @@ static int vfe_bpl_align_pix(struct vfe_device *vfe)
 int msm_vfe_register_entities(struct vfe_device *vfe,
 			      struct v4l2_device *v4l2_dev)
 {
+	bool streams_api = vfe->camss->res->streams_enable;
 	struct device *dev = vfe->camss->dev;
 	struct v4l2_subdev *sd;
 	struct media_pad *pads;
@@ -2168,8 +2169,8 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		pads = vfe->line[i].pads;
 		video_out = &vfe->line[i].video_out;
 
-		v4l2_subdev_init(sd, vfe->res->streams_enable ? &vfe_streams_v4l2_ops
-								   : &vfe_v4l2_ops);
+		v4l2_subdev_init(sd, streams_api ? &vfe_streams_v4l2_ops
+						 : &vfe_v4l2_ops);
 		sd->internal_ops = &vfe_v4l2_internal_ops;
 		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 		if (i == VFE_LINE_PIX && vfe->res->is_lite == false)
@@ -2199,7 +2200,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 			goto error_init;
 		}
 
-		if (vfe->res->streams_enable) {
+		if (streams_api) {
 			ret = v4l2_subdev_init_finalize(sd);
 			if (ret) {
 				dev_err(dev, "Failed to finalize subdev: %d\n", ret);
@@ -2255,7 +2256,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 	v4l2_device_unregister_subdev(sd);
 
 error_subdev_cleanup:
-	if (vfe->res->streams_enable)
+	if (streams_api)
 		v4l2_subdev_cleanup(sd);
 
 error_reg_subdev:
@@ -2268,7 +2269,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
-		if (vfe->res->streams_enable)
+		if (streams_api)
 			v4l2_subdev_cleanup(sd);
 		media_entity_cleanup(&sd->entity);
 	}
@@ -2282,6 +2283,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
  */
 void msm_vfe_unregister_entities(struct vfe_device *vfe)
 {
+	bool streams_api = vfe->camss->res->streams_enable;
 	int i;
 
 	mutex_destroy(&vfe->power_lock);
@@ -2293,7 +2295,7 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
-		if (vfe->res->streams_enable)
+		if (streams_api)
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

