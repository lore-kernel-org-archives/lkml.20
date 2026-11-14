Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676296;
	b=vwzmoNt9hf2zFXDrX4KISA0dpdHxQqVU/OJcWucCTzX3+A0VEtx8nXbJusfZRc29q9F9
	 XjHdYi01TSUYXirg+Gv0PPSVCcLBUVMw1nweUZiGCsg1ZYVjuS5NliL2TEa3kvJKoPg/2
	 818gP+Kz3AfaHdlb33n9lk6ffW9CleHGTy2+PEM2RkIK02zaTx+QGBbOvRaALyFoX9O5i
	 +HfvPnZwNp4Xw4INcIsf6E36sVx0n6ngpacabLbxfR3WOGYiKLRlspOUpGBd4XWp1ED1I
	 nr5RTmifVRTQe01g7v89rTXnsF1UmT+nl/gsuXrOfJWrJZaV7LO5BP9zN83be+DK+qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Vu2U1+fwMEinJNUOf8+8+cd7a79YlcPU8MSMu5EqhgI=;
	b=tWu4TaK+ZAuJr3BGWZANtK+LhXFCGNAGPjbW2y2pGHyBPakYl4QffAaZH6LQPUIxVXOS
	 yHwSzdq9rTWz9UL7HYiyByRmxi1eCIVspvGXQDM9l9YAXkz8zVdnEqoxM8fW0mN8dwjJW
	 2Wa2x7U2wNewTS8LXVX45iBzD/tBaaewU2YAhSTlUHNa8USvYHWYOvqw62BrD24MENZZe
	 vY19owtPhPu2rwbEaN39GbaPe0rF2RZpnVN1M05pO0MkGPYj9a4nnAfMo2tJ8Puc0a96K
	 ghbmQCihoQeayrcLjHSXuB8+PLGkJqcouWhtj08GiKbAT9aOU+9uj1VQ6ejDcNKA/0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXDFbhyC;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27ED606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F27ED606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXDFbhyC
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1056252a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676295; x=1795281095; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vu2U1+fwMEinJNUOf8+8+cd7a79YlcPU8MSMu5EqhgI=;
        b=SXDFbhyCSupAaqXvko1MniVBLA4ymeUu72/El1zS4anKe84a5WopoMcYKhiHvCtG1c
         00eJpTZz8EBmgsatfCvOyARtn6JcnIfJD6IwLFKpe39JseCqK42sY5UX3o+TxJA6VYl4
         xRiniVY4seBNbId0y1dcQvNJAUCHqZsuWvXKPmYsgz2cLFCyW87HhUo9dtucJGOy4J3B
         HkLfHdih5QA4TFH12s3jQn/U8JWCdagrc/a6HCDCpWvSgDQtrAuzmynoYlgk5FgYFzti
         c7w/ObNc7Qk8eeBNvK2xSyN5pq9/VCUgzX8GXCE4DzrMQV3c9YC5zQNOSur4Z9HekADJ
         sb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676295; x=1795281095;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vu2U1+fwMEinJNUOf8+8+cd7a79YlcPU8MSMu5EqhgI=;
        b=1AqaIyk7+a555Iv2FDcxr6N2raXVH+7vS1wLAQ6lV9+ARmByNvQVEtz34hIl+0aiM3
         +ohJu/P1OO/JdEpSLvlGZoJsv7BEbbO71QZpOFTKXSt7NT5D691Xn+l/XWF6Bpvrmrpp
         76DBSExBTgFX8IAc4iRPBMnb4Jnf0s5CSx9DPHRuYDoWkvw2Yx/XvfRIOTRfeXECWTKK
         lodcmv3fS5qkk2Y3mzuXNXlO2xRhPfQz0jdRssCD0M2NH3t3kbuXMJJ7rA8byqn3GiF9
         Gv78iqDge/M+lPDAnwYQrQ/uk7LaFdKBDwotTDimJuKErWg+xNjFxPbJa0kcHxwoO94b
         l4Tw==
X-Forwarded-Encrypted: i=1; AL+hErHi7PpiZ6gDUsth3unRxMF3LyfBYQ9mnZeNuFmEiEWn77816XQ9J8Dlg3e4FcuiFOp292dscKnx7fJaAAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vNEO91TeQWb7BQXwdKZUzafg3ceP/ibgDep0lBcIEX/hejXWR
	pRagwi9MzY2V3GuEAZ1JS6vDm19rqmZ3QZvLtOiCFl/0+u1rK+7URGQn/3/yVA==
X-Gm-Gg: AYBFou3sDWSJeGimz6Kp1Ab7QzjOndVyNZNkPWjgJb2Sm0oFZ+FHfKKTE6yJ5UrNFKz
	DE9mJOLKP6E77gVPO1YsjryZsl18dk+PxcfJrIPB6cyxwXtubt4Zcto7l25IC01Y9gILi17dnn7
	jGxfVoQdmY9LQXpOGj3bnmBoVuQyAMuyBnx+paAW1hjSkB4rJBqmvrUnjg0UfdBhn3VZsACQB6h
	WyxaFTTd1j0Xv+Vnas8gHGzxS8FxVKnXx3By4s6kqtv7HFz7bmFAshZAE1e0hRR6m0/QbbZqR6Z
	DRbqchQnYv5YeBlZbbob7q4wXkDg6LQF9ZyV6Dx7O7ybteZmRI028FP/9lCy/kI2jl5HzdvkGRv
	EQU/bWWp41/oXNbTWCdz6DBgFEXWLO1hx9eXNvmS82efmcdKLgwo7OO3df77CmyGTi9j0vOr9pE
	wewRAZsaOEAznyyEGnb0+dMg3pTH2DeBEcaPpEvfAr6+LqcljfDq3sTpzM0ivzf4/puW445d6jd
	gl2ygKKMFqIXINKm7MXwLPag0jWfP8iRI9SEKFvSJuJaN3uxPWHuGyIzAbVKLLvd+U0zxZ7fwj9
	KoSk2Q+fK+GKxoZ/TkNJralY5aCe7CLu70LBEQqmKDIoXHYQoeaKzpjNp+dsvosLfeaabqsl+01
	nnR6K+UVy
X-Received: by 2002:a17:90b:3148:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3b1b081835fmr6048766a91.2.1794676295330;
        Sat, 14 Nov 2026 09:11:35 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:b6e2::7dee])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b197ce49d6sm14956895a91.4.2026.11.14.09.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:11:34 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 15 Nov 2026 01:11:19 +0800
Subject: [PATCH] spi: sunplus-sp7021: Fix target transfer completion
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-sunplus-sp7021-v1-1-43d06657fc90@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBBA0V+RWRuYCb7aX5EufIx1RNKQaUQQ/
 93ULs/i3gOUg7DCMzsg8CYqH5dAeQbD3Lk3GxmTwaKtiKg0Gp1foxr1NVoy3YSPokHiBitIkQ8
 8yX4P29ffGvuFh+/vAud5AZ7/CkFyAAAA
X-Change-ID: 20261115-sunplus-sp7021-af094801e806
To: Li-hao Kuo <lhjeff911@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794676291; l=2354;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=5PNIgpMkTtdvI/ZRkhXJrC2kmlfX3FnZr2LhsZDy1Vc=;
 b=FS6ZTa0NF+yKbgI3TVX2H/KePnOVCPJl8l1mElnWdixI9iHmnD5DKKOJVXd7SfsTnq4uPkFhc
 YmZeW+NkBRcDlNRTB+70QuHGupbeqVes6f7fbvbTEpjyBmyzx2a4ONp
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

Target transfers wait on isr_done, but the target IRQ handler completes
target_isr. Consequently, a target interrupt does not wake the transfer
wait.

Use target_isr consistently for both TX and RX, and stop completing
isr_done in target_abort()

Found by code review, no hardware for test.

Fixes: f62ca4e2a863 ("spi: Add spi driver for Sunplus SP7021")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-sunplus-sp7021.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sunplus-sp7021.c b/drivers/spi/spi-sunplus-sp7021.c
index 54431c363bbc..c5706f557ce9 100644
--- a/drivers/spi/spi-sunplus-sp7021.c
+++ b/drivers/spi/spi-sunplus-sp7021.c
@@ -113,7 +113,6 @@ static int sp7021_spi_target_abort(struct spi_controller *ctlr)
 	struct sp7021_spi_ctlr *pspim = spi_controller_get_devdata(ctlr);
 
 	complete(&pspim->target_isr);
-	complete(&pspim->isr_done);
 	return 0;
 }
 
@@ -130,7 +129,7 @@ static int sp7021_spi_target_tx(struct spi_device *spi, struct spi_transfer *xfe
 	value = readl(pspim->s_base + SP7021_DATA_RDY_REG);
 	value |= SP7021_SLAVE_DATA_RDY;
 	writel(value, pspim->s_base + SP7021_DATA_RDY_REG);
-	if (wait_for_completion_interruptible(&pspim->isr_done)) {
+	if (wait_for_completion_interruptible(&pspim->target_isr)) {
 		dev_err(&spi->dev, "%s() wait_for_completion err\n", __func__);
 		return -EINTR;
 	}
@@ -142,12 +141,12 @@ static int sp7021_spi_target_rx(struct spi_device *spi, struct spi_transfer *xfe
 	struct sp7021_spi_ctlr *pspim = spi_controller_get_devdata(spi->controller);
 	u32 value;
 
-	reinit_completion(&pspim->isr_done);
+	reinit_completion(&pspim->target_isr);
 	value = SP7021_SLAVE_DMA_EN | FIELD_PREP(SP7021_SLAVE_DMA_CMD, 3);
 	writel(value, pspim->s_base + SP7021_SLAVE_DMA_CTRL_REG);
 	writel(xfer->len, pspim->s_base + SP7021_SLAVE_DMA_LENGTH_REG);
 	writel(xfer->rx_dma, pspim->s_base + SP7021_SLAVE_DMA_ADDR_REG);
-	if (wait_for_completion_interruptible(&pspim->isr_done)) {
+	if (wait_for_completion_interruptible(&pspim->target_isr)) {
 		dev_err(&spi->dev, "%s() wait_for_completion err\n", __func__);
 		return -EINTR;
 	}

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261115-sunplus-sp7021-af094801e806

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

