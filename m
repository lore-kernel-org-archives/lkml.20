Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223587;
	b=v64NBvjLUCfUejcqeeFzKrfBmZsizidmi6E05tHFx3TyvsCMRoAiLFqx9NIwK+IhgFYP
	 +q6QS+Fmz9mfGU1KDSs2DhDHt/rVTs2BJ7QgfCm5r5Fi1DI5yPzgXMtmuXl4ofXMT3UHL
	 fWYfuROpSpH30Z4CAq1ypt6qs9+CfLsh2KYpQScZMkPpuhIiCCFUpUPhAC7MmEJMkhaU+
	 ND6c5zRz4KvkcHezZAZ62Q5u5dcak8UgeE4kLLLNHADQVK6IS3W9d5BCGKARWEkTpCQ6q
	 QcDTKlcK0+zAz61nebbJqb8h0rzCGGUIvOhUcdIUZeTSc1QYCOdLbkEtyv74lRPjCDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7OADbxMRrJk9ViHbHj+40nGiyF3MmPNTVpb/SYTVwYg=;
	b=dAmbZQaT8OE0gwjOi7bFnxW/UD5m2JBwD0Q5z6xEPf6lVCelESZ6EDAYE7AWBnGY3Ppy
	 O+b6o/QD/YzTjvHuW+xZDtUG3TXMLodHj53RAe5mg6M9lP4STzm3d9rI0wARNx2KLXiDZ
	 /0g8qMUk4Jj1T6yEulYnH9GKplwSG1C/L2ohJGfJrkIEvI30urUKjQJ+BiJs5/7goEuT4
	 XxqOaGAIrO0068cQ+thzx1AsvkzYy5gcbzehjOod2P5/PbNQZ9B88FOwKDkT7tZj0w9/7
	 KbPtziQYWU2ZDoD0xzc5bChobegfWzzMqq5n8cmAr6Ly6jwYSCoCKYdFbH44TQ2pgrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eIOTZTOc;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7CF606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF7CF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eIOTZTOc
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c0bd676eeso610673d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223586; x=1794828386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7OADbxMRrJk9ViHbHj+40nGiyF3MmPNTVpb/SYTVwYg=;
        b=eIOTZTOcfNImoH1UbMU1sjyHjADSTni8/f5LhkO2WlWtDaOIiT704rh8nw53voLfto
         Z0GE9A4XezzZuAqEtsoycFMm6tjjB2ZKZeAWT9OSHshMBXmti0/b9pDfd6L+CLzBRZQi
         9jqDrRBQAtRDhQdaxG2GB2jqG2Iqc1+XV6SrhzlgeO4UfKJ/Oimr+2im4eXA77K7wWyq
         AbevrUZxHZx//Xt0UtJymC9LS77vqfY3O19X/dERdHKxwk1g6UiD3S4n0P1pYuLgBLJq
         s3jrJf9bRgenEAPCfscu6LrKPTRJXNiYwibThb3cadnefveExHlsBpkFXaTa9SOT1R0x
         FCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223586; x=1794828386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7OADbxMRrJk9ViHbHj+40nGiyF3MmPNTVpb/SYTVwYg=;
        b=GIw3jdzlpgs0F5dBfkJpZ6KIwqJxv1v5IihKETmkcvpHH2A0FK7dqoCui47fPSBeI6
         eDlspq1Wlg1xpHzhYeRLizPfTDHm757gf0flDDRmVFcnMRwDfHDIdEgeRpK1rZlJNP6T
         ANt83I+M1pkFWN/kn9EpYhKfnPqFxmoJjYqjrgYMc3DlhrvIfAhT6Cl12usKmeO/COSl
         Q48/hboa9wgbS+0yLbVg0/aW8gMaCyTQty6+YVQlqn/1v34CzJg3ciStdQs52Heridcc
         ZCccu0rEzv4VQBFC/HzCO/kalmbZIqTuWDIqN7SH24sIzWL7BewaW1IedDh/8pyK3nVS
         YVyw==
X-Forwarded-Encrypted: i=1; AL+hErGmpyxNBWZ8X1FJVa+rTXpyZ7mdBtHdqqJvr+6EqKyLgqE4jOVUbLrR1sAKvcNm0gkNhq/wAkyIDuQI19c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pd8aMEao9D6bhNp2im1X5OLs80R06ztDYrNGelQrO31p5MRR9
	tAjqm3ZHbXYzUK+5Vp/+7ol1DTRDCKohgvltKQvcVPXAVIXv3URGMTAm6clFVggwDaE=
X-Gm-Gg: AYBFou3IBqxI4DuMrNTfmAvaE8MOKH4Id97I7LsBk9M2b0FVI0OwdtwsDB5eUts/t5/
	qMJlOnhXkgJMJqX3n7K7f9ursedATF6WFVV7purzoUZOnbnVoQdDig1GGxLQaTvSUIfG7gttTJC
	b5mQrEyiMwg7sHWT7U73C9rs601Rtj34nCPZ95l562g/ZyY3QaoVz8KhPTDlugv7opu7ywcfLTC
	z3UDBBpLuNRCTlk+UhAPpi6596CvcdIOt/8utZv0unn8BMi06a0NRy77IBITW5bPd0z2LTxKnLe
	BotnAaHXDPwsnEcd58wNK7jEHB70pF0HNa/xnCxhqOmp1xGvmX9fRYYkG5p2ODVctMsVixrPDIm
	259qVhaOEHPxAgYnCnkKZtyCBudla8QgwO/2+nB4tCRKYt25DxSJVRj3yVUTNjEUn3FbrS5UuZX
	ND/9mOwDSpQy7tqncVv2hMPkN9+BDGDqTZdZrYoXdg/9uaPlwDiDg0mpn8x+LuhCBMspvGErIjv
	efD7lXaAtRnGbA/4IuqDG8WZ5gBkDcV9+fN5sN9aHufqyFmYrdlJncZHc/teyvg7F4V22FTTfjc
	4adyjK2RMBMtdsGOLxa24nqH9lRDMdgZDgdWihi6tGqnwb+/ETjnTlj8hLiC4/N+AzM=
X-Received: by 2002:a05:690e:134b:b0:677:cdbf:41ad with SMTP id 956f58d0204a3-67c3d7ab40dmr2809227d50.12.1794223585596;
        Mon, 09 Nov 2026 03:26:25 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:25 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] media: qcom: camss: vfe-4-1: program the RDI write master buffer size
Date: Mon,  9 Nov 2026 08:26:09 -0300
Message-Id: <20261109112611.94010-3-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RDI outputs use the write masters in frame based mode. In that mode
vfe_wm_frame_based() only sets the FRM_BASED bit of WR_CFG and leaves
WR_BUFFER_CFG and WR_IMAGE_SIZE untouched: they keep their reset value or
whatever a previous line based (PIX) stream left there, so nothing tells
the write master how big the buffer is. If the sensor sends more data
than the configured format, the write master keeps writing past the end
of the V4L2 buffer. When the CAMSS runs without an IOMMU, as on
MSM8226 today (the SoC has one, but it is not described in the upstream
DT; its VFE 4.0 shares this register layout), that corrupts unrelated
memory.

Program WR_BUFFER_CFG in frame based mode as the downstream VFE 4.0/4.1
driver does (msm_vfe40_axi_cfg_wm_reg(): words per line, lines minus one
and burst length, IMAGE_SIZE unused), from the bytesperline and height
of the active format, and clear it again when the write master is
released.

Pass the active format to the wm_frame_based() op for that. The VFE 4.7
and 4.8 implementations, which use a different register layout, are left
unchanged.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 34 ++++++++++++++++---
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 +-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 +-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  5 +--
 .../platform/qcom/camss/camss-vfe-gen1.h      |  3 +-
 5 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 9cf1ccdb2..53ebc12c4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -107,6 +107,7 @@
 #define VFE_0_BUS_IMAGE_MASTER_n_WR_UB_CFG_OFFSET_SHIFT	16
 #define VFE_0_BUS_IMAGE_MASTER_n_WR_IMAGE_SIZE(n)	(0x080 + 0x24 * (n))
 #define VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG(n)	(0x084 + 0x24 * (n))
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG_BURST_LEN	0x3
 #define VFE_0_BUS_IMAGE_MASTER_n_WR_FRAMEDROP_PATTERN(n)	\
 							(0x088 + 0x24 * (n))
 #define VFE_0_BUS_IMAGE_MASTER_n_WR_IRQ_SUBSAMPLE_PATTERN(n)	\
@@ -269,14 +270,39 @@ static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
 			    1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_WR_PATH_SHIFT);
 }
 
-static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm, u8 enable)
+/*
+ * In frame based mode (RDI) the write master stores the incoming data as is,
+ * with no line structure. Program its buffer size in WR_BUFFER_CFG (words per
+ * line, lines, burst length) as the downstream msm_vfe40_axi_cfg_wm_reg()
+ * does, and clear WR_IMAGE_SIZE, which may hold a stale line based setup,
+ * so that the write master is bounded by the size of the V4L2 buffer.
+ */
+static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm,
+			       struct v4l2_pix_format_mplane *pix, u8 enable)
 {
-	if (enable)
+	u32 reg;
+
+	if (enable) {
+		/*
+		 * bytesperline is aligned to 8 bytes (one bus word) on the RDI
+		 * outputs, and sizeimage >= bytesperline * height.
+		 */
+		reg = VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG_BURST_LEN;
+		reg |= (min(pix->height, 4096U) - 1) << 4;
+		reg |= (pix->plane_fmt[0].bytesperline / 8) << 16;
+
+		writel_relaxed(0, vfe->base +
+			       VFE_0_BUS_IMAGE_MASTER_n_WR_IMAGE_SIZE(wm));
+		writel_relaxed(reg, vfe->base +
+			       VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG(wm));
 		vfe_reg_set(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_CFG(wm),
 			1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_FRM_BASED_SHIFT);
-	else
+	} else {
 		vfe_reg_clr(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_CFG(wm),
 			1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_FRM_BASED_SHIFT);
+		writel_relaxed(0, vfe->base +
+			       VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG(wm));
+	}
 }
 
 static void vfe_get_wm_sizes(struct v4l2_pix_format_mplane *pix, u8 plane,
@@ -313,7 +339,7 @@ static void vfe_wm_line_based(struct vfe_device *vfe, u32 wm,
 
 		wpl = vfe_word_per_line(pix->pixelformat, bytesperline);
 
-		reg = 0x3;
+		reg = VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG_BURST_LEN;
 		reg |= (height - 1) << 4;
 		reg |= wpl << 16;
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 76729607d..308c845f2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -317,7 +317,8 @@ static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
 			    1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_WR_PATH_SHIFT);
 }
 
-static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm, u8 enable)
+static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm,
+			       struct v4l2_pix_format_mplane *pix, u8 enable)
 {
 	if (enable)
 		vfe_reg_set(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG(wm),
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index b2f7d855d..65df06a42 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -290,7 +290,8 @@ static void vfe_halt_clear(struct vfe_device *vfe)
 	writel_relaxed(0x0, vfe->base + VFE_0_BUS_BDG_CMD);
 }
 
-static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm, u8 enable)
+static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm,
+			       struct v4l2_pix_format_mplane *pix, u8 enable)
 {
 	if (enable)
 		vfe_reg_set(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG(wm),
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
index d84a375e3..f05676c2b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
@@ -66,7 +66,7 @@ static int vfe_disable_output(struct vfe_line *line)
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	if (line->id != VFE_LINE_PIX) {
-		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0], 0);
+		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0], NULL, 0);
 		vfe->ops_gen1->bus_disconnect_wm_from_rdi(vfe, output->wm_idx[0], line->id);
 		vfe->ops_gen1->enable_irq_wm_line(vfe, output->wm_idx[0], line->id, 0);
 		vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[0], 0);
@@ -244,7 +244,8 @@ static int vfe_enable_output(struct vfe_line *line)
 		vfe->ops_gen1->set_rdi_cid(vfe, line->id, 0);
 		vfe->ops_gen1->wm_set_ub_cfg(vfe, output->wm_idx[0],
 					    (ub_size + 1) * output->wm_idx[0], ub_size);
-		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0], 1);
+		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0],
+						    &line->video_out.active_fmt.fmt.pix_mp, 1);
 		vfe->ops_gen1->wm_enable(vfe, output->wm_idx[0], 1);
 		vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[0]);
 	} else {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.h b/drivers/media/platform/qcom/camss/camss-vfe-gen1.h
index 6d5f96565..83856c0bc 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.h
@@ -44,7 +44,8 @@ struct vfe_hw_ops_gen1 {
 	void (*set_realign_cfg)(struct vfe_device *vfe, struct vfe_line *line, u8 enable);
 	void (*set_qos)(struct vfe_device *vfe);
 	void (*set_xbar_cfg)(struct vfe_device *vfe, struct vfe_output *output, u8 enable);
-	void (*wm_frame_based)(struct vfe_device *vfe, u8 wm, u8 enable);
+	void (*wm_frame_based)(struct vfe_device *vfe, u8 wm,
+			       struct v4l2_pix_format_mplane *pix, u8 enable);
 	void (*wm_line_based)(struct vfe_device *vfe, u32 wm, struct v4l2_pix_format_mplane *pix,
 			      u8 plane, u32 enable);
 	void (*wm_set_ub_cfg)(struct vfe_device *vfe, u8 wm, u16 offset, u16 depth);
-- 
2.43.0

