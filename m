Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158881;
	b=xYyTNXGHWgRH7hohhIqve6AeNeXSc7jzIGRBzk4XnaUjItzulRsJLx64bexGK8vpXGjh
	 riqYNrUiUg8kWj0YKjNkChWkL9O6tfrlouSaPn2RcXN2+pCZbwh52DHy0eKUYXnFaPqyh
	 Y5yLmBECPPpkRuLF2ukgIBhg/6bgtT0tmySDUwmEyU6sN/22TZobsm3caamsIluaJyQJf
	 RqTQYWEC32O4iUIVKccrC7gbxORprISchwPnqZXA9ImzY/cKH3Go10ZIuAK5dingmuyrM
	 XzE/ofryRFZMDNDrnhT5QlbrgxgosH9+QkiEZrE84TNFamN9nnPjan99FAOpfxs3N/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158881;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=3EXXyX5va3tHTtjCGa0DMtYwejMB9WIO3viEeD2GKho=;
	b=Ya7hVIvlnAnsX1iln9hp6Z5TNjw/GZpoObIZTD/e1//SS38m5fledQhhfEfscszYhqlz
	 HaWOnlKntyYI1L+IMnbZ+k2B8yIvUptXbZLFPCVICH4mZLBefm6YE6p7ypHL0bsZF/APy
	 Sz/iJylBHFWqzEB0DXhNIx21NGZIozCeNcctwqjrfW2RV7LrApXHiWyNJtnEtaLjcxgGN
	 Utiu5khU2Ls/mztVVjgmOWwDyOwh9wQq2HvKxdOCV7u35MmKHB8ZFQo4Sx4Wlym9DCXFa
	 NIf+mB/3vqLJXdmXiXLfwI/j1bsojmC/og4Ic3H9YiIMrAxO8iwWhIF85jwbSmb0F2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=cjwjS6VP;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F48F606A327;
	Wed, 28 Oct 2026 03:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F48F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=cjwjS6VP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=3EXXyX5va3tHTtjCGa0DMtYwejMB9WIO3v
	iEeD2GKho=; b=cjwjS6VPrrGXY6drYJHBbAcQBUGe5sbZtwFBKp7Nc72sfsa9lZ
	+A1vdrLIz63+m6kIi+PhGVwjroda1t1y6aDeMqzYWxGThWUbSt6jFDA9fB2/ryAP
	ddpkmtbldTMJ+HI6lDU+Whf1Clw1j3kmYH+1z17v/3eHf2DSEPbedDB4U=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3szfSbuFqyQlWAA--.2887S9;
	Wed, 28 Oct 2026 11:41:12 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: 'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] media: camss: video: stop the subdevices already started when a start fails
Date: Wed, 28 Oct 2026 11:41:03 +0800
Message-ID: <20261028034105.326535-8-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3szfSbuFqyQlWAA--.2887S9
X-Coremail-Antispam: 1UD129KBjvJXoWxur48AFWDAFyftF1rCr15Jwb_yoWrJFy5pF
	18tFyYgFWSgFyUKw47Ar45Ja43K3sYy34ftry3Cw1rAF15tr1YqFs3K34FyFW5C3yUA3W2
	yrWjgrWUZr4rWFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E
	87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
	Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07br_-QUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARENB2rg+9YEMABLsC

When one subdevice fails to start, the ones already started further up the
pipeline were left streaming, and the next start would try to start them
again.  Factor the teardown loop out of video_stop_streaming() into
video_stop_subdevices() and run it from the error path, stopping at the
subdevice that failed.

While at it, keep stopping the remaining subdevices when one of them fails
to stop instead of returning early: the pipeline is being torn down, so a
failure there must not leave the rest running.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../media/platform/qcom/camss/camss-video.c   | 60 +++++++++----------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 027cf024f..ee9ffd043 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -265,11 +265,37 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
+/* Stop the started subdevices, excluding the one that failed to start. */
+static void video_stop_subdevices(struct camss_video *video,
+				  struct media_entity *stop)
+{
+	struct media_entity *entity = &video->vdev.entity;
+	struct v4l2_subdev *subdev;
+	struct media_pad *pad;
+	int ret;
+
+	while (entity != stop) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+		entity = pad->entity;
+		if (entity == stop)
+			break;
+		subdev = media_entity_to_v4l2_subdev(entity);
+		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
+		if (ret && ret != -ENOIOCTLCMD)
+			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
+	}
+}
+
 static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
 	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
+	struct media_entity *entity = &vdev->entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
 	int ret;
@@ -284,7 +310,6 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret < 0)
 		goto error;
 
-	entity = &vdev->entity;
 	while (1) {
 		pad = &entity->pads[0];
 		if (!(pad->flags & MEDIA_PAD_FL_SINK))
@@ -305,6 +330,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	return 0;
 
 error:
+	video_stop_subdevices(video, entity);
 	video_device_pipeline_stop(vdev);
 
 flush_buffers:
@@ -316,35 +342,9 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 static void video_stop_streaming(struct vb2_queue *q)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
-	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
-	struct media_pad *pad;
-	struct v4l2_subdev *subdev;
-	int ret;
-
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
-
-	video_device_pipeline_stop(vdev);
 
+	video_stop_subdevices(video, NULL);
+	video_device_pipeline_stop(&video->vdev);
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
 }
 

