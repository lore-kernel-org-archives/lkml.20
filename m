Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593744;
	b=AzVm2W50YURn0SJn/adsZcoKGhXmjywJVfmx5bWXwmWC90kzR2dk/Ag7TMA+9Zi74ZfS
	 BM/GSNABNYgbmVLN5j/LBv6P59XjW4qI5MTEa3+6rUXcW0HxOBjYapoGHidonIr00Zw1q
	 OEpm3ZPVeTuGCtzknH9FdzuFZGcHxMkTY+m7jDNgOxKbHZhHQJZYgtD4a39GG/IM3pXfE
	 3w4HvS0+knzKzFoGlGRJSnH+i8UbDVoZ/KjtwaZHhgYpSNXzRRTzG8Hl2BcTkcoTBhz9r
	 746ntUhz+MuMw+9j5YNVSDlzDwmsrazAOZtL67p8N7TH9aq/aZS4EV0lE9PIARW94qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
	b=BrqsvRi3n5RqwcQr7LJpdDPMl3vSBRQW/UWsJhaGtuBEwBpsQX62uwE3KORrwdlsOv79
	 NXlfr7knUf2VxOM1zR1wYHR4yxA/DmGk3LHH+9rIq+1poMZSNiD+OzLVAfeHDFX83Wtbw
	 su5GgZpOl/qLcE1mavNVV/0oG9QPc29ewf4ZR3B/WLTkQ3YQoIzBBacaqWf+jF1ZDEhXX
	 hIABYGz/W54LuZ8tdBLTKUFgwORwiJG73w034zoZppue6QbhMps3uRhh3R/3++M3oJbRd
	 Iq1K375WK3/TZd+BH105gZnVaJama94oY0+ipJ7AhsVmC8jQul1peOv6am9QLI31KAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zp4rAIgt;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E1606B500
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0E1606B500
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zp4rAIgt
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8451a619da7so1559879a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593743; x=1795198543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=Zp4rAIgtMG/C2pphlLj8m4kWKegiogLpsxFuqtV8gW5W9HyRe4Lw7lmTjqW5Fp6ZDt
         LLxmIeRk0Fy8/XLatch5gPUs7eiMxOzU/2W8QCFB7yUR3vea8JJnsmD3qWZYzzEwtlBo
         GeVoqHn/JQrrU5y1fX5B+qDFE3v/S4knkCVeR8W/IrS/Z+aEngxFiwZhTmoRBy9Z1S36
         zvYC1Mgw3zhyFlaOcjXozhXVdxhGy2UBaLZzwJ3qS3Er5j2EnbKq8kO8TAnwPmRQAaao
         ZJNliFQ8COCboWTHgktEcc1fKEsKPn6F6xevo8Z/2iz2ugjpwcLNwRUACRa5VsfvA5FE
         ZH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593743; x=1795198543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=yRGu677+9Mq3Pudm5EzKCWsaHVs10yIM7on3GEN4lEIMh7fGQNP4gld8VAqG+mjPeo
         wkTaVkGTozVas4oBNDu+5sDeVKzUxt8B9llWegFZNPLLz6mblfC/9NnhnbBxUBV9Jhgs
         2RkpZjcu9pZ6L9P0HiXi0qzVUjGM9yyVV5O6MiRT8ZB9VfDUxTDez9AYGVndyEYIDCHt
         O7gBiU3sdZ+w9t3pUHEvWq9gb+WGclPLsnoO7pQHygbx7qb1kEmSPQjHAuK1jKeHWumW
         oMpa5vSeq5nFrWKpwb+JOfW+1ktQ74dnimqVOxTuw2gbwcl1TLXCgcOugbLA3B60ZvZh
         6LXQ==
X-Forwarded-Encrypted: i=1; AL+hErF+tUhDeCUobhOSmdDqgEW9AeaDLZjzna0cORHk2QANw0M8QKCMBAvw7byA2oaDV5YpGeDITzxk9TeQE7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BibB6Q/Mu4A+GDq3g2cDZFFIwpIXIs9RoxWm0HAHPIOvHxTPw
	eOa6bH+J6WAv/gg2mWDkiPZ7v5MTSXmwK/ItuTTXP5pr20ASQ+jZ+2aFi+3DruIX
X-Gm-Gg: AYBFou25xfr9LsxAFgTYn5nAMhW1NZJpAPSKlxdwD97FaTGxm7eE6DBUtzmY4JYSbFU
	Dbg8vhPtNqsrBnhI78kBe+Rqa7MYptuiKvEMIjnzIRADRu0xDPTjCvH7IQoaEsW7wcdUQoQqzS5
	4mOn/l8iUEWgKCPs/Hvcxn8QyUxR06FDHWvWpmotxi+ws11YL3uS2Ct0M9R6vpjjigDPQZ5eVXC
	NodPiaSoZCnZ94zNkZ/uzYyo83UaRCwUbQd6bF7ln1AL9bBg5FAuwRJaBMzJeZnhvz8MzWVDEVS
	m/41IY5GVp5H+XTsgNeYQmU9gv42B7GYcI0xXe/NhkX69SWdbWCuKAfrXhrBZlSEGNz2MtJZFib
	O+k3EZ9z1btcmPi9lOyuwHty0Iu3TgriB2llP44XHUl0sI1avCL2fAdCoYE4ys02xUpo9ISnxOp
	vd1ppwpn7NBGYhudLY08sFKZbQfArkGngydYQ/ogsW1SAAXA1i7Mc9LUK5Hev6F2VtKWcs4W2NR
	xFFb9yJPQDBHVTHedr93YYo4iQBHLMFd9dtE91w21gNPqishv7iBzTMJ9hU21wIHm5QHssnXakq
	p9z4HD9ks98kGSsUnrWyD7CXioLLIN1KqAMHb4Ao24MGNZVgk0MpiZ4biM4x787TrrEta97E3NG
	A1KQqHvqth5fkP6IAUiN6s8xfgdWd8wtF9716v+ldEs2a1EBDU4zqIMPWyO9SII7D+MPV/XA2l/
	JIJGjQuyhAy2mXdklquWJ1NP9hAT7rssgWLRhDaJTj/yuEOWdll9OUwHrzds5af2SMBwRlmTQS
X-Received: by 2002:a05:6830:4393:b0:814:8259:780c with SMTP id 46e09a7af769-86289893186mr2921738a34.19.1794593743288;
        Fri, 13 Nov 2026 10:15:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:40 -0700
Subject: [PATCH v4 24/58] mtd: rawnand: xway: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-24-556b1d7c6221@gmail.com>
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

Retain the embedded controller and chip across platform-device removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index 7fcefb24fc23..89c4cda08794 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -8,6 +8,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <lantiq_soc.h>
 
@@ -171,10 +172,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	u32 cs_flag = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 
 	data->nandaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->nandaddr))
@@ -192,7 +195,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	nand_controller_init(&data->controller);
 	data->controller.ops = &xway_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -228,9 +230,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	err = nand_set_lifetime(&data->chip, NULL);
+	if (err) {
 		nand_cleanup(&data->chip);
+		return err;
+	}
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+	}
 
 	return err;
 }
@@ -246,7 +255,8 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id xway_nand_match[] = {

-- 
2.53.0

