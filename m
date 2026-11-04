Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823807;
	b=y0OmCg0noEOAuJ9cOHiB/HgMFdBdn1RHoTwgO50Fw4EptPl0BwctrbCweGP/vSVBiZMt
	 Uc8uf7ynGlS+t7rTAfRRFaHWUQqH35UTN83Y57/ij9exYhkrtBl4E8DQ8Nrm1WeX6I87v
	 ANqzBpeYeHXEdSOyoz5ZLlAGR0E5GNuboix7IueBZIUZkLknaT9mTnZEqKrYLKhh1osAW
	 oOYEmG4jsnIXRNIB74kI9zB+2+Nif1LqFWQa0xDNwrGZ1zj7LICuTr3DX6xCbiULBH3Au
	 2D+1Lnu4FuS5gsnZVDiz+VLBJg/JEbd6X1TR3C0UK+C2Lrh0aNbjSoH0u7SGlXLXeEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qynNBXe2CLBqO5UJ0y61+72SAxcxjajvB9VPZ8fBVZg=;
	b=Bdz/W1U2fC8FPpVCID0H5Z3e0zc5ZGd3utE6r5tf0Vjxx9jz1AUCDPZtAMVGE4Tb3Zrb
	 EFnpVZRlGe88YJSG0YDB+XfNaY2cO7WLT5ofQcUsrqrp98mwG62uaqYs97/BhuF29w6oz
	 PPvQdiT7oq5JdBzN00WVhcV68h3UO3t0KRmp/chntt9mfLpjDZCvHD584nxAcwOOTysLM
	 qUguVdcSa1xtw07X3cR3qWK09veIqNAZWfkyydrtEUsVe8k3r9C+NhiyqHxAh9hIEFgGs
	 KKVcBvw7sF6lc2/xMGaJ5kt5YBcdUgsTzau1iMwDne9wlnCqQ76kPgVsIm59y2yqmBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KTAP+fZO;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A037A607074F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A037A607074F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KTAP+fZO
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso16116357b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823805; x=1794428605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qynNBXe2CLBqO5UJ0y61+72SAxcxjajvB9VPZ8fBVZg=;
        b=KTAP+fZODNlIHHKZ6TIT3bKpqI9LF3xA6kC3SDXAlnBYL32tKS/MquJQeL26uR2MZ2
         /3RRppr4o5lcxzVjUCitqddFXC2AlzGVCM8wpL0pW7MTAvKW1YMP29dHrog5XAI0q5jr
         vvUM2l1EL5NUGKwu0AtStqWp5TbBRijpCid6dHiyzD95s5jpwadLSX6Nf7aDeoGXte9V
         HpTO7+sRXCi7yjKVkAA2ozQjLaJmmP+9pRzyHSJSX63eVLpZ+tiUGCsa54dQ+dAM7O6u
         m9BKWypjHBho9hkxkteddq/LRtQh39F+MiYT83UwlrYMFFhhO1gIww/BFEjeiEuqgcuc
         9KAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823805; x=1794428605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qynNBXe2CLBqO5UJ0y61+72SAxcxjajvB9VPZ8fBVZg=;
        b=2qGOzI6iUZeWt8ubzN0cNzf4c7LBbV9IcdNqOnI70wcpKzMv8S3cBSm9WApkBKPbF2
         zvATFl2Bovx3lqXEQ4ruJ6TvU/JGp3UqdvB4zDaN4S+GgBRGobXO9J5qFGrJiilNmteU
         26acA2F+MQxbVhrftCL/ojWmvkLN17nq58FDWMjRAhf4pb9IpPtm+UzsCVdagLKe3JYF
         KbumgR3TxQMB8xl8IXPEAN19bQ1sZ/PGiakZMApENeoAC8uk89G5lEqZTOG4/fUOrmsL
         MTACGDzc88tie0T4CiRuw50QwqqCmbgitiFvPj+MX2D1ObnGnLO5atDOc89wz1zbxDYj
         5ukQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/lcEzYIbTC7dhSiS6w6NbSdyVjg9H4n+nZbaZ1iHIGNb9PAr5wn9ASuLMp1WuVs5dEaooyIG2s0F5F5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wq5SbuA+BtA/PPxt8EpgpbifSVK7G25Ve1G0dWu6+hut6HV5p
	nt2dkcCwBaga3iUrroNlfMwCzEGV/7S4AIrdynJcWHUmXhAVYHeGVvZKfQjXyHoUcM0=
X-Gm-Gg: AYBFou3udLoMahm8Edrk60l7VaC7hPhR093gXcOdabSJXunvRYOvNb0xACRp0cr1lfJ
	X7feQEM4HR6qWxNzD5xzmxNOu51ypU3LNNTkcs3E+LhsCPO80TguxQLc+u1ozuAHIy3OvNOK8ve
	UUo/IxwzD+pQOqkYBdmKBKHPOT3VghyvQniv0bONb7j5ByJ7swM+Wbha4MjbPi8Viflrj+0itZP
	SIdWIaqL4go+WXKdq8fJtOn7PSqXJwv3l+F97zrNcootMdK4w8wlqm46tgx4DlwKJnM4W/Kumy2
	+BniP29JGSovqpBUpQIqXn1zEKD8//J49V3ToCUV4uk58pWqJHk5b9AHA2GHMuIHw8uHv1/4sF1
	X3+u/IFNyqjFtgyH3NNIBvCzsFEZAi3EC+cta3zV0ofrL13lwTILxwT0NBBuoXVotZQrq7GjdG+
	0AnTQPSt8ZoEd2HFDftz4zLUB1jbEO81bOmAHwvSYWIS6NnqBhASe7tMbAjBVJTl42kXNdovgoi
	3yyjYUoAj6kd/2yItrtIj/FMsiQyD+5mbpDkfweHSTXFFC/oDpCdFq22efXmaYF+lss50JjQoZN
	xjgV3hTn4Mp2O9GSwvKYf4RG/Z5vbiDSvgiFbOisdraCtK9OxhGQA89ex8OUaVWSn1KquQ6hSDn
	zP1s=
X-Received: by 2002:a05:690e:1241:b0:67b:fdab:8777 with SMTP id 956f58d0204a3-67bfdab8f7dmr921170d50.39.1793823805449;
        Wed, 04 Nov 2026 12:23:25 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:25 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: qcom: camss: vfe-4-1: program the RDI write master buffer size
Date: Wed,  4 Nov 2026 17:23:11 -0300
Message-Id: <20261104202313.72494-3-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
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
of the V4L2 buffer. On a SoC without an IOMMU in front of the CAMSS
(found on MSM8226, whose VFE 4.0 shares this register layout) that
corrupts unrelated memory.

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

