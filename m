Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536D14FC8E9;
	Mon,  5 Oct 2026 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220647; cv=none; b=gadt8UbIaWkrgI+xTqA8QkN7Ga+eeOuxAKPnUakb/5beFgBJIzxnqBotNeksJfA9FRQjScxWElCVcYukGOLr1qt7mXha9Vjf1H6VYTkNtyhftEu9SgQkNL5L/OKT2VnxDwIJNLun5+oijcK/zm5s3UhZ41JKeyWv0fIoDa84bfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220647; c=relaxed/simple;
	bh=uZHOtdZ7ZkW6QiUCgDAfjmufnCYVcRTVAreppc0Lbfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GV1Wmlv8WGYLaaMGe6sMy6DBQkb41gUDCMRlF1tzzSTxeqXayZZKvnep4qSe8WB3AiBZD4HUpPSZqOyabmRBo0+hbhv3wAR3sMiMNXKAkHIIzo4G7wpjCTSb7CVUgq6Vanp38YHKcloZik0j6ZMsMIUHNpYCzFtb79kroM64dps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhzIxkUJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhzIxkUJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF391F000FF;
	Mon,  5 Oct 2026 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220646;
	bh=jdDSWGXfAz9URm8xuQSLbjl4wrv80HkRSDxjJn5tPfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AhzIxkUJFiotjmbM4mmR1mWSH2LgBTbN0gVn1E6yJPnHLfFWgliz3r1IuLgqE6sFW
	 rtz8wdT2tRfpfUwhOhCwb57JE5S/wq7fhWkF/nsH7Qmi+Sh0MtDqmigqDDIUpO7Bc0
	 M5z3LM7LmIplYvPdOUGHdxc4NptJG+Ufz1LxClyzJP/XrYqbYwUdo19Z61TWDkowdz
	 PJ5ZIjk/al2LNlj1YB332LFiLWU96yDaW0DMpQYAmFoS8InSacddLPGj12yQ1MCyeO
	 2SH5gXiFgUK8a5+BLTd/5OGP6TeczF+WSUbAPWaNQw4uqCmj6EPZJI8wa1U1Vw9uwB
	 f6RMTJL2XTCPQ==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:59 +0200
Subject: [PATCH 29/74] media: qcom: camss: vfe: Specify number of pads via
 line->num_pads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-29-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2292; i=bod@kernel.org;
 h=from:subject:message-id; bh=uZHOtdZ7ZkW6QiUCgDAfjmufnCYVcRTVAreppc0Lbfg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sVO5WRjH81aPnjNbCLfFhE+w3WUMEDc7iL1
 qUgaDoxtG2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbFQAKCRAicTuzoY3I
 OphfEADA4PPJbA1u0hmw7vmtgJWfzTpT69vd33l/Tec8GyvXn0Vgxpd50XHP+KKasyt+5o6K4nc
 aWN85qYKRux4sV4g3hXSXd0yIJgcXHG9csUg8K54T8+OQS1wjifvbJp3j9HXALbBR0fBm7lEZ0d
 0JKXwoG99WJcskMXY03Qqs9XwQzOqMNyuRlfgMY7OU0cAT4PDhGnyFEtNfa39ldn/vJ6bgVe95/
 GIXFzhzi7y8Bz1tu/EYJfMkxOc9/1ZXwJ+Qn7BGdH4qD1/E9+Mb3/pQ032aR8NEvPdyKZVisNqf
 buH8eoRwkNBWjNMe1lz3afKPhLug6Grlt+JRgwkn6pEWycAKJVqBnBhpwDAxEhJ7rKn5YQyUzVV
 wJqd3O/Ac7sn4upRrN3WSrK+viuBTTm9ddOPG42QUCBBUIg5XxM+JKBg/Fs2eJRh1q28I7tPwE0
 PMKf9hNCz2smXYwHsD8Xf5H5P3jTh2i6DIQEAOKWJEETcU1Xz+WR+SQM3lLE9Z/W2WR7ln79NTH
 5bwJmfEuVoPRV3pLkhmUL3/SprzGkJzI5OWS6aHqrWORKJp7KaLR8m6Wvw0P6L/tmARjCuRd/NQ
 UE/A3d921XmO2KHawpPEW7YMOlopDmySdpfaQ6aTJ9vX1HvbJY8F5GqIIG6CdACWaIIpDo6yDTk
 CTK6ZzfLjDMN37w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

We will need more pads to support the pix path - allow the code to specify
the number of pads via variable instead of via fixed define.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 4 +++-
 drivers/media/platform/qcom/camss/camss-vfe.h | 8 +++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 35ab3203d75af..3fe0139f82d16 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2050,6 +2050,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		l->output[0].wm_num = 1;
 		l->output[0].wm[0].bus_client = l->id;
 
+		l->num_pads = MSM_VFE_PAD_NUM_RDI;
+
 		init_completion(&l->output[0].sof);
 		init_completion(&l->output[0].reg_update);
 
@@ -2231,7 +2233,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 
 		sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 		sd->entity.ops = &vfe_media_ops;
-		ret = media_entity_pads_init(&sd->entity, MSM_VFE_PADS_NUM,
+		ret = media_entity_pads_init(&sd->entity, vfe->line[i].num_pads,
 					     pads);
 		if (ret < 0) {
 			dev_err(dev, "Failed to init media entity: %d\n", ret);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 8bc07fe7798e1..8fee26a0dc2e6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -21,7 +21,8 @@
 
 #define MSM_VFE_PAD_SINK 0
 #define MSM_VFE_PAD_SRC 1
-#define MSM_VFE_PADS_NUM 2
+#define MSM_VFE_PAD_NUM_RDI 2
+#define MSM_VFE_MAX_PADS MSM_VFE_PAD_NUM_RDI
 #define MSM_VFE_NUM_OUTPUTS 1
 
 #define MSM_VFE_IMAGE_MASTERS_NUM 7
@@ -141,8 +142,9 @@ struct vfe_line {
 	enum vfe_line_id id;
 	bool is_pix;
 	struct v4l2_subdev subdev;
-	struct media_pad pads[MSM_VFE_PADS_NUM];
-	struct v4l2_mbus_framefmt fmt[MSM_VFE_PADS_NUM];
+	struct media_pad pads[MSM_VFE_MAX_PADS];
+	struct v4l2_mbus_framefmt fmt[MSM_VFE_MAX_PADS];
+	u32 num_pads;
 	struct v4l2_rect compose;
 	struct v4l2_rect crop;
 	struct vfe_output output[MSM_VFE_NUM_OUTPUTS];

-- 
2.55.0

