Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763653;
	b=3dOdypR8EYS7vKk/GD7+leVFCdD1ecuOIBPz+gjCvTmUjdUWAEUSXsI3dqs5wAPvMvW9
	 9AVlZcsOZZWDxXuOujOcVWEKQGj3s0WduZC+PmivCbWf1sHkHQs8/Bw8lYU8+Tb5lnV1k
	 Zv6GP+3MB5Y9abCRMA8Mz5nd+jKMoiqs+fN8K0obt9gicBcrmuu91M/PvIyI6ajNhS9Aa
	 Zwjcn8edff7l0uFLuWAion3s4cgZd7iKeSuSw6aWmhdplDFH8dcOexvJJS53sSOjkmBPd
	 hGMVbdWd3HC/zSwp+F8ia4ErUD5nNJi+5EayaaVRhth95dBL27yoZUpWv9TF87B8ocw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qke+FbrllhHZRMLGso7ptbO8mk09bQQl8SyRTlFyWsc=;
	b=FQbF4WqTGvdpIWhGW2A425RZHdYkXz3xY3VjR3EPdpw4Sk44bdewPGemt/6Sc+mtS7VY
	 PjznTCfpW5TYOZeD2zzaJ/4J77nHpDb0TXEUxcsCH3stoyrGZMGiHfrue6nsj5VRg9gEA
	 0Qd2HXvd5SMQJkQdQxncFpUuYBvgoue3CvGfUTtkobCjZxhtLAleN7/lJeptKBjsvTzT6
	 E9w3puLnjsSJCOInIyLFWXFKRr/0flLe6e75moO6DmX1ykMpzgGIvJ6ILDoskULhDxgZ6
	 WiP7OHI1rTNwM6u9LiSxM+yRCBNbtk5j4ihwTCMebUpFbOH0ZC5WaQElMh49f6+rr0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRTG2D+e;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44017606D809
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44017606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRTG2D+e
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a17a332ecso374247eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763652; x=1794368452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qke+FbrllhHZRMLGso7ptbO8mk09bQQl8SyRTlFyWsc=;
        b=zRTG2D+e6HjDCf0hdhUKwZKB4rMkJ04x7DJffeBFhBwxNvXO5UP/rfSVCLCQLJ1Q1+
         ErKN9Y7cr3ZDOUYayP3m61YMspLT3giXM1/3WTzB9GugZgFSpGjaODODIbJGYFhTNkfK
         m3s6f7+SLES4xw1yAIOvGqhbDBf2oQr/luqng9cCYxqBZsQquEcw52pHAMPDdiv3/1MM
         afe3Sx08dVOLBA5cJRrSc7g0m3WP88HoCL2Z6Lyf5WoE8FZOIIakbGCW0BefaXpAlfvr
         nFCYXzh4BheaJRo8HgtKFfK0mY8JM53WYQmBLfylLxc3ont3KYFzh6h2TnfakNcVScWD
         RRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763652; x=1794368452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qke+FbrllhHZRMLGso7ptbO8mk09bQQl8SyRTlFyWsc=;
        b=YL4SX6OjTqF0jP4rvM+JuR4Xef3njAulWbmMsTExzArIZGYxGITyE7Y/dCoTc+dN78
         Nrrrm7lj622H+68CWxt12yBgy5Uw37EPlhL0VkduDMvAYaNDC4euALSI5P30dWI1utyL
         2hvXXMYnCEt9KQiXbVXQq8XJgh30RksNKuAaXGyPgG/pw3ASLPvW+wV+1wW2TB+PDyuh
         CNG4j6ViH72/9Jco0jymaWCTgo+u5Ct1VX1Tud0GAENkKt8NSqNvHMWPG630yYwzm2Lj
         NOpdtDioRWJ8U1G63GZQjx0nVjbuNNFlddzDlNY9AcDuBHzn3Pdl0SBYI71/MVSVFJMI
         rkhw==
X-Forwarded-Encrypted: i=1; AKwUvBzNgTdjyEKVK1NA0lOzUghqH5RyynqcfGfuz1Hp7XCRs0R2x+oiN2KMwh+UYyTCI93VFmY14ZBOF/AW8iw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xt4ancxNiKeeuPCDawe/QOclgqVs+ov1yxQ+6xsDMtd7WIRAU
	4SMIrTjWUuLJNfKsI9xCNnRZg398fZPAqUheMVUtxs9pngbtmgPt255O
X-Gm-Gg: AYBFou2eF7W6WkV1jeAdiB1yx8kN1I89WftaurpPn/gDJ4dJvLx6qo8CWvTta8UBO6r
	TELMAAWcs9tE6laxgXcGAUXAt4QDOgLAxcSbvnsESQ8CHTFLKWEsIxh3JwO9Xan89BJO96PDs9z
	m319/iC6bxIDRbCbG1ZJIGrNl3xDby34O4ETVv7xgO1oIQzX+pXkvN66kWMQgP6KIyIwdSN8gUd
	ZOILgSgaoTMXtO4BIOf3uwMkey5xza+GC/wm0ShzHGTVv/5wf53j0va7NmxAM9FTx+u8TsFL03k
	VA4NSZUBlrNBitNGjG+pHs7vqUTanWs1sywy0prF25Dp5a/e7sZmhvkZ6pMMsvN24b4uGqgLf9y
	PXBA0f3ixb+j1WZb2WMIMKFYAiR2TVbl7yUMe6lxpa066uGkU5uJ6ZQJVFifVzkND2cQXCZadhp
	IntzExw4U9FrH+X9ISz9YYqTvIYicDvGoa+dpsDqiyXxCjG5qPpCiMS28wdEYX5Y53P+SXu3DYI
	C82m5TIE+PvkQ4EMLN3liUEKZpfvteu9YFfxIOH/5cLwtcZbI5BPjEUtaLOUmgH2Ha15Ob5WDoq
	nYDkhLdAUf63Oe77Nozeha9biyHealP+Gmrv2CMrLAkAj4+Buk7+U4HvKYISbYjmaFLN61DEDWR
	zOQNpma4Ry0i0/KCqDHDSqg0WNHlu90f8zU294wk=
X-Received: by 2002:a05:7300:ff42:b0:369:f231:4707 with SMTP id 5a478bee46e88-36a42225abdmr22968121eec.5.1793763652145;
        Tue, 03 Nov 2026 19:40:52 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:51 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:33 -0800
Subject: [PATCH v2 5/7] gpiolib: use __free(gpiod_put_array) in
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
Message-Id: <20261103-b4-gpiolib-free-v2-5-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Switch to using __free(gpiod_put_array) scope-based cleanup facility
in gpiod_get_array(), simplifying error unwinding and eliminating manual
gpiod_put_array() calls.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9a850f5c1917..e71f8865559f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5227,28 +5227,24 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 						enum gpiod_flags flags)
 {
 	struct gpio_desc *desc;
-	struct gpio_descs *descs;
 	struct gpio_device *gdev;
 	struct gpio_array *array_info = NULL;
 	int i, count, bitmap_size;
 	unsigned long dflags;
-	size_t descs_size;
 
 	count = gpiod_count(dev, con_id);
 	if (count < 0)
 		return ERR_PTR(count);
 
-	descs_size = struct_size(descs, desc, count);
-	descs = kzalloc(descs_size, GFP_KERNEL);
+	struct gpio_descs *descs __free(gpiod_put_array) =
+		kzalloc_flex(*descs, desc, count);
 	if (!descs)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < count; i++) {
 		desc = gpiod_get_index(dev, con_id, i, flags);
-		if (IS_ERR(desc)) {
-			gpiod_put_array(descs);
+		if (IS_ERR(desc))
 			return ERR_CAST(desc);
-		}
 
 		descs->desc[descs->ndescs++] = desc;
 
@@ -5259,6 +5255,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 */
 		if (i == 0 && gpiod_hwgpio(desc) == 0) {
 			struct gpio_descs *array;
+			size_t descs_size = struct_size(descs, desc, count);
 
 			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
 						    gdev->ngpio : count);
@@ -5266,10 +5263,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array = krealloc(descs, descs_size +
 					 struct_size(array_info, invert_mask, 3 * bitmap_size),
 					 GFP_KERNEL | __GFP_ZERO);
-			if (!array) {
-				gpiod_put_array(descs);
+			if (!array)
 				return ERR_PTR(-ENOMEM);
-			}
 
 			descs = array;
 
@@ -5330,7 +5325,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array_info->gdev->label, array_info->size,
 			*array_info->get_mask, *array_info->set_mask,
 			*array_info->invert_mask);
-	return descs;
+	return_ptr(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_array);
 

-- 
2.56.0.385.gac671c819a-goog

