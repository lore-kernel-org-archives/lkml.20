Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179824;
	b=aWIWxjD0vXdzaMN9frS910qyOmrVfPN9nHKFc7djNWvFrKsx6dLn2GRYsfo3iuL+qsIp
	 qAEiLe76AVMqWkmTNNOXaOtZIA8It36HeQaLoazlYbSUiBuY+E38B2THxlDSH2bxzV9mx
	 ZBTwh6W2iId5wjpQfNmaEoEdtvzw/1hMxFXxfOdtXvb73u+8tO5tJFw495SGNRiQoqPxa
	 SLIm9eyp8TIMrTvaqHizbDxL9RXtBzjlQoXMvINtpZhWn83sgCSP13DtD0htULXDgbVU/
	 z7OnMq1gQB6qBWxF1rl9PqjgqcZxGDkx+bkAxLevagZ2eyWBz9ePiDpNzJ87imyf5OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179824;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=qNIYdo0QTw7MYwq6uSkCBhOdOivMefRpPYVKU2rOFlY=;
	b=mZRXfFxjW1P7XdgpSyrkbqqDg7g3+0lTnXkS41KsxAIaV5fYeyb3qXqRQbx23mMvHQQU
	 Kj8d9nrYrkzv4QU0X5ZQ+ThiFWk6OGGvHDviPD5uKAOfMi1S+kOI8HM9Zzqg8EjCNXwP9
	 jFIdrPGh5kNhVvRiCs8e5SJj28Qx+q6PGVh157Tjlyatgtq18reHilqd8Za9kyCzULMkg
	 r1ztSq4g6yV2mDrmWWMokS78/PaMDCwyuzCoQFB5fKD3qVEC2IffF2G2t1IpYMKYsIFX1
	 lG78NtMjIyL3tWW+TeL5+3AVa4Vt6PcJbl1ohJy2AKI3Q3i3L1Ok5AZEg+qhZOTbvcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=AoBZDATp;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71844606A32E;
	Wed, 28 Oct 2026 09:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71844606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=AoBZDATp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=qNIYdo0QTw7MYwq6uSkCBhOdOivMefRpPY
	VKU2rOFlY=; b=AoBZDATpQ7ICR5RCnmVdccKJ+RMGouxmhYT6CFwOt5+6o00M67
	Hrx/0OtI+S8oh+/pRfyhA4mts8+R6rDqQRoHMvyOsGBZWaHSBhJdl/bwWoOGqUHn
	OmCDBArDdxZW5t9IzQwNVtzFSBc3AFW6C4jhLbRqtA5F4PCW6VPVlezrs=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgB36i6cwOFqbQZYAA--.619S8;
	Wed, 28 Oct 2026 17:30:12 +0800 (CST)
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
Subject: [PATCH v2 6/9] media: camss: video: check that a buffer is DMA contiguous and add a prepare hook
Date: Wed, 28 Oct 2026 17:30:00 +0800
Message-ID: <20261028093003.722745-7-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgB36i6cwOFqbQZYAA--.619S8
X-Coremail-Antispam: 1UD129KBjvJXoWxWw1DurWrurWrGF4rGr4rZrb_yoW5XFWkpF
	WrKrW5GFW2qF4UAw4xJw4UuF4aywnYga4UGrW7Zw1Yk3Z5tr13ur45KFyayrW5JryxKF17
	tr4jq3yfuF4YvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmKb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E
	87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j
	6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU4sXoUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2rg+9YyDwBXsU

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

