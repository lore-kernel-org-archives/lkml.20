Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810596;
	b=ZhnLkot3uK6QMHcH0HNmH9elkdZKZH+GZz6B6DHpj97ktUiUJkmAHnQ9WYz2kBcxyA6O
	 jnvAhrhehxazi59FOLhWKn979HDU2tC0G+fV1Ys7gtMMquSsCXf6Kk3CpFZ0NmP18lEB0
	 qPnWRTQISMppS6GTmT8m4EHFXIy399xRKM62RJ0St46G03o36G9Am85hRRAulLLWhQjmZ
	 Yy6MCpEOX6m3hBVFfaiekD7N259/FlnqE1rF5xuCXjQKvP8zs8bIBkh4rFdhvG+QkGqMo
	 tkOlYkZeynZssqqY81P80lM2PMt82xVPPyomX5t54y5QVSQgr5+ELJdQkdt/+fh3JrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
	b=JVG9xpCIwYvVuZeJayOxfagCMgBnEG2D1uCr1fpf+6oSiJ4/+t1iErd2sz+G14YeTLzy
	 OMFHpC7EIVyyNhoub8u9n6+rOxoCxim7Un73JDXWN6jBuyvVu/BWmN+qpA8+GxOSIcNAn
	 na60WgqVD8Rk3UYMV7fOzJnoV8fm4iSRE22l5rzqHcNecnHMqfME7ErvFUEsXH84zphOi
	 oZUPo8rclxoZmlZ3tIrEZIvp7FBY0kCk8SYBQqTX37cuTYKPGHPm0XOQa/aBM3RsDKN/X
	 pdvKrml1xBBS60yTfHjrh4dOdZ6QBOA6KCYG+GlnJ0RQnmB9m+/NPHWQZeZ4OUdKOcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mp90QGmG;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FD8606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06FD8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mp90QGmG
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6de2f213b7aso1107484eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810595; x=1795415395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=mp90QGmGH3/wjxlSTgiMY7ZSGs9bb8WOEPD4FFTXaUF/a6yakAb3ShxefUyPQaf9AA
         0nYjAcPa3Fgnx2hWz4X3P3V8bracBWPIisuUnIhkggPWLhUK+6jdr4guwtJfinT/7oMK
         xO1AWspkEMEhzxVtz9AHcB14HPv7NNnXuUM/p7eC3rw2vFV202b5hNnc3j1dgaypq+lc
         ZmYwzjazW8RaVENx6AqLN4Az2OC+adJi7OLSjOP5fHyB7mWbGzycjQ/f//bZdZ+ILFkl
         7talCiH+ZkO+fLdKm7aJYyFPF44ObQD4p8MEJMi3IuXSvH3EAVv3K7W+BNsqo2EfqVj+
         y45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810595; x=1795415395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=dAjwl9usSnUoD556oM6sclkMjNOKLV1kUQDOxK87fsyR6h3Mj2wS7ZQzint55k2AIf
         nc/9bku9lEtS7smXH8Oka0lp8Dgwv6Ii+gGQ9EFuwbi+0peGBO/SzdstldWBAzw3yrjM
         JkCBID/v6oqsYEiaZm3+XSdTovogQ/w7vKH0YHm1EHHnaEUjJKiM9ojFSFHV7oI1dZU0
         y9rNUUmM+R1PN4ApDUnroAKyOxNMFSgevykJc5lOPQxVTVPYCoEG8jpETRKCSXVEctGs
         S7Q4EnBdzUSXoYDTE4SJe454m/YhLhDwKbF+FQ0+SDf8N4E88oIAPSzOLzihFSxcKNM7
         E+Lg==
X-Forwarded-Encrypted: i=1; AL+hErHVhjz9J34aKGOPzh7bem35Oji9EXxOOayqWmDGG+czpIJDF5ucmBGINfdUeG5WWhoFSNrTJtxxP5hzf1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jn1JKT0K/KU/B5yO9tuOlxHPKAdsKcOM0bO5vhpScqjj5a2mi
	NeufuJza4fW3Y3mdpf+DyWrFfS1pmo375aUI7kNkZL142W2WaRyjINvC
X-Gm-Gg: AYBFou1CCPZyp2CXV3KiGI9CEUgf8wgBi1KV+I4+jxEeP+xI3zJyQahqQ7qJxesxQVr
	8CumXz9+W4BFLEnaG6yM74ujjwjg12VfSV2loeR2EfO04Zy0YiTnAsk4S+BVY6w8LaLTIFoJLLD
	P0xlBD1oA4IIg+ScF/CvuNbEsDvww49JU2Semytvwl4dqxnk6MRqZyPZZ0J9R7ucf/0P25Ax3Ly
	15UvM7WZQPg03Gd/d7mdu8tQ7LJtzCkB7/sFAArv1E9pRHooASu/bnZ242jV5O+CXvGgG72anHm
	6QDmCMz+ze4qHRGUBMEtwHUlzmXjxWwzj5MRgEMGNDTN3iKMgsnCrTOsGQduu+fB1PGnKCCDZPb
	O0WLunpw0Buz8sRQPB1hfg14hvLnXJndFbvn3RMJot/ex/T1m5o9uncopFiKPVwQK3sLQstCRLv
	T+D5haEZbihyByo30pVXg2v2RokBkXhzMGAo9niXDvr+OAWht2+LSW/kFvpyQ1uzxjy5VRx9EfB
	HJyeXxgxjNvlm18dzAmg148a3e+znkLTlLeoRoSf2HbbbPgSlFSdKm7Wsqk0MQpODTEntIicNC/
	G8nRyR8YzVhfma5zFso5PeV5uzXccEubASSxTVzCucoXLbSvHplKzaQszJOmW0AkIGEr6Gddjei
	nQV3oLGRIKLm3LH27+JxtMTI5xCmElge31KnfxMhREaWbW4Fqekn0OONKrqmAQZvDggAS/sa86K
	ekV+xGXLuGKmhkBRvDh4OHTdb67HPES38+vzDgjAEGaofcqXne9VerZ1x/RREjlvWf+wONn24F
X-Received: by 2002:a05:6820:3416:10b0:6cd:3ffc:64d7 with SMTP id 006d021491bc7-71ab51acb62mr3691644eaf.82.1794810594847;
        Sun, 15 Nov 2026 22:29:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:23 -0700
Subject: [PATCH v5 08/58] mtd: rawnand: plat_nand: retain open-handle state
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-8-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>
X-Mailer: b4 0.17-dev

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Run NAND cleanup while the platform is bound. Keep the chip, controller
lock and copied layout until the last MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vitaly Wool <vitalywool@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index a2775886e7c4..7963ca2d4557 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -65,10 +65,12 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +79,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +127,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_lifetime(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +140,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +160,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0

