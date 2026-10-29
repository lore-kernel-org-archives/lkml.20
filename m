Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277084;
	b=WJ4GK0ZjnoeNjCMGpFZLYYEqtX6lUP2cDyZVzbs85gKxmcqUTO/MiFf+Cf0dRQPLpREs
	 hkMkud5ifA/dO17vtENEew+NRD8NFrbCWx+UNbO8Au6EBfkhw1qSlwbVujhB23OCwvAms
	 a+f614p8M7zngaUUHJcugMDcwS1vzTaC3asEd0fPgjm4/Nt4qt6jTY+wU0J8LGUq5zy74
	 1fkSFNAS6y+HtJWoYdo2+veG5HTstaaBLZlkLSXbS8hWlky6uYWM5O3RWj7CYMlAG12oR
	 JzRU0xwLbfjC/0TOEk/I31xTKtFx2HEfD72E7RMVuVhY59atTqo8NyytwFNL24PCChA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277084;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=8xOtUyrD5kEWrLdn4tzkr361LS3c/th+u/ILxOBVBXs=;
	b=hI+uhSIdJUl6a9gt7So8xRcoQrsWvnRiLnWdUQABgchAlFpBGgaNd6xumCeGQoqmEcfH
	 5CXEe7xfLuU3fIG9fHoTVfDQlXB+c4kvHv+d5upttEH0cwGercdQ0mFEEP8PqKo1h/vhG
	 okkJ7uL8YMNgMt2nuC/Lf9E1sERJHaxP/AQfUn9hUSWVGrQKduIQVh6g52RZdSU7G8GJ8
	 UvqbITOb8ic5MixyJh75i5GLTsdQSB1kPnMwxw3sx6qwKqaRIDQYDJB4dKL6Ms2hvVHAx
	 eYlh4SenDd9RCq/fpKz6px4iEvhAhHAS32QzoO+kd1QKpY+aHfjCPyQdF6Ka4Xf+u+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=D11rzkbD;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD19F606A31A;
	Thu, 29 Oct 2026 12:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD19F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=D11rzkbD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=8xOtUyrD5kEWrLdn4tzkr361LS3c/th+u/
	ILxOBVBXs=; b=D11rzkbDNJKKcnJGGlm0rfd6/19SE8VSzutzKgADJzY4VUWd0n
	xsMnVLK4VCMuIDDlY9zBlfajVx3n0kJ8lQQvAet78ZPnNivMJKMFcX8PeVB9qryj
	+mcPAU2Pkhmgj7b0xFVZd5TfQo9XmHqJYbStYdxhLu5xm5KLiYU4ZreU4=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.224.240])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3OD2LPONqnPVgAA--.841S5;
	Thu, 29 Oct 2026 20:31:10 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: camss: video: stop the subdevices already started when a start fails
Date: Thu, 29 Oct 2026 20:31:07 +0800
Message-ID: <20261029123107.28705-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgC3OD2LPONqnPVgAA--.841S5
X-Coremail-Antispam: 1UD129KBjvJXoWxur48AFWDAFyftF1rCr15Jwb_yoWrJFy7pF
	18tFyYgFWSgFyUKw47Ar45Ja43K3sYy34ftry3Cw1rAF15tr1YqFs3K34FyFW5C3yUA3W2
	yrWjgrWUZr4rWFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK67AK6ryUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5BV
	bJUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREPB2riTVZTsQBOsn

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
index 027cf024f9..ee9ffd0432 100644
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
 

