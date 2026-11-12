Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446963;
	b=Y5SDSYQNOi9FbD0wkupezeZZhPcDi0Tb9K3JxP3+mOMSwZkXciwlVc1CAR4Vn+cfio1Y
	 z21w/8BKzn/oLR+Y7I+xLg8bn6s/TLYnkTtnlIozQb2j6A+FaEnm3sVP62HwBDeSd6Dfb
	 ucrjPxLKbkdJoyMAXXdpB9nHi+hRn+B8qYy7qvavAYtcVL8NRNTnHL4xU3oNIFCKsbsNk
	 7cPzHs9CQe/cKylVbQjKaou1+8SCeN9wkHf9XifyO7itpKcC+r0iNgLZJD/zKTNFigyP1
	 ZENtHGG9xIdOF/u3SGsZH74uyCgfYROpHHS+pFDPxsED00f5+Am9zepXx51mCSlBi3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
	b=izx+ezQOlUn2sDYT3f8+YtMsiBX2GUn4AJSuqJgVIV90Nh34zOa50UAMjAd5YEvfi4fX
	 Ep7dMzgdrsXnfaeQgW70E/arg3+BWwEf6BBU7NbIWbEvgBP6OrUbd0QfbV8dC833F18xN
	 Ip2RSrmKN98lmTNjmIsfJLjj/hFZlGqGQwSNUacuocHrMePAFCWKXKR9H2JpGR76XDGNG
	 q8ATNqBbqmyRTCjuUeN//cb3Y7XeX5jx/c79V4qP2ujs2CkkRhnorQ1qX9EEAsxkNg1yP
	 zOtZTx7VrLdOShh26arzYmvdTQqaq9Jm7Jm9C5GQOTFE54J42uS6sWmme/ZD138H3Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M7Xt3slz;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A796071ADD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A796071ADD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M7Xt3slz
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4f14642adb4so2036944b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446962; x=1795051762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=M7Xt3slz2LjHkQkp/rJRP8Ha6flhqtR/BgTys5s6htfsT0RbyZpvO7IEhGlutxSIrq
         FtCV8XR5U1z6owheQoyatuMXU4QGuhVdzqEpzwG14iixbG8mNvcOb8TOp9fLMUXbAzxn
         mmTZ1TbC1JKwNtahcdVIv/SwM48J113vXE6xGHtIr7svmGx/VGEnc9E9HSFAWJPNOcwR
         ngtCdIVQOuafByir1eIjPWzL5iMV73Rx+sISdn53oByptY/NjYn4ZMDxXi2j5DCYWf/6
         icoFqf1jAJ+cTk20k+x/HBWhTCOOLCBS9UvbDvqaKANJ/+xJGkdpaolGuLTpXn2/Ivjh
         CFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446962; x=1795051762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=LuqzAiQSqzCF0vuU+dO5qM1m41CLv/j8znVZc75JqgU9SIILDFx2CNiLHueyzz6QI9
         cQjyJJ5dJyRTT0XLh62ILgIEpr55gam/OO5uYv7GYDrwD/2JXbNyAaotgw1rxRcY2mDW
         Eu829qPxbcHbWBxh7M7Xj/lXqJswbzWa9BNo3cQ1roHVxuyuOBpaIoKnPZE75wFlJpqe
         4SBm0fDtFtR/BvQDpl2xqmrMVd+xm0Gf9LwF0YjYWvXtyKLhbAnkdjCYA6V0t05gmiBP
         yHIH8zNMxhn6fMV+b8gUsPAPnZEQF7vDOyPFzwTaNDBntxwJTJQ4ZKcIoZBrOqu9PnO9
         JCLQ==
X-Forwarded-Encrypted: i=1; AL+hErFhbELU7GoPTabZOVPDWHZOGyDvgDqVrl7YduG+B/PceSwwNp/h+Ei/U8sUXJ2aE0jLEaYK3ZgpCxWUyJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GUtoqzfGuL/Bkmt4YbLGUk9HS/M8xGrvGU0M5M5RZGRvgTI/2
	v6yRCdTw/egasTjKvz79qtQOfdUDr+rq8twKH3AJo7v8ZUl8LpDCUTVb
X-Gm-Gg: AYBFou1pfSlcOy/Z5pWfGYaCSp1sPbr1vmoOSk0ZE6TBkdTS8R8fJh5FJzrWopkhFv1
	XqYs7utybnYPSXYcMdO7v93AXoh9YoMnZAQRl9gjq3QLTPlqqTm15bTVG+z0IiYbcb95eoHhmRL
	sQkH8pQ6zcvfGpMcb1a9P+u6x77XpLtLeNRw8ihnbNvy6npE+h1CTOaaPo3LQLb6hreV8iBZOQu
	79B94THeXQAZjD7Z9gfUZKm5XqQteM0bB0keiToc8NxMIBhuQqxKb5IZ28K4C1hbKtO+CAEIAsV
	FhrdHD6RRF5O1OvqIU+abNIYqGTkW3gLcON/VxqQJ+NaecCExy6DQffi/lwIuCjGTHy6hfsqsj0
	Vsf87b/EgM0VR3YuW6kmfc7pdfB9X0dusrIOGfWsqpiL/I9AnbPOLLQxbo9N0WfE4ac52zQVgyT
	5Nhn9MkE0vFIDq4up4ayXJSdb+ONBHL8YWAql0XYjWztDXhTbMhPv6OJKpCAV+7CzdhXEueRHkg
	oVgUYtMog6ErOmAzejUjJmN2Mt8giC/I1j6qi4/3RrfOUmvsl6hy+p41XbMzFu8gwbybo8NoSyY
	R9xLJ2MMe6ho0pyoq5ZAQbo8OnO/u4gtjzPLagcBI1h2f7WBYH9ZRX/WCFHxWrzsItP7cV2bgTf
	K5I2yPBh6pcRoJzqecSu6Ri7mlfVhSMnD2BFOzWaxn3W3IAnH2t1tDX4FX+NZVjinHaIeKorspr
	CQ068WOS/ZgCZN+7/p9TJxL34l8ZzRZ3N9N0QgJQe9KieOb+HuGsBQ
X-Received: by 2002:a05:6808:11c7:b0:4cb:818f:d571 with SMTP id 5614622812f47-56b95880764mr4083159b6e.25.1794446962300;
        Wed, 11 Nov 2026 17:29:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:28 -0700
Subject: [PATCH v3 49/58] mtd: rawnand: txx9ndfmc: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-49-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Retain each chip and its shared controller while MTD references remain.
Unregister and disconnect before dropping driver ownership, and check
MTD registration failure without publishing partially initialized chip
slots.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 6fd6e530c38b..bd0cc30ab820 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -276,17 +276,28 @@ static const struct nand_controller_ops txx9ndfmc_controller_ops = {
 	.attach_chip = txx9ndfmc_attach_chip,
 };
 
+static void txx9ndfmc_chip_release(struct nand_chip *chip)
+{
+	struct txx9ndfmc_priv *priv = nand_get_controller_data(chip);
+
+	kfree(priv->mtdname);
+	kfree(priv);
+}
+
 static int txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	int hold, spw;
-	int i;
+	int i, ret;
 	struct txx9ndfmc_drvdata *drvdata;
 	unsigned long gbusclk = plat->gbus_clock;
 
-	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
+	drvdata = kzalloc_obj(*drvdata);
 	if (!drvdata)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &drvdata->controller, drvdata);
+	if (ret)
+		return ret;
 	drvdata->base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -306,7 +317,6 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
-	nand_controller_init(&drvdata->controller);
 	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
@@ -361,7 +371,20 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_register(mtd, NULL, 0);
+		ret = nand_set_lifetime(chip, txx9_priv);
+		if (ret) {
+			nand_cleanup(chip);
+			txx9ndfmc_chip_release(chip);
+			continue;
+		}
+		kfree(txx9_priv->mtdname);
+		txx9_priv->mtdname = NULL;
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret) {
+			nand_disconnect(chip);
+			mtd_put_master(mtd);
+			continue;
+		}
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -376,18 +399,16 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
 		struct mtd_info *mtd = drvdata->mtds[i];
 		struct nand_chip *chip;
-		struct txx9ndfmc_priv *txx9_priv;
 
 		if (!mtd)
 			continue;
 		chip = mtd_to_nand(mtd);
-		txx9_priv = nand_get_controller_data(chip);
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
-		kfree(txx9_priv->mtdname);
-		kfree(txx9_priv);
+		nand_disconnect(chip);
+		drvdata->mtds[i] = NULL;
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

