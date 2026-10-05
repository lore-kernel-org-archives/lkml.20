Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9B151C04F;
	Mon,  5 Oct 2026 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220703; cv=none; b=gaK7xrQTGhc7OGMDBo3V+TXMGVpQpR9yW1+RtZqj7FC0XzkrRSGmtRUEUHPd0HqAo7kdwp48T5Q3dg7ZSALxOUblUX7i+vAxRvHzCxDCfCpRo7yx/Z4e1bL1Wvh7fxEbHDrZ3TRX9bqkmy5Kb7NONyzx+uJ6KuqvR4jNcfCjiFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220703; c=relaxed/simple;
	bh=QazJd14CEIiTwal+VmeUR/3RF1yiGxRYsUionOGJUs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZMPY89JUXtEloD9408F1hy0isPZQXIfWeUa4oLmqnj5714WcwplXYlEkBlTFhm/KWthQOggdRjp6pJ8QUBsHMYXzkGVVDrVZJNuO8GHZpibxJ9NxdS4Jh4OYgpgoo6Yb6pXEnh04wKM/k0EAqREKYnpFt2HfqkuC/rcfYqxag4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwfoAH6D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwfoAH6D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0299A1F000FF;
	Mon,  5 Oct 2026 17:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220702;
	bh=3x7vxRLN+t/jpmmYOrMJ0mGFQf4ACoIKNEE2W9WYpGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LwfoAH6DslMnOUV9tts0tL63573l1aKaksEmULA7F1z0r1+1j7V8XaIdX5ubmVFiv
	 RFs7GFuYPC447FCk7zMlMtUtw2rfbn6YO5QFoeP26RC8HdsvDHMIKQsc+XIWU7o+RI
	 DO3IlEYjgTdZ9OGNR6mGLkIjMMgDONXVmeVE6g41usVnPtcm6WYVRuUEVR9HJobZWx
	 j+5s5HSZJ6NDchs2Wm56bZ4bp7gLrO0EnBrVenX1veVDy3+BaBwaV7zh6/iZtukxn2
	 3HyScZsFC8mR9PGFRdTV+P6luveqBNJcclRROlKR0fxfN/04De4yPru/wO+pArJXX4
	 CKgd4RztFQNHw==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:15 +0200
Subject: [PATCH 45/74] media: qcom: camss: vfe: Add support for pix pad
 data-types
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-45-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4982; i=bod@kernel.org;
 h=from:subject:message-id; bh=QazJd14CEIiTwal+VmeUR/3RF1yiGxRYsUionOGJUs0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sheAeQ+bg+w3c0wt14fWUPoycph/T8lmTVB
 5W4+nXYcFyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbIQAKCRAicTuzoY3I
 Om4oD/4+kKqoPpX/ExpK15614yWhXL1SLSGGx4Z7IVuiIL36HQ1XeTiz2yNGZUB91YVtGWokmCy
 Ly9Xp1gYqGyXP3z8y8RNd7beYUekuw1e49v5UDYy6/ExpwhTaeZE14oeLqx+pNMWJ7gSA9/Q9kH
 263sSI4DBysTRzlEQ2vcSWSfvztYaq561B2lVn+Kay37PNjlCE/6KGy3ccb38my44VA+BIc8FgH
 aUO8B0sic8F4kQNH3KUi/bkSwkI9cQWBnzmWndMGUOdTQ8HSuGFg7zRNBOgbqR84fpoXSkMHeiP
 fx0Fdf7VohpNxiIbuEVeQg69Pnw2vxoE+CpTPNLqZvpeh7C5fFKzOxUfztVYaKFzlSM1vM/hOmW
 RJaOlmYeAi4H+buIPvM4MnnTMH3YDIAjZOk1QVahcBO1UKu9EvkoDjhh99Ue2WG/A6Pq/Ssm8NK
 9rKmBVNk2EeF3BI939pJ4K5RgH1WB3Z9dT6eFt6YlRduaj/L5UXc3pRT1xo2LdtZ4Rl37nibsQY
 2bWceSdETml8GsHDPJf9sYicNz2legGH6KWpM51B8Uy4kgzU6+upiFzUplFKW0BqwaWvrnw/obu
 fUI5o2uPDSQsWfcgHtQwH6mCAc6LhJDgtL+KCaZMJGbBqqS2nLvgpyzEY7jH2Uo6Et5F2twPQDe
 oNmZvSYKp4mftUQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

We already export src and sink for the simple RDI pads.
The pix sub-device will need to export

- Downscalers
- Statistics
- Parameters

Put code in place to describe these pads when a given VFE declares
support for them:

- DS4 and DS16 report a format derived from the source pad on every
  read, and enumerate only that code
- Statistics and parameters report MEDIA_BUS_FMT_METADATA_FIXED and
  have no frame size
- Selection is rejected on every pad other than the sink (compose) and
  the source (crop)

No VFE declares these pads yet, so there is no functional change.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 59 ++++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h |  7 +++-
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index e57590b417f3d..8726353b52d3d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1529,8 +1529,10 @@ static void vfe_try_format(struct vfe_line *line,
 			   struct v4l2_mbus_framefmt *fmt,
 			   enum v4l2_subdev_format_whence which)
 {
+	struct v4l2_mbus_framefmt *src;
 	unsigned int i;
 	u32 code;
+	u32 w, h;
 
 	switch (pad) {
 	case MSM_VFE_PAD_SINK:
@@ -1571,6 +1573,28 @@ static void vfe_try_format(struct vfe_line *line,
 		}
 
 		break;
+
+	case MSM_VFE_PAD_SRC_DS4:
+	case MSM_VFE_PAD_SRC_DS16:
+		src = __vfe_get_format(line, sd_state, MSM_VFE_PAD_SRC, which);
+		w = ALIGN(src->width, 8) / 4;
+		h = ALIGN(src->height, 8) / 4;
+
+		if (pad == MSM_VFE_PAD_SRC_DS16) {
+			w = (w / 4) & ~1u;
+			h = (h / 4) & ~1u;
+		}
+		*fmt = *src;
+		fmt->width = w;
+		fmt->height = h;
+
+		break;
+	case MSM_VFE_PAD_SRC_STATS:
+	case MSM_VFE_PAD_SINK_PARAMS:
+		memset(fmt, 0, sizeof(*fmt));
+		fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+		fmt->field = V4L2_FIELD_NONE;
+		return;
 	}
 
 	fmt->colorspace = V4L2_COLORSPACE_SRGB;
@@ -1672,6 +1696,22 @@ static int vfe_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct vfe_line *line = v4l2_get_subdevdata(sd);
 
+	switch (code->pad) {
+	case MSM_VFE_PAD_SRC_DS4:
+	case MSM_VFE_PAD_SRC_DS16:
+		if (code->index)
+			return -EINVAL;
+		code->code = __vfe_get_format(line, sd_state, MSM_VFE_PAD_SRC,
+					      code->which)->code;
+		return 0;
+	case MSM_VFE_PAD_SRC_STATS:
+	case MSM_VFE_PAD_SINK_PARAMS:
+		if (code->index)
+			return -EINVAL;
+		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
+		return 0;
+	}
+
 	if (code->pad == MSM_VFE_PAD_SINK) {
 		if (code->index >= line->nformats)
 			return -EINVAL;
@@ -1707,6 +1747,11 @@ static int vfe_enum_frame_size(struct v4l2_subdev *sd,
 	struct vfe_line *line = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt format;
 
+	/* Metadata has no frame size */
+	if (fse->pad == MSM_VFE_PAD_SRC_STATS ||
+	    fse->pad == MSM_VFE_PAD_SINK_PARAMS)
+		return -ENOTTY;
+
 	if (fse->index != 0)
 		return -EINVAL;
 
@@ -1749,7 +1794,11 @@ static int vfe_get_format(struct v4l2_subdev *sd,
 	if (format == NULL)
 		return -EINVAL;
 
-	fmt->format = *format;
+	/* Every pad past the src - downscalers, stats, params don't get assigned */
+	if (fmt->pad > MSM_VFE_PAD_SRC)
+		vfe_try_format(line, sd_state, fmt->pad, &fmt->format, fmt->which);
+	else
+		fmt->format = *format;
 
 	return 0;
 }
@@ -1875,6 +1924,8 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
 		default:
 			return -EINVAL;
 		}
+	else
+		return -EINVAL;
 
 	return 0;
 }
@@ -2294,6 +2345,12 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 
 		pads[MSM_VFE_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 		pads[MSM_VFE_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+		if (vfe->line[i].num_pads == MSM_VFE_PAD_NUM_PIX) {
+			pads[MSM_VFE_PAD_SRC_DS4].flags = MEDIA_PAD_FL_SOURCE;
+			pads[MSM_VFE_PAD_SRC_DS16].flags = MEDIA_PAD_FL_SOURCE;
+			pads[MSM_VFE_PAD_SRC_STATS].flags = MEDIA_PAD_FL_SOURCE;
+			pads[MSM_VFE_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
+		}
 
 		sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 		sd->entity.ops = &vfe_media_ops;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index b84b324940b64..18403bf46178c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -21,8 +21,13 @@
 
 #define MSM_VFE_PAD_SINK 0
 #define MSM_VFE_PAD_SRC 1
+#define MSM_VFE_PAD_SRC_DS4 2
+#define MSM_VFE_PAD_SRC_DS16 3
+#define MSM_VFE_PAD_SRC_STATS 4
+#define MSM_VFE_PAD_SINK_PARAMS 5
 #define MSM_VFE_PAD_NUM_RDI 2
-#define MSM_VFE_MAX_PADS MSM_VFE_PAD_NUM_RDI
+#define MSM_VFE_PAD_NUM_PIX 6
+#define MSM_VFE_MAX_PADS MSM_VFE_PAD_NUM_PIX
 #define MSM_VFE_NUM_OUTPUTS 1
 
 #define MSM_VFE_IMAGE_MASTERS_NUM 7

-- 
2.55.0

