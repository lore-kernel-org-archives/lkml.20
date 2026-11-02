Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627823;
	b=BuEiHcZNBoXLz4wjjAfu83W7r1oF1BpOTCQ4BlJ4Zw1/cg2Umx0ZWAIReM90r+J9tQQ5
	 0EsiB7gelqvwcWDVsDHR25qGkMqArKIo3PIoKtgPpkEjhFtA6ZTEznHWTAYw1Rxdxa8pd
	 lOTNLMMTfILDu4IdcQPgI9nrbkXZfZwbRuzwnmUdPsTB1MET0udCfB0fh+NNbaLoDE86P
	 VrFWIoPlzde0mVj0gXQWGZGaiUIjIn3s1S7I+K3vgWWKu/wRnU28vGyMM7VfDs2Cp5bVB
	 zFJrrEFmGsGjwTgVXZ/8CQtJpTS5oj8FXfCMvveLkTULUkENBDhZpgZkhl6qtMWLynQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=35TvIgk5LQeEzcO1qBoj4/zaSsKIVhaoQZrYAuyxSeE=;
	b=n5i8Rjoap8hEC3RtG4VGEiCYZJ5aKB7AYRNbwIk064Vb0ezbmXIK4hpQw6uoEX8MPo+N
	 cLbZ0KwLOo36nZWRaehYW3yMPKaKoyzx++7RSeF9lcId7KQmF/G1MoHmt5/xzomcxwxcy
	 DsHocsYrL6KavE6qq7xaSRQkxcNGZvNySx3xrzoHvXRc+nHIQo391m9ZE9GJugu8awhu9
	 yiSxR25qRIl1ekXmGPkZAt5t26baW/Uo894uHf8niOAJJ5wFkTEMNnCqLmXYWFRyfviNF
	 KYwIlKfW2sSGm1owLozkj0Qwj/DjTUC2HId3irPuWbQfJ6iH/Ov6ivp+gy9sv4nwVEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CiybWnHD;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4060A2631
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F4060A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CiybWnHD
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so20043985e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627821; x=1794232621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35TvIgk5LQeEzcO1qBoj4/zaSsKIVhaoQZrYAuyxSeE=;
        b=CiybWnHDFQkoe75XpWZpVjuVMlXNSUJBgrGf95tEXBktDpEuez4oRKWqRRAddRD/Vc
         AqY3vn6NjguW1nx4RCVUvPwYzsBiqk21Xj1SAd4S5JfA2Iq1xDbknHmgtPgZaX53zv35
         FTz1mm4pCvlIFgtF4YycSk0xr38FEuCCbE/YioUkb7VhvruEC2RzlcUSe435uOuKwTss
         bnCQuarewNAtx+BfUN/4ns8KIX/gdYY2NDkCe0xeaCYXn8lLeJcSzhOKrzKg4Y0xW6xz
         Ravwa/SSP1A16A5DdsLjwXgciqSacf8JCfjFvI6ipCYqjoV/GbEU8VSdLiEu9+3PQbSB
         v/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627821; x=1794232621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35TvIgk5LQeEzcO1qBoj4/zaSsKIVhaoQZrYAuyxSeE=;
        b=OcTgF70V2EMMvN1j7CvmjeuWWTQBdvt2L3Av5x2X6wn0i+SUol3T3m8sr50NIeOJmz
         GK1u2sO6CpSMODA7xz/FyL5A3/5g3JqUzIt23wZxyeJhd87XdqOyV0OVV1HBuk+AUh13
         LpHoCEFuA4PAZ3XzMtyF7nn2t+vy4F1+bADK8jtVX80sYqrAeEMf0d47vkdxdfm96SRV
         ry+7X7i0npJ4jlecAd7v1MFZx7CH70hJMoWAw2qyR8n7sPQrd7ctyyaPWxQK2KkPQq/2
         WbZDWPQ89SeKQ7vRFt/tSWVWbpLf+jo9wy/AfoV4x32GJ60JrOenvMn1e85UkfcT6inz
         8i2A==
X-Forwarded-Encrypted: i=1; AKwUvBzBdZORY8WEoCz5WwwMYLlE8nbGU+KAKhrI0TjhW/5OBMNCy57k0u25tvByZu7rfL4mRCYWg0SV0JQGzIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAi3xJOBXgA/UoNsKz1694Gmwec152BuZFYLn8CEdp81319q/i
	K/d31EJo6ahK2QVokxt8fHyxDycA7+kim8vWBvpZjDmICjdFLbKlJAGt06JdLHP/6Mg=
X-Gm-Gg: AYBFou0SxV+mClGE5euFdnAD9J556iGc3YhRjjIJcQiHQQL3P653msIOCufcJbsBTPi
	/hg1vglURIRKmwHb1rCAjGsAdYTlsZ6kxMXPWUdqjqJBOQfn96tRzx6tBwD90tGeUWJd8xImy/+
	hb1n7n76JLddz0IsrPWAkGLicB8ZGUf3FIerXYh+4FCkGvFKm/5qqFkaGDBBNSNKM7fmRpZg5sy
	jOSjF0IfExWP7361YpGlsSu87sfZx7TtvZo223gNqhJs0bfIBkOKBveLhuyHmSrH2HY0wslRl0m
	hYYqPKR/r3W7rEfaDmxDFMwk2i+B0nfvURf+oyh0pQnV+X8FrqwEdl/OYRy25IFasCgdvpEUqCv
	eOEV0dntfvV/eFSduLixkeJWUAGfR2isHssdyvFhQuHSm+Oti8dBJ3ndixxcUYJU5C9Qdx3ljLf
	tAMAkZVwzH6ygBqIgpN9eOCF7pYIU41zBrQYgmFD1tOR6FSlV49sYto492MLBKI1W9ysgVoIw+7
	J2OvVK2aA1Eg+huxncdq+evUeWGqEA+C+MP+lqxaHmlxAzZ/o+4xo/c1e2UWhL9Ihuc+rZ9D2hL
	P9kFDbPXRQxSn5FwqA==
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr227508685e9.17.1793627821098;
        Mon, 02 Nov 2026 05:57:01 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:00 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:49 +0000
Subject: [PATCH v2 3/9] media: qcom: camss: Use SOF sequence tracking for
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
Message-Id: <20261102-v4l2-frame-sync-v2-3-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4680; i=bod@kernel.org;
 h=from:subject:message-id; bh=bufVP28tKn3rZTY/gAilL+mmCSo1VexolPFYOZDSE6E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JalPo3tzd6P7pCVbvU92X2ft5op9kKzglOQj
 Wd/xnh00HaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpQAKCRAicTuzoY3I
 OjLvD/9JPG4584a3LT7W+VeC/2TRjimq2JmuY6Xc/1lWKS068cit36iRPuVhOvXlsQimo3darEq
 ogOpIRcGBWGKDYtXscxqVbTNpmLfW1qJfVSbrkAJsdpKke5XJ1s6VfdITP13J/fYiq09MJ7WGTW
 cdKjazMfSP5qAnk4Dr+/gNCF+kCrGgOeXMIM9jjl7WaCQTDpgogldBdLwmjaAcPw2ztcunvUB1f
 w5vWkRvpvbX1KSPUVnKOrQcKUMA+IqFPAlnpgPR+HP8mxWcsVRMuFjkJgQyeF4N1850plFXWdpR
 6iTnisk78JMxj6o4kG7a3L3uyUe1Bme6uN1snj1/p/tcBg7vlJMG24jxPdLksbJQV95TQGJHOE0
 VmCWwfP5TPv/dZW5ciRN/UlgtEaB5/CqMZnC7OW1x993Dt7rNvbGo9ym79Z4Br7KmWOdWQhV519
 7RYHkN+3PMpLwSB5VrEbagbhNmTGAynkXcxs9Zp/cF48jUyqaSsjQ+KP8ENcx1Q2NEWo6Cjesjn
 acQUZ01Xs5a3a85QQcXLGsINa+jDtxf2o1j52j9c8gaiOOZoPyRUNRMfRLtE3250eeAmpdFTKcG
 mNp5tCBEGkh3vCt0z2vv6mvMf99mcAVz9xI0SJHV3UnOY4l4Z//S/eHI4T7kL+suLlHbDJugJBh
 T3JI8Lwa097nMTA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

We want to correlate statistics buffers with data-buffers. To do that we
will need to have a sequence number driven by the SOF signal.

Rather than incrementing vb.sequence when data arrives, we should increment
when SOF happens.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c    | 14 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h    |  9 +++++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c |  5 ++++-
 drivers/media/platform/qcom/camss/camss-vfe.c     |  9 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h     |  1 +
 5 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index e9b399fcb9c7a..4f4ed4fa46aac 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1355,6 +1355,20 @@ static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
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
index 2e48b08b93592..f3199579e3442 100644
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

