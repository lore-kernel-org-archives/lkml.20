Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296709;
	b=ny0NswMBfLZorJTVsPpWbZdsrNQ8hv70A8iWWRVnykFZ9F0Fysu0W7h9efMkFfiEK4WY
	 te/3zF0etL182xEWo6B7n1kSz0eTgHg/w1rkcs1jicYoNfwVEUocn45ecEIAZx+pyGsVm
	 E8xoRVj06Sm2/SyBC+N71FvaOaL0eZAjq28UEhjlb2qNdDPsVzCvuKMKG5BwnfFXGSLDi
	 xegln/ygIG6/MuRmJnQuz2Fb31ClaSR5upiSSTX9CbtMlAO3au07MojnoWPNCDJHk2uuA
	 CceXclBRjVa9RvGnBzb3wdNrdPCNE42xQGJFh4gVhtQKGeavqUldAMud5FoH35RHKvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WFMAx8E4/aXDwcVO8ktjOtO2+SQSHcxbfap1CQJFtVE=;
	b=G0chjnhm5qzxElCgpOolTW/mA0O2dHrZBjvGm7fbWCH6L/HN8SYity0jF7K1VBFTPrw7
	 gl8XXIjbyhhvIZ65KaHMFeGkDtpamnns1pUU0mmTM6Suyy9xdwIfbASwMqlMuI0iFxl38
	 AjqYbpWbasq5JniGZBisMXU+u8N13YicN+RLSig0Ze9KaawTc8oLehXW1/vV7ncYPpmKP
	 CcaeGUlHQoyejgAjX7DzCWVPV1a6Ez/ZOMbniCFGI7raBVYN+6rJpMWWcfOULXhoTjwsD
	 fl4higdkaMIkXqU2gAKrOzVRa2ZVAM58q0zgaJ1daOjA/ayf6KgACmaM8wpsRpMunpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r0juF3c/";
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C9F60711C4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C9F60711C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0juF3c/
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8479f46ecd8so860149a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296708; x=1794901508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFMAx8E4/aXDwcVO8ktjOtO2+SQSHcxbfap1CQJFtVE=;
        b=r0juF3c/u4s5ing71ZNGOTkDABR0id+d+m22BOqBSdtEQGNgoAACZeNh7A9HdiMzdh
         UKYmtwEJm8dXDAbxV0uSNeCaRZ3bIZ+CWIGznEtkFf3Wut0AnzLAaFRY5tuGy199yid0
         72zANN4diLmMk1u1uhEerKdaKSVPLgFdTX0mmLa+eW5GfAOqGCXGd7Ue8h8cLNi+2nYL
         GfZ4KoOMETYtTfHGn2yoNjq4hoJJLAVfTsFlRwMACKxnb1nrKnmidR5AJXKcuFvQqdGw
         4LygVS45ODXJ/94nGE9MpMcKFgKe1QhMQoJs8dJShISReMEl6Lw18TI8LqTYc/Qfysg0
         BD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296708; x=1794901508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFMAx8E4/aXDwcVO8ktjOtO2+SQSHcxbfap1CQJFtVE=;
        b=auVHzOmKF7ZZkmxL0yL1Ko1D7g5Z/EUnrsP9l3mV4nd2ZEITb0348T2QiRpuFwFnUL
         hxfFanamCc0ha7MUohnJfBa4GppGiLfNLdK8HWDIZhKRC9YAbT6MJS60/D30+eOQRyms
         ONMDaZLjzxM7Cjjkw2mia3Yb/OpN4YJzBHbKyftht76gEIvzJj6EXksv3fBxcclK9cLb
         3d6+kbHcc7lVgS8z3VdICmJLuYqZTzi7FN6COfKBi+fF8Y1WknzBuPbVHkZv7M13lBer
         euAB55FpRgHATgP7pH5iVFQBSVCYx1xjO5QLst2+j5nrb4gPkZMuaDFmdbSr0av+H5yz
         /2lA==
X-Forwarded-Encrypted: i=1; AL+hErGACUQ4VZQLBddpnvZ+PDpb38zkQbs0Pa97awN/b37EnubojPOtM8wXSfzvPk+O6Pu/4PJIK0wV0ORwRHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DxM5TyWs1sACL7GasEQZKT2Qa6v3LjbQzAAw8c862H7XoE0ot
	1GlrOlywF7afoLFAEQ7ccHmOL0LukHW6RYM8VoySUKHaSFsiaqHzqhhIjcq4xBAJ
X-Gm-Gg: AYBFou3omz5uNq2aGwYzblDJeIFhNCK/Avj/6LGFQxEm5j0Mb13H0TfvNlFtU1wTT9v
	vWP6DolpAljW6myMNkA7+ZaKx7OAlTqOrYbCoSbNaB1HXe8qPd/gl4TQPGK+wrjxk6ALLbBje4s
	gzo9DyVwvPIisruS2iWw1z8Zh+GikqJRvJvFGSFzVJzDXNBpJV5qiqvaCRN4koCts4sNWZ/jjgL
	27+B0M6v6Am9Rr+uO9LkuxAM+CyTBP6BV5q1dwLiyxLjwD41ZHsxhmVTWWTjfxE78+zcW0L5QAy
	RaTp2WhrU1fF2nqUcjffNA91kktFizCDqqOwq/d0Lnez9x9rQVxw7t+H8azuOo7VTpjO6kbI3Tm
	0xA/fmp+e7UwoScC+ODA7MAPQ0In5p4mCyh6tC6lgl1Mnx5GGHsS13CrVaYiUCJlW5+IMXGYjeE
	RutuYJG4W0nJ1SRrCp1KDGz4vhUHQQG3mcFza4yNHDZTnphDqGqiApTUwSucij5kQQb6Deip/l7
	Mty5ExqH8li/2IkDnZuRglXzmoZYUSwspuKRWyCEHbX5Tw9tHfm36EzQXJnjEYhHhFaT9wTv+K6
	seMJg9qTi6KejF8UR311I6331MkBvfgLcCkUo+7QGDvmyIkwCKbbMkN2bIFv87+MKKth0gxXDnl
	/M/r1WpS+GxHJledQ4Hwgiwhp3yVB0wcic9Fo9SW1irAe0Sos0FY34LuBSRDP74pHphFZM8rqP6
	Zj2jmPTmQ1zW6EaaihRwi2mEbAyWAUBUshZic7/7EcWICSaj1sNJ0=
X-Received: by 2002:a05:6808:c177:b0:4c2:5ac:7f9e with SMTP id 5614622812f47-5683ca9f489mr1419482b6e.43.1794296707747;
        Mon, 09 Nov 2026 23:45:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:45 -0700
Subject: [PATCH v2 42/58] mtd: rawnand: au1550nd: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-42-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Drain NAND access before unmapping the chip-select window, and retain
the chip and controller until the final MTD reference is released. Check
MTD registration errors so unsuccessful publication releases the same
ownership.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 6796afe9cd29..ba9019ac698e 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -251,6 +251,11 @@ static const struct nand_controller_ops au1550nd_ops = {
 	.attach_chip = au1550nd_attach_chip,
 };
 
+static void au1550nd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct au1550nd_ctx, controller));
+}
+
 static int au1550nd_probe(struct platform_device *pdev)
 {
 	struct au1550nd_platdata *pd;
@@ -269,6 +274,9 @@ static int au1550nd_probe(struct platform_device *pdev)
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &ctx->controller, au1550nd_release);
+	if (ret)
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -302,7 +310,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 	}
 	ctx->cs = cs;
 
-	nand_controller_init(&ctx->controller);
 	ctx->controller.ops = &au1550nd_ops;
 	this->controller = &ctx->controller;
 
@@ -322,7 +329,17 @@ static int au1550nd_probe(struct platform_device *pdev)
 		goto out3;
 	}
 
-	mtd_device_register(mtd, pd->parts, pd->num_parts);
+	ret = nand_set_release(this, NULL);
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
 
@@ -333,7 +350,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 out2:
 	release_mem_region(r->start, resource_size(r));
 out1:
-	kfree(ctx);
 	return ret;
 }
 
@@ -346,10 +362,10 @@ static void au1550nd_remove(struct platform_device *pdev)
 
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

