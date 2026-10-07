Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944CA47FAF3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363850; cv=none; b=hm80ImoVVxA3DNdsGKM0hwrvm1QT/RqJ6tladzH+R+Jz4SYOfKfHBMOH+tMeHcDsJZBIAWeGfkt/1174oS6YE35ghLVGBeQwZZNCW0o5X9zeTRgT3Rw7fGFL9km1ojPJfxWhBZhVgTPMCCCaqB4nYh2RHnsAYF0goGd3TU+Pwis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363850; c=relaxed/simple;
	bh=a61iNzjTlj5EYjp8kMT4hI97L5A1x3WL1zMjpyRYt0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MT+GEvUiVTI48XO1HMLPAev7S/AjFSVau1gmzjx0zRSU1sFCBOtPKDj9DoMXrtlSIAdNDb0ay3bB+2nUlDnHJpjIk3hznQKXzzP0ppG1shSrdLu15zfSU9/l1YHUbPm6Iy/6F9hR7JQS5evE6Qo84YvVASV4leKi/mzUsPJNTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDWj4aLP reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDWj4aLP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jbaN119022
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wZo1SiuyUeG
	k0p1Dd0+8C0DK4QKg6hk7x9uPquKwVbQ=; b=WDWj4aLPwLPsXTRbJpZNQ3ubKjf
	ywysf3NfMlpxRLwZO96JJ7eJYKS8XC5Q/0eflt4TCUOCTd39ZmJpFPDXvJqisGgn
	czOURB9ORPqXjr3qNyUEGL3M1oQV2+YrtiIZcR+W6y3z+m6caYd7i64XoRP8UlYT
	+oS8EzBcdXqbOUeCMuX69W4/3S9P3hoDPJmNiJQsm6p66pOgHQ2wB25SkFllQGaQ
	gddMZ/7YD4JKqvBPygGcc76/hwIJxg9Jk/bYcQug5NPAubSaHAZRLpxJUcBcoPHX
	BxDQuvQXpiw7nPpQPAjId19qImpgHaKF8fRfibbZ0A9qe2z3jbdhkCFd5HA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58r24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:01:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179a2035a4so37007226d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363698; x=1791968498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZo1SiuyUeGk0p1Dd0+8C0DK4QKg6hk7x9uPquKwVbQ=;
        b=raG2D8zlijma5B4zUMq342Vy9PVctZbKEKc4f2uwmOtsMT3UuPupIB0OdxjIq5ad8M
         RX8aW//GUkfc2bdGNuzcmHOhJtPEOcDyv0aVpUbIoeQhUgkuJxz/M4yB+jJp3IteDsV6
         1vW1fNTW7nowsG3zO+kvdp1lfqaUT9EAycrH7Tj3wXe1HuSHobpYIYd17ecHAboU5hwW
         0paLsfIhgOYIY3gvTxGIZLvhJ6DKcNLJzocHkYo6R26QR+oyWVxQiFL48lZQTk7Qw9nB
         E71THYAT54/blrm5AGXakw7TIrE/8DO2c5xL0413GxqHXipBleUXLNQhs2NpdVzzxWQw
         gQng==
X-Forwarded-Encrypted: i=1; AKwUvBwYbs8vk2+AsRuZhg4ZwZiwKyIoeW8UhTyt9FSNKdQtkJhmc8B5ebUMTj5++NCutfQ3t56H7Ho0sLjviHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mwo53hPPNL3x+0t+JbIeAx/Kr1PF5imLtSwPfrGxCTdTLxg9xT
	7iWvuB4Ira2yv9sVre4faGag2d2TIdq13TXeiZuRPrNlrgR2GArfnViORxXqkXj/4CCZYWg2QzM
	soKhVKoQFva4QIMps6fzwnTu/ETdO+OdrbUqt2UP8KGKIBNnNXfM7IIlt4JNNzH9y9B8=
X-Gm-Gg: AYBFou3GlxB67HtrSOp5h+QlBNwbDendKJ6D6rlM+vSiM/hVN3H1TIsYlghcjDFOhaZ
	lTJ+QeYyc0IPDClBOKxOMP8UjWgl+3LykAwuFEa9/TAaVPxNycNAmk6uwm3OpCe85uCxG4imqyb
	AKLo4n5vV4QLmAFza7AbOjSA+Xy9JNxONd634KaQjTuOqKVacQmD6Edi5zWZvl6P0+nKWWvegIt
	FuPsT0zdVtle8wlsQTESF+LRpf6AkZiRsXxkCafVBM6hi1eZ3aCeotYQFab1bO/MpnWwBieahcf
	XyZp3doWHjdUJyUwQhNOdYqYeJGheDNAbsCFwkp3mqjX9rnFE1yKPBIT0qU=
X-Received: by 2002:a05:620a:711c:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93e85ff6e47mr1009188785a.7.1791363698162;
        Wed, 07 Oct 2026 02:01:38 -0700 (PDT)
X-Received: by 2002:a05:620a:711c:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93e85ff6e47mr1009182985a.7.1791363697651;
        Wed, 07 Oct 2026 02:01:37 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:36 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 14/45] media: qcom: camss: video: add managed streaming callbacks
Date: Wed,  7 Oct 2026 12:00:10 +0300
Message-Id: <20261007090041.3732717-15-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX8y4a1GS5sxgA
 pKqJWuL9+qYA/u9+Dg+9eRaC23Ksqh97sQsnu+SlvO22hW9tT7V2knj4i9qap0OysAx+YtzP/Uq
 HiokcJvK1yVmsH5ZxZ2QyPWotcPFVYM=
X-Proofpoint-GUID: efnsGIcUtd-SSnpB7WjvgIu8dOoU8rrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX1e1v11i4vPEg
 q67EGtMfnLmJnfOVJLU6hj5//ISJsw5kJJOVWabElyCda1i2z27e3bNO+aIaZD022YU99yKhYST
 DF5f8cDyqpaK32BpR699YvFiKx9WE/DcAqoKZMoktE1A2I1WkaVOqfbFCz+K5RmTCUMeBCNx1ZS
 YagM0LxtHXh06tqOAo/yks2+lRoayJdU9dej+6940ohDECm1bj5saaj9L1u3+iZqqfM5gSgj5ow
 Mfh1+LTTgMNpEMcjY+fww4H/af1KEIzUa3uMk9z2DuOtPiYPqDeuWCwLUbehq8bEmOThTS8bNXz
 oT+jFw07qQB9/YprcKQ14sOR+XOVOluypKWf9JzsmRf6eYOHfPC1lEp9basXn5CZd1DJsFnzWUQ
 h5j13xLjBuz3PNnutfAa/zAF41mY5P54J5HYo8lxJ7doIRDSVJiCxnoEJMDz7PGRAdIxB/llhxC
 L0ViG4yWpk/gvd/yxrg==
X-Proofpoint-ORIG-GUID: efnsGIcUtd-SSnpB7WjvgIu8dOoU8rrY
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac60a73 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=WDhTVHpYbZKqloR8QRsA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Allow a CAMSS video node to start and stop streaming and select its
buffer type. Keep the existing path when callbacks are absent.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 17 ++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-video.h |  2 ++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 803e5ce9b9fd..cb9e08e9ff7e 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -159,6 +159,7 @@ static int video_buf_init(struct vb2_buffer *vb)
 	struct sg_table *sgt;
 	unsigned int i;
 
+	memset(buffer->addr, 0, sizeof(buffer->addr));
 	for (i = 0; i < format->num_planes; i++) {
 		sgt = vb2_dma_sg_plane_desc(vb, i);
 		if (!sgt)
@@ -303,6 +304,14 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret < 0)
 		goto error;
 
+	if (video->ops->start_streaming) {
+		ret = video->ops->start_streaming(video, count);
+		if (ret < 0)
+			goto error;
+
+		return 0;
+	}
+
 	src_pad = media_pad_remote_pad_first(sink_pad);
 	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
 		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
@@ -370,6 +379,11 @@ static void video_stop_streaming(struct vb2_queue *q)
 	struct v4l2_subdev *subdev = NULL;
 	int ret;
 
+	if (video->ops->stop_streaming) {
+		video->ops->stop_streaming(video);
+		goto stop_pipeline;
+	}
+
 	src_pad = media_pad_remote_pad_first(sink_pad);
 	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
 		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
@@ -382,6 +396,7 @@ static void video_stop_streaming(struct vb2_queue *q)
 	if (ret)
 		dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
 
+stop_pipeline:
 	video_device_pipeline_stop(vdev);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
@@ -766,7 +781,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	q->drv_priv = video;
 	q->mem_ops = &vb2_dma_sg_memops;
 	q->ops = &msm_video_vb2_q_ops;
-	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	q->type = video->type;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->buf_struct_size = sizeof(struct camss_buffer);
diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
index d3e56e240a88..f62a72c29a5a 100644
--- a/drivers/media/platform/qcom/camss/camss-video.h
+++ b/drivers/media/platform/qcom/camss/camss-video.h
@@ -31,6 +31,8 @@ struct camss_video_ops {
 	int (*queue_buffer)(struct camss_video *vid, struct camss_buffer *buf);
 	int (*flush_buffers)(struct camss_video *vid,
 			     enum vb2_buffer_state state);
+	int (*start_streaming)(struct camss_video *vid, unsigned int count);
+	void (*stop_streaming)(struct camss_video *vid);
 };
 
 struct camss_video {
-- 
2.34.1

