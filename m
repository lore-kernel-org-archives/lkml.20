Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891341;
	b=08JlHjBm48DcXuX1GDdyxDFbMhA/KNHsPo3xsPk3YFuL0ohRr69m7fQPHPRkVMkDQBTd
	 lJuWokMlffXx5Sqi4FYaJrjpYD1/R1d8PsT9OvnRd055T17oo19/N8vbUcZd0Yp6usbJn
	 MQ63h3M2ZoUI8LCXJ507dnLfEiXQYFosJUVaDL0hV/19WwZdKFgebBkI5cYgksLf5h4cl
	 VILfpAHveVORtX492zUEYeKsasGCZvS7pJ7POd7mrZM8OCXMP7DHhiNRn4dypOaTfstBr
	 HmfbvyrPYjWJau7pyxhqr+oz2GNSu7BQdj4kkul3NXsDk492VSRDPhbUE8h8M/qpEBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=thrFFsAVoZM5qvImPaq4dRUCRKPov7KswCoNGlUYbsY=;
	b=zOz3BQnsXURq2Iu0A+Yuq60QLXwtC6LYGFx6YjK8+k5fxPiGsd6jU8wKJtjOtjkf1SGM
	 ty2E2+ENUuvwKMyDQeZrMKMezVeLXNb+4GMQ0Z/5XKHcfNZ5OyVvGG1yE1FRQ/P3jI5d0
	 J0Brjjmt1YR2QmCZsh/flDYdS7NPpz7sVW0bsC0Bj4PR2f/ZBJQLfHITaUg9TSlwtZPBu
	 de9zMfalUJrc3snQv852AVnL42UbC5Tpx+7qziexQe4DQ4G1fmduoRp/ljLPrehESCoFy
	 uDxw9Gbrtgwg6kvmKoRmY5/sm6c1v9q/2Zt/RJeBObygx1BXCqEUpbRTUK71fksiccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWzqO0PJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iaHMQumY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA263606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA263606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWzqO0PJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iaHMQumY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ7J64134032
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=thrFFsAVoZM5qvImPaq4dR
	UCRKPov7KswCoNGlUYbsY=; b=MWzqO0PJdRVP+QbGlzvgsxO1MRAbzooLBcA5pS
	OBdmmqfmHqO62yEcGERruGy4eGd71G+DOPfB4C3/5KnMu/eL2CJzw8QyMJ34pJzt
	Fn0OeZcJt9oaeiwO9niOiG2B3SMMEDwD5SXUI9S5cc0bwMr9R2cX/jpSyT1Gs6WH
	BvnktwJlmOTWtrvzccjH3e2E/Pz1QTrxjgLJaNmf8QyEDtVuAgfytpE7Mnm3mB2U
	1Hoe4xwK32WN2cLPehBTGm+/1yA8tlFiQ7eWbrP1/9igTR3+RrSxuDF4UPT3TlbX
	35Ptjxsx7CE+fXe/qoRo5cKjJqa6xufXTsBrCEkvct8JSCNQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksqaa3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:08:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-999bc06bfd0so1079832241.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793891338; x=1794496138; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=thrFFsAVoZM5qvImPaq4dRUCRKPov7KswCoNGlUYbsY=;
        b=iaHMQumY5y+8rIdydmBJXlTNVr4Jl7iVFlCfSL3nZ/D6hmS2SaYyPjnCCLS9zaryWc
         hHxz8ihKzZjkdMCcbF7whjLiqgSHWFu8w2iZo1CcK5ZWfBEdeCUR1q+x/sh3Ho7lBD1o
         ZVlRtGe9pODAJHyVKYwVitbjnXP+Pcm0MYFIK4VpizFozH2EuiYUq1v7bH1j6/9RFqhh
         RpgMJlCGRLi+w+xjkFnUZJ/9wuxg49zCfOOTawqNxxN8CfI6qTviXuLa0xA29bwqfOGq
         6ncw0hMGAUYltHt43aDNZNHSO5A4/FwnZWh2D9fePLoSqs6ze2KDBAg6UV602NmY9UpB
         0Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891338; x=1794496138;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=thrFFsAVoZM5qvImPaq4dRUCRKPov7KswCoNGlUYbsY=;
        b=1GgkQbIxht27fGfyThjij0uTIwHkpbKXwvQA5lUo5zAaSa60WxVp8hz6TqplQclDsz
         DqrLTPoqpoSW348CFKFYmm6yvXPfU+M4ArKqiQB/tv7EEx/I60UQKifbwcUZPpQjqXUl
         KD4nMlGRX7H/7rQq3qBidEHVm77oEUyJReWOQ82MKQtT7KKHZ4A+IJ4pJgKnkIEFLYNv
         JyCJaLuQYvLoajRpAdfUd7khJbxPoe0KRiWL7iBTS0SGiAUt8Zf57lIsHxrg2goJ262r
         EVcBjAgC+VgTxXexPOTuq1nyu+ThR+RkNqyXcRrPyM5DkY70lb7NxvZtKOvTz1GtreOa
         EKdA==
X-Forwarded-Encrypted: i=1; AKwUvBybUEEmdlm3IJhLN9nLSsIJgQ0YnGIORUWYRdpfRYX4o3Uk+ofMHVqYMzvC5g+j8Zqfdi4Crqceo5Sc6vY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mYMjhQqYZZJ5nXA6Ly0cCNAZNzwtyuqnKfPpjlMBYpn0GIrag
	yxmvJuHBfVWzU6u0GiXB4VKSweCcYEwVeR2/lg0DGaqz2GVZq2hfhF6Ka6Hqyd7qkYcPy+PFkV6
	3Lj9mW8SI4p5+XNNs+NRifVZyJlOEOI9p6SgaAGUwsHL2iiE9PXi1OWeBJDzU91Ij5kKEDZkcG/
	g=
X-Gm-Gg: AYBFou1SnvMXDmO9ddYVy+Jgg7YUJGdemgYZqaKljx3mygXyBDpHKMs1FqKrGBQQTow
	HsC5p/mCSJyL/o0iv12IrqZ8J9PZ0Z7IYpjpFdlAAE1lKPgVe7ULvZZsxFztxK1ZXneSwRDyCb6
	zmVMAI4x/49P+0xTJM2NNKb83nhKdLbaK8oGnjKVBv/plbBeMKICQ3EktEbmsqpQ73gFs7BybeA
	cu8HJ2ZUGLzJwxZ7slQbbZxqBZRpHp/AB28gEdH8BIzcteP1zVXR3aj5/yVa97ifjfL4xwGmUL9
	kHjPl2hl+pID8pmuEeAzTahtD2xYdlpDhjkUvO7zuFa5QRvJa7RWYqhqcl6ivc8ikAEDTxe4aXb
	ZWx1JsSBsjVboCYNIMBBSSVjVkI2FxesItI7el0ASs1RLQnP/UGnkUA5OveqjA1czMahMb68V3Y
	+trrdIaGrmgZocEgGjQi+EoOz0pFqrDY3VP3mZu7zQPHn/VcltCZ498QZG5VPYNH/EDvZbcpm5H
	BN2avsZyHvcMBFb1jlNLbxDlDPm
X-Received: by 2002:a05:6102:83ce:20b0:7d1:cf05:f2fc with SMTP id ada2fe7eead31-7d1cf05fd37mr3546613137.27.1793891337898;
        Thu, 05 Nov 2026 07:08:57 -0800 (PST)
X-Received: by 2002:a05:6102:83ce:20b0:7d1:cf05:f2fc with SMTP id ada2fe7eead31-7d1cf05fd37mr3546572137.27.1793891337359;
        Thu, 05 Nov 2026 07:08:57 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725061e1sm76689575e9.7.2026.11.05.07.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:08:56 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:08:55 +0100
Subject: [PATCH] media: qcom: camss: Use contiguous DMA buffers
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
Message-Id: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAac7GoC/x2MSQqAMAwAvyI5G2ijFvEr4qG0UXNwoQERSv9u8
 TgMMxmUk7DC1GRI/IjKdVawbQNh9+fGKLEykCFnrRkw+EMVV3kxHh5DRzSOzvUxEtTmTlzV/5u
 XUj41McekXwAAAA==
X-Change-ID: 20261105-camss-fix-dma-c32288664dd2
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Siriani <allan@fatecpompeia.edu.br>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfXzAUMUXDmx2Nk
 hXLatep9FLBdDaQpOiGWgumdJef96tWWkBG3Qxqg9pOeskQYWYFf8xiQNWXLxQHWYC0PDvc7Hxs
 gVKYhyPZeW+zJUW0NtHLK+1U2s6VEiMLCVx25bHSQUhvaANHErTBwTMaxcwvAaytkPzjaTfSetn
 cGL+caLM/fUThM37CutTp1ePGvtCq4uiRfVt+TtDgNvMfw37ANgeG+c9unzlWoCIYHgpJfO6cbg
 nTj8Ai3RtwG5sWGg/wwjqYPZKa/LtJDM/ONSXIwWvkLzOv4FQGvnM+drZd8WCU55OwoF1Sfsx2O
 g0ZXBXG4qQrhsJLlA0ldur8a/hhAp7BMCr/KAz2r49bpvP+dRyVk1poQog+CjToXimhx8MtPxAq
 SYEiBkGhoutOWDT+L7hqb7iwZMSOcJWud0FwCslbqBzQf2e6E9yj7NmZJiCdBkP2PYIfKfxmIeW
 LrDWO6BIu5uWf7ljzuA==
X-Proofpoint-ORIG-GUID: -o771Ov9pDxRdnwmhTWJ3G-LCDoBIQzk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX3E86yJVZp0Hf
 edcx5nsL114Ls4WVDVPgxFdDA9cs2vHw+yTs1kBxT/nVQKro4vm8FIFnpkEPN2z9sR2ELhcn66W
 8q8iYMy7K3XlOd200vTjpgNPqr6AUnQ=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec9c0a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3UBxRJvOpeY5cryqNLgA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: -o771Ov9pDxRdnwmhTWJ3G-LCDoBIQzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050060

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
---
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Kconfig       |  2 +-
 drivers/media/platform/qcom/camss/camss-video.c | 14 ++++----------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index b51745c942c9fd71a95d09993213bde4b7e877e2..e1967bc20cf03ea1b0b159c5175294eeb40fe1c1 100644
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
index 0852eb6f13154cfae7147ce39d22de64d14a5cba..5de6ff5ecc76a2863e536fca1c40ae6b2de6dc0c 100644
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

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-camss-fix-dma-c32288664dd2

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

