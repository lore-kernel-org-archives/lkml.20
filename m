Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593781;
	b=vlVvs4HKKfPLjCcCE2qVxvwyv857TfRnJ9Lqfa5taGiP3CftJRD2TTG+QZO7OBy7lgFG
	 9xTAs6gWCc9Ian2BLU8QmJo4cwGcRlzOqUSsNlDRF43VbWa++HvGQjXr0wi3HFZfXP1Y5
	 APTZu2ZhU+jRXdix2HS7MEkqxrwNpdNC4BzL8nV8S04xdVlhqstfdev5su2ZjmQnkNwzf
	 szLdn4Ee0j85eWvFgcKKvLOCTMHNYfAKfG0znZDu7bZkTYLn5zb/jI7Hgzf63EOtmXADS
	 NrKsArjN/Wi2CFPaP8+5rHqJW7KsRddH7+zoKvFRXnHT3cz7DcMeyOfsF6JDoECMysw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
	b=sHEpnd+KOG0z1KuwKxTV5tizl+DFMxILrOYyFj/jNx+Ng4p0IQaVaq6poqL7vlZ3yYrv
	 CRz8WOAIymZo1p+MXW9mV03SDLftU/gfGdUlKdCbUO0ZyxCEdip0Ok3U9bISlkts0D0d8
	 tlvOX34Xsng1luy37c71rCmoafkKizQyiZLRuZyVNIh1uFOumFBItj1qFZgufhJIf9Rrb
	 4x6kMRr8gIpXA599Lt66i6rAk0GwIISoQoXn/cOI0RmZkswQEOyQv9J8HGOALvNvO+sNP
	 kTYX7c1GC/xS+Dp1R0nfN33mzG+7cz9tvDLvGLEBMzP8ILKXYOIjUU7R4BQy0yMoyig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p5/BB05p";
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F2B606A6F8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F2B606A6F8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5/BB05p
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-847ac7ccd85so1463570a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593780; x=1795198580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=p5/BB05pW37nqeIBUoEQXfEj2TtePvaPNr/APXGPOaWanKDLxUPMBzdYuY1or/L3q6
         40Ys+19eMeaL6HKffijRYadE3LotEcKQscrSbkQ3Ht/wv1ytYnNvEHYfO6k7d4DaBGo8
         8fqbgUpdUAr8YEWRZAPlJ4iDK4ftp8+exWSi5MaJzA96iuWs/dh+za8k9gclec5irJBS
         imx5uK8Cyyxecd1uPdqh+9Hk5lXJf2R2ORjgccA8tyBl4qVhyXsKzgJwKqzU31xyUgdt
         Mkwn3BdiN3nnZ8UHlJI9UtL0pkpfe7ti/wJ/KKVrvq9wB4g99NgNAtcQMk79Mj+oIgbu
         XyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593780; x=1795198580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=1bLO7Aa3vBuY60WuQG64A3t9GQH1+mPM4A+DrPfEgBxWSMJESO82mLPcefZomDM9Y0
         TLjVJxzOp0xFazCfcYpvdIx5arFPqW+MjZ0oSSjlrlX8Qn4y6TPi3XwrF5+52pInyTpz
         dFM8gIQnUBKc1plMHt4z0KWDlsmex4NzpPUdrHD/CkzYilP70v3AFAwLvLL92iuxusgR
         n+b5jE6SeLbtf0XLDYlHA2c/qCs6oUqySZhi2hL9dXiKH5ktUEkOWPevCGq2eSeBFvhG
         osFuGGKIzDWFAzIXxcxaaJedZ2H02VcdCGPqi98Dkeju47vJ5n0Q18aslkWtawMeC0GY
         VBtA==
X-Forwarded-Encrypted: i=1; AL+hErFLHGVttBjP537vttDTRZIN8qQGzDizoGQ5lSCxTAuDhqu3QZ3uFJwTO1ZIGeMx6m2Set3ASpSLmiKXYDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rc7qGJpIMXtKU6hSS8v+Jy3hoTrBfL1INmFbQl/9yTk7k4iyu
	sOgTKVeZ0oFUaBnB7rpe6UJ7bWCWYc9btvyTdn1AeFKHYzQPjt8212SfFkwV05Qp
X-Gm-Gg: AYBFou1w8be9LqF5YPv4IBzFGxHDTr8OxanuFGyO3bCSsr77yv192BPFzGaLnmEI+4x
	F8SeHuS60yvd8gUH6wUtfNtLxSkjHWUbr4JeeIEQ9+vHTcFZjwlezum2dGZ3ji3Sr6nViX45qgR
	aFQXLBJH+PZnPU049+kBUrrtW10Y+HpFIjJT8xRDzJ7fZi7AEhqDzawAWb2AKVb2NlpoGP2EfiH
	ILJ2tIZt8xjtPNjbyIFPm014DOyNN8bkNvxn5uVbQjAezwLyLzaiEPD9sHUpFLdVWZc+zS2RfK1
	DtZSAziQQYXO2VU4y/EvHQK2YPsD3sG6h0kMJ/STN+PqIrrKE+9RxQg4mQ+soCYmdcAlBNt71y0
	RPy4Ti3tpKfF1gb4I6ccqJi3uQh9je+ZKdpu8FRb9xdRIluVcwFV8tq9PZN2la7Rxh6M/sn9Xao
	dEdA3P8GRHXAkh+gJDHahsCrzNDYTbdVUMyd1xzk710B26lBBvOJuQGE0CmDP/XRFyE6CkJEQH/
	FNiVbSm6N2TOy87XrHtt+VVLKVO4+aH+WI15SUhNfCIjxPJpB8KUrjaj0RiTdVeE5GpWxPhYNVT
	gdthg0zwAF3jxRDqWvX+J5q6Zlnis4ZYlpeNberl6LO7rtkWFsnT4sPXa8jqZgst0D44wwPKKIQ
	4trB0eQJnEt1o5aUCb7tBY0rQxu49m6YE5Fvvvh7GM8FQKBPd2RVVnT8PR00VUNUTb8C1pXIc2M
	GvwbTwexnbr3FYRr1AzKXZTRGnEnZ07VerGuYHXsDfpJeaP+IYfiE=
X-Received: by 2002:a05:6830:34a2:b0:81c:e293:7d66 with SMTP id 46e09a7af769-862898d7d7dmr2413051a34.21.1794593780042;
        Fri, 13 Nov 2026 10:16:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:58 -0700
Subject: [PATCH v4 42/58] mtd: rawnand: au1550nd: retain chip state across
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-42-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

