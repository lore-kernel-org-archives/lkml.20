Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587998;
	b=o+Jx/y39YOO2Mvd8FV0uRJOXEjreIFMHIkE1wsiK2l+da4+l3vyuhUBWUutwIEzqB1Gj
	 hJQHZEPl9Cn0CAtjDgjItNOR5KTQCaPeMj+eDkjchEjBOF/riW43dB7A+Wvj2YHT27IE4
	 kREZlGG+NxQLd9ubW9qzs12PdCNsxrR8nuZ4XyphC6nEdJG6Ec72Chfo3Zl/wyMHCDt+o
	 Mfs9jGiyM4jEABQoqj/IWIVXFnaK9IsZUO9xmF9sl3rMRKiBi5Npr0lMgzTGHPavBtqf0
	 EFpN4ZXLBFj5yPOPT2k9w33t3iPqOTb4//B4R5HRT4c16vYaDOCQgJ/J035wEnLp2qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+98zVGkdMsxdWJwCnDrHSWyfkX34gPs6MPu3KuqYYng=;
	b=S1HkIn8qTq0sXIzgmbR7UF7zg1nnaDbQX8YT6ZNsBGJjiPKxLdWx7kOxmBUWxQ97d7eC
	 fkUa7z6H9sovo5qNye5glI+WIsSj7xP/PCrlGZFTiYoq+DKvu5p7iJahrX7JJI/HD0Cgk
	 dWbQBn76xxneNimIXvSNlYaREs+r64NPzBfcfc5B68tFCbEBg5S8Rr/EEK5HWyJQkoaCy
	 BDvevAsjGkCFp3Ff94/sb9hr2qhbpYFwqPzOC8pQG1ZllRYOWnfJrAqDafTG5e1XqyMeq
	 5d/o9MyMsfJ7csxlEbR/2VQpoB1ipby0+/eJk7J9o9FL2AMmJZ97IC1Bnc143V+IGWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="IMNH/VJz";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F9A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F9A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IMNH/VJz
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-87137a8f4a6so50204b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792587998; x=1793192798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+98zVGkdMsxdWJwCnDrHSWyfkX34gPs6MPu3KuqYYng=;
        b=IMNH/VJzZK++yVZogwJ+u8f3k7Uub/aPMS/Qkm/JCEC8znBpumIgeGOotyQxUnfnB5
         /kBdQJB7w7sp1On/V24Ik6c4NhQWSfKRhMX0CZPauxcYRCXN4We/O2ugqhdoZKlRUY9S
         y1TJtSZQZ+1w4aUIar8FMMK7B3pPQNwmkT6Ju5lY3jAVPKDquHfjqBKU89s0wZZNqVLj
         N3zpcKJdSYaYW+8Ua2EvThpR5NYD9ur2BqgJ/4q2AxLRTvVfwrQRJaTDC+xStFdUjRUU
         0Rfc6HnpJmtW5WAlA3lafLtwG3hyzXwM8lUGbLsvc1JznK7Uo+K3w6Do+OPrQnc1VdWQ
         vSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587998; x=1793192798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+98zVGkdMsxdWJwCnDrHSWyfkX34gPs6MPu3KuqYYng=;
        b=VPHiCEjBkY8x0ZvEGJB95mj+WlAGHd94qM6Mt8VvrtX+Eh94kxaj1ku+3VxU5Bg9Lg
         BvDGTYAaGL8ctm9cpHQ/rpzHWyAjIflo9RblnTwKao0dBEUBXUwX0hnmoitus+1ImQ5h
         9FjcacHR7ijpc7qRhESzpJD9f0g2OhgmCtxQa6JzwahvZTHfknPNVYKXPQ5NbwGOqS4G
         GBfF23Y+xkl9ZcVrxCVgkRGWB+3qhhVhsZGVkhEtb3qFcV+N2YHGfqzNgN/CjbUvCgPz
         vZA5rxFGCydtMPCgcCxno+fe9DwvC1vAL0tS+IAUmUc4cirgq/jjnRZ8nsDSwh+GgrV+
         sUHg==
X-Forwarded-Encrypted: i=1; AKwUvBw5XPl78Ts0rvO0xCf12HI5blpzd2l59ka7y6DLEVvarsovz2Pqp6z0rJAxcv/u1ZpDkdiG543odjbvQpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1xbbNXv7J8PldIzulrfQJatRfx2vMWkrsLzag1VDWoBw5vYHd
	oGflJjZMaM5+B1s6JFR15Cz4tao0xHWU2dBQ4dxDPQJNE0GkHugvoAPR
X-Gm-Gg: AYBFou2NUeKkKBgUhc0oYARgtKZJMg20zqLZCbZvOZ+v8KoXUXiJeAwYP5R+bPuxcQZ
	L3fA2bBss7qxzA5p2qDYM4lBOulgkUQEouXpt761dwTTMAyfXsykPu2FvbCgD7RZwE0ds8sBIcV
	8mMSvamgmQ1XyI47liN/on/Ewif5ptV23+NRZGVp1K6G2E4qQaHbVCmNW7ceE+5Bkq3WvOFDd5m
	ERyONTT4R06Y+RRApdKVuurJ3HYxu4BR40+CpPHuH+L0vpuAGZU7nS2y1pEEtGdbUW6sbWyLXDm
	8Frs8/J/YdHrJ6/za20dj7VHNVvmyhV+1pj/KcssqXWqo1SH7U7oXBiWVNxVL1PsW1lXjjsCedn
	j2WNqbweS98/w8qt8mBGT+xeOdmXLyEX3h1k8XepIJqk7stpStfjxUe0o0C9ohUKS/E2tlkf/9m
	LrlkLNdtCG9dnFn8YqGzXBfB/vouohAzSWYpbaEfGrXEE6IlmKNkLMbiWb0ToDxSFyFtfhYW3e9
	SZjp5kSc/T2CqD0kgpwAF5AL4EwcSD5pelPty2UudkiDo/BplW046X4Ag==
X-Received: by 2002:a17:90b:4cc2:b0:3a7:fef3:8561 with SMTP id 98e67ed59e1d1-3ad86f44cfemr2971957a91.5.1792587997602;
        Wed, 21 Oct 2026 06:06:37 -0700 (PDT)
Received: from LSSP.. ([2001:da8:7001:22:77e7:e706:c482:1610])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a8723e87sm780033a12.25.2026.10.21.06.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:06:37 -0700 (PDT)
From: Guanxin Li <bruceli20040604@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Guanxin Li <bruceli20040604@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Rosen Penev <rosenp@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: moxart: Stop host before releasing DMA channels
Date: Wed, 21 Oct 2026 21:06:25 +0800
Message-ID: <20261021130625.1616753-1-bruceli20040604@gmail.com>
X-Mailer: git-send-email 2.43.0
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

moxart_remove() currently releases the TX and RX DMA channels before
calling mmc_remove_host(). This allows the MMC host to remain active while
the DMA channels are being torn down.

Call mmc_remove_host() before masking controller interrupts and releasing
the DMA channels. Terminate any active DMA transfers before releasing
their channels.

Keep the power and clock shutdown after DMA teardown. Do not call
mmc_free_host(), since the host is allocated with devm_mmc_alloc_host()
and is released automatically by devres.

Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>
---
 drivers/mmc/host/moxart-mmc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/moxart-mmc.c b/drivers/mmc/host/moxart-mmc.c
index 28aed13549a6..bece33f4792d 100644
--- a/drivers/mmc/host/moxart-mmc.c
+++ b/drivers/mmc/host/moxart-mmc.c
@@ -684,13 +684,25 @@ static void moxart_remove(struct platform_device *pdev)
 	struct mmc_host *mmc = dev_get_drvdata(&pdev->dev);
 	struct moxart_host *host = mmc_priv(mmc);
 
-	if (!IS_ERR_OR_NULL(host->dma_chan_tx))
-		dma_release_channel(host->dma_chan_tx);
-	if (!IS_ERR_OR_NULL(host->dma_chan_rx))
-		dma_release_channel(host->dma_chan_rx);
+	/*
+	 * Stop the MMC host before releasing DMA channels.
+	 * Keep controller interrupts enabled during MMC teardown.
+	 */
 	mmc_remove_host(mmc);
 
 	writel(0, host->base + REG_INTERRUPT_MASK);
+
+	if (!IS_ERR_OR_NULL(host->dma_chan_tx)) {
+		dmaengine_terminate_sync(host->dma_chan_tx);
+		dma_release_channel(host->dma_chan_tx);
+		host->dma_chan_tx = NULL;
+	}
+	if (!IS_ERR_OR_NULL(host->dma_chan_rx)) {
+		dmaengine_terminate_sync(host->dma_chan_rx);
+		dma_release_channel(host->dma_chan_rx);
+		host->dma_chan_rx = NULL;
+	}
+
 	writel(0, host->base + REG_POWER_CONTROL);
 	writel(readl(host->base + REG_CLOCK_CONTROL) | CLK_OFF,
 	       host->base + REG_CLOCK_CONTROL);
-- 
2.43.0

