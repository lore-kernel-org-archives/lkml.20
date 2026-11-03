Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702751;
	b=RfkSWOXMf+vdzWpik96Z1CBBZ4XwZwIpyqvHbjnKKk+M+KWjFXIv0Tgo5auLdB0RHaRq
	 a3b1smExMvelZDSPFW6cL+D3gTN2256x5/U3UG/skRlkc/nTqds/lL9x9B1bqH+o90SIp
	 TF+Zuk9BZlPFLxGFi3wvrlaKNDfXDF+paDzFaf/cxEJ4sQUqnu/Fmr2KjwgTMB4+Qc0Qf
	 lHPtpurVQU7sJtx2Dz5Bp5NbbyYysRZtTaiDCusNZMujF8SxTq3+kwzVce/vlv21C9TO4
	 zNrTekp3BznW8hoQf+/knzfLNeTY/+fLDX+6kzd0tPQmk+yqQ6Gn5gPx93TfxFb8mNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702751;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Vn0ekuWO/ga1SaCxyNkLXRmdtaeixsyy2PPN3PzgmIc=;
	b=djv+7KuFbP4vpigyeV+UPQZDVeXtxh8tbcKH535oHM1G6AoYLnaU1fzpR+OlqPHUjhaD
	 dKQmpcCU5iSU1lhmR/I2ZYBD75UQmix1JNgZlRegeBAEsAiQCDp3RDSqfWE3x3zv/X5n2
	 P7KZPEjaYNpMTCQfq0WX3EyNgciSZk+VPDjKcBTVlnWdLrW6tofMbutxb4mHn0tZGXHZz
	 Hdps4WVha0FPulSVm/c6fmAigj6tq7JojxTP6PIOXgbLHOlXp6Mlwb6fVP0AR9imO3Oi3
	 HU7KYccmlYGipRUGKgYlsvT91MCJ2p4zuUg9mPjqeXuhswXnVu4ZxmJZj4lcwoRToCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D1560711CC;
	Tue,  3 Nov 2026 10:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D1560711CC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xOC1P-0000000032b-41fq;
	Tue, 03 Nov 2026 10:45:44 +0000
Date: Tue, 3 Nov 2026 10:45:41 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] media: rockchip: rkcif: restart the MIPI DMA when it
 slips
Message-ID: <4d98fcb8e77fb75dc55944d92635c02634ff165d.1793702189.git.daniel@makrotopia.org>
References: <cover.1793702189.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793702189.git.daniel@makrotopia.org>

The MIPI DMA ends a frame after the configured number of lines and the
sensor frame start does not reset that count. A line dropped on the
CSI-2 link, which the receiver reports as a frame boundary or sequence
error, therefore leaves every later buffer composed of the tail of one
frame and the head of the next, with the Bayer phase flipped when the
offset is odd. Observed on an RV1126 with an IMX415 after a night of
streaming, reproducible on demand by shortening the D-PHY settle time.

Enable the frame start interrupts and read the line counter there: it
is zero in the vertical blanking while the DMA is in step and holds the
offset otherwise. Disabling and re-enabling the capture only pauses the
counter, so once a second frame confirms the offset the stream is
restarted through the existing stop and start paths, and the runtime
suspend in between resets the block. With other streams keeping the
block powered the restart is skipped and a warning given once; the
restarts are counted in debugfs next to the error counters.

Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
Assisted-by: LLM
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../rockchip/rkcif/rkcif-capture-mipi.c       | 53 +++++++++++++++
 .../platform/rockchip/rkcif/rkcif-common.h    |  8 +++
 .../platform/rockchip/rkcif/rkcif-stream.c    | 64 +++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-stream.h    |  2 +
 4 files changed, 127 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index af0134e6c4c67..0cef1cc35eedd 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -43,10 +43,17 @@
 #define RKCIF_MIPI_CTRL0_VC_ID(id)    ((id) << 8)
 #define RKCIF_MIPI_CTRL0_CAP_EN	      BIT(0)
 
+#define RKCIF_MIPI_INT_FRAME0_START(id) BIT((id) * 2 + 0)
+#define RKCIF_MIPI_INT_FRAME1_START(id) BIT((id) * 2 + 1)
 #define RKCIF_MIPI_INT_FRAME0_END(id) BIT(8 + (id) * 2 + 0)
 #define RKCIF_MIPI_INT_FRAME1_END(id) BIT(8 + (id) * 2 + 1)
 #define RKCIF_MIPI_INT_ALL_END GENMASK(15, 8)
 
+#define RKCIF_MIPI_LINE_CNT_MASK GENMASK(13, 0)
+
+/* a slipped frame boundary persists, so a second frame confirms it */
+#define RKCIF_MIPI_MISALIGNED_FRAMES 2
+
 #define RK3568_MIPI_INT_DMA_Y_FIFO_OVERFLOW BIT(16)
 #define RK3568_MIPI_INT_DMA_UV_FIFO_OVERFLOW BIT(17)
 #define RK3568_MIPI_INT_CONFIG_FIFO_OVERFLOW BIT(18)
@@ -782,6 +789,41 @@ static void rkcif_mipi_debugfs_init(struct rkcif_interface *interface)
 		debugfs_create_ulong(match_data->errors[i].name, 0444,
 				     interface->debugfs_dir,
 				     &interface->error_count[i]);
+	debugfs_create_ulong("restarts", 0444, interface->debugfs_dir,
+			     &interface->restarts);
+}
+
+static u32 rkcif_mipi_line_cnt(struct rkcif_stream *stream)
+{
+	unsigned int index = RKCIF_MIPI_LINE_CNT_ID0_1 + stream->id / 2;
+	u32 val = rkcif_mipi_read(stream->interface, index);
+
+	return (val >> (stream->id % 2 * 16)) & RKCIF_MIPI_LINE_CNT_MASK;
+}
+
+/* the DMA frame boundary is a line count that only a block reset resyncs */
+static void rkcif_mipi_check_alignment(struct rkcif_stream *stream)
+{
+	u32 line;
+
+	if (!stream->streaming || stream->stopping || stream->restart_pending ||
+	    stream->realign_disabled)
+		return;
+
+	line = rkcif_mipi_line_cnt(stream);
+	if (!line) {
+		stream->misaligned_frames = 0;
+		return;
+	}
+
+	if (++stream->misaligned_frames < RKCIF_MIPI_MISALIGNED_FRAMES)
+		return;
+
+	stream->misaligned_frames = 0;
+	dev_warn(stream->rkcif->dev,
+		 "%s: frame starts at line %u, restarting the capture\n",
+		 stream->vdev.name, line);
+	rkcif_stream_restart(stream);
 }
 
 static void rkcif_mipi_queue_buffer(struct rkcif_stream *stream,
@@ -825,6 +867,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 
 	ctrl1 = RKCIF_XY_COORD(width, height);
 
+	int_mask |= RKCIF_MIPI_INT_FRAME0_START(stream->id);
+	int_mask |= RKCIF_MIPI_INT_FRAME1_START(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
 	int_mask |= rkcif_mipi_error_mask(interface);
@@ -865,6 +909,8 @@ static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
 
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, 0);
 
+	int_mask |= RKCIF_MIPI_INT_FRAME0_START(stream->id);
+	int_mask |= RKCIF_MIPI_INT_FRAME1_START(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
 
@@ -929,6 +975,10 @@ irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
 		for (unsigned int j = 0; j < interface->streams_num; j++) {
 			struct rkcif_stream *stream = &interface->streams[j];
 
+			if (intstat & RKCIF_MIPI_INT_FRAME0_START(stream->id) ||
+			    intstat & RKCIF_MIPI_INT_FRAME1_START(stream->id))
+				rkcif_mipi_check_alignment(stream);
+
 			if (intstat & RKCIF_MIPI_INT_FRAME0_END(stream->id) ||
 			    intstat & RKCIF_MIPI_INT_FRAME1_END(stream->id)) {
 				ret = IRQ_HANDLED;
@@ -939,6 +989,9 @@ irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
 					continue;
 				}
 
+				if (stream->restart_pending)
+					continue;
+
 				rkcif_stream_pingpong(stream);
 			}
 		}
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 13708435dd432..1efc74d488d40 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
+#include <linux/workqueue.h>
 
 #include <media/media-device.h>
 #include <media/media-entity.h>
@@ -158,6 +159,12 @@ struct rkcif_stream {
 	bool stopping;
 	wait_queue_head_t wq_stopped;
 
+	bool streaming;
+	bool restart_pending;
+	bool realign_disabled;
+	unsigned int misaligned_frames;
+	struct work_struct restart_work;
+
 	/* queue of available buffers plus spinlock that protects it */
 	spinlock_t driver_queue_lock;
 	struct list_head driver_queue;
@@ -201,6 +208,7 @@ struct rkcif_interface {
 
 	struct dentry *debugfs_dir;
 	unsigned long error_count[RKCIF_MIPI_ERRORS_MAX];
+	unsigned long restarts;
 
 	/* interrupt enable and status are shared by the streams of a block */
 	spinlock_t irq_lock;
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad559..de847873d5ff4 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -248,6 +248,60 @@ static void rkcif_stream_queue_buffer(struct vb2_buffer *vb)
 	rkcif_stream_push_buffer(stream, buffer);
 }
 
+static void rkcif_stream_restart_work(struct work_struct *work)
+{
+	struct rkcif_stream *stream =
+		container_of(work, struct rkcif_stream, restart_work);
+	struct rkcif_device *rkcif = stream->rkcif;
+	u64 mask = BIT_ULL(stream->id);
+	int ret;
+
+	mutex_lock(&stream->vlock);
+	if (!stream->streaming || !stream->restart_pending)
+		goto out;
+
+	v4l2_subdev_disable_streams(&stream->interface->sd, RKCIF_IF_PAD_SRC,
+				    mask);
+	stream->stop_streaming(stream);
+
+	/* the runtime suspend resets the block and with it the line counter */
+	pm_runtime_put_sync(rkcif->dev);
+	if (!pm_runtime_suspended(rkcif->dev)) {
+		stream->realign_disabled = true;
+		dev_warn(rkcif->dev,
+			 "%s: cannot reset the block while other streams run\n",
+			 stream->vdev.name);
+	}
+	ret = pm_runtime_resume_and_get(rkcif->dev);
+	if (ret < 0) {
+		pm_runtime_get_noresume(rkcif->dev);
+		dev_err(rkcif->dev, "failed to resume for the restart: %d\n",
+			ret);
+		goto out;
+	}
+
+	stream->frame_phase = 0;
+	stream->queue_buffer(stream, 0);
+	stream->queue_buffer(stream, 1);
+	ret = stream->start_streaming(stream);
+	if (!ret)
+		ret = v4l2_subdev_enable_streams(&stream->interface->sd,
+						 RKCIF_IF_PAD_SRC, mask);
+	if (ret)
+		dev_err(rkcif->dev, "failed to restart the capture: %d\n", ret);
+	stream->interface->restarts++;
+
+out:
+	stream->restart_pending = false;
+	mutex_unlock(&stream->vlock);
+}
+
+void rkcif_stream_restart(struct rkcif_stream *stream)
+{
+	stream->restart_pending = true;
+	schedule_work(&stream->restart_work);
+}
+
 static int rkcif_stream_start_streaming(struct vb2_queue *queue,
 					unsigned int count)
 {
@@ -258,6 +312,9 @@ static int rkcif_stream_start_streaming(struct vb2_queue *queue,
 
 	stream->frame_idx = 0;
 	stream->frame_phase = 0;
+	stream->misaligned_frames = 0;
+	stream->realign_disabled = false;
+	stream->restart_pending = false;
 
 	ret = video_device_pipeline_start(&stream->vdev, &stream->pipeline);
 	if (ret) {
@@ -287,6 +344,8 @@ static int rkcif_stream_start_streaming(struct vb2_queue *queue,
 	if (ret < 0)
 		goto err_stop_stream;
 
+	stream->streaming = true;
+
 	return 0;
 
 err_stop_stream:
@@ -308,6 +367,9 @@ static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
 	u64 mask;
 	int ret;
 
+	stream->streaming = false;
+	stream->restart_pending = false;
+
 	mask = BIT_ULL(stream->id);
 	v4l2_subdev_disable_streams(&stream->interface->sd, RKCIF_IF_PAD_SRC,
 				    mask);
@@ -540,6 +602,7 @@ int rkcif_stream_register(struct rkcif_device *rkcif,
 	spin_lock_init(&stream->driver_queue_lock);
 
 	init_waitqueue_head(&stream->wq_stopped);
+	INIT_WORK(&stream->restart_work, rkcif_stream_restart_work);
 
 	mutex_init(&stream->vlock);
 
@@ -611,6 +674,7 @@ int rkcif_stream_register(struct rkcif_device *rkcif,
 
 void rkcif_stream_unregister(struct rkcif_stream *stream)
 {
+	cancel_work_sync(&stream->restart_work);
 	video_unregister_device(&stream->vdev);
 	media_entity_cleanup(&stream->vdev.entity);
 }
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.h b/drivers/media/platform/rockchip/rkcif/rkcif-stream.h
index 590faf5d1a87a..61347179818f2 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.h
@@ -20,6 +20,8 @@
 
 void rkcif_stream_pingpong(struct rkcif_stream *stream);
 
+void rkcif_stream_restart(struct rkcif_stream *stream);
+
 int rkcif_stream_register(struct rkcif_device *rkcif,
 			  struct rkcif_stream *stream);
 
-- 
2.56.0
