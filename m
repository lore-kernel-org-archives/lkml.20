Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823804;
	b=5VaelArG9VWldZWl5yymB4h9nWr5OqAV45i5p3HKlryvIVxSDdOQA34CmAIUPa1oJHJ1
	 Aq35tiDsP9/bYKFHpD+xb/39sAROYWTOiAV3ruV+romhWRPjPkkBQ0R3Nr7tYMuTBoynf
	 TVbCoJ0eJE4nZggU0V3TtISNSPwY7PSWQxS4lTB4sHCDpqoMVvlfcq90ZIskAQM88+QCc
	 FRGg98kAYjxbzQMB+LaJzgXCRHoIDYR9pqvVdz2c2wdnXPGTadx2rDkvcXdLEcZUP60ys
	 SOQ10s/34FnMynhYe/X3TyNoPgkawbmTZMdp5bATtZpTipMJycJjDBywJWtJ959wFhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aBaDIUYvApa045EP5EUWzH/DfONwjW0SyQDKAQn1bhg=;
	b=p2eOBYb/4rp4Xu7U716OLZS9z28QTZIjkB0u1gctjDAUdoDGEP4WJ+EI1EFOHMyP7Kba
	 STLJcNsGUZOG+Z4Tnwt+PDEt0p28FvCCFOl2AD5sQ29BmSQNJOjr/supDst1QwNyUdg4E
	 0yXMCu71dFzNkQFYQ8IDBVKES9wiCpwG8VCTCer61MMskEg34D0Mvr5eUEZ63E2xHiWAn
	 PyITEd9ttc+BVNthUn2U5BqWeBWnM+iJWAGU33iY0UXuQH5Gd2EWCcPmSCC9+pS9WdkZV
	 DO0rwRCpZMyfQixe/fQU5eHAecMbca/hSy7jLiC1DAxOD7B1XAocGhCYvMC0JVhz8hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A66QhM04;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D06070757
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02D06070757
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A66QhM04
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67999045530so1142561d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823803; x=1794428603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBaDIUYvApa045EP5EUWzH/DfONwjW0SyQDKAQn1bhg=;
        b=A66QhM04t4FenUCvKRhts3PJR61qzN8QlzfKvK4IBROw9wS24YksaUjfEdMBe8FqW+
         wS6Sif4uUh/bEKoDRw22/BJP/CQPyL1+ZrfKS2l8Q037dioQzuwnVYVxMqs8qB1u/0I9
         cEcH26rwUcsw6uLnHl5JQaGJMAMqtxfVr492VK5yTGKML1/z/ytFb95oCdGa+oMKDQ5J
         kkddE7Kq5YvVSAGaP3kE8nTH/Qz423bq8F2ll9ZQYv8P4mWDkh44HEasJtlHWgBlbN78
         8ZGRbfXB3m1pnf1KQlezFPiYSBZ1REzruVAnyu6OYpdQYi+RiHNR/ADuag1/Atn05BXY
         cfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823803; x=1794428603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBaDIUYvApa045EP5EUWzH/DfONwjW0SyQDKAQn1bhg=;
        b=c++iwoJk8gijY+ZJMg2jGJwoh1n1Zz7VeEurkyHR2Is+d9Cl8Bolp+w0APXNHX2dBB
         O9qXBRMSSz6blTyX6YLVQP3SFbt4svgK6LEJkJXnA605J/k5fJnqrvm03K/Pmbqy4NvN
         GzIHMGKImyJ3QSBQxbCEydqJNLxbRPYVE4JHQz11SXxb92HlECr7Ll91Ll6ebYUGeVT4
         RwYbzqVdbWLZ04SJF/+cEMvwpzyy5FjklIsbGY2bQ5vJ1SlIpRjEcP14gyR0mpcTgA9E
         z+6JiWEhxt9BxeqhY9LY/RSp+lx6/26DpQjw3sfFaEMib77/NTH2DztJfv4oGP5OYq21
         JDwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH+u0qAYe/KqYYheyZfJHMRHGDau/Aui1+11+ag/POPWcAUEDxTsKBNo8K4/GDBGgLumtNPCJ+CBV/tZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U6doSyzQZXlcNUqJ69nva9t6nFJuvY6U1hzHQHNQbHZLVQ1DV
	l3AsXuxqj842ItwuGC0zQQyDfny4TOu4fnnOTkaD8ZtwbMzD+BwvsKZm/9X/zxvqa7Y=
X-Gm-Gg: AYBFou170CcsWZwM9ogAsfpv6n6mjGjoAFBTpXIYWAEblyqHywdP925Myd/jK7dviqy
	QlcNliezI4dKXvDuc1lL0yHsLtcuoU9xcrgr7vEAdo/EnO+uwr7j00ovZTJoyrLneBDnewAq3Sm
	5lgYSuVZj9vYnfa2DOcbfUQe5QfM6eZlYDqp08lXiU2lqRF9Eerl7sr4l7g0VXd21h3O465aBMm
	NHOy61VHs0OcE+U1TFfyHcDCcjSm7gIld8abA83CNNgRwNlJSoebSnMKyMJ1n5cKsGOU2+JS7Da
	zxp5qSZP29QxF4iIScUEzQ28rMr4njJfwvJd80upXR+K4O+Fz6IRl6uxtaBVGfh1ObkTYfQ+ajy
	e3oRisqBxT+1tT34hLMFaA7YH8zCvURioPoULzotXQfhGXgHKFwP3huAKmw47pi/6QXyQkbuIP0
	zoNA/UsYxGSFSljP+XrhjBaKor8Mgvdryc0sp+oQe5czobH0BFzoiXdaZCyw7ZffKDmboyYxZBj
	7sueJnSr2zrGrcBmyf6ZU/4d7Lw/AXXYIHCAyTZSFPrmd5zCN3dDwsQ5eANwIlATxs5RvEhBAyt
	Q+EEfjo9IgbqR5PsOw63Td/bAN6HmL6aFQYR59gSlJS85I1boRSF0w7zj+7tgCeEvJw3Qfcb0Hb
	b1MA=
X-Received: by 2002:a05:690e:400d:b0:679:94f9:5e7c with SMTP id 956f58d0204a3-67bd9cd336dmr3823187d50.69.1793823802601;
        Wed, 04 Nov 2026 12:23:22 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:22 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: qcom: camss: use contiguous buffers when there is no IOMMU
Date: Wed,  4 Nov 2026 17:23:10 -0300
Message-Id: <20261104202313.72494-2-allan@fatecpompeia.edu.br>
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

The VFE write masters are programmed with a single base address per plane
and then write the whole plane from there. video_buf_init() takes that
address from sg_dma_address() of the first scatterlist entry of a
vb2_dma_sg buffer, which is only correct when the whole buffer is mapped
as one contiguous range in the device address space.

That holds when the CAMSS is behind an IOMMU, but not on SoCs where it is
not, such as MSM8226: there vb2_dma_sg allocates scattered pages, the
write master runs past the first segment and the frame lands in memory
that belongs to someone else, which quickly brings the system down.

When the CAMSS device is not IOMMU mapped, use vb2_dma_contig instead,
which allocates physically contiguous (CMA) buffers and checks that
imported USERPTR/DMABUF buffers are contiguous. Keep vb2_dma_sg when there
is an IOMMU, but refuse a buffer whose DMA segments are not contiguous
instead of handing a partial mapping to the hardware.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/Kconfig     |  1 +
 .../media/platform/qcom/camss/camss-video.c   | 64 +++++++++++++++++--
 2 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index b51745c94..3d3555b55 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_CAMSS
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 	select GENERIC_PHY
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1..2c15546c8 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -7,12 +7,14 @@
  * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
+#include <linux/device.h>
 #include <linux/slab.h>
 #include <media/media-entity.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-dma-sg.h>
 
 #include "camss-video.h"
@@ -146,6 +148,48 @@ static int video_queue_setup(struct vb2_queue *q,
 	return 0;
 }
 
+/*
+ * The VFE write masters take a single base address per plane and write the
+ * whole plane from there, so every plane must be contiguous in the device
+ * address space. Without an IOMMU the buffers come from vb2_dma_contig, which
+ * guarantees that. With an IOMMU the scatterlist mapping may still be split
+ * in several DMA segments (max_seg_size): accept it only when the segments
+ * follow each other in the IOVA space.
+ */
+static int video_buf_plane_addr(struct camss_video *video,
+				struct vb2_buffer *vb, unsigned int plane,
+				dma_addr_t *addr)
+{
+	struct scatterlist *sg;
+	struct sg_table *sgt;
+	dma_addr_t next;
+	unsigned int i;
+
+	if (video->vb2_q.mem_ops == &vb2_dma_contig_memops) {
+		*addr = vb2_dma_contig_plane_dma_addr(vb, plane);
+		return 0;
+	}
+
+	sgt = vb2_dma_sg_plane_desc(vb, plane);
+	if (!sgt || !sgt->nents)
+		return -EFAULT;
+
+	next = sg_dma_address(sgt->sgl);
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		if (sg_dma_address(sg) != next) {
+			dev_err(video->camss->dev,
+				"Plane %u is not contiguous in DMA space\n",
+				plane);
+			return -EINVAL;
+		}
+		next += sg_dma_len(sg);
+	}
+
+	*addr = sg_dma_address(sgt->sgl);
+
+	return 0;
+}
+
 static int video_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -154,15 +198,13 @@ static int video_buf_init(struct vb2_buffer *vb)
 						   vb);
 	const struct v4l2_pix_format_mplane *format =
 						&video->active_fmt.fmt.pix_mp;
-	struct sg_table *sgt;
 	unsigned int i;
+	int ret;
 
 	for (i = 0; i < format->num_planes; i++) {
-		sgt = vb2_dma_sg_plane_desc(vb, i);
-		if (!sgt)
-			return -EFAULT;
-
-		buffer->addr[i] = sg_dma_address(sgt->sgl);
+		ret = video_buf_plane_addr(video, vb, i, &buffer->addr[i]);
+		if (ret < 0)
+			return ret;
 	}
 
 	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
@@ -699,7 +741,15 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	q = &video->vb2_q;
 	q->drv_priv = video;
-	q->mem_ops = &vb2_dma_sg_memops;
+	/*
+	 * Without an IOMMU a scatter-gather buffer is physically scattered and
+	 * the write masters, which only take a base address, would run past
+	 * its first segment. Use physically contiguous (CMA) buffers instead.
+	 */
+	if (device_iommu_mapped(video->camss->dev))
+		q->mem_ops = &vb2_dma_sg_memops;
+	else
+		q->mem_ops = &vb2_dma_contig_memops;
 	q->ops = &msm_video_vb2_q_ops;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
-- 
2.43.0

