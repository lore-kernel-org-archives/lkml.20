Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F843A4F50
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881102; cv=none; b=K+xSrYGbXxMmOdDEd8r5uhX3t6G7K/HV/7DDLiofTkqdaYDPlYOgvvVeRMe/NxwG56TsUBI98pzaumkdM6W6Hb1ZtKlvDZ8B9Dd+Ci12yQ5zvN29QCUzXzrpFzFSenEFKX4IfFBvrc2PrdjtiCqH1ghKo+dgXRWZQfLdnA6OPzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881102; c=relaxed/simple;
	bh=Pd6u8RLrHaXG1wona1q5ggIAT5aAmSJZtCjssa6Afbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3lFVxqVUQ3N2IwZdIFg/mZnazJRtAzHQCZLm5kSGPAb5tQLZF0A7dkuaKRSjhIz+DFBKm82bRcSJj6/TM/16Kc0zs/0grfQUm2adR1255Ye3JRfgaVsu0UCDq4kVc0zaMffWCSQBrxorL8/YEeooXG4zvCDQIuoOHzV+bZXQdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=hBGXWWA0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="hBGXWWA0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso24244375e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791881099; x=1792485899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsUeqRZhMwJScR6MzwSIxb67P9N3NsdpFvhaG5rq8Bw=;
        b=hBGXWWA0X9VVPk9ov6D0o/AofVynfEcvZ6D72zZFx3raLqpfer0iUwc3gvkaShDthP
         KognFRWAMADv9GVtzlCaXI6n3UaaFZkv/tkQAHxKAQTchcs7IiKfzesG7i1ESEE6jkNE
         s2g1WGNZYOtr+O0PKITDjoFsD7HTlk6FMC41t//f4wCCHJjredDhjZ3eL3svkouSulec
         SLibZhR8EwyUnbeaid5bMpgZmeVnshGNP48kYqDEKfD/UIePj8ycEpxqxiPbkEf6UZDD
         0/h9WFWKyMN6I9xvVAhVdWTg7VRB/uVKqpgrfnXBGP3uj7mvi3mabKGwY+0Q5to7UpnM
         5CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881099; x=1792485899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsUeqRZhMwJScR6MzwSIxb67P9N3NsdpFvhaG5rq8Bw=;
        b=jxjkXaezEFyxqmNsOXtFgneDmcH68YyiaFlpBBlBBP/D63ew/qhS5XALsALU+YfjpN
         G2fEawJGBHaI+Pj2Z8t1TRMS/fBxJE5tbFvCmKZYo7l7hjKVupaaPLmzDQRw8isHKMeU
         /9iZONaW/QUb4TA2Q4LxljakvBTRMJ9pYKr7k8CefmNNLA7DtlDeoeIouez9+lOOxij2
         1bKpcwdnYSDbMs2bEHkylU1k6P3JyqjKV14Dge4pI7XV7TLOL8QwEpDMqwldaO6hFWgm
         /IuA0DVYvoAmTF3PshBAS1Z5VsQXSCeOGo2Gi74MwkElwE1OH6y4j+KGUtKizawqvywZ
         KijA==
X-Forwarded-Encrypted: i=1; AKwUvByazlmCVDi+LG1+cJ1RTl/totW8943SgF0GBX0GTk9NmrcPgW2Tx5si/ktAigRaHnSGbvbk0tD/826gU+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAcgBQclxGZfYb6p1iKuMjlj3GeRBtV+T5UE/f/xGmJ3KBAcD9
	dlLo/1RmMuPDVjfxYqwpLWwjSOyQgFo17rMuBP2pK0Gm6OwUiwLBekp1kr6sXhwmnfM=
X-Gm-Gg: AYBFou32Es6dwIjeHwSzRM+ONdgMCWgG5xZY0zjWzlsx4RuhenClEvc0d5QeSJeXsKS
	E9ZVJ+XGHSYNL0uvlB65Rd6+qlVmagsJbLb7deQoNUuMvWvheHYVrIBmcEjIRuLfTdm+kG4UHqq
	7yu3nW/uVhRGJZIm5JG8kpjw/Jg0rRwcWyEnL5VFequCbqEY4Q53QlyW4Wd5jpBUxdMB9a6+1Oa
	MkGqbG7Up6PiMIHGIg7DpsFkXdxnXcGF2uDqkZ2n9VLRZsTEJgUA8FJhbNFZ9LmeKC0NhmRiUV/
	LLxDYxBCVnChFh8LRoAerk3pRRk8dr/WN4Qm4/9VxfTfWqoYGqiOJ+w9+Ye1JahYRvkDnawEiUN
	xj6UjAwV4aiTd5i7USr4bGSFEc/d+TuV5QhyMUgnb6zZsmOIT//Wfoj6CafxwKQElg+Bvvt6ex7
	iAqIfTmENKBKU4EGsBeYTd54iEUntV5NuZ7eK8djV+IhpwtRM/In2dysqCAkyB4CSxRFELObK7k
	dCOyDi1J7ee5ZLKNCtKM2CkzDE3g21+sFF6lwUBWsb7Kui85Ee4sCZmsHLSzjfGLo+5K/brDVRC
	tEfYCYdkc+GjPSQvoDVgeD09P1Q=
X-Received: by 2002:a05:600c:5493:b0:4a1:78da:d271 with SMTP id 5b1f17b1804b1-4a18e4ee976mr259293435e9.30.1791881098577;
        Tue, 13 Oct 2026 01:44:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:6dd2:be4f:50f7:7ed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm271888055e9.2.2026.10.13.01.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:44:57 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 13 Oct 2026 09:44:45 +0100
Subject: [PATCH RFC 2/4] media: qcom: camss: vfe: Describe the IFE pixel
 pipe per version
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sm8550-camss-ife-v1-2-d50de00077b7@imd-tec.com>
References: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
In-Reply-To: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The SM8550 IFE 780 runs the same pixel pipe register map as the
SM8650 IFE 880 but holds its WB gain in a different format.

Pass the pipe a small description of what differs between the IFEs
that run it, starting with the WB gain value for full scale, and keep
the IFE 880 on its current 4.0. No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c    |  8 +++++++-
 drivers/media/platform/qcom/camss/camss-vfe-880-pp.c | 20 +++++++++++++-------
 drivers/media/platform/qcom/camss/camss-vfe-880-pp.h | 10 +++++++++-
 3 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 6d483f917d15..c2ffe39f929a 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -236,12 +236,18 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
  * Program the pixel pipe outside output_lock, before the write masters and
  * the IPP reg update that latches both.
  */
+static const struct vfe_pp_desc *vfe_pp_desc(struct vfe_device *vfe)
+{
+	return &vfe_pp_desc_880;
+}
+
 static void vfe_line_prepare(struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->output[0].video_out.active_fmt.fmt.pix_mp;
+	struct vfe_device *vfe = to_vfe(line);
 
 	if (line->is_pix && pix->pixelformat == V4L2_PIX_FMT_NV12)
-		vfe_880_setup_pixel_pipe(to_vfe(line), pix->width, pix->height);
+		vfe_880_setup_pixel_pipe(vfe, vfe_pp_desc(vfe), pix->width, pix->height);
 }
 
 static const struct camss_video_ops vfe_video_ops_780 = {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
index 9b4bdad6d396..f962016ef3c6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
@@ -313,8 +313,13 @@ static void vfe_setup_chroma_downscale_nv12(struct vfe_device *vfe, u32 w, u32 h
 	writel_relaxed(0x00000000, vfe->base + IFE_DOWNSCALE_MN_C_VID_OUT_DOWNSCALE_MN_C_V_PHASE_CFG);
 }
 
-/* Demosaic + WB: sub offsets 0, gains 4.0, add offsets 0 */
-static void vfe_setup_demosaic(struct vfe_device *vfe)
+/* IFE 880: Q10 gain of 4.0 */
+const struct vfe_pp_desc vfe_pp_desc_880 = {
+	.wb_gain = 0x00001000,
+};
+
+/* Demosaic + WB: sub offsets 0, full scale gains, add offsets 0 */
+static void vfe_setup_demosaic(struct vfe_device *vfe, const struct vfe_pp_desc *desc)
 {
 	writel_relaxed(0x00000001, vfe->base + IFE_DEMOSAIC_MODULE_CFG);
 	writel_relaxed(0x00000080, vfe->base + IFE_DEMOSAIC_INTERP_COEFF_CFG_0);
@@ -322,9 +327,9 @@ static void vfe_setup_demosaic(struct vfe_device *vfe)
 	writel_relaxed(0x00000040, vfe->base + IFE_DEMOSAIC_INTERP_CLASSIFIER_CFG_0);
 	writel_relaxed(0x00000066, vfe->base + IFE_DEMOSAIC_INTERP_CLASSIFIER_CFG_1);
 	writel_relaxed(0x00000001, vfe->base + IFE_WB_GAIN_MODULE_CFG);
-	writel_relaxed(0x00001000, vfe->base + IFE_WB_GAIN_WB_CFG_0);
-	writel_relaxed(0x00001000, vfe->base + IFE_WB_GAIN_WB_CFG_1);
-	writel_relaxed(0x00001000, vfe->base + IFE_WB_GAIN_WB_CFG_2);
+	writel_relaxed(desc->wb_gain, vfe->base + IFE_WB_GAIN_WB_CFG_0);
+	writel_relaxed(desc->wb_gain, vfe->base + IFE_WB_GAIN_WB_CFG_1);
+	writel_relaxed(desc->wb_gain, vfe->base + IFE_WB_GAIN_WB_CFG_2);
 	writel_relaxed(0x00000000, vfe->base + IFE_WB_GAIN_WB_OFFSET_CFG_0);
 	writel_relaxed(0x00000000, vfe->base + IFE_WB_GAIN_WB_OFFSET_CFG_1);
 	writel_relaxed(0x00000000, vfe->base + IFE_WB_GAIN_WB_OFFSET_CFG_2);
@@ -611,11 +616,12 @@ static void vfe_setup_ds16(struct vfe_device *vfe, u32 w, u32 h)
 }
 
 /* Called from vfe_line_prepare() for NV12, ahead of the write masters and the IPP reg update */
-void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, u32 w, u32 h)
+void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, const struct vfe_pp_desc *desc,
+			      u32 w, u32 h)
 {
 	vfe_setup_core_config(vfe);
 	vfe_setup_chroma_downscale_nv12(vfe, w, h);
-	vfe_setup_demosaic(vfe);
+	vfe_setup_demosaic(vfe, desc);
 	vfe_setup_color_correction(vfe);
 	vfe_setup_gamma_luts(vfe);
 	vfe_setup_color_transform(vfe);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
index e033880e5534..fe3a604c579d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
@@ -6,7 +6,15 @@
 
 struct vfe_device;
 
-void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, u32 width, u32 height);
+/* What differs between the IFEs that run this pixel pipe */
+struct vfe_pp_desc {
+	u32 wb_gain;	/* WB gain register value for full scale */
+};
+
+extern const struct vfe_pp_desc vfe_pp_desc_880;
+
+void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, const struct vfe_pp_desc *desc,
+			      u32 width, u32 height);
 void vfe_880_set_aec_bhist_region(struct vfe_device *vfe, u32 h_offset,
 				  u32 v_offset, u32 h_num, u32 v_num);
 

-- 
2.43.0

