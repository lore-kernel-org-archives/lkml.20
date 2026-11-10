Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295078;
	b=NwFlrcZrONsq77fHiIoKm0eLvKZxr63b8HWPevSHbsR5dOHJ97/Fl2gMH4ISQ6FGS1ZZ
	 eN5okan3f7ULCvuGriG4GW1kcnaGecvlJiQgCHIVuLo2+zDLbhjkT6vEvnxAJLi7G4hEE
	 IQV3ofXE/wjonf+5oFtThUUz/nSAfdlQW/itk4ja7sihWI/MLVnjXrQIjUBJaKl27IOmV
	 Y4CEBdBA1YNGzftJJsKdXLYX7mMbRZVR7+Rc+AGtM9QOeTmceC0iP6Fil+lWElqJfKr4l
	 KiVPMTyQAf3u8Ojb0cltShYWLHnQWG/g3bqw7sburH8ncMrfo07Htb0Khar7qJlAuNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295078;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Caes/IaS6xY2+2QRAXya3WAfplODfp8FQAxnRRumC70=;
	b=BCn0fbrqNaW3U8Cb+bCE28NAHmXCfWyn4SbqkUjbk4h6b7zpbKEwrIqwxWJPgRo6zUsw
	 5l2eohzyCNndFdSdL25kwT1sg3XDoInwDpa9BEqW//dLji1Ik+zKo0c2s6DJVD6Ulv1gd
	 Soh1N1qzaZqqQhjWmJMxNQW8y8l+JNm+3Y4Zo6x2HfoxTd9KjkOuKZWz+Z6JVwynunUT5
	 qYamOyLiZa99U9sL1Qq4sjLBbS3AKFhYTLazaj/EeooDnBnuGVnPDW1GlmWKNnUUH9rki
	 nDXMBPewhpAvVKZRVFYzemBd5R27MhlEe7Wqb09M+wDa8tcP2l+gza4f/7MO/WgkyKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AX6ZaeWz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015D360A3837;
	Tue, 10 Nov 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AX6ZaeWz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295077;
	b=N4MoWoKVqi6Tv1uPSqy/crhi8l3Usz2gQhjoeUyR6ZsKfqK7fWxGIcF7pmsEn+8sXIcL
	 vjABkaF6bGm7GoD3YYC2feZPhJkwE7KczM1aRzk17CO0i2rodRHcFMczjrYxRjN84hxd2
	 lwRmk8c/0Vt5I2Gtlw5jg9//4XSOwKbg3J5cppBgCMhXjf4QOGkdhLvzpayYgwyo1oqwU
	 xRig26eGGV2DQO66lJc0FLJlwWSv3i1O8MJmW6dbjprlIR289Jx54vbyQypyPUF+Td8M6
	 rhCBr6v69GcPRCmNRG3g9t7spptUdcFeM9FHZxqApNEw8xQ2unWW3Xn9dUuAnI/RRYA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295077;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Caes/IaS6xY2+2QRAXya3WAfplODfp8FQAxnRRumC70=;
	b=bU+Mjwo9A4WWVkQUPQG113IMUTq3q8ToSmaPO/F698BCTRHOBkGY6vp/SfE6In4uZVRX
	 +RIc0cNvywU8HLyZKuf/5laKD6L1NwA8CJzQw3dRxirzfyHfgGpPADZSfJ1KWl1M9Djc7
	 hzAOa0nwMq4Kz6BzblUG7PsJ0jbpU2Agvelsv93qht2Yrje5rYlSOWgIW6dRfx1N46r+v
	 6QmIPbnjDV7l0GzczGaPZB8rCGCzxxM2aOhxBDOpaUPKwp071xg3OLJNflcwWoZlrKxQh
	 0el6C88DdA/tULCCNnBhPgb1KNALR415Msh3cWAu0dxkEYYqahmGK5ZG8FYyqXIZVfQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B89C81F008A7;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295077;
	bh=Caes/IaS6xY2+2QRAXya3WAfplODfp8FQAxnRRumC70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AX6ZaeWztKQGLZyIOFGBbh3rGISdPoCMi8bFI9RidkN+oMjdD8w5gRbjAOwdWo2zn
	 rYGIG8qHWyP+w+GO54e8ju2Dbe6hIxlWfI9MV3gyfjQ3kOuNmCy93E+Uq86GiwEvOC
	 DU00434ag3NR1lgXW7FHqx26A4HPgVfThXCqSiwCLKw4yqv67nAsOp0WpItCsPDxfu
	 ED5IgxnZA66NCiH+E3P3KOT5KvLVy3NVN1nGLqf2nI+eOEM8SWoOTQNPlCKrQMvNNx
	 rUlkj5CwzEfQdBYfMUt858PsEVSN4sVwspxvMT2S8ThBR4wgA4ljlLGOfr2LhxSE0z
	 zJnd8SCMRcWRg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4D8DC48994;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:17:59 +0000
Subject: [PATCH 4/6] media: verisilicon: Report fixed JPEG colorimetry on
 the encoder
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
Message-Id: <20261110-hantro-jpeg-enc-fixes-v1-4-fc4dc7e985d2@gmail.com>
References: <20261110-hantro-jpeg-enc-fixes-v1-0-fc4dc7e985d2@gmail.com>
In-Reply-To: <20261110-hantro-jpeg-enc-fixes-v1-0-fc4dc7e985d2@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295075; l=2043;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Njpmt3ct0L9aPXSUlHIS0gp4XYUJhvc8SGbGxzWUYQo=;
 b=lmJZgJ7veqW9JDTDkJxb2RV+aFAksjw2y5DsqpJeTLf7LCxwNkX/+d6Z0mG2DpTnT2qNtU5BH
 0vkSeFaWXySClTXRgfWxaO6tKABqzcRSaD68e5XqweuPVSZT28paxks
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The driver reports V4L2_COLORSPACE_JPEG with default encoding,
quantization and transfer function on both queues, and lets the
application set any colorimetry, which is then copied to the other
queue. For the JPEG encoder this is wrong on the raw side:
V4L2_COLORSPACE_JPEG is only a shorthand for the colorimetry of the
JPEG data, and the raw frames should describe the actual samples. It
also makes v4l2-compliance fail on the encoder:

  fail: v4l2-test-formats.cpp(892): fmt_raw.g_colorspace() != V4L2_COLORSPACE_SRGB
  test VIDIOC_S_FMT: FAIL

The colorimetry of JPEG is fixed and the hardware doesn't convert the
samples. When the coded format is JPEG, report sRGB primaries and
transfer function with full range BT.601 Y'CbCr on both queues, as the
mediatek and imx JPEG encoders do, and ignore what the application
asks for. Other coded formats keep propagating the colorimetry set by
the application, which they signal in the bitstream.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 731182cde643..2761d37af7cd 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -406,6 +406,19 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 			*sizeimage = max_size;
 	}
 
+	if (ctx->is_encoder && vpu_fmt->codec_mode == HANTRO_MODE_JPEG_ENC) {
+		/*
+		 * The colorimetry of JPEG is fixed: full range BT.601
+		 * Y'CbCr with sRGB primaries and transfer function. The
+		 * hardware doesn't convert the samples, so the raw frames
+		 * must use it too.
+		 */
+		pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
+		pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_601;
+		pix_mp->xfer_func = V4L2_XFER_FUNC_SRGB;
+		pix_mp->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	}
+
 	return 0;
 }
 

-- 
2.55.0


