Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472286;
	b=3tpOm7w3zFdeZhmB2W5IAxj0IT4wwI0EpTM2Wxx5Wgv2oOvgppmCDcTsuM1C68ks+klv
	 D0ANYbM3mbuAJcCNKu6txfVACpCFXDNYVJNzIWkyKxJDz/C/EF2mgon+Jswnk20MoWvjW
	 TcBSaVFSHh7A9rFSTaVzzHDe4JE6yddT4glLRFHHdks4JWcwCHAOy/a7BrEQ+bwHnuV6j
	 o9I6DHTnuOOMgiE/bcpjLQlfng62m3LHRhHDwlTJ2gtW6kZA7SZDFHdTWpl3UZwWiWAlr
	 AwHL5Z8y6rBHTn8TnXmeXv7VPPSYLiKtbMNj6OTrwdn3ZZXXQg/poo5wIV6D9H9Achw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472286;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=neMlK9Z6eTz+hf+fCLBkmd2cOyVT/RilZmzIenNn1Bs=;
	b=25/vduCX1xAoysGLtDLgCGkQwmf2uqfVeVwzEBeMC3lTPLbm8vMvrrUrp7sunfWsR0Pf
	 j1z7IWQrIoa6oL9BvTeO1E9vkqYbhq26r7J/l1iFZcyNBJu0xfYDmEyaUT2q33w7/0nKv
	 NO+dWmZcODKmuyLMzm1ahiPkVTj8ToAv87bCP+uM08BIMx2komXibwRI4ZzA0Ubcb1yfJ
	 bmQhS2/SuiG0O3hfkLVuP6DDUNi3qBAcQ481+Ua/WsOGx1byyrr010M62uC8Y+Xzx3KxA
	 kLEB4MHqoQXdlE/JSHdv4GxQatMHCF6MmUp5U/7eMy+RjxGa1DWIx7C0bHBPJOmfnng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5hWd56C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECF060A382D;
	Thu, 12 Nov 2026 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5hWd56C
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472286;
	b=kkfRLrGjBAKaS/RAszN6zCUciGzFp4xmVGeXPFN+isz7jMEN9cEv+ySwKdg+ULxDyoSZ
	 2He9j7MloD4PGkcJopXFUZonaF4Rhi8KAYAjgA3iGwfyEjlLsMx22lq/fir8Tl0gletgn
	 qV6hKthhGJtYsIgC5hZsg4TkwjzUL4ypLFpk6pf68FnpxnYmDOwrfr2/TGuCTNfsAtivG
	 CjQYc4W488mmIn1qHEOwmu+cS3Wth5s8xoDGb3PJv2lmmHEuzMR+JNUYwKE9oywu52SzW
	 b7WGrpmW6MJ6lVdTXDRP5SwxzxTH6qXKgJQVsU/7xyDWsf67R/WFtj38l/emAGkIQww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472286;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=neMlK9Z6eTz+hf+fCLBkmd2cOyVT/RilZmzIenNn1Bs=;
	b=pGaAyZcTcxwwx9OOH843GQkNka8Y1F6JJO6mk2LkUHrR/EzR10MqPd2ICrFhmrGMMl4B
	 JNU1rgU62WF+Rh8vTdV4yxllwSsnnInInfODGcw+hEwhrHPgDV3dBnqddDteSlS2TsXb1
	 olHNlPJ5cdFZYuQCWrp/RTiveChveHbVPEkZIeVgbh+N+w3tGzqt0/tlCK1j1ATq+2a45
	 SU0KSlG/96gTyk8dLqGj5vFKVuNS2KDDBxtoJZuBKDEuM2vpcrF5DhPMLjcVQbWcBsb/P
	 jxW52nsc6v73hjlaV4Yc264PZ0IxZpxaN/EdXIQA0HsdjcYiKKiGhcrA6oL2F6totKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50B1F1F00A0A;
	Thu, 12 Nov 2026 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472286;
	bh=neMlK9Z6eTz+hf+fCLBkmd2cOyVT/RilZmzIenNn1Bs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F5hWd56C/v8+kpeD0Zxj+5cO9bdCor1RP+WBWNhotztzXhaQn4sPN2VpWhOUJAAdi
	 eMtONbYKR41dgbgbRAxYBqvO0hivxJLMY+DixDxKl/WfmJGRalPkMaGNEwZB4ZfeoE
	 tFvvpKGUpVmznF488O6HJ8kuHjkP65uwqshzZ3NdZjGlhpGuUdp6+LG6O3KgZLXQhz
	 IuL9jtl17OrBFZGloXv0I4UcD4kQXXKOCVsVGcK7GPSavYOScq5KEHmsvHxoCiF/7h
	 6TrEUhfREXS310/uI2HhtzwlNeNaxiFMtSMSPAby3fCYgL1ceudmNBVLMSVgy++gbm
	 VARW3gx9UjXYw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CAB384939E;
	Thu, 12 Nov 2026 08:31:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:31:27 +0000
Subject: [PATCH v2 5/7] media: verisilicon: Report fixed JPEG colorimetry
 on the encoder
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
Message-Id: <20261112-hantro-jpeg-enc-fixes-v2-5-de03e643c75d@gmail.com>
References: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
In-Reply-To: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472282; l=2111;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=dW1xQ1Zr6XL+3vHUKMQ8oWmlRSpRnhxHyYsz+ElKKng=;
 b=ARLde18cUknam43N+kKWwE7VQ17UocMjTtpTYTF6LGnt4ktlauTG6kkqbeIs3zv3yylRfn2lk
 dQYOGgCYwMzDoXqPGcFqiC3w3ng1+1Mvm9LsaE1TbtfvkR6jmh//+ib
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
mtk-jpeg and imx-jpeg drivers do, and ignore what the application asks
for. Other coded formats keep propagating the colorimetry set by
the application, which they signal in the bitstream.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index e9d91504fab2..11bce0cdf4b3 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -407,6 +407,19 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
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


