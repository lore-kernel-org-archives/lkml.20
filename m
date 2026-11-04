Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829613;
	b=pZ3zvHkUpoVD2F9bhbchro/PE5tXZ+hAeHZV246EpjNIh0djAxQ3kzmP5H10SzskSH6S
	 a9neK7VCH8MA4y3pIL4k6j+s4I8+ALcCESU2F3ltYh448QwfDhbVEk8bZLVQW1mIuQSb5
	 zRhZ3kbfDuRcbRWJFtQYAh1p15Ud8hMhjjvNBc+Ed7bq23EMsnF1p8ho8sdL2QUauD9CU
	 Mf3jxNuPSsDeCKHM4BrVX5nHZYsrvXn+7qeXFOwExoBH0arIYhq9L3QrkmjTnzSwseQFF
	 mluutP2ixK0cs/kaGinxhwXp5zLwyDmjQbtNnPujdnzPMNyq7nsQH0Aqjf+TEMLx1mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WMdcy3ZLtQBYBPHMfWrBfvXyV/RjSupJYsxTfmkSBvo=;
	b=EPcBKlE4QlQEwjomtZfvN7c4mDms8pT+7uIRZwSVee1p+uDvM/69QqkFhHav/Vuu/tez
	 17V8vDvwGR6SFT96MuBaKYk4m1LwMcAsu68Fcr2+5uU7wn51HcH3oECNSmNXYyR38afPC
	 fpfV2qrMpbbsaQM0C30o0S0h7V1/eactmF1zMNszMd8v4IB/bFnKrlz/kSFQlcHoujWpv
	 2uIWDNsK8SvduvWq3ykCXC16b9tqQvTXwRv+9mth1FbadNLeLMckig4qYCdMBctoQ1Y4I
	 WmOv32FAhCf1YPz9tQ+NvIb6WQc2VrTGnkhbjhUmnUdHw0iv/7qyLTocqmDO5n2JUJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WItqlh2A;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FBA608C9A7
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28FBA608C9A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WItqlh2A
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso6983405ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829612; x=1794434412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WMdcy3ZLtQBYBPHMfWrBfvXyV/RjSupJYsxTfmkSBvo=;
        b=WItqlh2AckCqCZkzZGnzRsTKWRQCESl/g7QqZSeQcIQw4HSPL/aun24RwzM4TmB8XL
         e1qemL8vpsG9sQr+4uwEkdBbQQN0aptGAzJ5932b05czPx/TXSHReL2cYeWHQf8Gu3AU
         MWKxxFJsFjfLPcYhOBVn6UBxCnyOiV4YQU+zIbs8ahRY3uSJZPSFsJfPUFWN0xTFCY9m
         RUpsqz7j87Q/BhqhCkNnSBzKW9mMoALlVGxR1+rn6ersgqsoAGq2EQ2iQU9DokrZuqvT
         J+8Ma0M+2OA9ep5rcCAQRGrtu7oYlKTqtLzCypsh+WriaO1srBdwjSZew9o/aKO8dh/o
         sBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829612; x=1794434412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WMdcy3ZLtQBYBPHMfWrBfvXyV/RjSupJYsxTfmkSBvo=;
        b=aHWrqYbrwr7ooEwZhz32ZKNiRfRwj8OLKJWgEdGbD9w9QcgmysMA4xue+6J413pvyk
         c1Qwgty3tUeqAtvdCppB3fiYbf4JLuPRwWU53Mnwa1MKDU0W2hNbzXyffuNgRpLvCiSv
         Jq5I25a00Jt3JclhRbXWdPKilfs1pc77+esAFd8MgPq9GXjaURgxPjuVYDJ5SBdyVRZQ
         +hLPIwzJwoeLT6XqaMAYsybmKWU08URjaZBpTDkG7PQmd1UPclBqmr+flKMijWLv9Whz
         0KB23XxkE05nVjDLggZSKyw8zTmBGONC5PWiWy5xVHQrK4eUgOhdWC2fPIdwikwXlZBt
         Ut1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZBR8QA1u3d98YhHE/lCiLsnoEXUAjkjDYgUNrxnNcXGEW3NwYbSCqpfbugcsmOqv4YxIqXS0eyqaBAgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Uk/tNlzjL4+iJQqIvW5VGUXsOU/fSC9T5wxS0XyOxKxuSA9x5
	8/Oy+KAIeQsS9gsbGIwTxgmY3c7An56JVpecownxugBQttrqr/q/AX2RPFwaNw==
X-Gm-Gg: AYBFou0/lR9/KxvJV61cHwQL5pr6Y3GLG7ptvGgYWSUN0Br5wC6/941Uti0Yl7Eqasg
	tFMaxs3k0bPGCce0kkmZXGKOyRGpoqiHoxyxyh440d8sDnVaLC3jk3b3LIFSF0ecPkuN1fZYW8Q
	FtOq4p+z03GpAkn3lq8bPnGgEQM1t36rvcLCWcujJI4WYE257rxeE/8LAlPWlQSlnHWgCBMtXwF
	mMFvOMJp4c4FFgiA6Q0GbzAjRyHjsnX5yzZtW+kiGSRDWd91BpV1J/qpZgMXFid3P2cGQB6rr0F
	nzd66al51lmg+GUakqFMalVVmwi1bNtbah2Vv32Ugy609Z+zYNVcL6Riy3DiReakg1fdmfvo34g
	c5feVLC5ad5jpgjh2C5JPEjzU7KvOMC3FK2MOuNJxKDN9NlqWZJH5cQvYQIdpRodv5MEnLCHW3o
	LtH7h30BHCzecUI5/tl045JoFtJ4xlC2FnPn6ERuo1xkQQAxBRjlyfJVEFQlgA+Im4gzEgHWF+v
	tbJzMzFwJr6hClQysMnaksk898gmoDEO4brY/hORAEBVxtXJMXMN+6MT6OG9yQd4/WIAj00b2Iv
	xfmkrj9ga1aQ5iTAKhrlu/lheEMxQ6pOvk7hWQ/F/htO6Raw129mZ+mNZh+UfNEN1F+Pp42atpQ
	TcjgSjB1AyulLEcxJ5VVhfMWyQmqMxOs0hdpZ+KgP+n6766H1m7xA0OhlBhNqtxpeD4tcA64Hi4
	lDZw==
X-Received: by 2002:a17:903:13d0:b0:2e9:9b5b:e179 with SMTP id d9443c01a7336-2eb36504ec5mr174592975ad.50.1793829612330;
        Wed, 04 Nov 2026 14:00:12 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:10 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/5] gpio: ppc44x: tidy up includes and probe
Date: Wed,  4 Nov 2026 13:59:59 -0800
Message-ID: <20261104215959.24035-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215959.24035-1-rosenp@gmail.com>
References: <20261104215959.24035-1-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused includes that are not used directly.

While at it:
 - use devm_kzalloc_obj() for the chip allocation
 - rename the platform_device from ofdev to the conventional pdev
 - compact the OF match table
 - move module_platform_driver() next to the driver struct

No functional change.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 8b9ea00f170c..04653e753d43 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -10,13 +10,8 @@
  */
 
 #include <linux/bits.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
 #include <linux/io.h>
-#include <linux/of.h>
 #include <linux/gpio/generic.h>
-#include <linux/types.h>
-#include <linux/slab.h>
 #include <linux/platform_device.h>
 
 /* Pins are numbered from the MSB; the select registers use 2 bits per pin */
@@ -139,20 +134,20 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static int ppc44x_gpio_probe(struct platform_device *ofdev)
+static int ppc44x_gpio_probe(struct platform_device *pdev)
 {
-	struct device *dev = &ofdev->dev;
+	struct device *dev = &pdev->dev;
 	struct ppc44x_gpio __iomem *regs;
 	struct ppc44x_gpio_chip *chip;
 	struct gpio_generic_chip_config config;
 	struct gpio_chip *gc;
 	int ret;
 
-	regs = devm_platform_ioremap_resource(ofdev, 0);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc_obj(dev, *chip);
 	if (!chip)
 		return -ENOMEM;
 
@@ -180,9 +175,7 @@ static int ppc44x_gpio_probe(struct platform_device *ofdev)
 }
 
 static const struct of_device_id ppc44x_gpio_match[] = {
-	{
-		.compatible = "ibm,ppc4xx-gpio",
-	},
+	{ .compatible = "ibm,ppc4xx-gpio" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ppc44x_gpio_match);
@@ -194,8 +187,7 @@ static struct platform_driver ppc44x_gpio_driver = {
 		.of_match_table	= ppc44x_gpio_match,
 	},
 };
+module_platform_driver(ppc44x_gpio_driver);
 
 MODULE_DESCRIPTION("PPC44x gpio driver");
 MODULE_LICENSE("GPL");
-
-module_platform_driver(ppc44x_gpio_driver);
-- 
2.56.0

