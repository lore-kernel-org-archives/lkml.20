Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D3E4FDE62;
	Mon,  5 Oct 2026 17:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220651; cv=none; b=h6EC/rYhiOMx5yOB1fW53yj58QrsfiT/H+aTmt14SOvwzKo0y4SmUmadxwJzGFWNzWL/tZKiT3T/ryq9Plg1A7sbBaJYLs49yM8CEZHs5LU9EQIaM/9es3B9FlqJCriZ9nnl9ToTXPluQUfA6u6zZeCFoHzB3mOAPUsc48brHz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220651; c=relaxed/simple;
	bh=zpHUGaMOv4rleepuPINwUsmn1QkrrMVy/A/51qSCQNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2odVdyKKkhzhCz8ZrEf6jtxTsVdWpxs2BZo55pOuo2XT5ZMnIssQRD1jnCCH3p8/EecxdiVCjMH75Cct0nDJLrrzf7ir1hbyOLkEBLQL3ocedbMrtujtIgjcxfrS4inZVHJUUurPOCuYmSeW7XYlvhbJJYsxHljvaAHsMn1pYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYq0YUjK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYq0YUjK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749BB1F00893;
	Mon,  5 Oct 2026 17:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220649;
	bh=oUBfb6Idu9vkxSLPFUu5fxH2k09LNKp6SV8nHrhDTc0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YYq0YUjKY6HjFCkIDnRSTnl4WctVeXP5ZEu5ZLKcdQPZGqB2Wl8MbeNK6hEHDKvlm
	 8QubBL7Q4oyOzDPoa3QuvU8euxR8YDL428FOD9hrzR6Q5EWV1qTcJWFSe3ngdp1J4J
	 a8UFNRY3ig37ATlyUp/azxkobL6NGaKDmJ1/0BhiMwn09r8dWtDQLks5cF3wwZ1x35
	 aBJWwK2y7TAW5JSR1Aj8Rhf+MziQK45Jgn9wZspNLaAbOP5vYjwecei3OZRvy2+PoK
	 yW2ZWZVc1irfg0rGzzelsvBCoOyw8bHzvAzMdHZ0HizKuvbbbWOPe+fCqA29DjRvqR
	 l9Fb4ZrOQYBtQ==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:00 +0200
Subject: [PATCH 30/74] media: qcom: camss: vfe: Add support for starting
 multiple write-masters in one output's group
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-30-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3225; i=bod@kernel.org;
 h=from:subject:message-id; bh=zpHUGaMOv4rleepuPINwUsmn1QkrrMVy/A/51qSCQNc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sWipc4y6GfcC8x2PN73OsfXpjcfhqrPADlc
 sv7jUzsOguJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbFgAKCRAicTuzoY3I
 OpdgD/0ZpgMYb7zf/U5lgPgjeMg6yM7GiOstjmaj35ZOO/V3LdayQTbATxEu4oi42wqfworKPDu
 CzzClrYAZf5/nSpxrGGFwJpDCWOB/S7ncRk08y5R/bWKWJIhphEz2iTKPZU3FyLh3WK0nCzKApl
 RA7Q5AWjA/CrCIiyoyIIsJCx78g++F04jNnvVHvq3YSwtuEM1jCFiUFkCFAoINQkVTDGA4IsXjc
 NI+4va50O5wy+DPAb7M5SHYZbyau02S0R4YQ0Q1YuB0LAXBgfJDzBwASWLI82taU1rYuhIWy6vo
 SCxYRHx25ez0bKHM/pBTYREmo/PVon4FB4l7N96cbfB0djwF4tUcharJXmLCqc7Jth+H4b7vQlK
 qhrc527nQ4zlaW8PI1nwTcNeJTfk0QyZ34Apc0oB/F6464OI8bKHL4jH6jCZJUyqXsK5T7tErtH
 PskIZ5ifQFgiXcDJgB0oW6FGReItNVMIZxFotSrYsKXVEczm/uv7EqmYiJM8ZYcItMmC4lthv/N
 Y4rlox9tfX+PpRnDanlfmgG6vvVMErgUCAqhIQNy7oOhDwZ7rjzqqRU4PRPwKYSPC2YnmWRM8w9
 Vw7grRFyuM09piKgsLXlpPZNpaZivZPdnEidhvP6C5Ksau4qw2zkkmJjHb+qrBTX/StpiIVth1T
 d3Uj5yfrPP5em/w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 63 +++++++++++++++++----------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 3fe0139f82d16..c078af53b0758 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -642,36 +642,16 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
-int vfe_enable_output_v2(struct vfe_line *line)
+static int vfe_enable_one_output(struct vfe_line *line, struct vfe_output *output)
 {
 	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output[0];
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
-	struct media_pad *sensor_pad;
-	unsigned long flags;
-	unsigned int frame_skip = 0;
 	unsigned int i;
 
-	sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
-	if (sensor_pad) {
-		struct v4l2_subdev *subdev =
-			media_entity_to_v4l2_subdev(sensor_pad->entity);
-
-		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
-		/* Max frame skip is 29 frames */
-		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
-			frame_skip = VFE_FRAME_DROP_VAL - 1;
-	}
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	ops->reg_update_clear(vfe, line->id);
-
 	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev,
 			"Output is not in reserved state %d\n",
 			output->state);
-		spin_unlock_irqrestore(&vfe->output_lock, flags);
 		return -EINVAL;
 	}
 
@@ -683,7 +663,10 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	output->wait_reg_update = 0;
 	reinit_completion(&output->reg_update);
 
-	ops->vfe_wm_start(vfe, output->wm[0].bus_client, line);
+	if (ops->vfe_output_start)
+		ops->vfe_output_start(vfe, output);
+	else
+		ops->vfe_wm_start(vfe, output->wm[0].bus_client, line);
 
 	for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
 		output->buf[i] = vfe_buf_get_pending(output);
@@ -695,9 +678,43 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		ops->reg_update(vfe, line->id);
 	}
 
+	return 0;
+}
+
+int vfe_enable_output_v2(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
+	struct media_pad *sensor_pad;
+	unsigned long flags;
+	unsigned int frame_skip = 0;
+	unsigned int i;
+	int ret;
+
+	sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
+	if (sensor_pad) {
+		struct v4l2_subdev *subdev =
+			media_entity_to_v4l2_subdev(sensor_pad->entity);
+
+		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
+		/* Max frame skip is 29 frames */
+		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
+			frame_skip = VFE_FRAME_DROP_VAL - 1;
+	}
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	ops->reg_update_clear(vfe, line->id);
+
+	for (i = 0; i < line->num_outputs; i++) {
+		ret = vfe_enable_one_output(line, &line->output[i]);
+		if (ret)
+			break;
+	}
+
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
-	return 0;
+	return ret;
 }
 
 /*

-- 
2.55.0

