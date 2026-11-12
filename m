Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446956;
	b=QY84lGdWTWIH5aUDSETcOThNhS+llPl8OLhgA8V/u2oLZ+GmZxbHdAN+7ZF+kuyUbQEb
	 ZLR08y1kNVWXdebZx86OB4jVj3PTRSaRfsplM3mdTOUC/A7AkdqzZz15Smmhi9CYVxvLy
	 eXUhlRPuS02uAnaVbfpj6L1qcl1gcvUesY/HnyjbpaWck2/usMhdByHIHFanKSd2hEaNR
	 VGpDj79TZD4T8+pclcbIgR9xU8XsAsGFCfDVGSq9h8f8pTDLNkdYb7bxyfav2NhMUwGfU
	 Q6PmSdaJRasgnahOsLWoQid9VF55kb2T0U41EOkw1duErQhDpjEHKGskkE6to4ok8/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
	b=cZaVoU4GhsDT3Vw8Mh3W8hV08Z0gEzTGxGjvnkEOxJFEwZh0+lx4MShvKBrAifdT/3Qo
	 V9GOH6D+zvZRtinznd+QlrqESLWIXSUcunyHTHvmTUTexVWaIxzaAGm07bd1K82rFsKLu
	 xmV5eSkP59JxPHS3W5+3WMUV19AR9uKZZVKt37/jeWiABmXUhwW3PBQwI6PRitwwHvKpt
	 tkHJse6flYyaIhcj8G/rwU8zLC1ynTMn01x1RHbNQjEJ4Tebnjx7SbubTpuo7WWw5RUCV
	 xZg2trnlz9biCHRWilOZocWIe5Jl2Oi1Jy6hkFOnC1CoAIbHu3ZyDKA9A/EElXB0VsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bm7IsHrH;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B126070205
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B126070205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bm7IsHrH
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4ad587ba293so2276751fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446955; x=1795051755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=bm7IsHrH3iBpKRtqWVDGiX6421JemK0F4cVi/AwOMDm0V+FoUyHCPxpvHwrQ/LxHds
         3xv0s8yroON+yDpLRtIJz8/KlIdZ/iEi+IjVH881ro4sXs4Hz8aCHWn3b24nAAGwupfI
         Rapdl/v9UhWcvcckZ5fBF7y9pHFE7/cDwUlIW5sQOu7uD8b5niPkYk+h2kFMHKxK1XNZ
         PzsNeb0EdujAO9ZXbRlJqJEySZC6cqZfxZFLcs7zIVuhHQ+kfUbb9TA5Dww3CqHK1uVU
         wC5pqbdi699D/IEmI9iUeeREVEFCsmAIPOexobbKCw0osdjUpQY7a3xAqxy8r54PRfJD
         J6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446955; x=1795051755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=ea6TL9pN9cUsyW5PoAiIgX6QewMRWSZ5UcP5wVP6rm5Bz/TnhiIFeJaoef20nGTAvQ
         2QS53eonjtY38az1sDcW+ATnm44zqF5Eoy+8TcRr0LXOHMbX5s8dQ6urM6U95vUVXjcT
         EnPwqX3Ns+/3l5t8LMaYL8i2anUWecqy4B0VWN5a6zuqL/tHm18z9D9EHO8ZQwKlVRIi
         3oEgzdba0qDxGMQIn05Smp4oGBdcNiz9W12eB0PIXhTg3QfxQ5iYOXIYPhd4m8yLcBDw
         l6pjXYNiamkNC/NDLJSZt1TCH1ptVKrfXhRVP044xpJ3C15maYU252xFPJO4o3H596s2
         29cg==
X-Forwarded-Encrypted: i=1; AL+hErFEJysGqjQUGIkm98SG3Hzs0rE18wAoBPsmUaOIr2UZDP5z0sHPt9W6odVoNradaWWGlplvXebKWcls0dQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lzZkE6acEhASqxwPMeYcvFFmSaJpRNAsgB5W+VKPGJa3ggEUQ
	LL3O6FYql0PT7QI86y9LFlp7BFwBRRpE6Z6hDISdD13kD+DVxTQqCVzQ
X-Gm-Gg: AYBFou2/BC3ewFxDWBQ9tBf+jVhhie/x+zd5+W7N2rWOi8AIUA4k8TjbbEqWMORNx8P
	y2etXO31XwdtP8ycvlod0fzN8h4ysnuhRQ7P3ZsbS15w6hDOpYn9TzewDbJeelmijiZDXdsIKjU
	8oITM8Luj5HstfIn9jxugE9FPleCmzpPRW0IW2XGxIsga2SQm5JE/rZYGA2uZzvDC43aI9aASKP
	fB5EzvWjeiyZmV7+fkLr4KSWeiGia44q/N1gc79ecUW+Hel8spXYVWhpCZ8MXm+Q+6Ph7SR1+QW
	DLDNFKG8hDU07RQshewXAvXhoYqrE3MImrNBo2xYKrRgb0eOAnkAtiLj+2Vl8RoZkYAvIdeNLw6
	xUGthF7cvKH29ROhLYcOT/DvuHvWijiayxbQKaKHQw1SZwbE0VrPWJWkRPLZ47pUIZpYHuRN7bs
	3mIoOVp4wLjxbaeGsKxRRmkp0i3rGRZzGvMUCcoAT/P7qP8I5mwDsXyxbGHGJyenB3k46e3dJbv
	mS/41nuzh9pKXy8h4BNMqC9jzcD9UgT2TbuXfkcJmPJLaLrFLsQqTHl6jiEiGbCD1PS70gWRFRl
	h1LFzFuRAtbbVS4DZF+TJbxJNIlPeeF1xAMzxzq7wlO4WNnniF8xs8bkug/WQoJyU/nK1EE1CZU
	kZujS/7gCtZ/MHbfMRO1tCOte/CtDYTHuEhmkREWFXh0qG3gRIi06EAluj3iSHy+MYXAkrjDfyv
	2kYQuDHyvQN3INVUbtoRd7B5FJWOHHXYutyJf+hACEa1tR4qeWxyCB
X-Received: by 2002:a05:6808:e90:b0:55b:f8ca:3f21 with SMTP id 5614622812f47-56b92a3843amr3976212b6e.5.1794446954743;
        Wed, 11 Nov 2026 17:29:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:21 -0700
Subject: [PATCH v3 42/58] mtd: rawnand: au1550nd: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-42-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Drain NAND access before unmapping the chip-select window, and retain
the chip and controller until the final MTD reference is released. Check
MTD registration errors so unsuccessful publication releases the same
ownership.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 01c2c8b191eb..83db1963c449 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -269,6 +269,9 @@ static int au1550nd_probe(struct platform_device *pdev)
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &ctx->controller, ctx);
+	if (ret)
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -302,7 +305,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 	}
 	ctx->cs = cs;
 
-	nand_controller_init(&ctx->controller);
 	ctx->controller.ops = &au1550nd_ops;
 	this->controller = &ctx->controller;
 
@@ -322,7 +324,17 @@ static int au1550nd_probe(struct platform_device *pdev)
 		goto out3;
 	}
 
-	mtd_device_register(mtd, pd->parts, pd->num_parts);
+	ret = nand_set_lifetime(this, NULL);
+	if (ret) {
+		nand_cleanup(this);
+		goto out3;
+	}
+	ret = mtd_device_register(mtd, pd->parts, pd->num_parts);
+	if (ret) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto out3;
+	}
 
 	platform_set_drvdata(pdev, ctx);
 
@@ -333,7 +345,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 out2:
 	release_mem_region(r->start, resource_size(r));
 out1:
-	kfree(ctx);
 	return ret;
 }
 
@@ -346,10 +357,10 @@ static void au1550nd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	iounmap(ctx->base);
 	release_mem_region(r->start, 0x1000);
-	kfree(ctx);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver au1550nd_driver = {

-- 
2.53.0

