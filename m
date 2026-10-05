Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B2653161E;
	Mon,  5 Oct 2026 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220771; cv=none; b=GWOQGLhJJvvQQ7L6fdVz3kJcYjarWMpG5x/jzsX4fNJYxw1xRnpHkKt6qqANVfVEB2F9FEcEt8IkrDDLsMJmztDDm9R6lyE3y5gpCbaVZ0ize+aoSExqMdlfEVG8DBJ+obVVPJajWugmbfN4a2V2bFc62JC9JoFuwQj51V74T5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220771; c=relaxed/simple;
	bh=suIKByc22EBVd6NzZw3DGC/UVpmB8QIcsdotoZKHyJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2Z6xfM3NyETOam3MnvKstQjW16ahfXDeyq/Hwnq+FIbW917qDZ3agOH8I1BD/TzCD+ON2s/xhK6pC5vKhX0RliEdhoWQMdLAzE1q35Z/AZ3E1UpcBAOpOibYPI6CGGiWNhidt7xYPt1G6zZ9eEGGbqom/rdq5vyVvoPjBlPJy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ek08A4rk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ek08A4rk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EB41F00893;
	Mon,  5 Oct 2026 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220768;
	bh=PUS1VqT1unHEmRoX3yoBazSvna/Wqg3AnG0UfHiqWvQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ek08A4rkyT5ieak7UQL3oXm4aR1HYBW42dZNhXJWnqYkuVCXdWtEic4qjzTiEWtnV
	 3WPic958cc0LoYYBguvtgT39PswxglkY3fRD3wTLJ5e+GHUYgitkMdW6HOqgbgloF/
	 PhLMB1OBGS36mdMcF6MPM1vohPV/0+lJuGUxBsX3XWRhEIh+J3FpT7hAtcTe+LqPWO
	 2Qfqj5eF1r0+nZ06wwJn8yp5L+ue4JF2cXDaIqqSLXza29qDgbVi2sNpC24m26efTP
	 eWyev0qY5SauMi8/aLxbCgbFZxULjwfNFPpCLvu+D1mYlZcT3/zP/eBvz7fDbXs9fK
	 fu2tuziTvRozA==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:34 +0200
Subject: [PATCH 64/74] media: qcom: camss: vfe: Register a statistics node
 for the pixel line
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-64-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4548; i=bod@kernel.org;
 h=from:subject:message-id; bh=5A2KoQwEXT2+D4A1qWNDb5wIIoIA0EWL30AFwbOSegA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9suCsNCKG61iiufrkWxnley5A0ZRlYTlwYs+
 B+WJ67nKRmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbLgAKCRAicTuzoY3I
 OsuaD/9Dce93l/PiCNyA0RGgZ8Xk7uwS+AII8SmdbAEqJSwe/uHBZs1l+kjvGYuHbL0IZJ3NiNC
 9DgZoNTVTjZxzJT/O8tMxctgB1mXKhRQLaQdKSpSGw4TLb/ZAKxLcZUn0eQumDcSJkn28w3xOgs
 TvikHQkEpyAVxU1vpBKJOQQ/C0d7R6cn6NSxN/iI8sie3st+06clCR4cYVTLbMmcuRYzFgWYAwZ
 W9JMTCejrYY2uDeb5ZXXWwWQConALvUIbyo9wfWnUGaHSclqZzSRadlDuqhCM2qjht5uODNvUzd
 s/wavlisplCIXr7NRgXBp22AILhLuNyI092S8jB0CTRHSeNJBCH5heolwkm2f7sKEj+MXKoznpb
 ICu+8aHOCw0V6cnIaGXrfjgxH6YEmzbbcHu2U9DzE6vXbpi6TMWo0ayItgODGEjtBpKm5p/zwOX
 TLLaf9ClZKZE7psGjGHTaG2hDMNCA82rM2FaEDP+yyl0zzrcr+Ar06sm070pnjTchqXHtOx11YU
 GGvR2uH75dSgMTHIk5QKBcgy45nK49MajBZCiwC9kN8tyN5yCAKyU9Idyr0LqFPu/Dl9tGM32ar
 wA3izmJiU2KiRYWJGnxtcmqBK7xaFu24OM10XGoRtfWtNsI4eCx/eSZSU6zqjpq7NqoszFlynUo
 dyLCcCayTO/XFrQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

A line whose descriptor declares a statistics output gets a metadata
capture node, msm_vfeN_stats, linked immutably from its statistics pad.
The node carries V4L2_META_FMT_QCOM_ISP_STATS, sized for every
statistics block the format defines.

Select V4L2_ISP for the statistics buffer helpers.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Kconfig     |  1 +
 drivers/media/platform/qcom/camss/camss-vfe.c | 76 +++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 42c3ee13e548b..4f1c1000a501e 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -8,3 +8,4 @@ config VIDEO_QCOM_CAMSS
 	select VIDEOBUF2_DMA_SG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_FWNODE
+	select V4L2_ISP
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 8bcacede0f969..12d94bdf13bc8 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -20,7 +20,9 @@
 #include <linux/spinlock.h>
 #include <media/media-entity.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-isp.h>
 #include <media/v4l2-subdev.h>
+#include <linux/qcom-camss-config.h>
 
 #include "camss-vfe.h"
 #include "camss.h"
@@ -2370,6 +2372,74 @@ static int vfe_bpl_align_pix(struct vfe_device *vfe)
 	return ret;
 }
 
+/*
+ * vfe_register_stats_node - Register the statistics node of a pixel line
+ * @vfe: VFE device
+ * @line: VFE line
+ * @v4l2_dev: V4L2 device
+ *
+ * A line whose descriptor declares a statistics output gets a metadata
+ * capture node, msm_vfeN_stats, linked from its statistics pad.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_register_stats_node(struct vfe_device *vfe,
+				   struct vfe_line *line,
+				   struct v4l2_device *v4l2_dev)
+{
+	struct device *dev = vfe->camss->dev;
+	unsigned int o;
+	int ret;
+
+	for (o = 1; o < line->num_outputs; o++) {
+		struct vfe_output *output = &line->output[o];
+		struct camss_video *video = &output->video_out;
+		char name[32];
+
+		if (output->pad != MSM_VFE_PAD_SRC_STATS || !output->wm_num)
+			continue;
+
+		video->type = V4L2_BUF_TYPE_META_CAPTURE;
+		video->active_fmt.fmt.meta.dataformat =
+			V4L2_META_FMT_QCOM_ISP_STATS;
+		video->active_fmt.fmt.meta.buffersize =
+			v4l2_isp_buffer_size(CAMSS_STATS_MAX_PAYLOAD);
+		video->ops = &vfe->video_ops;
+
+		snprintf(name, ARRAY_SIZE(name), "%s%d_%s",
+			 MSM_VFE_NAME, vfe->id, "stats");
+		ret = msm_video_register(video, v4l2_dev, name);
+		if (ret < 0) {
+			dev_err(dev, "Failed to register stats node: %d\n", ret);
+			return ret;
+		}
+
+		ret = media_create_pad_link(&line->subdev.entity, output->pad,
+					    &video->vdev.entity, 0,
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret < 0) {
+			dev_err(dev, "Failed to link stats node: %d\n", ret);
+			msm_video_unregister(video);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void vfe_unregister_stats_node(struct vfe_line *line)
+{
+	unsigned int o;
+
+	for (o = 1; o < line->num_outputs; o++) {
+		struct camss_video *video = &line->output[o].video_out;
+
+		if (video_is_registered(&video->vdev))
+			msm_video_unregister(video);
+	}
+}
+
 /*
  * msm_vfe_register_entities - Register subdev node for VFE module
  * @vfe: VFE device
@@ -2472,6 +2542,10 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 				ret);
 			goto error_link;
 		}
+
+		ret = vfe_register_stats_node(vfe, &vfe->line[i], v4l2_dev);
+		if (ret < 0)
+			goto error_link;
 	}
 
 	return 0;
@@ -2490,6 +2564,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		sd = &vfe->line[i].subdev;
 		video_out = &vfe->line[i].output[0].video_out;
 
+		vfe_unregister_stats_node(&vfe->line[i]);
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
 		media_entity_cleanup(&sd->entity);
@@ -2513,6 +2588,7 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 		struct v4l2_subdev *sd = &vfe->line[i].subdev;
 		struct camss_video *video_out = &vfe->line[i].output[0].video_out;
 
+		vfe_unregister_stats_node(&vfe->line[i]);
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
 		media_entity_cleanup(&sd->entity);

-- 
2.55.0

