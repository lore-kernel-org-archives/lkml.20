Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609346;
	b=j2Y+Y8NOkpfW+PpWBXzflaGn6DIrXMjca/fCyr9LN3XzyAyxEomwOpqPz+JdAYAbMYgD
	 FTZYvr9AlA0gR4NAo4F/96sAgVAvjB/OHuDPpCdvFAUmyq5fV/IYuTuba+5TjHiOK2o40
	 WIBO10Jb2DHygbgYbanaTaOH0oFvDTaX9cqkPpFlLg8vn6iMVIvNAYOmcgBhdu8NGRmz0
	 nZxsYvlgjTlfcmBj10R+ABKrCOS1lx7f4D1je8Hx6fFai1fmrLkC/NWSKlh5Y0FZs4IB0
	 lioyAmDtlbxo27utgDxpO19MILMerEBkhEVVaGWnl1NcoVB9B2pgXYvfZufcX8Esf7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YNoVluzzWkXXvEpZuJtcM0bEPvath8gLwLEi7X/lxls=;
	b=j3gkvjRu99iNCSK3J4PN+ZUvgAV1Hu9a4XACF0H9h6Ies1MULfDcoRZrAExTlT6Vtw84
	 KEAecEjjGfFygdc6Mx0l/A+JTwuydgU6JuU9OGb20+KDY58Fufk0rctbuTQLQuGu24LDa
	 1QXJbH0xspBwnyjhPGqbKjf0sBnV87dBujanjuICJcSyfOcMbG/2QKQkr8VL1p2awf9By
	 KUE0JVOlMti9j0GsUC6bb8Yf2NZTdIHQJbZiUOB4SbOjfqPnTgnWiCeV2RrnmEb5L5j9k
	 5c2GGtsrGdTEv0kbdSIHvCJn0kT5mIeI3GU55IqxxXs2Zjg+gYDL+zpk1Dv2rJ6dEzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="N6arD/RR";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC885606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC885606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N6arD/RR
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36681e85e87so2148379eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609345; x=1793214145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNoVluzzWkXXvEpZuJtcM0bEPvath8gLwLEi7X/lxls=;
        b=N6arD/RReL4kuHN26J6OG/PiIaYFjrze6A4x3NcNXbCctNQmR92C7R4Ji8j0HhElcV
         +WLqjngxta7n6Aq1h0IxuwJw+sbwyakh6AlGmCJ3eleQzzY1HAGWiNfVkJ2W7uqfuNLp
         jlQ0pTDzAuOur87ChS7lux62FM9IMnVssSnurieJkWFMcbuEMP4aJogWpBqMFWtCibf5
         gshybJSTTJsnnHnBODo9Ki6OG7ncviUH6+P+6DAN8jPGKeHuG8crjC1fAmCTluhVJjFC
         k+7A5F2j/BinNt7pk/anar/gT8/djDa+Kunm54NfReY8VXKqX88NVaa1N7Knq7MPebtU
         R0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609345; x=1793214145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNoVluzzWkXXvEpZuJtcM0bEPvath8gLwLEi7X/lxls=;
        b=q4pAm5svVrNOlUZ5oEeAGxg99hlDWCKmdU1hQRugRVtp/JyJ0WusqE6pXQHqnhV2Sm
         GgVIuydRRzM24xMhQz8MlwyxPsUL06stQHZCTEpso4GQXE+mQ8Quv50ow080AM740JYD
         7vV+j7yKpU+4WQPD4ETe/KHlI/gEGZZgNapNMrNPeZS1C3ShcF0304/85pJwVslhwsay
         /PUPpfCiBC5nO9y1AL4CwGtDVGbUjLpuU5WJ0TUGQc9VVpu8bVuZvjSA1+aDkN2PpWep
         RrPMKQnOPOurPqqI50ZTD57rbYFltQeAebwoHS3ujfuH7ufV6qW23oq/1HHrvpLA7AgZ
         lH2A==
X-Forwarded-Encrypted: i=1; AKwUvBx/QwINYA84Eot+xz4CUPc+fyCSmqiZP23ZZeQK1Zlb2oKeUxli27DOEYd3t2oepH2NQklmVH7JImB/lAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSjGWXuz/T/RtSvKJ/TZjnzkwRJFy5TM2BRrHotM6hwyD7yKhC
	zBRn306nC06gGskpEOAtTtAHvLw5gQALpQS8yJCgJKsZ4kRjdmMrPaHJ
X-Gm-Gg: AYBFou1mbldNkFnEcYXC5RKlVv4M2DmfPu5aHZR6x86ykxx6SYh8lJP7CvPrCnL9NOY
	mNxyOwEcUioS3yXXezPXm57aKgahhl2X1P9ZYk5WV8FNV14qrpDwsHkQRymDrA/Gr9/7zxjVGcJ
	YhYlxnRhm5OoRWPYGSO06rVBING+rKqGzS5ET/dnObDiHfW+nFAS+DFPWwCkrocQtyTajnBpGMW
	wdJeDmBlxtQTWdHhXG6TbfgnQny5MxmrkngKJBIfD2Uw8/WRKPv9w7WKSKWCNM3T9Zy7OhvyKeB
	Rde9vE2piDkBmVEumtEPbsiTDqHbI+Bv+xYqQ+G19EyUa+KczyCbrjgymdnxPuEK8OzoWNV8bsA
	xHHJFmA5G7D7Sfrqg77UY5wJChPQd3l4KHP6d+4HOmWhI8T5I9vEM48UEGVjCflu98RqdFMjdZv
	7WrAa/3siV2DTPmhM7/XDOimJNT40VzyvZ8yUEcp9X0+zelyTauUJcQoEMzVfL7u09FtJiIKea2
	9YUrbuspw/4cWZRYTmnAjr5s1w98xB27mhNIENBFnyaNmc7VOrk4QhWpK1VSGWSv+B6jS+DIrCO
	bpDavA74nzUdeDXLw9tmSJLtbBUoVoI4vImU50JtoVEy
X-Received: by 2002:a05:7301:1a06:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-3674d84cc20mr3977821eec.9.1792609344242;
        Wed, 21 Oct 2026 12:02:24 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm9500604eec.3.2026.10.21.12.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:02:23 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] gpiolib: avoid krealloc() in gpiod_get_array()
Date: Wed, 21 Oct 2026 12:02:10 -0700
Message-ID: <20261021190212.2237804-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 drivers/gpio/gpiolib.c | 184 ++++++++++++++++++++++-------------------
 1 file changed, 99 insertions(+), 85 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 79f3be30ace1..177ca7748dae 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5171,6 +5171,90 @@ static void gpiochip_free_hogs(struct gpio_chip *gc)
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
+	struct gpio_array *array_info = descs->info;
+	unsigned int idx = descs->ndescs;
+	unsigned long dflags;
+
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
@@ -5189,105 +5273,35 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
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
-	if (count < 0)
-		return ERR_PTR(count);
-
-	struct gpio_descs *descs __free(gpiod_put_array) =
-		kzalloc_flex(*descs, desc, count);
-	if (!descs)
-		return ERR_PTR(-ENOMEM);
+	if (count <= 0)
+		return ERR_PTR(count ?: -ENOENT);
 
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
2.56.0.307.g5fe7bd680c-goog

