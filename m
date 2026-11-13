Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593752;
	b=U+BQX0+35wOCw5mTt+T471ZXyD3bxHj1AO6BC3Erh7aR10u2qj/DzLe6qW+YHAU8n3tc
	 0kF4UwNOhhKuCQ37/89ub16fsznznj7p31/2B+jIyz9CreeSPp1VYd5jnF5UGog8sdL8o
	 3FOzEye3Vg1KoiauRWnTqZ4u0OzEC4KU7iIGy6IT2Gz6xxndGp9W+wOWaG6TZ4Mr/vKFS
	 zB3arHYFki3FI0nZZYy8X0YbIW6E3dAbbk2VJf+zfpeI1neEmrYg/QTlIzXlfTDDmqDlL
	 Aqc2KNNWz0Sr1NQGqXBYtoRclgdrfuyzRAfWTEWgI6mfJTL3T6rei7cpgoxSR8zWegQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
	b=o726CSmZRszA8oArwAQbJA/LjpQYehbg2wsFiebcSO8Oen6TebnVoAXosClOXVGDEimP
	 S0NQkMupLiTKcvH7Nj315d7NrE1n/5vJbSfyb+NkY4YKtNEi7O3mAgGZ3rATPomBtnCN9
	 Biuicy80J1eHAqH42CXLDQVSk5prpCsQNM2GblR0i+Oyej62I1+AZH5vgWhwav4t/5uly
	 /diAzE7LUkuOy0/Ni7MBmW+YGb7Of3jqTa5T4vNOt8CMwxBAOkjjYQG8ONTTLlui/Y9iH
	 S7bV8Caa7w+7sJ5OuSu235leHnLBLCIkM5f7YBhaVlalEx/oy1cJx9qKKEgCitiBXCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BX0KNpZX;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AFF606A8B4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9AFF606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BX0KNpZX
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-85c1135c286so1594234a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593751; x=1795198551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=BX0KNpZXu5gvFyIqHEONdiBMO3i5LnsepwB+T4fCOFBBeON4ATe5MMlyPc+XiYG8Rj
         y56+Zk9uDemaqhxzugpKR+WX+0ypkfmSpCqEOk48ceXFpSVFzCP+7JZfSJAmZl0fHC4F
         bW1SYrrS6rPhNbfaVgPKya4zUDmPbP73+Ur1or+pGCA39nRwbaVBFH7hDrnW5ZkTlz8l
         LzzKDNp2N7bdQrSqoMmwcl2Q0nvrgzw1dbh5Hb6c3DN/QJRYPl0/qiILfiU5TE1MJEDB
         7y/P3CUi6F3FXg7nYF9At6D6S+TPiOQ6RYf/3Gx1C3Yu5isarqjQXNN1ZBReJdDF1O3o
         osTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593751; x=1795198551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=nvVzGJ3GaUSfUoa3hCQ7FZtILoysccWh7LnhMuMlA3F7cwN/HkTsSpWeyaZT0xskRe
         6Xny/Na7yP4Ds4ZOfVfqkqaIbjKCCeFaIW5fWvH7ZrUocP2tapo5oA133wS4OU1jAq0D
         DMTbErDwRRpxv99vgg1kWFEooq/R4NG5bK3Et47DdEnL1yKbmxSmFe9tO7TsvcCTmGsL
         Qe1DBvEqMeDT5rkT1ewOU5kEB5W8UUXExHs657qsYn6GrlAsadOQF6oZOjxsZ/0ZzFzl
         rkI9uRiz4hF1v7oOG9H9CRf8Udqzm7C6+P3T/1p72JvstNCqFon3nskq9l3pjomgjynM
         rpPQ==
X-Forwarded-Encrypted: i=1; AL+hErHqjHu238c5q7JhdUQl9uxb8xGzo5DQpBu9I0UkvS8HX7C08B7oEfSLDeVEtuSbv4UvyItaGDu6HeHD+ls=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pbimDFMF1bPNkKPdlLpul0VyE3No6lGgJGcUFHvR8Usg/npDH
	Pj/fRRduInTkppPf/5Qvr7msr8f9VAwbcb44CLjWpN/NyTiFxgo6JZj0slVeMSxF
X-Gm-Gg: AYBFou1YW5dmBbXv8yfgzQPhewxv1HGcJP79wTxJCFU0n+6xHjziAKL64mR0+ZhDfYg
	sRK+x/cGXt7v5sGPHT9L7L8ZkMVf9uRg9tMI/z0zbKxjNQYqn5LAnElhKayT8XmYU8zrJXghxw6
	/ozBZiQdEInNkL7cCxPPIp7MRdGVoyFDWhd6UkzCqqIfHc0bPTUUF+k2gzgjvcxJklWp2S1FzWw
	TCwNJ+YLztHvc7GqPWFeY4MeaOevNqrZc7Dx+B1xAU35txL9Skeu0nRknJrE7Yohm/7vC/S4ZXp
	sYCYetBpym6r01MxO033WM830Vgzpwp7NVfdgv/AlLycznkrhFlcqJdSsfr2JSln2hNOsJ8VaZc
	kiSAWKKdd4W17VBbLKDrucokh3Me464ZyOmGDAQnvbGQhzsm2wAiRM+GsbPgE2lXZ7v3r5oWtsd
	wnLsNLkXEYOuXmPLqdBKOR1bpO/dGkIqwTtdGVZKRkWfhp047zfubIhfRwuuiAAaP0830z/FPsR
	v5Z0zYt3oZRUcFLQRQNSQo7FMuv/6b/Uatz9L0tS1lx+eFVuqax8QNDdvw4tQvPcZ+r26Snqees
	86hGuTf8bd2721xVtOMEbLqolbQFSUDQRybDBB/AY1n5++kDkIZnT0ZZBbt6LZX4Kt/rmmzKYfH
	jXHqhAW7//CgbVRfiTvN6zFmHJceahMAzv6xu7yHwaR8JjOLzQjTg/29f7OG+/0FVxbn5grif5H
	sBezLNCacSqEgeya5c8aCbwLGqg5Jo5/INMze58Mixg/0Y/2LNGis=
X-Received: by 2002:a05:6830:91e:b0:80c:d30f:97a with SMTP id 46e09a7af769-862899671f6mr3587981a34.27.1794593750625;
        Fri, 13 Nov 2026 10:15:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:44 -0700
Subject: [PATCH v4 28/58] mtd: rawnand: loongson: retain open-handle state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-28-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org
X-Mailer: b4 0.15.2

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

