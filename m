Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223583;
	b=M+EoqiwEFSoF5p8rC1zn+qMujoMUHbthCAq4Bg4usLUlYWn0qoOdcI8Pgb8DzKkCesHg
	 LSQdTVsm7Ln1EOn28neT2kwTaqeJMv1VCVj3RiA7YZQds6630WreuLHZDxuRyQ8Vf3KbM
	 JRVwt1Vj0ZMM5c4BVqL4GaM3D93YZFRLHC5Z6+hUciO/z+08n6LpxmLUBhL5bBMXRcfQ5
	 rtCjWI21A+svomX5t4AUVqPhX5N/37DmK29C/8/Ru9+pDuIijMC+8GpLnJ+lLEAT27GVW
	 EqHfZ2O9UIM3f873UHxS/EyePRYrmIl4sT8TpYnwj4O25NuMPDjZHlHOGPssAZK6AFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
	b=kzl+4mP56FUc4nTkJDCB37jIginJy4XpgVI2tuV1sr3op+6OteyA6zmLYn+r9K1pMZaY
	 QWXlvWWc3LdiSY1/quea3Jd6mCb18oP8+rVeHIqdq/LeLb2gujhgyIocBTNalheUFfOjd
	 kylz9xyDTtTX/i9ukBOLM0AgQxQWIzlOo9KWCKxHyEhOSVEwMEIcaqtTo1feXzLGXxyCn
	 orEtlP1I8wxdjdIHQgjyrPPtRdoEXJocKFst0sZx9c/N3H3p9iCDPsPAWuS4HXipxHYLw
	 8Jd4ZHQ5LJ1wAEoM7NbIe46zit96C7nInrwOG7gXOoX2fe62PeLiNHWMTX3+8cPdJMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Toa6QxoX;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799E4606D809
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 799E4606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Toa6QxoX
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b309147589so7072107b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223581; x=1794828381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
        b=Toa6QxoXSnQoHX2expveKKbcYOW1CPvKMxPlXWNyUAnW2D6kimKi4F2FBq7oDVI3V1
         +eEq0htQSgwENJojD1RQti93F8/SjFTS9eJ2GlOKiBTOiKOd7K2/vmD8TPf3W6AB5E6E
         7NSjLEcYh9efzXT18T6SKSYMzkF5YWNN2ii0ukKlzl3yE/F0Z3kgOxtsw9cL6WiVXfYO
         0l/dB4yYhzy7pE4gnyKF5pQrq91+61SB21hbSH8CHG+PAw+Y+BEqrJtCA5zcTN9odnGs
         +CFBRDx5IhEM5zAfTLrBK/gfWl2J54DQpz5kc3626uD03e2ltRY9juSmwSz70KU/csZ8
         esig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223581; x=1794828381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
        b=ja89R65avy9gDhWcwVfv11Hgai/0q9zHb1HKMrgi5oFOLafPxW/IfjW11VIibfc+/B
         OaTEFI/pR0zjn5wUZJEEHDWzFxlrE1PJAC5BCxAr7WZ1t3TWz7wNu/yQBO/+tPd+wnpo
         Icz8EfZqMZQWTc85zvbiOi+bzVG/QOct25uSlOXX88vXDaq3t4fx6Vm7qvA4XUTy7kzE
         mOplOiwVjtF/RA6KlCyew4ewJvFbieayskk33O65x7Y7B16PQA332H3Gx13JfCFQOnaS
         OTMhgKSUEFr9AN7C+3NmztXh8CI1SjWIjQHPrDO+Fj05NUPYWo4tWHiZ1hcsCR508l7J
         eg8A==
X-Forwarded-Encrypted: i=1; AL+hErG092/87xfA3UhJrhQpEq6v972xG0O1YSNSIXboRVJ0M0q+KyXscyFTmbKZK3pqUg8mzgii44xDKFGJfAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ir+tfLZC/Sm6zrE5fRCdMCaTg/Rl2bemxMp2idSACTLjYQnp/
	Qf0Wc9SuXsSWz+tJ/xZEjXYFHIqWFMWW1yhpaJcaOtF3rQXmTt+Nq+kpk6+5QpVp31k=
X-Gm-Gg: AYBFou1eMYebl9XsbI2lxBW6Z/BV0ebLRqqKvv0F+lcU8pS7N9qkuPcbmJV6rrH0yyY
	ZrDV6CQb+Obkk4W9RnbiD+Af6E/WMKj6jlhhGQlpfFT4rChXQYuf7llOuapNKYA48vhe9ZaWzie
	pw0w5ud9hK7+PKFr43+V1b5vhp6Nb0wRE4gvVWoHLmluVL52Xi2nyD0Dp6zUBlksEJe15522TMl
	dfhbCR1ooX+uqtLkGvRPizHUOppPaP/SMSjJ6FRp67HDLj+wlY9rZF+6okPEDWILQpw8t3PLanj
	jDzjAhCrCikfIoO/o+43Qbb0qLP7sPzUQO8u60P7HYiRmrEbn9Wdq+IlJxHH3N+ElCVjVCJbWoq
	mPHsJap4fh8mookHwspbKGTP7zyFrlxIaeeMO/qZqzMpj4HUB6aKwmygstw95iTdi/1R8YGAsHJ
	XAMvnWflsxJQ9Rxonfqk8FSQXRd6KaoLe7Fl1OXJhXn/lAAcvwGJKLusCimu3z/V05AVPBXsgOX
	gWFL6o6P0OiJ8daQX64oqJSDyuFnDjTZFnL2VxJOh4WP/innQZ0uYygsgNHAKnveXUlTnQ+IIc4
	rS8CgqnWiM432HteDNYbxGIM5iLzxIHtcU37bkyA9mZgh+jSjEtkn7Wh+hS0TVdLgzc=
X-Received: by 2002:a05:690c:c14f:b0:8b1:9fef:6cdf with SMTP id 00721157ae682-8b36cadc20cmr17979887b3.60.1794223581496;
        Mon, 09 Nov 2026 03:26:21 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:21 -0800 (PST)
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
Subject: [PATCH v2 1/4] media: qcom: camss: Use contiguous DMA buffers
Date: Mon,  9 Nov 2026 08:26:08 -0300
Message-Id: <20261109112611.94010-2-allan@fatecpompeia.edu.br>
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

