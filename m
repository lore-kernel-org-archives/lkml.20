Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593746;
	b=baxwMkABRwsSuJa4vk6GkhgHn/OiOdRhVORQMEYviMm/QWJSsLPhH7AOXgwcJRt3E50F
	 u9msPabe3cfILA2+ICsb5/UbuDBaodoJ6hx9Gl2BvrM56dywk+Pm6pYejFiJGBbbO1ZYP
	 jcA56+VuHKdsFZv90cI31MLLf7cQzY74eEc6fD2IBA8yU4tyJlZwD9NmIexE18GKrzXgQ
	 oQw370zZfNR+GiY6nE3Cm9L5/Oh51/6h+Mpy3yBRZ9Jqm7xEnoFKsZnHIQi04z9BpVTRz
	 aVT2ECJ2S4BF9otD+agLawRLf90RZ2ft9lxxr7J9trLwe6Ez2fSKiHNU8pPf60MvvLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
	b=eMqb2jQiDMgFp3UaoBubTiHE9rCPtHXu7xwzSuGQMr+Y38TV+ingasZlXdDdycyhN2oY
	 OZEiYlgmXtNyy7rRCQrn9naFRTVFoNoEgYHmFA0ww+9b8RMkSYQZgYE3HcmVnaUgBacvt
	 qPky25YmBYqSfjgYo8tEYc/Zva2mQNyrnMhZyY/KLz4IBexZOTDsljozUU48GINmmJV80
	 RRB4TQDntV3gE9zAEKdaIexLC2/rvpJdTCF6N2kQyePtfHs9W41ieofbm8+O0kc18PHiV
	 B4i2ULi8PXAqPWA8LSsbL3ye/jo9hwsoFdeqZaFrj5sNJHtJ3AX2e/T0OVJHAaVJ+Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmulAZH3;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6509E60A2611
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6509E60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmulAZH3
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6e560e00a86so1540808eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593745; x=1795198545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=kmulAZH3TO/s2WAGAHEoHIO+lkiHxGQFMDC70Ml+gbl/PCzd8xJx1ajY6O5ifBQ7rQ
         zdPWVAWpo9Hw00K66c2+7wxq8fzKJQiMcDHqafpPLerenRnszPLrrYZSNQ5OebpYFqoH
         bSph/ndQh2Oydjwx/39cgpy085QDowwFtabUCAtxiojX4Y6cGepRetvS+XwUppyNaH6x
         zO9xjE89lFJgloqGIM7DTS+S8CbTeUJJ22PCbuKM2z5zHMSkeRxLIKwkrETglsFjYTpm
         TqcteJ440Rke8AK8SuZCqDF7i0n9P7tmp+YmbATyggBGwtLORf1ZdnmtGAVOfVdAZamd
         G9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593745; x=1795198545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=Z8cu7m37cu6XdsZcvKXAFlCmGzBMXXZI1lvddZXxkuAlUov8DAhA4Mi1Vqa1Ridx8/
         ovEQTr6lSaT3RZA+QqWwVXkh2isnXkMDgDt3xs28auuMrxz9/raJfleh3ObXbShE6z4f
         CZckK23cAzejznW32qgfGP5IcMoqlO41zk7nAqdgErYKvdyHxWtFlXry+71ACWOTUz85
         6yDJz7nj3zz51S7BVuivqceJISTh736qwf3+7PKLUT+okSSVQWPRqZuY2ga+d6ssgU+C
         vU/V/rD1NA1kHny8V4XLUxRvV+PC6g9A6DKwMJNajfZxdUf+SpOPcl4TzqW6n/FaCxko
         jXDA==
X-Forwarded-Encrypted: i=1; AL+hErFXEWAYhjz9NUHqytI1UjnW7wfY9nWVxXMw8UyiXGXQ4B87282ODvAbVlM+qizN/F4u7yEbj87yM7OPvbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PMi52QqoennfQIJy7WUYVIlzL7GiTZiQ/HUOo0ruEL/NCQ0Z2
	O00BbMb7xBj6gHbToxNCJ/c86lFF7Cc+uKJpNM1jrDYck1lOD8NEmlPcL2J3PU6P
X-Gm-Gg: AYBFou1FMULNSUdsnAo1jmtOydmtWsKLnpd9mOKhHWlkpdkOmLfOwv/pVhpBffUTJbu
	3crWnup/c8LpnR3+cMJn3dxmQIDFC2Ip6zKshe3TQh+f0wDCewLnXvHlVJ2dXil84zBr4p+P/7Q
	39FD3y3FS+1efmT4+DC4DXi97aDvR9CV4wZeGQJdk/M1v6aNqdi7hDQpyzYFmxD4ahuSynfpOaO
	m45YtLi3MESxORiP2FfSvYKGXoXzGVtVyICsCjlGyXYRTGWuPGznYpkCQt00F5D/6QgbDC9pA6n
	TZHf7QGjj7pn6BLGNB/nXmYDpYrRx8A2gyU+S3fdaowpxg4WtMxQd7wc8Qf1hKRyLt5GMqugPgt
	HoIbGEs9UiAp0XS0jazs6Ag/uSNf+z0avwMRp+lZG8O5dKwF34oxuuRUs8BGhGv1U4iJ0pxGHZV
	wJ98eIZVtnDYKID3MwsQxhjPjdGY5PIC3mGcmKPjyDkCf6+7zEnejdlUvMw76TXsAHeSovIAS5V
	qsVcP/F2s3PvSeplVH8wR2xQtWbjnxmfalDXmObKcBBXKM/mQY1kmktu/M1hTquorabckRAjswh
	vc0wugXssXwkNXmJ/UIZynyRBv4CYbMDxlWlS+dVzYjR97/Spwfgcc96ZMW6m0Hb5+RR5fNBEbc
	UmqNzGH/G3uxFw0JVd3RmUvvhWhKYaJy3pvaciXyqBPNfqPkUMpzcFyvSC3ngdnNtm08jFUp7aQ
	vNcVSdON4EEr50MDaW2oddDEYOGUamo3RhfNF05KftE/0v3neBmHJY
X-Received: by 2002:a05:6820:1693:b0:6fb:b922:8d30 with SMTP id 006d021491bc7-71ab4d05c0cmr1995559eaf.2.1794593745342;
        Fri, 13 Nov 2026 10:15:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:42 -0700
Subject: [PATCH v4 26/58] mtd: rawnand: vf610: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-26-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Stefan Agner <stefan@agner.ch>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep managed register, IRQ and clock teardown after chip disconnection.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 57da9eab940e..16e84ade92db 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -813,15 +813,17 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, nfc);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
 	mtd = nand_to_mtd(chip);
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = nfc->dev;
 	mtd->name = DRV_NAME;
 
@@ -873,7 +875,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +886,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_lifetime(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +910,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

