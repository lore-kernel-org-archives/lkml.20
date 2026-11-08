Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172606;
	b=cm29viKH7ytuWmGxxCN1uiVEEmbDdiJxEaMogbQTZ4I4d+TfHupCIhW4uoYrQHVFxo7P
	 vJTP9IjrY3hD1GpMH3bvOcHmbniPbSoXguhSOIPLQ1g9fZ+jELJGpn6aeFUIjUu0TptVs
	 cZE3ulOJ8M0k4tZ853779+pRZPDbzCow405vev4MaBGQBAsttbUg857+uJGsxd2kf+80N
	 YbbeJOD/6w0ALVPAx9jgQVx2sJzn7mcs7lS9WsuAGT8gJ2Cx6WSs4GXpThYUCBxjXg8u/
	 s/08pz4Yq06mrKLEA4KbmRkMmNycO/HXKR7tsKg7l4r/eo1gCpB/gMpKwcCNYTWtqTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
	b=bkFP4tJnHCg75mp2LGIZeM+IY0rH4kYggZep5bk4g1g+xApn7IlebzSETdMoDYTyefc4
	 Cf4Ej54uYJZ8A4FyA1W57zE8T1L6C+KT8bmbAHFoPRdX7j1oZLkDJdLoMSAnRv2R19UM8
	 NO3M/vLEvdZ9hiVyc5mcR/DEvsYx+Fr05mfqWX5a0sjfseRiHZFCsHrCuVtwiOFB6QTEi
	 BcswxaY1jooM+VOmg1V/l2Q9kuQ9wSSUyFS1Y6ewky3cjsu5jqMImeK2MNkfUMeTfrob3
	 NyH9vV7s+vJTai8dIdAmiD78T4aP8EVuhT52WPu9xmk8Y0t/YtiHPdJWZIz7KUFiZBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLiYNlLH;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1258606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1258606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLiYNlLH
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6ddef424972so233250eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172605; x=1794777405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=kLiYNlLHYt2Q5LxFaYwrrKJ3TOZo7V6oaW5kxjrB2UxRLknCa8gtM9BVVf3r/p+Til
         VEuBYQ5s7n7pxoEAWKPv0VNJfTbpItxnzGL2LcAFJIKpSOPj6d0HB0r68z6WwTshAB8n
         tJ8L74Y/gDRhwln5xuRtshSZvie0zmiVDgBnboHQM0wThaM0JYyvkZjFLKjEdNtzsP9y
         birS3YC3rTMeVnqUqAmoIhEhuchBBxFZ1cpneXcJzeOGV0OVbpqN2aI2YSZsi1AhAFy8
         7VURTjRGDkU/Wq3rJ8yvvwIMpK45GWZdsXrkO1zTnWTmwJV7NPQwhNyeMd/H0PWRFbCK
         hGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172605; x=1794777405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=zQRfT60ptmFsP10VLOT888xZczwe/QPO1M6K/m96wXhiUc8VKjrk5XngjEoXUH7sjW
         h/ybcAE5uqqvTaguDPgQTaulk91Jhdp0FGRDNFG6Eu/r9CLp/Lho1q6ZhYxg3fXCJ2mT
         5qE4QXQgElURWwj314Kn1VMvrfY1XZAiB7GC80t1lqGmY0GIR5MtAiaTETw8rKdDQfOw
         Uoer5QQAqRscRCL9+Ne4hUxvPyuxGZaIaH/2qtWrXBtaSsOQgk4EdLR+uo/drDmJJFp8
         lTrMdcutbjWOtItnrGm+emnQG55E9Sj4IUwsifFCMFUc7EihpTouOt3rLANMEeUNCWpJ
         4tww==
X-Forwarded-Encrypted: i=1; AL+hErGm2VhxSoQpLYqZZ71jl6eucRXkHR4vmGZHDae2DZA3wpnSU9EwUe56Md4TztrtEwXETPx0jfZWFA64I1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ExncWWAx/GbsHK4UHm4x1uXOgNBfK6Q1IInfizNaqhrUgffUF
	k8pS0F2alBs+5cPr+DizjOjJ9bl8XvVCXk2hCdScWCuXY/gAt/kieO4/
X-Gm-Gg: AYBFou2Yz0mH5nbecKFCz7cJxFlLaXJx3YSoZNjOySvZTgAQv5bsIUgqzp12cIeOazw
	oX3JxFg64s070x/8VBIrezHlhUxt3DxWUidRx9Q/92dnJATpWwlGJ7mbfRA3ArZbehM8GpR0Rbr
	fO+MIpvEU4d7+AoUxTJ/JKSQ0E9fbnOqo2hT8hN3dkGB4xhk4rVFsQOi8Et2A4lQdQs9af2VGLH
	rCGYosgY6jrCL7lWADg0spENe4qTrVWsZVyjRkIu0pML8QkEph1TJp/yGcVVLzWtTbYr4AzWpxJ
	hcx4DL3+2dkMug8/XV9bJJ+dQYzTNoHyupqbV0tz78bxpDBnZ8u2EyVJg+pkPzm+UvRj43IpcJ1
	oqClFI3pFQxFYPGNCWO/OxAMSWPStEpXW7CVYEnGSjiu1nlKPii+WAu8a/T45bZZa7BzmAhlOtJ
	i9E+/DovlQv00kFlzbOR6eUK+4aph4wNj+uiLWkR6K6T/pdQuD9WMtcNpFU6fXqw7cR+qPm0uI2
	sBLDH5m37ySDawcD9DQCt+FHQuIScwtAxX3qWEHric8Hl25FoKMz+bJNVLCK/L5Fp/CmAScyNlP
	QvEkS2nD8UoPCl5eVJk/29kKUYz6HxdOy1JoFA0iKqKdmfpcm4P3GlbaQO+WtzUqgVW1TRP8+Lw
	Yf9VbEURgcSkjJ91qjuMQgrZax8qILMP9WwldrH2yneziyfz4Uwx0cFwCL/V62c6m/PCIguoWYL
	ClJJPWFqew/qnaW1Wd05JPbOf4iBj5Bg4s3T6lDddPHD5qpeqdqKvo
X-Received: by 2002:a05:6820:858a:20b0:716:e3d0:c671 with SMTP id 006d021491bc7-7170f25b9e5mr902761eaf.14.1794172604868;
        Sun, 08 Nov 2026 13:16:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:16:37 -0700
Subject: [PATCH 3/3] mtd: rawnand: qcom: unwind registered chips on child
 probe failure
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-3-509f30a9e14d@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
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

