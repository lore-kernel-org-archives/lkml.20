Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593747;
	b=mZXdOBa++ngrrZvZ+abkzofL8L1Y8pKCaR9qxi82uI0Kge7g1OIbqgDB9xl09+jfseF9
	 +4JLGNFDqNP9FNsfQd8usc1nIqWTABJJP7Wbn7/5WwD04jF24OOBj56PjfxFbcaHLRP9V
	 x2O10RzNzMEIX2eVPDkaVL1KnzPbmK4jncFg/iagG8mnZluV6zr8NEgMTnUbS9K1EAYRI
	 SNL/x2ehxzBnx/p7G+a6ItpCZ+md7vXhFdmOR+EV2w6GG8wI5D/aFTEJmgoLVDz5+aTSN
	 3AB39F/7L/veONfwwUyNsTOxajgqP7mPPRrWe4j6r1AyRVpNAghWrFSIBYpl12VbzVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=;
	b=03WK+pYUtra5Jk+xpEHOiBey54BhN2O7rSxqddCiHjZlnklhfQGtuJJQ1lMWPLEfQRM2
	 I15Q8FFE7aocxu8q1Cg1X4aAqDv7Z/pnAcmrit4GcuTBzNlvUadgzV0hZ4B73yF4hKkrs
	 afKF4QZSX0o5y5++3rRgmB+2fvBtbTMG0ZnqJgx2n4YqzPIlmwl8x/C6RrPT2e3aAWUxd
	 lNAC8xojH5hmQX7+uJWfQdqBbe0+D5JMFEa9FRVSxC71vjd9ZE0F8IavMEy6wfuopYF0Y
	 b03G814YulcxcY20eVPokUJ9erDlwCig9Vnc6wvDkW2cEDo5LKiXxeLBECUQfeiogwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3Ztufwu;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD2A606C0EC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BD2A606C0EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3Ztufwu
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6df7f544919so1458004eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593746; x=1795198546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=;
        b=d3ZtufwuuyYpySkXRGe+nmO61P6MHtsabcPqtyZjaq97APivkengvgbupO+q5v3dag
         4WeMSsxmz1h03r4D4KPOmMVf3iIrBrxHC4OnM22YrXhYw710V/Id54p3csbmS2PyqeVy
         P/5s1gIJGdstrc23xK9EJhIyIv3TZkQNnM0+fm/wiKAkp8Uyc+dIiNHQQqQamSvUTv4i
         3TtdDgM5O7wMIy8BYTQBJho1rgZtIbDOyciB6I+G6Zm9LF1xpQqeXfLpFdd/kyVlU7Jb
         d64nzDVEBI7rfc5HsR3lNhLofQPYNlEmXHH1BOYMCfxvLV1ieauCPDYPaDi0IwE8r/9o
         SVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593746; x=1795198546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=;
        b=WtcBYLxZBg5B89pbneoLwTGOENN21dqnqWT7NCIBMMu4wKDPURX3Ldvcpm5q5g0Lus
         wyQEgqLxywefzI4wu41uftClbiM4eOHpzhpLZ1wPyiWA32gcRjDgfbF2KzfL8ObhfG1o
         nom4ROFSUUvgKPNix6RnW/zO3N5gtIG8R0GeE4OVBg+uVCmE5PFPiKnF1OlDjpJaVq7S
         oLoJbWm6OHcvsRf4r7tFGFO7077lkxHMaNW2rVfZI3eaJffq59bQc5QYlu49nmzKnnIy
         ZJCQICx7Rq9F++lor8FEgTfGj9BgaBTgwzRZWVDCifpEKBE5yEjSlOUshbxsN4bjX0Rp
         jvVg==
X-Forwarded-Encrypted: i=1; AL+hErHKoNbLPQ1YFVHtTBxc+fUq0wMQwsW4tecj+OfVz29Nl+xw5PhfvdxmkzezV5OgxUn+Rdh4DPzfGIpq1hQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UHJgCCWaFiWDSTX4UMlf5sr8dEddlPfZfxb8e/uhukmHQ+MKp
	cfPYIHJ/U4ldc+h9+FXhUy0sIMHdKhLUnn+zXmkbqzgbKPTw3FVgQdqkJ+1Pn786
X-Gm-Gg: AYBFou2IoePgRMKl96npfZ4V2REZY58tREzlkbKGQEuzS0yWxMButmrPHpdMDqr4sji
	nko0lr0KLOxfQYPh4GiXCquXoDWovhiEJybsWzUzBIcTJ7DZfyOIn/ncd26JAi6MhMdLd4XM+0e
	ZdvZC49YGaVFEqgtPRK9OTNunvgzgArEDVz2e12w/ikzBvf0MlUGL4vYkaXdRpocsgWaenOxijR
	ShcCP9zpBqYSl7zx2dhmDn0poD4s1Nnsh6F9NQ9mvxpOUf1TvtlUNU0u39lSyW3goBYIq/jPMDS
	/lxI7qDz2Xm9NXmmDQ8e/nd4wyNP3lyrHGs4LwS+c4jRXB5xrHmQ61tWLCusrDKLtzVMf6gSxvE
	b6kuXQrnUl1hdAQZbfUs8XRrOq7tv+gIXtKVXTazwr/s4sMFjmaa7sPpVR/LCgfm9xamSI6Tmla
	kEWZ2ACuVdKRgOkLgvK4KU7RKYifpq6cmuhFKZMzrZBVokPfUcUi9xTw/YO8i7TGgVxQX+iJ2PV
	FRid2XAv1OlQZwdQRKcNVLBD/JXC5It6LOC8ATf57tzDcMvXxmAYxAf6BrbfqprAdcXPQjFH0Ad
	25LHJBlqsfIBvplp+l696GxuHMP5vOTGdwwdCdemb4h2vM44H4I21pRN/urIF6S1k2ojCWE3Ae4
	ffo7GmVdjwNVgtvgbrV8tvlEodbCEtMdkRrF9e0ABylxM7Dh5l5s9z4OJD9iZaM+HqCf10nibZE
	hY+h9GDxFE/NHslxq9A6WuZLcZJQT4ELubGsZ1xAOJ/YhgGeFacylQ93lmhD6EqgkfQSHxFu4l
X-Received: by 2002:a05:6820:1c84:b0:715:2424:b6cf with SMTP id 006d021491bc7-71ab4f8495bmr2009629eaf.45.1794593746398;
        Fri, 13 Nov 2026 10:15:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:43 -0700
Subject: [PATCH v4 27/58] mtd: rawnand: technologic: retain open-handle
 state on removal
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-27-556b1d7c6221@gmail.com>
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

Transfer flash-node ownership to the retained-chip helper.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/technologic-nand-controller.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
index a4de53f954e5..98cf91136d0b 100644
--- a/drivers/mtd/nand/raw/technologic-nand-controller.c
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -139,11 +139,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
-	nand_controller_init(&data->controller);
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 	data->controller.ops = &ts72xx_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -175,10 +177,17 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto err_handle_put;
 
-	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	err = nand_set_lifetime(&data->chip, NULL);
 	if (err)
 		goto err_clean_nand;
+	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+		goto err_handle_put;
+	}
 
+	fwnode_handle_put(child);
 	return 0;
 
 err_clean_nand:
@@ -191,14 +200,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 static void ts72xx_nand_remove(struct platform_device *pdev)
 {
 	struct ts72xx_nand_data *data = platform_get_drvdata(pdev);
-	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	struct nand_chip *chip = &data->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
-	fwnode_handle_put(fwnode);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id ts72xx_id_table[] = {

-- 
2.53.0

