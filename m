Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763647;
	b=aYZ4XN+IyNzd7+vSr2hKcQ4cI25/0pVI7J+M2E5XYMwe4bwiQJJvKbpwgIjyN8Uk2rju
	 ozn09Du5lFxeW76Sh1vPA7xUxFKVSSgQoDL32b5lGaBUKr/+L/7MHMlME5+j6sy0iNkxL
	 xPmgEYKxsoVWQVpjyG5YhpIthzotqSWsrRjp0l2z4GJh+8/aeKtFaN69bcWTAoG+Qrley
	 ieySpmUFt3h7eBUbhxJBnlM/Xu1jFmJKCRiQ9ktIcQH5I+wvGAlz6jR38ZGBsI2KHq9S6
	 LSrSP0vfGqzyN2SAtbm54htfzpgFNI0iT2+1zccRAN76eAiWl9RlYSuPtQ96WjdS/VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3AwEbeqJ8Td8EMCgoZgZQucXt1j9JNCOh8vE5qiS3mQ=;
	b=Yfe1MzS3V78ennJM8FfIkOn+qKu6NlSWRgCYt9bw405am3gbiD+7YlB8gPnzf2tpuJm7
	 U90jaS70NAXiEazeQUafCxHgqSHze+Ez5Scz0ay/zFi9K0b4TPMigfyw0uzlofh9cWBuR
	 YNwE2QsVmRh/YNFI6MtfenOWLPRqmmfOoVndsl0Futn0trvAhQPkZ1A4vEj8tNitSBqoE
	 zFfcv8sJQraBLdEjs5vB/AY5wUSiC0UTvfzdzaxQ38HdbYpnVEPMtZjzpRQO12JSZPFXy
	 gyqlEcFpZOiUVnxZDM2OyURRjcIslFmPQfTTZ+fG9Lp6HTWaY7/AjiT6gifFV7vNOFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jmtKFQcM;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56626606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56626606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jmtKFQcM
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-369f33df08eso413098eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763646; x=1794368446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AwEbeqJ8Td8EMCgoZgZQucXt1j9JNCOh8vE5qiS3mQ=;
        b=jmtKFQcMqhR7+8ByRxv4KpkeHAU8wFtChAxqcmETXIGG6fCSgZeIQpYKDBy/HwrZhl
         jvZRyr97nKok4Rr917WkyuAb/K7SSNJLeypvqfdq9BgVGGgh1vQfXcPVBqngxZzP2nRB
         ko337BKF1bFl8fo8xmCfalNgD+/K3IE5b0kR+Jhq9DAXABCpgz+byiDMA0Vf+yRihcj3
         qtt4UAsp6rVo5zid4/0sz3grYt5ijCdmqgFhpSX8oHR+7zWR7o47j1GgZ6bXLcefHos3
         2wLo24CoCOSRJ+2O6xbCymke/v6TnKBzyQYM94RvcFj47s5fQPa+dKgKAGvoVMde9rVI
         RlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763646; x=1794368446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3AwEbeqJ8Td8EMCgoZgZQucXt1j9JNCOh8vE5qiS3mQ=;
        b=wc2tI9YMC/kRXl/NUFKpfY8PJgeQJDymHZOJWC39uYXzoDOoPTNzJ6Xbvk3cmDWTdu
         a/tzE7gnbdpttiI/r2+ceh7yDuYOqwzO/+lFsUaZjKWK0sYY7zPkuaqb35F/YLzkrqu1
         mPQxeFsXNV0r6HFarRu497o7nb3s5spwvT1C0/hLMhBnZu3gctdSz3naO/fDeyl0rusI
         Oo26rKpjjya1hKoDoTZ7RqndNvKyAcdfQZvHzyAB6JTfnXe3Q40mJK/9GMK50XJWOXp7
         vUZqnAvNA847NU3qFaOaBv/ck35YSuSDU3GhoheXKTM6/P7YdZttsT1JCxQNWwXPaSYQ
         AdcA==
X-Forwarded-Encrypted: i=1; AKwUvBwePSJ2j5rQhkGoiqQa/ZATbNPdkAtXXTrrXmmlUS7flw9pVymQwnppfrOxuC2tSc51z1HN6uBeySVaytE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CJx4Y+/qqLn0eggPBkOjZ4nlvZo+QKQT2/XTCAMK8lq9/WEEV
	tSCa+/X/gkYnKpNoaW56ff+zvx/+ihuw3WJBnSpUscKq4uXhTS0HokIV
X-Gm-Gg: AYBFou0XQ/uuOA6h4Ga4H1L905rVbI6vLbvHy30/gLxQoJjYrpXVerVY9UUsamR51Mq
	LqAyJkKKV8a37PBQJTH3QItxZD39VXigJ0d43CKcavEPKazfygPDDvYFtOoLppn4EKJTz5Cc6m5
	WriPo16zLzLh8v6rAJJ0D0+Rn9bqBEIFJxIvkNpLE5a5E05q9gsIWvFaHla44jG/uwbRWCU+4mK
	5CYytRNJYckqW3JT1XSevbiWWxZYtv2Xb9uPvqeRszBGg6xzVHFxSSf0cfRh0fO6vvQbIBAKJde
	mWNu7a2JcHyP/wTTAuxVer8f82/V80famGrj1hm6zf+Nt3u601GdV1Lwrqbf5Zc2TfLi7C9CVa/
	dJb+wibSAYxrvitEJPu9DhJYFzeiZi/HZz5pdyldveCsf0bdfUWBG8XsDTg/D40wCvJwCCQGymF
	Nxt+dOWaT14HPkn8TZUWzA2HfA1ZERVduXW4vWtAvrYN5JBCaY5GjlRKfWMZJdPn7SV/gL7lQlv
	ND5YsPmzz49HVOFwhAcCMHWJQ7snw4zY2RCvhc1+q4y7xqscrXoO/aVeC97IO/tObe6OQj3Ntq4
	S/9j7GZd0Z/HuqXNiZCB4fKvtBfAgcNXeW17Fyr2Y/GstFYRfz3Y/lYRxgPthB6oRJ7AQp02yYF
	xNDrj1qQUukFofciq
X-Received: by 2002:a05:7301:710d:b0:36c:9a3f:988b with SMTP id 5a478bee46e88-36c9a3f9915mr3497734eec.18.1793763646272;
        Tue, 03 Nov 2026 19:40:46 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:45 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:29 -0800
Subject: [PATCH v2 1/7] gpiolib: fix GPIO descriptor leak in
 gpiod_get_array()
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
Message-Id: <20261103-b4-gpiolib-free-v2-1-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

In gpiod_get_array(), descs->ndescs is used as the loop induction
variable and is only incremented at the end of each iteration. When
krealloc() fails on the first iteration (when index is 0), descs->desc[0]
has already been acquired via gpiod_get_index(), but descs->ndescs is
still 0. Consequently, gpiod_put_array() frees descs without releasing
descs->desc[0], leaking the descriptor.

Fix this by using a dedicated loop induction variable and incrementing
descs->ndescs immediately upon storing the retrieved descriptor.
Additionally, since the fast-path array_info setup only executes for
the first element (index 0), simplify the bitmap_set() calls to start at
bit 0 for count bits instead of calculating offsets from the loop index.

Fixes: bf9346f5d47b ("gpiolib: Identify arrays matching GPIO hardware")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f2787..f33033dd9473 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5230,7 +5230,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 	struct gpio_descs *descs;
 	struct gpio_device *gdev;
 	struct gpio_array *array_info = NULL;
-	int count, bitmap_size;
+	int i, count, bitmap_size;
 	unsigned long dflags;
 	size_t descs_size;
 
@@ -5243,21 +5243,21 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 	if (!descs)
 		return ERR_PTR(-ENOMEM);
 
-	for (descs->ndescs = 0; descs->ndescs < count; descs->ndescs++) {
-		desc = gpiod_get_index(dev, con_id, descs->ndescs, flags);
+	for (i = 0; i < count; i++) {
+		desc = gpiod_get_index(dev, con_id, i, flags);
 		if (IS_ERR(desc)) {
 			gpiod_put_array(descs);
 			return ERR_CAST(desc);
 		}
 
-		descs->desc[descs->ndescs] = desc;
+		descs->desc[descs->ndescs++] = desc;
 
 		gdev = gpiod_to_gpio_device(desc);
 		/*
 		 * If pin hardware number of array member 0 is also 0, select
 		 * its chip as a candidate for fast bitmap processing path.
 		 */
-		if (descs->ndescs == 0 && gpiod_hwgpio(desc) == 0) {
+		if (i == 0 && gpiod_hwgpio(desc) == 0) {
 			struct gpio_descs *array;
 
 			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
@@ -5282,10 +5282,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array_info->desc = descs->desc;
 			array_info->size = count;
 			array_info->gdev = gdev;
-			bitmap_set(array_info->get_mask, descs->ndescs,
-				   count - descs->ndescs);
-			bitmap_set(array_info->set_mask, descs->ndescs,
-				   count - descs->ndescs);
+			bitmap_set(array_info->get_mask, 0, count);
+			bitmap_set(array_info->set_mask, 0, count);
 			descs->info = array_info;
 		}
 
@@ -5295,38 +5293,34 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 
 		/* Unmark array members which don't belong to the 'fast' chip */
 		if (array_info->gdev != gdev) {
-			__clear_bit(descs->ndescs, array_info->get_mask);
-			__clear_bit(descs->ndescs, array_info->set_mask);
+			__clear_bit(i, array_info->get_mask);
+			__clear_bit(i, array_info->set_mask);
 		}
 		/*
 		 * Detect array members which belong to the 'fast' chip
 		 * but their pins are not in hardware order.
 		 */
-		else if (gpiod_hwgpio(desc) != descs->ndescs) {
+		else if (gpiod_hwgpio(desc) != i) {
 			/*
 			 * Don't use fast path if all array members processed so
 			 * far belong to the same chip as this one but its pin
 			 * hardware number is different from its array index.
 			 */
-			if (bitmap_full(array_info->get_mask, descs->ndescs)) {
+			if (bitmap_full(array_info->get_mask, i)) {
 				array_info = NULL;
 			} else {
-				__clear_bit(descs->ndescs,
-					    array_info->get_mask);
-				__clear_bit(descs->ndescs,
-					    array_info->set_mask);
+				__clear_bit(i, array_info->get_mask);
+				__clear_bit(i, array_info->set_mask);
 			}
 		} else {
 			dflags = READ_ONCE(desc->flags);
 			/* Exclude open drain or open source from fast output */
 			if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags) ||
 			    test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
-				__clear_bit(descs->ndescs,
-					    array_info->set_mask);
+				__clear_bit(i, array_info->set_mask);
 			/* Identify 'fast' pins which require invertion */
 			if (gpiod_is_active_low(desc))
-				__set_bit(descs->ndescs,
-					  array_info->invert_mask);
+				__set_bit(i, array_info->invert_mask);
 		}
 	}
 	if (array_info)

-- 
2.56.0.385.gac671c819a-goog

