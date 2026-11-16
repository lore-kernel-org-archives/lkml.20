Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810614;
	b=zr8xtVbq2wSh0A7tiWG/T/OTjCtTdiq0ke7a47054g+UN61QxDjYY+idsSFYbt3Anaf4
	 4WL/INi8N41pCvg7o68C5H/DEMx3raF8Sz6rWWXb1FMOfYwyImzZnhMF5BKjoVq6TfFOR
	 K7m65E3mFbj148sjeadhazi5+fju+Q7P6k9f/vVmf2P0qzmpgaEErE9gp+/a09D8ST0ln
	 v1LXWmrEWvehM+s0t1gja2zjnjG4ctL4Uo6cnMn6hWpvYJuRm72giv8AU2yp8Y7MyPagJ
	 1hf/WaOQ5OhiStnLa/iNeTvj6Z9EGbbQpR2Yv91k4E/uCQWv5OdFVhszdMd4ilS1X8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
	b=gNxJCyc4lI/H0MUb/bE2EFxp1wl/Rr77vFdVfTuGBSmlIH762hxaNvgVCWUaREFIE0Wr
	 T0JG5o/Qb1tSJl0DJghE6tiU3YfcbsNIfXa0dT9X+TVawTViJNhXiY+j/7zA0RTrfB4sM
	 TanlmEPTFogQMTEDTWlo38cq+9oAWS9xZ93ATggz7QcVF1/48gENuqaus/4V8qQNtVAu3
	 G6R7zRL2Z7U02ZC2Keq9N3vx1KiARAzm9fEdXDpJIM/qw4N9wRz6+S0lfBSTx11g1ToNr
	 HsrC8OK1vFkRMkwyrPNql3dUwqLxNIHAS46PFOeLMIy6EdtOT77X43G3MF8UguDuFOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GuI6sk2/";
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B43606A880
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B43606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GuI6sk2/
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-70b875f6f1fso3471934eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810613; x=1795415413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=GuI6sk2/wvMY4FzslP/hMv1OVvlU2xmeNZK3FooX1Mr2qIZ9JYLHaTIc3l9ATmNzm+
         Ooy2GkfjPvMIs5tllqNfeP08RFs2vDMStiOZmf1i6AL2CmwwHdtQ/r6E7UCLVwiOAsRt
         qTXPwlbtLFHlEZjeQrLEav2djsly6+7uxtxH83ac+GKoKI1Cem1GAiRaLaBKU/WCNy6+
         kD2/+cZD9DGRsSRFbbmf1gq1CYwp2Bo1YJh4Tx+L08cFekLU7fY7LDM9/GPOMbuOMeuZ
         32mhDMDJK4dTwQdbd28Ix/JJG64CT4E3HlW4/LFbMadnoJ+EyHyeoHH65qQZjiXXith6
         qiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810613; x=1795415413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=HgZkijBdT2Ubq2vncf5MhAMDTdQUKc1hFlzixely5esHC0mGcvZ5dxRcXxpNJr+9je
         EfJPm5WemLpGRr8Doo2cbmM/whYBePmO9gQlNNtw98D3v1blZr5/ASK1USEZtIhclCzy
         N2PocXkVqfcuy/DvbWYO8cYmPGfdAGLuLN83do7raH/rXZiAHkFG0ALWgPDR3Ug5G9pH
         s5mSrzxa3emsdM9PdjN1gBnZ1xdRY5MNpvhrYvgIzTfNZvPPLUX+tdCiPVpCrVqIj33t
         /xFmi9oHiUzHEtFgXkQOaMm9s+XpGQ5fBH1lKSAc/kVhXcQ0HG9UVK4Yi2Px8MSO7oms
         Hu9g==
X-Forwarded-Encrypted: i=1; AL+hErHZqqn6hW7KZkacrnXz59gDvnw3o5cbuhBuInElVl9gFrqeRCoYfp+hRD6yWS9UqGS+ERSJzv8vqaqm1y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B+Kr8wHXkO1jKeBODHRDuheHetI72T7ZUkaeDisYECi/d2l7t
	3qfXtP7oowEO9k2dPed25unKrpkt0ShkE4akjWe01ZuIGDLRu9dZ9hrc
X-Gm-Gg: AYBFou1YO8+6JZPIfY1JnklJWAU4bgWZjlSJIPHji343BArKrFK956VLY0tJthc7qJO
	sj553ariq4i53Z3tmB7fhUPDuBRLXfoM14X2RD7P7nVIpIF35Ayym0TDkwx+WUaIEffty2nz/BO
	VReKwz0XFCOYudTgQphNpx3++IFrUCukporpilzyYOUj3wytQkaJo0JGwnjGcaWjoMdm9oD3znz
	rpRPpA+5t0rQrsivOUcnqpynLCgn+5Mz/wOWJSifdDb99K0ByP/yf8fevysjlVFB2neTn7j8V9F
	DLdcNo2027Zn1HdmOVZIGUmn0EPiBYkbzhjFLZwqKml1piRIUkZEDlKdIzBFzbj5WeMS/4+n3v2
	mR0lyIpkRYFP8/wkeYlbxvJA6l+QYmnJpWVMs2DkoQY2rHwLqF2GJ/zm/rRSwgsK6klx2pZOiK0
	LSN9wXNgv2R3lBCC4QyDD1Gj/sNK9ttMr1zFEv0FP7pNWTi3JTx308wH9H742Knq2esBT3TavNq
	DSncjiW9iMjecQMYmSlRoyV8K1ZMyBieZs8kPO2a5EEdsQ1YQZhgt6ceM2fLUCTMoTquhu00Fp3
	Dz7GTMN6j/ohjvxJv5cfIzj8vQjI2+nRHCAUUX0iHV+DWY7VkSVogob6fkte5AmPwYdF5aeIetd
	Rkn19j2lTjWIunMwpMXovddAh1vY1kBJxO89xtBA27A0bmei4iqOus7YTRi1dWVbdqbCdiZ7yaP
	JZutxdBUfUCC2prl251JfGdKm73v73UEpfMKBzfEl1V1Dl+ajbkVM=
X-Received: by 2002:a05:6820:806:b0:6d8:1b5b:3a7d with SMTP id 006d021491bc7-71ab4fdff73mr5913711eaf.22.1794810612867;
        Sun, 15 Nov 2026 22:30:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:36 -0700
Subject: [PATCH v5 21/58] mtd: rawnand: fsl_upm: retain open-handle state
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-21-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Also clean up scanned chips when partition registration fails.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 5c249c5a57dc ("[MTD] [NAND] FSL UPM NAND driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 28335dedb987..f9e02e355317 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -69,7 +69,16 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
+	ret = nand_set_lifetime(&fun->chip, NULL);
+	if (ret) {
+		nand_cleanup(&fun->chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(&fun->chip);
+		mtd_put_master(mtd);
+	}
 err:
 	of_node_put(flash_np);
 	return ret;
@@ -169,9 +178,12 @@ static int fun_probe(struct platform_device *ofdev)
 	int size;
 	int i;
 
-	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
+	fun = kzalloc_obj(*fun);
 	if (!fun)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &fun->base, fun);
+	if (ret)
+		return ret;
 
 	fun->io_base = devm_platform_get_and_ioremap_resource(ofdev, 0, &io_res);
 	if (IS_ERR(fun->io_base))
@@ -222,7 +234,6 @@ static int fun_probe(struct platform_device *ofdev)
 		}
 	}
 
-	nand_controller_init(&fun->base);
 	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
 
@@ -244,7 +255,8 @@ static void fun_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id of_fun_match[] = {

-- 
2.53.0

