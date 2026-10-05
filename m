Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482A25326A1;
	Mon,  5 Oct 2026 17:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220773; cv=none; b=SGqOzP6kzjpbSVjOtc9poyf+S6s/Sqjtz9uD5n8VHb2x+ZDSthGRcDUlYuVw57mTaHy6dvZViCyvpt1VjpLN0uBg24j9qXlopDIuam4i4Jj2xdT3IoplXYsGbY9iPBDXOtQg4acYADG6bUaQL4dV8eNDZo4Pc0bwxCKyItte6x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220773; c=relaxed/simple;
	bh=rMrcWqigr//5GxBoOZNdAyKkTYZZPJ79QLy44EWWQbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QBvNlqmktQWbn5zcoTBrNNH9X7Pt8Y7h9AVY08sLgoO32RDht7O43fA5hKZMN59yeMsZAJHInEx7hnlMgSQ6EVVcKN83txD54lmV+Vn/ZrKgHIVO/vNfMghEJ4l9EdJPW7a0bnj9WtHsulnhjo85hBP/hNfFGvCw9dJPKFGolaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moC+waeS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moC+waeS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248DA1F0089B;
	Mon,  5 Oct 2026 17:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220772;
	bh=U6xids41mo7tlCLqN29b91Tl3Fdc8rp6haXCDpWa7kM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=moC+waeSsME/i4fO51EkMXsCv4IW0Cufitd/A8Ah71uhDsg8BU9cpR7rbUbLpv4M9
	 G2h/gUtWPGPEb+JZvZw0I81+94tDSUCBiigtcn6FZ480cv3DlZH8/gXIAWvcG/8YBm
	 vauH3VbNlKME0c/R5hDZPO659tKKmgofpyK5JOJu/Cq9HlvfVOl1I3W+va/gskheB0
	 2LVAstoJ8BbQPCSi990UMJF9l9lf9z7h+vIwI4gwVKEQq1IokL23B9SHiHjswJ2PD8
	 xxTCRlmBESIrKa0Rhc6xSJpd7qR9kneHj6kzWRVFpas2+Re7be3O+/iEvE9trOeuer
	 9sQP4tKzOoPwQ==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:35 +0200
Subject: [PATCH 65/74] media: qcom: camss: vfe: Complete pixel line outputs
 on their own completion group
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-65-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4752; i=bod@kernel.org;
 h=from:subject:message-id; bh=Q7fx0+NaUnmKkah1gWGq3GdOsLV5NQMGx+5mQc6mV08=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9svOvA02gnskaaIqQq6Ht2GMtps4GRpiTwZL
 vIrNPRqTh6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbLwAKCRAicTuzoY3I
 OlyUD/wOPcSt+9BZjRkcjBUgSM3Ctn9KddnX1CAmPiU1AqWdihK/DBD1DVTB12PAcx7Tyz8JuQ9
 16GKN26LF2M1+PGHZPYz+ieOWn0utI4X5l92eM7z5BKRRUjdmM8Wjxj+GfJ8CIqbjj+EIHJBTDA
 0e3x8ohiDOtgu77Q3vL7Pr0bul3saZJQIIkrcAy1xnd0fKe/0PH4R0OWuYNROLzgNNr8cs9wAVM
 RYAaBBsHQkZdjLtzgNA6mz0DKgKrR6UOpol+j8LxjUKk1Imx/+Pdxob4lAdONBfzi37c36mVNOV
 C1frTJI7gQ2k6KXKXpS/jiyzB6YAyUX+9xO/PK8i1qbWy83JBxaA2S9BTnPF0rvCoDwoS0PWzBp
 YGzffJKvUSFT10RLdSR8eXybuV22aFkapHLfSNtXQkDadPr0A04D417PBDqq41gdRFrqRLIm8d8
 /TvSYHaUEWyDtlEJL81O/tz7XmLxoey96kxMIupVHh55D2tv7KDIDDxkDf4lJfub1EmE9rLgoD9
 DOZdlYTndE45ESXIvJv3+/a0ZWPrRqa/cv8/OwEvwBwrOX+x+T4wC97O/fUNAcpyEe32ArJITCL
 bl6UY/+lagIgztwoaEOy23AsqgB4YTnin/21V9/9S3iLQkvEVUUNGB201vC5smnt4vYfq7Y+Gwi
 dy+nOYUspABU8ww==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

vfe_buf_done() always completes the first output of the line. The
outputs of a pixel line complete on their own completion groups: the
image on one, statistics on another. Completing the image on any group
retires it early once a second output runs.

Split the per-output retirement into vfe_output_done() and, when the
completion carries per-group status, retire each running output whose
group fired. RDI lines, and completions without per-group status such as
the TFE's, keep completing the first output.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 89 +++++++++++++++++++++------
 1 file changed, 69 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 12d94bdf13bc8..b90b538c1aaaf 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -623,30 +623,35 @@ u32 vfe_hw_version(struct vfe_device *vfe)
  * @vfe: VFE Device
  * @wm: Write master id
  */
-void vfe_buf_done(struct vfe_device *vfe, int wm, struct camss_buf_done_info *buf_done_info)
+/*
+ * vfe_output_done - Retire the filled buffer of one output
+ * @vfe: VFE device
+ * @line: VFE line
+ * @output: VFE output whose write masters completed a frame
+ * @ts: completion timestamp
+ *
+ * Called with output_lock held. Hands the next pending buffer to the write
+ * masters.
+ *
+ * Return the filled buffer for the caller to complete once the lock is
+ * dropped, or NULL if none was queued
+ */
+static struct camss_buffer *vfe_output_done(struct vfe_device *vfe,
+					    struct vfe_line *line,
+					    struct vfe_output *output, u64 ts)
 {
-	struct vfe_line *line = &vfe->line[vfe->wm_output_map[wm]];
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
 	struct camss_buffer *ready_buf;
-	struct vfe_output *output;
-	unsigned long flags;
 	u32 index;
-	u64 ts = ktime_get_ns();
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	if (vfe->wm_output_map[wm] == VFE_LINE_NONE) {
-		dev_err_ratelimited(vfe->camss->dev,
-				    "Received wm done for unmapped index\n");
-		goto out_unlock;
-	}
-	output = &vfe->line[vfe->wm_output_map[wm]].output[0];
 
 	ready_buf = output->buf[0];
 	if (!ready_buf) {
-		dev_err_ratelimited(vfe->camss->dev,
-				    "Missing ready buf %d!\n", output->state);
-		goto out_unlock;
+		/* only the first output must keep up; the others may starve */
+		if (output == &line->output[0])
+			dev_err_ratelimited(vfe->camss->dev,
+					    "Missing ready buf %d!\n",
+					    output->state);
+		return NULL;
 	}
 
 	ready_buf->vb.vb2_buf.timestamp = ts;
@@ -671,14 +676,58 @@ void vfe_buf_done(struct vfe_device *vfe, int wm, struct camss_buf_done_info *bu
 		output->gen2.active_num--;
 	}
 
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
+	return ready_buf;
+}
 
-	vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+/*
+ * vfe_buf_done - Complete the outputs whose completion groups fired
+ * @vfe: VFE device
+ * @wm: port the completion arrived on
+ * @buf_done_info: completion status, one bit per completion group
+ *
+ * An RDI line has one output. The outputs of a pixel line each complete on
+ * their own group, the image on one and statistics on another, when the
+ * completion carries per-group status.
+ */
+void vfe_buf_done(struct vfe_device *vfe, int wm, struct camss_buf_done_info *buf_done_info)
+{
+	struct camss_buffer *ready[MSM_VFE_NUM_OUTPUTS] = { };
+	struct vfe_line *line;
+	unsigned long flags;
+	unsigned int o;
+	u64 ts = ktime_get_ns();
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	if (vfe->wm_output_map[wm] == VFE_LINE_NONE) {
+		dev_err_ratelimited(vfe->camss->dev,
+				    "Received wm done for unmapped index\n");
+		goto out_unlock;
+	}
+	line = &vfe->line[vfe->wm_output_map[wm]];
 
-	return;
+	/* Without per-group status (RDI lines, TFE) there is a single output */
+	if (!line->is_pix || !buf_done_info || !buf_done_info->status) {
+		ready[0] = vfe_output_done(vfe, line, &line->output[0], ts);
+	} else {
+		for (o = 0; o < line->num_outputs; o++) {
+			struct vfe_output *output = &line->output[o];
+
+			if (output->state != VFE_OUTPUT_ON || !output->wm_num ||
+			    !(buf_done_info->status & BIT(output->comp_group)))
+				continue;
+
+			ready[o] = vfe_output_done(vfe, line, output, ts);
+		}
+	}
 
 out_unlock:
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	for (o = 0; o < MSM_VFE_NUM_OUTPUTS; o++)
+		if (ready[o])
+			vb2_buffer_done(&ready[o]->vb.vb2_buf,
+					VB2_BUF_STATE_DONE);
 }
 
 /*

-- 
2.55.0

