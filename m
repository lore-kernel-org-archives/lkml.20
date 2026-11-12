Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483604;
	b=vjf7BYHvQVsaecjaY0m8aL7RcGnOqCt6aH2buOkXZo5zHDDSc1yoS0uVerFWTm2wwBWJ
	 RtJEkrP8D3oamNQgnawszWqVdfHnvU3bS8YFIWTpT7pFScQkODBbfYYgs0KZTzRyPD0wo
	 vNP3mTweuus1qNiqVg/mPNvcqU0MNYeMoZF96Clz4MyLdPeQqqqy6SxVszaw8j+iRuLn7
	 eUfPTdnrhbFdyOdgdfV3IHgCWMyyRClNvLDZID3nqTllyTClEqqJsnc1EkInsdJr07OgE
	 xgkmWiVpykQVJeK1klddp4Mk1ipLtgEMTQMbYKtZUxl30h8CmKzKnnhDG00/RV+kzyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=;
	b=lPxdjer+sPtm8bDKlTAw3IWAGmll7XliuBrSH1p5/bhLdJTswkAixddxrGqGY/PDm1pv
	 Sl6zpojyiFCcP/3rnd2pDOntNz5SFhCKYn8mdYn9yNTNqIafj7LATt0srJvQKtDW4U98+
	 r7TGdgvXmbTur5TwMf1jfEhBlB5GgT4hRczWw+w9jTyAN1Q9i7eK/AEhjhfuXpz0D5qdb
	 qCDh4QVxFHR4Dg22Dyj4+Bd2YgFJ66AYhSr9NgfFfOfPET3OT701nx0biW7SmjByDqHN5
	 sVRv4xZukQ5xkIssnqbOVXSW4GRyJU9aXP1VoW9RZjojTYs8gsk9cUUMqvHs7ILi/xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FNsAWrtR;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D0606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20D0606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FNsAWrtR
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4922523d1afso2490313f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794483601; x=1795088401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=;
        b=FNsAWrtRx1l04zhrn2VFFerBVJdYlz6fHuvxZ34YaX+EQkhbOu2BcJ+tKlPnmDAD/l
         jFOWkOr44xOlh/vPpEvUpeib0bshVPalquusRI3Ot/az8lIJlwB9SWXCPKlvhDvWddrJ
         UlU4dEPog2mpIVmzCQ9Rsgq5bNx0Zv4vnx4RhbWgv5IxN53prxESm2e6mmERnQY7m55k
         fohxVCD6D47hXbU8NqAepLtG+sub92u+2Vs0FKlmcAd06jLInMedsK7BjWGFEVLBx2uj
         QEbUoo67RJpXq5HnFHxI/o2AvbhzbXRLoiXD24TGQvu2Rxt7VTCTX5xVs+EZZGPyaTdw
         2emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483601; x=1795088401;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=;
        b=WHKR8TBUVaBuQGPBKM/gHjTknIeOr/VJamCd4F6+GgBOhPNMjovKHUi293zbgsEfS6
         gyjiqA+wPjEsBw+0VvHUOzRLYa4RBASA93wBl3IvvU9yO/L9+pUFkhaGYs0fHtGPPg4R
         HdMAwHGqZ9pxemSDHukJynsh9YUpe1HxwQnvWcCgPP0TnXeHPcVg5dmfCD7FVFG7Xh/g
         zk+L9rlOJ9ANYMvQ0eAo91Msjf0YlL5tJPOKtyTefKvFxL+j9/bVIwDnZxA2SQxC0LVg
         kspNFGRKnCuh8RiivrfwM5aEFv9XUvidFm6de/pSXcxeQzKIPQKJUFYywP6mXNcyQwjw
         SFEw==
X-Forwarded-Encrypted: i=1; AL+hErEkRxhLfNc+tvPLtoiYs0hmROOyGooAL8jm3n5Zw795qOlcry0zrIigFbVzBXHsx6WBGNzvx+2jsYqjQAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cx+BSFObqRvS4XXq/Out6w/QX2Ub5BsgXUF8/M2fUmeJq3h90
	tXpre5Yqwz+K1zmfxwWHOzddJdaUwzTm/IFmchHQCh9HswCnCbADQh6xBk3TcidSwqc=
X-Gm-Gg: AYBFou1pr96dcZMeZXHBjolI5byBKlqp4YOYWtSEa3zZZw9s8Wl9pR+D7yAVt0CDN+5
	iVkVb8ZKjweAzC/HYOnlm2YPRBmL8E/HshXlUvNv7bYvdgfVKzXenJWno+umX415hgvmzjZHFOa
	l3GmNVkg2LCfk0KCTtylywxHC1TcQZcjiAlSQKw0SjHfYvpeNVBtyn5+4t1aKtAKxOLm7w1k7HP
	vXPoOBNzXcXlabGGru8nthBwOmupstYxe81hClfeOpVr4FMagH+WP48qSLasPVqyvMRmJc1v7hG
	v4XpeyFTxw4N9Mn9TvSAs+VNVkNQdHXfTE1r0xF7IvRb/Y6S54RS+58Co6XqyLn95Zyp7BVyEEd
	CZXj10oyKtZU190bDz9liIUTM25m/x9bRYq2K+NPh2Nk95yY0djeRyikbCkr9pT8CyyZ3jUiUOj
	sEAs3wNyLRzhEUlyjr2OKH9+1YaHwOKGW9YKZn1J8SiN2AAeS9HR1OyV9JaKGFAtV1qps7VuflC
	1FuDHdKSl5/yq4khpAteTMe/HktjwwlALxCOxuXgs39og9usbb0aH17gQrBi2iSTxAPOOIP8baR
	7uCQ6Q8EcBDyQ//gk/07sx08j/JqUw5ij8SoYfKZ8Mtp0KiE+cKYRL42AQbsiiRe8UEmvN//mGm
	p+5QxkxyWKPf8PsKl
X-Received: by 2002:a05:6000:40c9:b0:491:8462:20b6 with SMTP id ffacd0b85a97d-499c83c0d12mr9610739f8f.38.1794483600775;
        Thu, 12 Nov 2026 03:40:00 -0800 (PST)
Received: from localhost (p200300f65f19a904528996c8ea0fadad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5289:96c8:ea0f:adad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49836b8eb11sm17512463f8f.57.2026.11.12.03.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Thu, 12 Nov 2026 12:39:50 +0100
Message-ID:  <a6e3206a90f3be915a57a7497a34ef97f914b340.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
References: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4986; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=N+9MpIEOMHu+xlJxUw2mD/JXqfJF1eqVB7nMk5Eh7D8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9aV2s8sFfFVOC95VOupA+IXP3fdYI2xxC6vn/ iHUWQY7n6qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavWldgAKCRCPgPtYfRL+ TvLzB/9SAwbizeNpaG5VX8F40ZM0gqXMvkPFUjPd5fWsSsgflHW37D6qTZi0Hy6tMwfOBRx5FL9 z9329gZpkYZ2BO9TlrhlDR0n4EHawZPES1yyLw3utlF3vt2kGtlaUK2UPYWUFabDCoXF/9FBRb3 4IuKrl8TTSvOT2JiVFtlLWqK3J9S1obd1J1frD66oRhf4+AwrFC5uXbxHGRqvPMAfyT5/fAYp8l QCzAhRxPHgvizEmswaldebcNk1c93h9lEFeNniN2Da5oG/C/O49s6x1CymDFlrkjuOO/9yRaICZ GRGNSBNYed0GgnudxNHtbGspOPm7C2RXZURJEsbgywCXCkfZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Some devices have special needs about how an Elf segment is copied to
the remote cpu's memory space where the default implementation using
da_to_va() + memcpy_toio/memcpy and memset_io/memset isn't suitable. An
affected mainline driver is imx-dsp-rproc which includes a near-copy of
rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
directly accessible at all and DMA must be used to copy the data. To
cover that usecase don't keep rproc_da_to_va() in
rproc_elf_load_segments() and let the new callback operate on the device
address.

The new callback can be used to implement just the driver specific
memory mapping + memcpy() + memset() to increase code reuse.

The patch only appears big because of indentation changes.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 64 +++++++++++++---------
 include/linux/remoteproc.h                 |  7 +++
 2 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index da3cddbe7d4c..3c749a39e5da 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 			break;
 		}
 
-		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
-		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
-				memsz);
-			ret = -EINVAL;
-			break;
-		}
+		if (rproc->ops->memcpy_tova) {
+			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
+			if (ret) {
+				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
+					i, da, ERR_PTR(ret));
+				break;
+			}
+		} else {
+			/* grab the kernel address for this device address */
+			ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
+			if (!ptr) {
+				dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
+					memsz);
+				ret = -EINVAL;
+				break;
+			}
 
-		/* put the segment where the remote processor expects it */
-		if (filesz) {
-			if (is_iomem)
-				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
-			else
-				memcpy(ptr, elf_data + offset, filesz);
-		}
+			/* put the segment where the remote processor expects it */
+			if (filesz) {
+				if (is_iomem)
+					memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
+				else
+					memcpy(ptr, elf_data + offset, filesz);
+			}
 
-		/*
-		 * Zero out remaining memory for this segment.
-		 *
-		 * This isn't strictly required since dma_alloc_coherent already
-		 * did this for us. albeit harmless, we may consider removing
-		 * this.
-		 */
-		if (memsz > filesz) {
-			if (is_iomem)
-				memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
-			else
-				memset(ptr + filesz, 0, memsz - filesz);
+			/*
+			 * Zero out remaining memory for this segment.
+			 *
+			 * This isn't strictly required since dma_alloc_coherent already
+			 * did this for us. albeit harmless, we may consider removing
+			 * this.
+			 */
+			if (memsz > filesz) {
+				if (is_iomem)
+					memset_io((void __iomem *)(ptr + filesz),
+						  0, memsz - filesz);
+				else
+					memset(ptr + filesz, 0, memsz - filesz);
+			}
 		}
 	}
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..165ba8fc1d88 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -75,6 +75,10 @@ enum rsc_handling_status {
  * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @memcpy_tova:optional platform hook to copy data into remote memory range
+ *              The objective is to copy [src...src+filesz] to the remote
+ *              processor's address da and set the remainder of the memory range
+ *              (i.e. [da+filesz...da+memsz]) to zero.
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
  *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
@@ -99,6 +103,9 @@ struct rproc_ops {
 	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
+			   size_t filesz, size_t memsz);
+
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.56.0.rc1

