Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593741;
	b=J001a93BLr3+7Q3UFSUpBmTINiGEaIOpu+2Xs3jHID9YxN+W5tiza23x1VocVY7rA0UX
	 hzLf3lBP6C1OT2Nzl0QJYx8aoVTakl4CtCTyzv0nzBmjJlSXEvGzypttMmU8H4hAx5/EY
	 /CdvDgyw6/r3I2WgNK7MtqfASj+w1Xa3GNZTd4eU0Q/uCxpbdgna48Mk9LDERQLM8hAsN
	 LGc1AU2oP1S0ITmdFRMSp5DX+PSu3hRlq/2sqriJz80lkoKABaiX8YMaJUyPKrVeFwWLu
	 6G4Hh+TI23f3thU29SNJ0L6HRZnQmZYNNpCpeAUC5llGZDSzNMdQycWvBaAsz7t0eMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
	b=nUiTUFHxm5TcL/bcCj4zsDFLM2SZbkYcPqd3k5QdOY/XugH8v1RCtKSqPFNVh6/+3C93
	 g0ZEFXkWoKtiHp5YHAYHhto5VlFqTXUY7/XPutRZdw5iKuiEeycIgUeTDX21F35ZIoL12
	 hGpFhceA9e3inGHI/3r2VmgBEGr20ohPmNKqNhF0tizM9ehMnPhAlSPG3qRqjNxWgZFYY
	 UtTlumvM2siRE2fh7lCG/oQRRUn59B0hTbdcUkYCB68aEKaGDxOKhmJoJTdjxulaXHM7z
	 D+g296NQMrsIE4r1lvpJzNOi7lfu5nOSry4xRDRPwCNVLFG9aWRkyMqsJpXy5eJnvPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qn2Jl4o0;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285AD606A891
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 285AD606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qn2Jl4o0
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-70059e4dab6so1450857eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593740; x=1795198540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=Qn2Jl4o0V1oCfJhvALr2IJ6KDV9leA3brzMkgsOSSi7lQDesYnqn7QmCzvJHWRLUTU
         7AO/8Zadrm60xgeEBDwPiwQkL3axnlsEhwnwj+90B970RyXO6W+/Fl/sD/NiUBcNj6zC
         TeOnWX0oGTdmooqF1ASMbN+9NysieySAPGJMVSakjgGdY060e3YemvUVTnfJ+NFqvj1I
         eIkvrAeqh0lrQ5TMo4TNi1Hao/u9XZc7H+bFV6l4cXXV2hWUE53XRFgGSI5H51GdQiKf
         RDz3VNNw5arg51osAoH+U6B/pHZLJ4ceYc0NZFNr2ud2hJs1SU6oI0Cfe+fsSYCyJ/Uo
         FA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593740; x=1795198540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=0zWu2Keu4ggsAuD/n7iFd6r+jAB+soNhnyp4ooi07JR1ZyZzsiV9QMtW58lvVFZ9aN
         BqHB74dGTI9FkjvO2TZqKiHRfIAM60X3WTQ41HIByd//HmcJDwlUU4UhhpE81N0pYbTk
         lO3A9zQD98qQoXOnPaHWrQUkQmNZKu/FM1KqpFJmR0UxedcW5FOCCTzXiBKgZhrykzzB
         oYet0xiUjlsEhUFZZvZP8o3c9GMugTmYtfo5FqLABee9QPYu8LiXctFhDtVjQFyDqFeV
         AUmjLzpth3BR2OwIryB6Hmh4Dcgs3cZEUEzPr08w7Sua0DZuXYNXvubq3fy5Mbwot6Mj
         va3Q==
X-Forwarded-Encrypted: i=1; AL+hErERjfqXFFiCPl+V9Sk2GprEnlLRAWv30gEnUY0GIGw3UI66P2FLU/zFC2XQEcSEES7ZflIg4j92hMHjYhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YfVxZBBFRwsoEm1k/0mjZjEBoZosyi38c+eIY3Lg4a01A1Hx7
	UhvG8PlJXTXjfVyTZhbf7WpYeI6bwrB6G818L5fy1uUmxlTWpBMmGnGFmyfsQbgS
X-Gm-Gg: AYBFou00mt66nEzyAZLB/TRjoByWYc7L9bSXoq/8459/5nE4sxt5OXrIOho7Yie6etx
	WD3BCoWuE2a0WQ5zVQ4lqP++0U/s93uQCQczbsnGyoYN7eTnRNcrfJ0DEm+0IvcLqtHAHG4yNlC
	ifTlKyNWb0welkGiMwIoldiHFOnYyDvPr84ZAysd32lGiwU+tsdUOkBeK2IL/rmIgsKFn6iDzXf
	NX4RvITklVpgp/+ANIfHoHT/N1YbliqNFPwAEE/MO3n3CDj5sjDVz10c51lGH7GpRHD3cJHRtFd
	JZqkBUQFxJ3srhwafW4amvbPw7g+qEIhPw3DKuQl+oYILkSv6Bp5Xozzgil2g1NKOV++L5fZoCP
	aQ6RmIBhdA+tizocyNdaf4Z1ACQ0ZUR5RkwxqcE+Z9JHjM1Cte3OTqPhjNpf4151h5WCoqi83Ds
	W1ZnTeUxsObyLTaXtbXreVlJH4yILkDD+ghw3wi02XW5yEoQKz4+jD7gHwiMsBu3TFJD2+zOzYw
	Mn/fMY02aCWwNzxdj3aiyxwvtVyASWDmqLMhWFz/iVURH8Df/88MDYLln51AbwhnhcnVv3qtnpG
	+MSx/MnUVA2V0kKj5JCC6nCdFvfPTGeYrHd05FR7oqPFGALAhw45xNv84tMeQQqS7ayhk3PQfnI
	hET5vomMlLWBray8/yOUkaQZ2Ir4WrekLjkdPqUObB90Qt5w76FzudmkmkFdyM3dZc625gcQ1Lt
	/GWa8a2hLqFXpF60mq1C216vRsIIMNxkLJAeRYOpc8bFdSvFDIEfUOsml8+a+c1nhJkB1UsHl7
X-Received: by 2002:a05:6820:c0cf:20b0:719:1e32:866e with SMTP id 006d021491bc7-71ab5070652mr1714642eaf.38.1794593740141;
        Fri, 13 Nov 2026 10:15:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:37 -0700
Subject: [PATCH v4 21/58] mtd: rawnand: fsl_upm: retain open-handle state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-21-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

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

