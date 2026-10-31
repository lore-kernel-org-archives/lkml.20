Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419922;
	b=CZdeh8oxpSjxRJsBwONRkrPsx7qQ2ePTC/GkCdR5uLyrEM0GQMo7aTxDjEHXju0PNwBs
	 UruRygGHwSHRD6I09nMe8DIg7RTSMPhZ584q4XPzeJRdGsKAkWPrgmAjLfBKWKyd9Bdkn
	 3MWe0c+9CKDjyEvUt8h7FkPNfSXcruKTAgGEOQu1iLafr1E4WTjnNqsEGmvKVEoUHv/uy
	 rmbhXbJyWkzM88u9MFQhnJgQq0EXbE4WAVpWBjBiKA/e8SvJOht+ScnpbXH2nJf9W9xD0
	 hHLVEr+xHCKCsnZrT6gIy79sHCqR/wWbutKNw0PknYtl+UMZmuwItgIwu88Ovu8dLeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419922;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=GszWRT/Fyxqj63tCMa36qUsQJWrYvizDpQoN+JNE2mA=;
	b=cDpbGW0YYQiZslmOgzETrQFMhMteTTEF3RDbOS60tckUt0FDL1loaBm1IvYHIS7nBU5A
	 EXnye2EJYHhGMOxp/kXn3axq1++zm6cJYnSU12g16N59SlKVg6bGGkPmIn1FlYKjwQsj7
	 95efWCgQYLRZqzegJ6woGBZ5bFMfQ3/fB12Ii8NZndtmzjA4AvfALg7FLm332uYsfCDdz
	 zu3nkVHIUaPU8XJFKoJawEONqiQ1UecWt145MQIyXyYogk+wpNhRc5i3cCa5PvHh31c3K
	 whkid731UPTvXL73RQZZBZWj9nhWy0elAStM3tmSjI6lRWdN+TV6RMxra2R5M+92V4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=jOfGQmO+;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A69606A31E;
	Sat, 31 Oct 2026 04:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=jOfGQmO+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=GszWRT/Fyxqj63tCMa36qUsQJWrYvizDpQ
	oN+JNE2mA=; b=jOfGQmO+b5Qp+remS/ZY0LoQmjs/U1B/jLUnrbmlRMi7JTlOU8
	k9hiiMx+6i45Ig6KhZ/bxHOib4vZCvUbmfXgxBo1z01qKXd7tRtLtk6+xasAlTxm
	UlzgGYj37ChIxmPTyBbRRzi2eMLHCa8hTXHnbVkXaTxCiu5cIjWAGbjKk=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAHjUGKauVqawFtAA--.1802S4;
	Sat, 31 Oct 2026 12:11:55 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] media: camss: video: factor pipeline stream on/off into a helper
Date: Sat, 31 Oct 2026 12:11:54 +0800
Message-ID: <20261031041154.308030-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031041154.308030-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031041154.308030-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgAHjUGKauVqawFtAA--.1802S4
X-Coremail-Antispam: 1UD129KBjvJXoW3WrW7Ww15ur4DGF43Cr4Uurg_yoW7uw4DpF
	W8ta45KFWaqFy0ga17Aa15JF13G3sYy343Kry3C3WrCF43Jr1Yqrn3K348AFWUC3y8Z3W2
	yrWj939rur4rWFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUY7P
	EDUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwAosq

When one subdevice fails to start, the ones already started further up the
pipeline were left streaming, and the next start would try to start them
again.  video_stop_streaming() returned early on the first subdevice that
failed to stop, leaving the rest running while the pipeline was torn down.

Factor the walk into camss_video_subdevs_set_stream(video, bool), used by
both start and stop.  A start error now unwinds the partial start by
disabling the pipeline again; streams already in the requested state report
-EALREADY, so the subdevice that failed to start (never marked enabled) and
the ones above it (never started) are left untouched.

Locate each subdevice source pad with
media_entity_remote_source_pad_unique() instead of assuming pads[0], and
toggle it with v4l2_subdev_enable_streams() and
v4l2_subdev_disable_streams() instead of the legacy .s_stream() call; the
camss subdevices only implement .s_stream() so the helpers fall back to it.

Suggested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../media/platform/qcom/camss/camss-video.c   | 109 +++++++++++-------
 1 file changed, 65 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f13..9a633ca066 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -249,13 +249,66 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
+/*
+ * camss_video_subdevs_set_stream() - Enable or disable a video pipeline
+ * @video: The video node whose pipeline is toggled
+ * @enable: true to start the subdevices, false to stop them
+ *
+ * Walk the media pipeline upstream from the video node and toggle the stream on
+ * each subdevice.  Each subdevice source pad is located with
+ * media_entity_remote_source_pad_unique() instead of assuming pads[0], and the
+ * stream is toggled with v4l2_subdev_enable_streams()/
+ * v4l2_subdev_disable_streams() rather than the legacy .s_stream() call.  The
+ * camss subdevices only implement .s_stream(), so the helpers fall back to it.
+ *
+ * A stream that is already in the requested state reports -EALREADY.  On the
+ * teardown path this simply skips subdevices that were never started, so a
+ * partially started pipeline is unwound by disabling it again: the subdevice
+ * that failed to start was not marked enabled and is left untouched.  A
+ * subdevice without a streaming operation reports -ENOIOCTLCMD, which is
+ * ignored here to match the previous .s_stream() call sites.
+ *
+ * Return: 0 on success, or the error code of the first subdevice that failed.
+ */
+static int camss_video_subdevs_set_stream(struct camss_video *video,
+					  bool enable)
+{
+	struct media_entity *entity = &video->vdev.entity;
+
+	while (1) {
+		struct media_pad *pad;
+		struct v4l2_subdev *subdev;
+		int ret;
+
+		pad = media_entity_remote_source_pad_unique(entity);
+		if (IS_ERR(pad))
+			break;
+
+		if (!is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		subdev = media_entity_to_v4l2_subdev(pad->entity);
+
+		if (enable)
+			ret = v4l2_subdev_enable_streams(subdev, pad->index,
+							 BIT_ULL(0));
+		else
+			ret = v4l2_subdev_disable_streams(subdev, pad->index,
+							  BIT_ULL(0));
+
+		if (ret && ret != -EALREADY && ret != -ENOIOCTLCMD)
+			return ret;
+
+		entity = pad->entity;
+	}
+
+	return 0;
+}
+
 static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
 	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
-	struct media_pad *pad;
-	struct v4l2_subdev *subdev;
 	int ret;
 
 	ret = video_device_pipeline_alloc_start(vdev);
@@ -268,22 +321,11 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret < 0)
 		goto error;
 
-	entity = &vdev->entity;
-	while (1) {
-		pad = &entity->pads[0];
-		if (!(pad->flags & MEDIA_PAD_FL_SINK))
-			break;
-
-		pad = media_pad_remote_pad_first(pad);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			break;
-
-		entity = pad->entity;
-		subdev = media_entity_to_v4l2_subdev(entity);
-
-		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
-		if (ret < 0 && ret != -ENOIOCTLCMD)
-			goto error;
+	ret = camss_video_subdevs_set_stream(video, true);
+	if (ret < 0) {
+		camss_video_subdevs_set_stream(video, false);
+		dev_err(video->camss->dev, "Video pipeline start failed: %d\n", ret);
+		goto error;
 	}
 
 	return 0;
@@ -300,34 +342,13 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 static void video_stop_streaming(struct vb2_queue *q)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
-	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
-	struct media_pad *pad;
-	struct v4l2_subdev *subdev;
 	int ret;
 
-	entity = &vdev->entity;
-	while (1) {
-		pad = &entity->pads[0];
-		if (!(pad->flags & MEDIA_PAD_FL_SINK))
-			break;
-
-		pad = media_pad_remote_pad_first(pad);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			break;
-
-		entity = pad->entity;
-		subdev = media_entity_to_v4l2_subdev(entity);
-
-		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
-
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
-	}
+	ret = camss_video_subdevs_set_stream(video, false);
+	if (ret < 0)
+		dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
 
-	video_device_pipeline_stop(vdev);
+	video_device_pipeline_stop(&video->vdev);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
 }
-- 
2.53.0

