Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246682;
	b=MXbKG2zD+XwBNGgPgFly3Px3vsWYUVjoVcveI4I0sUnOK6SJ46Dhg8a6/UQO3Znco8eE
	 y+pMXMg4HJ26faplon3e2wekIZdsZGG0Cbsx6FLrCjnK3q7+wpnJPacMXGDpTkXrePzaP
	 P/ItuO0o9xPNBTRV+l/EsO47AsJTQAGW6NKPaHUJiYzBkXjx8yDIZaMyBXLEr4PJeLn9J
	 k+7Der1kTZWYgfNmrvcQPms2MxZjAeH8HIstPB9LI+imNIeEvW/bhQ02gT3bbsSc91NIZ
	 NHMxTvgasxBjnO52LZfxHuhupU9Dm7R4UMDRLSlVXowLPaHtzLjJP9l59KY+m6Lh9pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
	b=gM4CanfX4kt3pfNu9g/gR1S2oG3hrtnynpwn/Zl/tIPtsPEeiXCJ9wHtUyvH9mF7XBpS
	 5z1JxOLHVPEFT89A8rWi6McwBgLeOhmy+Qx8xi163+ijOr8hHSOVLFAoLAFlnQy1mtUqT
	 oVCjfZz7azb9V7qrM4KihrGyRduODkvVAlgv8QPyOvgVM31TBXtThJkr6N6DxJaNNyAeH
	 YZ/OZHaFQiG6AXV3Ox2gVfjPVEaq56NDmNj8zdmY/sWp9DcqOLtYbMLQ/GqHxpMtTFLwh
	 mkpyIFcnf7pGp3R+T6qRalQZzpZKg9rJR6wTwVkIGbAJHzlaQ6X4Mt9GF2YOHNQA4ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIR7x9js;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFFA606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AFFA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIR7x9js
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491971ac844so1146607f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246680; x=1794851480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
        b=MIR7x9jsZbvSKHoqQfKVnSWZ3C0kE+PpJzOdDAnp5J7fSXjZB1hgmXU9bX8kRV76dW
         sxy9Qbv2Y8JJM0gZsw1+oenbYOv+fw8jnDe4Z2BWp3BWFc+ea4azmzevH5vm9X0qEx9m
         gFMW46Lna+i6s01Ht6AkxXBoAUtQom8BHfuv46Hl/dSgv3iErhtC57wuSxYskpHZfvkq
         XGBXmnHnI8hbjCZgpCeaH5C4NANI2esmMrHSvW27zQyqp+wr1V7mlgYe8F523/YaIv0c
         AzWEyk4osCG65QBag+Gx2B90v6vxN1mpMzXMxi4fImmV6b1JG3OsmpExjPr3GQrK9Q2Y
         FAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246680; x=1794851480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
        b=ZHubQOGeysJdf+5l4THFvqgnkw630/8wQJiLs6bPbdw6NqL/ZIFeMqXcp2w6dusOaj
         NcgIPwAVXC3SB8YUGiJqNlM9a7/tG2BP1+AUIztQtJ2f0LYs2VYJroiz52HxZyrJ0RNA
         jrnW+YhwzkdAhZzoCayW34HcDixa5hc7bsYNRtgAiLoPOWZR4ntx9As8O3mdrRdmEIJ9
         clp3O9jAPashEFchHMNOyNu1BBw8nNQ36Z+iUFPsyXlRFOvqtoZqu/cAaPyqdUC9CEQy
         lDd/Mq9fRQBAo51snu0ySQdH9xyAwetBNsmL68aN9jblIIajpjwPqSjWrQZI3TIPLuQn
         XDiw==
X-Forwarded-Encrypted: i=1; AL+hErELERdlJN9NNIeYXUFkMz+NQ0blcOTXLdEGgCNqnm2zGqpyWIAaJmOoSrdlhcRbhIHKQ+OoXruNbHH2O5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oPVbepHZsQEr6REs9WnfJ+xEcp/MVy6zTyKhbxECSokBWMnSa
	vZ/+0KLjrlbUMZ89HC6GLpOIMBNO2TlknE3RRHv0ZCxwqKRF5AOFMy7f
X-Gm-Gg: AYBFou2pBP4LrMS5m/b3y6wzvTMT34g+w2YDA2KJlm7ohvrOPm0ed+F0+lhoEm/3k61
	a7znYsXTf86MQaEtOsRc8eoWvq2ehdz5uudxI+Ag6MAn3LWTKy98hyyTBM6tCIH0uT2EpXQyrM0
	tEnThoN0TJubGvIjOGIic1caw2OGbouuSsVjh7dTPvPOUheg5Pl660FhtP3XQhhLtwcAAFgSAyT
	AmAnpVR8Zup15k6pxiYIBd/CdEuAhIz0bVTQIsafPmO7xWseTpyRUZXXpLqkDdIlPyOwbeOe5wF
	qYmwRrTHGHliMKiANPWQxwyqZ+/5cwN6bg3UH8rMl96AWcYFeobM49VcyJsgEFK8tStgqRaEDZF
	c5tDA7tFqxSXr66x59ssiBQ3kiWo6OOL6mK9evndPWXQRHr0DEXTIq6e53DV6umRzOnvgPinmXA
	ZLfPW9zgQJSdgqUvzBAgBrGRJNYst9+52LvJn1X8ZsVvHaGuOEnfypXhg/oDH9l0DzyF2K4WA9x
	5xTlIJxQw1Og0U9Rc4p3MXZPdUlZhNELYXz8h4sUandwvyMie1aOc6vmGmTB0RDZGRKRMbTXyLF
	L5Rvkv5DgT6KTK0vq2yeMAwDvrc3Tl1C7MEhRzJWGr6WMaWjlwvD2nW6TSJj3TI+tV2AhP6wKza
	FPDEAU5dqJ5H6zuxg0LCB+1o/imepGGSEvSjzrtME/in92pycLcQ5bkM4dtxB8BYuJS9LW5QwQs
	jP/O4Lgo6/h3wYM3Qp6vBJyFl0kQsg0fCgMdOHuUrO8fG1fgDNZja6SVYqEJKSDdCUmln/i1pKI
	srLmxWGy0H9blNqmfV40aZOUq4NKeK5k6qrpEecfaIk4ozpQ1M=
X-Received: by 2002:a05:6000:469a:b0:48e:fdd:41d9 with SMTP id ffacd0b85a97d-4982f968989mr173933f8f.31.1794246680224;
        Mon, 09 Nov 2026 09:51:20 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:19 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 11/11] staging: media: cedrus: vp8: support frames wider than 2048 pixels
Date: Mon,  9 Nov 2026 18:50:16 +0100
Message-ID: <20261109175016.42061-12-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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

Above 2048 pixels, the deblocking and intra prediction row buffers don't
fit into the internal SRAM anymore. Put them into DRAM like H.264 does.
The vendor library sizes the deblocking buffer as 24 bytes per column.

The buffer sizes also tell whether the buffers are in use. Set them only
once both buffers are allocated, and clear them first, as the codec data
is shared with the other codecs.

Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
bit-exact with the FFmpeg software decoder.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 67 +++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 78efd3938c77..e26bbbf2e55d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -156,6 +156,13 @@ struct cedrus_ctx {
 
 			u8		*entropy_probs_buf;
 			dma_addr_t	entropy_probs_buf_dma;
+
+			void		*deblk_buf;
+			dma_addr_t	deblk_buf_dma;
+			ssize_t		deblk_buf_size;
+			void		*intra_pred_buf;
+			dma_addr_t	intra_pred_buf_dma;
+			ssize_t		intra_pred_buf_size;
 		} vp8;
 	} codec;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 84bf18fd231d..bb32232d37ff 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -669,6 +669,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
 
+	if (ctx->codec.vp8.deblk_buf_size) {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_MIXED_RAM |
+			     VE_BUF_CTRL_DBLK_MIXED_RAM);
+		cedrus_write(dev, VE_DBLK_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.deblk_buf_dma);
+		cedrus_write(dev, VE_INTRAPRED_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.intra_pred_buf_dma);
+	} else {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_INT_SRAM |
+			     VE_BUF_CTRL_DBLK_INT_SRAM);
+	}
+
 	cedrus_vp8_update_probs(slice, ctx->codec.vp8.entropy_probs_buf);
 
 	reg = slice->first_part_size * 8;
@@ -837,6 +851,11 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
+	unsigned int deblk_size, intra_pred_size;
+
+	/* The codec data is shared with the other codecs. */
+	ctx->codec.vp8.deblk_buf_size = 0;
+	ctx->codec.vp8.intra_pred_buf_size = 0;
 
 	ctx->codec.vp8.entropy_probs_buf =
 		dma_alloc_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
@@ -852,7 +871,42 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
 	       prob_table_init, sizeof(prob_table_init));
 
+	/*
+	 * Above 2048 pixels the deblocking and intra prediction row buffers
+	 * no longer fit into the internal SRAM. The vendor library sizes the
+	 * deblocking buffer as 24 bytes per (32 aligned) column.
+	 */
+	if (ctx->src_fmt.width > 2048) {
+		deblk_size = ALIGN(ctx->src_fmt.width, 32) * 24;
+		ctx->codec.vp8.deblk_buf =
+			dma_alloc_attrs(dev->dev, deblk_size,
+					&ctx->codec.vp8.deblk_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.deblk_buf)
+			goto err_probs;
+
+		intra_pred_size = ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
+		ctx->codec.vp8.intra_pred_buf =
+			dma_alloc_attrs(dev->dev, intra_pred_size,
+					&ctx->codec.vp8.intra_pred_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.intra_pred_buf)
+			goto err_deblk;
+
+		ctx->codec.vp8.deblk_buf_size = deblk_size;
+		ctx->codec.vp8.intra_pred_buf_size = intra_pred_size;
+	}
+
 	return 0;
+
+err_deblk:
+	dma_free_attrs(dev->dev, deblk_size, ctx->codec.vp8.deblk_buf,
+		       ctx->codec.vp8.deblk_buf_dma, DMA_ATTR_NO_KERNEL_MAPPING);
+err_probs:
+	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
+			  ctx->codec.vp8.entropy_probs_buf,
+			  ctx->codec.vp8.entropy_probs_buf_dma);
+	return -ENOMEM;
 }
 
 static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
@@ -864,6 +918,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
 	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
 			  ctx->codec.vp8.entropy_probs_buf,
 			  ctx->codec.vp8.entropy_probs_buf_dma);
+
+	if (ctx->codec.vp8.deblk_buf_size) {
+		dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+			       ctx->codec.vp8.deblk_buf,
+			       ctx->codec.vp8.deblk_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		dma_free_attrs(dev->dev, ctx->codec.vp8.intra_pred_buf_size,
+			       ctx->codec.vp8.intra_pred_buf,
+			       ctx->codec.vp8.intra_pred_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		ctx->codec.vp8.deblk_buf_size = 0;
+		ctx->codec.vp8.intra_pred_buf_size = 0;
+	}
 }
 
 static void cedrus_vp8_trigger(struct cedrus_ctx *ctx)
-- 
2.43.0

