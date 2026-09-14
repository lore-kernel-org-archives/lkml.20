Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021110.outbound.protection.outlook.com [40.107.57.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AE64718FF;
	Mon, 14 Sep 2026 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392896; cv=fail; b=L9zRlsntfziieMGRbsxMk9fCLy9KT+j7r4kJlqa+NRxEwa3w4H6fLoM0wsaEVu9qaMPmqR6gMy49msEYry20luhQPUbsm484NBqyCMgHYwG63hkfEX0XC8zrCfKa0ktTU4Lg68XHDmkYMOAsX8vo+/BluxKgT7JoLj5+Fcppjbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392896; c=relaxed/simple;
	bh=8WO6i/bfRdYgxmndgHzfnphIFGQVenOyz3VhXS7O7Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WuDu2UgyzkGgFS0Nq4ha8raD0z/YGShzSuvwbgmTPMcY/lz7Egp1iWXURHW+Odw6Q0mI77DNiC48VlFa2S4AADpvMLa/kQpoviMSlhG8933Ih1HA4Jy1cDmb5JOyGcb2NFqtfdZxSj4oeP0xFr+Wn8CG9l/hpz0nbaCf325ZmJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.57.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSMOH5Jp4Uj53QN+FemWKzM//QroLMA1eRpmSx2ia9nOw3RTvmLfTuTWSyr3TvkxjLxyUl0LaQ4PBV3TwdIiyZNlad6vVc6qrWE2eui7fdvkf4yMvTrP6CPT5hgZbSGrmoGDB4/HHyt/ldH2yvBlj5P3ee2zWQF6FIVw5XnCzO+A6wsTG0r39I7nyskDrUC+9lxihyZ6fQauHqTcxK+Pojc6l66PWSN6xzpnKC+JnFqtPRi29ODfar5dGBJTJiT3CKwtlC06kFPikOmZkUuGm75CGaXMZ02fRabVu4r0lFvnrzU+wGZ3jtB/iEVRbl8vuFnjIBhphgU8lFwHPguchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJy3EIPLk9eWpIIwGUmrVB7SkTiDAXZuHl5SQCT6ZMY=;
 b=eZFWEJuMQT63vDXecTupFDOQvf49kYsm51NlKHGx6bY4XslN24Gl0+HXlvsacZvWpQtkPumR8PG2FC9so+NEiHWCYh9oKrRdhYkc8x0QKFNlOAoNij+IEk1KMuzycvnI4DrFHVAw0lFhQe9OQkpSE1J5TwfakNl8b5e5L4fdV80UDsb9IvZgPajX7YqhO45J3pKkWJEF+asLctwtWt1puCrxAmD/8Ne0AkzM6gEGDNx5MUe9upo8UKiOKHF2pDSR1anjSiVMOpF2na7mSLytwPWMG7Lq9BdhHBEhnO78Ll2+DfaQbSjVQ+z4gOjSqJO4eUdGFMSZBk8ueX4hoLoktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PNVP287MB6090.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:34c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:34:44 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:34:44 +0000
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
Subject: [PATCH 8/8] media: qcom: camss: enable only the stream of the pipeline's virtual channel
Date: Mon, 14 Sep 2026 19:04:16 +0530
Message-ID: <20260914133416.1030231-9-hitesh@ebytelogic.com>
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
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PNVP287MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 2384936a-6657-479e-8324-08df1264efd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|10070799003|23010399003|1800799024|366016|3023799007|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p+MuidK+01qsx12Y4/enF7VPYsai7xY26PyMWN4/fYb9ComOmEExy39VCC40HKP9MZ9cfoWYx+DyWBBwhBOReC+jjW2CeHhFJXQJH963wr1akooI/+H4yrQBdfzoKOMpBWDMv6/12eJirqzi8QxFDNuPw4HVajdnXBXcKyRdeN78Q/MFVOtYd4/GwVSVOtJMNaNsLTaiyjP17nqaXIM7OebWRIGhBRidIXlBjmgma8YT9cntXQS6jxqtNDOohzPjGqbCMpRS65Ol5UNXP947Rh+sKfFVS2vsFX//H9N/TIuraAtQVCLtbwwIla6XfoNjDS8RiZkK/zHbcXHn5X4hUUKDCjXkLZKH4YhgF9zKBilSSouDfhs3nXaQdbkkGiuOikFbdmRF7DcrNOhn3qDODkakPu6XQgm6m0OK0bWAJQv3KD+G+nGsApG7P+DIc49A+6Rhz1UVwREl1qY30Jytzb7xmBHbWMcDGuDkInBFbtiT5lelKFo5/97iiILTlckBiMSldtGIrecIzQ5U9aOJrjd03WVE/y8MVpEaDLOmk9WOW2+UigD8BsgGPsr07YOLUYdphfT33v+lXOTN5MOcFS6fwnz4HFyH+aO/ty2We/kqKaTZ4b/h53IHn8BWC1XiQv9E9POfGRk69Q+F5JEaOrXiiO/+9FhwXBQp3DFx8YI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(23010399003)(1800799024)(366016)(3023799007)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i3z242yvIfhowLvh+3Al0jWZ/zLqAD3OohhUGqv1syFfVbTv+e0ucuRfiKs7?=
 =?us-ascii?Q?yCaLPoo+INlyEByEmeZziHwGO6ihFpnQYtWv9Fpwi/xGi8J/VExeSlEyiZH5?=
 =?us-ascii?Q?wrH6I1ieKU/UOgO7GHAyB2P+ftBgu2guhbgxl42ZmRHcLMGa6q6h4ZAXpjN0?=
 =?us-ascii?Q?NKnUbYckRwDCB5cUxu1KJ7lu0OKr6ZyyP2XKnusjf4hkMB4q2rVbVQJOoROI?=
 =?us-ascii?Q?GB4j3+zLSIY1QCj1OnQkKwOmEwMIcm9kQgevKj7/40bH3A/6kqR1HLWVSkLd?=
 =?us-ascii?Q?Y6SwcLSgRfCoyC5vOoMH2A36qQebFoa0zErpguN7SCKiuFO267SHMUC8gnMw?=
 =?us-ascii?Q?9raocw3z6/nBw4m1jYhWnCWbst88VO5xjnQHesupeCf8D1LQeMRcYlZojH6S?=
 =?us-ascii?Q?EdnA/kiZVsquTsotkU1Y8xvM6RWafjmtTLZpJ2a3hjUWvwI1j25znuWBmTtF?=
 =?us-ascii?Q?NrVNmbW3YNKFiJJNbkcfgDupsn7SGXMb2+HKTqKp657YO2ZUPj7ku7MXYrEm?=
 =?us-ascii?Q?ePZS4MA9P/Wa9h97Z19cyjRjZqAkXJNp3qvLeQTac9HWDofm4W85k5s3eOJr?=
 =?us-ascii?Q?Gp5TLc5xB82FGRKQZHnevhCIotljd5M+FayCDUWU/JHPhIV2zn3Z0USHF5mk?=
 =?us-ascii?Q?DsCuFhZ4w1bD/IsBhhI4s41gE4fmzgFYP/ghjBdetkkDNxsvMhJZL0DtFe4T?=
 =?us-ascii?Q?Qr94Y5SOeKPUkP3U5KLC5M0RPlY72A7lMs6uVljKNTiU0eb5gWq2yTkILuaG?=
 =?us-ascii?Q?Di8nqTyXwp5rKEeCAFynA3HjdelHlidpc1XQwE0zBTKntKXJRICKYh9Sw5DB?=
 =?us-ascii?Q?TMBh9SWs5leEkwTEc8C/Vemgwqte6yWo1z581n2hglj+32KX9+z9e02RVycE?=
 =?us-ascii?Q?MvPTYkzCtoxWgFOsyW636CnkUAJwZk6399XaChtpMquZbk+hjE20aZmvY2Ud?=
 =?us-ascii?Q?plBDFRB/x2cIHG1rQmOwfkOyBsXaZnY0/fXWUK2KWFupbpWLrTnCaJPYQyzj?=
 =?us-ascii?Q?RWy16oDD1mlqkJdCbp0qbVDyeB912RUJUmbrPW0z2MUyG+xus3eOWKGwiqSR?=
 =?us-ascii?Q?ukET2nSuQfi3l6CdNcKW+oQD5pvWZWCG+P+8kIr5IInwX6HxaTDrJ5ytVWPn?=
 =?us-ascii?Q?1xGVy9PLxaQ10HH7ItKHf1VH3yxbhJxOwuZ7HbjVzqEFNtne0J/rmDIlTpVr?=
 =?us-ascii?Q?V5XRquHm82dN+4V1eKlrqZQdH+M9hYVBgex5J1kLozxWVAgJNQKrCbwQwhPv?=
 =?us-ascii?Q?11I8P66Cr0AP8rB7qdccDpQSXdBaiuCxQPVDFOYr94R8cfQ12TEi+6oVFMEg?=
 =?us-ascii?Q?LLD+NkSq9jDZHZW0yGl22jIDWCuYxaeICdEmcSjQDBkmA+5PpcumR1i62G2u?=
 =?us-ascii?Q?Fwn4ycY0xbBkREZT0apKd5F/M65vw2eUQJ6sECZYZiGlRx/DfAlIJJukTcRU?=
 =?us-ascii?Q?QId2iW4R9yw+LSd3705Mt9bVRTPbTly5xwF88oFqhm2b9m3xK8cyo22fM6nJ?=
 =?us-ascii?Q?GAxsN4bF/w0yAZanqDVYKAop7PB3mW86U5N55K3Mt+4MP7ZILl2JZTlTPH6V?=
 =?us-ascii?Q?JP+nI1PgZzIaJvf2ngcir1cjpJzvQD0mAkLHReqvJ3RIEFogoZNrVKv86dg7?=
 =?us-ascii?Q?JZnYpouJ5vobgGuvQWkkKTsS7GHtyVes0IiAjhfGyKZBN7bgFzTn/uFYaLU6?=
 =?us-ascii?Q?36pJbYdxwisZzaPgf2JE4XX3gkoL0ZnciQ2TTDkUiLG2u5N65oXrKTLJVNfy?=
 =?us-ascii?Q?kjQo2QGv+wGCN5uXmfsmHpCpeLxw0H8QXAdGMvN6JSLZRFvR1OHeWuIUxvzw?=
X-MS-Exchange-AntiSpam-MessageData-1: maCj/O+an+VztQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2384936a-6657-479e-8324-08df1264efd6
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:34:44.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +njrh7MaWu+VJ/4AlAhupDaEXIoXE1VNJG27vNy3ZPGiIU5c2GqzKIkXde5onoAFTdPKA8y1zZmmI0N8MnPN/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNVP287MB6090

When a streams-aware transmitter is found at the head of the
pipeline, every stream routed to the source pad the pipeline arrived
through is enabled at start and disabled at stop.

That is right for a transmitter driving one camera per output pad,
but not when it aggregates several cameras onto one output. A GMSL
deserializer can send two cameras on a single CSI-2 port as two
virtual channels, which the CSID demultiplexes to two RDIs and thus
two pipelines. Both pipelines then reach the same source pad, and
each of them enables and, worse, disables both cameras' streams:
stopping one video node stops the other camera as well, and
starting the second one has nothing left to enable.

Identify the stream a pipeline owns from the CSID it went through:
CSID source pad MSM_CSID_PAD_FIRST_SRC + n carries virtual channel n.
Remember that virtual channel while walking upstream, ask the
transmitter for the frame descriptor of its source pad, and only
enable or disable the stream(s) it reports on that virtual channel.

A pipeline that did not pass through a CSID source pad, or a
transmitter without a CSI-2 frame descriptor, keeps enabling every
stream of the pad as before.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 45 +++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.c     | 30 +++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  2 +
 3 files changed, 74 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 90f22ce76..a261f7692 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -253,14 +253,39 @@ static int video_prepare_streaming(struct vb2_queue *q)
  * video_source_pad_streams - Streams routed to a subdev source pad
  * @sd: Streams-aware subdevice
  * @pad: Source pad index on @sd
+ * @vc: Virtual channel of the pipeline, or -1 if unknown
+ *
+ * When a transmitter aggregates several cameras onto one output, that pad
+ * carries one stream per camera and each of them is a separate pipeline here.
+ * Enabling or disabling the whole pad would start or stop every camera at
+ * once, so pick out the single stream this pipeline owns: the one the frame
+ * descriptor reports on the virtual channel the CSID demultiplexed it from.
+ * With @vc unknown, or without a frame descriptor to map it, the whole pad is
+ * returned, which is the case for a transmitter driving one camera per output
+ * pad.
  *
  * Return the mask of streams of the active routes ending on @pad.
  */
-static u64 video_source_pad_streams(struct v4l2_subdev *sd, u32 pad)
+static u64 video_source_pad_streams(struct v4l2_subdev *sd, u32 pad, int vc)
 {
 	struct v4l2_subdev_state *state;
 	struct v4l2_subdev_route *route;
+	struct v4l2_mbus_frame_desc fd;
+	u64 vc_mask = ~0ULL;
 	u64 mask = 0;
+	int ret;
+
+	if (vc >= 0) {
+		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, &fd);
+		if (!ret && fd.type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+			unsigned int i;
+
+			vc_mask = 0;
+			for (i = 0; i < fd.num_entries; i++)
+				if (fd.entry[i].bus.csi2.vc == vc)
+					vc_mask |= BIT_ULL(fd.entry[i].stream);
+		}
+	}
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 	if (!state)
@@ -270,6 +295,8 @@ static u64 video_source_pad_streams(struct v4l2_subdev *sd, u32 pad)
 		if (route->source_pad == pad)
 			mask |= BIT_ULL(route->source_stream);
 
+	mask &= vc_mask;
+
 	v4l2_subdev_unlock_state(state);
 
 	return mask;
@@ -325,6 +352,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct media_entity *entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
+	int vc = -1;
 	int ret;
 
 	ret = video_device_pipeline_alloc_start(vdev);
@@ -350,8 +378,13 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
+		if (vc < 0)
+			vc = camss_csid_source_vc(video->camss, subdev,
+						  pad->index);
+
 		if (subdev->flags & V4L2_SUBDEV_FL_STREAMS) {
-			u64 mask = video_source_pad_streams(subdev, pad->index);
+			u64 mask = video_source_pad_streams(subdev, pad->index,
+							    vc);
 
 			if (!mask)
 				break;
@@ -387,6 +420,7 @@ static void video_stop_streaming(struct vb2_queue *q)
 	struct media_entity *entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
+	int vc = -1;
 	int ret;
 
 	entity = &vdev->entity;
@@ -402,8 +436,13 @@ static void video_stop_streaming(struct vb2_queue *q)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
+		if (vc < 0)
+			vc = camss_csid_source_vc(video->camss, subdev,
+						  pad->index);
+
 		if (subdev->flags & V4L2_SUBDEV_FL_STREAMS) {
-			u64 mask = video_source_pad_streams(subdev, pad->index);
+			u64 mask = video_source_pad_streams(subdev, pad->index,
+							    vc);
 
 			if (!mask)
 				break;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ca8101c2d..63cc81570 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4655,6 +4655,36 @@ static bool camss_is_receiver_subdev(struct camss *camss,
 	return camss_subdev_stream_users(camss, sd);
 }
 
+/*
+ * camss_csid_source_vc - Virtual channel behind a CSID source pad
+ * @camss: CAMSS device
+ * @sd: Subdevice to test
+ * @pad: Source pad index on @sd
+ *
+ * The CSID demultiplexes virtual channels to its source pads, source pad
+ * MSM_CSID_PAD_FIRST_SRC + n carrying virtual channel n (see the en_vc mask
+ * maintained by csid_link_setup()). Walking a pipeline upstream, this tells
+ * which virtual channel, and so which stream of a shared transmitter, the
+ * pipeline belongs to.
+ *
+ * Return the virtual channel, or -1 if @sd is not a CSID of @camss or @pad is
+ * not one of its source pads.
+ */
+int camss_csid_source_vc(struct camss *camss, struct v4l2_subdev *sd,
+			 unsigned int pad)
+{
+	unsigned int i;
+
+	if (pad < MSM_CSID_PAD_FIRST_SRC)
+		return -1;
+
+	for (i = 0; i < camss->res->csid_num; i++)
+		if (sd == &camss->csid[i].subdev)
+			return pad - MSM_CSID_PAD_FIRST_SRC;
+
+	return -1;
+}
+
 /*
  * camss_find_transmitter_pad - Find the pad of the CSI-2 transmitter
  * @camss: CAMSS device
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 00b8d5304..14a7c737e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -169,6 +169,8 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 unsigned int *camss_subdev_stream_users(struct camss *camss,
 					struct v4l2_subdev *sd);
+int camss_csid_source_vc(struct camss *camss, struct v4l2_subdev *sd,
+			 unsigned int pad);
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct camss *camss, struct media_entity *entity,
 			unsigned int bpp, unsigned int lanes);
-- 
2.43.0

