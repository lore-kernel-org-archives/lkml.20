Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946631;
	b=jbfO1pv8ODNn1YE9VWmIBYatErAXYAgbraY1XsnndR/ZaYv/K7dkg13pY8857LWCOYJh
	 +gMSFbD5jo1yJJ9bE83Vut0wqzzyYmrS+p/5kEoMHViIKvx4GeQn4kV1X4kCmM4Q3Ks5f
	 gr4OP3mfXBmyfT9i2nlhEKN2UaObIJb7Uli8C5UIm2QXyfisVBFqJK1bSEKwKjfpVe3jT
	 5JrhzunKrxQZI5qieZuTxCALD7RfgodcjmpixX8PvMYz204Hy8G5kmH4bKPc52bEV4YTe
	 OBijC1QJwfHCTQThMh3X+6zK/b0LdzY9WiUVJem37Bc5hmrHPS/agVXsE4XdM/DC1BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2zCRGzfG+Ckfc0bCbMljQtIJ9n2GQ4v9sJtGrTP+bls=;
	b=sQg7rLiwqVyC4BAl/Abi+nMcrqOLdHoNTOBPAPiFCIQybiVih1/bF05T6au93zAExS+u
	 Wg1kC7NhJWpFAhwMJCZqDQYQYbJKQIINgsXifR6fuSmpA1Gy74x2NiGxV1/d33bH4zv2H
	 ROIO62ky6Fw6j2S8WbwxTmm53kIvVBEatcWC3GIFDHkma2R9cjLvcX6TGPHrcj2x0cHhz
	 1aElTT051kyT59h6Vd6gTIIqRnSIv4dAuXR9PdxAeQXcnVUH1jFrkhGM5/PJbSFRX9CQf
	 aQ2Y18IQmMRyVeDLnG+uze4HvFxUaSs+UbvewEuI+tJpszt2xiZOUIQRh7aAdSJy7/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTB3SqR2;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A72606D803
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A72606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTB3SqR2
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15dd124bbe7so746722c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946630; x=1794551430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zCRGzfG+Ckfc0bCbMljQtIJ9n2GQ4v9sJtGrTP+bls=;
        b=dTB3SqR23D5Y18ThNKRO5vlLJEd6T9f/x7exgebEjwcwUkFC0vYuwo14XWJ+Jdcbom
         4ULi0Y0MGdeVQlKRK6/SsO9fFwAM+0JprLzRgMvdpIENAGL+CjdbD1LbV6lSJwSUbFNn
         k4CpdTDb1oMrtWxdWFkv3MVjAulHbUf01Xm0QONiUXt6kVmdDmyjfW8SCcrVvd/ypE/H
         KOdSBsHxrbRO9LOq6ib12qOi4y9M9eGgtIyH1S1G6NfYVPUMJHj9/Hhn0cUxXXc5bXmy
         8kfhzJnkkv0qDozJjKUXzDABzZELI7ITKuHmVtKy5aBWdjH49ARKZ4TSZSHdeCflfseV
         LYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946630; x=1794551430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zCRGzfG+Ckfc0bCbMljQtIJ9n2GQ4v9sJtGrTP+bls=;
        b=ac5P+DjrlPu1nW/IZ4CtQroLNiUbSZ3yQme2CJ3BRKkTNGz7BYFF6xLSGgcUAeCLgO
         dAOjMjIJtMxQv8jb2ZZT7eyMsn9zS6g7btEeELroW/RjBRORxikmJC80cwwH8X5tlAhI
         5Qlv8QqdjQ9LWodz0Z9WQjBx7kXu3759tSljcZDifcN6gOJ/tgTB1lG2VgHloQY8ejHg
         ZOudE8t3qjKzC8Ix04M1gqhiC0vVszEk1SUoiBF/uHxR1aQmDSXi5HwGDy3BjhRxvOox
         yV0k3KuLcFowb0zJq9ZWINrS7VUj/Cwm/xc7FtrgI26mTGdVvGZqDVehUPrk6sbCn4aY
         k26Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8WCmDa9+duKVoVVFTtbtK+qB71hXLHm/229osv416QRmkNG2f3dT7GQgbSvCtnrIaSbQSnakpIC9jqLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J241UNaY+MdC02RBbpymDovcUs8nActyi/4hNUPAPxyZjHFHN
	apYTt0bjKoBZcqeUj6kFSt4aoPAOPLR9P41VsOGIfg2kQNntQS7QKJYz
X-Gm-Gg: AYBFou3lg/lmRZmtZYDT86pGF+GOv6vnVRCabjgQMCKqtFrkQMEB++K9QbvWffaoEwH
	4uqHLXg0ffD8l6CmrsUZscLnN4U1nLyx/1rcHlUW6RHWZIf0QjSZhkaByGc4Ay+hnbLaB8xNGnd
	gxW2APl8R3ej9aV/uaDc3u01VfW5v9SWW3wLdMH8V/56hRJKCSODAB+rn0kTCNUTA8gR7cf9Ir2
	+APWZHGMHsAKl8nH70ADUSfMpzagniiD0Pa3aRpno+sdCocRFWjWjI1svwudLJGVYp2OLi2Zbcl
	MS+Z6mP279OoV3hn5bgiYwRadE2k2I4xPN5g6hfrBskWGFNWy+TkeiiEF9ggfxYNdbsWBxv7NTb
	gGl6JEbzHuYjRBoxpcfU5VajEoKhDxq0B0X46be39dpE8SlXj7/C8e1pht6d1zGQro0Qzi6t0pE
	z9BolFVr3LsIoBEyfnEI2G4KeBCKMGhY/eRL+lZ+NskxiMUVk83fplhbGsnxbdml0h2rQox/8rv
	rJZdCrVHUC/h5FsDltDiV1wRsf8QBejg+Ufz9VzVaIgOSUM/yMyoZVdk0ghpTbtPhdbUB25xj/j
	W40zt0oiOmGtwoZ2Or17bQgBAz7cx4cyY5nl1DKbrD/x3iW8gqTQXp4vdV3KK28Bf9ZL+DzSbsI
	JbB6fr/s9F0xGMwrBX7PldlEvFqnW4znj+pUe1A==
X-Received: by 2002:a05:7022:ea8c:b0:177:9a5b:a89 with SMTP id a92af1059eb24-1b25d337bb3mr1727437c88.29.1793946630334;
        Thu, 05 Nov 2026 22:30:30 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:29 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:20 -0800
Subject: [PATCH v3 6/8] gpiolib: avoid krealloc() in gpiod_get_array()
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
Message-Id: <20261105-b4-gpiolib-free-v3-6-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Instead of allocating descs before the loop and reallocating it via
krealloc() when candidate hardware array matching is detected on the
first iteration, defer allocation of descs until the first descriptor
is retrieved.

Factor descriptor allocation and fast-path validation into helper
functions gpio_descs_alloc() and gpio_descs_check_fastpath(). Inside
the loop, acquire the descriptor using __free(gpiod_put), allocate
descs once on the first iteration, check fast-path candidate
suitability, and transfer descriptor ownership using no_free_ptr().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 179 +++++++++++++++++++++++++++----------------------
 1 file changed, 98 insertions(+), 81 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1da91e52e51c..9b5024d30060 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5208,6 +5208,91 @@ static void gpiochip_free_hogs(struct gpio_chip *gc)
 		gpiochip_free_own_desc(desc);
 }
 
+static struct gpio_descs *gpio_descs_alloc(unsigned int count, struct gpio_desc *first_desc)
+{
+	struct gpio_device *gdev = gpiod_to_gpio_device(first_desc);
+	struct gpio_array *array_info;
+	struct gpio_descs *descs;
+	size_t descs_size, alloc_size;
+	unsigned int bitmap_size;
+
+	/*
+	 * If pin hardware number of array member 0 is also 0, select
+	 * its chip as a candidate for fast bitmap processing path.
+	 */
+	if (gpiod_hwgpio(first_desc) != 0)
+		return kzalloc_flex(*descs, desc, count);
+
+	descs_size = struct_size(descs, desc, count);
+	bitmap_size = BITS_TO_LONGS(max(gdev->ngpio, count));
+	alloc_size = descs_size + struct_size(array_info, invert_mask, 3 * bitmap_size);
+
+	descs = kzalloc(alloc_size, GFP_KERNEL);
+	if (!descs)
+		return NULL;
+
+	array_info = (void *)descs + descs_size;
+	array_info->get_mask = array_info->invert_mask + bitmap_size;
+	array_info->set_mask = array_info->get_mask + bitmap_size;
+
+	array_info->desc = descs->desc;
+	array_info->size = count;
+	array_info->gdev = gdev;
+	bitmap_set(array_info->get_mask, 0, count);
+	bitmap_set(array_info->set_mask, 0, count);
+	descs->info = array_info;
+
+	return descs;
+}
+
+static void gpio_descs_check_fastpath(struct gpio_descs *descs,
+				      struct gpio_desc *desc)
+{
+	unsigned int idx = descs->ndescs;
+	struct gpio_array *array_info;
+	unsigned long dflags;
+
+	array_info = descs->info;
+	if (!array_info)
+		return;
+
+	/* Unmark array members which don't belong to the 'fast' chip */
+	if (array_info->gdev != gpiod_to_gpio_device(desc)) {
+		__clear_bit(idx, array_info->get_mask);
+		__clear_bit(idx, array_info->set_mask);
+		return;
+	}
+
+	/*
+	 * Detect array members which belong to the 'fast' chip
+	 * but their pins are not in hardware order.
+	 */
+	if (gpiod_hwgpio(desc) != idx) {
+		/*
+		 * Don't use fast path if all array members processed so
+		 * far belong to the same chip as this one but its pin
+		 * hardware number is different from its array index.
+		 */
+		if (bitmap_full(array_info->get_mask, idx)) {
+			descs->info = NULL;
+		} else {
+			__clear_bit(idx, array_info->get_mask);
+			__clear_bit(idx, array_info->set_mask);
+		}
+		return;
+	}
+
+	dflags = READ_ONCE(desc->flags);
+	/* Exclude open drain or open source from fast output */
+	if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags) ||
+	    test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
+		__clear_bit(idx, array_info->set_mask);
+
+	/* Identify 'fast' pins which require invertion */
+	if (gpiod_is_active_low(desc))
+		__set_bit(idx, array_info->invert_mask);
+}
+
 /**
  * gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO function
  * @dev:	GPIO consumer, can be NULL for system-global GPIOs
@@ -5226,104 +5311,36 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 						const char *con_id,
 						enum gpiod_flags flags)
 {
-	struct gpio_desc *desc;
-	struct gpio_device *gdev;
-	struct gpio_array *array_info = NULL;
-	int count, bitmap_size;
-	unsigned long dflags;
+	int count;
 
 	count = gpiod_count(dev, con_id);
 	if (count < 0)
 		return ERR_PTR(count);
 
-	struct gpio_descs *descs __free(gpiod_put_array) = kzalloc_flex(*descs, desc, count);
-	if (!descs)
-		return ERR_PTR(-ENOMEM);
+	struct gpio_descs *descs __free(gpiod_put_array) = NULL;
 
 	for (int i = 0; i < count; i++) {
-		desc = gpiod_get_index(dev, con_id, i, flags);
+		struct gpio_desc *desc __free(gpiod_put) =
+			gpiod_get_index(dev, con_id, i, flags);
 		if (IS_ERR(desc))
 			return ERR_CAST(desc);
 
-		descs->desc[descs->ndescs++] = desc;
-
-		gdev = gpiod_to_gpio_device(desc);
-		/*
-		 * If pin hardware number of array member 0 is also 0, select
-		 * its chip as a candidate for fast bitmap processing path.
-		 */
-		if (i == 0 && gpiod_hwgpio(desc) == 0) {
-			size_t descs_size = struct_size(descs, desc, count);
-			struct gpio_descs *array;
-
-			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
-						    gdev->ngpio : count);
-
-			array = krealloc(descs, descs_size +
-					 struct_size(array_info, invert_mask, 3 * bitmap_size),
-					 GFP_KERNEL | __GFP_ZERO);
-			if (!array)
+		if (i == 0) {
+			descs = gpio_descs_alloc(count, desc);
+			if (!descs)
 				return ERR_PTR(-ENOMEM);
-
-			descs = array;
-
-			array_info = (void *)descs + descs_size;
-			array_info->get_mask = array_info->invert_mask +
-						  bitmap_size;
-			array_info->set_mask = array_info->get_mask +
-						  bitmap_size;
-
-			array_info->desc = descs->desc;
-			array_info->size = count;
-			array_info->gdev = gdev;
-			bitmap_set(array_info->get_mask, 0, count);
-			bitmap_set(array_info->set_mask, 0, count);
-			descs->info = array_info;
 		}
 
-		/* If there is no cache for fast bitmap processing path, continue */
-		if (!array_info)
-			continue;
+		gpio_descs_check_fastpath(descs, desc);
 
-		/* Unmark array members which don't belong to the 'fast' chip */
-		if (array_info->gdev != gdev) {
-			__clear_bit(i, array_info->get_mask);
-			__clear_bit(i, array_info->set_mask);
-		}
-		/*
-		 * Detect array members which belong to the 'fast' chip
-		 * but their pins are not in hardware order.
-		 */
-		else if (gpiod_hwgpio(desc) != i) {
-			/*
-			 * Don't use fast path if all array members processed so
-			 * far belong to the same chip as this one but its pin
-			 * hardware number is different from its array index.
-			 */
-			if (bitmap_full(array_info->get_mask, i)) {
-				descs->info = NULL;
-				array_info = NULL;
-			} else {
-				__clear_bit(i, array_info->get_mask);
-				__clear_bit(i, array_info->set_mask);
-			}
-		} else {
-			dflags = READ_ONCE(desc->flags);
-			/* Exclude open drain or open source from fast output */
-			if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags) ||
-			    test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
-				__clear_bit(i, array_info->set_mask);
-			/* Identify 'fast' pins which require invertion */
-			if (gpiod_is_active_low(desc))
-				__set_bit(i, array_info->invert_mask);
-		}
+		descs->desc[descs->ndescs++] = no_free_ptr(desc);
 	}
-	if (array_info)
+	if (descs->info)
 		dev_dbg(dev,
 			"GPIO array info: chip=%s, size=%d, get_mask=%lx, set_mask=%lx, invert_mask=%lx\n",
-			array_info->gdev->label, array_info->size,
-			*array_info->get_mask, *array_info->set_mask,
-			*array_info->invert_mask);
+			descs->info->gdev->label, descs->info->size,
+			*descs->info->get_mask, *descs->info->set_mask,
+			*descs->info->invert_mask);
 	return_ptr(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_array);

-- 
2.56.0.506.g506a7eabc5-goog

