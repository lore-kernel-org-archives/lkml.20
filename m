Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246681;
	b=mGln1laGzLJC4xE79BP+1+4FeXPcWyPuI48hkJExbE4NTzsBfVMeBrblkQzP97xo5e6V
	 KoDpsKV48l93sXBUljMz7+e4YR4OS66B2N+sQO8M+b68H5Wu3dhuBe4VvIh7kBOHnh0Rq
	 nio/khfJ5o4UN4gUEvwxqAlO2eGZmg5WqqKk9rDSUx5I2zJodTuzQ3SU8C8NhDuOjhjBq
	 IjiyLRz6mUvUNK3XNaB/haCPS6kn4swnHBSnRUmVdpnZBND+ZJUMP+4u86h1tf/YhdoDB
	 MqDFpTj868/ig8IVH+YhHjF3JaMF/vW+EoyYYsHyijvEvBdX/lLk0IXMM2HdufLVMOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
	b=1MhFXbYLOXYYcMD6TNWYUlAgrysLE9vHNk/JuZ/055hSu7SewTB4xIeNWEn3nfsMBNgq
	 YxHFru5bOtgz73Nna4CVHDuVIlm44KvfAJvKZ2WP/ynS3S3emGqpbted4Dw5YABBqJVo6
	 kddiY0NGMGIBhfWyOUZAmZKwRYUxENSRjXNm/CGCEcxQmIt7G0AGZeZhxs0kzwDue12zJ
	 hw2lzoFAtykeOlgnwB8NrfqZtFxplk5D/qFhnGiMw6VzVL1AEHEwMPkIZ/JHStXsp3sVS
	 3sr0MWn950CKtfw2Yd7xPPzELFW5gFS4ofRqeDTW8Er0v9zSd5K8Xhskt5Hpfd4Aktg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1UUbTkm;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB7360A6F6B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB7360A6F6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1UUbTkm
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so8838855e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246679; x=1794851479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
        b=X1UUbTkmgQFYb/YKVr7KR8KdJUsFzGTGYbxZo4Q3uYSgegcW9fZQDD8huGrc/OBpm6
         cGISmGI18m4OOuUqjS3ge3pB+JFiROxrlln5659cdERlwZrOAa8JtN0Fa+5qsV7vOvkO
         mZz0w/6wh9bA0qnwFzvd7fSKLvOA/GEhVJR2V3nDNcca5qdJTZj9yjzAOrLJ6ffuBblG
         LewrLRX9F7y6XHcVF3Od00Zid5Dr+Si7ZpSQng/6kabAU2TDxrhheLk3S6Xti9CiMlKQ
         CEOE1WYR3vlJBLpxY/E4FHYERYAUlcbwNkfckrF88YUwejZUUcqP72YEaKsPHB+F/lDE
         SXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246679; x=1794851479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
        b=kNPKLwkJA5NqBAT2j4h1NkKs2y7cXotfCBI8nVKy5LaRXRtKN0PY0UO/Ba3b+AkoJx
         JnInwD5TD3UM85T78kVCbMDl9igFumdZJfQflhynaPvAHJwPoEl25yYp05NLp9GVHCzp
         7qfO8yrd9J/ob0brf6c3y8AKdOS2SQe25+yKUZ1iMyUJ3rWEjUaG7TI4vE6Mf2VeNv9v
         Wk5XdodfeBurWv6O/3Uso1GCRC8JtutVHzkyiFYuNvgKcCmJAVNwnKA+ckp4HOWIenx2
         EOxXRojJQ3WRacgaksrUxf7ad6q/CoZJAHh1ayZG6rtKAO7IYDUz1YC1Wvsl1hA9g1N2
         a5NQ==
X-Forwarded-Encrypted: i=1; AL+hErENwV//2kG5DeJ5X4w4vUZHBgHQ+LsYISYqx/qwpeCoN7hm1giU9Be1T27rVzGZ67IH3Bzpz91la3SKtq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xLuDVMr9F47Xp8cJOO2qHVYlq7/bxxOd3sJ3uPPTsDoQnSePQ
	olVI2cWUImiDt/VC+uKUi/fVmeEZDeGS6L6IXWAnSBZym8LHZeyjFGKS
X-Gm-Gg: AYBFou2fdrHN80w5Ml1XzaTD8ZEQ70XVYBNm1+f8QR54GpTAYg/vjHJrJZRqJZyOclf
	Mnjcllwv2g60IYrZSGMSSD7WGEgSTG1RPgjlYMIys+KtsRVd2Z7lJx9GhugLbv1FYHxFnChlox2
	RDsH46PFBPTzjdNHJXXf2BFPLlxEnmBUo1m4ZvPrSsQCHdSJA10R/dDcIt2T5z05JwkgkusAr//
	PzC32Bsc94+fsqkDY/R62jdSdbnkqmYuPDcZdfSGy9VeFCDqdMYonhHPQta9NLjPcK+CykY3ebW
	R5e/bYRhPNvAmjEoVViy/VqNoNZ+hNHdXdjeRpz7aJ5L2Z0SihiHu+UDwoQbad0tEoQHaqXmBsi
	X58Ha1BX9u3dklrE5Z7e3dISwZduhA7t0u+kwCxvaOFPEgXSJI58CCEf4CFG4oxp9m8B7UcPMjG
	9pLqi2vp797qvlGDo2MNBB0FbpTyxiy1+ZYmSRdGBP72Hjjbjb102p43hYNxSy1TnNfBX2HUfrE
	q/iEdaOorLkVsvLoIn8FlAL5Qk8l7DCGKajF8uLN4X8g+yiJOAARrcNaGyGIR6LucnU/QUjlOEX
	/wRPxmWsXd6gLnZhHAJWAcwYNxJrVVOguwP2sJdrWftObNYuzHO/vj7L8edF9lWY+VBoC0rmf8B
	whNTRpEKPEW8UythRPEPWgCSVb0umNKfvlU7X03qy1KnQiZawecRVSfdulxl58wHP6OWI1GRNyf
	781Y8yMUcwuYK7PxDnzhn/SLorN8gznXXV7CCZk0MkjyFuomZ9XsZ61BZE9kgY3MG/6hDvo5n5O
	rSv3NLkhPdJanfZ8G75kvwKDdjmoeG4pLHtHu74jhuocUzywSZamqPQkvjH+6XrubsKV6tP
X-Received: by 2002:a05:600c:1c02:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4ba0230cc8emr216685e9.2.1794246678645;
        Mon, 09 Nov 2026 09:51:18 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:18 -0800 (PST)
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
Subject: [PATCH v2 10/11] staging: media: cedrus: h264: clear the DRAM buffer sizes on start
Date: Mon,  9 Nov 2026 18:50:15 +0100
Message-ID: <20261109175016.42061-11-jernej.skrabec@gmail.com>
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

Above 2048 pixels, the H.264 decoder puts its deblocking and intra
prediction buffers into DRAM, and stop() frees them when their sizes
are not zero. start() only sets the sizes for wide pictures and nothing
clears them, so a narrow stream after a wide one on the same file
handle frees the buffers of the wide one again. The codec data is also
shared with the other codecs, whose data can end up in the sizes.

Clear the sizes at the start of start().

Fixes: 03e612e701a6 ("media: cedrus: Fix H264 4k support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 97958ceee8d1..e7a3bfbc3531 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -573,6 +573,14 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	unsigned int pic_info_size;
 	int ret;
 
+	/*
+	 * The sizes tell stop() whether the DRAM buffers below were
+	 * allocated. Clear them, as they are only set for wide pictures and
+	 * the codec data is shared with the other codecs.
+	 */
+	ctx->codec.h264.deblk_buf_size = 0;
+	ctx->codec.h264.intra_pred_buf_size = 0;
+
 	/*
 	 * NOTE: All buffers allocated here are only used by HW, so we
 	 * can add DMA_ATTR_NO_KERNEL_MAPPING flag when allocating them.
-- 
2.43.0

