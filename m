Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9141B53162B;
	Mon,  5 Oct 2026 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220767; cv=none; b=dcnsN+t9cUfmVkiVSA7MtHiatXbg43STcqwCNhOXkHPHBbPptnUTP3aXLPlufI+6gSXO+cegOR1LeIklI00tltFrqytY+PuWWhfYkSMOoD2IMsnr/Yfq2nIILHT5bH7wOcgGKc/5boCZwNKwsiU+dtGg5wB8ShfCiiYeTBpu+Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220767; c=relaxed/simple;
	bh=l4nj61+L8CKSjjK81dSL8Ze75gii8ZRwG+fkLXfJJVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eDe8+pjDqmvTc6L3pWOLXXybQptu36o6Oj0qtnzovHI2tR3idK1lz59jaHoFY5hs9/kIpU2QmctLMxUx+8aoOetQ4dX48Cm0DJ4obJzWkOZgp7IJw4OaB3Z8zaqM2AaRemRZ0Sa7ZQi7snBsT/39ZbBbz90dk+g+Y4oJSjfmugQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=buERHcXy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buERHcXy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2897E1F00898;
	Mon,  5 Oct 2026 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220765;
	bh=yE8hrDea3oUOg/49nEkAZZj08ClsXWgu/jlIjT8zFPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=buERHcXywesWI/k68hqnwhqyipTmEdhafvl57fcrabJzdVTCOG2yqNAXbR+kTJTgv
	 ad9K0V1gb/4XcspXb7yXYW1lqKap2IQ3/QVYGx2sy9LnAEiv9Q59ke8+NruxqphJvb
	 8q2LrsTdjY/zSVccJ+HGm/BQaH1Rl/GLX1kbzUviPVmsMT/X/Xwzm/gmR9G4WPsPR7
	 kjtsPIgBHduR6mNp/b3nKGGNtYQnKqmvPo4RLgPpYXsaO+wiE+EY8eWJNlMtvToixh
	 rHqFxmJ9J75PVun0Or4VzXqrci1boeRrsasUBGwBOsR8+I1y/J4mNiKNy5qxbzKz0A
	 osQKWLxImN9qg==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:33 +0200
Subject: [PATCH 63/74] media: qcom: camss: video: Support metadata capture
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-63-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7941; i=bod@kernel.org;
 h=from:subject:message-id; bh=thslKgbAh/JmEhLkeimHSvwzopS7cfg4KYkWh8s9Uts=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9suOWjxnL6w3pyNkH4C9zFSqxbKVaMvA9T57
 UP8JarGUXCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbLgAKCRAicTuzoY3I
 OjuZD/4lriSqtK0DIA6Y5DehcKNFAiiFZ1pX2uL1PypKPkfADvfdvv1Qi9jPsmEEzYD6spmSPZg
 xHNhAPKGAYYIiNzMwPGEKts2f3jyasl57T0dPiqGC1bWsAe4Zqhj6hbFuqnCM3Sk7nTbhbiscQ0
 8HyVtddWhw5GeDweLdFpD/LN+3d3WOWnzc0rqWljbWQOYGk0Rw9tFdvW/ugRRdB/KILAm2VYA7L
 MvPLvAL3fiHo3Ndb3U0bfR1anR1FtktBhKEYpoL+w1ZC1UhJG5bAAh/D9j7i1CNT2HRgpaxt6P9
 hr0vJxySOWxPX378HvEu0NH1rrM4tKT/7jhPbf1QhDqny+4ePrUHrVaNMBdulGP8a/mGvVE5D16
 +ehqd2/RFhD5sV0Xhddsj1K5/UgFgnA4zLVZ0srqXayAcVB1lNOXVCVsgBcvSP/pSKn6LoSjSkO
 EcczmIPNebb+62QEhLo5R0LtZNa9xUzIGD2p5FZp7r6o3rguLnaVE3JqtI5655mpd3LAO3xXaQp
 XSnpPm7XAEdNXApk5r3Aui0F3YV9Vm9tjgKkBp/FsNo8n3cW9gJhiAfnfW70yoWgpZxee6pCCWa
 uwMyq67Aa0cfaYQXGAFj0m89pRe4Y2GLdT8VReea0MWgrCbo1lrMFA4850okI8EG/Y4NTSbESBo
 ggi1SpQvG48mBtw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

A video node is always a VIDEO_CAPTURE_MPLANE node. Statistics need
metadata capture nodes.

Register a node of video->type V4L2_BUF_TYPE_META_CAPTURE with its own
queue and ioctl operations:

- one plane of the fixed buffersize the producer sets with dataformat
  before registration; G, S and TRY_FMT all return that format
- buffers are vmalloc backed: the kernel fills them by CPU
- the node follows the image node of its line: starting it provides
  buffers and stopping it returns them, but neither starts nor stops the
  line

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Kconfig       |   1 +
 drivers/media/platform/qcom/camss/camss-video.c | 146 ++++++++++++++++++++++--
 2 files changed, 136 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 4eda48cb1adf0..42c3ee13e548b 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -6,4 +6,5 @@ config VIDEO_QCOM_CAMSS
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
+	select VIDEOBUF2_VMALLOC
 	select V4L2_FWNODE
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f13154..b8501c895d393 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -14,6 +14,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
 #include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-vmalloc.h>
 
 #include "camss-video.h"
 #include "camss.h"
@@ -351,6 +352,68 @@ static const struct vb2_ops msm_video_vb2_q_ops = {
 	.unprepare_streaming = video_unprepare_streaming,
 };
 
+/* -----------------------------------------------------------------------------
+ * Metadata capture queue operations
+ *
+ * A metadata capture node follows the image node of its line: the line starts
+ * and stops with the image node, and the node only provides buffers. The
+ * kernel fills them by CPU, so they are vmalloc backed.
+ */
+
+static int video_meta_queue_setup(struct vb2_queue *q,
+				  unsigned int *num_buffers,
+				  unsigned int *num_planes, unsigned int sizes[],
+				  struct device *alloc_devs[])
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	unsigned int size = video->active_fmt.fmt.meta.buffersize;
+
+	if (*num_planes)
+		return (*num_planes != 1 || sizes[0] < size) ? -EINVAL : 0;
+
+	*num_planes = 1;
+	sizes[0] = size;
+
+	return 0;
+}
+
+static int video_meta_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct camss_video *video = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned int size = video->active_fmt.fmt.meta.buffersize;
+
+	if (vb2_plane_size(vb, 0) < size)
+		return -EINVAL;
+
+	vb2_set_plane_payload(vb, 0, size);
+	vbuf->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static int video_meta_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	return 0;
+}
+
+static void video_meta_stop_streaming(struct vb2_queue *q)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+
+	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops msm_video_meta_vb2_q_ops = {
+	.queue_setup     = video_meta_queue_setup,
+	.buf_prepare     = video_meta_buf_prepare,
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
@@ -613,6 +676,51 @@ static const struct v4l2_ioctl_ops msm_vid_ioctl_ops = {
 	.vidioc_s_input			= video_s_input,
 };
 
+static int video_meta_enum_fmt(struct file *file, void *fh,
+			       struct v4l2_fmtdesc *f)
+{
+	struct camss_video *video = video_drvdata(file);
+
+	if (f->index || f->type != video->type)
+		return -EINVAL;
+
+	f->pixelformat = video->active_fmt.fmt.meta.dataformat;
+
+	return 0;
+}
+
+/* The metadata format is fixed: G, S and TRY all return it */
+static int video_meta_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct camss_video *video = video_drvdata(file);
+
+	if (f->type != video->type)
+		return -EINVAL;
+
+	memset(&f->fmt.meta, 0, sizeof(f->fmt.meta));
+	f->fmt.meta.dataformat = video->active_fmt.fmt.meta.dataformat;
+	f->fmt.meta.buffersize = video->active_fmt.fmt.meta.buffersize;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops msm_vid_meta_ioctl_ops = {
+	.vidioc_querycap		= video_querycap,
+	.vidioc_enum_fmt_meta_cap	= video_meta_enum_fmt,
+	.vidioc_g_fmt_meta_cap		= video_meta_g_fmt,
+	.vidioc_s_fmt_meta_cap		= video_meta_g_fmt,
+	.vidioc_try_fmt_meta_cap	= video_meta_g_fmt,
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
@@ -688,6 +796,7 @@ static int msm_video_init_format(struct camss_video *video)
 int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 		       const char *name)
 {
+	bool meta = video->type == V4L2_BUF_TYPE_META_CAPTURE;
 	struct media_pad *pad = &video->pad;
 	struct video_device *vdev;
 	struct vb2_queue *q;
@@ -699,10 +808,12 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	q = &video->vb2_q;
 	q->drv_priv = video;
-	q->mem_ops = &vb2_dma_sg_memops;
-	q->ops = &msm_video_vb2_q_ops;
-	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
+	q->mem_ops = meta ? &vb2_vmalloc_memops : &vb2_dma_sg_memops;
+	q->ops = meta ? &msm_video_meta_vb2_q_ops : &msm_video_vb2_q_ops;
+	q->type = meta ? V4L2_BUF_TYPE_META_CAPTURE :
+			 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	q->io_modes = meta ? VB2_DMABUF | VB2_MMAP :
+			     VB2_DMABUF | VB2_MMAP | VB2_READ;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->buf_struct_size = sizeof(struct camss_buffer);
 	q->dev = video->camss->dev;
@@ -723,16 +834,29 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	mutex_init(&video->lock);
 
-	ret = msm_video_init_format(video);
-	if (ret < 0) {
-		dev_err(v4l2_dev->dev, "Failed to init format: %d\n", ret);
-		goto error_video_register;
+	if (meta) {
+		/* dataformat and buffersize are set by the producer */
+		video->active_fmt.type = V4L2_BUF_TYPE_META_CAPTURE;
+	} else {
+		ret = msm_video_init_format(video);
+		if (ret < 0) {
+			dev_err(v4l2_dev->dev, "Failed to init format: %d\n",
+				ret);
+			goto error_video_register;
+		}
 	}
 
 	vdev->fops = &msm_vid_fops;
-	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING
-			  | V4L2_CAP_READWRITE | V4L2_CAP_IO_MC;
-	vdev->ioctl_ops = &msm_vid_ioctl_ops;
+	if (meta) {
+		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING |
+				    V4L2_CAP_IO_MC;
+		vdev->ioctl_ops = &msm_vid_meta_ioctl_ops;
+	} else {
+		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+				    V4L2_CAP_STREAMING | V4L2_CAP_READWRITE |
+				    V4L2_CAP_IO_MC;
+		vdev->ioctl_ops = &msm_vid_ioctl_ops;
+	}
 	vdev->release = msm_video_release;
 	vdev->v4l2_dev = v4l2_dev;
 	vdev->vfl_dir = VFL_DIR_RX;

-- 
2.55.0

