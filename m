Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446924;
	b=4anmvLijSK/rM+LUhBAE830zOEEN+39jEu80eEb5E6EyC08By4Prq8bc7XSHJj8zjP0k
	 g1T/JyigbQqiQvf+HrnyDxFtFf6NVRrDxjRrPl/AzvDIqGzN0wDb7VlNV6cPJTwG0jW12
	 Bq2WDOsR7goArdr3lqHfZlnkDQZ3ccjytCvL/1F3cVtKckhxI4gmU65DNcY1lynmHjDSH
	 NsM/72Yj2v05mEhSS3qZ5X8AbnKV7SBz2DoT0NZjbPCc1dAwpMheTuRC+cdZCIe+s7MP3
	 EZj79KY6bFkPrbsSwkZnJ5/N1eI1M6yCb1c2f8fyw3SzPJGYMMTdlMc0peLHRg30bAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
	b=kzEVwHFGWjZTVrZcH9VKfifuXJ7rB37poYrr12ZOeSHfbdkIAJvKeSv4E+dIi8vT5U9i
	 gQF7uk3uNx6V1y219vzJGds74cCfpEcbyWeHZqTz3GZMIF9zFwP/rilGt7avT2bDaQnpu
	 8wP3xNlcPfwG0jCu8eOGFQeDTHZV7+ju7SqPOOZxZj8F+phH/g/bto6/2R+YvWpqLbipc
	 cEURH2LYzpVoh5ODhqlPY6v2Z4pvtPAzOTslrHmOGl4FKRZZKqdaku5LKL7Ond0/mfmpR
	 6P8giEXBzSy5sZfAVcSSgzwJ/JOekDohMUYw24XxYLkXpIZ1iUA9W4rHnjOWFIRw7Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=So2DRt+m;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B9C60A3826
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B9C60A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=So2DRt+m
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-48e9476e26aso1390538fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446923; x=1795051723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=So2DRt+mwc3ddXwknCrpd+Z6jcDfDVAP90wCfPLrinMb1eyUED/k7y2Uq3da1HRdAj
         eGn3ue1v730AFBTC5e7hrXt5iOU0BVPntnZy2CB7BA1mSgkk/gf9JzrVYPtqvtqG4fbD
         ETVupxmlMzMf5zXAajMdHZ3eeSLr5COlkV9GavOsSEoTMQRtSAa3OBA8io4BMiqsrcWP
         OkxirAFN+/2rywJvlVJQUsaPKjz4wPLdRo02BVECqHg2P2KhgHlVyxM0KrY32CCGxiDU
         J6uAWaDfvsAmF1RtUWRGhHYU7kymAMdzVqTZFP8Uqmc68Du7YKlRrBQ/36eMfPvoluSA
         n8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446923; x=1795051723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=n+1ONtnz3AtblU/4dk6y2vjyD9I0yz8IEJz/Np3oNpcQnmzK2u4LubXQ7RGHVjJM9T
         8mfccGu2GMvPAE9V6DLeyWRGCQafLlE/Zjcj1eH5vv4NzJ70w5lBQTMzOahxdZuOYzoq
         VTtJzEtdytuuopfcqB3hNXb+Bjm54aVBB4SPcr2Wuhbq+kVbZs0ISZnTAiaSeOutDP+f
         zCDu0fssuIdgJgJTSDpIfDIwrQPlDLht9UjdUe8FDZKmXrRNbgMBwW3qhlk98hXD7tWQ
         g2Bi7o0b2qh7RdIEu2CogrrxoTHorbVll2nnrXVZTpUK1AeoCrTisD1+xLgdfGRQP8ay
         oJEg==
X-Forwarded-Encrypted: i=1; AL+hErERubfETZ80jjkkl44VsLVI5sYQRrmZsgmm6jmkeDxs0EagT3doLE8JO0yClE6qQefxin5krKzu/xmA2V4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DD1NnkRBxAoO1JoyXIh3vm0/6LP+gFiT7VtN6MgXDJGSrD2Kf
	t8qDJDB/0pMs5prVnZd1wctab2FhT33wwLKVPBLlI5h/nS3ILBCmPjIM
X-Gm-Gg: AYBFou2Gg6y2Ymp48QU0ZwdZlv+GI8HyH7kc8UE4Sgw78fIzSuJmvpDulSwDTDh9prq
	DKMk9VSz2pdhGVsPWtINzs60x8KKtJZCTge5aPgiYtYtUTB6r3YlzihMQS/Qvk1SZcipwRNCHo0
	lPM/n9ZQUfkvzG4zXNyJ6ft2IeYsozaPD1emaXmJUzdWBGVOKyvhVQay3h0+PWzJCfEXcI/7sgo
	cYdM3zxx0xmwUmf80ISEWSc8iLjlu0qRQVE73UnDuQaHdKcVYtUTKM968pyFW8k9AI4QO7C8r97
	JhEAN4Cndq8FKLSal9EnHxzxOOPBq+IAJTrUAOoP2Fa5HXDRdcWKYLqSWzk8OjPhyjfr8Sccr9F
	ML+B2QLQKN7VnvcwEVX3twATepHSuNj/JrujekSwm8WDBPJx44hQtybpcpJDthoSrRRCl0KUlX2
	5s1/Krn9XOpE31jl+hylHWdeFCiMcJCoSkGk0Io7IfBwAQG5XzOEwl1shl3lfdIkK27mkLSAWKs
	7TrhAlHsA7xr1irW1SYBKHJz3zgFe+wbY7reHeP0PJW8JE8RJrCNvTGq4PEB269a7urvr4oqxDI
	MpLuytpII4jrb84ZGXzmlf/N2zJyRfkaEt9vwtwEA/zMwEyunO2wRwqhwp/7CFFWlwtwZi0khmA
	K+Y37nBkJSVq1fQivGvLf6wz13WsRqVP+1/znc61NRyYev6QiIk5AMLVMNs5erMg8HLmoa/tTMY
	tLeiJhLuoUIQy2oZKrfGAhpVSaA6v5tOWZCYfQQvkJfZeXL8foved9
X-Received: by 2002:a05:6808:30a5:b0:4b9:a88b:888b with SMTP id 5614622812f47-56b96ad0a30mr4058270b6e.33.1794446922686;
        Wed, 11 Nov 2026 17:28:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:52 -0700
Subject: [PATCH v3 13/58] mtd: rawnand: mxic: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-13-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Mason Yang <masonccyang@mxic.com.tw>
X-Mailer: b4 0.15.2

A retained MTD handle must not access controller storage freed by
unbind. Disconnect and clean up NAND operations before disabling clocks.
Retain the copied layout and controller storage until the final MTD
reference.

Release scanned NAND metadata on registration failure as well, using
retained ownership once publication has been attempted.

Fixes: 738b0ca55f4f ("mtd: rawnand: Add Macronix raw NAND controller driver")
Cc: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index ce9fe27fb4ac..9b666a2c0a8d 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internals.h"
 
@@ -492,10 +493,12 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct mxic_nand_ctlr),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (err)
+		return err;
 
 	nfc->ps_clk = devm_clk_get(&pdev->dev, "ps");
 	if (IS_ERR(nfc->ps_clk))
@@ -523,7 +526,6 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->priv = nfc;
 	nfc->dev = &pdev->dev;
 	nfc->controller.ops = &mxic_nand_controller_ops;
-	nand_controller_init(&nfc->controller);
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
@@ -541,9 +543,17 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	err = nand_set_lifetime(nand_chip, NULL);
+	if (err) {
+		nand_cleanup(nand_chip);
+		goto fail;
+	}
 	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
 		goto fail;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 	return 0;
@@ -561,9 +571,10 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	mxic_nfc_clk_disable(nfc);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id mxic_nfc_of_ids[] = {

-- 
2.53.0

