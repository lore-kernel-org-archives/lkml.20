Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405230;
	b=Q66+Yly7o2yp/6OeZ+wl32IAU/mpQl9859mymJ/hV+bN63C4I18sUFosd8a1pq6Uc5Z5
	 yvRi32geNRYdjaVq6m8185UZqtZp8Grav1uO/zzygCMDmrty8PQIwzDlwsWq2F1IazGty
	 BOwzx08a0kqwgRR87AORj0HIDQIb9fSFwcZFFEQ/XCmFZCNQ7RRWD7x1JPvKOB+kGkU00
	 bVeyfF2TqKzLdLp8VZXETzS1zAR+f+zvL8kzT+KVTndBhDL/q9VmdtB4mWknOE16THW3X
	 8whxB59bSZCNON0ZIvnxSWhKb/lgsse7o+kUwVonUrlIDvQvt8cA6YjmrWLnU11uCRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
	b=kP14iKe95jSdj7K/7gadHWUC1WDozP4hPjGGeUaGJfxLxgXIUILPLlVuuwD71vbxuYz4
	 PBuaQQykPypqi+HA4s+q4L1YZ0OAdOa2qKU2oAYwzW6SPmhPP/zB4KYNXvNBR4MpKhO8w
	 1u69Ek4tJkqqdQ4+awT1/fMAw4yZ6KZaVvpY5Z2p6T72s/QMjwzlyol6auFRYm6Z7Nq4u
	 B4z8D7CMOFjvsAzPJUOQUJ0v+5opsNekhWwO0AT6QhuOhZF8dGVrrAdBBO2+st+vg5PLG
	 RlCn867WmD5aKktL6QdNpRTPEE7w0B2mVAFCR8SUTC8UIGEwRDHLn7i3bI1+KivBhzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mSGsVa6M;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839B6606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 839B6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mSGsVa6M
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2f4cc314eso1505269137.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405229; x=1795010029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
        b=mSGsVa6MpoA0wwqqzUZGMS1Cfv9b3he1UpVvnji8ex3161GXzP8G3PSlbdn/B/btrX
         l8/vnWATVYuPA3HS8z0UDdJUfoRyx+xa/spzUi40IhdYjJsPA6/A2MjGqNY1S00yxV/e
         gnizpnEGwfgDb5fD7rq4QfQE8vWCEpNPPq7sanEvmRiBiQFqxpNanntt/dT1FeB2icgX
         ZDdxI53dBKUvN+IVaruho6evdWXTXVN9JyF6H8KXwbOpkfgoUNI+4uekWNFJo4OcsVdq
         +sJbBZKqNzi+Q3fpEydCUMLrKnzPJ5brap5CAznx+TV6yymxtvCITvpLvIpl3Z9HGGHu
         dD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405229; x=1795010029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
        b=RApWH3rvHA2fQszOr4bu/JpdYtaoaH+1HYOMZ6IO5lI2e+FSFQ5dVyPYd/UlFoSfpu
         KuiEBou/HEJJWbX91Pepx0IG6QV0anzetrs6CBZZoxaYQV/uoUwuDbaHYe0eOc9ihEW9
         6zlpRLWvt2RSFcUTKnoMeC+FPJjdugC1CY0l/r1QAj3m1XxxscpB9WYUZH6RgaVtWqiA
         BCNm2BWb981WX2fkNqfK7WixL5OqYA4wfUe3hDI+uPimpIBobdd5qvUIBP/wR633ONcO
         0ihnKYjpQdSpHX1qasfggwvrh0gBORUTtuB2X+o2d4IWQDWGoD8+oIueshbe0bkZiTAf
         /KDA==
X-Forwarded-Encrypted: i=1; AL+hErHAMtyqmcEzbnjNtoshBWT1Tz4PdatsmtRG6RgNrY+YbUM4AzyewpNQlgCHaf3GH/2jQoSBflwpxKHmq4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g5fr820kGecUw4FyeAXErH1AaBNQOHyRXbSX1PAXo2Je8KzEL
	nnA1MvizS71shw+O5U0m5s2BEJY3xZZE/FP2p7QGwAtzaNQhtPdwy9oAwx8/cuB7L9o=
X-Gm-Gg: AYBFou1gKrkbvjFtAaLjC3XDemkRkUsh2FvYWmeTD7DhANcX8lvPiRnM7pERoqOgxft
	+LMPmjxWjPCkL3gQu5WDewjCQR/fl45Vo0KGJQ63mmhHHW3Wk72IHy8Igx29g1C4nV6UD+3AjFR
	xEU3cnzXBtw06Ff9VTNl3Ol02768t7IjBSo+rR4EspoldAiSCpnB70DVdqNDXg1Sli3QAdjd+X2
	WyNl3qlvmMciw5xoeqnAG1qGnKF+c+u1LRPVaYc2Mw9f6YdLKFXivz64Me4KM6TuznMDJJjrdbz
	vdqQQoCBJj3tVKPDRPJd9d1pU0hPESYzxiKEDxxFhLygIM/q/b/fHDS9IVzo2kvL0fGKM5AiudA
	z/jTxlR4kI5buVu2Ybi5JkyOBTkmp8HA6c70Vz5oIlxtcbj2sZSQoO7dN04iJnY+MxGbmku4vi1
	cIz69wnP16y9ZAgqMw5nALdsTUk70AweKFz6xsSUkHsLCCQgAJhA59KKL/akMc4TViS8GksAKfG
	hvRehtkS1o+x/fejG3NroO2Qx3svanxC8TcqnEUwdESsc7FNJJ06qNezEqCojtFyA1IJRmtifbk
	nssHMge56mwWATbFb2Erii5pLHZINxDDjH0pfWJYowm8aKUFWcIt1hRAZuuTNf4MOwlnKV+rRKy
	OCro=
X-Received: by 2002:a05:6102:5125:b0:7d0:65f5:2bac with SMTP id ada2fe7eead31-7d50624044cmr789463137.35.1794405229433;
        Wed, 11 Nov 2026 05:53:49 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:53:48 -0800 (PST)
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
Subject: [PATCH v3 1/4] media: qcom: camss: Use contiguous DMA buffers
Date: Wed, 11 Nov 2026 10:53:35 -0300
Message-Id: <20261111135338.27008-2-allan@fatecpompeia.edu.br>
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

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

The VFE write masters are programmed with a single base address per
plane and then write the whole plane from there. video_buf_init() took
that address from sg_dma_address() of the first scatterlist entry of a
vb2_dma_sg buffer, which is only correct when the whole plane is mapped
as one contiguous range in the device address space.

Neither the driver nor the hardware can handle a plane split across
several DMA segments, so scatter-gather buffers were never really
supported here. The issue stayed dormant because vb2_dma_sg gives no
IOVA contiguity guarantee but still tries hard to keep the number of
segments low, and with an IOMMU dma_map_sgtable() usually maps the
whole table into a single IOVA range. The mapping therefore almost
always came back contiguous in the device address space, so reading
only the first entry happened to work.

Where that does not hold, the write master runs past the first segment
and writes the rest of the frame into memory belonging to someone else.

This recently surfaced as patch proposals enforcing contiguity in
camss itself, walking the scatterlist to verify that the DMA segments
follow each other, which amounts to re-implementing what the dma-contig
framework already provides.

Use vb2_dma_contig instead. It guarantees that each plane is mapped as
a single contiguous range in the device address space, one IOVA range
when an IOMMU is present, physically contiguous memory when there is
none.

Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
Reported-by: Allan Siriani <allan@fatecpompeia.edu.br>
Link: https://lore.kernel.org/all/20261104202313.72494-2-allan@fatecpompeia.edu.br/
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Allan Siriani <allan@fatecpompeia.edu.br> # MSM8226 (no IOMMU), both sensors
Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/Kconfig       |  2 +-
 drivers/media/platform/qcom/camss/camss-video.c | 14 ++++----------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index b51745c94..e1967bc20 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -5,7 +5,7 @@ config VIDEO_QCOM_CAMSS
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select VIDEOBUF2_DMA_SG
+	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	select GENERIC_PHY
 	imply PHY_QCOM_MIPI_CSI2
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1..5de6ff5ec 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -13,7 +13,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
-#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 
 #include "camss-video.h"
 #include "camss.h"
@@ -154,16 +154,10 @@ static int video_buf_init(struct vb2_buffer *vb)
 						   vb);
 	const struct v4l2_pix_format_mplane *format =
 						&video->active_fmt.fmt.pix_mp;
-	struct sg_table *sgt;
 	unsigned int i;
 
-	for (i = 0; i < format->num_planes; i++) {
-		sgt = vb2_dma_sg_plane_desc(vb, i);
-		if (!sgt)
-			return -EFAULT;
-
-		buffer->addr[i] = sg_dma_address(sgt->sgl);
-	}
+	for (i = 0; i < format->num_planes; i++)
+		buffer->addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
 
 	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
 			format->pixelformat == V4L2_PIX_FMT_NV21 ||
@@ -699,7 +693,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	q = &video->vb2_q;
 	q->drv_priv = video;
-	q->mem_ops = &vb2_dma_sg_memops;
+	q->mem_ops = &vb2_dma_contig_memops;
 	q->ops = &msm_video_vb2_q_ops;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
-- 
2.43.0

