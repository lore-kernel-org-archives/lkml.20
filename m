Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946624;
	b=iuq0BD87YoMFgO8Scnh0RT1FP+jxFXRGcJJTng3mlROsOO9nIwbcCtR8mrEe0nRDJaok
	 7Q2ZwOR1TwL+qNfqH7aw6wTRGrsPxjuuuReeXYWBjOrSkMdYnt7bvZE3aLawMueDf0NYD
	 sI+cWdrUmkT7JWR840B4u6EcxPTM2GLhGr17HxexXwmkdLDKOleRb5AzjGE852KvHIvUa
	 7A0l/0l1xqAdZB+Qj7QNurVB5ON5dLRN4ytAX/K1oN97GYo1vNTSyF6rpzi8mZtflQJml
	 ps4wP59DDDvueVm6NGB/ormMDtJZtw+Ts9B9GGjhGKmIebYLN2nOVR/TXA87FkZun2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ltQsLZdMZWEcjwAeQN/PxZnJlGa1DsMvXSbqsTkFAPk=;
	b=j6A/nUq/92XP9vWe0N8Cvs9ovZpSVtgnqPKZTJVpVTI7KqyrMOLct9KLUCpMVY2jAvQG
	 oil7BzenhQiubieinbv8NyxQ9MDCovpLKteBpL9PYWSJuxEjKofXbrg273E94/ocG9qol
	 nehkG3Wi2kmDjdeOTPkHfTUfXZvnl6OO6ROmLE5oG4J2kD+XJnWeYj45FTHecJQ0nRqgU
	 7KXjx0gziafva5kWFumrkyqoUkVwEUJ/BFw3kn7HdVaOQJEedS4J0JeiFuepa+ICVhn46
	 zaLnIQEbWbA0Jgs34rvPNEXJE6NDwRdzO6FH5K0K/Zlhy6odI3tUKa9wkv35v0NzR6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hJd6yvb4;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388A2606A33E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388A2606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hJd6yvb4
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso531310eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946623; x=1794551423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltQsLZdMZWEcjwAeQN/PxZnJlGa1DsMvXSbqsTkFAPk=;
        b=hJd6yvb4hRo/WJyrkBKJKSkoDqgflTlI6EiD9S8W550Wuk6BDRWiS/W/lhHkwLoQY+
         UDcFoCxSgGC8siCG7g08Qb8aRFmqT/njhkpqAXqvdOouCFC5ZwhPLs6peUKbs1BWwfrk
         9qzSHabU24vOaZwqMraYrUwwaNQ4FaGQcTsQgyqIwhCLx770uZORVuiqiuzwjVEQnfY9
         bg10QkkvQ5f+80dHjI54Ei3hcrtbifrgK4gPuoovWCQfWwgiPT1fLy12dQZPvKV4h5+r
         w7Lm6P0lg1Qe93J2dhymcd71+/iOqLmFLPaRPZmpv3PmV3VIdDLPVfNmnrnZxXdETNWM
         uy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946623; x=1794551423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltQsLZdMZWEcjwAeQN/PxZnJlGa1DsMvXSbqsTkFAPk=;
        b=OPDVVV4WGqtAPlzaQSDxpzeFk8rRrZ+R+w0vNF+fornX/g75jCsE031M6pk9jilrjv
         39lym5pse9LB5FQCXLhBxEDu2H+PjV3D4bNLAohBuvx5nShaP6ppY5qDetYt90/f3uZl
         3zi5FHqtINP7jBDEKyxEgsV7y61Frra90NKOcbZeRQNI0C59h76NI0OIRkXJcDo0vj6T
         fPTqu7dVKdZ4REdUI71eC9Sx0VRUYLD5gpiq5FxzjZ72NR7Ix7BupFJi0tIhxH6vbBXP
         EzYvNwbUtv2JmEyDlhs2NgoJtkMAsk4DrrDi2w/S9PYmTL1qn43XOV7rCPzqutiRyVsF
         3cpA==
X-Forwarded-Encrypted: i=1; AKwUvBzVTg3aPQKlfAgMV3JT6Q+bOmoyu2YPR9Hcc7El5Yt+QKiNzEPTd4QUHlsSSSZPtGeJz0tl0Z0l/aAePVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E+EwUfGjM9qX00YaYt8Q834Ec6RIwGwwYuEa3hNpqbYbWTU6o
	H4UNlc8cnCVmPooBWAIgsIkhdPDvyMHEbRc4bZXlqXXYFx2tZDMp8EVXnjJsMw==
X-Gm-Gg: AYBFou3Wn0cJV2q9X6hINmbRkWA5/BZzmhG5+rkOMg5hsXVE6YZIWX6SPCn3fDY7b6x
	YQyiFKVXld3PyMHELT8g3VT7ru7IU8du1ePw2Ebv78I3tbCN0uxY5e3uSSv8gTkqX5kqAYAyuu7
	ySJMUkdZ7nvg2+P4X52FIUo5QMWoOHKqdUtgYlySTRvxnQXn0Rw+Un1RNehdvcaQo94gLp66Z2o
	pwdVeWQ1OarrfkmirQ/Bdej6YJkkkNJ8GA258t38yHuk5nAYRrRgZrnCEsCmuijXqEDQ9Up1FV7
	dsE+N3CjFeLuiDyHZ10V1ZTp+d48bb1VD9Krq4eWdqAtEp60uYcC+lLYVo88D5psdzINlQsAdg6
	6NSvJ/lP9q/i7ryusvzrtm5A1EvDqtJ62Yl3g0w2T6AC2SKD6HDjp5tlTryj8/UTMaQDQNPp+od
	5BjV7Y6q8j0ieH8vBnjV+dpBwc0AlOgqSSuc65fNjERW2b5zROmLWaO532vnZOpJE5c1/qIFgV8
	NEvtH6eaVvVjprj7VGviYKhO/9sMaT39no3zTbP7Eb/tau5m5zo4dgK5hdzIr6kQP8FjW6uhXwt
	pyfkG8ZfVLvlkpiC3pZVBwSb1mgpsQiNwVIZPiXQZhrXVB/R6SfDBTSfEE26LO+T84dvyLynBaJ
	qh3hTCbi9rqsV+W1w
X-Received: by 2002:a05:7022:f51c:b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b25d3153femr1665693c88.9.1793946623063;
        Thu, 05 Nov 2026 22:30:23 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:22 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:15 -0800
Subject: [PATCH v3 1/8] gpiolib: fix GPIO descriptor leak in
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
Message-Id: <20261105-b4-gpiolib-free-v3-1-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

In gpiod_get_array(), descs->ndescs is used as the loop induction
variable and is only incremented at the end of each iteration. When
krealloc() fails on the first iteration (when index is 0),
descs->desc[0] has already been acquired via gpiod_get_index(), but
descs->ndescs is still 0. Consequently, gpiod_put_array() frees descs
without releasing descs->desc[0], leaking the descriptor.

Fix this by using a dedicated loop induction variable and incrementing
descs->ndescs immediately upon storing the retrieved descriptor.
Additionally, since the fast-path array_info setup only executes for the
first element (index 0), simplify the bitmap_set() calls to start at bit
0 for count bits instead of calculating offsets from the loop index.

Fixes: bf9346f5d47b ("gpiolib: Identify arrays matching GPIO hardware")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f2787..a5a519c0f001 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5243,21 +5243,21 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 	if (!descs)
 		return ERR_PTR(-ENOMEM);
 
-	for (descs->ndescs = 0; descs->ndescs < count; descs->ndescs++) {
-		desc = gpiod_get_index(dev, con_id, descs->ndescs, flags);
+	for (int i = 0; i < count; i++) {
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
2.56.0.506.g506a7eabc5-goog

