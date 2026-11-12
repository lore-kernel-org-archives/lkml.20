Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446944;
	b=B/ihSBLtmeKgkG7sexHG0kklaaEApfjKvJ4jI9POrEU5TCWnM8wWHG1Rb6O2VVmoJnJv
	 dUJdJxZEg7f3gfXC8eNxp8LrLKkteABNepnxKcwW5XjgKiMS2ylGP7slgG9DLOG1pYvch
	 7eXFpzqCrKXauXuFSAOK4QKWq1/i221A4muiju1R8GdWJgxG5A2/ALzonxU+AN4K8xRyM
	 yPphIthGirfFaVryCQa0ilOTY5+QwZSQqkys910TAoUNAt2kb6Ab5bYDfuNB1M3Bsxomi
	 u3kKOp2zINxupzo45GiwVqg7jVrzoVL1lCZRzvbXiKTGRmL9ksp9HTskvM/f9z6P+oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=;
	b=T5e2RX7zhifEh6JK2J1kUqMnMHbVvx43FgK7iZ9p5gVY6+TRnN+kb1p0rWIlMLTt1bWc
	 S+QsnPDNC52f9wvcbVVgRh8m+M1hKEGSEYn2YtayAqdkqxzmkri8pDd2kg7orNp0y9CBO
	 ecpRAUJqkT435ElLL+zvtRO6zr5DpEYw8Qt5LSN6FSWOgJgAJTlarJoq5ZgbtelmOp2kj
	 5x0B+HIVDhzBQDeo8oAfH9sk8P82sVT9Lry4mhsHd21Ljybgwgvy9dp5NfyGjZvVgeJnx
	 Be0bEmIAUUB+S6VKnsLFOHp7F7jOJunMMJxX6AgCugCPkbW5MygIlnPoMCJ+TlEtfrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zND9JIDZ;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D19606D149
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D19606D149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zND9JIDZ
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-5058b105df7so1342676b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446943; x=1795051743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=;
        b=zND9JIDZ3BIlPlJUsPRCWESOqI1R6/xYxpU2g3ohBEJPC+yNJKNGXIe1XErieXWkUP
         e7h3wpwPQPnI/1KS9l6hsLXubaZ15qD+EnoQOZF2xUjft11iSSOqQsk7it92O8wYd1St
         oJ7bi2GqF0BQQ4RHjw6WV+uxPT2muG5b5SntFDkY+HhKYZX8OL9PS0T65RgMg4oeF0Ci
         FmQ/GtzQOrzZVQGEHveyonxy05pui3elaz6AsFSdCeHEhx/IlCBI4vkwtkp68hTlhAJj
         /enQu8gqqbfDJ2BCbeaaXhrEy35JR1xPvyzJ0elLyojE3GSq1sw+kHK0/wvrrgsSNgeb
         ilHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446943; x=1795051743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=;
        b=0P/6SK6hQZ9qGx78L8awDQ1+9Moi6PnbwCl1K7KTolj6jnr9hOV7+vKandWvDcFYQm
         a8/2qQl8DGXwaI2IdZNIvS4MUFMg9DY6dhvrVaQ5s4QYLq8pu1nyfDfrgKD0UCnHe5DK
         vRmihKVpvRnyMtXtl8gLpIakvHXkEuGs10vsYtCO1S0DxRdzOZ/AA19gOtc12m1H+usV
         i+kppSKMoblORoBqRk5hTTaKs4Bc0Z4tSF25urlGwhi5EL+EoDo9yuD6AwE8AeK/PUD+
         dgGDc7fFC1zXRPPNTFFxBMV90uRGsdDGUxzMTHL2k77w9Tn3P+PtTGVEhNcvG1IkwViF
         NluQ==
X-Forwarded-Encrypted: i=1; AL+hErHCAShMvv2QeFFtB9QEliscHMdGCUhq3Qi0NZJ0mawDOatNpl1Mo9r01hBETKJdOrSLLeInGvLh3+TqgVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qBmMNqq3KrzDT0aoUIpI0WS9DsHKaHIxzwlmypkXNbxfKwE5a
	nztI8dO8O031uFBJA0g5ZPeSQrqUvvg+TtZcBxBRPJHtWhP4PkV1oC9y
X-Gm-Gg: AYBFou1/3GkVsiQieu/jo60DDJ0DzVwg13oiQHymqF9TsClzENx9blvNpoRohcwiufp
	j8VlW1GQ/VKXK1lZzOOPQByjj+lZGUoidIhyEdbvfJ4zQMZFNZqQWvYiNd31DKy0tZBCNphqrY5
	hfSNSC23J9nEs6YRjhwlkPFAhKjcXZDXoo3bnHKcPKIUwn37vZoiI0mu1EbEt86R/Lnx429t2r4
	cpnf65zTvkMnlR5mW790xJ5suE7I5ZwnfnEM8Cazq3CZbSdbD9kWTMAoarBMudXOFmzX0eXuwzk
	Yj6YOzskbd3wUf89dR8Roo8faFYkGwOIi3DTFWRZsOAwAOuOHhtU+/GmyC/5CfgEUM0BhQAdLD0
	MH41qKG/KafpQVJTCWzotQnxDB0mhhj/1vdP3nq0RLCBwu548HDXfv2WXXmjJzSQVglYyAHOITV
	5YNL91SuyvJ7rqqGUvLYDSJFs8Aoq0R0Udv5W/eXIGPcDJP4A7OiErYLidMlrbY8WnXH3HPokaf
	6NyXGV3d1W3rUWTL9LvNp940Lc/ANHp6sZxw2gj7j6e4tMQ1AJU2ht9mIFvoy7gjXzTDFuFm+ke
	yjevKmhaLmgrK+ilAxHqk5s2iqSOPml7Te0/vZTKOIQUVnUC9tlfrQrMB0nuDAnwDjUCpySKTJ4
	r6F+cJLBVAAFEoUUSrcCDtpGCpJ1yLkXJ0V9zD5XdUERjtbCEj8mDKyS0a6Sx8k3C099g0P7twx
	mPWWJ9i3aybKtm2r8XfBT75eEvE0YGd5H1m0v61q79FoHK85o+EUnH
X-Received: by 2002:a05:6808:178f:b0:54c:7ce7:33ba with SMTP id 5614622812f47-56b967af722mr3635515b6e.28.1794446938800;
        Wed, 11 Nov 2026 17:28:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:06 -0700
Subject: [PATCH v3 27/58] mtd: rawnand: technologic: retain open-handle
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-27-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

