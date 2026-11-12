Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446921;
	b=IFI0MP6uFdqoYng/dqyB0x7byXCUoATwj4Yy6QCEsOpd8JJKU8N4OTZSwww45DfO6LGY
	 bVGcRu20suuLjZkCQjBU+ZTGbxjRDUNIlO44Q+IhbTZsrlqOpyINDNVf/xD/LJW9/ISrB
	 yluav9FBaQks8k8ldA51JFrqcUt0GRrvFZgO9oROiOB2sC+Eb2+v4wzTrJsPPzaYnc5qL
	 6Npvd7AfZAYgXFokgQ6/s+3Q7XticbE/PWfcs1zYiIuwLWDk7YjOJ4y5qhbic1oqjx27b
	 xg60sbrsvMaGDw40CEnIH1p0NDKOng0AvPmTDR/6zkDQ3r7FpDcx1OeX1e7i5laizbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
	b=aFSLgIGgmjMUNdie+hL3NLQtZKqgYDEbiFjZkyl4BR82eiZlxk/wY+colsK+4vIrK5Qa
	 fk+//llbh2vzyshjoUCOIvIT7AlkVS7u8KAg9rC3AdQyFbpczrsoEB2La1xxvVNxWFkNW
	 8CluNI1Ln7PckePS78ClzxziSdeYvtjyT39UsOHaYvzhZtm2yhpkwVchgMJHaFOlF4WLZ
	 a9eLFr/pyq7DCtucVRUwT6YAyhUSNizv94zj38Bx6o+icchvBiTWDAccQi7CiIoPNj/jd
	 ZMKaC9omVbmk2EiWcP5cLNaT0I8qECtGMDN1EUJnRkHco3z5MHqc8sbW7AefsnB+Hmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnZTmlcS;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591960A2629
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3591960A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnZTmlcS
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-85f39332862so1540355a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446920; x=1795051720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=PnZTmlcSO00Cp1/vF5vqwPJAMTDItX1X2VPAG6biU6cg9WXNLaGmHLUhRjpnKtn32U
         q7HgcOtJq4EqweaxPNOWVxr8O6LSqSZOkCJgTWlsH6Z3qGeNDZfAFmqqkMcPnhWbfAl/
         BFVM/zGNGMGt6k53r9pVKiJsBMPdE3qukw7Mi4TWWM6SQXpEx0lRRecN0mkP6aaConBa
         9RZMbjHRx7EYIfNGSDxPyaZTaXu93BXXZ7dHWW9ylPcLjrnf08Rp9IyWswS2G+E1dyMG
         F6UxkwP3g33bX4+V+wyWH8IiivBsgwPw7S9poo7m+ALKCWBGgd+HYAFdSHYt8Wn9RdDr
         Pcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446920; x=1795051720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=wEvU/l7l6tqHswe2+bzKN4A4tzsLDqBgIV8oq+/FuZ0957BFOVqvL6tmHWdVgKhDsz
         Sn1gnhFxTujcJJuuAbfV5p9+yLYIzPNfF0Uz/BgQyOjYlB95zlOWzKVmwOP+Ttbs2dxM
         Gl6oJ/mK4gFfvXneZpGa9HwjhmqIj3UCNXUW7r+dmYZU4KM/qFE5ppGYVHifDAEs56HI
         OCOPrAvvkWRKD/e/5AYNBYUaqAhPOi7Q/q++qMx9u0hF4sspuPZluwb95KL79Q0/xt4f
         kJ8ftVIR05qlt3xJ/1QL2CLL3ggjeG2oy9pvibbsyShDLAhwT0fEcgWsR+Rw0Uudd7jU
         v8gQ==
X-Forwarded-Encrypted: i=1; AL+hErF8RVPaI3pkcQ4Cvv8dF1lgML9za9KqnXgB79mFMR8yE+9BWD4OyKpWSOtThkEXVxcDWlU8kbBJwy7WYuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SOuZyKuOKqfBITm06kie81FrfRaAxGaiBydtzUdjLZ3k2pfnG
	XaluMuYHXWpkgUcYr9yjZbg7RegHOZWmgFhCVXh+8MJu0k8Fqt2GM2sL
X-Gm-Gg: AYBFou1ziZabjrLzfGvCvmdd9vB864iNlKMsDB4xCkagM8dlQoyxGeU5qugJ6IgxBRL
	uUZOblWkBXmZEmrP5zCh7tec9pH6jRLC/ga/SDo2koAK93JrcdKBZbLVEWCLWBVNsHwTpQt/e0I
	5aZP1JoGgu9jiI41s2ljt0OA4avRz1uL9j9k/gSeoQbF8PX7zbCt9tsi/jRxxZvxOIq/gRykeC4
	kZFNcOlbgKeY4wqTwzsUCimk9FWjw+7akyBNkbpMxiblH3A2DLVuwPZHv59ESyZSMx/N9Y4cfcD
	cZOZxtOHTcjc0NIiE/SyGTMvHx1UA86hehX9BVZxKG3E5FhLmvXOxD0WNkFQymAW1z4yeIqZvxO
	N2R8wVhRHh+8IWxseTx4FXLOaU0NXUEWoWV9T9N2DEsMwdD+DL5PcmkN3GvDzrp/04LGwuAwn9g
	409tAky3xJ8jJ03Ybng8AD0Fr24NDrGVfSppir6OBoEHou/qh4qTrEkrd4iKZbK5/FGp5hjbYcK
	iMDlfjtRIOQ1g6lcoMTZ//Pj3u5BmAe0RexCHfhHXRV4TrfvAv21HkNEDs3lnwJK660fdFI1laU
	blByUWskgg53nvCezdxLjdXVT6qgujCskNliF3T2zbxdk6f1fTbf0J98C3kKmofzzRpefgxXjRh
	uPeQnLs4rxE8BBzmsSvgannuN/ViJw3nUUBN5z5Fkmkxq+O9dZMgRTIKMoq2oNyZavQuELDBmSm
	V8IuWOllcn+/LZTP+PHlEjz6WX4pj7caOyXi9L9auvyfXDUhw47GmX
X-Received: by 2002:a05:6808:6d8c:b0:567:dc9f:c83f with SMTP id 5614622812f47-56b96192788mr3947266b6e.14.1794446915574;
        Wed, 11 Nov 2026 17:28:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:46 -0700
Subject: [PATCH v3 07/58] mtd: rawnand: sunxi: retain chip state until the
 final MTD put
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-7-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
X-Mailer: b4 0.15.2

sunxi_nand_chips_cleanup() unregisters each MTD device and immediately
calls nand_cleanup(). Devres subsequently frees the chip and controller.
An open MTD handle can outlive this sequence: another operation or even
closing a writable handle reaches freed metadata and lock storage.

Unregister each MTD device while removal notifiers can still finish I/O,
then disconnect the chip and release the driver's initial MTD lifetime
reference. Run nand_cleanup() during disconnection, freeing the
per-sector working data while the driver is bound. Retain copied names,
OOB regions, flash-node references and chip storage until the final put.

Give the controller a reference for each retained chip and one owned by
devres. Register that devres action first so the IRQ and hardware
resources are released before the initial controller reference. The
shared lock and parent device remain valid until the last chip is
destroyed, while the disconnect gate prevents access to released
hardware resources.

Unwind heap allocations on probe failures, including attach failures for
which nand_scan() does not invoke the detach callback.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 44 ++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4fcb7977de02..d175dc685681 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -27,6 +27,7 @@
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mutex.h>
 #include <linux/reset.h>
 
 #define NFC_REG_CTL		0x0000
@@ -2027,9 +2028,8 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 static void sunxi_nand_detach_chip(struct nand_chip *nand)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	devm_kfree(nfc->dev, sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand->user_data_bytes);
 	sunxi_nand->user_data_bytes = NULL;
 }
 
@@ -2045,8 +2045,7 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (nsectors <= 0)
 		return -EINVAL;
 
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
-						   GFP_KERNEL);
+	sunxi_nand->user_data_bytes = kzalloc(nsectors, GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
@@ -2440,8 +2439,9 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		chip = &sunxi_nand->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&sunxi_nand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2465,8 +2465,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return -EINVAL;
 	}
 
-	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
-				  GFP_KERNEL);
+	sunxi_nand = kzalloc(struct_size(sunxi_nand, sels, nsels), GFP_KERNEL);
 	if (!sunxi_nand)
 		return -ENOMEM;
 
@@ -2477,19 +2476,21 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		if (ret) {
 			dev_err(dev, "could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto err_free_chip;
 		}
 
 		if (tmp > NFC_MAX_CS) {
 			dev_err(dev,
 				"invalid reg value: %u (max CS = 7)\n",
 				tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		sunxi_nand->sels[i].cs = tmp;
@@ -2518,18 +2519,31 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto err_free_chip;
+
+	ret = nand_set_lifetime(nand, sunxi_nand);
+	if (ret)
+		goto err_cleanup_nand;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
+
+err_cleanup_nand:
+	nand_cleanup(nand);
+err_free_chip:
+	/* nand_scan() does not detach a chip whose attach callback failed. */
+	kfree(sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand);
+	return ret;
 }
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
@@ -2610,12 +2624,14 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);

-- 
2.53.0

