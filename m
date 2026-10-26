Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014725;
	b=1eKwjeFb8ewhz+xVjpvsAL+rcKH7y4PT7cJCKoBMIdWLNXL6OfoIWGRdW9Gm7c4DRoxj
	 EP0vsifSKcUPw1IwocIZ16PzrER8YwS34LKi+W4JuThTnh06wM1AlMUhifQNlLS8XuJXD
	 dss5ecvlccNIH4P0uBxD2fT13WB+Dp7gTLvfXOn4DK1XqWzFy62thVAphFn8OqLfSzSba
	 PvFEreqFyYSCHtcXE9f+OIVIKlqp+3r+Kjt4vfP3sZhTJHdDaL2ma3xUgGajbQXs68AsT
	 tbd/ALRjlFALAL8epLs2EZPkOXPSKmZMd/3Jg7SYz9GS2k+3WjGNJ7b1DQVG9NlEUSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=rmWzCzfSpt1rDCtVaLDN9FMHes3sH28/Mle8yGwChlY=;
	b=GJlHl8WQ9ZZpyAWMGM1HcJJUQlTLuqRNLOxLw1MmXzlpPrsPXcpTKGE2n29QLeZwStIk
	 I25GJBLtW3WGnBPlD10KIiQ4lhbEGxxeoD2I/8enb75yJ6mHQ2p1Wc6TKyS6aQ7+Jbbru
	 PXyovN7R4vyrB4YQrDtpywReQwdZJgnzIIp8OFXMNUORll82qRuM7jXUkVlL4jUBMDg4m
	 d9266jIpSu2iT1HYPMSIz1xLgfu3EZ31aSSYyHXQqln/IEevtQHbnxNebd/rs4TRVc4tP
	 4rYo7bl6uNo+V3kINlPrSzTSZbjOvZL1lTlBsGDVlWz89+7K4qNIMfgQVvKldRb4YTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imd-tec.com;
	spf=pass smtp.mailfrom=imd-tec.com;
	dkim=pass header.d=imd-tec.com header.i=@imd-tec.com header.a=rsa-sha256 header.s=google header.b="N+/aFAtt";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F58606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F58606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imd-tec.com header.i=@imd-tec.com header.a=rsa-sha256 header.s=google header.b=N+/aFAtt
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e47347279so879108f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1793014722; x=1793619522; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rmWzCzfSpt1rDCtVaLDN9FMHes3sH28/Mle8yGwChlY=;
        b=N+/aFAttA7wTxM0/7LDeAzXgMIzcPEMVDQ7jPp7ixWrZDgJlJYT1Qhb2CUQSDuEZv8
         Z7tjPRXeq9kmXmL2mQwtAqFotnrpYWH/hXktftDr7u1b+VAbjt+ZFw9PlOyi600cfkNB
         9twYYrZi99rcUTsg5p07Z5cpv2idOP5looPy9Zesok2XZ2JR6Ysr/C4faeaZFkmXZCxw
         tmkrFu05bYotW/Mk/xoOJ83I5QqSVBhovvemo4jRv8HJfY2bN0Rz0dEdKTyd6NgHTrdV
         fxYjrhPMJ7blXzncrjaf89sB989y1ya/HATIn8yaGCV5hZjENniIgAo9vbauslHNWPvA
         tyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014722; x=1793619522;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rmWzCzfSpt1rDCtVaLDN9FMHes3sH28/Mle8yGwChlY=;
        b=ews6FmMZTS3FiL3JcjvHlKO4rFHCWObxMD4ii5Oi/Du/CXA7hb+b4brM/oPBK0iNxY
         7hXPGYNzaulYECIf6P5/psViVaSim2EP/W6M9AoWjhU9S3bJ2TWuCSp35rl8V8++uTJr
         neAtawOOMj3K8A6OguGj62/Y5pID+c4hxkTnkcNKrOONbjttuq6dysqdZ4t1al4ebzfh
         7r+hk852kvo9x73kYqrA1oZn3iIiKdnUlwGXOpzSLswVKrLTU1zLsXL4/rE3xo6qcMkt
         /ChaFGKjQUi0jdCtcysMZsS39m5XcK0l3NIW5hi4DjprhOm8jVaggTu+JQRV1EEcqUog
         u8Hg==
X-Forwarded-Encrypted: i=1; AKwUvBx39t+0IeAM0TUk58R5QsKrlYxliaMBolD9FUSLYe6XUj3E+eLsNkAcmG66zxY5quKiMByx3QUy1cuyUxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy+Yo+LJHqZs7EPnHp7p8FbPGFarpt0JwLMxDSMSzgatSd86av
	CLBnpYg1M1reiMTMk0GOrTCeJxmpRxaMVgErH0Qrrx0BANeLA+hcuqCQQ2l98Ma3/6o=
X-Gm-Gg: AYBFou0WFid00NY/Yvy89Xw1yKsqHW/O589BxV2v4zP0vqjjIiDufhFLmtKFKj3sYU+
	bCNaJQJuHsSb/yl81b0oY2c9RRuUiGd9lB4pBy7M2UGLlVcbfS31z28kfpBy1Go5r1gyYm59UjT
	OhhpOdgW0E91Xql8fPNjJdP/LqaYJDxKcxbegV2VDnKhqSj0UUIj7JnCtLTg/RR2I9/RDFY7lS/
	SeWneUjaItzr2OUFIjk0v4CqkaLSEsc3NvBP3Aod0OcguvWJ7IEGsT0CToH7Uj05QczcNtUY9Px
	zp5JvsR/1RnwVuuLxhIX1pKtvz0h40ZELq3w0VvU1DzK+0T9QrzKAlE/MBiKNZ18guMsGeZGHZx
	wOdpvret8hfwO+n0HvoJI6ZCmIWk36ysfVibcLT4rydBrYGHq8xHcmaEGiem4QmRN2k/JJP4EwA
	BZ3ICosyf5JkOkMjx9hY1mFcuI2RAx0n9MQ5aDtMjtYg/zAhqV71ZwBWTcrhak2b3BcJN1XrCJ1
	0D1fH5M/Dr49cJLKy4aJTm9Qg1/gVIR6EFx0MajSPn8iiDfycpHYc6beYLnjCpUC7/U5PAju5eV
	qBoOIXI4RViVmcMZyIKLLeYiqq12kQaSJ9bWiSeCZMH7UZqNWVSJWQQkgq87cF8/5X9Wup612Vw
	WHZI=
X-Received: by 2002:a05:600c:3acb:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a35aca4fe1mr116576345e9.16.1793014722474;
        Mon, 26 Oct 2026 04:38:42 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm503355405e9.1.2026.10.26.04.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:38:42 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 26 Oct 2026 11:38:38 +0000
Subject: [PATCH] power: sequencing: pcie-m2: Drive the Key E SDIO_RESET#
 signal
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
Message-Id: <20261026-pwrseq-pcie-m2-sdio-reset-v1-1-02ecdafce518@imd-tec.com>
X-B4-Tracking: v=1; b=H4sIAL0732oC/yXMyw6CMBCF4Vchs3YS2iBBX8W4qO1Bh0SoM3hJC
 O9ulcVZfIvzL2RQgdGxWkjxEpNpLHC7iuItjFewpGLytW9dGee3Gh6co4Dvni3JxArDzLXbNwc
 fuqYNico/K3r5/Nun82Z7XgbE+Rekdf0Cc7Zl1X0AAAA=
X-Change-ID: 20261026-pwrseq-pcie-m2-sdio-reset-015492a846ad
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The pcie-m2-e-connector binding describes sdio-reset-gpios, but the
driver never requested it, so the line was left to pinctrl or to its
reset state.

Request it asserted, like W_DISABLE1# and W_DISABLE2#, deassert it once
the connector supplies are enabled and assert it again before they are
disabled. The card is then held in reset through power-up, and the
line is never driven high into an unpowered card.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
The pcie-m2-e-connector binding describes sdio-reset-gpios, but the
driver never requested it. This holds the card in SDIO reset until the
connector supplies are enabled, and asserts it again before they are
disabled, matching how W_DISABLE1# and W_DISABLE2# are handled.
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index cafa642a4b6b..5f5a116063da 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -39,6 +39,7 @@ struct pwrseq_pcie_m2_ctx {
 	struct notifier_block nb;
 	struct gpio_desc *w_disable1_gpio;
 	struct gpio_desc *w_disable2_gpio;
+	struct gpio_desc *sdio_reset_gpio;
 	struct device *dev;
 	struct list_head pci_devices;
 	struct mutex list_lock;
@@ -47,13 +48,23 @@ struct pwrseq_pcie_m2_ctx {
 static int pwrseq_pcie_m2_vregs_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+	int ret;
+
+	ret = regulator_bulk_enable(ctx->num_vregs, ctx->regs);
+	if (ret)
+		return ret;
 
-	return regulator_bulk_enable(ctx->num_vregs, ctx->regs);
+	return gpiod_set_value_cansleep(ctx->sdio_reset_gpio, 0);
 }
 
 static int pwrseq_pcie_m2_vregs_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+	int ret;
+
+	ret = gpiod_set_value_cansleep(ctx->sdio_reset_gpio, 1);
+	if (ret)
+		return ret;
 
 	return regulator_bulk_disable(ctx->num_vregs, ctx->regs);
 }
@@ -562,6 +573,13 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 		goto err_free_regulators;
 	}
 
+	ctx->sdio_reset_gpio = devm_gpiod_get_optional(dev, "sdio-reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->sdio_reset_gpio)) {
+		ret = dev_err_probe(dev, PTR_ERR(ctx->sdio_reset_gpio),
+				     "Failed to get the SDIO_RESET# GPIO\n");
+		goto err_free_regulators;
+	}
+
 	config.parent = dev;
 	config.owner = THIS_MODULE;
 	config.drvdata = ctx;

---
base-commit: 1a0586064ee1fbcefe49b6382ee17a236c590879
change-id: 20261026-pwrseq-pcie-m2-sdio-reset-015492a846ad

Best regards,
--  
William Bright <william.bright@imd-tec.com>

