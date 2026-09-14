Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021110.outbound.protection.outlook.com [40.107.57.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FB24756AE;
	Mon, 14 Sep 2026 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392891; cv=fail; b=bDAKgjRd2m0guSNPoDv4Kbb1Y0OuM5sOfGCXL1G2+DBApQSwxnU7mp5k2DHNfe6O4Gd1Nps0YBVurqmwbCwZwG6O+evD8ieGT5qX7LEbdaJmwrOL3wLeTCIo8s2aJVssJn+7ToEc6kgXSOfRJZqlrenYVAOxcbRJ1+OQ8Nlv8fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392891; c=relaxed/simple;
	bh=Az4P5pq13JWb0EGEizUV2Z2Cb+aFs60lIaIJZKcKoRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VH3zcAFyk13l8bQSbwrQ+hxVTdrZ8lYdl3j6FB/bucj6l7ZKKHNqqbfa/E/qPBUfLQcKtVS+D1FzPqeDWomx2k056ugDFq8bvJN5KAZj6OVf/RJDcEspPUM0jQ2nVAV+eFUeVNwbKKMBVIRSs7qvFAkksV6R65vd3GYsy6QDiC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.57.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnzCbgQMgXnDekMCkdmdlCKx4bs4sk7/B2T7VCxFI9kE293H+SWw4nZBuCujJ1wKPutxfdJ4FXiGKSyhwL8adUtX/lnabWpZSLjOxh5TCXdmk+0RIXLnMltHmuL8v77w6L7DISi2s126iuiAfEa8QM0A7WJqrZBmfvOLaLAIjQ0gP9pYRpE0DaCeMgqmbAQEzqVGdrDEPLSVMggQc7ZsH7PSOReA94VcTAGMPB6RlLHth75DWr1PfpvUiYpD0XDaxHnf7AQR+98fwTzVtXfBoeaF4mb+D7Y8ggsyePyJuFCaPY+OyAreIB6uZNjL9N3A0s+zUiIro4XnvUEUb0I/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CErd0yv0odVFe1lmN7/C0xqjiE4ZrCZ3PVV6XzKQjh4=;
 b=PW602VNsmEq+omdt+gVyG25zroWYwpX7saZUFIVdjtz4YzkapA7b2ju89Cf9snzdm0Vzx4j2LxJAH8pSDeEmdR7Cwd+4jy23a4E2i2EZOfN0YXH02hDnJ81A7GWf1Xs8V7RVVNfFi92CCtWvOWOtuIeZnwkj8vtYYoGQ8+eVW4a8U7UgpAJAAeHWTzdNsMxHqcnj/ad865bcbVqzBbsWx9jc746fPBDsOJYOBu6mDHnu3u59i0z275+otWnySFPZqazirbsFoC+TqwiCxMjXUQmViRQaJquv8QrR8p/DyJiBme3LwfqlBLs279dHgG6HnT4Hn0r0PouDufmiVNo/6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PNVP287MB6090.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:34c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:34:43 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:34:43 +0000
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
Subject: [PATCH 7/8] media: qcom: camss: drive streams-aware transmitters through the streams API
Date: Mon, 14 Sep 2026 19:04:15 +0530
Message-ID: <20260914133416.1030231-8-hitesh@ebytelogic.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2cfe2e39-964d-4901-a862-08df1264eef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|10070799003|23010399003|1800799024|366016|3023799007|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	u2CX/UJe9xdvpj99/BpqqCO0xwDpAqRNiKTRa5kjCTZ2B4KuQ8IyVGRyDOcjzITks5O7G/N7rW43iZcYmqD1dHLsACC67YXKB8FKZgDqYlramlPFKAnzlLuIZGrYjnjMzjDoIOAj3y6H55Qb+kkE+reEOOAS7QbrP74zFIcrruFNyYAWc6UAtbLKFd3SClgdkqFuLMPaBd8NhUxDDmgJxL4F1IzBAw8SFn8+/PG5YL5nUlGVi2e4OxCiwNjjPzAKGGwZveh+rQThuwKPd00j2XSBmdtJIt3lGLpx7wQMRyyC/wcNk5G+4Zs21DZr1+/pwiKtox+zqxagIBQw2xBfAVVvJYRzNHvN09iXgNbE1e+ZLiapSRTpk8pzCYurDh9W9ZndtP3HEYFbcmr64nTLQs6T8amygtOkAIvXVZrtWVBcGjQ7zhpPvBgBT1hksHbKRJJUTTTKe6NbmgHBe2Ji7/jasA3jybTIq/NfKY/eSRyets755RzCQgIF3WJxBdq4n0JFimqTX/IhKRRnK2EUfxJnIvZ+GKnfQlbaDu9J8RylOeKs3GhLSUfltT6iZaZZDLatDZTqCPXPeIiPjf81vasxBz3JEATPXtZhxWu94N5t2uP1TB6M3yfeqTIRAkv52oUmM1rcdrQkLCxKzYlGEDqpdZfPdBkXRd2k2Ux0gVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(23010399003)(1800799024)(366016)(3023799007)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dotnq2Aa5qWMvOkIGgkKOysvKZu8ZawBvG2DN30GAyAGkMvOxaYBqjggJvia?=
 =?us-ascii?Q?vtbTfSvFufb1SAnd1Py2oQcUoB5hlLCGUxMnx4wIAf6xgWOr4152p2t8k15N?=
 =?us-ascii?Q?kofBuBiNS4NBz9iX2jWcDeNs1CcVGXD9aNSWE0K2hzuKMA68asQOhkGSy/g6?=
 =?us-ascii?Q?6A0ne3QFYF4hFuU3HLvmNGICrUobenj4W4XSlxbmjHpMkMgUJbKIYONTJf0r?=
 =?us-ascii?Q?fLPRolGSrvAkiTXfBXijp5gimi2gmNqAO+CBqTggXXEfef98A0YbMSnjVtdE?=
 =?us-ascii?Q?8qJ+PFdk9+k3pRk7Dypi6t0gL/LGWYiYzVIkUfdUmYGg6mb7aR2JoxHstRWm?=
 =?us-ascii?Q?ok3v7vm6wiU/wGnwYFZzR8c/bThXycpd9D376YZDl2LrjrhqvHNPf8NCB5VN?=
 =?us-ascii?Q?aUs65IZ9drVPx2WRbAcVeJehUy6UsfaxaLFXye7Y5OO86fiO6H/c2+IRuDXg?=
 =?us-ascii?Q?SBQSzCd3I//hO5HmvbkIXghOXLPaLXdhs5m1Mi/Npw36gjgpzsWXE/nx+F+c?=
 =?us-ascii?Q?YIlIRQZU0kbWyKBwjgq4Yo9MKRBp/ZjfnL4eOfGJxF9LKbozXovlSbD7PDNZ?=
 =?us-ascii?Q?oad7DkQNFoiVPXo2XgE/qLHWBjD7eWpp5X6mtKxls9Agh582Tr8i6EXknarg?=
 =?us-ascii?Q?5Ir2oHpAeOrJNXN0vSV/7foUS5I1PIwybngUotPVsQLJT7gOXQvBW8f3WYVZ?=
 =?us-ascii?Q?eKwlpf0EpilKIFe9tN5guErxzwpJtFglsSfYe/MUqR1ppBwSuxhvg/gaFGQl?=
 =?us-ascii?Q?OANNd9nFCAT4Uw4zshtqT0VgfX3khhBuRCkKvPELnKl8OC6pfTe75MpK3FAh?=
 =?us-ascii?Q?N4QdB17IgS9t9Gno4kyjqUt9n+KfXjIUmuf/EFMIOv2Ajq5KJZmLvaE0NsJz?=
 =?us-ascii?Q?zJRVNhiezr6MTZZBxtxRxuhxbLFu1Bgi8xjPC8bb0LCDZ296fIAdeyF20FHN?=
 =?us-ascii?Q?Kd4tBcJHzIkLlztHz4yOmbpyntnHrLSFgbw05LWkjJkSqY9epFRgmVsvvZ/P?=
 =?us-ascii?Q?xpc2Fv3ndZI11ZEdXlvedbDCmfeDrajMc2c+FAjwC6QQ27vdpEEoki6pYDSq?=
 =?us-ascii?Q?rmYWfQJKUoEM2KEK39+lFEBFqm5nyNJH3/UvE3vojVO5svoDs3wGosZEaQ8s?=
 =?us-ascii?Q?IMlD/nc8SrON8RKrdkyApt/sQNxxOiu2w2MQN3S+rhnmTQjRz31wpQHIf8vf?=
 =?us-ascii?Q?stkXiLOCqoaO9Kw4roS1JcnKOuhijq2rPNQdLvlYOFKz19xLUjlnJjw0ixDk?=
 =?us-ascii?Q?arc/JhoVrkC1Qqx3qdI8SSLUTxxn6XhNJm2FOf5AlTISPMKm6ufeimsudI96?=
 =?us-ascii?Q?XAOybQd508p4685acUL3NrckNRUEu4+RP8XGE4ix48ZeOeRXLAcBj5pCs1eH?=
 =?us-ascii?Q?CXmW8RhLTBRLaRvfC+guMSCyKJqyqdJ9771KEy7eNrap7kfkWi5s9PqjOm+b?=
 =?us-ascii?Q?hmqS5zz1UfMY6NJn+t31NWuuWf4PEMUy2n+YAz6s3i21husjZlnqnb1XNs+W?=
 =?us-ascii?Q?HpRD7zb8pd1BecaDeE1aP8XOlAWzqMawt2LxRhc3iMzzezJtaWFcqQlV6Jl2?=
 =?us-ascii?Q?9QGMjsTESKVyDOh6iDUFT/ZupSfGsqtyKe/OJKa+JqzZFCWIhIvh1Cdr5H4Y?=
 =?us-ascii?Q?DOaFIcdq1pbWvEBuZNV7bcDa0Xf8NorH/7r42WxwzQpprGSPOxxrtb+5CzFX?=
 =?us-ascii?Q?NfUeXsD62HVQypIrX2YZNq+EZEh3pJMnuD8bV9fcB4E4LM4s9Bd878GE4dw4?=
 =?us-ascii?Q?RUR8oVF6sl64+Fu23C0DppKJi8vOataIv/HszMMB6wMGY4zCSZ1GpVpidz0F?=
X-MS-Exchange-AntiSpam-MessageData-1: kzG4yz3vL8jpMw==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfe2e39-964d-4901-a862-08df1264eef1
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:34:42.5425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glolvvOewYsfF+SHllJoTkOX7DHRSfxe/ROLSr2rmeM3ikX0saJPYWPLAkWmP7CHQoOUdpdKZa73ZlKPY5c89A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNVP287MB6090

video_start_streaming() and video_stop_streaming() drive every subdev
of the pipeline through video.s_stream. That op is per subdev, and
the core allows one transition per subdev, so a transmitter that is
shared by two independent pipelines can only be started once and is
stopped by the first pipeline that stops.

A GMSL deserializer with two CSI-2 output ports, one camera routed to
each, is exactly that case: the same subdev sits at the head of two
pipelines that otherwise share nothing (each has its own CSIPHY, CSID
and VFE). The second camera never starts, and stopping either one
kills the other.

Such transmitters implement the V4L2 streams API and advertise it
with V4L2_SUBDEV_FL_STREAMS. For those, enable or disable only the
streams routed to the source pad the pipeline arrived through, using
v4l2_subdev_enable_streams()/v4l2_subdev_disable_streams(). The core
refcounts enabled streams per pad, so the two pipelines no longer
interfere. Enabling streams on a source pad propagates upstream to
the sensor by itself, so the walk ends there rather than starting
the rest of the chain a second time through s_stream.

Subdevs without the flag keep using video.s_stream exactly as
before.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 16c5f3748..90f22ce76 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -249,6 +249,32 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
+/*
+ * video_source_pad_streams - Streams routed to a subdev source pad
+ * @sd: Streams-aware subdevice
+ * @pad: Source pad index on @sd
+ *
+ * Return the mask of streams of the active routes ending on @pad.
+ */
+static u64 video_source_pad_streams(struct v4l2_subdev *sd, u32 pad)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *route;
+	u64 mask = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (!state)
+		return 0;
+
+	for_each_active_route(&state->routing, route)
+		if (route->source_pad == pad)
+			mask |= BIT_ULL(route->source_stream);
+
+	v4l2_subdev_unlock_state(state);
+
+	return mask;
+}
+
 /*
  * video_subdev_set_stream - Start or stop a subdev of the pipeline
  * @video: CAMSS video device
@@ -324,6 +350,20 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
+		if (subdev->flags & V4L2_SUBDEV_FL_STREAMS) {
+			u64 mask = video_source_pad_streams(subdev, pad->index);
+
+			if (!mask)
+				break;
+
+			ret = v4l2_subdev_enable_streams(subdev, pad->index,
+							 mask);
+			if (ret && ret != -EALREADY)
+				goto error;
+
+			break;
+		}
+
 		ret = video_subdev_set_stream(video, subdev, true);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			goto error;
@@ -362,6 +402,22 @@ static void video_stop_streaming(struct vb2_queue *q)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
+		if (subdev->flags & V4L2_SUBDEV_FL_STREAMS) {
+			u64 mask = video_source_pad_streams(subdev, pad->index);
+
+			if (!mask)
+				break;
+
+			ret = v4l2_subdev_disable_streams(subdev, pad->index,
+							  mask);
+			if (ret && ret != -EALREADY)
+				dev_err(video->camss->dev,
+					"Failed to disable streams %#llx on %s:%u: %d\n",
+					mask, subdev->name, pad->index, ret);
+
+			break;
+		}
+
 		ret = video_subdev_set_stream(video, subdev, false);
 		if (ret) {
 			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-- 
2.43.0

