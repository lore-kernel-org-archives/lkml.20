Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810622;
	b=yv5kCY7Gcr7bpjgWM1SrIiFdSZ2DL0t8rH9etoXgj65Pqa4cTvua3y6oL28Nx5/tVyen
	 iCbUPfr/T+n77NX8SL2Zf3AsqyXjTeOZrusWq0WH8t6gn0zrOdObXS/xgrM0Tln5ubFfF
	 cxoFeFUOBFd0S2eSUB0xymvYRpZsai2+FW/WSfKlV6DnXyGEeI1tkFcNszgPyzwIYrdSL
	 noi+g23LdkEZ+7eZYT+eFZ8Y6c28pLtD7F2XcKyPak2fWLxzgk6UcgqHRv+JTCtgK0W1s
	 FTfbDmHOVTdFAFxm+YSsjDYhY6eQNruQlyNX5qm5lP3WkAxcIvAuIu9NW1ANNzK6LOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
	b=xLrf8Yx+BxcWQ+kptO0WFISLO7TYjkkpxcBUFfTl5iodzKfgvGaOx9SbMtSBosOrGAeV
	 LCH6nwYuU0IPy0HEug2TvHrvaVH+fHx4o62eNchP+l2FI0AiVmDmxMZ+hUkImuzkHiSsm
	 gs2b/k7wl5kgPoESJHfgqu/DhbDv4mB/T9dwGN4XdLjyj8djwNM0q2D4O2ZUR9D+tbobC
	 qiTIsxvnG/a9IhE4MUuBQRc9+GDob56Kfog/Ue//n1Kp7eWttqh2gUExo4zGWR3jrQ6C3
	 aoNp+i2utEo751m0Afe3LULCu5keWn2KRNHxcurnbn408Pq4tVVO3vdDFDVq6R/M5Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXVmQ4Ap;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC7F60A260B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC7F60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXVmQ4Ap
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71ab5e64742so2622408eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810621; x=1795415421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=uXVmQ4ApAfAcgEHVt0ijlfUmzMggAjlkZcFJqfX9sf5gh8ylXLW6lD4fJIALwwObJs
         1bXkKgMQ8IwnOR6SpZBXQBuMIgWgZ8Tf13fTpY9y2+ItPhRWqLYcP3wX+iBuVNFStZEz
         9GFimPX21BCsZDq42lGZPXjF59CzPij8VHQiDJU7yz7cu+SS7ddGSDWi6zQvIDdaDYEu
         5BjquE02YHvbC7QFz7Zxr65lhlD/HvBmdy3Yf5iZxwuPaPGWy35bDPV/cUWTcsWXmhMn
         pUfF+2ShzVjsEFpR4A6kKgCuDjFkJnVJW2gErgcRD8CK8FL+sVahTqhvwrPpdauILgYl
         sOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810621; x=1795415421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=stf3xY4xIYJootDoi4ekAs0/sxpC7z0Wk/BnaOH1BV4WC5lMKC4lmILN72qSINZ0a2
         FG5ybmiRiLZSmq0HEvRRwR1JWhyA2v/abVjJ0NUlqtbLmdbWn3HXODyygPBvm1GszAj9
         VviDZk1+i2B/eljkcueFioR1z+3Kf91c9cqMofgprxYpRrUuUhFVNnXEdfKtTUjW7G2g
         l96d1r1+P3LICCoy2VOxsmJs+Ngpa1v50lPpm2gBARiXw7AJRaKm0iY6AAcHIRPihyBQ
         vxPZL4MXkvkuxoVs4ntRlNH4Q3s2K3Ehr96gdkeDG0NP0N8SOueu3MOEwj2LbuhM9fBD
         NMhg==
X-Forwarded-Encrypted: i=1; AL+hErGph+fymV+TmfU3ss0VM71Wp5HI2Tj9R0V6BURBvLMzoquzkUumq9kLXnihtGLoXk1P7WmszB/Bl3KxdaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LK9csoLYW6ZSX5S5XB4v7MDw5ntMRZ3rDl7P56lrw5BMtLzaK
	Tcpl1elJTp0m1cZ9j1seIr370rZhZpkM8siE7srC+qQOtCJKKQRsBcgU
X-Gm-Gg: AYBFou3L8omBzj/R5ex8/BDf4seXN99SDdqOy80ddOeXrZHPjdAB9yiSXiFCHOw5QkV
	vI2MkfD0vBOScaRgH0+Za9O7WZim/qKjNJbveLAUjN2ejdlPubjvcWcCFuuxpEEJ2B5Nk7JkZ2D
	pvc7jmZwJhs5Bgwy3GPnGFp1PJgYb+KYoLb5fy4WOwmQxPXS71X2VyXwCXWr3uYxX6HRM5Az7ik
	PELGM3zd3h7zIIBnV7G5WdiBW0GwUigboi7It9/T9tb8dMtSlk5lSG1QKA2EQr6Psf/gCPXjE94
	rotKaPTEfLQ78KjrNbTuWOs5Kd9lgjv/wtkp3WCGPvddptG6WN9iutgjHSkRs9dOqFLjblg5U5s
	MgxoZGrU9vcuaexsTdzIvDxVli1XxYd/wZPgBgBm68y/bjju9KovLgwNQp4LZAYUDbQ83RLNXtX
	gCIIfGhBcAEnmC0/qHDMS4VSiBow/GnCNckm8dY/x0+GNPP2xCS16ZTIU1HPDzOhCkH2XlYUBTU
	qRfYfc6CoGV3dNe9UcM0x5y1k8jeHow4lAfmf6qgaadr6itOMq8hBWma8pXAXN4EphO2QY14WWi
	vTuSDGySJ5XNE0ufht496d5iRxpH0OJC2Z6mpyMcWMlQxyn1Zc4SUXonQI4gFkQCcdQZPm1m7m/
	Xt+RV5YZS9fLLN/jNMh3aTVs3qUa4Hd4ffwhiJn05or2gTvzjiT6qffBcjYFm0RGe7JpKn5fkRD
	AF/V3Y/0b2c8H1A3kM9nFGtpOJu9ThmEHeVx0BZAHds6Jtg3kwWoo=
X-Received: by 2002:a05:6820:2206:b0:70d:7738:4089 with SMTP id 006d021491bc7-71ab4cf7a6cmr6644456eaf.12.1794810620675;
        Sun, 15 Nov 2026 22:30:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:43 -0700
Subject: [PATCH v5 28/58] mtd: rawnand: loongson: retain open-handle state
 on removal
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-28-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect the chip before DMA resource cleanup.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 741e19f351d1..7f8ea6819097 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -863,15 +863,20 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
 	chip->buf_align = 16;
 	mtd->parent_dev = dev;
-	mtd->owner = THIS_MODULE;
 
 	ret = nand_scan(chip, 1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret) {
 		nand_cleanup(chip);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 
@@ -890,9 +895,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, host);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +919,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +944,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	loongson_nand_controller_cleanup(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {

-- 
2.53.0

