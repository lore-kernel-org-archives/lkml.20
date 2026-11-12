Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446961;
	b=sHTXDyBEyiWJQOBxErEhYKgRYJ2Szq6+izxm5COIoW96OFnxEixoiN6dzRH7P0egKnZT
	 r61EXCiFGEfIrLk3n4H7XIqXQ+1XrTxtfp6NmpvcZuNsm5Vn9TY0YrYsBWM0KzIqSr6qs
	 DBhgex09s6dL6VHi7loyWoEpaT4Sy1tJ5hFk/oT6K7Ij9gALC1cq8vuecrbokLFK2rd4r
	 XnybYN4QtbA2uBR7msYdtAEjNIU9Qrg1UKrEpLqVnEk8+FfHVPRus8sARu2XHqX5Kz5+O
	 4sYTSdyzDWVLOiqE5SYdnaOxsd7LQzP68rdwgCRKdEXJXfq9SvA4HnORWUgRKjxj9lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
	b=cTEXiZMLdtBgJ+e5lDIRlYnqTzsW3vNcjdqG30700laYkrVcAfgtj/JGZoNxZlIusKyL
	 ifLYaZ052Cic8qpeJAl9GkKPvLHAUeAEWmVTyXJ2Dte/3lWF2o0dayqcM2EMwX1Fff5lr
	 4F6BoN4UaU8kxqoSfnRt4y0NJfkYyEw7HkFCJOmkIWtXxDjXLYORdRIZGS/J9baKipQwY
	 gRm6dNEae3yYt/vBHBCvMGApags2XB1xTVIudc0JhWimDVM3aaIyxuiXJpshqrRF6jSkn
	 261BWZNpry0vV+mdnVmj2N9GV6hhczqbYqktaLNq+rtCT9ewbYjb9P9tP6Lgbm4qOaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBNoCVS0;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AD860A2624
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AD860A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBNoCVS0
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8446af403b5so2268097a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446960; x=1795051760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=TBNoCVS0nWQxUFERufsrjIHLl8AkKiuQKFLyHOPsZzBQBnD+eE5Y/Sg16ThlwgeTLy
         I+rSQDhZexH6vnVRT9G2zYfD8ZawNgxKinGt7hYEA54UNSkv1xmLTN/fBbla1q1jKt6h
         qO5bYRtv2JseMEZ3YOQPQwnY41TkVVgEzDLO2y1ZTf7smSNqsExOhYRMMDUeoGB3yBeS
         NTbN5Y0hGEIgnEQmsNxu1Jkjt3WiU45/xGpC6TfAkjIxXS2JCC95hSyOJNer3bhlZfpW
         mVJ9v7A0/eZnaNHV6t1tszU3oA3YFHouxbknewvneG1GfaxEw8ECiCeSg+hni4xk3jfp
         t0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446960; x=1795051760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=lpuse+15kq0wfpksJyP2W2QWvWAAZ0UHfXk9GQMQTYCR+FPxQjq57AyCmuwbuQPXfj
         ABDho9kqaFQTbUQPK21DJj0JGbxroM7GlWIwMAWdG13yT6dlPBZVvIakgaP9SnUlcs3o
         txPFxN+lYw+nv9oxUu2lHQmYvIkFWgcKVGxUDmzfUuYPKEwwsIwwvTxo19aulgCmXjHq
         fbeTHa0I+q5O0OFnMD/1W8Wcqu6Em5akBRcI1UijD3cLEcqLPzMTldE3QNMRYmWZVGVm
         X320cLxvptO6/1EuSQDQyi8ZXJQJjj0LFwFDFqSWBgsf9v47RsBiHNzDtdVMIyefRddJ
         yZVQ==
X-Forwarded-Encrypted: i=1; AL+hErFXhIlKwrgGU87czwcuoUpViJ/7AxLw9ivxjjnYK/F04ZqjjlWOs5rKZvi1ztraxFovPVikXoDnX38z3i8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SfOrB3eDSXQLV4s9p4X4cCJAtna55Szfi/vF08tZfn1sJWLIl
	Qta82yzv+BoXAtYAZ6nM0t4y8FgeC5VCIcymZnW0hWD15dpr9+ORv3mX
X-Gm-Gg: AYBFou1fKN0R6LbKQl5pCSSiu7tsC3mTCREi9e2lSX8OVPOqId7gMJgdMMa8P6bO1Kw
	KqpPwCdf7pIIszOl3DHjY18BcAvRQ9/9V/cFZqjNd1DHXNvrKknNi0bMaQxew/miM4nAVJM7IKs
	zIJ/l78wp9PSqlvQlfQmt6u3YCAMPt6M27ulNUA8ucUpHlF53esPrM5TMug4v/b59NCxOLoNkk1
	7dv7aWLj74ts+tkmupk37ySl/BV1Fe7qwnBrKSG7k2bHrkOj2s4s6KN/Nd5oodv3Lj0MIBnJWpu
	BNIU1qdUxMrx5jI4C+EMtzAknHYDBOKWYtcyfEnmPPyu9GQCno0Da9JDutrl4c+N+gIWfTAtiiR
	3jr8ALorw7+0PQMqGr3282Xf6b8hFyUWyuLLCr+ThGcdvT9+y3D5DFb+IVdcGQi2LJ6aNUH+ANl
	TsDdZ53Ep+2MWbh+GnAva2x0zzRREhsZwB188S4RujjkzZKPi1ZXbEQZ9mKdpha8+COmrG41W3f
	nvW6hwz1ZO7gGB2ETglcHOSXkgGVRNFVZo33VrSYnxso1dbvxZL63sMwPlopfPe0n5Z/YyhNnz+
	mE62Ujq0cnPsI/ik57u7HQN/Wv0y7u/gcvW9qnxu2FBpy2bci2wOuPexHJ2PE9kn8IRIy0qsdKm
	XoKq0YeYS78ZW0/VWZ+h+BMaq578xAD4aMec/1DDjmUZxjK9gKkylN1E+4x5peCya0r0ZOketh4
	nJZmPYiI8KzewSKb+aRwTc4KIa4AAbD9U4KVfYOxCMoe8Mm5evvhGo
X-Received: by 2002:a05:6808:c123:b0:4f4:b62c:a3d8 with SMTP id 5614622812f47-56b9751ceebmr4316576b6e.33.1794446960103;
        Wed, 11 Nov 2026 17:29:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:26 -0700
Subject: [PATCH v3 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state
 across removal
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-47-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 408b2aba2fdd..633d09471760 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -687,9 +687,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, host);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +799,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_lifetime(nand_chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto free_irq;
+	}
 
 	return 0;
 
@@ -830,7 +841,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +852,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

