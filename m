Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946633;
	b=st2IboxmL9sTYaW8kSaocmKLUFKoP9LzT6NJWnQN703joIPsapnCEOWbCnZFRko4t2qQ
	 V4/ZY+MWSDU5RgxIdUJhS0J9cnLR0sxBN+nAS9Hn0/ix+/pOz9ksT+a8AZmDlw6ekPF8d
	 auUCBEk6hs0wMWy9Ih62KvvJBqFr31NjzoO3NNPSh79j0AydmvzAW6NjgIWILCpHxgsDL
	 XLJFVGzh+R/+JWHCF59+AsqDAd3Ito1OarLQFywsCrVUkK/srPD2uMbD7jUefomDMRuAu
	 MT86yoBbUTswken4Ib94rec0nopTO+Ovf9E1hAEwA41kncvW1cWSe5ulJU582cFtTGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+E0SD+NERgwxnxrEH9c8gyitQjSomZKW3g33Q+0LlyM=;
	b=nOBX4xHjWwbdSXRFHZMWguKK0a0nupIQOqWRQr9xUqwZ8NZ+X9WlGIbVY063YAUJjbk1
	 b3KGFfj/BImJNDWOXHR1pm6t2DyP7sjc/kBdSxpWWCN8SvT2OUQXlFRkSTESC6x2Y9oF5
	 GacsVfRic3qtHSdt7XCWl3wKcm+op8tGX6hLcvr4tqEdKbP+NC+AoGkkyh+JFLC4OuMnS
	 VDpNojPalwYBECJS+p7r7soazKAQGoYdlwYnEfyEcQ7x3fltYkkOKLP+g1Cpdvvnx+4Sk
	 xebyOq0vG2kHSo7lE4BfEFfWKIUdR4h1sm9Hi+HNiI9Oxn/Dk3EzuJK/XGFGpTx0eEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I79lnSAU;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CB1606D809
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00CB1606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I79lnSAU
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so808496c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946632; x=1794551432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+E0SD+NERgwxnxrEH9c8gyitQjSomZKW3g33Q+0LlyM=;
        b=I79lnSAUGmESzvy6Hjdou1AjzRwAlIZpMO+YpYYWIINVt3isTcJasCZ98h14mm5n87
         Wsz4coBpJGAUreNCvZdcll2HRdiqQjRnv2nT/GWZhqmtFOGoeihPNviBxKcYE1BpFvsr
         qRqIxEjo/Fha+6W2/6qG1eObmlEa5z636P0JrFvn8tn0OixRg6NFsTTB1J2CwfKqeN4y
         yzQ0HWt3c7K0eUAc/eGQ0EdoZw0MDEH84nZ+mBr+Fx/E6eafATh5dSfEq2o61OBRWXpN
         7jVSkjfLxLiHjHqd1hlit3GYD8zfi2hjMWr4aML5fqlzm/OSMoTM1gdaE4cc0jQJH+zd
         Yb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946632; x=1794551432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+E0SD+NERgwxnxrEH9c8gyitQjSomZKW3g33Q+0LlyM=;
        b=M4XQlZTQ6AIy3xiokywrAuU6Q4ps1HgLkbi4L++CSRQr4K2siV94xlszt8355WtsVJ
         0RVNAStnsizBNiVLwEa1LxFdRuEkBPtSg0okgqRxK/e8ZCov+kPfEJAj/ui4sQTaO9yK
         4dbYQfXwfSHD5SVa+MrNMJKadWovIGdGz6Xxazr6WuLjj/YPovIJs84NkpSjfgUeUwAe
         QJV2Fj7nchzyL8HiHyASqAag6aK3gB86Z0cNbcz//x8kfryJmjsRcE5XOgeQ28A5HRjE
         c4eNQSZFUdcVmZIbaoaD3hCDHWnwpZDIRUbDM+c8Rbk4AwqCNH6BK0oMhDtR++EhQQik
         b9zw==
X-Forwarded-Encrypted: i=1; AKwUvBxw7W3h9CprERlOoroJn6sK7pv0ehdK0lu5Kzw/IppvjrWWCtKlTE2Pz7S81NhyXaN4UgG4gzCfmLKoP6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z91PvzwbYdYvAmGdx1ZCCEGW3V+tG2lXBjtJAXVLCUQ6VwR+c8K
	fI9H81kMcEXUy8RZUEGVpvrh/SbWwzCs1kJtO13zWrI7s+z2RQl3XTHQ
X-Gm-Gg: AYBFou19FYvzicgFCgZuCRD95waAlxR/JLE1h3FuUoLU2WrZbw24sGToHF4XHQks/8U
	xxu9L46xgGNBAqcLxKk4+/Y+yf6JDvDer8V4keUp9TaT8skRRvw/EQo5mn3YA/R7v9+KY9hV94G
	HfbAEXDbg+HywGV8r71mQuLnYCIwwgyBz8wde5wYmw/A6FLWOliu/zEpHiX0qV43aoh9+qjNUZI
	AjpuuTIYnGTeSu8sFkf0yXg1cq6/aX8dTcE3aMY7uDQFCCqqy5XFAmcrvpDUq0O7/beblaUDZFr
	M5FpWjv4OgaKbwmJDIRGdvd8Ho8OOqd/UqsSGdEgtnuO3k+7+KgFA8zM1TBlXmM5tCwnMiEnIK1
	wEBKb1nYXXEVoOIUU4kbNlJ5b1YsvZQAqe5xGdtXfl5HESYdw/+AAPpVatLoJM9NU7kv5qRN3CE
	F+zuRsr91F6j+cuGkChH2BwDWAKxfR9ksg88RAeDc08u7pHUaiiZvB0w5RK8hDou60qU8vBuaT2
	w1H9LENA29hA+oG/MJYNrr2MnZW8NlA3dI5RCrwQLO8M9D0efmdqusDv5NBCGDHTYn96lVzl0jz
	jpCTH9RaEXstTqgfniJtgrDsIBjQFGp4U05urCgv+zpTt6grAa8K1FcZSYgFXuVnP7pQ8M2f4mo
	ji3PPt7MoZcSmZLBN
X-Received: by 2002:a05:701b:2505:b0:181:ccdd:ed2a with SMTP id a92af1059eb24-1b25d38077bmr1737878c88.43.1793946631824;
        Thu, 05 Nov 2026 22:30:31 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:31 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:21 -0800
Subject: [PATCH v3 7/8] gpiolib: use bitmap_zalloc() for fastpath bitmaps
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
Message-Id: <20261105-b4-gpiolib-free-v3-7-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

Currently, struct gpio_array embeds invert_mask[] as a flexible array
member, and gpio_descs_alloc() allocates the descriptor array,
struct gpio_array, and all three fastpath bitmaps in a single kzalloc()
call using manual BITS_TO_LONGS() calculations and pointer arithmetic.
This exposes gpiolib to the underlying unsigned long representation
used by bitmaps rather than respecting the bitmap abstraction.

Convert invert_mask in struct gpio_array to a pointer and allocate each
of the three fastpath bitmaps individually via bitmap_zalloc(), freeing
them via bitmap_free() on fastpath cancellation and array disposal.

Although this adds three slab allocations when the fastpath is active,
packing all three masks into a single bitmap_zalloc() call would still
require rounding the bit count up to BITS_PER_LONG and slicing the
buffer with unsigned long pointer arithmetic, adding a second
allocation and extra free paths without achieving bitmap API
abstraction.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 52 +++++++++++++++++++++++++++++++++++++-------------
 drivers/gpio/gpiolib.h |  2 +-
 2 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9b5024d30060..83edb89a364a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5208,41 +5208,66 @@ static void gpiochip_free_hogs(struct gpio_chip *gc)
 		gpiochip_free_own_desc(desc);
 }
 
-static struct gpio_descs *gpio_descs_alloc(unsigned int count, struct gpio_desc *first_desc)
+static void gpio_descs_free_fastpath(struct gpio_descs *descs)
+{
+	struct gpio_array *array_info;
+
+	array_info = descs->info;
+	if (!array_info)
+		return;
+
+	bitmap_free(array_info->get_mask);
+	bitmap_free(array_info->set_mask);
+	bitmap_free(array_info->invert_mask);
+	descs->info = NULL;
+}
+
+static struct gpio_descs *gpio_descs_alloc(unsigned int count,
+					   struct gpio_desc *first_desc)
 {
 	struct gpio_device *gdev = gpiod_to_gpio_device(first_desc);
 	struct gpio_array *array_info;
-	struct gpio_descs *descs;
 	size_t descs_size, alloc_size;
-	unsigned int bitmap_size;
+	unsigned int nbits;
 
 	/*
 	 * If pin hardware number of array member 0 is also 0, select
 	 * its chip as a candidate for fast bitmap processing path.
 	 */
 	if (gpiod_hwgpio(first_desc) != 0)
-		return kzalloc_flex(*descs, desc, count);
+		return kzalloc_flex(struct gpio_descs, desc, count);
 
-	descs_size = struct_size(descs, desc, count);
-	bitmap_size = BITS_TO_LONGS(max(gdev->ngpio, count));
-	alloc_size = descs_size + struct_size(array_info, invert_mask, 3 * bitmap_size);
+	descs_size = struct_size_t(struct gpio_descs, desc, count);
+	alloc_size = descs_size + sizeof(*array_info);
 
-	descs = kzalloc(alloc_size, GFP_KERNEL);
+	struct gpio_descs *descs __free(gpiod_put_array) = kzalloc(alloc_size, GFP_KERNEL);
 	if (!descs)
 		return NULL;
 
 	array_info = (void *)descs + descs_size;
-	array_info->get_mask = array_info->invert_mask + bitmap_size;
-	array_info->set_mask = array_info->get_mask + bitmap_size;
+	descs->info = array_info;
+
+	nbits = max(gdev->ngpio, count);
+
+	array_info->get_mask = bitmap_zalloc(nbits, GFP_KERNEL);
+	if (!array_info->get_mask)
+		return NULL;
+
+	array_info->set_mask = bitmap_zalloc(nbits, GFP_KERNEL);
+	if (!array_info->set_mask)
+		return NULL;
+
+	array_info->invert_mask = bitmap_zalloc(nbits, GFP_KERNEL);
+	if (!array_info->invert_mask)
+		return NULL;
 
 	array_info->desc = descs->desc;
 	array_info->size = count;
 	array_info->gdev = gdev;
 	bitmap_set(array_info->get_mask, 0, count);
 	bitmap_set(array_info->set_mask, 0, count);
-	descs->info = array_info;
 
-	return descs;
+	return_ptr(descs);
 }
 
 static void gpio_descs_check_fastpath(struct gpio_descs *descs,
@@ -5274,7 +5299,7 @@ static void gpio_descs_check_fastpath(struct gpio_descs *descs,
 		 * hardware number is different from its array index.
 		 */
 		if (bitmap_full(array_info->get_mask, idx)) {
-			descs->info = NULL;
+			gpio_descs_free_fastpath(descs);
 		} else {
 			__clear_bit(idx, array_info->get_mask);
 			__clear_bit(idx, array_info->set_mask);
@@ -5398,6 +5423,7 @@ void gpiod_put_array(struct gpio_descs *descs)
 	for (i = 0; i < descs->ndescs; i++)
 		gpiod_put(descs->desc[i]);
 
+	gpio_descs_free_fastpath(descs);
 	kfree(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_put_array);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 650a702741df..de1795c9be3d 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -135,7 +135,7 @@ struct gpio_array {
 	struct gpio_device	*gdev;
 	unsigned long		*get_mask;
 	unsigned long		*set_mask;
-	unsigned long		invert_mask[];
+	unsigned long		*invert_mask;
 };
 
 #define for_each_gpio_desc(gc, desc)					\

-- 
2.56.0.506.g506a7eabc5-goog

