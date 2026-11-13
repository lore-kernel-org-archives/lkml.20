Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593769;
	b=hM4xyZxJ/JyDkWOM6k9Kcbar/pKCuH/Mbc/Vetr5eTwZHRWYLM6sfJhmavvkNmx30Zpv
	 yfmr80ITI532ufU6wrPSuQ5VA8rfUAyZhR9Zdu4K6RU6iM/JwsfrVm8GPc4YMehWXd/i/
	 8ebyb//K2PnbAr8nL0+p0j7rdA+/LMKctfcUheO3Z0ZwDefvUINRwDqDHL6QLQzta8Al8
	 gdwTtAXJG/Vf8FizV2GtZtkOmcQdZ0DmeXLGxrS3HmJLa3JxWHpMIOgry1vnT19komQfZ
	 hE4S0dP/+6OQiyUr4iI8p7Gi4bBoEWqat4+cLbLXGi79kWKtN9crURJDqA7z8iuURVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
	b=1qvYt1WhN1Ig7N44I5sFS4VoSjpfT8zBG174oXZd3mm1RxoZYPFQR87SvbEVlNiYy7NY
	 2svYs+28lsDzsqnGFlY0/iO03ilqOrVmKxybBfAoXAr/2coTfu3UFz8mSesl8J6SViWwt
	 Kh1OWu+gveExQz9+2yiMMTWst3x6Bhz2nruT1l5Ta4kSCrGSAVixNHQa8aECqeZmytZc3
	 CK+af/h69N2wAEWBSh9jUp5W6nzUMb/nHsm0NA6AcIBMzuoYNCEmbS5vbsExXxqpGKqh5
	 fPWIPwiYqsiKNZ4Op2T7My+ZX7NwA7cAeErlvlCRDn7hqgcqQgHVnMwBWCb9Pv9GpLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="G/qvvXf1";
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728D460A3806
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 728D460A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G/qvvXf1
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8479f46ecd8so449075a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593768; x=1795198568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=G/qvvXf1iwZGUqcOoyqgmcu3Q6/BSvl+gmWGsd0hpfcqQ4ak4UpxQc5bz2jfJI0QcE
         Tlp/MpHEA5JcBYy7n4I71qb3fM1a+KcGoZtnKL89lTkMbtYCbKGyCTeZhUzUknfoovsq
         rJ0Voa467+YCKuZt++LmGIOL3artbgeCWeXMRuVSX4T9hHoCI9YDuMjojm7atR0ipsHM
         olXEQ2jmC8JHA7RAK8TVapf9FFHVAEr5H5cW2dQ+heO4Et6WIo+GHDGdi5xFIV65mY5Q
         zbkm97BblJbSOdm67rO6hvDeSuDlvk3rWA/NG1Qm8stwbXetACnuKjhSDfxZUBHMXm7/
         0nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593768; x=1795198568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=US0pzGL+yXIhyVe5ovYoqrtZBegmqDw9yBiV+OK5kmRbR5pSajcHO4KCz3xInPUZz3
         9unikLCUoBOj1o/puy+/EMEUMH8nzWW+V8nOc4Pm1zKaV4VFTLu6z4d7G/fk5kRHGeq/
         FWkvlp0IDNn7SA76CdqXw3y0Lx0xbdE1mnW9nNjRCX2I5rLnD0bslrqEQhAIyOBPougN
         JjgB910uWOCB6m2+uF2/2L6g/FRU5CuFzoe9k00+mA4eCkoD3o1JKmSRj9nRg7/7uKf1
         xRqw9a7wcSUgWmPpB8XjoLrvsxbbVy6wJfYX0phcPlGzj3UnpJuE8a8b08sUZzmBuSBy
         pHNw==
X-Forwarded-Encrypted: i=1; AL+hErHbk/tWoZbnRkSipG/7dyNAtj3KvEUod6ByyOHGH19Gt8N9N+D5PVMp+29qu8Q4ixQEvr9TQcZkW6AgxSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BoEOyR/Jyrv8dfmrOwAYZuYLiXFaNxq5XBePZl4k2tKR4Sx1H
	Xcpoac4lI/ZJKf6gPnZ68BRwOzmWsq1rxbTHJucNclyNr0q9hCo2IPEDfi8uhmSd
X-Gm-Gg: AYBFou0FeQTbSNOl85Lvb8w5dy9VI0bv41bS27IhIUA688rGFTsMnV1hWE0EcPhqj75
	vCFVmYl+seXo46MCNbY1fOywPeQILTfNtZWjZKw/3xBSpp593AkazzN8sMgYqSnfjpGo622baFd
	JqdKD/hPqjqIOGbRqFZvK3ZK6TotYhC2bl1fu3/ggdlj0xONt+Nj3XPBMIyiROpIzCaPKgZ6DLg
	f4ARovNphB8YGq9DCf3RCfojUtrKL1KpeYCQMG3rOSIBV8vKa1D65E65oJjwSgvUsvjY5OwFmSi
	2NoxuFAUSlu26bUDOK4E3AHgV0z+2MyQFqGDY9Xozqf4PSj0CGBCEmoS3V5jXsoKNJcL5uFLTYA
	AeblSIuEzepwvX8p8AnEH5m2lNUvWDLPjZ5jCMWbehwwB8K2i0VRiPsGzQ5DqReLAAJ1akkEa5v
	IIXFarf+TKKFJ/LOCXAhpymgUTOQ4wZCd0sc2SdKP7urzv0qp2D9rWqzOGzS4lBpjYa/w4ZIQQu
	eg+x/FLorkN28e1krcRxV3De0fcBE1E5qci3MOLqyo/QZ5WeXwE5zYYp9fUkaifGQnbcAWN40i8
	nKPK5qJephVmyIRFApJzlhL3O2qbJm8xAVD1cr48jzj28rTZ39OVJHNhd98eQv7ay6JxcoVt2ou
	9oH9TVqdcErucKRTR1FKkH8cHNp+AEM5hrYqfAeUIhaxs2RAZi/DCZuctwG4+pRAL3LyCKRPoL2
	6JVP9xOXneLpx5oWGZtS/6NXzgvo9Qembxn1Jv99y3KpH1105ZZDI=
X-Received: by 2002:a05:6830:3489:b0:829:8a9b:de79 with SMTP id 46e09a7af769-8628979e4dcmr2843473a34.4.1794593768395;
        Fri, 13 Nov 2026 10:16:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:49 -0700
Subject: [PATCH v4 33/58] mtd: rawnand: gpmi: retain open-handle state on
 removal
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-33-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep geometry available after removal while releasing DMA and clocks.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Han Xu <han.xu@nxp.com>
Cc: imx@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4822485bd512..8fc78e679f0f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2787,9 +2792,12 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, this);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2846,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2854,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0

