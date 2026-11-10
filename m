Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295111;
	b=34KUdtjvMCtWwxXcnwGgHTb2CafA7Kc94d8hGwM+48kFCvcYBmjv0dJXTaPsJPntvmiE
	 YzTJSPUu+ugE/sDTV0feCY4Ymx4pB7Zg1n5EExulp74UbEeoYnZ+pUs7gAxKSUmcq7k4r
	 znLxB+reJbb2m2H4N8XqTMnqMsm0BxkUYGwaTi0MhMFINUfTXz3ZvYZutasBEkcuWobs5
	 P0gJBUxx+q4HQDq9C/hgi9hxJDwYjiqzm01/Ql9nfbk46N+bB0hAFpKoM8mkuCTl1zrkP
	 CyXZx2IEXbfBYDKphORMRN1CefqzUyNKNXC9Zwmv958z8R8IHj//BqWVaesN53/xLkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295111;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CXcWjb7Nzc+RNDNk2ZDTJ59JBkPVPgLcutR3s53+teE=;
	b=kqG6bBrmBVEKk/m0UsjGerXaFqDXIEbuPI0Pho/kW4ucCLOpNC9iXJgRl8GXBsdvViM4
	 /Cr14y5f65bv5twq6UrXGcOTi41S51JF/G9zJ/pZo+Y1XPJztVV6tS1tnpcT3o6lD1sRz
	 URHMt9NvtP5mgGGXOePe9iWaL9rtXGyo+kfRdpWppqkvh4VRaCt5m3dAqfDKULR5cO2Ni
	 epOwMKGjCrYUttNLbouUiiJM4kN+d8DxWzX6xw2Ei/gmg2n0hqTI0gEYXQ3pC9uuYQNFU
	 gSm5r1qxoXJugJbjU8hVuLtYWpDHSG7EGWnTxcv6WQFkIgOPXI9i7Jp6svi4lpXGvwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ennfD2TT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968DD606D63C;
	Tue, 10 Nov 2026 07:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ennfD2TT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295111;
	b=c3bwBFdvJihoE3uK253J/ZgYQHs13MDojSWvLIKs3wQ1VAUMyvapUAag9VN39HJTFsRt
	 DD15aGd1xvpJCX9nCGuzCtdNFz1qmEH6fGeQXl/f/dof9qMjoFRcVIGuHODJKM1488ft0
	 FNpD+HkG0qs26U6UsOMOYFbo35lbMVZvK88wwdlntfn/go1ZRa85DdE05TMCBC+o6jU6P
	 8EaMj15I0hDPGmhk6+Og1f1jID+e2GV+9lFNj/RKhiJcUkswnJh97+u30S+saqnAcFHFj
	 KR0w/DevEJ8fLfJsendZH1QX2RnYiL+bX9567+FPXhh9FKjo5n8nWtW6aTPXw7HXkZg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295111;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CXcWjb7Nzc+RNDNk2ZDTJ59JBkPVPgLcutR3s53+teE=;
	b=Fqpm0Wg4NbrFSmmEspeThQfoW62o5veiUdKWS9U3W1LM3mYiAoPfZKM3AbeuhXBEFXB+
	 ABLKBtxf3/uzK/yqK03ue2fy6I1CUhM/wro1bKjfJC88gkNrVruZhvZ/2kahXMwPlTodL
	 IRewTYn+6n2aLeuNWz7qWjbfAM0QXXXlP8Qix1fqTX1RQAjk1n5To0k59dN671dYHS2o3
	 XDEaCekpr4w2yNwdOVButwJIRg7XTcinqG3oL5GZHZgGv1EH5UbGvyswe8BjJLIoloNog
	 ALQH0l0PDCiGhXyECmj40B1FEGz4KbkZna+yxxut4sff6QjwGZBUFq+cTpv/HDRJYLQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D55871F00930;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295111;
	bh=CXcWjb7Nzc+RNDNk2ZDTJ59JBkPVPgLcutR3s53+teE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ennfD2TTAsOfpeAlqcSaIQwU/x56IET8kytZAIprxiDaX11qufathM7zeLyymBjfx
	 zPmsDHE0Mzg8ABWqvqPbWqo+g7I2hYsXejl0+8hNMADCMVOGrwBurwJjA2O/aY9CYD
	 BOmVx2eWxbgVrbpDKKoG5Yiw5rtz573/VYrx1OisTn8+KXqvbS33OiuTuLmub1Ms8F
	 UelErpSYwZ81kai6J/Xbm3foGQ03QZ/3rDtELDMN9wv7pOAy3F/EZK4EU4vi0C2BJg
	 Ff+XBB11mlSqlYsdPzNyRXxfJCw4prfzcBxSc4CzStKHrped9MD1L4ChHtcrREHdD8
	 FXATjt1hTGBQA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 69174489AD;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:30 +0000
Subject: [PATCH 1/2] media: rkvdec: vdpu381: Compress the co-located motion
 vectors of H.264
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
Message-Id: <20261110-rkvdec-colmv-v1-1-012b84ea43f7@gmail.com>
References: <20261110-rkvdec-colmv-v1-0-012b84ea43f7@gmail.com>
In-Reply-To: <20261110-rkvdec-colmv-v1-0-012b84ea43f7@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295110; l=4313;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ybXnDgp5I8D2JJsP+6qloNGqCzU5IJqFRabb2XdAB/Y=;
 b=HaXOWx//OEJFbzyvP1ryFMhNtoiX9Vl9j4SpdcMcbIXsZVkjTKblV4ft4iZDUIWhKlkZfVL8g
 r7a8M1zPurnDz3MSOd9OlUMaQ5ZmLQqgXZBtyrM4c2dWQNi5YLlegx/
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The VDPU381 can store the co-located motion vectors of a frame
compressed (reg012 colmv_compress_en). The vendor code (MPP,
hal_h264d_vdpu34x.c) enables it for H.264 streams without field
pictures or MBAFF, and for HEVC. Mainline never does.

B-frames are what limits H.264 decoding at 4K: the core is 99% busy,
and a B-frame of a 48 Mbit/s 4K stream takes 16 ms of hardware time
against 10.8 ms for a P-frame and 7.0 ms for an I-frame. Storing the
motion vectors compressed cuts that memory traffic. Decoding the same
240 frames to fakevideosink on RK3588 goes from 65.4 to 68.4 fps at
3840x2160 (+4.7%) and from 214 to 234 fps at 1920x1080 (+9%). The
decoded frames are identical (same checksum for all 240 frames, and
bit-exact with FFmpeg).

The compressed layout is made of 64x16-pixel segments, each with a
header and up to 1 KiB of payload. How much of that is used depends on
the content and can exceed the uncompressed layout: the hardware wrote
up to 556128 bytes compressed against 522240 uncompressed for the
motion vectors of a 4K HEVC stream. So reserve what the vendor code
reserves for the compressed layout on VDPU381, which is twice the
current 128 bytes per macroblock: 8.3 MB instead of 4.1 MB per 4K
CAPTURE buffer.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 10 ++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c        | 18 +++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
index b961fddc8583..06d83a6ed617 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
@@ -237,6 +237,16 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	regs->common.reg011_important_en.dec_timeout_e = 1;
 	regs->common.reg011_important_en.pix_range_det_e = 1;
 
+	/*
+	 * Store the co-located motion vectors compressed, as the vendor code
+	 * does for frame-only streams. This cuts the memory traffic of
+	 * B-frames and the hardware time of 4K streams by about 5%. The
+	 * compressed data fits the space reserved for the uncompressed
+	 * layout. Field and MBAFF streams use the uncompressed layout.
+	 */
+	regs->common.reg012_secondary_en.colmv_compress_en =
+		!!(run->sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY);
+
 	/*
 	 * Even though the scan list address can be set in RPS,
 	 * with some frames, it will try to use the address set in the register.
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index fbcd0f175ad3..5f7e876da6eb 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
@@ -93,6 +94,21 @@ static u32 rkvdec_colmv_size(u16 width, u16 height)
 	return 128 * DIV_ROUND_UP(width, 16) * DIV_ROUND_UP(height, 16);
 }
 
+/*
+ * The VDPU381 stores co-located motion vectors compressed, in segments of
+ * 64x16 pixels, with a segment header (rows padded to 16 headers)
+ * and up to 1 KiB of payload. That's the bound the vendor code allocates;
+ * how much is used depends on the content, and can be more than the
+ * uncompressed layout of rkvdec_colmv_size() takes.
+ */
+static u32 vdpu381_colmv_size(u16 width, u16 height)
+{
+	u32 seg_w = DIV_ROUND_UP(width, 64);
+	u32 seg_h = DIV_ROUND_UP(height, 16);
+
+	return ALIGN(ALIGN(seg_w, 16) * seg_h + seg_w * seg_h * SZ_1K, 128);
+}
+
 static u32 vdpu383_colmv_size(u16 width, u16 height)
 {
 	return ALIGN(width, 64) * ALIGN(height, 16);
@@ -1700,7 +1716,7 @@ static const struct rcb_size_info vdpu381_rcb_sizes[] = {
 
 static const struct rkvdec_variant_ops vdpu381_variant_ops = {
 	.irq_handler = vdpu381_irq_handler,
-	.colmv_size = rkvdec_colmv_size,
+	.colmv_size = vdpu381_colmv_size,
 	.flatten_matrices = transpose_and_flatten_matrices,
 };
 

-- 
2.55.0


