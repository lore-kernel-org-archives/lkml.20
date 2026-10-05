Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E455349D2;
	Mon,  5 Oct 2026 17:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220795; cv=none; b=l44TadGXVkgLurzd1Lb7PkX9AxwOk67rLMpQNNEc7tLA3EBPfvh9UELavxowt7oArPyVNEUF0QNC3Jy8quQTKjBRH8EfyiSqHQTyt+Go0Cwip5jgkvbBGkZCS8dzGx6dbWvC9dkncauQ6qUhr+rNYA8hhpZYPTsI3eEl+0Bb1zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220795; c=relaxed/simple;
	bh=M644TGZklROMH+51DhA88yGbJ2Xx7+MrAZY4VXBn3Bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eXYatTtvLd5caDkn9pmwXReJGBZQbnir+F3mIS7PLEcpWrewDTuwCrQoeUBdycwxYRVn7LVjOQgM+Q1I4Fj3pav9A4RiHfygNqEDav6VkW9HNlXwCMulpv3XEkAMTuW/9sFmiBTFsMOosDXhekOzg5VFG9/BqN0FUzrun8aSwOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNOh+Wt7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNOh+Wt7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616091F00899;
	Mon,  5 Oct 2026 17:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220793;
	bh=B6pE3Ce2i9bhDUdAg4EBWapKiVAGsRR+VgS1nfnvDo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DNOh+Wt7IrHoYA4c/h1UwmAjhaAXkg6AAD2/EImEPMZmbghtCIJBnwcL5dfCiloA9
	 ZrcWBYd3gekf+BjvXdZV06iC1A6cgdUW+dIQr8MnijOdSl1IfDIO6eexiOuA0cGVma
	 J37wE7/dJaQuOmRJoeGEFhp8eLA2oW89f7UcMqArAzyzcvN5DNCVd/po81P0Ij5I/1
	 20a84dBHiHRi2QlGwACdj9BKfaNCMeE2fmxIP6RoU0hpswMMbRkjVxaJi3zENldVLN
	 lzFrtvlGMLoQU2ymsyx3CKqu+aqc5Jo4p/gUEq2VOqMWxyHjNgPZYlwq32N3wwcBvl
	 myNK8/T/20Z1Q==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:41 +0200
Subject: [PATCH 71/74] media: qcom: camss: vfe: Register and apply a
 parameters node for the pixel line
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-71-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11926; i=bod@kernel.org;
 h=from:subject:message-id; bh=lYRACBwwED+WzMqQ0GHUav7h3pazqjbNMlb+8zMKDDY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9szdXrsvdCscBCmq0GeaBVb0S66LzEfqPsoE
 Vov/tGhNQqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbMwAKCRAicTuzoY3I
 OqEND/wKJKJnLHpPLcHBnrJ45C8oifeRk5rsX2+fEC9UlI8GhM0hQv+fBa3fnvonnNTkUZiiTnq
 YoS93wCAxnL6/P800t/75y0WZB2iZ8i5cDTFJttqNmSPoGMRLeshxHfb49OlSAf7K+8yx4BZE+9
 8BJG7DtlcMN6J+bno0GuU5V5AlkKg8um4YjkSDTwdtC7dP+JxWbkY6mNpT2exFdhQ293iMm6lU6
 RE1oHbXKuR3oCECMt84v2EHp2HNB2SJEeSv6531KD2i/2d/Y+HA/aXs8NidItiyxWDUPTx1j+xK
 wpZ5l21rKNA8j9jlb1FKDAFboRcNtLKySlbOdSSudrKWtIm4cDq83iGVqjjcn/vhAtpZTWs7QCI
 81S5WSg7qIQaTAnXrh5Iow9UXRn8Uz7Bu/x+2P5F9fyC4I9WflkrR3uqDb98GwAPkSvxh9qs4XS
 4GrVKoe8zW6oIuYfzLYuxe47bvnNtEydxieTKjV4TndsNn1DEq2a9QS7m7EkO9k9vhAtGmhcZBf
 PuKEHH9vtffhFzgXDIPtChzfDPgETQJWQp/6X4kg8M4YIZRhwJjmDmS4EMTcOc06/TLxIup2lIO
 c55iMdZcF5jBf/C0NyucG0CgzWD1mIJdTms6Ri6w+2HtpSov87AtgbKBIBi89iWpuALSs6VNR/A
 wBdcC6QKFIduJGA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

A pixel line whose descriptor declares a parameters output, on a VFE
whose backend can apply parameters, gets a metadata output node,
msm_vfeN_params, linked immutably to its parameters pad. The node takes
V4L2_META_FMT_QCOM_ISP_PARAMS, in the v4l2-isp extensible format.

The backend provides the blocks the line accepts, indexed by type, and
how to apply a buffer. vfe_params_prepare() validates the kernel copy of
each buffer against them when it is prepared.

Parameters queued before the line starts are applied, oldest first,
after the pixel pipe takes its defaults. While streaming, one queued
buffer is applied per completed image frame, followed by a reg update.
Each buffer is returned with the sequence number of the first frame it
can affect.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 173 +++++++++++++++++++++++---
 drivers/media/platform/qcom/camss/camss-vfe.h |  12 ++
 2 files changed, 165 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 1522f1046d8dd..5c72357bb8f02 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -680,6 +680,99 @@ static void vfe_stats_fill(struct vfe_device *vfe, struct vfe_output *output,
 			      v4l2_isp_buffer_size(stats->data_size));
 }
 
+/*
+ * vfe_params_prepare - Validate a parameters buffer when it is prepared
+ * @vid: video node
+ * @buf: buffer, whose kernel copy buf->meta is validated
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_params_prepare(struct camss_video *vid, struct camss_buffer *buf)
+{
+	struct vfe_output *output = container_of(vid, struct vfe_output,
+						 video_out);
+	struct vfe_device *vfe = to_vfe(output->line);
+	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
+	struct vb2_buffer *vb = &buf->vb.vb2_buf;
+	int ret;
+
+	if (vid->type != V4L2_BUF_TYPE_META_OUTPUT)
+		return 0;
+
+	ret = v4l2_isp_params_validate_buffer_size(vfe->camss->dev, vb,
+						   vid->active_fmt.fmt.meta.buffersize);
+	if (ret)
+		return ret;
+
+	return v4l2_isp_params_validate_buffer(vfe->camss->dev, vb, buf->meta,
+					       ops->params_info,
+					       ops->params_num_types);
+}
+
+static struct vfe_output *vfe_params_output(struct vfe_line *line)
+{
+	unsigned int o;
+
+	for (o = 1; o < line->num_outputs; o++)
+		if (line->output[o].pad == MSM_VFE_PAD_SINK_PARAMS)
+			return &line->output[o];
+
+	return NULL;
+}
+
+/*
+ * vfe_params_apply_next - Apply the oldest queued parameters buffer
+ * @vfe: VFE device
+ * @line: VFE line
+ * @sequence: sequence number of the first frame the parameters can affect
+ *
+ * Called with output_lock held.
+ *
+ * Return the applied buffer for the caller to complete once the lock is
+ * dropped, or NULL if none was queued
+ */
+static struct camss_buffer *vfe_params_apply_next(struct vfe_device *vfe,
+						  struct vfe_line *line,
+						  u32 sequence)
+{
+	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
+	struct vfe_output *params = vfe_params_output(line);
+	struct camss_buffer *buf;
+
+	if (!params || !ops->vfe_params_apply)
+		return NULL;
+
+	buf = vfe_buf_get_pending(params);
+	if (!buf)
+		return NULL;
+
+	ops->vfe_params_apply(vfe, line, buf->meta);
+
+	buf->vb.vb2_buf.timestamp = ktime_get_ns();
+	buf->vb.sequence = sequence;
+
+	return buf;
+}
+
+/* Line start: apply every queued parameters buffer, oldest first */
+static void vfe_params_apply_queued(struct vfe_device *vfe,
+				    struct vfe_line *line)
+{
+	struct camss_buffer *buf;
+	unsigned long flags;
+
+	for (;;) {
+		spin_lock_irqsave(&vfe->output_lock, flags);
+		buf = vfe_params_apply_next(vfe, line, 0);
+		spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+		if (!buf)
+			break;
+
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+}
+
 /*
  * vfe_output_done - Retire the filled buffer of one output
  * @vfe: VFE device
@@ -752,6 +845,7 @@ static struct camss_buffer *vfe_output_done(struct vfe_device *vfe,
 void vfe_buf_done(struct vfe_device *vfe, int wm, struct camss_buf_done_info *buf_done_info)
 {
 	struct camss_buffer *ready[MSM_VFE_NUM_OUTPUTS] = { };
+	struct camss_buffer *params = NULL;
 	struct vfe_line *line;
 	unsigned long flags;
 	unsigned int o;
@@ -779,6 +873,14 @@ void vfe_buf_done(struct vfe_device *vfe, int wm, struct camss_buf_done_info *bu
 
 			ready[o] = vfe_output_done(vfe, line, output, ts);
 		}
+
+		/* one parameters buffer per completed image frame */
+		if (ready[0]) {
+			params = vfe_params_apply_next(vfe, line,
+						       line->output[0].sequence);
+			if (params)
+				vfe->res->hw_ops->reg_update(vfe, line->id);
+		}
 	}
 
 out_unlock:
@@ -788,6 +890,9 @@ void vfe_buf_done(struct vfe_device *vfe, int wm, struct camss_buf_done_info *bu
 		if (ready[o])
 			vb2_buffer_done(&ready[o]->vb.vb2_buf,
 					VB2_BUF_STATE_DONE);
+
+	if (params)
+		vb2_buffer_done(&params->vb.vb2_buf, VB2_BUF_STATE_DONE);
 }
 
 /*
@@ -950,6 +1055,10 @@ int vfe_enable_v2(struct vfe_line *line)
 	if (ops->vfe_line_prepare)
 		ops->vfe_line_prepare(line);
 
+	/* queued parameters override the defaults the line starts with */
+	if (line->is_pix)
+		vfe_params_apply_queued(vfe, line);
+
 	ret = vfe_enable_output_v2(line);
 	if (ret < 0)
 		goto error_enable_output;
@@ -2490,17 +2599,19 @@ static int vfe_bpl_align_pix(struct vfe_device *vfe)
 }
 
 /*
- * vfe_register_stats_node - Register the statistics node of a pixel line
+ * vfe_register_meta_nodes - Register the metadata nodes of a pixel line
  * @vfe: VFE device
  * @line: VFE line
  * @v4l2_dev: V4L2 device
  *
  * A line whose descriptor declares a statistics output gets a metadata
- * capture node, msm_vfeN_stats, linked from its statistics pad.
+ * capture node, msm_vfeN_stats, linked from its statistics pad. One that
+ * declares a parameters output, on a VFE able to apply parameters, gets a
+ * metadata output node, msm_vfeN_params, linked to its parameters pad.
  *
  * Return 0 on success or a negative error code otherwise
  */
-static int vfe_register_stats_node(struct vfe_device *vfe,
+static int vfe_register_meta_nodes(struct vfe_device *vfe,
 				   struct vfe_line *line,
 				   struct v4l2_device *v4l2_dev)
 {
@@ -2511,32 +2622,54 @@ static int vfe_register_stats_node(struct vfe_device *vfe,
 	for (o = 1; o < line->num_outputs; o++) {
 		struct vfe_output *output = &line->output[o];
 		struct camss_video *video = &output->video_out;
+		const char *suffix;
 		char name[32];
 
-		if (output->pad != MSM_VFE_PAD_SRC_STATS || !output->wm_num)
+		if (output->pad == MSM_VFE_PAD_SRC_STATS && output->wm_num) {
+			video->type = V4L2_BUF_TYPE_META_CAPTURE;
+			video->active_fmt.fmt.meta.dataformat =
+				V4L2_META_FMT_QCOM_ISP_STATS;
+			video->active_fmt.fmt.meta.buffersize =
+				v4l2_isp_buffer_size(CAMSS_STATS_MAX_PAYLOAD);
+			suffix = "stats";
+		} else if (output->pad == MSM_VFE_PAD_SINK_PARAMS &&
+			   vfe->res->hw_ops->vfe_params_apply) {
+			video->type = V4L2_BUF_TYPE_META_OUTPUT;
+			video->active_fmt.fmt.meta.dataformat =
+				V4L2_META_FMT_QCOM_ISP_PARAMS;
+			video->active_fmt.fmt.meta.buffersize =
+				v4l2_isp_buffer_size(CAMSS_PARAMS_IFE_MAX_PAYLOAD);
+			suffix = "params";
+		} else {
 			continue;
+		}
 
-		video->type = V4L2_BUF_TYPE_META_CAPTURE;
-		video->active_fmt.fmt.meta.dataformat =
-			V4L2_META_FMT_QCOM_ISP_STATS;
-		video->active_fmt.fmt.meta.buffersize =
-			v4l2_isp_buffer_size(CAMSS_STATS_MAX_PAYLOAD);
 		video->ops = &vfe->video_ops;
 
 		snprintf(name, ARRAY_SIZE(name), "%s%d_%s",
-			 MSM_VFE_NAME, vfe->id, "stats");
+			 MSM_VFE_NAME, vfe->id, suffix);
 		ret = msm_video_register(video, v4l2_dev, name);
 		if (ret < 0) {
-			dev_err(dev, "Failed to register stats node: %d\n", ret);
+			dev_err(dev, "Failed to register %s node: %d\n",
+				suffix, ret);
 			return ret;
 		}
 
-		ret = media_create_pad_link(&line->subdev.entity, output->pad,
-					    &video->vdev.entity, 0,
-					    MEDIA_LNK_FL_IMMUTABLE |
-					    MEDIA_LNK_FL_ENABLED);
+		if (video->type == V4L2_BUF_TYPE_META_OUTPUT)
+			ret = media_create_pad_link(&video->vdev.entity, 0,
+						    &line->subdev.entity,
+						    output->pad,
+						    MEDIA_LNK_FL_IMMUTABLE |
+						    MEDIA_LNK_FL_ENABLED);
+		else
+			ret = media_create_pad_link(&line->subdev.entity,
+						    output->pad,
+						    &video->vdev.entity, 0,
+						    MEDIA_LNK_FL_IMMUTABLE |
+						    MEDIA_LNK_FL_ENABLED);
 		if (ret < 0) {
-			dev_err(dev, "Failed to link stats node: %d\n", ret);
+			dev_err(dev, "Failed to link %s node: %d\n", suffix,
+				ret);
 			msm_video_unregister(video);
 			return ret;
 		}
@@ -2545,7 +2678,7 @@ static int vfe_register_stats_node(struct vfe_device *vfe,
 	return 0;
 }
 
-static void vfe_unregister_stats_node(struct vfe_line *line)
+static void vfe_unregister_meta_nodes(struct vfe_line *line)
 {
 	unsigned int o;
 
@@ -2660,7 +2793,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 			goto error_link;
 		}
 
-		ret = vfe_register_stats_node(vfe, &vfe->line[i], v4l2_dev);
+		ret = vfe_register_meta_nodes(vfe, &vfe->line[i], v4l2_dev);
 		if (ret < 0)
 			goto error_link;
 	}
@@ -2681,7 +2814,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		sd = &vfe->line[i].subdev;
 		video_out = &vfe->line[i].output[0].video_out;
 
-		vfe_unregister_stats_node(&vfe->line[i]);
+		vfe_unregister_meta_nodes(&vfe->line[i]);
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
 		media_entity_cleanup(&sd->entity);
@@ -2705,7 +2838,7 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 		struct v4l2_subdev *sd = &vfe->line[i].subdev;
 		struct camss_video *video_out = &vfe->line[i].output[0].video_out;
 
-		vfe_unregister_stats_node(&vfe->line[i]);
+		vfe_unregister_meta_nodes(&vfe->line[i]);
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
 		media_entity_cleanup(&sd->entity);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 0b2634f1e4d6a..b39bce17f8dec 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -14,6 +14,7 @@
 #include <linux/spinlock_types.h>
 #include <media/media-entity.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-isp.h>
 #include <media/v4l2-subdev.h>
 
 #include "camss-video.h"
@@ -205,6 +206,16 @@ struct vfe_hw_ops {
 	 */
 	void (*vfe_line_prepare)(struct vfe_line *line);
 
+	/*
+	 * Optional: the parameters blocks the pixel line accepts, indexed by
+	 * block type, and how to apply a validated parameters buffer. Applying
+	 * runs with output_lock held, ahead of a reg update.
+	 */
+	const struct v4l2_isp_params_block_type_info *params_info;
+	unsigned int params_num_types;
+	void (*vfe_params_apply)(struct vfe_device *vfe, struct vfe_line *line,
+				 const struct v4l2_isp_buffer *params);
+
 	/* Output based API - new and shiny */
 	void (*vfe_output_start)(struct vfe_device *vfe, struct vfe_output *output);
 	void (*vfe_output_stop)(struct vfe_device *vfe, struct vfe_output *output);
@@ -431,6 +442,7 @@ void vfe_add_ds(struct vfe_output *output, u8 pad, u8 bus_client,
 
 void vfe_add_stats(struct vfe_output *output, u8 bus_client, u8 comp_group);
 int vfe_alloc_stats(struct vfe_device *vfe, struct vfe_output *output);
+int vfe_params_prepare(struct camss_video *vid, struct camss_buffer *buf);
 
 void vfe_add_params(struct vfe_output *output, u8 comp_group);
 

-- 
2.55.0

