Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277079;
	b=OMHFB/yBiJhrCi0wd4r2wc0L7v535li3G3BA7B0VKNv1vSSp4UfTT4na+he6wEtvA+yw
	 J9lPklYI+oz03klTxQyAwLHiQIlfoKxulFbyF+h8WlokgTy1OS5C2z64ld+vyQpCXi/4C
	 gKz3qbU5BPhMykHTS3ygKmBT+sccufv9uOppyxE6fVRXa3Jv+YEjP/q61GLLmtUkAHQe+
	 z/avEPhM2eCD0Cwj82fhfYxDt38MVTS0temo7subBvP5w9McA1s6y8hx2w3Vi/0a+s8i4
	 8Pw67DT+7h6lAHrl5J0V4jU+v5AIExKLDImkA/4w2CpSkTnD5FT7TPYf3z6Aok05XGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277079;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=mk05Lf2I0c98enmRoCjuut0VyebFsjmfEeLgAeFNTsw=;
	b=XIrTAS7sLNVsdo9ej4L2fW2F1s4uvU8pETo+nXyG+JMPDGFmzSUpKBx1eE9ptotT/f7Y
	 ll17azIyE0cL62v0NLeyWIjnWYXRr7gJ1KFabN1Bne6LwiWJOVC4a0juf4IBfXClUfpuh
	 sHXSXZEVou65XsN5fsPgvl0wPcqZmvP40Wqsi3Q8URDpAS9QypnwxOkCPx4oY2NSau5DC
	 ZRFcmBfKLnrRSclJES2ung7BB0VGeXdCpH/OdGnupJqk9RSnnDytuo9zI8UJstDTRMp4j
	 EFRpjPB4R0/ifMbg8Stf4a2P9QbvpfzPhskKE1+IKhkxb1b6MPCC3RjKcrzYuh9ZO/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=DPkmxzXf;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7079B606A31F;
	Thu, 29 Oct 2026 12:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7079B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=DPkmxzXf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=mk05Lf2I0c98enmRoCjuut0VyebFsjmfEe
	LgAeFNTsw=; b=DPkmxzXfSOlEkvZFA+Cvcjxqagz+U4ltx5HjIDK/RABqFr7Dpk
	kdz7xe14r+941/pN6wf7jLjTHT32JSxlX29daiMunO48nIG8DBkL08NaVq1CkHWF
	wJWsMPKiYnaJxzoQAUIMVw3hfb7p5p9myYZcPY3TdqhZpY3iY0wlZTHtc=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.224.240])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3OD2LPONqnPVgAA--.841S4;
	Thu, 29 Oct 2026 20:31:09 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: camss: video: check that a buffer is DMA contiguous and add a prepare hook
Date: Thu, 29 Oct 2026 20:31:06 +0800
Message-ID: <20261029123107.28705-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgC3OD2LPONqnPVgAA--.841S4
X-Coremail-Antispam: 1UD129KBjvJXoWxWw1DurWrurWrGF4rGr4rZrb_yoW5Xw1rpF
	WrKrW5GFWjqF4UAw4xJw4UuF4aywnYqay8GrW7Zw1Yk3Z5tr13ur45KFyayrW5JryxKF17
	tr4jq3yfuF4YvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK67AK6ryUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0TS
	oPUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREPB2riTVZTsQBNsk

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
index 0852eb6f13..027cf024f9 100644
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
index d3e56e240a..af046ecb7f 100644
--- a/drivers/media/platform/qcom/camss/camss-video.h
+++ b/drivers/media/platform/qcom/camss/camss-video.h
@@ -28,6 +28,7 @@ struct camss_buffer {
 struct camss_video;
 
 struct camss_video_ops {
+	int (*prepare_buffer)(struct camss_video *vid, struct vb2_buffer *vb);
 	int (*queue_buffer)(struct camss_video *vid, struct camss_buffer *buf);
 	int (*flush_buffers)(struct camss_video *vid,
 			     enum vb2_buffer_state state);

