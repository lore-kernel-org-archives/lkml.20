Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296669;
	b=SjY5ahOnGkjBvTybkO6z0N1nqTn94yQoS7w77cLIpcS3yFfUwvplG0gnAFEpAqR2KRkR
	 oQugftRUmGW2ytphOJyWdahlRex72+3G/xAnouMt7O3NgP+qreWAGk8o0beg+GC3hN87Q
	 k2fFLAmVCPUQROhGCZVS/Ebsv6MHrku0VQR5dTvT18Tajrl9mVJ16EyYJ8mJvA2kKARLh
	 slpsgP2Ldlzi3DOWcEBvo86+9yHT2hv9CHjIiCz5///zY26KOOfeNhI4gs7OjHdX9Wx/4
	 7OxzbfMmsOBUrBJjUF1wQFqZpXBhQid0pB3jJPoNxNUCjNX0r7cnALAwjn/ALREFR4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wH1D8xUS0Wsmy5FCcW7l9mY0KtwIx90p9dMzy4JwA30=;
	b=xPoKXLMG4h03RJ0j46GY30o0L2wJlLe2CDXR4pR/XjtyXmE2/4zdR4R6X/h1Go0OzkH1
	 j88pLNzqNrFHTRHcyImZP3/KqQkZPVvu34E8QeAw71N0vyGezmadsqn73NuHgUU2u2IIW
	 DZUjsnPtfUZ5nlbQABDotFEpEjWfvinroLSqisyqDS/5RvPjpdbuWpFLxxnclLbE8P3mQ
	 m54Yqwv5oabUtnTIkgbpMYFgJOlx8CH2gRmb/U7+QSUxyyKZteiMR3nSXYXT4dpngKe3Z
	 7GHIc5ZsaqOzIZUpdcLc+uOpPKgzrhjr1+wholezju6BkJu00fvaOdWuEWGSgen9tbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MtCvU9Iz;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F796606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F796606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MtCvU9Iz
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53dda625f63so1140632b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296668; x=1794901468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH1D8xUS0Wsmy5FCcW7l9mY0KtwIx90p9dMzy4JwA30=;
        b=MtCvU9IzPuaLLs9mSKyPwOruZahwCFSaofGu5vqXKRVx4Immaja/yzems0lc9Cxnel
         rs1sRyoPisznFsRRTTQt7PSwkNOopZshc2Fypd0xNYEVFGMkeHAeemLUVQAzunhNtgOs
         fqHxydi14SarJkjMuxNTjKNkdJVgrBofNZzJlAJP5ZVa/vWZ6Px3RDHkqDIUn0qGd6VQ
         rQy/4/OWqAISq4NBHtMEq9tsO55dvac++4EklbA9UoMstRAdhJvJD3XHmIZ9cCoUPQhM
         ByvZ2+JvNEjE2MV5l02X9O0RN/spIWGGydQXi6bAwHIZfsz1F/moKFbLAWh9EV1/lIQc
         ZMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296668; x=1794901468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH1D8xUS0Wsmy5FCcW7l9mY0KtwIx90p9dMzy4JwA30=;
        b=teWBNLlNdHiKPY2Dpo3AwNv4Rea+hEVakzNlnR8sINEOmTSxw0hrdkc1Vr/YuV8WJk
         Cw3ymjAKu73xjHhUVoFPwjQGTTQTyE+RKtWMDGI4mkigqkudD1VYrfT/43QRm394SQW9
         IpOUKuF+5TQePgaG/w5/pNe4ITJ8ZozxBDtby4SuRISmqcXx5QXK1IVQqwsw4IFtwxOO
         XI+Za9pEksBBc/ZKHri/cWZ/NCEeKmReOW9hcodm546B3YJdatDtF3Dpk34mhetTTfJV
         hNBPdEio/f5RyBYeFGv9ymem5H6mXEifkyeQcvS8mnyaffAkEwrJ+L8wiad9R/zSLtNq
         SQZg==
X-Forwarded-Encrypted: i=1; AL+hErHw7zWReNECIgKJXRDs7nq9hVICXmyl4AaiyxdG4JpyD5SUI/PblEL7VPPCUWQp3jSfmCA1fqkgEQPr5SM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qvWYBtNhdMUDjYXhZucqbyI8v7Dz6qalC6yswG0FfiruWKAFQ
	/4PMKH+Xw6NMeVw/0k5uadyP5z5V91Hp0WpzXVgE17m7+J8WiKxhmVD+8A4VuN/e
X-Gm-Gg: AYBFou0xaC2axH/YwYlMxSg4jlRsa9JdjCmDU69LWbj9qG5SxANOTIDzo1K+9TLXRH/
	7k/PzPFq9P1y4H/ReGXhJuQyf18NzZbAwbsmZNK78c6N5K+MWj/N6ke3XIqeq2/UBGmvjIve9Eq
	MOJ098HCHMB9ISnEWbfnOzU3bkgLN0cKMVnjbNZvIafVzMjA5CdEC2YCvnlZ1yhhpgH0SBToBA6
	nY6PiOtKxnR7Jukj0srTZZDv/VqFo7BQhnF4c1bebkPSgdiy/Tib34J/WOiJW1wmbc4iWvhGZAi
	b9trzolHGf9SUH3A9Kfl0N1uyurgLVbgflIYETqu/Q3hbR9U6y5zyRf9fnKY5vOXA9N6FJ2QKFX
	vRrvCuT87ERadhgGb1g61sUmc5IPiMWF+6dJhWsDhpvhKSNe/SDO4aPRYMxXmp4nAfNOyR3OAnY
	PJieWMPMz93gv9oq+NtN3nyDGBRw4cv3jAWUZbQI3Fm41B6Ci1unK+9l0eHw640D4AZBCILAHNZ
	gQDJ9rPQcJsbNjLaJbVJOlkn/dH3icbLP9kpMEgOzqKpn/18EvByCeuia7fmDJexGXAo9KJJBsg
	iFXT8ej28NASaCnGc9eAcei4PHGzjBuV51GEKC+nUTEA7jGDWpa+zrhO1GzjWM9yO0KWEJXnUn+
	6rQpHX3iHcE48HbKGmlN75giqNNIEwXlatD2LVRu/b0/SEyt4Z9+SlQm2fZPMpOfEjlXMARHivO
	hIE+icYCLQ1wrQvfFJ5gnrMyojZg6Orie70R3z9ZxJWUGo1+5gjVxS
X-Received: by 2002:a05:6808:c1f5:b0:4f9:a153:8446 with SMTP id 5614622812f47-5683ccd9f03mr1360370b6e.38.1794296668122;
        Mon, 09 Nov 2026 23:44:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:10 -0700
Subject: [PATCH v2 07/58] mtd: rawnand: sunxi: retain chip state until the
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-7-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
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
reference. Defer nand_cleanup() and chip destruction until the final MTD
or device reference is released. Retain the chip name, flash node and
per-sector user-data lengths along with the NAND metadata.

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
 drivers/mtd/nand/raw/sunxi_nand.c | 59 +++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..57894ce45065 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -27,6 +27,7 @@
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mutex.h>
 #include <linux/reset.h>
 
 #define NFC_REG_CTL		0x0000
@@ -405,6 +406,13 @@ static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
 	return container_of(ctrl, struct sunxi_nfc, controller);
 }
 
+static void sunxi_nfc_release(struct nand_controller *controller)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(controller);
+
+	kfree(nfc);
+}
+
 static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 {
 	struct sunxi_nfc *nfc = dev_id;
@@ -2027,9 +2035,8 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 static void sunxi_nand_detach_chip(struct nand_chip *nand)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	devm_kfree(nfc->dev, sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand->user_data_bytes);
 	sunxi_nand->user_data_bytes = NULL;
 }
 
@@ -2045,8 +2052,7 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (nsectors <= 0)
 		return -EINVAL;
 
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
-						   GFP_KERNEL);
+	sunxi_nand->user_data_bytes = kzalloc(nsectors, GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
@@ -2427,6 +2433,13 @@ static const struct nand_controller_ops sunxi_nand_controller_ops = {
 	.exec_op = sunxi_nfc_exec_op,
 };
 
+static void sunxi_nand_release(struct nand_chip *chip)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(chip);
+
+	kfree(sunxi_nand);
+}
+
 static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 {
 	struct sunxi_nand_chip *sunxi_nand;
@@ -2440,8 +2453,9 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		chip = &sunxi_nand->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&sunxi_nand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2465,8 +2479,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return -EINVAL;
 	}
 
-	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
-				  GFP_KERNEL);
+	sunxi_nand = kzalloc(struct_size(sunxi_nand, sels, nsels), GFP_KERNEL);
 	if (!sunxi_nand)
 		return -ENOMEM;
 
@@ -2477,19 +2490,21 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
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
@@ -2518,18 +2533,32 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto err_free_chip;
+
+	ret = nand_set_release(nand, sunxi_nand_release);
+	if (ret)
+		goto err_cleanup_nand;
+	mtd->owner = THIS_MODULE;
 
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
@@ -2610,12 +2639,14 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, sunxi_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);

-- 
2.53.0

