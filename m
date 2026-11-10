Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296685;
	b=cTlF/DOPeDOXOUTt5mF4xfMsiCLWP9iDkO2TEmuAsFrJ0g3n10pWtPrHtaRykQiMJYlx
	 NqTgX5FMDd++xXXHe09pthqXhU9gkFzNOXrBMFgDwfDfT1KcwxyzV5q/mUS4MqYJ5jzan
	 8v2rI5d921Oi2WSQccNMSkkJjCAjMuzPawcEDnnrO/HMHhvey+tNPy/z7GM0lLlf+t52G
	 HVI3WO+dhL341kEAgcHru4RABQALla8ectbk/XEgjzK4dxPk7tVtd8/2z71vrp7dQaKtT
	 ubpxJCENwOoPDZlFEQ57g8uyNJgIoCLLkJboxGJXr8Q4AzLlZHngvgRqNS74lIalBJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
	b=5Bh71xvxVI3M9imlNTIry/pPR0PALGgiGyb5I58Roi+bou1CMcVFyllx/AcQ/5kXC+B2
	 jN6dIKPWy/N+DZA9yynJPMdPgV3hwwEg6WApttc/xBgvlKISgKdLHk/GXFCrbNZBsOr/I
	 CiZn+NJSSdnC3Z+ShKXIiA8gN1S2nDJVY5twN7tsZKIU9q1hnn+J2+K1Fum1H5GDiu5nN
	 aybiIQei+6z7Ht1jGKlqRSaseOtbDj4krWWNXricW2Vdeg1OuswqSE/Zutw1MWJkUx7Yy
	 ksYCWhfHx9fghodvzDrH5CRyUshPykYFzZgo7bsXa/b1pK5oxzV6fHwulhUcyYuVagw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIpVUKVF;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F4960A261D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F4960A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIpVUKVF
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f84a55e31aso965155a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296683; x=1794901483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=wIpVUKVFOBjAhge5zmZ5382aeX4yYTjpu4AyEkdjI0RIlus6c4hHRKDwzE4c/NF6WN
         TPjz8Bfg8AaTT/4oYnEL07hZXUriPNQdybewy/bivN8RHfO2ISA15bwkCutKALJeAp3g
         CGFhQFr0Ple+nXAkKbaA2eAmjPXT4avUg7BphJerOvxbKqEq7Oy4+pAt5YmK6tR8F/g5
         7ubGgCkX3cIsOgC8KTpTmVDXHzcT9cJ7NGTx6m1z829uo0oUnN9SSz4QvxEbDyX1M29D
         VAm18nRb9+OY2MzWMzfwZIDF1iRkYnlZj8/Y7P/he6zIuEE/FsspL2SPHKk13H3G2snC
         y2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296683; x=1794901483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=COL/UntVonqO+zabg7KR0CQKTpZ4LtuJprt3aH6RGyVkuFdM/9t8kHsMvMa4YmvhXh
         SrhQN5wNnfwXvxD5Kc0jvo/LPJrxa2owmlX+FnVWtpuy7139xju4+6NGK1vTD1pOw2uX
         +LeOskSzdjJNhpemWH+wE6JPADRRq22zRFq+Afp/Oj8RGCYau5kMAj4VPBRis7VYNZ1H
         5jjXFvi5o5mzSPZyNyU6U+rd/F714TlHKA7SEqfJ6gIVKpLRXreggdIYzAi9b9GH+VU0
         dChtpSgnvmonxJi7VLaAQ2kGmHq2gSCtaRfZbio5NKfwPRmZB1pPgTJR3vR//5BXUJLR
         1Olg==
X-Forwarded-Encrypted: i=1; AL+hErF3EbXlZYfdnLDISCt3yeDkM4r3HLr1S6sTIhVF0r/ruDbLiBC0dBCaOPfYxJptomzS3LSPwRvnTaQcSvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9akY/AZz8gDI9MFuew/y+AbVAhWGR3LUHi76dxqZO9tuRjr2Co
	4NQ3y8hN8cLR+nXAq+gkwZyxkhvcM/JNfRWUCTm1outLZwoOQgBJO24TMYHsh+Km
X-Gm-Gg: AYBFou33nRaSSQSWNwP7p6qwfiJiLrUGoo+QbFyKlfItQstSQhoNeKrjT4RGaWoJ7AC
	0GjqiqASt1MX4FDvhe0lNFNIr0A8/QqxZklb7Xbpwy7JG1dZhsVgu+lHHe1cxQNsT0txcO+Q36X
	d4Axmi6PRUL5EhhjL8jJscfDJowAKWMZGjdY1BznTiwDGvCo8GeMizRJo+koPWWgY3Qg8haMNuI
	yhAPCH1ayPzekUg+8Yqj099GhOaHCBCwff3vOO061ssedpMn20x4EkuIA2go1+DHtQp9C/aRnKN
	PKCbKEOgeXCL+Ycu7xD6Kj3glndlOm9FWwOG6Ne/AWNOIfTfxmGnGFwIyj8tEyEoRUonrU4H2dd
	vYvf21T/fvDgB0o/7BrZviUinWTxQKeYPk4P1NzgpzHpl9bbnbSUN55jbbs4K0CwfEKbyExTlMe
	TVOKOd63aYuqZXuvD4ShdF5oTmhe6N/opuWKGH1EVpp6IOYNKbYsdZAoSCoQTp8OO3zTkEOFEX0
	YO1f56tfNvOLZpkyMgdgsecHDJC16gFs4Ur1iMfC1mlZVa3O3uF72E0cXIahqgoITFwQQNCVsJq
	IC6XtystclR2obd3c/o7VCAsTU5O8RDSGMH44f25WvuWeqtZmnVFhxjAI1+wZ3bHNLjTz++o4LK
	uwKCAmIPBurloqBAshqQRrVVcIr+XmAI4zfL39Glp6ZKLC2BWTts5Ol8ZFZUCUvuQDS979lPxlB
	rQrL79LriaLbGlJReBD+kNOTr1wvhQNfe9N1uYmbV/XVH9s9Oh5dM=
X-Received: by 2002:a05:6808:4f6c:b0:522:1ac7:a573 with SMTP id 5614622812f47-5683cd19fe6mr1844320b6e.43.1794296683574;
        Mon, 09 Nov 2026 23:44:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:24 -0700
Subject: [PATCH v2 21/58] mtd: rawnand: fsl_upm: retain open-handle state
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-21-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Also clean up scanned chips when partition registration fails.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index f4dc990a8da1..bfa4f450d7c6 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -69,7 +69,16 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(&fun->chip, NULL);
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
@@ -160,6 +169,11 @@ static const struct nand_controller_ops fun_ops = {
 	.exec_op = fun_exec_op,
 };
 
+static void fun_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsl_upm_nand, base));
+}
+
 static int fun_probe(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun;
@@ -169,9 +183,12 @@ static int fun_probe(struct platform_device *ofdev)
 	int size;
 	int i;
 
-	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
+	fun = kzalloc_obj(*fun);
 	if (!fun)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &fun->base, fun_release);
+	if (ret)
+		return ret;
 
 	fun->io_base = devm_platform_get_and_ioremap_resource(ofdev, 0, &io_res);
 	if (IS_ERR(fun->io_base))
@@ -222,7 +239,6 @@ static int fun_probe(struct platform_device *ofdev)
 		}
 	}
 
-	nand_controller_init(&fun->base);
 	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
 
@@ -244,7 +260,8 @@ static void fun_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id of_fun_match[] = {

-- 
2.53.0

