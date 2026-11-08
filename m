Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177746;
	b=CY8pkzMC3GAXwDX6IaBunAanZui6HePMoWYIcugeYeMNLS7VfTfCPt5YBe3KhZJKDzzG
	 XsqV2Q0unFm03x/6aiU/j21Be6QRfNA4SV7C6wWNGsl2AKT6lANHA3pLYwHPyiLl7unut
	 WV+50KtqFuvyCq0pIiaFenmA2yKotzS07dU1l6Zi5VG7HlZXqCLtTu7Hkckpt6KxWYWrC
	 i2ox3wKthc8o4F9csGisub/Zwq/2QssIJJyD7btG9JW0a822u6PldI/fY4EJg8W7Aq18E
	 +ONWsiQIYJ+LzzrHb0ml0OvdMCXGftJ5WG6AzzJu3r4+8EMGIUPl8ycMgcYQNA2Jsjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
	b=x4P4Qi87qUmEjB2ge7l6469PabemrXgidsPrluujyQJMPQaDdrNNHQsXhWoXV/FOerMl
	 pfrckYe/t7c1FBriuwLiKe5I03uF+12K5pNVYKJkB4s7EZrgaKeJ+EqYTNyrr3X6Kg2ei
	 njf1FNl5iA800AI4sGNBpHedrwuVthFbzp4LVQk1qnQlRFgpQ1bsOvMXlRo51RSIXE+um
	 AqUDz2WFMIFbUOO4H+hDHx+FVnWFs8UiTKiCEk/KJoeFnQoH+eJrUDp5BFqHBM2hgl6Lm
	 +HEnAeQRSary/J4pjBqC329mnjtPvQsrF2+OR9YNXekDbTKY/kUXoT3bRps7XttkTHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dw2PLEPD;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32552606A339
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32552606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dw2PLEPD
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-53a448f86e0so129959b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177745; x=1794782545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=Dw2PLEPDbpFCfu4XxFCaCh1QZeg/ALs3U+6/YbXln+vntgLeOlEZOPaj4Ra/+X8JVR
         MBBFo86JEJihjptEFJITLAQ8K2XSOIV92ibo2YsFbJVaOZBpx28ymhupeCVGUh0HGjAf
         CC6uPRYK/gNcDIxETqrlPjijJyFsXKlWxxklIwtWb/ZQYFYAfrDA3V3NG33uz3ydY3Re
         R+Mhce0M2pX/mFH0kNJLKydmAWEJych1vXeWFVNUh8b0PAtL8R+qPiYVvDh/NQpIGrDb
         nXl4cg9+LvDNMUgf3fVrr+6siBsrfdffSSbidfxJb6bRMB+K3tl3ZMdFLb9rp217ptqE
         tLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177745; x=1794782545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=XHF/mUvWOk9EVXvO7TTADPdK2XBI0fWzNA8TX1WC0Iy9LWcMxjHv6LxQiDXTckk5mM
         iPFbgnknXLINTHcNhTtxzXc3hZJG6gbm67NgC4vqF61tv8jn2rPLGMrMPe2U7ZuyqPZv
         XGf8BxTqKP59tHV7Okaxk89Xy6yGQieXs7J93FlC7+rkrMLQ/LAYa3gFM/QAP6mcKY5G
         ip4/lOFFM9wqXuG+uzvMGvyvR/UtkrrlEqjI6BGlV+gx8Vd0CcBTyIKeAvyxANv0AV58
         hNKmUlomNkmA5yXXBZ3hmErVGCOHwrGyuyUpSJMu2IiN15PYGRGgR749ZyAFnUOVR8ps
         2hxg==
X-Forwarded-Encrypted: i=1; AL+hErEOSkO+0+bg9XM42CsA7dXebMzQ5NTVAGDqIBDgXxxpdBUi1lM/lvDzVLV89017ZejKUopwjEcJ/vhMDVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qcx7cg0lxKxAme6cvhpZQ3uvlG/Z4hpW0NVz0mMyw/roidY8+
	SaLoqCWIJIPzw8o4xGexgHLYXrljfrLznCoYpsy7X7c9nU6TVWB8N+4E
X-Gm-Gg: AYBFou3yslEEigJMdRrYSOBaAG/J4FyRp+DoDa+Y4IrnedqaqPlp6VZj+2VwLtGs0uG
	jrGvWZR7FM54Qr93yps57YdsLdrWlgw9vOXUSgehfgKWvHvYSc2uCnnL9DaAgQPfsRcxXpT90/1
	MGJzNN36MbYm6LRNvBxQJmdEi5Y3dgwRDOThEldU83QpBSOe2SqyrM4WVDhIJc7GiWxRb/26yTQ
	Gcvx0aFbuum7QKUJRQ6WE9X2yhJfcNQmqwHX8vIOFcw70YJV6a9bpT+iUuXx58V04pALHrQzHA9
	f315Uq6vkabWfVSS1qF6guueEflGAWhOX0BDDv7j7c/WCD2KWzIS1zFLzllvVfIyYC3KHGBFNUp
	m/99nSFz1AwMb9sJvYRJLezI5bClHc/BW/GM1Uv0wYvy0k+E1Q0IUO47SKb9q9oXrMBmI6ewRgk
	j80osuOOa/TqoqCTDXd9FIzZB7UWO77KxyOW7dM+aysGrzVgF5Dl3yVkHr9kGG9PFPJ243So0qj
	RelLtLJ8iPJhVXMdZngnb/9koHnCfJm9o+vmdzcDSfH7fyI2qZ6PYv1bFeOPaM9QnpLRWW3Mzff
	KwZ6d/Ib2mBRWKG+PFjBmRHrF97hlQWwc7iLw5TLsvcCunF1dwjeBMf/yhwsTAs/qRA60MbDRTo
	8t5qo0+iYW5Le4ojxExH9pDgAoT+Bci72sFUJhTZpRrM9i97gSHBourDk8afm8TYhhNQ0i/KuA4
	Go34C2Wdi2MgHxdZjyFnzwnRZSIazWk/3wXhKccbmkOEDyDvZskoD4
X-Received: by 2002:a05:6808:191c:b0:4f6:3401:1c79 with SMTP id 5614622812f47-568143dc9bemr1634647b6e.49.1794177745010;
        Sun, 08 Nov 2026 14:42:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:10 -0700
Subject: [PATCH v2 3/4] mtd: rawnand: qcom: unwind registered chips on
 child probe failure
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-3-4a8704cbf7b4@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

qcom_probe_nand_devices() continues after a child initialization error,
allowing a later successful child to hide failures such as -ENOMEM or
-EPROBE_DEFER. If the last child fails, or allocating a subsequent host
fails, probe releases controller resources without unregistering chips
that were already published.

Fail probe on the first error from an enabled NAND child and propagate
that error. Share chip cleanup with removal and run it before releasing
DMA resources or disabling the controller clocks.

Fixes: 89f5127c4b0d ("mtd: nand: qcom: reorganize nand devices probing")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 062fba9eaecc..14bb7f3d6c36 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2085,7 +2085,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		ret = qcom_nand_host_init_and_register(nandc, host, child);
 		if (ret) {
 			devm_kfree(dev, host);
-			continue;
+			return ret;
 		}
 
 		list_add_tail(&host->node, &nandc->host_list);
@@ -2094,6 +2094,19 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	return ret;
 }
 
+static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
+{
+	struct qcom_nand_host *host, *tmp;
+	int ret;
+
+	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+		WARN_ON(ret);
+		nand_cleanup(&host->chip);
+		list_del(&host->node);
+	}
+}
+
 /* parse custom DT properties here */
 static int qcom_nandc_parse_dt(struct platform_device *pdev)
 {
@@ -2184,10 +2197,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 
 	ret = qcom_probe_nand_devices(nandc);
 	if (ret)
-		goto err_setup;
+		goto err_cleanup_chips;
 
 	return 0;
 
+err_cleanup_chips:
+	qcom_nandc_cleanup_chips(nandc);
 err_setup:
 	qcom_nandc_unalloc(nandc);
 err_nandc_alloc:
@@ -2204,16 +2219,8 @@ static void qcom_nandc_remove(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc = platform_get_drvdata(pdev);
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct qcom_nand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &nandc->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	qcom_nandc_cleanup_chips(nandc);
 
 	qcom_nandc_unalloc(nandc);
 

-- 
2.53.0

