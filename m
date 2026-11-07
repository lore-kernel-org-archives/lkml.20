Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013320;
	b=gJ3sUXafWWxXS1D3R/C9GtlaTI1PqNC8vCsDVQQsBu5z4ULbXpEFTtVgHow6ZAokspgn
	 dn8eNNkT4eWXnIl8zXefTusBf6dZps2PfYmGjaXdWlPkgQwke5Vo3W8rJNxshfphVfjvf
	 zJK4/gtS6+9fdW+63r2TcmndZkHyp6T3aUpqPlsK9ACTNjHAp9f8ESToFeiVkHkYCJ5MD
	 x9zabdU3w7JrZAqXa58CXWyX2dSvGJhfjAP8XSjtdMA6AQenrW8f0hc3zwtIYzLgfjzU9
	 gOEsrUGUydyrrojEAZZ3XQCtHnXiItc/qN/zWEPYMlHHxFzGcTPP4tRsBbbqECpmRYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pLrJ5gOP6rxYIUYYRq44GlqBmOdL3nMZ2eWc5poqwpo=;
	b=kcztpz1g/te7zxVp6HHjCyF33LHYBOI2waPl4ZqqozwGW616EQG4jkbsh8wNmGr/FWM2
	 TpMPAMuTjYvuxbmKjzdjZZWLR8jL8y5Rk8x6+nHLT66t7Ew02IoPYZxLc9Z6N6i3QJVZ3
	 BjhwSGfT5zOaUrjh+Y8MGC8KiqA0twb2CyTEZee2JMvca+l3HJqLrTgSFw8vmPNiLtdyF
	 dls+dz3jJdyYDaSf2HX3DgG4h66dOdJZ5iEzBh39Y6LpdTdyvBtpt4TFO5y4XqpII2Ruc
	 Sy8VguAX8Q5nxBBYESzsXJ7InBjVKXNxozJD8KNOuWS/5tPsQeht8dHE+uIN+riV/Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="scQC0/Z3";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA900606D809
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA900606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=scQC0/Z3
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8488265e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013318; x=1794618118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLrJ5gOP6rxYIUYYRq44GlqBmOdL3nMZ2eWc5poqwpo=;
        b=scQC0/Z3N2Eu1D4Wq9LqZbo9ZP3C9hOJmtnL/9thIMgxwF1EeMT4jJY5Ig3F+rcXSk
         /o5usjB/wiJkV0eon3j1ufnb1riextdUjm2d9uh7nNmfVghVVh0xkPUybEQInBXCURoO
         2bo+u3jVtVrxsQcc2k3tczOT7p7cRFI6TqjBfsQx5l438kj1OfJFxeb033FCheflol7x
         T9iRwtYt9zXgxg2tyKkgDFb27IFcuCEmZ4HSRJtvvEIMJPBjGrT7WSZ2EX8gPXpLCTMq
         97h01UsjzcdGYTVsTNdtd4v+ySQeRa3pQzEAewDrOxsLJO+2SKUrIIDMSPR3BLX7h36L
         qlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013318; x=1794618118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLrJ5gOP6rxYIUYYRq44GlqBmOdL3nMZ2eWc5poqwpo=;
        b=ahqHpHCisxC4Is8VKwiWPd6wCEFrPFRxQybpgIvwN2B06oF69hSM5mYOafeuwnoeGi
         NPXLMQcVdYN75ErQLb+UsKjvN5FRmrDua1jw0p1E7IY7VPxxzT+e456NWju6aALyPHA1
         PgIdl3VvRGXoLTjXvmc42JhwQEyFLxhNFPbzhA3N1fbnOmM2tex/jNHawzjt9ViTQ1Tm
         s3eH+94z2BufJGYxcT0c7VdUqJfugkyewZ/chjxBTMa45FWNN0EPytneHZTTFlgGmGpD
         tGqQBaVX0bOmawsKQi6yJIaDvrIwrbmfc+6K7izPjAl/sDNo73LnYMMDymxEpfDr9/JE
         UJNQ==
X-Forwarded-Encrypted: i=1; AKwUvBz18Go08wZPvCY6dRNuBhXUvkZp6kv8BBgp4/pM0vER079umhOVaoiIwEv/G4LJyf8ZKQ2KXDjfQJKQw4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UxENHkT4/dixoXRyMGrLXsmYLqYlomaAArmau/o9NXDLFTKC8
	3wUsJZsgytUi/PrVv5KQZFMbqEpoFfHtvnfihRYR5BH6+AQvaoYYI/Q3yRjkpsvpLso=
X-Gm-Gg: AYBFou0EFXj/8r3I1Hs16j388lNuoQd3AQQxLOj8zGTskbMa65rpZlO3+rbT02uoM3E
	R8gv+A2QfPTWdTST/ldP/gqHHg7NSBnSQ0kPBKO9eGJNzZ0W+0OgTpnMnsts+QuWnKmGSLzH+jl
	BlGCGQZnXlh2Zx+mWj3+vYLVrby6bJPQtAteILs5/NCUbKvAKh0hl7uePxl+kiDPj9ormNSWCpv
	QSBQvDqSmRi6nCeOyyMBZUciFHxcHdd0IOAJ+HrluErAGMorwY5z5L5DMzzhUeBgGIWR+OKubUC
	IHFSwg/fpWIZUYaKYiz+lD4aHfctg37QSuddxh6BkxqR0DL/ApU4NW/lgYGEqtLjDtIAgTCx2WU
	BZfLd7rJRqskN3r+ZTTDuaVmTlbQZTGMV2O5b+B4S27ve/9O0Su9EX7TC0pgTDXfr1TCUoSRcRQ
	Dfvk6Wabj1FCmirwioUlItvPLAqd/0HKZxkLpDX0tHRsqTVMNbjC1wUJ+rPlJovxfW+3n8rbPK0
	8jomvQih8WezDm5YxgyUMjSB0jAHQ4K+P4StXvyCJTuDjCRztjCefKR0YGOTGGkYc6JE/JXMrXM
	oJpp/Vycl+CDQAc9sR3pLZY=
X-Received: by 2002:a05:600c:4f81:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4b6de69168emr59878395e9.20.1794013318246;
        Fri, 06 Nov 2026 17:01:58 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:01:57 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:46 +0000
Subject: [PATCH v3 03/11] media: qcom: camss: Use SOF sequence tracking for
 vb.sequence
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-v4l2-frame-sync-v3-3-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4789; i=bod@kernel.org;
 h=from:subject:message-id; bh=JGr52XC0KJpTg82YxpqeHAQ9Fu52VhhcuMjoPOZQCxM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh9dZbd3fPRuoeFHpwgEKfWl3byocYO+8I29
 tJCA3el7/SJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fQAKCRAicTuzoY3I
 Ohs8D/4+q257p9dVJwSht9VbwKjtdYjE9JKw63jfTm47W+x5Qku4mYeJLCmjt6QK0dtgS2wDpar
 zxG+nLQws10qL8pcqDtrohM05HSplFpiZkkNLeSDQKqViFf3xf3xtTbZv9Fp+LJuDLa4jxqy/33
 j5vulkwssoebFX/031QCHgCq8CkFvRGZ+VgfniEhgKkmn6DU1BjZOWbliQs72Gk+Ug2hbF50+Qw
 wcnvyVRhX/UkUlFa7Y6XxdAYN0BTFtiebqbsyAB/w0481JgFbRXkWfaDcKzlWrBM7uK3N8+7pr+
 c42c9f/mif5vxHH/8QNAeFs1o2nNm1wcT9Cb9B75Fs0DciH/ZxD+L1JbaxpKI//ll2uOGavzL0b
 aqJSMawIfpcbJxme+MiYDoL/S8jZfSFsz4k3sS1p6otgu1CcyQyuf+YCp8eySIFO1L4qXBZ2a07
 bQcnikRgmrUixpjbRkA7X5Cwnscs+g8r6obm4D+45XNAZdkjlDghSiS9NheccL0JTnNqm7zzeCR
 VSySrbZGrLlU9SJQex12BN9BF5WMPUNKmLREzZAN0spiKchOvt1CI+MauCEaLf3wPvEHvEaK34f
 1jCpB5CUrxk4qXUdv/leI9r2sY/tiyYXnX4FWo/xs82CrxNzh4aHwA9IBDQ/c0X+KwAoLcWEyY1
 PyXfFGjsyBDVZLA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

We want to correlate statistics buffers with data-buffers. To do that we
will need to have a sequence number driven by the SOF signal.

Rather than incrementing vb.sequence when data arrives, we should increment
when SOF happens.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c    | 14 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h    |  9 +++++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c |  5 ++++-
 drivers/media/platform/qcom/camss/camss-vfe.c     |  9 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h     |  1 +
 5 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 7f33fb81ca8cc..588122beec854 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1356,6 +1356,20 @@ static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
 }
 
+atomic_t *csid_get_sof_seq(struct media_pad *pad)
+{
+	struct csid_device *csid;
+
+	if (!pad || pad->index < MSM_CSID_PAD_FIRST_SRC)
+		return NULL;
+
+	csid = v4l2_get_subdevdata(media_entity_to_v4l2_subdev(pad->entity));
+	if (!csid->res->frame_sync_en)
+		return NULL;
+
+	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
+}
+
 void csid_sof_event(struct csid_device *csid, unsigned int id)
 {
 	struct v4l2_event event = {
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index a9d88909d37fc..8edb258b0ae58 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -260,4 +260,13 @@ u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
  */
 void csid_sof_event(struct csid_device *csid, unsigned int id);
 
+/*
+ * csid_get_sof_seq - Get a pointer to the SOF frame sequence variable.
+ * @pad: Remote pad of a consumer's sink pad
+ *
+ * Return the counter or NULL if @pad isn't a CSID or the CSID doesn't support
+ * SOF tracking.
+ */
+atomic_t *csid_get_sof_seq(struct media_pad *pad);
+
 #endif /* QC_MSM_CAMSS_CSID_H */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 62c2405359a06..4972d3ab65078 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -491,7 +491,10 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	}
 
 	ready_buf->vb.vb2_buf.timestamp = ts;
-	ready_buf->vb.sequence = output->sequence++;
+	if (line->sof_seq)
+		ready_buf->vb.sequence = atomic_read(line->sof_seq);
+	else
+		ready_buf->vb.sequence = output->sequence++;
 
 	index = 0;
 	output->buf[0] = output->buf[1];
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765f..da373024c847e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -474,7 +474,10 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	}
 
 	ready_buf->vb.vb2_buf.timestamp = ts;
-	ready_buf->vb.sequence = output->sequence++;
+	if (line->sof_seq)
+		ready_buf->vb.sequence = atomic_read(line->sof_seq);
+	else
+		ready_buf->vb.sequence = output->sequence++;
 
 	index = 0;
 	output->buf[0] = output->buf[1];
@@ -508,6 +511,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	struct vfe_output *output = &line->output;
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
 	struct media_pad *sensor_pad;
+	struct media_pad *csid_pad;
 	unsigned long flags;
 	unsigned int frame_skip = 0;
 	unsigned int i;
@@ -523,6 +527,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
 			frame_skip = VFE_FRAME_DROP_VAL - 1;
 	}
 
+	csid_pad = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
+	line->sof_seq = csid_get_sof_seq(csid_pad);
+
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	ops->reg_update_clear(vfe, line->id);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a378..0e2dfa58421ad 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -94,6 +94,7 @@ struct vfe_line {
 	struct vfe_output output;
 	const struct camss_format_info *formats;
 	unsigned int nformats;
+	atomic_t *sof_seq;
 };
 
 struct vfe_device;

-- 
2.56.0

