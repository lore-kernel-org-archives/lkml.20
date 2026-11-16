Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810642;
	b=KKBqLhn+bHriR1Y2qhVuQ0qUWQYxdMFLZyivZPjm2Q6IpMJz8q+b9hbJ9lUk+gaUjo1F
	 sJ8KIGGN5TCi3Ln6d+bQZDn1XAddTUJc1zDPCppChtPg0EjYQz6Ijne+/BQxckBzBuabC
	 hz9lP9XjBIq2KhC4UbJHdxfi/poj8DMRA9zJguKILi5dJ5IVU/zTze/y+fHddw9Dta8US
	 vLtWabMhKFOweup1+G2DkVZlsD0axQBxZem2cMZxRVrwXefliKwkqAOsXpbCBISwEmOVN
	 x44j72baaNSD8pjx7rBOx74qPR7hfLjbMh8yworNoKhWQzDK2J9WlSbBVqJEbJIcBwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
	b=SlFmWJuKL9MuM6uk4bCCrKp9OKWXyx/TljjlaX8bu+2xpl+qWTp3OqcWKmwcpcycmRo0
	 qm/EkqaVS5eCaI2TXszQKZ4QsOofRaTnNGpeUJpfsC3v73mAfaGilwtP3SY4e2nEjiDW+
	 +Hhgrnor+w+xceZfRNmIJOIQdWLOZxNxJgV2U/eImI7NuThg+5zdYMBPx0w9YFUpl/EXt
	 Ek83IUtT9iywJ/EhfhQuPHqcsTQ8Vg2YNoVsbtQgdLVs0po8Hc7zwAMBa3FZdJ3vhmGb1
	 +CDs+MocvNq4qLqKu5saMxkXhMRR9PSKv9bAb2Xfdw4eaNGCyymg/BiKzWKhfYxSSKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDKlCC3C;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90294606C22D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90294606C22D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDKlCC3C
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71ad1db7e31so819544eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810640; x=1795415440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=cDKlCC3CS85bnz68lCv2bQPtLsDZ7H8iMxt1oiPquBv2EjjOlPYMwi1MFCz/NSAP5m
         lFQtfp2fA8vpTTG87bPc5utLTQN9PD5Xjkq7OgHOKJgiQREANTbceyqdv8IaEFhXRIOA
         tdA0DEBoEgMin3jA7QxvQ1gET4aVqTOeeDkChjZ1C9vEC4kBwAQHXYUo99VWfa+zI99O
         VOsT7wTTm66p9wVb4MP0RNnZtM4iVzkAdNSRMFYeWdwWwpeeAbajoY0AtYngbe/6q4v0
         7EOCNm3CzuDf/GW4lD7Usib81tdzvNU84NmOBS0IRxX64rqHPbeK0VKie5UxPqpFbSCs
         zV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810640; x=1795415440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=ciogP8Vk7INO6o1ODaM26eb8nd8jGe/TjBMC9wof6ROJNbhYiH/nnwpP/nwyEkKnhp
         aH6gKQ/K0Wj41ay1QDRywh1MJjBIHsXHy69vMYdg52RSzYeWuXWvgpSOfKZ649OtC9oQ
         vQnn/ztPcPuxMaZZBkMEPG6I/JOATe26XWQE9TnleDGpZb3TYiRLL338/UWArueFS+g6
         34BGoa4XtQPDfQQynyBdby2DVlRHKlBq/tsQDkFM1keWhk2TNv07JSifBpbz0Im+eCRh
         /vIaVFOtzuL/agDH2UdRcGLIACFiLXcv7QiulhLFIm3xqqhhXilLIno1Xq8/HiSxYJST
         gsYQ==
X-Forwarded-Encrypted: i=1; AL+hErEzxOwXGiSKviyHV9kJqQQC/8rQK4rmimKnkreSC2jq0mFSFLZ5XfIjMBWwCp9h+bul3mzQA39U0iYLtXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YQH8LYc+25o2a6TOxyCsJHceyW1AqBNFQFFAWAI1QZcy/twWa
	9jbO2uSV4z+4xQ0pxrlItYRyiqftiHv15/2fF+UsUXvzguJlYTIVK+5F
X-Gm-Gg: AYBFou37vuZfhDaPecuiAJlCIdILY+Nop7nEAi4VQU60vIJUROJ8yKbZiAAVavTxIej
	PLR2LGsAjg2F20zEuHf6zJh578qoUkbh++korgWS+uFtnuePlIpIgDFa7GnyYVY9ph1rU8Vtjs8
	TVAcZ75fFvbE0OQs15J7e2lb6WwPmc3FX5TulhPT3dvwCI0qFqrrMraoelLmWtJhb40IH9Ki11m
	Mn7DsWRgCtxm4aALjbeWjSfnbsvmukJAPVBR74gfZKQ9hMsmj+M7oJ0Grxn5xnzhe7U7wPbynqp
	c6QlMKJlHKYUwOksDVuRsjoSxlsO9Mt0SIE4qSOIGqPo4FmnezNOo5v+UTGEeOKLWTts7DiUrJu
	qBbkbwAexNHDn/cvqSRYVsNn58pjIk/6C8r5+oAFMWn+X0fswMZ2upoZHC8o/9k6KYz4HRckS5a
	rxPYYEH14c81FxhHxsgtmRjS9qQZB5DZfITwwodV1t47KImog279g4xWKjYEU0y53ZD88qjU98o
	6taH82+gGImrJO2fdjxrJ8dyPIkmV6D64eYwVBGLya4HTiwUKiJ72hQU9BvT1dXGa2sVoC5CbGW
	Qi2i5XvgqfnARoZ8h2xmUm8ytSZuV5Uwvh4A0tuk+h+QoUD+R60WAh1lJ/cKC21FiYdXq1isPZs
	6XAkSOZULRPgT4Ieul+DNG1dLzsOsTyijCrjSy09k884KeMfuWWfb+PgiKzYW5BPm8/2JXFqtsS
	qiRz52mQGQnPXSOviD9AyaWplA1qFVC+BIBiUMoBiG4gJAwJxXrM7PmQ+PffG2F7AQ+mfyt2/n
X-Received: by 2002:a05:6820:1385:b0:71a:e932:868e with SMTP id 006d021491bc7-71ae93289f4mr1578310eaf.5.1794810640534;
        Sun, 15 Nov 2026 22:30:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:00 -0700
Subject: [PATCH v5 45/58] mtd: rawnand: sh_flctl: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-45-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 36ba5b3da3a0..b230f5ef448b 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1119,9 +1119,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1192,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1218,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0

