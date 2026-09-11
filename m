Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F043F1678
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107744; cv=none; b=jcVn5hWq8txbymoyJMZTeqoN+sljJmGx+Gq8OCA9/yj/Jt9G0bwLgf8ClGm5HEqIpEAaWnVRykJATbQurFXvob651kI7FNCrG9tdUVB1AB2zWW0klshvGtzuW47I1SeK4tDyWKQMJ21BJEijs8fMAFddlK4sCLTw6w92QxOI14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107744; c=relaxed/simple;
	bh=S3lR9rQgmm0/QsXj3FBN+DiGLxuDTgYGdn5BOLkmuLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kIAB4Ira8lq1EQyExMI7FiibbByQi341c9URgCoLX6zaSGiZlCQQMCXdJiBf1Pdrlav6W8icZwQ4JkZOBxqmfP5Vz8c8FlrEkN5RcuQZK+b3ZQjqo1ji3pVP7KAM1Bz5s98fdXkp+s1HUxM5CQiM/coLcvqQ00A0YSuKs59AnVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKD1j0al reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKD1j0al"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vUHC3464089
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ocWGOz0+jm3
	gelKC1Kmsak+XBwyOJFIdVh6cOArcDS0=; b=JKD1j0aln1ZDhpzYN9FSeTJB1Dj
	ke8CgZXeUi7sYxSBoKVL6RKErFA4trpVW3fFewr7TwfOFzShPfBZ9jse5/24LUvQ
	DTJ7euyVVoYPeqsHiUY+xp0jToeWgyPxg6KZycmDqJVXWzFaq5QnuUrmEkHLyhC3
	LA0CgGOQc2rm+ERmgz405DjA4zTsUg/jvL8/iNfPKW8QY4+SlOpC7G+ADVvsN4bz
	b+HBAs2C3Oo+3UqalNtAlE5Pn8aEBkFR4J6xyga9c25xosyFmdghea4ypXWDSDKZ
	IG7iXLkEvR330NIyvqe2vtS/FmF9xarU66vRgSy8TcOA9O5NcgVGLqw2KAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q41dud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939d6c515deso90495085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107740; x=1789712540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocWGOz0+jm3gelKC1Kmsak+XBwyOJFIdVh6cOArcDS0=;
        b=D3reW7uUlkq9TqtUXtJMcQ2W65hF8aet19Kzh5qRWdMERlyynbhIo59OOVfmAA0a2e
         f39xRnOyXJ/MBWY0iKRt8rZI5lk4MLbyzZgEvNSQFVLeaySYPIvACmVDuOttqpXCEA1G
         eA4qSjOzQKh/rBtrv5foQKcNilcTeA+O8eTKe+bmjEw80aDjQFHvNSDspGl6beQ5r+AX
         nOUy2sAi5bqXGHNaAy96uPgyuZINtHt72WLBLumR6WxN2EteelcdMD+hhKArGBA8svws
         HEdTCyBaR0rBCOTbb2q7toAFf2EchHahqN/XkhgWZT45eo8+FSEM2zWsktghGfPYLNEZ
         16ag==
X-Forwarded-Encrypted: i=1; AKwUvBzQi+KQ5PNl8g7i4FAX6HZe9ximsc1Zo6haB05wakBVMDginTCUfTZZ/QH9ndVJB9zGAn4QjDKMqecglJU=@vger.kernel.org
X-Gm-Message-State: AFuF++kNZPk+vWBfelGlHyWl2uNs4GexgNlWOZFpZuqJ/PxpmrEGxXAL
	onuHaR9rFpryY3EbWOFsc5LOZZ3w4xsAHIqNaG6hpSZVMVyC1ZD6nZzW7f+ICYzE6EEU/6Q5H/j
	XA9OT9MS+8RvamfImIpKt5DTHtOOoVtDlQv2b2GJ0Hnq6LxQ1TIlS5SxZR9K+dYMief4=
X-Gm-Gg: AYBFou2jyWqs6nNg8UFx2HNP3bM48vd0NtGGqy3HqgrirxInHxj2lXYsnABIRZGyKhm
	q/9eDLXaUpmryO18/vjQ68n0eBeS51dHz1/JHGVBnZeUycJqe9ptNOxEgrIDUv2jF7MQLg6eEvy
	YkvRGNgp8Tzdwn2Joa6obQrcpurVz0SmMlJ8SbcbUE5k9hSQrgQUw2z4FtY1oeMZlZyrQvQcXmQ
	aClVchh1AIhhQRJyKsDGBE4S6g9Ft9LdEWac8a7iF0MuRVPxoALcFWOclH3CYrQFCd4DBhyVDN7
	FXLixN+SoUhCDlm/5MRrNTmqw+gGIcCMq+e022YJ/pWojfZ6m1HEulXAHFk=
X-Received: by 2002:a05:620a:1a29:b0:939:197f:345e with SMTP id af79cd13be357-939ea0ad175mr346075785a.22.1789107740234;
        Thu, 10 Sep 2026 23:22:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1a29:b0:939:197f:345e with SMTP id af79cd13be357-939ea0ad175mr346070085a.22.1789107739331;
        Thu, 10 Sep 2026 23:22:19 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:18 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 1/8] media: qcom: camss: Add streams API support for CSIPHY
Date: Fri, 11 Sep 2026 09:22:06 +0300
Message-Id: <20260911062213.195007-2-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: btqXFTCPWf4DvNJJUDvPvZ-2uGqp7lH5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX/iRTvkrtYShs
 iWaPqLXjKlnFQ3bG/0v51JzuNwdTQGvoeLhCG+vCNA9qhQrLk3uRYpmIWSYjjEMPrQY9qsvWm32
 N51jQgkNfAIW3WDU1e6t37fECdzfmpk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfXzSpytMAC4/zK
 PR+DuD5WM05a7WhhEPw4cP+85zWdxkiQF0m3i/mfB3LnAlzhCH1zyX3Sz9sn6TOH9pZ/soQJ5NK
 bEHjCUl1tRcQWE69+iLWN+n78hTWxJ0mGw/yWvesYXAs6bBATikGgCXgM9KLjzjMVgAUKyGGSkS
 ErNZSYW50QlTATh+PapwRswp3aRrAnWqC38B4I1ho0uGbLtZLFLFGnIjEffxXs30BOnIsXSp5YV
 S4GkHKwPQXXgZ1aAe5ZoPDyRvz6DCiWaOFgItLnp8xQd768Wrn4HYNcW8goZS3seGaBmgrqJDDf
 tI2PAoPBCwDwA01gjcqFKGQnznZbocJdpezqbS4lm7TZXkADykf2BH8k+sGNDBU9+H6R/hP7s7G
 W5AWxkJOKvAeCg/gS5FRtmwdnbTJKV2BE/5Gk1h4Ts1lB6cMO/Ba7eEn3gSZG34aAhEQzAyIZOu
 DxLnaI66QkLYsbnH91A==
X-Proofpoint-ORIG-GUID: btqXFTCPWf4DvNJJUDvPvZ-2uGqp7lH5
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa39e1c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=OdbYh2hxJzrqstplNr4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Add the V4L2 subdev streams API to the CSIPHY driver: a passthrough
routing table (one VC per stream) and NO_STREAM_MIX routing validation.

enable/disable_streams pad ops track active streams per pad via a
per-pad enabled_streams[] bitmask, so that multiple source-pad
consumers can share a single propagated sink stream without redundant
or colliding propagation to the sensor. The shared D-PHY lanes are
enabled once, on the transition from no active streams to at least
one, and disabled once all streams have gone idle.

This is opt-in per CSIPHY instance via the new streams_enable resource
flag; no platform sets it yet, so CSIPHYs continue to use the legacy
non-streams subdev ops unchanged.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 223 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-csiphy.h  |   2 +
 2 files changed, 222 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 539ac4888b60..7e9748e92ab8 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -332,6 +332,112 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+/*
+ * csiphy_pad_enable_streams - Enable one or more streams on the source pad
+ * @sd: CSIPHY V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to enable
+ *
+ * The shared D-PHY lanes are enabled once, on the transition from no active
+ * sink streams to at least one. The sink stream(s) are propagated upstream to
+ * the sensor only for the subset that isn't already active, so a stream
+ * that's already running is never redundantly re-propagated.
+ *
+ * CSIPHY is only ever linked to a single entity on its source pad, and that
+ * entity is responsible for only enabling a stream on this pad while it
+ * itself still needs it, so no cross-consumer refcounting is needed here.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_pad_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     u32 pad, u64 streams_mask)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	struct media_pad *remote_pad =
+		media_pad_remote_pad_first(&csiphy->pads[MSM_CSIPHY_PAD_SINK]);
+	bool first_arrival = !csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK];
+	u64 sink_streams, propagate_mask;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSIPHY_PAD_SINK,
+						       &streams_mask);
+
+	propagate_mask = sink_streams & ~csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK];
+
+	if (first_arrival) {
+		ret = csiphy_set_stream(sd, 1);
+		if (ret)
+			return ret;
+	}
+
+	csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK] |= sink_streams;
+	csiphy->enabled_streams[pad] |= streams_mask;
+
+	if (propagate_mask && remote_pad) {
+		ret = v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+						 remote_pad->index, propagate_mask);
+		if (ret) {
+			csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK] &= ~propagate_mask;
+			csiphy->enabled_streams[pad] &= ~streams_mask;
+
+			if (first_arrival)
+				csiphy_set_stream(sd, 0);
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * csiphy_pad_disable_streams - Disable one or more streams on the source pad
+ * @sd: CSIPHY V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to disable
+ *
+ * The shared D-PHY lanes, and the propagation to the sensor, are only torn
+ * down once no sink stream is referenced by any source pad any more.
+ *
+ * CSIPHY is only ever linked to a single entity on its source pad, and that
+ * entity is responsible for only disabling a stream on this pad once it no
+ * longer needs it, so no cross-consumer refcounting is needed here.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_pad_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	struct media_pad *remote_pad =
+		media_pad_remote_pad_first(&csiphy->pads[MSM_CSIPHY_PAD_SINK]);
+	u64 sink_streams;
+	int ret = 0;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSIPHY_PAD_SINK,
+						       &streams_mask);
+
+	csiphy->enabled_streams[pad] &= ~streams_mask;
+	csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK] &= ~sink_streams;
+
+	if (sink_streams && remote_pad)
+		ret = v4l2_subdev_disable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+						  remote_pad->index, sink_streams);
+
+	if (!csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK]) {
+		int stream_ret = csiphy_set_stream(sd, 0);
+
+		if (!ret)
+			ret = stream_ret;
+	}
+
+	return ret;
+}
+
 /*
  * __csiphy_get_format - Get pointer to format structure
  * @csiphy: CSIPHY device
@@ -743,6 +849,71 @@ static int csiphy_link_setup(struct media_entity *entity,
 	return 0;
 }
 
+static int csiphy_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = MSM_CSIPHY_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = MSM_CSIPHY_PAD_SRC,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	/*
+	 * CSIPHY is a transparent D-PHY with no per-VC demux, so every sink
+	 * stream (VC) a multi-stream sensor may drive must pass straight
+	 * through as the same source stream, or downstream link validation
+	 * (e.g. against CSID's multi-pad sink) will flag it as dangling. A
+	 * multi-VC sensor is supported by userspace adding further routes via
+	 * .set_routing; this default covers the common single-VC case.
+	 */
+	return v4l2_subdev_set_routing(sd, state, &routing);
+}
+
+/*
+ * csiphy_set_routing - Set routing for the CSIPHY subdev
+ * @sd: CSIPHY V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @which: Type of format state (V4L2_SUBDEV_FORMAT_ACTIVE or TRY)
+ * @routing: Routing table to set
+ *
+ * CSIPHY is a transparent D-PHY with no per-VC demux, so every route must
+ * pass a sink stream straight through as the same source stream.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      enum v4l2_subdev_format_whence which,
+			      struct v4l2_subdev_krouting *routing)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	unsigned int i;
+	int ret;
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK])
+		return -EBUSY;
+
+	for (i = 0; i < routing->num_routes; i++)
+		if (routing->routes[i].sink_stream != routing->routes[i].source_stream)
+			return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_NO_STREAM_MIX |
+					   V4L2_SUBDEV_ROUTING_NO_N_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing(sd, state, routing);
+}
+
 static const struct v4l2_subdev_core_ops csiphy_core_ops = {
 	.s_power = csiphy_set_power,
 };
@@ -764,10 +935,35 @@ static const struct v4l2_subdev_ops csiphy_v4l2_ops = {
 	.pad = &csiphy_pad_ops,
 };
 
+static const struct v4l2_subdev_pad_ops csiphy_streams_pad_ops = {
+	.enum_mbus_code = csiphy_enum_mbus_code,
+	.enum_frame_size = csiphy_enum_frame_size,
+	.get_fmt = csiphy_get_format,
+	.set_fmt = csiphy_set_format,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
+	.set_routing = csiphy_set_routing,
+	.enable_streams = csiphy_pad_enable_streams,
+	.disable_streams = csiphy_pad_disable_streams,
+};
+
+static const struct v4l2_subdev_video_ops csiphy_streams_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_ops csiphy_streams_v4l2_ops = {
+	.core = &csiphy_core_ops,
+	.pad = &csiphy_streams_pad_ops,
+	.video = &csiphy_streams_video_ops,
+};
+
 static const struct v4l2_subdev_internal_ops csiphy_v4l2_internal_ops = {
 	.open = csiphy_init_formats,
 };
 
+static const struct v4l2_subdev_internal_ops csiphy_streams_internal_ops = {
+	.init_state = csiphy_init_state,
+};
+
 static const struct media_entity_operations csiphy_media_ops = {
 	.link_setup = csiphy_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
@@ -786,11 +982,16 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 	struct v4l2_subdev *sd = &csiphy->subdev;
 	struct media_pad *pads = csiphy->pads;
 	struct device *dev = csiphy->camss->dev;
+	bool streams_api = csiphy->res->streams_enable;
 	int ret;
 
-	v4l2_subdev_init(sd, &csiphy_v4l2_ops);
-	sd->internal_ops = &csiphy_v4l2_internal_ops;
+	v4l2_subdev_init(sd, streams_api ? &csiphy_streams_v4l2_ops
+					      : &csiphy_v4l2_ops);
+	sd->internal_ops = streams_api ? &csiphy_streams_internal_ops
+					: &csiphy_v4l2_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	if (streams_api)
+		sd->flags |= V4L2_SUBDEV_FL_STREAMS;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
 		 MSM_CSIPHY_NAME, csiphy->id);
 	sd->grp_id = CSIPHY_GRP_ID;
@@ -813,12 +1014,27 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 		return ret;
 	}
 
+	if (streams_api) {
+		ret = v4l2_subdev_init_finalize(sd);
+		if (ret) {
+			dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+			goto err_media_entity_cleanup;
+		}
+	}
+
 	ret = v4l2_device_register_subdev(v4l2_dev, sd);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register subdev: %d\n", ret);
-		media_entity_cleanup(&sd->entity);
+		goto err_v4l2_subdev_cleanup;
 	}
 
+	return 0;
+
+err_v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_media_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+
 	return ret;
 }
 
@@ -829,5 +1045,6 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
 {
 	v4l2_device_unregister_subdev(&csiphy->subdev);
+	v4l2_subdev_cleanup(&csiphy->subdev);
 	media_entity_cleanup(&csiphy->subdev.entity);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 9d9657b82f74..e55c098dbe67 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -84,6 +84,7 @@ struct csiphy_hw_ops {
 
 struct csiphy_subdev_resources {
 	u8 id;
+	bool streams_enable;
 	const struct csiphy_hw_ops *hw_ops;
 	const struct csiphy_formats *formats;
 };
@@ -114,6 +115,7 @@ struct csiphy_device {
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
 	struct csiphy_device_regs *regs;
+	u64 enabled_streams[MSM_CSIPHY_PADS_NUM];
 };
 
 struct camss_subdev_resources;
-- 
2.34.1

