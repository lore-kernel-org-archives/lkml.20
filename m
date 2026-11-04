Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763659;
	b=qBK2AxpW2uWq5mq+8L32r1SxTjYAnGSvaCdSI+Bni7imNpSIi+BoFIdR85JkihxhJ8Jb
	 P5hf12VHbeIn5P3SDQuNSw9wSRTtNE4TJBmVzUEvNAFKAPlOwPeW56/W+k2pJXsSaiHGX
	 057Qu855y3B7y9aux15ZC9pRPZ6By9CVAZWhs7Is7Xx7iGbtvsY0CbC0wrcKrAxJKvNF5
	 SLE5K4jAwcjQyyrC4A6wp7Q2TRqL+YvW8/WwPbv7hRBy+mdXQGbldy6/SS4Hch9gbEEx1
	 WI/xdEM3+Te65TtjejtCHtDP5zTM8/QrubrQJ37HK/HeHvZkMM6EIktK8L5tLrGYIXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8QlC1QEeCheFbapANdihrMvwXWuObWUXDkh3+6fKV6A=;
	b=DaIRKM5u08buDAXQnTepdQKK6xPfMa0d3tfueUZCI5N+u7BkChCfOrFg4ZvJ39nUbGPI
	 Nn3jw8y6woH6g+eJpps03Txn2EMOshN3HXZjSsI01f65WN1U49/v6zbUDh3910TY0ur5w
	 ySdyaEHX6orSYXJYOMMoeVbmSQELvNjWz0Ig04FSqL5Ta8OjYj5iTf1Wz2FlnTnzVSLRi
	 vjfdP14BGbSbqz04fo2IHzQKo0RT6q5I64UZO6d33MeN5u5wXIQ16ffct7m+AuJmMFyJv
	 xkSTptsTUdrJJq/fabURs3APmlev9KrSjESilDas+rCL8EcxpMuML8RVxkYLV6f5Dbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3FJJQU5;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADCA606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ADCA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3FJJQU5
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so492756eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763653; x=1794368453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8QlC1QEeCheFbapANdihrMvwXWuObWUXDkh3+6fKV6A=;
        b=v3FJJQU5B3HOul6qVKr1lZnixNysYsFhjn6b1Mm5K82x3Wg7WGHGzWTI7bbH8gPbBe
         uByAO6C0Eih8kgFHkQCgnTE4hubfv7G7ZJ7nB6qXwjuzQNcqdtx4gm2aMR3FmV0VlBTP
         DaevsketutjwS/P6OfEdY7NPKBNo4WlcwqWgEOL40oaaCNnW2Jpj7xWA+/FRbQQXrH5f
         jm/2yiWKKTcIR2CNIRZ8PF+9GEOjBHRsFAAG13G2pWSqEwzffpnQ18de+VBTuAZAuK+H
         iroB9GioSIBan18TWxw3nEH8EkiVF2CBzOxGuPpBt2USKrpXUxMFgx+d/P9CfG8U7h4J
         w3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763653; x=1794368453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QlC1QEeCheFbapANdihrMvwXWuObWUXDkh3+6fKV6A=;
        b=unp5+xq3rjYNuV5q+njAgQ/l3gjA2GM7dgAheUTxYbmsvzSaOkExy7tRexVxRSlxX2
         9pT0zzYPQ0+Jc2+k+E6aNVyesc2qwDVynMGAjLWEr6+N9AU2Xv9kGR0Md10Hyzw+pqar
         1ZIT6Cum3Hv2omMNq5JiRuDcagDW1cYl2yA4r8vCb5C7OwPn/usWYS8ArIUj8ZqzzXnE
         VlfvY7fsPgNwQBIJFK970QG1XjdYR4xyF9K5z54W46odvfoEvdqAvhunPNndC0K66Kwi
         G6yYroU7WXgp6/xUbQR32GXDR2YNm0VnTOyvc3FoyOo8s506WDVwXBLlR7rUqeafuFgX
         JupQ==
X-Forwarded-Encrypted: i=1; AKwUvByxhMIRFZN6M2Zlu0Pg+wO3EClBfnWaha2LIJ/nXjJFvABzwPOmcdAarJ1YVKj467UyN+WX7PVm1rop6vQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8adFXzRWO5sC3DYYDdCEY/31WSDSZnLjp8ytqYiHO41HdcQyrO
	fqu6rTop5i4NqceOzgmesTMHU9mOvyYiWEq+0LCF+SvUYn+vzEuQMvcq
X-Gm-Gg: AYBFou3O8JnqESwtAO8cxi3ILM44PLyGpeDj8fbdlULIAr/q+dqLSVjDSCYq88yzCpW
	MWlzWxGcXskenf8kIRZ2MWI5JJj+Xb8Xq8kZtTGAYkHsTpXSGAQmupsUKmtfIbyUVXo+e5KnHTv
	TMmAvbx+xJ1jRcyopOh8oLe4m3P5EmQr/vS7nNDmdBaRZoIiNvfvS9imzeVw/RlfwYDEnWDIvve
	+R+2NtIRGYmgINfbDGg+XmX4CNfxEYkUd06luwXOkM/R1/pZa9B4hiG2IubU4GZ9VAq+R0+VBEW
	EwD68GgSab/WpuyfovjzMIq/5t3CMPbkWC/8/mKElIjhK3PkKe0XQJtAeeLvz64q24WdwH9Rt5c
	4JXBFmGxEP2fltnBUUzTFxbWniyfvBhIPQT9BEzrrPLqY6d1wQzHAneccZUmNzoqRYSWiu6IFcz
	B5r3zmre7D5b54JxoORRHhb4CjigYA52u/aAFiMTfcwg/x3jjP8VWcksinMFHRxZwfq8s+gjEiI
	PTEmTq09arkU1QNdarTHgJoi9WM0drTjUu4Uwx85q2BDkzbPKHsmr1QtkaNoPbe6Pr0STagNUyS
	USmNngNfTxhmd8ZI3hIqF3OADhPNThRRNA4xbuhWoowiMj60Z1DLRkVXRhfqVvKlDsJxkUqbC+9
	h02MHaTG4odEWUHoDyMYNo4ja1xWsoNVbwX/QEg==
X-Received: by 2002:a05:7301:6199:10b0:36c:a281:1bc with SMTP id 5a478bee46e88-36ca2810b86mr2081507eec.16.1793763653482;
        Tue, 03 Nov 2026 19:40:53 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:52 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:34 -0800
Subject: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
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
Message-Id: <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
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
 drivers/gpio/gpiolib.c | 181 ++++++++++++++++++++++++++-----------------------
 1 file changed, 98 insertions(+), 83 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e71f8865559f..cf311c1a707c 100644
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
@@ -5226,105 +5311,35 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 						const char *con_id,
 						enum gpiod_flags flags)
 {
-	struct gpio_desc *desc;
-	struct gpio_device *gdev;
-	struct gpio_array *array_info = NULL;
-	int i, count, bitmap_size;
-	unsigned long dflags;
+	struct gpio_descs *descs __free(gpiod_put_array) = NULL;
+	int i, count;
 
 	count = gpiod_count(dev, con_id);
 	if (count < 0)
 		return ERR_PTR(count);
 
-	struct gpio_descs *descs __free(gpiod_put_array) =
-		kzalloc_flex(*descs, desc, count);
-	if (!descs)
-		return ERR_PTR(-ENOMEM);
-
 	for (i = 0; i < count; i++) {
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
-			struct gpio_descs *array;
-			size_t descs_size = struct_size(descs, desc, count);
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
2.56.0.385.gac671c819a-goog

