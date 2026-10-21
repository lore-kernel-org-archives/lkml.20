Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792590623;
	b=zVbwtURYp1Ih2zWm6cBTo5IKal2pXaSkdJMS+prYA86uRqa/4sgPtnCbqvlIFrS+aIR5
	 E5EUaI/yMsLXRaGfDnqyBri53reVP8STTUBXdOM8mpAlGNh29wV0hR0276Gid8LCAXvi5
	 FRWEWsOPklowRgln5DaywBEHrdwLlipjgNPQ38IxrB7gciBx7HiVfMN8bCbWWVT9/t6wH
	 gJpxfHZTuWtJK/d+rPj4TOh4DDFNuBGcELBAz8kT9gxgil7I/C2Y0fyMA6Nx4PzReM9Hw
	 virRuU0cOTq0pabMdK6iGkC9fhIx/IhqMEFlXOaAFeWvsF0Fm9B6w6+ICkaP5g+dWmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590623;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=elKkGK3DO38fpzxzoNSxcOxWeduhDdh7AWq+YkK6cb4=;
	b=dTYn/4M6w3s9ufc2PvAZm+hgwK2H7RJt8a1kyeNlZ1V8z59H5Tzwv0XIFr6Bt7HLsGh9
	 X8zIU7no3JsFTZxrqGMcj5fL9+xzS1jQi4u0QVkMkZxX/C3QwE2smbWV5TTfvA0fFQ37m
	 r5N+NvF92mRjPJ8fOKcgqsuH1d/dewKSGIaMtXGtrtO7YaqwwmsT7lql+Tr3uxywZtTlw
	 TJatNPkphlsXI2hWEQCQtCbg9+BcoR/Gyu7NS/Kdw2ncH8ljyv2kWpYZbAIm2IgABoXQI
	 +r+bg4kmTeQDqAWTD+iEgVZagis3G0XJgQY4GZElO6JIxsdXXbW0md5gBYb9pBnM06w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ebytelogic.com;
	spf=pass smtp.mailfrom=ebytelogic.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.107
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021107.outbound.protection.outlook.com [40.107.57.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76E4606A33A;
	Wed, 21 Oct 2026 13:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D76E4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6Ez0Uayf9nsKSz1uSPwixR5VQ9vbfdIhtg20gzL7pA8ajcB1wtNHWJqzZ1tvxbM73+mgqddCeUl3AUTyG80U08T0OREVUsN2Zqw+1lHyWbHdZ34y+GRlr8f2qIDbe425ufhtgIVvFdGL/f9i1du4OObxFvAvRkySivaYBJTEchpugEqAZEMbaNudUvUDula3i6zoWcOq+qYalcCkYkbX4H9bjucq4qh6P1HCzMgm2qAcONmnIFJS10WmXavBj1hLi43WVDK+JnIO3aJxYVfrm1IkFQgcQjc7SggFOKMCCBG7n1u0dTpd4W9e1/FJ01cYWsVrr+oQJvr90BFw44l3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elKkGK3DO38fpzxzoNSxcOxWeduhDdh7AWq+YkK6cb4=;
 b=srmKFQXKZ4TQ/0civhDW/VKun9EYjXvj9rm0Rhb1CGoo5pAXtLNAXyJ9aIwi7jO5ShZw0kuCXeo2jQKRFoPMWrgDW+3mHq6Gl5OnE4gimlPJ7XsLsWilPMUh0uR3HPC9mQTDn+yyrsgUyd6cvjGSSCIvDiIYpHEMVyLJfIgX131QyWybO5L9yeUvUevzPv80QzdC1kuIZ2U17foadsp6Hi+qEQiD2NFu7yCmRI1kk+ip9qcTgDlELRoKRl+do2Kc2rpulfrxXUbI57HZgtXqUK2WuF5A6WitHPu541maJSdMw7xe1ohExYYT95NQo935CA51hRM5yiqPy6eAgdauBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA5P287MB4418.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:167::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 13:50:17 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8%8]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 13:50:17 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v6 2/4] media: qcom: camss: Set the streams API flag per SoC
Date: Wed, 21 Oct 2026 19:19:57 +0530
Message-ID: <20261021134959.2599575-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021134959.2599575-1-hitesh@ebytelogic.com>
References: <20261021134959.2599575-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::21) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA5P287MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a09e85-335e-4a84-121f-08df2f7a3d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|23010399003|376014|52116014|1800799024|18002099003|10067099003|22082099003|261009223027099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	zYMJmWd89EoWeUb/ONNztoimjzvzheWI0L2aLLm5UzymSYEKI1QmWLLLJAxM9Tv2F04Pa9kvbnRTzF4jYzei2iRliS+fNbgCNVEwU5NeStBszQ5FQ6honZxTxU26EsXkP7dKoH6Kl4AawqJ/AsCcZemKmTHWBRtucK7hOwiSFVk1LPcJ6+2JUvQsxf3IpAAsXslutRUsrI9Utj88UH8AHiyb7gRGuCbbaxgoDSL2aqGTM8ej6pmh2sUElL4sI4EjyZmVChzgS2QGsh0DYTwq4kcQj1lbsaMH7iWpU1xzErLXhfyyqiwrtqkIjT64rRLMWdUy88jf+ItM5yXRy+s0tfqAu5/17UtLVf9RgddhNFANrZhFPCJN01XPDi3c94kqwOpsiLWM3JKYrxbcnCMcbdWi/0M9JLi5MwgUQBK6v3Kl6fGgeXuu9+7PePzts6JV/y+nTvM6S850RzmAdiviHvz3kyEBbYZ1OgJzD1sUKH1mlsEaPus1UsZT790YAgqbqdqfLTpztsoiiVmhhBNGM+XTwR7JSyxKsXVRseZ0t8MMLC9j9y7sEdV/jerltmTX4I/hFRW5K3ajFqKCCkrQ2KFNj/RmVRdCW8VVdrzpqVhHYDW1fCQkB68nBktVS94m1iUupnuIqeks07C4rY5b66o796xL9QdCxIfgBETg39Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(376014)(52116014)(1800799024)(18002099003)(10067099003)(22082099003)(261009223027099003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wpmavUq647pkzGv6AQAXe8lZfViNMcP9iLDutBDY9SyxclpgvXeUCyCuGTkg?=
 =?us-ascii?Q?vubf5eUw0MtGa/6DhKSdE0WdYjWiRb3YlvBnt9BHqQTNro5cQ/Jk+Yrda7an?=
 =?us-ascii?Q?lM60bsGf8VcraR0gc/OIKYLoEKBPVry8wogroTbBH68Ez2JIiAVuD0DG3rL4?=
 =?us-ascii?Q?IuT0lBtBSv8+7oHkWvxHErM4rCjXD75KdmOMI/KAscvyYABrUc9Mx678XBrG?=
 =?us-ascii?Q?psZGEGeBVSQSn8MXTiyKsv1hIT1tYKuxqwwNhvOBg518PbkfSnNzi2kjP907?=
 =?us-ascii?Q?KCNjjZ3B2H/9TQT5gq+tatSbu3vwWDOSs0R00w+2ll3nYLASbe5X3K3MCOdh?=
 =?us-ascii?Q?D8ijjMruacmcK4dvcG241fbSDD92PcYM0pnGyZp3Bzzd7EkVEkpQhel4uKtz?=
 =?us-ascii?Q?YaDgNPzvaNN2kjfIalSkhanNuG1fA7aDm+Spho5HmEmCGYsBMJfRYmjoZfIZ?=
 =?us-ascii?Q?ILH8QqkUGXU6c7iRpFDZKPzCmIcZypjpoK84xfLSUwYG+kyz360YjJmbKIEl?=
 =?us-ascii?Q?s+qs/zMj6FwIwkaQYJuG5EubgKarJLUK8xg+bLD/ZOK5/41KXEiPB5NlZxXD?=
 =?us-ascii?Q?ou/TlSUatn7s5QjP4dtmjo0YT4Vrmu8vj8Ur4Cz+GZgJnIJMlJD0n4YBaZBj?=
 =?us-ascii?Q?87uPR4fUzMH4fhltF+0GcfPp4EWyu8g2YoPK1zkdqXULLSJWhnEwv6Eyg8W4?=
 =?us-ascii?Q?5KYJnrmbK7acgIaUIeoPqrxIfzAaqEQKJyu5x9x8nwnMsNLCG2r0AdDrgPhS?=
 =?us-ascii?Q?TNKeoUIFRUKg6QjnKAbql+cQmcVl8FIMsCkUiLc0MWBVE2SNpPSMPwvf9GSQ?=
 =?us-ascii?Q?HMxqy1ee+C6KjihpshOBO8gSlz4yDdVt7S5dAXDo/DpjcouvPXvASVt/je+c?=
 =?us-ascii?Q?izlkGM5PvNP9H+xYLAIwUoII4wzXNSZ5sDUw1nS/5/O91KqYX00f2lLZD3Nw?=
 =?us-ascii?Q?bR7xovUJ/gEQR9m6GAjO67Nsbd83Itw/knZFXUMhNF1f6w3Hz7fd+7XPkK59?=
 =?us-ascii?Q?LeK/21gQ00yI99AxfRDyNu8guskMSzpee4R5PYIssgE0vqSHTJ6CDWzAs83d?=
 =?us-ascii?Q?yfFW9N10gUhRg3fJOKepo0pb2AE0dbZLsSrad1cOXFNZiIXoJUIUeIBSqg0G?=
 =?us-ascii?Q?avZprIOC1VRq/8hYSBhffSiBCkah4nMah6Y0xGxfm5JgQqZiXIo5Om824kxH?=
 =?us-ascii?Q?PPzv/Xcw9IK1sAxmF3aatiS/nfqFwftYYDU67pZIBuLhB+6amuOkpwwPddQf?=
 =?us-ascii?Q?drQxLPsgJtXGKeRGXDVS3Ef+EBmMaADfgXK3aeKDELGIGrEzHuxZB3nwiYId?=
 =?us-ascii?Q?1b6eAgVfhZEkTkP0wTy1JltCQGODySkrrIupU27mCek6D1t7LSnjP3juVydp?=
 =?us-ascii?Q?WyM2diDBEqFGowF6NFOWbG4TnCrfyEdnT1Q6aMOI1Xvq3qxIt6EURBWVnGZC?=
 =?us-ascii?Q?7cxRxfKxOtmXNHEMaL3dFDkcqcHVVvNvR8kfDV6DE2HCuo1DwqDPM9Og+fEP?=
 =?us-ascii?Q?mA1ei+IjSIACP9AQokGC6iZsf62TTfylXRSqqK8DrlelpJyMpsOGZ9MH3ayR?=
 =?us-ascii?Q?1j69+AAHcdTAWIHMeh1OGizVwWPXF1/CDmkNco6aa+XNMdICHyd9SWaXGZk/?=
 =?us-ascii?Q?Wah33/1D9723DJhWa4mz/L3f78dErjfnPKtr30xlfdY486B6fYJAPwO/phFI?=
 =?us-ascii?Q?gLmjrxkU96aGV9HxsiwbWNy9b7VxqoPtqxUNIOeAbWm2hSzceO3seM7wmUU+?=
 =?us-ascii?Q?M24//Y9LeSw+zW2ixWuw6yU3n7BtjRfpMSQgBZtZkyYCzLiDTYQUv0Pn5UQS?=
X-MS-Exchange-AntiSpam-MessageData-1: +y2C4Jh6IGNZNQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a09e85-335e-4a84-121f-08df2f7a3d7e
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 13:50:17.6476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hn7YhjcmQV05EkSajVrvkFAlpwImabDGqxINuYKwimPvHRjmNuk+uzhAsuHjN32Pf8O8bYQdKtlIoNe3Xj/GEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4418

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
index 991275398091..57c8f13f6bf0 100644
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
index a312103cf86d..20ea67b96b67 100644
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
index 81ca1b0a2661..aa5182c30f05 100644
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
index f93971bb1335..ca3160af78a9 100644
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
index 2cfca1b62239..2ae5bc436856 100644
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
index d1c54a516ba1..ae9dad353a37 100644
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
index 452afe16a276..2c9c4ce5098e 100644
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
index dc07ed5d144f..5cfae3f3da81 100644
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

