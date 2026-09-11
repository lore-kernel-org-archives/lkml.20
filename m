Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DF53F5BC5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107766; cv=none; b=ahKujQJ8XRnPD1xcqYy7eLADbjOrmS+odsIT1uEWe+Nk6nIPqbVyQOhZ/YPW821w5SEaXnWC+A6cjmjp62C/MU5KSVGebTvjeCHgOw0ee767hYfTHKAeLjS1R3MLdEIOy68ueTMxYV3wVelanP89fTLOE9XP4tN+u5T2mgXPUtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107766; c=relaxed/simple;
	bh=P4yejfQoXWEs5WCIo/uSBIMrvzn27wZhAYZfF4/HElo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pSUscySnUadUNmtkYuJ5KsaN0oFD8LNfICXMZKA59DPrcc9BRoycQY5HN5HSwMXZba5f1/f/+8BNN41HLbceenZ9aJi0ICEJ6dRsR2PE2saT4FOLiwt2hfYBINWLONXOpDfaaCgr00PftfiGt8D+3Of0A2ZYg1BZ+4fleytxFHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lx/aQ248 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lx/aQ248"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B5NoL1099785
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PfojdtiyVIg
	osMA6X+iHeGMye0+VmyZKBg4VC9xW9VE=; b=lx/aQ2483xB8JntsTK70Vs6ZrBC
	Ho7PlKVSau9VG6ZB5ObLmWTvREKVo7fqxc5wwNr17ViJA/HTwOKMIwAWek7IPZrX
	CzbBk18RbINJmHKM9HoqFDegr7b/4gAtkvh3d2Dg+6d/uEyPEQbgdLwlF5Qkew1y
	Ojh9md1zwZRU06fDNyuRAsMMTMKfmS2n3OzYL1MbDClbunUbltPudVXN4dDtnwau
	/l+bP1PFp+070JNGcLT4zvS6GdU9gEq4f3VjDVAHajRoWsXndaq5Lqfi4+OC4P9U
	braS7XiYZZkuB59ZYJRwamjWzo5sEXFIdZN54aqKP1Cgy7pOA4dh8aEGygg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8g786-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939d6c515deso90517285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107751; x=1789712551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PfojdtiyVIgosMA6X+iHeGMye0+VmyZKBg4VC9xW9VE=;
        b=hkl09waGP4xXrGBiy8ZrOMu5zpZV5saOgsuEP2ACr7EykzXdYbKhIaZAqessjU93rU
         70EomqZ6QfecA3bNbV3XwlKmxaCzoRn4indJi8+wJKaYoxriYi/1DKeHGnuwGGT11TSQ
         i+bBCXG6ryJkawwnFd2daafIxIRI8rJstF3VJVRXo8TdZwp1TU0YZ+CeDMfAuWLH0leh
         WZ+XhcR/aiafMgbt9WTBOV6znYvbC9aQbAwta798B7nOPAgIA+qBB9iK3LGVz/psiRdh
         qO2ZPagSrFcTKA2Q8IS7Uho9UFX5g9WxDfN/rwFhM7tijpA6uEXkkwj7v4RLr/kXQOih
         VugA==
X-Forwarded-Encrypted: i=1; AKwUvBwPKjCi924rZSPzbUzTX4cQASJA9TUGMmAaO4H/scjko6FekUsQgPSJe1HYzKYR1MVhzFn45uMNKy5aMSg=@vger.kernel.org
X-Gm-Message-State: AFuF++ng96lRg4YD2c3ahXpnZkAzzu6J3A1x/M3xnkTZyS0nvHJdDnvP
	oGtX4vHdrPH2YxrF6NnPQtfNhSQjhlvtqVkNOkZX9fdSZ5pgzQW5i+6Dq0nFXXx1nMlah6hRWIV
	iNXtwPcma92EAidHWHpSMtNp/+AHFz0Zgqb1D7gEY9AMaEKI+RuNyPV+Jgx1yQgAyRDI=
X-Gm-Gg: AYBFou0C49NZ6/wXfwwhTPwkoiS+ZxiK9rXea6afMXNApJynMotf8WRkD8HggB6M0k7
	zheg5ja0dhMS+6DDWkcycSB03tTnY1ByJ3mVUoL6z7v/+gm0LZZSGB7niGhfp2n5YLX7gQplxJv
	dlJwnasIOuFNovwt+doLaTNs4PPMYhtMKD0pLEqxb37TTSGdw2f4XBDNNCX03H9DNdY+/9Mexzo
	/tuX/onWWpxdvZ3z4U27YctUKHF1NjzApqn6OGyB7wz+Indp152FHfECyM5lbAEmJCwmWAAwz8E
	v0OyKKPXqPoCtI8OJbkyKRLepdMH9OyNrRlxklRJ8MhGkTivuNsUGUcmGbI=
X-Received: by 2002:a05:620a:a0cc:10b0:939:f27c:7433 with SMTP id af79cd13be357-939f27c802bmr47740485a.50.1789107751001;
        Thu, 10 Sep 2026 23:22:31 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cc:10b0:939:f27c:7433 with SMTP id af79cd13be357-939f27c802bmr47738285a.50.1789107750457;
        Thu, 10 Sep 2026 23:22:30 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:29 -0700 (PDT)
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
Subject: [PATCH 7/8] media: qcom: camss: add streams API support in camss-video
Date: Fri, 11 Sep 2026 09:22:12 +0300
Message-Id: <20260911062213.195007-8-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: yYWkSZvN9ZlGt6rByhOuZtLHnm0gd-mY
X-Proofpoint-ORIG-GUID: yYWkSZvN9ZlGt6rByhOuZtLHnm0gd-mY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX+JkENG5/n0Cu
 n0IvKHg4BOlXiBqtaA1/V6olr+9mHPQR56ncO2U4nXVYFnNmR+fQpwcbBQMZACjfmD0vYJCRvr5
 wUyJKaGdRKZl9VhHehOdSmzBpCuExvPiYwhGM/pLjJgfswkWzUCT5M8HUKPUEcZpZs/g+LrGLNi
 C3c4zw+bY551CKk+Cf5X52LUxZc7UW4t7Kip8vg20ol68L72ftyEqjejhJleV4c3L6+mR6GBebJ
 ekpeUYme3r/grLXEpLMIvhQ8dd5zYIHKwStODdfBlCzm+ixi8Fz3MpILLsjyIGspWo/9c6itarN
 Cd8IKb5ScA49AsuSkOd0gp7V6HXjtgi1Gr8V2huEAQy8UMdLR03b85jQHOClfVaSaksnzot5I4o
 f9nkzq/zmSwRbvnH14vFoYOpNV9NOojXQNC2iroZLdHkcHkl/NGljfu6CIDyyAvrbA8kcu/Eoya
 NMkk7JH9LjGHLrRIjKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX/2hVtgDJ8YyA
 gFBXISoHWirJPptRIuGaWtTDpmqwjSvTNBmDc4n2CwGSJuusasuRB/qrKQfvTlIq64UqrE9DC2r
 sqgWA7gxUpfFDZ8p7trhIXZHGnQF8ZE=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa39e28 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=KYIyY8g0vu4ecJsuFiIA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Generalize the video device pipeline walk to be streams-API-aware:
when a directly-connected subdev supports enable_streams/
disable_streams, use it; otherwise fall back to the existing legacy
start/stop path, which walks the pipeline one subdev at a time via
.s_stream(), unchanged.

video_stop_streaming() must always call video_device_pipeline_stop()
and flush_buffers(), regardless of whether the disable path succeeded:
vb2 requires stop_streaming() to return all buffers, and a successful
pipeline_alloc_start() must always be matched by a pipeline_stop().
Make the legacy fallback branch match the streams-API branch by
logging a failure instead of returning early on it.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 119 ++++++++++++++----
 1 file changed, 94 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1315..7f7212996c4a 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -249,26 +249,27 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
-static int video_start_streaming(struct vb2_queue *q, unsigned int count)
+/*
+ * video_start_streaming_legacy - Walk the whole subdev chain and enable
+ *                                streaming via .s_stream()
+ * @video: Video device
+ * @sink_pad: Video device's own (single) pad
+ *
+ * Fallback used when the subdev directly connected to @sink_pad has no
+ * .enable_streams op. Mirrors the pre-streams-API pipeline walk: each
+ * subdev's pad 0 is assumed to be its sink pad, and streaming is started
+ * one subdev at a time via .s_stream() rather than the streams API.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int video_start_streaming_legacy(struct camss_video *video,
+					struct media_pad *sink_pad)
 {
-	struct camss_video *video = vb2_get_drv_priv(q);
-	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
+	struct media_entity *entity = sink_pad->entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	ret = video_device_pipeline_alloc_start(vdev);
-	if (ret < 0) {
-		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
-		goto flush_buffers;
-	}
-
-	ret = video_check_format(video);
-	if (ret < 0)
-		goto error;
-
-	entity = &vdev->entity;
 	while (1) {
 		pad = &entity->pads[0];
 		if (!(pad->flags & MEDIA_PAD_FL_SINK))
@@ -283,6 +284,42 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int video_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	struct video_device *vdev = &video->vdev;
+	struct media_pad *sink_pad = &vdev->entity.pads[0];
+	struct media_pad *src_pad;
+	struct v4l2_subdev *subdev = NULL;
+	int ret;
+
+	ret = video_device_pipeline_alloc_start(vdev);
+	if (ret < 0) {
+		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
+		goto flush_buffers;
+	}
+
+	ret = video_check_format(video);
+	if (ret < 0)
+		goto error;
+
+	src_pad = media_pad_remote_pad_first(sink_pad);
+	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
+		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
+
+	if (subdev && v4l2_subdev_has_op(subdev, pad, enable_streams)) {
+		ret = v4l2_subdev_enable_streams(subdev, src_pad->index, BIT_ULL(0));
+		if (ret < 0)
+			goto error;
+	} else {
+		ret = video_start_streaming_legacy(video, sink_pad);
+		if (ret < 0)
 			goto error;
 	}
 
@@ -297,16 +334,27 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 }
 
-static void video_stop_streaming(struct vb2_queue *q)
+/*
+ * video_stop_streaming_legacy - Walk the whole subdev chain and disable
+ *                               streaming via .s_stream()
+ * @video: Video device
+ * @sink_pad: Video device's own (single) pad
+ *
+ * Fallback used when the subdev directly connected to @sink_pad has no
+ * .disable_streams op. Mirrors the pre-streams-API pipeline walk: each
+ * subdev's pad 0 is assumed to be its sink pad, and streaming is stopped
+ * one subdev at a time via .s_stream() rather than the streams API.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int video_stop_streaming_legacy(struct camss_video *video,
+				       struct media_pad *sink_pad)
 {
-	struct camss_video *video = vb2_get_drv_priv(q);
-	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
+	struct media_entity *entity = sink_pad->entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	entity = &vdev->entity;
 	while (1) {
 		pad = &entity->pads[0];
 		if (!(pad->flags & MEDIA_PAD_FL_SINK))
@@ -320,13 +368,34 @@ static void video_stop_streaming(struct vb2_queue *q)
 		subdev = media_entity_to_v4l2_subdev(entity);
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
-
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
+		if (ret)
+			return ret;
 	}
 
+	return 0;
+}
+
+static void video_stop_streaming(struct vb2_queue *q)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	struct video_device *vdev = &video->vdev;
+	struct media_pad *sink_pad = &vdev->entity.pads[0];
+	struct media_pad *src_pad;
+	struct v4l2_subdev *subdev = NULL;
+	int ret;
+
+	src_pad = media_pad_remote_pad_first(sink_pad);
+	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
+		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
+
+	if (subdev && v4l2_subdev_has_op(subdev, pad, disable_streams))
+		ret = v4l2_subdev_disable_streams(subdev, src_pad->index, BIT_ULL(0));
+	else
+		ret = video_stop_streaming_legacy(video, sink_pad);
+
+	if (ret)
+		dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
+
 	video_device_pipeline_stop(vdev);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
-- 
2.34.1

