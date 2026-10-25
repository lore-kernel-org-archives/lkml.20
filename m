Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956328;
	b=s33mz/u1C+IoLpZWDzZDfd/3YZx9RFFSTfZu4eMolPHqSoaRaSbTZ5nWZSc4+YoDUYSx
	 2fovnTSc+whCsu7XM2HPm8xjk96c4svIXaoUi1dYZOVzcSI9XJ/QsntOrcW1unfqCml23
	 el3XSu529Tm1ngQfbGEArqbertMeVcdWEtlCIpsW+ubF9Hn7OPk17J3vtg9FPRLBiuzsd
	 OOsN8L+4xG8FqbbvfPg+j9QwGqgctVkBMWSI1ewHKYdV3Cz82J60vqY3uomxdun6YG2U4
	 R9+hs4lDJWg0NMNftIdWNUPCtfkX4AnX75eH6+mJTWfqBLpS920z1RcKycFnfBjE+lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956328;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=GsX1Xfgj+VgfPxeXwV/7gBim89XJTgXAAqU3LTzpSu4=;
	b=MDdLts978aX34p4eJ+oPfZrZE/9C77v/Yug/SztQND9dsCj6+QgzeQ1eqAld6e3o6VFw
	 YP0pB+gxYZXiV0Y4aYE9LXpwfr7a4lmOIRC1nZDyuRnKF54hWWzBuhtIYup65834Vh6wN
	 ZTE5MJ27IJTfj9DdF3A4HnpnS/ME6DZfE3Pklw9RyAMv9CjXDqEnoBLIV10wIfT8NoxEZ
	 kLQ4bn1tjCeYX2TelHpH7jKwwWVV+lAJdYssbX3fnPL5Za0LVtdMSRzowT6+K0dbtJ4H6
	 cFX0iTiOxZFsHFBmyLbL+VU0V65jUytJhER5CssZswcgrCf7Lly6RtKpj5lD2M5sc9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=dx45Sl0b;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DDE60A2635;
	Sun, 25 Oct 2026 19:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29DDE60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=dx45Sl0b
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJP8El519288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:25:15 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJP8El519288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956317;
	bh=GsX1Xfgj+VgfPxeXwV/7gBim89XJTgXAAqU3LTzpSu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dx45Sl0bk9PMOHNOKE7xgJe49rHgHgRlfBwC6jE88CKGk/FM/BxI6qjrA9wfoz8id
	 EsFzkTEby000xef+1Vj7/B1cNJMzqbrBwERjCmbmrKc2z3xdhZZURvgmfLrAXS3IzK
	 z3fITutikiYuiKuwCNnglamuBqqjo8RaHDyyPoy4=
From: christian.koever-draxl@student.uibk.ac.at
To: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 03/11] media: amlogic: vdec: fix the microcode loading and prepare the HEVC core
Date: Sun, 25 Oct 2026 20:24:59 +0100
Message-ID: <20261025192507.210058-4-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -14.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The secure world rejected every microcode this driver handed over: the
images carry a 256-byte signature header that has to stay attached, and
the TEE only accepts loads once it has been told that boot is complete.
Pass the whole image with the signature size, issue SYS_BOOT_COMPLETE
before the first load, and keep probing when the preload fails because
the secure world may already hold the microcode.

Add what the HEVC core needs before codecs can use it: its power domain
and clock handling, the reset and memory-power sequence used when the
core switches between microcodes, and the per-codec hooks in the
request path.

Load a microcode into the HEVC core only when it is not already there.
A browser opens a new decoder context for every seek, quality switch or
advert; loading the image again for each of them makes the secure loader
answer TEEC_ERROR_BAD_STATE after a few hundred loads, and it stays that
way until the board is power cycled. The image survives in the core
until the core memories are cycled on a codec switch or after a timeout.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/media/platform/amlogic/vdec/Makefile  |   2 +-
 .../media/platform/amlogic/vdec/aml_vdec.c    |  72 ++++++-
 .../platform/amlogic/vdec/aml_vdec_drv.h      |  21 +++
 .../media/platform/amlogic/vdec/aml_vdec_hw.c | 176 +++++++++++++++++-
 .../media/platform/amlogic/vdec/aml_vdec_hw.h |  64 +++++++
 .../platform/amlogic/vdec/aml_vdec_platform.c |  27 ++-
 .../platform/amlogic/vdec/aml_vdec_tee_fw.c   |  87 ++++++++-
 .../media/platform/amlogic/vdec/reg_defines.h |  24 +++
 8 files changed, 443 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media/platform/amlogic/vdec/Makefile
index f752716cbf9e..f9c35e9ac902 100644
--- a/drivers/media/platform/amlogic/vdec/Makefile
+++ b/drivers/media/platform/amlogic/vdec/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o aml_vdec_tee_fw.o\
+aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o aml_vdec_tee_fw.o
 
 obj-$(CONFIG_VIDEO_AMLOGIC_VDEC) += aml-vdec-drv.o
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/media/platform/amlogic/vdec/aml_vdec.c
index d4dcd0180d2d..2a5ff842fd39 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
@@ -66,8 +66,7 @@ static const struct aml_vdec_v4l2_ctrl controls[] = {
 			.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
 			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
 		},
-	}
-};
+	},};
 
 static const struct aml_dec_type dec_type_name[] = {
 	{
@@ -130,23 +129,46 @@ static void m2mops_vdec_device_run(void *m2m_priv)
 	/* incase of bus hang in stop_streaming */
 	ctx->dos_clk_en = 1;
 
-	if (ctx->curr_dec_type == CODEC_TYPE_H264)
+	if (ctx->curr_dec_type == CODEC_TYPE_H264 ||
+	    ctx->curr_dec_type == CODEC_TYPE_MPEG2 ||
+	    ctx->curr_dec_type == CODEC_TYPE_MJPEG ||
+	    ctx->curr_dec_type == CODEC_TYPE_MPEG4)
 		aml_vdec_reset_core(dev->dec_hw);
 
 	if (load_firmware(dev->dec_hw, ctx->curr_dec_type) < 0)
 		goto err_cancel_job;
 
+	ctx->job_finished = false;
 	ret = ctx->codec_ops->run(ctx);
 
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
-	if (src_req)
+	/*
+	 * AV1 completes the request itself, in its interrupt handler, before
+	 * the buffer is done - by the time run() returns here the job has
+	 * already finished and the request with it.
+	 */
+	if (src_req && ctx->curr_dec_type != CODEC_TYPE_AV1 &&
+	    ctx->curr_dec_type != CODEC_TYPE_VP9 &&
+	    ctx->curr_dec_type != CODEC_TYPE_HEVC &&
+	    ctx->curr_dec_type != CODEC_TYPE_MJPEG)
 		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
-	if (ret < 0)
+	/*
+	 * Only cancel a job that is still running: a codec that finished it in
+	 * its own interrupt handler must not finish it twice.
+	 */
+	if (ret < 0 && !ctx->job_finished)
 		goto err_cancel_job;
 
 	return;
 
 err_cancel_job:
+	/*
+	 * Whatever went wrong, the request must not be left incomplete or the
+	 * client waits for it forever.  AV1 completes it in its own done path
+	 * on success, so this only covers the paths that never got there.
+	 */
+	if (src_req)
+		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
 	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
 					 VB2_BUF_STATE_ERROR);
 }
@@ -273,9 +295,6 @@ static int vdec_try_fmt_mp(struct aml_vdec_ctx *ctx, enum v4l2_buf_type type,
 	if (V4L2_TYPE_IS_OUTPUT(type)) {
 		pix_mp->num_planes = dec_fmt->num_planes;
 		pix_mp->pixelformat = dec_fmt->fourcc;
-		if (!pix_mp->plane_fmt[0].sizeimage)
-			pix_mp->plane_fmt[0].sizeimage =
-			    (pix_mp->height * pix_mp->width * 3) / 2;
 	}
 
 	align = ctx->dev->pvdec_data->dec_fmt->align;
@@ -284,6 +303,26 @@ static int vdec_try_fmt_mp(struct aml_vdec_ctx *ctx, enum v4l2_buf_type type,
 
 	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
 				       &dec_fmt->stepwise);
+
+	/*
+	 * The bitstream buffer has to be sized from the dimensions the driver
+	 * settled on, not the ones userspace asked for: a client that
+	 * negotiates before it knows the picture size passes zeroes, and
+	 * sizing from those gives a zero-length buffer that no pool can
+	 * allocate.  AV1 also gets a floor, because a single temporal unit -
+	 * a key frame in particular - can be larger than a raw frame of the
+	 * same nominal size once the picture is small.
+	 */
+	if (V4L2_TYPE_IS_OUTPUT(type) && !pix_mp->plane_fmt[0].sizeimage) {
+		u32 size = (pix_mp->height * pix_mp->width * 3) / 2;
+
+		if ((dec_fmt->fourcc == V4L2_PIX_FMT_AV1_FRAME ||
+		     dec_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME ||
+		     dec_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE) &&
+		    size < SZ_1M)
+			size = SZ_1M;
+		pix_mp->plane_fmt[0].sizeimage = size;
+	}
 	dev_dbg(&ctx->dev->plat_dev->dev,
 		"%s type %d four_cc %d pix_mp->width %d pix_mp->height %d\n",
 		__func__, type, dec_fmt->fourcc, pix_mp->width, pix_mp->height);
@@ -600,8 +639,14 @@ static int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
 
 	for (i = 0; i < pix_fmt->num_planes; i++) {
 		sizeimage = pix_fmt->plane_fmt[i].sizeimage;
-		if (vb2_plane_size(vb, i) < sizeimage)
+		if (vb2_plane_size(vb, i) < sizeimage) {
+			dev_err_ratelimited(&ctx->dev->plat_dev->dev,
+					    "buf_prepare: type %d plane %d is %lu bytes, format wants %u (%ux%u)\n",
+				vb->vb2_queue->type, i,
+				vb2_plane_size(vb, i), sizeimage,
+				pix_fmt->width, pix_fmt->height);
 			return -EINVAL;
+		}
 
 		if (V4L2_TYPE_IS_CAPTURE(vb->type)) {
 			vb2_set_plane_payload(vb, i,
@@ -709,6 +754,8 @@ int aml_vdec_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->lock = &ctx->v4l2_intf_lock;
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	src_vq->supports_requests = true;
+	/* MPEG-2 field pairs decode into one held capture buffer */
+	src_vq->subsystem_flags |= VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	ret = vb2_queue_init(src_vq);
 	if (ret) {
@@ -725,6 +772,13 @@ int aml_vdec_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->lock = &ctx->v4l2_intf_lock;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	/*
+	 * Cacheable capture buffers: a coherent allocation is mapped uncached
+	 * into userspace, and reading a decoded frame back (vaGetImage, ffmpeg
+	 * hwdownload) then crawls.  A client asks for cacheable buffers with
+	 * V4L2_MEMORY_FLAG_NON_COHERENT; vb2 cleans/invalidates around each job.
+	 */
+	dst_vq->allow_cache_hints = 1;
 	ret = vb2_queue_init(dst_vq);
 	if (ret) {
 		v4l2_info(&dev->v4l2_dev,
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.h b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.h
index fa86233ea5b3..8ab2ee67a2a2 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.h
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.h
@@ -22,6 +22,12 @@
 #define AML_VDEC_MIN_H    64U
 #define AML_VDEC_1080P_MAX_H  1088U
 #define AML_VDEC_1080P_MAX_W  1920U
+/*
+ * The S905W2 decodes 4K.  AV1 goes up to the microcode's 4096x2304 working-set
+ * size; the other codecs keep the 1080p ceiling until they are tested there.
+ */
+#define AML_VDEC_4K_MAX_H     2304U
+#define AML_VDEC_4K_MAX_W     4096U
 
 struct aml_vdec_ctx;
 /**
@@ -37,6 +43,12 @@ enum aml_fmt_type {
  */
 enum aml_codec_type {
 	CODEC_TYPE_H264 = 0,
+	CODEC_TYPE_AV1,
+	CODEC_TYPE_VP9,
+	CODEC_TYPE_HEVC,
+	CODEC_TYPE_MPEG2,
+	CODEC_TYPE_MJPEG,
+	CODEC_TYPE_MPEG4,
 	CODEC_TYPE_FRAME,
 };
 
@@ -94,6 +106,7 @@ struct aml_vdec_dev {
 	struct aml_vdec_hw *dec_hw;
 	const struct aml_dev_platform_data *pvdec_data;
 
+	/* video_device lock: serialises ioctls, open and release */
 	struct mutex dev_mutex;
 	struct file *filp;
 };
@@ -125,6 +138,7 @@ struct dec_pic_info {
  * @v4l2_intf_lock: Mutex lock for v4l2 interface.
  * @codec_ops: Codec operation functions. See struct aml_codec_ops.
  * @int_cond: Variable used by the waitqueue.
+ * @job_finished: The m2m job was already finished by the codec's own path.
  * @queue: Waitqueue to wait for the current decode context finish.
  * @pix_fmt: To store the V4L2 pixel format.
  * @dec_fmt: To describe the decoding format supported by hardware platform.
@@ -140,10 +154,17 @@ struct aml_vdec_ctx {
 	struct v4l2_fh fh;
 	struct v4l2_m2m_ctx *m2m_ctx;
 	struct v4l2_ctrl_handler ctrl_handler;
+	/* vb2/m2m queue lock for this context */
 	struct mutex v4l2_intf_lock;
 
 	const struct aml_codec_ops *codec_ops;
 	int int_cond;
+	/*
+	 * Set by whatever path calls v4l2_m2m_buf_done_and_job_finish(), so
+	 * device_run() knows the buffers have already gone back to userspace
+	 * and must not be touched or finished a second time.
+	 */
+	bool job_finished;
 	wait_queue_head_t queue;
 	struct v4l2_pix_format_mplane pix_fmt[2];
 	struct aml_video_fmt dec_fmt[2];
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
index 29a195eb6872..935018ea96c6 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
@@ -51,6 +51,20 @@ void dos_enable(struct aml_vdec_hw *hw)
 	regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL, (1 << 31), 0);
 }
 
+/*
+ * dos_enable() opens DOS_GCLK_EN0 and GCLK_EN, which are the legacy VDEC-1
+ * gates; the HEVC/AV1 core has its own gate in DOS_GCLK_EN3 and nothing had
+ * ever opened it.  Measured on a live board: with the HEVC power domain up and
+ * hevcf running at 800 MHz, DOS_GCLK_EN3 still read 0, and asking secure world
+ * to write microcode into that core hung the board with no oops and no console
+ * output at all.  The register itself is plain read/write once the domain is
+ * powered, and so is HEVC_ASSIST_SCRATCH_0.
+ */
+void dos_enable_hevc(struct aml_vdec_hw *hw)
+{
+	regmap_write(hw->map[DOS_BUS], DOS_GCLK_EN3, 0xffffffff);
+}
+
 void aml_vdec_reset_core(struct aml_vdec_hw *hw)
 {
 	unsigned int mask = 0;
@@ -137,8 +151,8 @@ static int vdec_clock_gate_init(struct aml_vdec_hw *hw)
 	return devm_clk_bulk_get(hw->dev, CLK_MAX, hw->gates);
 }
 
-static struct clk_bulk_data *vdec_get_clk_by_name(struct aml_vdec_hw *hw,
-						  const char *name)
+struct clk_bulk_data *vdec_get_clk_by_name(struct aml_vdec_hw *hw,
+					   const char *name)
 {
 	int i;
 
@@ -249,6 +263,14 @@ static void dos_local_config(struct aml_vdec_hw *hw, bool is_on, int id)
 	dev_dbg(hw->dev, "%s end, id %d, is_on %d\n", __func__, id, is_on);
 }
 
+/*
+ * The core clock rates come from assigned-clock-rates in the device tree.
+ * hevcf_rate overrides the HEVC core's for testing.
+ */
+static ulong hevcf_rate;
+module_param(hevcf_rate, ulong, 0444);
+MODULE_PARM_DESC(hevcf_rate, "Override the HEVC core clock in Hz (0 = device tree)");
+
 static void pm_vdec_power_domain_power_on(struct aml_vdec_hw *hw, int id)
 {
 	const struct power_manager_s *pm = hw->pm;
@@ -262,10 +284,10 @@ static void pm_vdec_power_domain_power_on(struct aml_vdec_hw *hw, int id)
 
 	if (gate_node) {
 		clk_prepare_enable(gate_node->clk);
-		if (id == VDEC) {
-			clk_set_rate(gate_node->clk, 499999992);
-			dev_dbg(hw->dev, "after set, vdec clock is %lu Hz\n",
-				clk_get_rate(gate_node->clk));
+		if (id == HVDEC && hevcf_rate) {
+			clk_set_rate(gate_node->clk, hevcf_rate);
+			dev_info(hw->dev, "hevcf %lu Hz\n",
+				 clk_get_rate(gate_node->clk));
 		}
 		dev_dbg(hw->dev, "the %-15s clock on\n", gate_node->id);
 	} else {
@@ -364,6 +386,91 @@ int vdec_enable(struct aml_vdec_hw *hw)
 	return 0;
 }
 
+/*
+ * The HEVC core is a second, independent power domain with its own clock
+ * ("hevcf") and its own reset in DOS_SW_RESET3.  Nothing in this driver decodes
+ * on it yet; it is powered only so secure world has somewhere to put the
+ * microcode when the AV1/HEVC load is probed.
+ */
+int hvdec_enable(struct aml_vdec_hw *hw)
+{
+	vdec_poweron(hw, HVDEC);
+
+	return 0;
+}
+
+int hvdec_disable(struct aml_vdec_hw *hw)
+{
+	vdec_poweroff(hw, HVDEC);
+
+	return 0;
+}
+
+/*
+ * VP9 and AV1 share the HEVC core, and once one of them has run the other
+ * cannot: it loads, parses a header and never completes a picture.  Putting
+ * back every register the other codec changed does not help, reloading the
+ * module does - and what a reload does that nothing else here does is power
+ * the core's internal memories down and up.  hvdec_disable() cannot be used
+ * for that: hvdec_enable() runs for every frame and only counts, so the core
+ * never actually goes off.  Cycle the memories and reset the core directly,
+ * on a switch only, leaving the power domain, the clock and secure world
+ * alone.
+ */
+int hvdec_switch_codec(struct aml_vdec_hw *hw, int codec)
+{
+	if (hw->hevc_dirty || (hw->hevc_codec && hw->hevc_codec != codec)) {
+		dev_info(hw->dev, "HEVC core: %s, cycling core memories\n",
+			 hw->hevc_dirty ? "left dirty" : "codec switch");
+		mutex_lock(&hw->pm_mutex);
+		dos_local_config(hw, 0, HVDEC);
+		dos_local_config(hw, 1, HVDEC);
+		mutex_unlock(&hw->pm_mutex);
+		hw->hevc_fw = 0;
+	}
+	hw->hevc_codec = codec;
+	hw->hevc_dirty = false;
+	return 0;
+}
+
+/*
+ * Load a microcode into the HEVC core through secure world, unless it is
+ * already there. Every decoder context used to load it again, and a browser
+ * opens a new context for every seek, quality switch or advert: after a few
+ * hundred loads the secure loader answers with TEEC_ERROR_BAD_STATE and
+ * stays there until the next power cycle. The image survives in the core
+ * until hvdec_switch_codec() cycles the memories.
+ */
+int hevc_load_fw(struct aml_vdec_hw *hw, int codec, u32 format, u32 core,
+		 const char *name)
+{
+	int ret, sm_ret = 0;
+
+	/*
+	 * Halt the AMRISC in any case: the previous context may have left it
+	 * running, and the decoder start below expects it stopped.
+	 */
+	regmap_write(hw->map[DOS_BUS], HEVC_MPSR, 0);
+	regmap_write(hw->map[DOS_BUS], HEVC_CPSR, 0);
+
+	if (hw->hevc_fw == codec)
+		return 0;
+
+	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, HEVC_LOAD_RESET_MASK);
+	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, 0);
+
+	ret = meson_sm_call(hw->sec_fw, SM_LOAD_VIDEO_FW, &sm_ret, format, core,
+			    0, 0, 0);
+	if (ret < 0 || sm_ret) {
+		dev_err(hw->dev, "%s: microcode load failed %d/%d\n", name, ret,
+			sm_ret);
+		hw->hevc_fw = 0;
+		return -EIO;
+	}
+	hw->hevc_fw = codec;
+	return 0;
+}
+
 int vdec_disable(struct aml_vdec_hw *hw)
 {
 	vdec_poweroff(hw, VDEC);
@@ -382,6 +489,40 @@ static const struct power_manager_s pm[] = {
 	},
 };
 
+static irqreturn_t hevc_irq_handler(int irq, void *priv)
+{
+	struct aml_vdec_hw *hw = priv;
+	int n;
+
+	hw->hevc_irq_status = read_dos_reg(hw, HEVC_ASSIST_SCRATCH_0);
+	regmap_write(hw->map[DOS_BUS], HEVC_ASSIST_MBOX0_CLR_REG, 1);
+
+	n = atomic_inc_return(&hw->hevc_irq_count);
+	if (hw->hevc_irq_thread_fn)
+		return IRQ_WAKE_THREAD;
+
+	/*
+	 * Runaway guard for the probe path, which has no state machine to end
+	 * a decode.  It must not apply once a real handler is driving the
+	 * core: a stream produces a few interrupts per picture, so masking the
+	 * mailbox at a fixed count silently stops decoding part way through.
+	 */
+	if (n > 64)
+		regmap_write(hw->map[DOS_BUS], HEVC_ASSIST_MBOX0_MASK, 0);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t hevc_irq_thread(int irq, void *priv)
+{
+	struct aml_vdec_hw *hw = priv;
+
+	if (hw->hevc_irq_thread_fn)
+		return hw->hevc_irq_thread_fn(irq, hw->hevc_priv);
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t vdec_irq_handler(int irq, void *priv)
 {
 	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
@@ -445,6 +586,25 @@ int dev_request_hw_resources(void *priv)
 	hw = dev->dec_hw;
 	hw->dev = &pdev->dev;
 
+	/*
+	 * The HEVC/AV1 core signals on its own interrupt (IRQ_HVDEC, the first
+	 * entry in the DT, GIC SPI 91) through mailbox 0.  Nothing decodes on
+	 * that core yet, so this handler only acknowledges and counts - it is
+	 * how the microcode's replies are observed at all.  If it ever storms,
+	 * the mask is dropped rather than letting it wedge the board.
+	 */
+	hw->hevc_irq = platform_get_irq(pdev, IRQ_HVDEC);
+	if (hw->hevc_irq >= 0) {
+		atomic_set(&hw->hevc_irq_count, 0);
+		ret = devm_request_threaded_irq(&pdev->dev, hw->hevc_irq,
+						hevc_irq_handler,
+						hevc_irq_thread,
+						IRQF_ONESHOT, "aml-hevc", hw);
+		if (ret)
+			dev_warn(&pdev->dev, "hevc irq %d request failed (%d)\n",
+				 hw->hevc_irq, ret);
+	}
+
 	hw->dec_irq = platform_get_irq(pdev, IRQ_VDEC);
 	if (hw->dec_irq < 0) {
 		dev_err(&pdev->dev, "get irq failed\n");
@@ -514,7 +674,9 @@ int dev_request_hw_resources(void *priv)
 
 	ret = aml_tee_fw_preload(hw);
 	if (ret)
-		return ret;
+		dev_warn(&pdev->dev,
+			 "TEE firmware preload failed (%d), continuing in case secure world already holds the ucode\n",
+			 ret);
 
 	dev_dbg(&pdev->dev, "##Amlogic hw resource init OK##\n");
 
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h
index 9dc84d0d52bf..35645aad2375 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h
@@ -7,6 +7,8 @@
 #define _AML_VDEC_HW_H_
 
 #include <linux/module.h>
+#include <linux/dma-mapping.h>
+#include <media/videobuf2-dma-contig.h>
 #include <linux/clk.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
@@ -115,6 +117,7 @@ struct aml_vdec_hw {
 	struct platform_device *pdev;
 	struct device *dev;
 	struct regmap *map[MAX_REG_BUS];
+	/* protects power-domain and clock state */
 	struct mutex pm_mutex;
 	struct meson_canvas *canvas;
 	struct meson_sm_firmware *sec_fw;
@@ -122,7 +125,35 @@ struct aml_vdec_hw {
 	struct aml_vdec_hw_ops hw_ops;
 	struct clk_bulk_data gates[CLK_MAX];
 	int dec_irq;
+	int hevc_irq;
+	atomic_t hevc_irq_count;
+	u32 hevc_irq_status;
+	/*
+	 * Optional threaded handler for the HEVC/AV1 core.  The AV1 state
+	 * machine allocates DMA memory while configuring a picture, so it
+	 * cannot run in hard interrupt context.  When this is NULL the hard
+	 * handler just counts interrupts, which is what the probe harness
+	 * polls for.
+	 */
+	irqreturn_t (*hevc_irq_thread_fn)(int irq, void *priv);
+	void *hevc_priv;
 	void *curr_ctx;
+	/* Codec whose microcode the HEVC core last ran; 0 when none yet. */
+	int hevc_codec;
+	/*
+	 * Codec whose microcode is loaded into the HEVC core right now; 0 when
+	 * none or when the core memories were cycled since.
+	 */
+	int hevc_fw;
+	/*
+	 * The core is in a state the next session cannot start from: a decode
+	 * timed out, or a 10-bit stream ran.  The next start cycles the core
+	 * memories, as a codec switch does.
+	 */
+	bool hevc_dirty;
+	void *ucode_vaddr;
+	dma_addr_t ucode_paddr;
+	u32 ucode_type;
 };
 
 /**
@@ -149,9 +180,42 @@ struct aml_vdec_hw *vdec_get_hw(void *priv);
 u32 read_dos_reg(struct aml_vdec_hw *hw, u32 reg_addr);
 int vdec_enable(struct aml_vdec_hw *hw);
 int vdec_disable(struct aml_vdec_hw *hw);
+struct clk_bulk_data *vdec_get_clk_by_name(struct aml_vdec_hw *hw,
+					   const char *name);
+int hvdec_enable(struct aml_vdec_hw *hw);
+int hvdec_disable(struct aml_vdec_hw *hw);
+int hvdec_switch_codec(struct aml_vdec_hw *hw, int codec);
+int hevc_load_fw(struct aml_vdec_hw *hw, int codec, u32 format, u32 core,
+		 const char *name);
 void dos_enable(struct aml_vdec_hw *hw);
+void dos_enable_hevc(struct aml_vdec_hw *hw);
 void aml_start_vdec_hw(struct aml_vdec_hw *hw);
 void aml_stop_vdec_hw(struct aml_vdec_hw *hw);
 void aml_vdec_reset_core(struct aml_vdec_hw *hw);
 
+/*
+ * The CPU wrote a decoded picture into a capture buffer.  A buffer the client
+ * asked to be cacheable (V4L2_MEMORY_FLAG_NON_COHERENT) still has it in dirty
+ * cache lines, which vb2 would invalidate on dequeue: write them back first.
+ */
+static inline void aml_vdec_dst_cpu_written(struct device *dev,
+					    struct vb2_buffer *vb)
+{
+	unsigned int i;
+
+	if (!vb->vb2_queue->non_coherent_mem)
+		return;
+	for (i = 0; i < vb->num_planes; i++)
+		dma_sync_single_for_device(dev,
+					   vb2_dma_contig_plane_dma_addr(vb, i),
+					   vb2_plane_size(vb, i), DMA_TO_DEVICE);
+}
+
+/*
+ * DOS_SW_RESET3 bits pulsed before a new microcode is handed to the HEVC
+ * core.  The two AMRISC CPU resets alone are not enough when the core was
+ * running a different codec's microcode.
+ */
+#define HEVC_LOAD_RESET_MASK	(BIT(12) | BIT(11))
+
 #endif
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
index 60d20efb1d74..fa4f979b07ee 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
@@ -26,8 +26,8 @@ static struct aml_video_fmt aml_s4_video_formats[] = {
 		.align = 64,
 		.codec_type = CODEC_TYPE_FRAME,
 		.num_planes = 2,
-		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
-			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
+		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_4K_MAX_W, 2,
+			AML_VDEC_MIN_H, AML_VDEC_4K_MAX_H, 2},
 	},
 	{
 		.name = "NV21",
@@ -36,8 +36,8 @@ static struct aml_video_fmt aml_s4_video_formats[] = {
 		.align = 64,
 		.codec_type = CODEC_TYPE_FRAME,
 		.num_planes = 1,
-		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
-			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
+		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_4K_MAX_W, 2,
+			AML_VDEC_MIN_H, AML_VDEC_4K_MAX_H, 2},
 	},
 	{
 		.name = "NV12M",
@@ -46,10 +46,21 @@ static struct aml_video_fmt aml_s4_video_formats[] = {
 		.align = 64,
 		.codec_type = CODEC_TYPE_FRAME,
 		.num_planes = 2,
-		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
-			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
+		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_4K_MAX_W, 2,
+			AML_VDEC_MIN_H, AML_VDEC_4K_MAX_H, 2},
 
 	},
+	{
+		/* planar 4:2:0, only what the MJPEG microcode writes */
+		.name = "YUV420",
+		.fourcc = V4L2_PIX_FMT_YUV420,
+		.type = AML_FMT_FRAME,
+		.align = 64,
+		.codec_type = CODEC_TYPE_FRAME,
+		.num_planes = 1,
+		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_4K_MAX_W, 2,
+			AML_VDEC_MIN_H, AML_VDEC_4K_MAX_H, 2},
+	},
 	{
 		.name = "NV12",
 		.fourcc = V4L2_PIX_FMT_NV12,
@@ -57,8 +68,8 @@ static struct aml_video_fmt aml_s4_video_formats[] = {
 		.align = 64,
 		.codec_type = CODEC_TYPE_FRAME,
 		.num_planes = 1,
-		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
-			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
+		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_4K_MAX_W, 2,
+			AML_VDEC_MIN_H, AML_VDEC_4K_MAX_H, 2},
 	},
 };
 
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
index ad4156249f55..d7106ec47ba9 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2025 Amlogic, Inc. All rights reserved
  */
+#include <linux/arm-smccc.h>
 #include <linux/tee_drv.h>
 #include <linux/firmware.h>
 
@@ -9,12 +10,40 @@
 #include "aml_vdec_drv.h"
 
 #define VIDEO_DEC_H264_MULTI	15
+#define VIDEO_DEC_MPEG12_MULTI	0x4d31324d	/* "M12M" */
+#define VIDEO_DEC_MJPEG_MULTI	6
+#define VIDEO_DEC_MPEG4_5_MULTI	0x4d34354d	/* "M45M" */
+
+/*
+ * Newer formats are not small enum values at all - Amlogic switched to
+ * four-character constants somewhere around G12.  The numbers below were read
+ * out of the vendor's own binaries rather than guessed:
+ *
+ *   - firmware.ko carries format_name[], an array of { u32 format;
+ *     const char *name; } at .rodata+0xb38.  It gives h264_multi = 15 (which
+ *     matches what this driver already uses, so the table is trustworthy) and
+ *     av1_mmu = 0x4156314d.
+ *   - decoder_common.ko's optee_load_fw() maps a microcode name onto the pair
+ *     that goes to secure world.  Its AV1 case is literally
+ *     tee_load_video_fw(0x4156314d, 2), so the AV1 microcode belongs to core 2,
+ *     not to the legacy core this driver drives today.
+ *
+ * Both modules come from this box's own stock image (fw_extract/vmods/).
+ */
+#define VIDEO_DEC_AV1_MMU	0x4156314d	/* 'M1VA' */
 
 #define CORE_VDEC_LEGENCY	0
+#define CORE_VDEC_HEVC		2
 
 #define FIRMWARE_PATH		"video_ucode.bin"
 #define ONCE_SENT_SIZE		(1024 * 128)
-#define UCODE_HEADER_SIZE	(1024 * 32)
+
+/*
+ * Size of the RSA signature the ucode container carries in front of its "KCAP"
+ * payload.  The TA is told about it at session open; the blob itself is sent
+ * whole, signature included.
+ */
+#define UCODE_SIGNATURE_SIZE	256
 
 #define TEEC_SUCCESS		0x0
 #define TEEC_ERROR_BUSY	0xffff000d
@@ -25,6 +54,23 @@
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, \
 			ARM_SMCCC_OWNER_TRUSTED_OS, TEE_SMC_FUNCID_LOAD_VIDEO_FW)
 
+/*
+ * Amlogic's secure OS refuses to load any TA from the REE filesystem until the
+ * normal world says it has finished booting - it answers every open with
+ * TEE_ERROR_ITEM_NOT_FOUND and prints
+ *
+ *   ta_open:202 ree system is not ready, ta can not be loaded.
+ *
+ * on the secure console.  The vendor kernel signals this from
+ * drivers/amlogic/tee/tee.c through the write-only sysfs attribute
+ * /sys/class/tee/sys_boot_complete; the SMC behind it is all it does.
+ */
+#define TEE_SMC_FUNCID_SYS_BOOT_COMPLETE	0xE060
+#define TEE_SMC_SYS_BOOT_COMPLETE \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, \
+			ARM_SMCCC_OWNER_TRUSTED_OS, \
+			TEE_SMC_FUNCID_SYS_BOOT_COMPLETE)
+
 #define PTA_LOAD_FW UUID_INIT(0x526fc4fc, 0x7ee6, 0x4a12, \
 			0x96, 0xe3, 0x83, 0xda, 0x95, 0x65, 0xbc, 0xe8)
 
@@ -51,8 +97,11 @@ static void prepare_tee_grgs(size_t firmware_size, struct tee_param *param0,
 
 	param0[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
 	param0[0].u.value.a = firmware_size;
+	param0[0].u.value.b = 0;
 
 	param0[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	param0[1].u.value.a = 0;
+	param0[1].u.value.b = UCODE_SIGNATURE_SIZE;
 
 	param0[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
 	param0[3].attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
@@ -152,6 +201,15 @@ int load_firmware(struct aml_vdec_hw *hw, u32 type)
 		dev_info(hw->dev, "codec type %d invalid\n", type);
 		return ret;
 	}
+	/*
+	 * AV1 loads its own microcode from aml_av1_dec_run(), because the load
+	 * must happen after the HEVC core is powered and clocked - issuing
+	 * SM_LOAD_VIDEO_FW at an unpowered core hangs the board hard enough
+	 * that SysRq cannot recover it, and device_run() gets here first.
+	 */
+	if (type == CODEC_TYPE_AV1 || type == CODEC_TYPE_VP9 ||
+	    type == CODEC_TYPE_HEVC)
+		return 0;
 	video_fw = &firmware[type];
 
 	meson_sm_call(hw->sec_fw, SM_LOAD_VIDEO_FW, &ret,
@@ -174,18 +232,21 @@ static int get_firmware(const char *path, void **data, size_t *size)
 	if (ret)
 		return ret;
 
-	/* get rid of the first 32K bytes plaintext */
-	buf = kzalloc((fw->size - UCODE_HEADER_SIZE), GFP_KERNEL);
+	/*
+	 * The whole container goes to the TA, signature first - that is what
+	 * the vendor's own loader (libtee_load_video_fw.so, load_sec_firmware)
+	 * does.  Stripping a header here makes the TA reject the blob.
+	 */
+	buf = kmemdup(fw->data, fw->size, GFP_KERNEL);
 	if (!buf) {
 		release_firmware(fw);
 		return -ENOMEM;
 	}
 
-	memcpy(buf, fw->data + UCODE_HEADER_SIZE, fw->size - UCODE_HEADER_SIZE);
+	*size = fw->size;
 	release_firmware(fw);
 
 	*data = buf;
-	*size = fw->size - UCODE_HEADER_SIZE;
 
 	return 0;
 }
@@ -228,10 +289,26 @@ static int pass_firmware_to_tee(struct aml_vdec_hw *hw)
 	return ret;
 }
 
+/*
+ * Open the gate described at TEE_SMC_SYS_BOOT_COMPLETE.  Harmless to repeat -
+ * secure world latches the flag on the first call.
+ */
+static void tee_sys_boot_complete(struct aml_vdec_hw *hw)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(TEE_SMC_SYS_BOOT_COMPLETE, 0, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a0)
+		dev_info(hw->dev, "TEE sys_boot_complete returned 0x%lx\n",
+			 res.a0);
+}
+
 int aml_tee_fw_preload(struct aml_vdec_hw *hw)
 {
 	int ret;
 
+	tee_sys_boot_complete(hw);
+
 	ret = pass_firmware_to_tee(hw);
 	if (ret)
 		dev_err(hw->dev, "Failed to preload firmware via TEE\n");
diff --git a/drivers/media/platform/amlogic/vdec/reg_defines.h b/drivers/media/platform/amlogic/vdec/reg_defines.h
index ea50018a078d..b3cbddfe530e 100644
--- a/drivers/media/platform/amlogic/vdec/reg_defines.h
+++ b/drivers/media/platform/amlogic/vdec/reg_defines.h
@@ -173,5 +173,29 @@
 #define DOS_GCLK_EN3                 REG_ALIGN(0x3f35)
 #define DOS_HEVC_INT_EN              REG_ALIGN(0x3f36)
 
+/*
+ * The HEVC/AV1 core mirrors the legacy VDEC-1 register layout 0x3000 words
+ * higher: MPSR 0x0301 -> HEVC_MPSR 0x3301, IMEM_DMA_CTRL 0x0340 ->
+ * HEVC_IMEM_DMA_CTRL 0x3340.  Its scratch file sits in the ASSIST block at
+ * 0x30c0 rather than in MDEC.  Nothing decodes on this core yet; these exist so
+ * its power/clock state can be measured before secure world is asked to write
+ * microcode into it.
+ */
+/*
+ * Mailbox 0 is the one the AV1 microcode signals on; mainline's older HEVC/VP9
+ * support uses mailbox 1 instead, so its hevc_regs.h only names that pair.  The
+ * spacing matches the legacy VDEC-1 assist block exactly (0x0075/0x0076 there),
+ * and mainline's HEVC_ASSIST_MBOX1_CLR_REG 0xc1d4 -> word 0x3075 confirms it.
+ */
+#define HEVC_ASSIST_MBOX0_IRQ_REG    REG_ALIGN(0x3070)
+#define HEVC_ASSIST_MBOX0_CLR_REG    REG_ALIGN(0x3071)
+#define HEVC_ASSIST_MBOX0_MASK       REG_ALIGN(0x3072)
+#define HEVC_ASSIST_SCRATCH_0        REG_ALIGN(0x30c0)
+#define HEVC_ASSIST_SCRATCH_1        REG_ALIGN(0x30c1)
+#define HEVC_MPC_E                   REG_ALIGN(0x3308)
+#define HEVC_MPSR                    REG_ALIGN(0x3301)
+#define HEVC_CPSR                    REG_ALIGN(0x3321)
+#define HEVC_IMEM_DMA_CTRL           REG_ALIGN(0x3340)
+
 #endif
 
-- 
2.56.0

