Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446933;
	b=XLZbLFxRq2j/pqOztuW1NyBszYcLJUgSxrcZtAgAgbFqC+xNhreXxW1wOrlpg80WQ3bC
	 jGZ+4hRGBi1X0du8zOjGcnNw9gmavMg8vWOgFqxOocrJGu1y5jq+Rs9I9PHyL2x/7MiFV
	 nXoFHuuVt0JGYmuJ/MaZAqxF8Yxmm++oC5Gis4I1vkj2cgTSn7DwjCQe8c4tqWsqEzA9Y
	 WtIcwplDR5g6gMCLgA42D+Tggj/eeat/pYdny8l+hRhNE4DN1Pxwes/W4nJHdyKrwEHT3
	 KSnDZg9LP5HwE2sl1bIbqGwRYkx7KmEKEvLQgKf7qF3Q4g+udLBY6rWEQzgoCesOD4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
	b=Gv9E1xyaW4OviSCnmeYlAY0CVVnoVZM/Pq37OzXZt36uDD4VzfnnMO/1yZqFhzJT2D+2
	 vRBA4cgE8pBAYYtPbxWC/GfzguU5n/ceTC5qYsdr60t/DivyGHyT//jsiCD/TmBCHTxVj
	 pK4BnNPQ5MnwP+LNB/bUUNWL0eW9AEzOOvOM896EDLD0qWg1TxFbrau0iGztDafu5naNl
	 lLfPGcy4kDwbyxJip0M10lzT/OKW6BhTaKTGHinBo5bV5lgej5JCQXEHbo/OoxliBVHnA
	 EB6GkD92fcz3z3VaecNV9WWPFNpbv+iWITMaH6l0VrSiNaA610R0YqglROQCdJoGR2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QW3MV/qk";
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F59F606A88A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F59F606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QW3MV/qk
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-55651e7de9bso1910652b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446932; x=1795051732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=QW3MV/qkbanLOUkM1ye7t2dBcnsO/FKpLeiohtyVhkb+ABXTx2o7t5i+GCmg9r6JT8
         RaaM5TA3NcwVVMH2AMBJiKirt5OcqOiNdyzVyuIw0LbwZFup/sfzN0ZBBBa8AtQ1HCTt
         l/qhiODR/XisDYxzhoNi1K7/DDRBJJysYk7kNvc5kyrib42auN0lUbHYChpMqMgbHC1R
         5ECkogQi0Ub3iHPdPM5dY5DzotruKwVc9ITUP0tsfp4qG4UP5thwGNqo66r5bxBApCss
         9z55UtwqHkpN2F7MVs4823c8Ug+r/t4+wPWO37R9VeCGA36SCQcbznUZpXvCcoHgueLs
         38Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446932; x=1795051732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jkZp8zvm1piUvFJy/VLmO+L8XEgLfszND5ozeM7Klg=;
        b=uJOVuy8wKgWkgn0HBuczRE33a7wuSr6ckZy9/tVIieB+R69agUVnCvXRuOWx/lqom1
         +04aD0JHIZcTu7aIfDFgkDYQa+d0kv/ffOWI/Ga+AHSlG+Y/+c4XXTj1/kx9K7bxT6HA
         g8eEnLVgmMh0yWEAsa2q4w1zcJz/C6dWfk70ARJaz0ylSORUeEVBwxXFtnAo4MkGk5Ia
         7hnyleV5TIMQ/KtMQs1L9cb21EXhHyweqGbikt+/QZJx1sN3/WtmanQn6m9VnVkcECe4
         uii8k3yiH66vbOB+0ew5FGM1432hIYL+OCJ0EFb0wH772/1OTdhBixcfABWQ+2rgWByQ
         A5Dw==
X-Forwarded-Encrypted: i=1; AL+hErEAc52bBvSF/lenGNQ+Vj1SPQvxtYlXFdPWcRFV4oNLqCzfY4oTWCgGgXXHCcG6K7/mR8liJNFYCoCnRqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wG24TyXGkvea6Smgc2a9PxooLCNzd0T45AcmzU/f5fs7McNdK
	2v/UUk0PLxdiibSEslafP/2w2qcGU9Y4MvxDWf+TzeuILXEyt3RwZHIZ
X-Gm-Gg: AYBFou2VVkfyAv6odOxMT8REwPtMT+VZyQ1xyRrFB/1Hlp91vNKeUIHHN9R9hxiFMZO
	8ck/xzV2Yyi+8rls0/FBTfq2dnQ79xmprbr1HwmhaC5tbmBG7Q+EiByVE9Z7EKwbVnCtEkIFi2d
	/tGNIfX/MJULzyZfX9adpdXlf/HNiOferk6OV1m7GsCHQpcgUaBBV3CkzdGX/egiD04FDmNn3wV
	5g1BF/yGfxQ5WqUqmS0Wipg07TkqfSunhyk5k4cV6lx0XKa7WvO0NtiMqLISL+TC01iKddIoocJ
	cVFm0jgZtbUT7ceedyOhHfKXSLq4edT6NE4mJgBQLatwj39tAGOp6X8FgzGv606PUz7G45Bi9fE
	V1klFgGbROvaeAA4h9d+nZgLNNV6YlNvMKqBdkTfognAO/wMN5gpTB+ZE1JouJH91sQ1SunHYAL
	i3KfA6+s3dVPeF7p4GNZV2LGcg0R9buvGzz9vV6vJH4vx8X9PULTPcn4/wD/wYvwIKOuCgjBHpR
	EAQ9KUoVn119rjtJV5YhIWbQYqGHwIWD5XBtTahERwB34+lz+j4DMo7nd+ZxC1SFm8HplJLshR1
	bE6Wh0McivNUha/IMSDtzQdSs8P0LF/KGJFYqpvVyl1U3N+1xwrq0aTHZxesQSQ1blzHCuhkImx
	KKXyYGCd+HnO7GjicgXF2JhiBnBMbbEv4ikMyTi8mF5vDfGrd6T7zpWbPGGCRyZrIHs/7phdsdp
	adEx+bZOf2lxtzsF1NtMVKYmdeEPTlTPifWA54frz6viquew1HS1Et
X-Received: by 2002:a05:6808:11c8:b0:538:d44:aaaa with SMTP id 5614622812f47-56b97e2acd8mr4058417b6e.63.1794446932249;
        Wed, 11 Nov 2026 17:28:52 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:00 -0700
Subject: [PATCH v3 21/58] mtd: rawnand: fsl_upm: retain open-handle state
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-21-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

