Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639014;
	b=bzCRBY+yk3/xHDVVlkq4qTjjo716fDDr04sag3Fu77K0g8EsLUsm+AT9T4IRNd/AJfrS
	 rSBlodKrw1/1YiaTJJYnJtDHg6FvMotPj6EFU5GT306RVDTxr3XSomZ1HhBKedtYmfQF3
	 yonbMRnqo8spicB8zkJ3h4oMjn9Mj9K3x+ixyNNorCL9nBC2iHGywsin7yWrGfDM9FF9N
	 KJUfnAJuNd8s3jMrquEFpS60Rdnt260H1mG4WvwrPwYVIbv6KoGD2IbFsyJP9Xsf9Knp2
	 EBYdLwWXtotn5pZEhneGjM6RFivfH1L/zX0fT664HO4A+bzBUKxwj8NO1ZjPaeZciTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
	b=usqDNW3lFq+1DApeq8aOXQDtesevRvLj/ZNmqTJPL4i2Ryb/TLdrN9bDwGH3/adKtolI
	 nwIYln47yglhYP6+w6MYSU1NWf8+YgU1EDKJiyqNDjh/k3ddMAPcDiqPzE3oOq+bwahni
	 yTyBlnnzJ+aDP524NXjLctASs5hm1DCn3DwYCTYNp54JZsmw87yI3xLluS2TR/7xrTHxZ
	 Ecfi3l1a0tNxfxIK0s7fXA2l121P06NsGT1/mMnWdmy/LJ8Ici3D4diiDDKNpR8oUXeCy
	 nBUezkCRuNZAXoAOi60ExSMeqcZxf2SXwYJyapGQKJRpmT+doEKXTv+brl2fc6XZ32A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPzYbA4t;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9724460AED21
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9724460AED21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPzYbA4t
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso32942645e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639013; x=1794243813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
        b=cPzYbA4tnnwJzMaz1ubRBRd7H8YYSihTifsG5AM1MHPzmk1SdV2HZTZh1j+el3V+5p
         FU+6ggd5R1Y+0x+9JP2r0SeugCKOVeYt3KooX0p8t7WfCJHP4gXIwhpBN++R6nnzK8YE
         tHVqFY0ZVd2qBi3zyyUAbjE3e0BXSHmqpCGvZbmOMq2rrNr/GDmvmaVeTTjYFzPiDg8B
         qWxViOqzwMU1bnzfMyhp3kQLMKUROU38rL4WTzUsCxVVQwb9HxiyTjEBueysFWCD27ik
         S8KC7hSePNpEQNNTQOlGz5ejaUCb68XK6WA5Zw/YMbcc9rCg0c+c0E0pf1we/qEpOBo4
         6GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639013; x=1794243813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
        b=BfHcRv9hIupUhSEDYoLprzmQ7mmK/HWSp0oHyIftITxQMKWGrV8HYlJwU0wKhDK3bY
         4CXodEu0oIh6rOqMxdiqrSTuCU7dhpqF1BnaTFhH2IMPP6sq7A34TjnblZE7hd/GZEvF
         /jxCL6RMwcX/CDmB1UL+R/J5LpohIMRYhQpYXc1e15zJdLRFnf3eRuzrfFR5K/1qY11E
         dOmKf/N4mV7xhhWrBKLWDxppicpI2dRzoA3ec7Ss1znwd3lKy6kRXVIvDZzIyHO6+Lad
         SD9nd0F5vaOEwJj8cJlMXIDhsFHi6ePSjVBlLLnl10K2O7daZ9AF6zT2ASY6u/m0wJ9w
         FZWw==
X-Forwarded-Encrypted: i=1; AKwUvBwm6RRybbJWkEpIjXtJpAs7vdt3/eqzp2pXDwByZxnZHw9epelQOk2D7Ujv7I6kot5OOtnWznhfHwo/Bzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbE3bxxhaGNYa3Tg7MeH5/OeFjGMsnjd1hfnMPLj1iT4Ez5Hp+
	mvwcg+7F8NdYA4J3FO/LGbXFMP4vbwjzNSZ7sRsTgANuPDhCBCsE6Rn7
X-Gm-Gg: AYBFou0ABu0mrEqxZ0GdJ1FJzlmRJslEqqy/G6xgoSEuSg1e1IQmQa2DNVKYsqHh5uv
	IRefmCCnnQvcFUlyYPMz0DJgt/RGDM9zo3JQwBNfsROjm2/QQrdxRATrKBwN5u8B+snSbk7jDAd
	AA3Ot9dU1eTy74OMr54E1QlR5oqozguOdED74ZgtEHz0PBrKXckJ9g7JFABJ9Q25L7K7+ZuIqPf
	7cLN0vzdWfIupwS62EMmczvhXy/lncPyGQprCOLzgtUd5FBvkHuP02HCrte5uoSCUVqEqZb/dBA
	yt8pGW0nrv9SJi/nXHupsODUk9AOBKv9TbrjY6wzg1+3tWGEfQ20XRhVmOvWCbGUMuOqmaraZcb
	0pcIKNDdQMI/zQ2Hap/xlj1oU1By1i4TiXSz1iRyQJj7Frk+c9li/TVXKbtHp7B5YuJPgNjFueP
	k+Csq+PEn5YEpwWn1G+M8so2EKUqRLsK0j1u3Z62ItPJBiiHbBEFtDXi2evXIToxUkhna4oJlo7
	ctbjuWwOYK5Nt6Ambv1s7vTot7d3+6qU2QrTTqDi6qumySOqMjLmUXTCiZzGoGMQwpOVg4w8xCQ
	LYpi2kbaEIQmlVrl6mZS5TcsZqK8aaD5vPuo4TYTCFThd46pZZ20L9wUvz9G0/ExB3VjiyjNxZE
	PBtMPo9WJzSn0WneTV54ohLTi31XHNUQamZM5E3D3fOeGP7P7T+X435vuU3qJKpc0Rh0WOGNuUj
	ufFi3Ud0gcwA1MNbWGqSO016AIaxgTD8MekKrmqdCVVuY7Qmc9AiuDsFgeifgaW8YeCZHqWyQNt
	jYBpEDeVgMqSjd9wQXKIyv1mtgJYC6wsRAsPt9ug/DwMxs/gw==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr244438125e9.17.1793639012878;
        Mon, 02 Nov 2026 09:03:32 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:32 -0800 (PST)
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
Subject: [PATCH 10/10] staging: media: cedrus: vp8: support frames wider than 2048 pixels
Date: Mon,  2 Nov 2026 18:03:03 +0100
Message-ID: <20261102170303.1973892-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
bit-exact with the FFmpeg software decoder.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 64 +++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index d28fe91562d1..ca4efa9302fc 100644
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
index 6b00efa77c22..954c0ceb98ed 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -666,6 +666,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
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
@@ -849,7 +863,44 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
 	       prob_table_init, sizeof(prob_table_init));
 
+	/*
+	 * Above 2048 pixels the deblocking and intra prediction row buffers
+	 * no longer fit into the internal SRAM. The vendor library sizes the
+	 * deblocking buffer as 24 bytes per (32 aligned) column.
+	 */
+	if (ctx->src_fmt.width > 2048) {
+		ctx->codec.vp8.deblk_buf_size =
+			ALIGN(ctx->src_fmt.width, 32) * 24;
+		ctx->codec.vp8.deblk_buf =
+			dma_alloc_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+					&ctx->codec.vp8.deblk_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.deblk_buf)
+			goto err_probs;
+
+		ctx->codec.vp8.intra_pred_buf_size =
+			ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
+		ctx->codec.vp8.intra_pred_buf =
+			dma_alloc_attrs(dev->dev,
+					ctx->codec.vp8.intra_pred_buf_size,
+					&ctx->codec.vp8.intra_pred_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.intra_pred_buf)
+			goto err_deblk;
+	}
+
 	return 0;
+
+err_deblk:
+	dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+		       ctx->codec.vp8.deblk_buf, ctx->codec.vp8.deblk_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
+	ctx->codec.vp8.deblk_buf_size = 0;
+err_probs:
+	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
+			  ctx->codec.vp8.entropy_probs_buf,
+			  ctx->codec.vp8.entropy_probs_buf_dma);
+	return -ENOMEM;
 }
 
 static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
@@ -861,6 +912,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
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

