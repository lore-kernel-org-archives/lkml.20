Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810595;
	b=QXFX3XiNQTdKmYLLxVttOhvw8XtccJqueLWF/59fQgvv+lgtj4Zg9T6Th88i2g3+Rm9H
	 kNJm0X5xiQkr/acDbUuo9bmV3W9TIDtKUQCLGIJyknR0dzOswgXefJz0boo9IpeXTR+Dy
	 3ZNiUtmNLkU15EqkjZ0lx8lMDyJWrF6oR0Gsa7XfpO4JyOg7Rluyj9AcZnLsDh93hNwD1
	 Vf84oZXmXZkN1CWtF1xaVWh4TsCgcEZos3cTNnH+z8wOc2/xZrElGOJQyJVNSm8IW8EBJ
	 QJEiQD0lb1nS6xI/ELp2Ois+voM1m+I0jR6rmv2iuXgyCrPJjdY1j7piQvb/sc+uETw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
	b=P7QpaIa9eEgDqquRjyHV50JCDniEDe4cbfm07b0puUCzQJTATtrw8xLvEkJdxckznx7O
	 YQ800pvWsB/BlYGI00R6GvQ8HjwaSO3DpZXoFx5OwdmiQfWGRrE5J/NJ6B6CwNThF/TIb
	 MBhLisOLlM5pVDTZuQsLg9hmr0DzguyIv/rf9fhDgZ1vdv6Mlzeb4vVDGusGySJOE3kvs
	 nwj2tNuAi2JdJ8/Eiu8Qp8KXxSmk6DNTsc3MOSRFNHQrOcU0C0HUFU4BibW43lWhBBgZk
	 wzd5+Oc7NiKl5Dr1Ze100FKKa8nJTNYhALTiJrJZlRn/N2ETjxZRmJv/TRZTPexOmaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBhKuZLI;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF85606A8A3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF85606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBhKuZLI
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6ddef424972so3559858eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810594; x=1795415394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=XBhKuZLI9U9AbRDIfP84rYRLa9pwWGz4UGITc5jWygQt4+1e12UA6GeQxLLFKlVprt
         BqXYRo6ofeXMrHV6GIU+FqqAZ4QeDzk4x5DkrXNknfAjelRVk8sAPJUWgB+5pjrkt9bF
         UMRn8uqM9bW0d3hG3Q+y++MS60PqsRpHREQkF8KUUECFeNIbE9kbSX5zatspk/d4xaST
         vFmlb90rJMzNpupeIu2T5VD/QRuGtof4/q78a1OQSTV34JvMgSk6V/qfhLthCf+hOf8h
         XxZQXFWYtulwZeY3mhRhbeU0cthgtpjGN1IS1MT4zRLcAm9qKYxIYRmNP38uZb4nCD1V
         YBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810594; x=1795415394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=YaV4oxs19fHaFH2NftvYmFnKA6m4ood4XxYmd0xShv1Q9hK+BeXvkaMN724MXCvWn7
         66FLaL4VvP9owVkLEfgbahzzqs61xlja/fhbTXowl/um/9CZ1UnOtTXS1jrhq9P7oQII
         Nj5Yrp7ogQo3t1hAOaw8ry7Rm9WSAjSQB1O+luCTtLYZnMcs+xHpHXJG6G3WMZCXvDzu
         mW7pMn/QSbvz8BolVINzZOcGSu0dNLvr7OR9TFIjoHLKobZRIkLYllKpvFwvtwU725Py
         D/+SentyjsRNJAg2a+1G4t40QBps9Z0aO0LAC04QAxf92pF4FEKbkfwxyWpf9QyqH2rn
         klrQ==
X-Forwarded-Encrypted: i=1; AL+hErFirRzB8QuUP4h7F3HD2EoF6xo09KyYk8YzwEtAUd1zEHwonK7I1eg7TCuxcSz+HdQOAkUUjm5B9VGGx4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hnEXzcawd/W99QTplai6ckUMNfYYfutaYh18CeF1QJV939jXZ
	6U1nNB+1pUyS9nm5zHcdNKHr61iYD/dlU96TEIvjrtl2KwKluHj7m+eO
X-Gm-Gg: AYBFou30E/YC7H9SjZdTbos4MLK4iZWnZA1IM7wO3l00gR7VaYmf7Ob1c7WQv8EfXHk
	UlMfnishpzWl4ItGypPhxLvSIjQ1EzvsSmORGyC/wXhc9g+cR7cV58IOqcWNosP3e6VEXoWonBB
	agTE1BvKsLrNTIKOXjiHnBTl5xcS293U9Wht0VKyFBSt7fNLPkcgDWzEcggCWjhZEKVLcYbRb54
	ebVRKZzCegEnSL4zb/EMTYBrNhbR1kcvTmWZKtI06pAMMOcXugljby7WWLdmRMaGyCF9ZkuSRTx
	C32RHveWLs/p9LbyuWQJ4TWPBnDcrfEHU2pVZ+6c9D8Rw9sqIxBaqLS32e9ng2X6VZyuHBxja3g
	lrnFa56V/nZdVQRcqvpsTBjMP1T4wbHhAvCOJUfb56q/RIe3sd0TzOFZBUqyPwwLxOToJ545iau
	j/G7t2szb8gtScS5BpR7SMMGYwBe3rZX15VbfjWC9RUmCFihYQwV5k3mFXRT9EH5BrLoPPYFAgR
	FshQOFMp4l0yd/ptU3nyjQ5aGXt47gJwsc1NelnGjO70N7X9iaAyBvgvH50oZ26K9KzqIlPAEoI
	JcWN3v/lUZyj8WOpBI8oxT25heE5qreYEWiXxsCGpvOol4Jdgej0aOhIB/22VhIQHOfz7MmIYEP
	ATwXSvffPpnjuMpRqoFphKj1rjj0MpycyfQXq0QR9lY46eedgAPHBjy7zXhDh+TvcpIl4Hl/LMm
	oOe7azMymRDBgzIyRqrlB+d//o3TLh8AB2//Npd0eOmVHUo9unSMaI
X-Received: by 2002:a05:6820:2205:b0:70a:12a9:c43d with SMTP id 006d021491bc7-71ab4f8ca14mr5786666eaf.22.1794810593653;
        Sun, 15 Nov 2026 22:29:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:22 -0700
Subject: [PATCH v5 07/58] mtd: rawnand: sunxi: retain chip state until the
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-7-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev

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

