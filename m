Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158881;
	b=bFIrB26u790Yrh2DyGsJufkr1lVz9UzLtbKik8NqObLbdAT77yuumDWCbuY3OSyNua9R
	 ap9OhX6SgAwx2DCsg+a/RVoFGHJSDb+3TKfPoSPPTDerGRXJtSywCQIzz06FoeGA4JrtT
	 qtSAj2bHpD4K7WEIabRmV+zTNtAeunNi8I/1tjNs5jdvyJpngr5K4+Ja7BOJUioV7O0pO
	 W8ITfQiWNkA3d/qtwmbqneDfbdc1qSphl3G2FU/252GpHeEy3LxVAH9HXyMzehb2PYa//
	 tTOlvQNkB693oXzEibo5CFiqhsGKc5HFNgLdfERtWyeo6eWxqqIQJ/NVc2pEGRg7GrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158881;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=qNIYdo0QTw7MYwq6uSkCBhOdOivMefRpPYVKU2rOFlY=;
	b=MYgI41G5nTr3B2cjJukWZcc+UoErekPGThAdXkoQcA/L4PIHQW/LDGQOkB4tARmAR4Pv
	 VE1PviInE4IdFyeBSZkbVx7NVxMW1QyBbW8lv/7Yu4phME3Dio78DY0H1szo+I7TLj//O
	 Q3kJHwsJ36rt9lFeFyE85a7MF16sKbBHyZzxgP8TLRxJJ8umZSd99m6I8g2dApsZ3+1LO
	 50j5cUINN/smuHz2gb9uUdtbZn62aDwfneTNMVa/gASJhHgv1+aKeya5Ri62t8Y2tGWc0
	 J+6S/GVuVxC5cI8wHiM5pg19Gur5iOb7oS/v+UaYhpUBtZB6aDC0SJ92V9BxpBdPh6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=rlgYrWUM;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31478606A322;
	Wed, 28 Oct 2026 03:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31478606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=rlgYrWUM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=qNIYdo0QTw7MYwq6uSkCBhOdOivMefRpPY
	VKU2rOFlY=; b=rlgYrWUM90SsWokaHwZAhgtqNzl58kIR/6wWKxMP32xt/CQF8m
	cBhhK8keT9jM5y1ypxpM+b8Mxxi2QeWXD4kf9NCVGLOii6HgqQR1suoI1BlPRkbi
	XU37d8H45th/ndjMiXAh/MwWJJYr1loZteS/GXjrYhbYsWZa/wNSEN2p8=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3szfSbuFqyQlWAA--.2887S8;
	Wed, 28 Oct 2026 11:41:10 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: 'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] media: camss: video: check that a buffer is DMA contiguous and add a prepare hook
Date: Wed, 28 Oct 2026 11:41:02 +0800
Message-ID: <20261028034105.326535-7-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3szfSbuFqyQlWAA--.2887S8
X-Coremail-Antispam: 1UD129KBjvJXoWxWw1DurWrurWrGF4rGr4rZrb_yoW5XFWkpF
	WrKrW5GFW2qF4UAw4xJw4UuF4aywnYga4UGrW7Zw1Yk3Z5tr13ur45KFyayrW5JryxKF17
	tr4jq3yfuF4YvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmCb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E
	87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
	Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jzyIUUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARENB2rg+9YEMABKsD

The write master of the newer VFE generations can only be programmed with
a buffer whose payload is physically contiguous, because the frame
increment registers describe one linear address range.  Check that the DMA
mapping of every plane is contiguous for at least sizeimage bytes and
reject the buffer otherwise, instead of silently writing past the end of
the first scatterlist entry.

Also let the SoC code add its own alignment requirements to a queued
buffer through a new prepare_buffer() video operation, which runs after
the generic checks.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../media/platform/qcom/camss/camss-video.c    | 18 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-video.h    |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1..027cf024f 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -155,7 +155,10 @@ static int video_buf_init(struct vb2_buffer *vb)
 	const struct v4l2_pix_format_mplane *format =
 						&video->active_fmt.fmt.pix_mp;
 	struct sg_table *sgt;
-	unsigned int i;
+	struct scatterlist *sg;
+	dma_addr_t end;
+	unsigned int i, j;
+	size_t contiguous;
 
 	for (i = 0; i < format->num_planes; i++) {
 		sgt = vb2_dma_sg_plane_desc(vb, i);
@@ -163,6 +166,16 @@ static int video_buf_init(struct vb2_buffer *vb)
 			return -EFAULT;
 
 		buffer->addr[i] = sg_dma_address(sgt->sgl);
+		end = buffer->addr[i];
+		contiguous = 0;
+		for_each_sgtable_dma_sg(sgt, sg, j) {
+			if (sg_dma_address(sg) != end)
+				break;
+			contiguous += sg_dma_len(sg);
+			end += sg_dma_len(sg);
+		}
+		if (contiguous < format->plane_fmt[i].sizeimage)
+			return -EINVAL;
 	}
 
 	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
@@ -193,6 +206,9 @@ static int video_buf_prepare(struct vb2_buffer *vb)
 
 	vbuf->field = V4L2_FIELD_NONE;
 
+	if (video->ops->prepare_buffer)
+		return video->ops->prepare_buffer(video, vb);
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
index d3e56e240..af046ecb7 100644
--- a/drivers/media/platform/qcom/camss/camss-video.h
+++ b/drivers/media/platform/qcom/camss/camss-video.h
@@ -28,6 +28,7 @@ struct camss_buffer {
 struct camss_video;
 
 struct camss_video_ops {
+	int (*prepare_buffer)(struct camss_video *vid, struct vb2_buffer *vb);
 	int (*queue_buffer)(struct camss_video *vid, struct camss_buffer *buf);
 	int (*flush_buffers)(struct camss_video *vid,
 			     enum vb2_buffer_state state);

