Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405234;
	b=PKIJPtkqLjPH6fU3+mU+bm7V2eoLj32UPhF3tZfAi1Njq7PF/2RNh+3sKopD5HtrL2RE
	 j7fp7PxkYFFvAfKke3tqFFwRZGBR7/KLlPD10cFjQUR+GaD13nItvJq0wzl8iN4XU6YTy
	 a629nFk7/qdcP/6Qy6ReKx4dWOBymsH+Vibsnw8TNAICzipjKO5VywKh9va2bt6CMzcUb
	 IM0cpQ1utQzyUtMVupmUyb87JMqSn+EtaMoqsYdPxvaA55apcsnFzC9uHZc0kW3mDg1ad
	 Bu31zJGXR/sh4WQyEXiRZxyHyih2eJY1ZYtlcyFHzpW8BMGKpybQwVjD6ySSFRzEK5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LJ1VC+whC+NnfTjNeCjp9ZLHP2qcgc0JozgxXcF3RXI=;
	b=ukids2mEeuH9wCrY4MF3ceFeVbPfs0jD45CgGnagZflkgwc+cfl94qfcCGLhV4iocw9m
	 KoILEAu7jNLzQhqVNhTxQKODYogHaR6N/fWf1Y3ej9g9qFwCeOXf455QJaYYuWNyfVrAx
	 s+cl6mqbIFIX0VgXH9FhhTIui576N/Uin2UQWn4WJKldHj5W6dIkKdlzznsgOBNzHob8f
	 d3By2OmmNz7Kqef62jry+PixyX3zEZA1wpy5q43BSYtVrOwa7sZgzGzITMJlivthcaYb1
	 DT+1FDSJ8o5qIAlxabfbMHZMtaVY2MajGazR3VmLTkwQXMpzuTSJJPrlwOl80uDDR3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s6gM8FKc;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBFC606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FBFC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s6gM8FKc
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d2bf046ceaso1733747137.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405233; x=1795010033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJ1VC+whC+NnfTjNeCjp9ZLHP2qcgc0JozgxXcF3RXI=;
        b=s6gM8FKc0PdMpeogfTxEI0jLj9/uj9QrFJy0Tdk7cCzwK2SRaSAGIuaDqT+IEs4wU9
         Jo1EB7CYOHbUH42jqsz7u+xFsabjNNrI3KaLElpJoYia26H64mZ1g2pt/Vs4pZ4ltrPh
         dQ0iUDEk4U4Y0HjJJ0ISmzmx1kuKhvR8+Domb0nGnwRpTt0FWNBI8lXeTPrKeEYjNm2K
         EcovsAosTCM1zOs2dwBoZ6J1LUujOrRlIxm17W3yribRRetbKUt9XfjqWaS5YFl/nRtB
         MyNi+pna2h8nn1apxbG356QliZsL4XhoRIdjcZN3wniP34o7R5aBsJzhn35NRk20DSJp
         WHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405233; x=1795010033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJ1VC+whC+NnfTjNeCjp9ZLHP2qcgc0JozgxXcF3RXI=;
        b=EP2lQ7UFTbCAnYcca1QuqmU6Ty/fuF+jcYobQ/I5ElIEM+YC1fDm60P06miTuiyKKM
         Rp/VZJgsfE9IhhYYmhXsNk3PzX2cMUPqaYQSaGFwIecSVqFrU3VqyUqiLcj0PMphTPnI
         iZlvU0peuGL//PRDIySWlr0f2d8DpQTFAtqhKt1BPtc+OIsDA5gXurSoMOYxIJIOwpdy
         iLQKMUWYXT2afWMbdl7HizAwdP6WWtA59M5JT1QdXDTvLMXVNzG3V1yYI5fCRBm7tjfV
         yfX1d4mlQ+TjDW6PfwGIFwIZckGCl285fQa9MLAf9khfVEkqC0tc3l/FsMUQyolWHFSr
         MhsQ==
X-Forwarded-Encrypted: i=1; AL+hErHD3EqgiUSQYYL2wEo2BcFc0iU0vlRdY4GdM9xiJ2U8i9HQS1Rj26ynTHpjGQ3VOEMtNZfCq214uaqIz2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8STfvVbUfbumbLheyBObhompfuSMiAMpqHeDxC2ZDlq1iEc+jK
	Mshuu3APOjm0/wFpMR3pgxAjOEqlt2y1kj3j3rXsJDJBDYAQmjOmJMaccPR5v7vUpt0=
X-Gm-Gg: AYBFou2rY9b2teMxwC1N+5drJMpKSYho81R/xjXc0JIqL9RNcvCG4iUxUWf/VCC56J/
	hT6d2IblvN+hABV2tuwycJYentoOg7Sl218+w0KNaPqPAtTyly5HtiBX8J6e/T85JVrK4LE7mqa
	jR851In3pOm+PaT6DuLfy3EdTa0GOdL6w9HHOIlrg6MAC/QMgqs1ZFTfdvKMGxkopI3K9HSwJvo
	EmMrwaZ8pTFAGnhK/QL5kueLZzM00txQqBFItnD2ytbqiBngqLoXKcVNvFy06X+HFneXeF2l0LQ
	PWZzCAMaIRKZahog6alMlGvRXQ32sB3DbroDEodO0/7Sno5NWDB+GEbGCbamKkZMLDdQpQ9XM5f
	pwJHsVT+bF/tuPUwOxeGyUHV7XHreZSXG8NLudMQAYIY6HOtO9WMdRFK13a4ym6qvh9jJg+XZLA
	OqyQcziDLVk3OAraqSX7Z9eOw9fqC3ZPPVQoD9XOj9JjwdWsR27ecgUrUJkkkTCT8n4oMiJHPfu
	xqFk/nK3hP8LdNJi+JSbDW9dS+lkWeifOJi7gOpD9jyFg1KpejsPvSdQvw2OVVpeO7JXLmGcDDK
	tMi7wa86HFKZ+m02Fr10mwDIxhIVF2uF0sPVG+wgUJaQQHtf6ilBUFqoSdvW8+o1ksLnWjMYt/j
	TcFQ=
X-Received: by 2002:a05:6102:c09:b0:7c1:f386:1b7a with SMTP id ada2fe7eead31-7d50613f35fmr863563137.27.1794405233349;
        Wed, 11 Nov 2026 05:53:53 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:53:52 -0800 (PST)
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
Subject: [PATCH v3 2/4] media: qcom: camss: vfe-4-1: program the RDI write master buffer size
Date: Wed, 11 Nov 2026 10:53:36 -0300
Message-Id: <20261111135338.27008-3-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
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

Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 23 +++++++++++++++----
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 ++-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 ++-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  5 ++--
 .../platform/qcom/camss/camss-vfe-gen1.h      |  3 ++-
 5 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 9cf1ccdb2..54afd7266 100644
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
@@ -269,14 +270,28 @@ static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
 			    1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_WR_PATH_SHIFT);
 }
 
-static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm, u8 enable)
+static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm,
+			       struct v4l2_pix_format_mplane *pix, u8 enable)
 {
-	if (enable)
+	u32 reg;
+
+	if (enable) {
+		reg = VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG_BURST_LEN;
+		reg |= (pix->height - 1) << 4;
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
@@ -313,7 +328,7 @@ static void vfe_wm_line_based(struct vfe_device *vfe, u32 wm,
 
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

