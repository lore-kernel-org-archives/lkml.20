Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2512A53161E;
	Mon,  5 Oct 2026 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220763; cv=none; b=mx7NWfD11NT25nQSRY8UQ5BfqUNpu8iwWJfOvCqD0EHoxButNx/XOwCQo+KhvV4FWqAXqlA96eRxU5tBJKHu7SK+XXbpw4qDEmOj3QGYzTSlYN3WjdD5Kp4CVu8wzibS0AMpk/G7gns7Xh1XRjGxRisOcjhpg2I2o70MnCiOzAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220763; c=relaxed/simple;
	bh=MbTv8CwwtatMbXtbEx8p2gPzgyjCoeO95HqemonCVRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1JKTkRDGorU2sPykBnkp29Maoo8+RRdwuhm5YwtykIxGDA73lsVub9jYfLaJ/5mznn3JedP+71il5Y9I8/a4Z2xmPvKOltlKyzyHTxfaJgSEfdMKg4W8jLhoqmQX9cLyevjMrPy8OU2nOmlWWG4OueuJer9MyDMnY3a9+pNHrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VB/1Zc0+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VB/1Zc0+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A618C1F000FF;
	Mon,  5 Oct 2026 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220761;
	bh=hMUHDkIPWMaSrXnKx1VLX7Ewld9IlsxMtWyFjXqQCEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VB/1Zc0+k/aTJ+36L85MB9P93OK3zui0+RjxAjp/z0gxL1HQ6JmH+k+8+Xjyc0jB8
	 tdIGTlpAGyM8VirmmtRud9ecEAykqdCA53V0cm6ETbSRUoKEdZaOIDqmG4T/paWhTr
	 fTh/PmB9KEx7qqGrIwoSgqiAFzLK3KLjHEmj+/eM+j9Vl/G8XoMfTCiKsu80c11owE
	 H5G+Sd0gv3ffuWqccmAO3Kw8pP9fAiXxUvn9Bu42tbv+z6PZrbp/NWQPReO43pDehz
	 MO3vl8pSzT8jzLwppvwTO2DWDMZYzs3EKeZovDjG5hFY/FdEtmkhYSS6dSC+4ASOeR
	 UBErfhyRiTN1Q==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:32 +0200
Subject: [PATCH 62/74] media: qcom: camss: vfe: Size the outputs for the
 PIX line and set up each one
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-62-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6113; i=bod@kernel.org;
 h=from:subject:message-id; bh=5H8xbTzWv7RkQ61ZC5AxP9xcMI+WCKKX170ssF6BhuQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9stlOTnsz71KEr0L98/yNcRzJOuHG/6PLfeY
 hAmQWC+E7qJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbLQAKCRAicTuzoY3I
 OiM2EACPm7DDQPxTpVR/c72hYRB5nl/pJnQPJVLRIa2qVoL0k5KVjA/6t0pPENlKci7rWqghSt+
 FQbggNr3cnRFHI0htmciEuxnamDHjs8tbaE17IKEkhh16zxtmnqS/0gtYo0ky6Z1yuJ2rCN0irH
 nGEWoexEWpmh6RsEulbSso48J1LK3AnBjaY4ABS+AO3rHZJJVfBVYtcn0rcZ570+cVNClRYXYyn
 Ir/k/1NaCSXbK8M/oqjt/iK+j1QkQVMMGuuQYMPpsHBH9uHRr8kMQXDQ+KsyZHL+GEXZd+neNfk
 xen04b4hU+tDEqKmHGp5FMSk8+Pe8HJjtVTuVyJ5vur1Pl0p/DZlUxrdSOS+WDpjDhFYob0W5h3
 nLwxX5euoj0gs8tegjWEFnHj0xjYYLYUQdcauRM7OwZVNvWZs/qmESveN1YjfKzXmDFlploKKeL
 bhGPuIqToF+hwlMomOngJ/dTQcR7/RNX2ldcia7CZng92Zn0dCWZU7zz9vi0n58EIp2z3+anWJz
 0mKvWPhWcs7QaE16VNmvrIO/xWtTcYinwnHotldUdJbOj/fff1Fq6i/6BUKt+U/pfCssZpgpdF3
 EC+IISoAgcKCD+BkTBcT/SG+3QzZnrFTkYnx4eks7USr7E8J7hbmAET094ikIz5zLpaMYojzP1T
 YsFS+Iv+zCSjlXQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The PIX line is described with five outputs, one per source or sink pad
beyond the sink, but struct vfe_line holds MSM_VFE_NUM_OUTPUTS = 1. The
descriptor writes and the enable loop for outputs 1-4 land past the end
of the line.

- size output[] for every pad but the sink
- record the pad each output serves, as vfe_add_output() was passed it
- initialise every output: back pointer, completions, pending list
- start secondary outputs only while their video node streams and they
  have write masters; the first output still starts the line
- stop and release every output that ran

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 70 +++++++++++++++++++--------
 drivers/media/platform/qcom/camss/camss-vfe.h |  3 +-
 2 files changed, 52 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 588a355b67ff0..8bcacede0f969 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -679,6 +679,18 @@ void vfe_buf_done(struct vfe_device *vfe, int wm, struct camss_buf_done_info *bu
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
+/*
+ * The first output starts the line. The others run only while their video
+ * node is streaming, and only if they write to memory.
+ */
+static bool vfe_output_wanted(struct vfe_line *line, struct vfe_output *output)
+{
+	if (output == &line->output[0])
+		return true;
+
+	return output->wm_num && vb2_is_streaming(&output->video_out.vb2_q);
+}
+
 static int vfe_enable_one_output(struct vfe_line *line, struct vfe_output *output)
 {
 	struct vfe_device *vfe = to_vfe(line);
@@ -747,6 +759,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	ops->reg_update_clear(vfe, line->id);
 
 	for (i = 0; i < line->num_outputs; i++) {
+		if (!vfe_output_wanted(line, &line->output[i]))
+			continue;
+
 		ret = vfe_enable_one_output(line, &line->output[i]);
 		if (ret)
 			break;
@@ -900,15 +915,17 @@ int vfe_reset(struct vfe_device *vfe)
 
 static void vfe_init_outputs(struct vfe_device *vfe)
 {
-	int i;
+	int i, o;
 
 	for (i = 0; i < vfe->res->line_num; i++) {
-		struct vfe_output *output = &vfe->line[i].output[0];
+		for (o = 0; o < MSM_VFE_NUM_OUTPUTS; o++) {
+			struct vfe_output *output = &vfe->line[i].output[o];
 
-		output->state = VFE_OUTPUT_OFF;
-		output->buf[0] = NULL;
-		output->buf[1] = NULL;
-		INIT_LIST_HEAD(&output->pending_bufs);
+			output->state = VFE_OUTPUT_OFF;
+			output->buf[0] = NULL;
+			output->buf[1] = NULL;
+			INIT_LIST_HEAD(&output->pending_bufs);
+		}
 	}
 }
 
@@ -996,7 +1013,8 @@ int vfe_put_output(struct vfe_line *line)
 	for (i = 0; i < output->wm_num; i++)
 		vfe_release_wm(vfe, output->wm[i].bus_client);
 
-	output->state = VFE_OUTPUT_OFF;
+	for (i = 0; i < line->num_outputs; i++)
+		line->output[i].state = VFE_OUTPUT_OFF;
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 	return 0;
@@ -1006,17 +1024,24 @@ static int vfe_disable_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
-	struct vfe_output *output = &line->output[0];
 	unsigned long flags;
-	unsigned int i;
+	unsigned int i, o;
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
-	if (ops->vfe_output_stop)
-		ops->vfe_output_stop(vfe, output);
-	else
-		for (i = 0; i < output->wm_num; i++)
-			ops->vfe_wm_stop(vfe, output->wm[i].bus_client, line);
-	output->gen2.active_num = 0;
+	for (o = 0; o < line->num_outputs; o++) {
+		struct vfe_output *output = &line->output[o];
+
+		/* the first output is always on; the others only if they streamed */
+		if (o && output->state != VFE_OUTPUT_ON)
+			continue;
+
+		if (ops->vfe_output_stop)
+			ops->vfe_output_stop(vfe, output);
+		else
+			for (i = 0; i < output->wm_num; i++)
+				ops->vfe_wm_stop(vfe, output->wm[i].bus_client, line);
+		output->gen2.active_num = 0;
+	}
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
 	return vfe_reset(vfe);
@@ -2175,22 +2200,26 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 
 	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
 		struct vfe_line *l = &vfe->line[i];
+		unsigned int o;
+
+		for (o = 0; o < MSM_VFE_NUM_OUTPUTS; o++) {
+			l->output[o].line = l;
+			l->output[o].video_out.camss = camss;
+			init_completion(&l->output[o].sof);
+			init_completion(&l->output[o].reg_update);
+		}
 
 		l->output[0].video_out.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-		l->output[0].video_out.camss = camss;
 		l->id = i;
 
 		l->num_outputs = 1;
-		l->output[0].line = l;
+		l->output[0].pad = MSM_VFE_PAD_SRC;
 
 		l->output[0].wm_num = 1;
 		l->output[0].wm[0].bus_client = l->id;
 
 		l->num_pads = MSM_VFE_PAD_NUM_RDI;
 
-		init_completion(&l->output[0].sof);
-		init_completion(&l->output[0].reg_update);
-
 
 	}
 
@@ -2500,6 +2529,7 @@ void vfe_add_output(struct vfe_output *output, u8 pad, u8 comp_group,
 {
 	unsigned int i;
 
+	output->pad = pad;
 	output->comp_group = comp_group;
 	output->wm_num = wm_num;
 	for (i = 0; i < wm_num; i++) {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 2b354d6bcc1f5..11cded2b345eb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -28,7 +28,7 @@
 #define MSM_VFE_PAD_NUM_RDI 2
 #define MSM_VFE_PAD_NUM_PIX 6
 #define MSM_VFE_MAX_PADS MSM_VFE_PAD_NUM_PIX
-#define MSM_VFE_NUM_OUTPUTS 1
+#define MSM_VFE_NUM_OUTPUTS (MSM_VFE_MAX_PADS - 1)	/* every pad but the sink */
 
 #define MSM_VFE_IMAGE_MASTERS_NUM 7
 #define MSM_VFE_COMPOSITE_IRQ_NUM 4
@@ -114,6 +114,7 @@ struct vfe_wm {
 #define VFE_MAX_WM_PER_OUTPUT 3
 
 struct vfe_output {
+	u8 pad;			/* index into line->pads[] this output serves */
 	u8 comp_group;
 	u8 wm_num;
 	struct vfe_wm wm[VFE_MAX_WM_PER_OUTPUT];

-- 
2.55.0

