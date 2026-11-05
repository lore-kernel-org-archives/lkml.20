Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921020;
	b=yzYO8BmOimTogU4Y8+dj8lB0WZ8tschQvfS+LJ2nFdXdv+Petv47h+IAZwC0+pybo2yW
	 ClaVa139LzdnEeU9zysNRbB0/Tbotob4qfz2T1lRYNzDNgAqZgFeIBGWwKLDmUFM2nD0N
	 7KFZzOib1+OslAk7GS5wbJiqM1jagO3II5uP9VXDLQw9MI0mlE0KabX/VfUYYuxXQ3nOk
	 kCzEYUW+oiGSRfwzgY0ckN3QL+0ob4BF8uH2NA36qQqaYSqT+sx8IYyS5C0Na7mEdjt9d
	 LWGlNlvReBIQX6SHAYzdzvDTwFMi/JFIk8VXn1c0Kc+qnjew9MPrUOOrL2A+CrYd76Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0qFTCorgq4hyV4vVhWj25+4lzr8cjg0FBjQeaIcgYqM=;
	b=lpf0FETFFZYcWj0w0E36TWQQlhjxoc3EflvnW37ZdUE2w+VkdfcaYvvwEdKVWam5c0z8
	 SgrHhmRDKvFrDPmVdbl2eOfS5zEV9Qmfcv84yeUNSBeeEbrNbAzYnu4/J40GeB5e8uMbM
	 gmcp4/UaPV/oM6DQwxCjh6yt6YOwT7P5+E39D+iwMkLZQGZiKJtLBfcZ7PdyObB3Rcdlm
	 26NrxIrrBcDUFKQZtjmPzc/hIxVEX/PXZfbeRJH+u+CcqnSPw14SABPtCuaJkn96wIDv8
	 Hl2GEBTkJkm2EtFG9WIN5Oxr2IgmDq+TXhuDtAH5U5DigOvWp5rbkpwz0l4X86ALcQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sX8Tbkcj;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9316B606D80B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9316B606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sX8Tbkcj
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b094fb376cso13795a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793921020; x=1794525820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qFTCorgq4hyV4vVhWj25+4lzr8cjg0FBjQeaIcgYqM=;
        b=sX8TbkcjIbg5pBG9QmdTkyQoFAcjyDPvqz0SpIxx26QWz4ibtoohYmn5J1gFhH2wxu
         jqkrGnIlsOORzCokFtv0Ra421QgmjEr9rbWJUSLchco5bMiGFMtClfkr0MrA/6GR7BY9
         YoPhTft8t+ttP8tR3M7eaqDZRBhNhVxCfW/HP3kmDNh1GtwjRlUA4Dl3KngWJSKjorO/
         /bgdRWjzMXjTuu8DuK56L1Apq9OgQVlfby4Q2YiH1Lnr2zCPU0gSFA4rhvlMcy7i5D+C
         SHCKD4wakUHIHUXYxDVpx7P4mzIwq/SPsFw71MPC918jUG9WPCA+eIjwKnWWmSjhOvRJ
         tx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921020; x=1794525820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qFTCorgq4hyV4vVhWj25+4lzr8cjg0FBjQeaIcgYqM=;
        b=jRfg8AI4n50qzFu4pTgmea5gBnTlTJdlCNhsJ7YDGHmBXk6G6/dnSGBsDwfaPWU/z0
         wuc0biyVFfOrikqdaxW2/JC4gCBFc8uVPu6NYLaQC3UnMzBdJWlg/13fz3WHvH9N5j63
         ToFzgegvd61x8ATdQHggIT8yLcSv65jVooh9QpY51BgQ/TlZXiZyJdLHBlUjq6yiyepu
         wTC4+UlVkjVcXRn2gU0AZcmXMW3ZsjjPFf5nDqL1wxCvTMqUrDW3I3my3GjbJYUWiCCh
         KXA5kvFmNWUMtENNBgUB0BJEk635sT3RyJGE5sdE5ZD67uDaJ7DxP8/lUDCwbrI9dVGq
         RVvA==
X-Forwarded-Encrypted: i=1; AKwUvBw44sr1Wg8CA6h3ATVjglWdcuFVfpMnp20Wm29KpYfXHNq0StVFv2drnQk4Ejp2M1YiYwvBIJOG3ebVcYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gXWU5SOBIScE8D/7lx1MDQk1c/EXa0FAQ9SwbhQ03Gh0ZFZKw
	/aQsSLsk0k9bwouwNbsBu0fWFoHZlkjiHCT1x0vp+esyP3ZMn8KpEByZ
X-Gm-Gg: AYBFou2yssKEirhaE2z/mqAsOJWMItQ14bNrdrQI4kSJ00Iucs3DLYZi4HvzSbOFobn
	TGx3zB2Aj97a89Lxt8ZF0OSo23pv0JVsiLrKIaLFi3/YBCVjsk+3x2AGekeEpakWacpV7aX3eq6
	80hK9zAZlWZL3y1sjtyjdVkrSjqhJ3ccf8R9ayz4emLHxBXFOrk6lRJWYe1I1jJ8vOej3TP/KBv
	7ZxnzN//NysHserlc2Q3XiwGFbRrJiqr+en3wbgTJW82X6uCQyph7X4QJ/oBpMtf2nVlCzZg84M
	5hZ+HNeiDFj2x1EW4qFb5QTxlR7VVnf/ovToutG7UIDTKWi0p24gMV9NK2KFqUB2VUSnjbYMCyS
	KbkqPjOvM4KbiU0PHe3y9zqrbL0UgfVbJW3YCxiE/iczrYt+z06NN+rMwstjtXJt64egPb1Plap
	UYG5ynTGIKlPOecyVBO/htAfSBELf+l/cq8Ln00uw6hiXQaisKazwbHuzHeOtoAf3THu1XkMPT7
	5iFQ6s67Qmo51GDskou6YyyGupq+muO2SmrUXEtWbedKdtTeHyOx5uML4dFoAqST2n+UIa6frtM
	80aAb3D1t9FHBOhbJsQTvyslDqkXj2pkRoY42gmD8Kkh44KVFoAaeAn9yxBYTg==
X-Received: by 2002:a17:90b:1e4f:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3b0db62690dmr1018448a91.2.1793921019958;
        Thu, 05 Nov 2026 15:23:39 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:f564:53e0:ae9d:9600])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5317297a91.3.2026.11.05.15.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:23:39 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 2/2] media: rockchip: rkcif: Honour the requested bytesperline on MIPI
Date: Thu,  5 Nov 2026 16:23:10 -0700
Message-ID: <20261105232310.385463-3-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105232310.385463-1-faizel.kb@gmail.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
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

The MIPI DMA uses bytesperline as the line stride, which must be a
multiple of 8 bytes, but v4l2_fill_pixfmt_mp() doesn't align it.
Any larger bytesperline requested by userspace is also replaced with
the minimum.

Align bytesperline to 8 bytes and honour a larger requested value, up
to the limit of the line width register. This allows DMA-BUF importers
that need a larger stride alignment to use the buffers directly.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../platform/rockchip/rkcif/rkcif-stream.c    | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index f2a24832a8cf..e50f20e40f7a 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -23,6 +23,7 @@
 #define CIF_MIN_HEIGHT	 64
 #define CIF_MAX_WIDTH	 8192
 #define CIF_MAX_HEIGHT	 8192
+#define CIF_MAX_BYTESPERLINE 0xffff8 /* VLW: 20 bits, 8-byte aligned */
 
 static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
 {
@@ -334,20 +335,39 @@ static const struct vb2_ops rkcif_stream_vb2_ops = {
 	.stop_streaming = rkcif_stream_stop_streaming,
 };
 
+static void rkcif_stream_set_bytesperline(struct v4l2_pix_format_mplane *pix,
+					  u32 req_bpl)
+{
+	u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);
+	u32 max_bpl = min_t(u32, CIF_MAX_BYTESPERLINE,
+			    ALIGN_DOWN(U32_MAX / pix->height, 8));
+	u32 bpl = min_bpl;
+
+	if (req_bpl > min_bpl && req_bpl <= max_bpl)
+		bpl = ALIGN(req_bpl, 8);
+
+	pix->plane_fmt[0].bytesperline = bpl;
+	pix->plane_fmt[0].sizeimage = bpl * pix->height;
+}
+
 static int rkcif_stream_fill_format(struct rkcif_stream *stream,
 				    struct v4l2_pix_format_mplane *pix)
 {
 	const struct rkcif_output_fmt *fmt;
-	u32 height, width;
+	u32 height, width, req_bpl;
 	int ret;
 
 	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
 	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
 	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
+	req_bpl = pix->plane_fmt[0].bytesperline;
 	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
 	if (ret)
 		return ret;
 
+	if (stream->interface->type == RKCIF_IF_MIPI)
+		rkcif_stream_set_bytesperline(pix, req_bpl);
+
 	pix->field = V4L2_FIELD_NONE;
 
 	return 0;
-- 
2.43.0

