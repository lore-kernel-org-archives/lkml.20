Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810627;
	b=YDuZHg276Is+h4Eyh+sNoCfZzWhGHsJMjeAxm2pj3tM8UvHlwfAbQ3I8potuBVvhLNWm
	 aYOqQiBF1KgdmDQOTstn97XMjP8VV3HfaRvkk/Sk66hPekB0Dvj0bsNymFCjuPmDMaFrt
	 PaL8CZ1yB0GplkLo/uhuP+/qOmZhKKgOz+VUOZ8h5qaFQynAZdt+W6y5QE8XIu9zG8Wby
	 ZSdQtvAKIZ97Ak6z90zrvatwRWLv7aoJ3Byko71eft7Q6ZiFK2DWuWCB/I1zKM0ubsu/a
	 avbDPoei3xbuh39oc4wrx9t250TwbWWUlIzKcAhOY4/1rLPc9hzyq+Ky9xMt9SLuHHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
	b=UFz7oHTsAoYpyj8vAkXp7j+nD0e1WWKyWbOuHXrb8NvOdly9q36+p9sE/9gzS1iHMk+J
	 p4D+xjLahogJ9xAuAslVmHHygHj7ObLPxhI7IgL53aMbMyPvhYQzrgm9AQvK2qQldPrE8
	 uROcB9s8EW7vw3FwnSvbVW+tNjNt4MwwmNWIdXGZ2SD9pCCxPoNK+gPYJTDw8hoHzUT3T
	 /aXKUrfZ0PitEk7rhIcgIAK05JruoNwmJQ9bsjCGVRdqfX4vSOlJd2oTq9sShBUi6lhgn
	 l4JnGYCRsrQEHwotT75ozMMM/ZPwzE3w5d1T4Pd8g1LhWHEgeIzBWr+xpJko/6ViGjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbjgcJj;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE3460A6F7C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE3460A6F7C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbjgcJj
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b19e291cc6so3902936eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810626; x=1795415426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=ASbjgcJjPn3fk2mxLXnzKQhsoHsdw+m+Vd3QMKjcdnmq34y8+810OfkuBzdXZxHPsJ
         ILz/4+c83cvooUV+2T+LAm6PsMWtpyNIqb+ANEUZI9vo7rqEk3+nNcwaxc+ob31RCC9R
         yA+n7fyXYPchzegsmj/CQQwZpH+xQMPfS785F/ZqrzlQ+bZq/W95O16OTiQvu8h4YsMJ
         O3+rhkXdv97CLPkwyDGaYNZA7p+xsMzeoHfjYDAkSSUQu7giqk2Eho510vG/OX8GPUZd
         fZDpJPFo6P5QisS3r57CmJ802DnQYFfUYUS9v8jh+wTOa+K/gSe4x6XqPVJFUi6r/+Md
         VMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810626; x=1795415426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=i54IB/fSINQR7YeWcuazzBv7o5k8QssxIadx/y70o3iGkuGlCRHEu92RRQOoR99G6g
         86ecB2CdZQNRAs5fB+cMmNxxBg1r2o4Udrk83dNbj+pxED1PSCKWXMDfrMhIE2RLtcU2
         IwMcRC5b0H/S1jTIPttEHfUfP8ApiPQSBJKrSMgTx9h0zzxLPeJreiBEQvJ/9AvTz5iO
         inV0HjpTZJdfsfFgEAdArtlXept4EPUw9q20jmnqSWkaIIzwIrVCNJtpnkeYP9yipc5B
         nLnVaWlOcYkASL9sbYIG3Z/ZJYuvP9tZQGRgVrHFa6CnXxrYNYe2ksOpSKA4Cdb2r7gn
         m0tw==
X-Forwarded-Encrypted: i=1; AL+hErH+H8OpkwH+iTYb9a3LvRkwpHfsx4NLIPVkImeDnYWA4++eXLMUVzaXxOV0K+I8EXS8daaoaf7pt7FPbRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pyNw7RMNHoEhshp/+yJRAjyKdCzNBx+kN4NNOHRt4+esXjFPB
	oASw4Q6M68fAElCPm6FnS96j9DVmN3tvZTvMxKSCmmJjqjHz185ivMnH
X-Gm-Gg: AYBFou0x3cehqU7YYNIWiqv4J8RficG5ZsERyQ/HAIk4WA8v82XFYPjchvPRbNyuh8U
	2jMubtBBnekWJ1voHQrkQ6+DJubqEIBYuqRHmbos5P1k+NE44dGV8BDnTimJE1d0ShI3skbcxqz
	RJ756aONdOol5bEYPjgFmq3JBiylUTO6S5N7170xF37V1baEBXCQNswsveTmoxnZgnyEMG5Bdau
	Ya5o1cSRhasWQDiK8tJkmLkB3/JVHyngUNnEXGi3+VpqMpSHl38q8lWcOAD2VzJMU56O9eHm2hz
	FNNINz2r+DahP2Gb3ECBye+byKME0Oq0c24jAxv6A3oCGueEyUx1+zfjdtCmQxJfAhV8+wWXrpc
	s5K8eieyJl+bklfhww3M3tkTD9kE67ONsoEacM166XfY/FbSjPD84iFlYyXpXodh/iRvOrN/USZ
	Q7V45U8AkXcZKQPEobLcDrAillTyLrlMY8r7H+TdcT5B8OB+pHmHWYWy29iPZYNu/gPqtuOFuc9
	ZM1x1jsLFBCfItlhn4jD74lCjtqA2yblWebpU4nMi7S3a+4tuxhKh5bBRtyDsL6IYsvXsNqAPfG
	VpPJ9LAmvj22STN7uxRb4bbISPy7N7HxvWGNh5wF1r0RZOaC5Kr92R1JiBBuLw86ZHVlq8JWLCb
	YgFqBXBMd2X9QIOx6sf4F8ULyKiMjcy7VjkT/add073ELJ0WzS7ippEEK+1FgLbHpCQU5H/wc/J
	Nxnw1p5qgOZY+yIpq3RxwJGO27ziRK5bcFNvNih+DwhUjlDHH79y8=
X-Received: by 2002:a05:6820:1517:b0:6d7:4af6:e292 with SMTP id 006d021491bc7-71ab4cd94a9mr6597662eaf.2.1794810626312;
        Sun, 15 Nov 2026 22:30:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:48 -0700
Subject: [PATCH v5 33/58] mtd: rawnand: gpmi: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-33-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.17-dev

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

