Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467036;
	b=3A3612kKbyvfDMPSSMAgeaa7IwKNqvfEMEdfvdoTiAitGbtxZ9aCN6d5vlJCJLV6NS/A
	 /HAsp6v6ynaq510UlQdJyfLeCX0GRzf3rFPkk+93ZA3kTr04zQJB9VldLdXsqUxDMAl1B
	 gYC4LucsGJ2O+IRTVCSEGVS9Lu4a+Fcb8s+4WocWizyw8Jpcu2J50RbXYEymxvw3TbgrC
	 DDMPqL/z75U8m2l6M7d+66zlfu5XyQU0YO4W00W2d4nHVAZp7xw0ZnfTu1cd59NTK97z3
	 Y0HikI/eTI0sJ/i0lY0Ih8D4elsbrdh4H/Ly5cZgrprA8rv6Fwb0aplqBiBvhyqO9EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=eyUouVpnZGfif3VWuPv+zR8XYoo75xxjg1KonBFeRN0=;
	b=LseKb5HPADxpX8qAlIHIFpy5TDR75Amf6+++Qfnx2rbTzn4PiZoZ1/iuP1d37Oz5eRN9
	 rM59MYe4SLDejqlc6zgzYmFaqNN9cv02DGJCzfv8FVfDe7SIIVghxMPTQw1Qhr84uLAYE
	 F2K0EAgzyJZIJJQpIktuWAeVZSPfSNqCgZWwwAdqKFAvmOJqt/K+WzDS4agA4Bn/dSIIX
	 0XIfGZruOhMYTmJENS6PvfrMtxRbdGBt381pH2SphrLdu4bCAKz1ZU0PzdCDzanPUEARA
	 oB+SOO5njLHwl/8cb2qq5cOVrePd+1flfyvLY6Am2NRZ8LCfcJveD1+1ZQ1bTbJyRkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4GxaJ2o;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849E2606A883
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 849E2606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4GxaJ2o
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91eb5559b34so29482986d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467035; x=1795071835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyUouVpnZGfif3VWuPv+zR8XYoo75xxjg1KonBFeRN0=;
        b=B4GxaJ2ob0yOBMg8QtdSBTXjZuj1RHSf8s792QA+V9vftReqKTNlcJ/qAiyLXwGLVd
         9k6n2FtGjJ0kNf32avhaxr3z2REIm8WR1EBjwicJIEhovRgrr48jSzLQZ1h6c+NNxlr2
         yMPGcE3WgTy7ZNT3kclIj2WAb4YHbos65NVxULp31l/G9C6OTiOqqFI5ns3PF4pVCadn
         wNJJZrRLHta62uw25s5DDuIFzZUZPKUoQncX6SUOltXOLBcvsq50WBWFxVJeYWrKlIve
         OJoTeHf/FJLiYpIzacAibny4y7QSY9BmPPnhOS1LKxFq2222lJOX2po0KywvC5yfFVG9
         sabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467035; x=1795071835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyUouVpnZGfif3VWuPv+zR8XYoo75xxjg1KonBFeRN0=;
        b=xuV8IG6luOk2uSSqZ5wfZ9aOcUbX0r38PPFOBlHdU4WqQPiQrkHfz7GYm0A+0cjO2I
         AJBtfQ4SbEVsGZCPJV3iNKc5GeyvcqSiQqBBlhzmh4vB1045bEpYujUe7u0yfgx4A3Lc
         LQq5zF6AykYcxXzWb9RAyERiOMckf0s7XNdYesQ1O6ibEb0kGGOI1kBDL5fNUNLVgEy8
         ScWrvvp9puWrvFPeKb3lw3nvnbxREeMkL1UmMNHYb6h2YXkRacxpjv/KMuHyna8FPULv
         qcgTlT3Ry3N0TEGLcIjIREIb1Obm24UPi+Tw9QAs4/cXgFd6gHlhPHHkiV9GTyvWV8S1
         P+OA==
X-Gm-Message-State: APuU4Z99iaPlG8vfitUmxyDVbxaLg+xO7D3mS10oO/11yuKxjHMvn5vX
	A0VucHnF3sOmYH4SGx77DU0po/7+bRy/8EQv6L7aHsBacmqDEFQc/R4=
X-Gm-Gg: AYBFou0seDhmmw85OUiy9dOxiwllNdYdPsC1fAcoxIPPlkl/tzuZz+PVROfPnEYCK1h
	ctE79sHwSSxPOKxsoi2B3kJ+GJesGP2SAtAl0HYa0+TTxb/XA2ugU0wucx404Hsd/IQIeSLIgZW
	slMwzlc/fWHxWZhGaIeWQoJQn7uIvFqVFcNx6JNTCL8j3xYVJ16bgnNU9XVymVq/coPdoVtHs4Q
	Rd0zoRviBkeJ9qGmzyctqjx4dFQL6pfNXRnQkqqY/peXDhDEBm4HxRnETbtinjRmm7DuIOHtRNa
	84jb5ghkEfgiZ25ChE1I2JcuiKhq3XriToj+df74mQV3ffm5KIffv8R4nifm6R6bnd2H4xTSuqL
	GEyOC9RFMFSUP3xK8GfhPGpoe6aVxRnorMwbpHEzo6YAiOScJEyccJyWGX+hNr94f2Cjxg1GPGe
	R9cLKZ1sZSciexMA13h0JaMF+oYciEtk/FkGCuDrtNAhkZq+tsT17LuDLb/wQIAJ21x7uQe8BKe
	BKyamWzd9KSPHPtwHRbTw6hYNf9icQG5rj9FVdH3ihUmYxpDbm3+uatE2QJz0vEQ3YWolzN9x9D
	TdRRgZkLMPBeaIDlNE3mS5hZOriq8/N9qE/k3LOO0OLArqAoSSknUdnVt0AaphLZcFOxEU2Z124
	qwhBytZoO6LX3W6wB/bpX3k4qVKribpRwOovzu87sJxOrvtBK6Jk7limoNKZQ2YTjB6RRHTgtR2
	yMQ6VRilz5VriAItdQOokspUBKIHpOw8Go
X-Received: by 2002:a05:6214:451e:b0:91e:ef41:a7d2 with SMTP id 6a1803df08f44-91f04091198mr84093396d6.24.1794467035222;
        Wed, 11 Nov 2026 23:03:55 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f11e2cd01sm18137816d6.38.2026.11.11.23.03.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 23:03:53 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] extcon: max77843: cancel the interrupt work after removing the IRQ chip
Date: Thu, 12 Nov 2026 02:03:52 -0500
Message-ID: <20261112070352.38787-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

max77843_muic_remove() cancels irq_work before removing the IRQ chip,
so an interrupt can queue it again before the MUIC regmap and driver
data are freed. The probe error path does not cancel the work at all.

Cancel irq_work after regmap_del_irq_chip() stops its producer and
before unregistering the MUIC I2C client. Apply the same ordering to
the probe error path and initialize the work before that path is used.

Found by a static analysis tool under development.

Compile-tested with W=1 for arm64 and x86_64.
Not tested on hardware.

Fixes: 27a28d32b4f2 ("extcon: max77843: Add max77843 MUIC driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

    Based on next-20261109 without Hongyan Xu's cable-detection fix [1].
    The patches conflict textually; if [1] is applied first, keep its
    cancel_delayed_work_sync() at the start of max77843_muic_remove().

    [1] https://lore.kernel.org/all/20260728075429.838-1-getshell@seu.edu.cn/

 drivers/extcon/extcon-max77843.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
index c16606b23855..0d45c374fcb4 100644
--- a/drivers/extcon/extcon-max77843.c
+++ b/drivers/extcon/extcon-max77843.c
@@ -825,6 +825,9 @@ static int max77843_muic_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 	mutex_init(&info->mutex);
 
+	/* Support virtual irq domain for max77843 MUIC device */
+	INIT_WORK(&info->irq_work, max77843_muic_irq_work);
+
 	/* Initialize i2c and regmap */
 	ret = max77843_init_muic_regmap(max77843);
 	if (ret) {
@@ -879,9 +882,6 @@ static int max77843_muic_probe(struct platform_device *pdev)
 	}
 	dev_info(info->dev, "MUIC device ID : 0x%x\n", id);
 
-	/* Support virtual irq domain for max77843 MUIC device */
-	INIT_WORK(&info->irq_work, max77843_muic_irq_work);
-
 	/* Clear IRQ bits before request IRQs */
 	ret = regmap_bulk_read(max77843->regmap_muic,
 			MAX77843_MUIC_REG_INT1, info->status,
@@ -923,6 +923,7 @@ static int max77843_muic_probe(struct platform_device *pdev)
 
 err_muic_irq:
 	regmap_del_irq_chip(max77843->irq, max77843->irq_data_muic);
+	cancel_work_sync(&info->irq_work);
 	i2c_unregister_device(max77843->i2c_muic);
 
 	return ret;
@@ -933,8 +934,8 @@ static void max77843_muic_remove(struct platform_device *pdev)
 	struct max77843_muic_info *info = platform_get_drvdata(pdev);
 	struct max77693_dev *max77843 = info->max77843;
 
-	cancel_work_sync(&info->irq_work);
 	regmap_del_irq_chip(max77843->irq, max77843->irq_data_muic);
+	cancel_work_sync(&info->irq_work);
 	i2c_unregister_device(max77843->i2c_muic);
 }
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

