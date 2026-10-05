Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D07F534475;
	Mon,  5 Oct 2026 17:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220791; cv=none; b=F2VuLKfNNgiDp54TlCiio0G+ATMx3ea2I6M1VrofDc7NId5c7fF17vAv8ZkiNxAtLo09pWuEOcTH8GeGvMW88XM2L5eAM83jwgH5TpBann30WijKJtaELUdJKtKUd2pB+s81hkU0v/2m6vKE+Pr7+CFLvvGpnbAwJT9Ks3/aya4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220791; c=relaxed/simple;
	bh=ZV+DzXTFNkh3zwHkdDxdU3i5HERQQ2XaIfxxEASN05w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jiy15d5M7HBn869RxPsc1zXc9O7cQZxyk3kdRNe/3ZOWbHECpu18pSB2sWKv3WWi5JcKtIS/0yDlDlorOl2LQDkXmum1Ngh+9V3bt9ta+pk97D7SO+eAwFYZ3Pz5i1XtURBK+B7n1y0MiylztE8ct9B9Xsr6w0x0Ep0LKbZ/88k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXLBFyKZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXLBFyKZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAA21F00893;
	Mon,  5 Oct 2026 17:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220790;
	bh=4WCgvgjiX7NmbWZFChOGJ3gL4snoJ7jxESLhI6YAqgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OXLBFyKZ0oOeDUN1/8PKmAvAwQ5oak8zB6EdO0wp+DFi83eK+AExanWO40ajy11TJ
	 mdU1E3APnmP0gdSWbv9ZriDdOOCFX5/Vn+60PEGiZvQPmI34HTuMlNHrmqWCOslMtH
	 8shQ7pTSNMy5ZzRY5vMeKl2jZ75sVlir/LyYHf96l0PfDw3ZpZm3bxGJlElUmGVp14
	 PQ2kSa4lbK+U85OrpaNBuUOpQadV3mExXjqGNGE/5C1ZuBeI3woJHpu2REmDYbqZsl
	 8PBWcv5C3eBeAxPfpSm3jUe/C9DLJZV6mEOljBt+602lLkdpDZdaKpVcVMjKrvV8mk
	 zM+13fO19anfg==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:40 +0200
Subject: [PATCH 70/74] media: qcom: camss: video: Support metadata output
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-70-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8062; i=bod@kernel.org;
 h=from:subject:message-id; bh=fWoDS04z8vTzAkDHhK6HSgRVz3OaAss2MHUHCFmrKak=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGrD2zPIpYW1RuZmapxr/vfa64IT4H4zPk93wcQOX6VyOZEnM
 IkCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJqw9szAAoJECJxO7Ohjcg69cwQALW4
 kHMm67moqMaJiNse0oQ0wzBU73T1rE7b3gj5/E48rN+K+FWJbbvHZ+jE68tThdIjj3HZ3SUk1UI
 NrkmR6gn05OPTv7frUzTk1X0R9uCGvivkbtoxrqRoWN3UhvdI1NCyxxY7mtB0P1aZsdxQN0km91
 wn8Cm+TBnxz1ndCoIcsQh2gDqmmOjNsDqwHr80Bmajr6/EbCJqx7XbEG4QHQ4zWqX7wxSH+dm8O
 ZaNoY5woYffhqXLJmnYhTD0zeD22EEmvL75SY4/ge3r9Z6LyS5cuA/4BaIKOyPWPdp+PYnMJQtH
 0qGo5FDpPRidQdpxZOH5ekgD/q7QNBHBbNut7ndysWrQHMjSCtTNXL6C+N2RW6nkI/YOKYQZeY7
 VVq68RU0vECAXJH5Wzn3ezwc4H96tuDYB+7P5EFheIbYsPrv9cxt2J6L2pXQzM03IpCJM8Zi6ji
 NVzddojmVfiIJr9jXHOyeKPUzvBj+QlTgk6Y5rLMTPS1lLl3Zf0qK1e7IkY7EARpgwTimbVNxxa
 e3Dt4hSl2iy2fuh3bfc6C7zTcZUGAXnxBfwss0AUFroYMajORarJpWCMLLbHM7ZweqSdsoFK3Cb
 L6yP7Uv63sa40sO4GxW5el2Do5NwWODe7325DrKYaKlzI3Wr2JhjyUj8ZG6u5HCABHWNRdKciuS
 1Ad2Q
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Parameters need metadata output nodes. Register a node of video->type
V4L2_BUF_TYPE_META_OUTPUT alongside the metadata capture node:

- a source pad, VFL_DIR_TX and the META_OUTPUT format ioctls, returning
  the fixed format the producer sets before registration
- each buffer has a kernel copy, buf->meta: the payload is copied into
  it when the buffer is prepared, and the optional prepare_buffer()
  video op validates the copy, so what is validated is what the
  producer consumes
- like the capture node, it neither starts nor stops the line, and
  stopping it returns its buffers

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-video.c | 101 ++++++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-video.h |   8 ++
 2 files changed, 101 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index b8501c895d393..69cbe78b80622 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -414,6 +414,65 @@ static const struct vb2_ops msm_video_meta_vb2_q_ops = {
 	.unprepare_streaming = video_unprepare_streaming,
 };
 
+/*
+ * A metadata output buffer is copied to the kernel when it is prepared, so
+ * what is validated is what the producer later consumes.
+ */
+static int video_meta_out_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct camss_video *video = vb2_get_drv_priv(vb->vb2_queue);
+	struct camss_buffer *buffer = container_of(vbuf, struct camss_buffer,
+						   vb);
+
+	buffer->meta = kvmalloc(video->active_fmt.fmt.meta.buffersize,
+				GFP_KERNEL);
+
+	return buffer->meta ? 0 : -ENOMEM;
+}
+
+static void video_meta_out_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct camss_buffer *buffer = container_of(vbuf, struct camss_buffer,
+						   vb);
+
+	kvfree(buffer->meta);
+	buffer->meta = NULL;
+}
+
+static int video_meta_out_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct camss_video *video = vb2_get_drv_priv(vb->vb2_queue);
+	struct camss_buffer *buffer = container_of(vbuf, struct camss_buffer,
+						   vb);
+	size_t payload = vb2_get_plane_payload(vb, 0);
+
+	if (payload > video->active_fmt.fmt.meta.buffersize)
+		return -EINVAL;
+
+	memcpy(buffer->meta, vb2_plane_vaddr(vb, 0), payload);
+	vbuf->field = V4L2_FIELD_NONE;
+
+	if (video->ops->prepare_buffer)
+		return video->ops->prepare_buffer(video, buffer);
+
+	return 0;
+}
+
+static const struct vb2_ops msm_video_meta_out_vb2_q_ops = {
+	.queue_setup     = video_meta_queue_setup,
+	.buf_init        = video_meta_out_buf_init,
+	.buf_cleanup     = video_meta_out_buf_cleanup,
+	.buf_prepare     = video_meta_out_buf_prepare,
+	.buf_queue       = video_buf_queue,
+	.prepare_streaming = video_prepare_streaming,
+	.start_streaming = video_meta_start_streaming,
+	.stop_streaming  = video_meta_stop_streaming,
+	.unprepare_streaming = video_unprepare_streaming,
+};
+
 /* -----------------------------------------------------------------------------
  * V4L2 ioctls
  */
@@ -721,6 +780,23 @@ static const struct v4l2_ioctl_ops msm_vid_meta_ioctl_ops = {
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
 };
 
+static const struct v4l2_ioctl_ops msm_vid_meta_out_ioctl_ops = {
+	.vidioc_querycap		= video_querycap,
+	.vidioc_enum_fmt_meta_out	= video_meta_enum_fmt,
+	.vidioc_g_fmt_meta_out		= video_meta_g_fmt,
+	.vidioc_s_fmt_meta_out		= video_meta_g_fmt,
+	.vidioc_try_fmt_meta_out	= video_meta_g_fmt,
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+};
+
 /* -----------------------------------------------------------------------------
  * V4L2 file operations
  */
@@ -796,7 +872,8 @@ static int msm_video_init_format(struct camss_video *video)
 int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 		       const char *name)
 {
-	bool meta = video->type == V4L2_BUF_TYPE_META_CAPTURE;
+	bool meta_out = video->type == V4L2_BUF_TYPE_META_OUTPUT;
+	bool meta = meta_out || video->type == V4L2_BUF_TYPE_META_CAPTURE;
 	struct media_pad *pad = &video->pad;
 	struct video_device *vdev;
 	struct vb2_queue *q;
@@ -809,9 +886,13 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	q = &video->vb2_q;
 	q->drv_priv = video;
 	q->mem_ops = meta ? &vb2_vmalloc_memops : &vb2_dma_sg_memops;
-	q->ops = meta ? &msm_video_meta_vb2_q_ops : &msm_video_vb2_q_ops;
-	q->type = meta ? V4L2_BUF_TYPE_META_CAPTURE :
-			 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	if (meta_out)
+		q->ops = &msm_video_meta_out_vb2_q_ops;
+	else if (meta)
+		q->ops = &msm_video_meta_vb2_q_ops;
+	else
+		q->ops = &msm_video_vb2_q_ops;
+	q->type = meta ? video->type : V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = meta ? VB2_DMABUF | VB2_MMAP :
 			     VB2_DMABUF | VB2_MMAP | VB2_READ;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
@@ -824,7 +905,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 		goto error_vb2_init;
 	}
 
-	pad->flags = MEDIA_PAD_FL_SINK;
+	pad->flags = meta_out ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&vdev->entity, 1, pad);
 	if (ret < 0) {
 		dev_err(v4l2_dev->dev, "Failed to init video entity: %d\n",
@@ -836,7 +917,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	if (meta) {
 		/* dataformat and buffersize are set by the producer */
-		video->active_fmt.type = V4L2_BUF_TYPE_META_CAPTURE;
+		video->active_fmt.type = video->type;
 	} else {
 		ret = msm_video_init_format(video);
 		if (ret < 0) {
@@ -847,7 +928,11 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	}
 
 	vdev->fops = &msm_vid_fops;
-	if (meta) {
+	if (meta_out) {
+		vdev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING |
+				    V4L2_CAP_IO_MC;
+		vdev->ioctl_ops = &msm_vid_meta_out_ioctl_ops;
+	} else if (meta) {
 		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING |
 				    V4L2_CAP_IO_MC;
 		vdev->ioctl_ops = &msm_vid_meta_ioctl_ops;
@@ -859,7 +944,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	}
 	vdev->release = msm_video_release;
 	vdev->v4l2_dev = v4l2_dev;
-	vdev->vfl_dir = VFL_DIR_RX;
+	vdev->vfl_dir = meta_out ? VFL_DIR_TX : VFL_DIR_RX;
 	vdev->queue = &video->vb2_q;
 	vdev->lock = &video->lock;
 	strscpy(vdev->name, name, sizeof(vdev->name));
diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
index d3e56e240a888..21a951b7fe9bc 100644
--- a/drivers/media/platform/qcom/camss/camss-video.h
+++ b/drivers/media/platform/qcom/camss/camss-video.h
@@ -23,6 +23,9 @@ struct camss_buffer {
 	struct vb2_v4l2_buffer vb;
 	dma_addr_t addr[3];
 	struct list_head queue;
+
+	/* Metadata output nodes: kernel copy of the buffer, validated at prepare */
+	void *meta;
 };
 
 struct camss_video;
@@ -31,6 +34,11 @@ struct camss_video_ops {
 	int (*queue_buffer)(struct camss_video *vid, struct camss_buffer *buf);
 	int (*flush_buffers)(struct camss_video *vid,
 			     enum vb2_buffer_state state);
+	/*
+	 * Optional, metadata output nodes: validate the kernel copy of a
+	 * buffer, buf->meta, when it is prepared
+	 */
+	int (*prepare_buffer)(struct camss_video *vid, struct camss_buffer *buf);
 };
 
 struct camss_video {

-- 
2.55.0

