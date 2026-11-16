Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810638;
	b=YoMm8SdJY6sRCobpbUcaM2FAhkX5rVkMygzf7MfrTnobkNGpSnHrqQpWdiegQaZR7UXi
	 ZI2wNfXwt7ptKonS7daj4PkWA/V9OzvxA4GfG28ejb07T2foxJEx3wSpTRkQ1eVVcgMHt
	 7igD88QK9Z2I+vLRzv9fONGrN3u/SNArx5+N4yzur6BKXlaKXShIfOoBybCmNgD2dhhDM
	 fZl6s1/onJ3PaI6G+IKgxNX4TO0nEgVrusWz6z+dGrBQilxELiqfIpyxdoTuBTH/r6WFa
	 OCPuWtNC75x4zMkIDBRMUEcXeWb/wIc+e9nu35FBjhgjve21PUCHNEUVrJFBmNv17TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
	b=SxfpPmWJ2dyEJS001T4ZbK9skWCYfCb9t7kc4T3xDcdxIttsJx+jlWdAocHLGedrs2y9
	 w3OagAIpja4as/CF046TWrRWf2fA91JzIAOnkdDh8qP3YhzpiWREC5dheKjCySpaP2/s+
	 1sF9+vj9zPf/FgKdbmK0z09Mdv+v/qRxkEZUVYdxVsY3YBn0irSV4H6l4g6YZ+OkgpWzk
	 h+8pvD76T9ugPXUGvX13a+fz9rC3oL3DW57X8EteKKNh8o6z9kLIW8ON4YJBJzmWTLNwI
	 a9DYBCTVsL21PJveuLIn1sbNOdaqqK9K1McmDWaWdnmsJDD2O8S1ykgQ24bNb7KfX3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y68RHbLp;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2753260A3824
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2753260A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y68RHbLp
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6d290b10a35so1088569eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810637; x=1795415437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=Y68RHbLpkRAO8TUuXV1sM15mvFUFYIWA1eIeqYSOiRctaHZW394DC+oyPN21fvL7JI
         Nk2EuM1L8BhRJQHAuRc7/NfRK/dbHdKsrSm3LpMLhkZI6gAjXdy8iNlX+SbxA1SjRrLl
         mr4oGQG0mK/VTk9wMtJ63RliaZ+HSAa33CBeD3WlpuzUR++lcDvB70Xc1vXWIalIHa4R
         3R3EDoQyPohkFH6G2pxDFRnMrr17irJf+YwkO9IWTPjkfRaA32bQOVyBByQVfORy9yqd
         KY9b5Zc+LDp+/ZwV5FkuQAICAi9zLAEu0kPqBtWAW9MfMTp0JGQrmM5h0TtFSDm6qJBt
         DhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810637; x=1795415437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=sAgx3HhWe8sXvYw7LhB9b0Zy02qz9+nmimkO1HqNOUP+QyBcu9+l3hDEjpuZAJSfa7
         Ol61hJSp0GiQDimVsb2Z8Q7n5MjDab75+7bzz336CphxV1u9csnz/bfGOMjiJwTr7Oyx
         BM195owxRgfBN5kMedn8noLmg5f9HAGa0yl4Lx9TV9wDT0gAdtn6tQyeRYG560L+qkz3
         uMlHj7iSP4N9/Tfj15OZZT7So4SW/buxeVRy/Ui4B/cqK/R//c8u/W8Yc6Or/kurCyKl
         hnEMLI1cIrgc1f7aP7cbq1h1noLlK/mMvRS/pSorLEwVbVAxcICuiaSengZsF+aeVOdz
         bOTw==
X-Forwarded-Encrypted: i=1; AL+hErGJjtyGcg33oeClp3LRGpgY/wQzHyLzNyg9J+nUUdV5vHSwhbaFWABkEip8NLWpis/BQqjD29LhgEN52UI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qrxi3Tx8il5N+8L4qXrQNnXw/uM+Fw2JU99H0urMbSW7Qs251
	IU50QekLdCxCl1fo76l5aDJ70KOBJptny6Oz8Ie8X+ju/SWtGYVwkZxw
X-Gm-Gg: AYBFou0t6FVJmo3YNIBkLxPbAHF8Mqz4eop/SsfcRj+9lmW855ggmW3+Kylt4+arQ8s
	mgOxL8/vLYMaxaTirIrAR3cE+7wnqaif0yX72nVSPEw1ToLc/sTB3iJ9mhnCNwfrdpZKf57zoNd
	yVn8YG689cqaJf2FRUHZxmqxGq+itHOmiXZHHc+ikjRCPUabTUTfstkPciIwRc8yv0QsP7Ns0K+
	09UBktRtFCWniMMbIc2ikCAjLqXPFhSz3IyDjNp6YVyGlvWqWreVN0ibpZSUStFDDl6wiMMn31u
	IjwdS4okL2QwStf6/uQIs22x9nLXxk7tNT2dORFQzP4v+TLOOnkpdIIFxJiUhaeh2l+UYaVBvIY
	srxAwRRz6MQCk44H1JEO6GqUzJSJfi7/mqmcCTZN/4TXQfg5Ujk3x25nS1T0JeFURqvupksqfb2
	0Xi69IdqvWJ/bzlRsglrR40oj/HgF+y5kxY1jR6IhiD8hnF55SYaBIf+Q9nW3zhwm2Pw/Pz16YE
	9t+ZWGgX6wqIQEXRBorLx8AG4YD3bH46pOUjJv0S+1a0LTkoXhj2wdc9qKMq7rwQGA8uu/MP6GF
	K8Gn6ekG+zj3rtP5dxZYP5OP7RxMZXOMrrkq9t7kyPm0JQPdCAcNnV/6E5E1+vV3Mt/Eg3nGR00
	mQ6Ql30Bo4svh/du1cTwtCs6Qt67XdhyrA2I1OcBoEksVgpnzOYlO5gpouTvdFKtoChag1K41Xu
	x6VnUdE10pkq3qiUKlRb29lZiYnpqwnnk6T4sUqjsVcabMA0kY+F0=
X-Received: by 2002:a05:6820:7082:10b0:71a:e6e4:5554 with SMTP id 006d021491bc7-71ae6e45dbemr1816031eaf.12.1794810637010;
        Sun, 15 Nov 2026 22:30:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:57 -0700
Subject: [PATCH v5 42/58] mtd: rawnand: au1550nd: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-42-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

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

