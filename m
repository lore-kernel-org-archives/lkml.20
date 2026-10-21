Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609344;
	b=hP4c2YrG7w2+40Giw0XXTyk12Ym1oRZfAstQzjSxoMChqbvLNjHtiEaZbv78zUj/VHKq
	 qzDM5zcPQ6eBjFspeOae87Prje/4ty3YMy4mDnghf6RM8Xh0PFnxA4sh8SmukxufNNywi
	 GAO/pIGA6ve9n+/gfDqwHBFYLiTf1pAmsE2ppPmEkTfbuTEU3FZdaltUA9iosigwmu7Jf
	 ZCVo2vHXpEVDMsS/R/YahidNdV96t3Itl2Z/VTprLWFUUPV3c/H5vX8JiR/Y0K1mz/TuE
	 0pI6LJcbDU9J6K2mEsm4euMoj3BKNgIKB8LqirysU6Rami7liiXdjsy87W5YvmVDJbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hqC+X0njTqocUmZn8EaZ4aReZGBfMVey0Ex3TVDmvMw=;
	b=d9Ptya4k+cZlYLVM+PMdZWqI//E5oZKG0lUbcqbIeNfepKVaFW/gnA0Exg2TqJB4sSBV
	 /OoP0du4VPEZFX87PjC2lHfJMhaDrksAiPk5frMmb25ZNdIXKXZ7v6FAhHCi/eb5oRKSu
	 94zw5ITg6kfnzHb8K8x18ow2D/KUCGTZoPB0/cxYZ5PO5W3GUP7WteNMNxhyiuW9ZBZn9
	 77Ceyp1wyQfkvlFZshqfgdXCggFnQ0Ds+dVhud2CLlgcpBm6jGwztza+4hmvxf4i5hG/M
	 aPEXhXW+p9HYhzWRLXazRtft2/aFb5LDSKQAcS1BjabbR2BHPpXS8W42QMwiMLM50UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zu74huN8;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE59D606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE59D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zu74huN8
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35f036b17easo906866eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609343; x=1793214143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqC+X0njTqocUmZn8EaZ4aReZGBfMVey0Ex3TVDmvMw=;
        b=Zu74huN8bqxKTdK9qjC7qTPI6UWRWOaL/1U6Pj08XnIPoyPuUHp9NWCCGPBWgmp/jp
         JWLNodk19/YQpQKXsS9NFQ6IhesYH+O5rRXmPPQTFm0fYz+LlV0fF7SsFGe9gZOv0B4G
         sNSWYySUFCOQwiylgiH59NOOftWsROqBcdlnKPrRxE1b5OR08/LNTplXemHYqNmczu0J
         ULlqRNlvI/63y7GvIpb3OOpnPQxLWDl/1Sbu+KYnSyJjRAJcJQr3sZ/h/uS4+vThcAgn
         x6i8CT2+HdXFvHuH5Udgwa+8+eslm0xu7KX4SIXb0gmC30Pn1jaTTUNngYbpp8hdRQXG
         snog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609343; x=1793214143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqC+X0njTqocUmZn8EaZ4aReZGBfMVey0Ex3TVDmvMw=;
        b=HqCF54A/b8ADJ1Z/uQS15+tKpbhGLJtnespD2UDCq+oB2S493f8sJGYTnC3ztz7AyE
         13TWirjd4ZGiSsHzdpzyqLgpliGe+yuFdk+I0rzQsKtX7StvbMgz6YMJiHisEI4ZBSDd
         VTWiN5/PhNTjoVwcENobpl989Ve/qhR4/ADmSK7wU4uY2hasIFAZ79l9qFtPq8Npsnwr
         UiYcwRMMHSdOYpFkgu2tIyY8By/RDlvZi3WRytPDNxPvrn3g3b4CaX99Kvi2P9PjobCd
         GqlHblxzD7XjK7EGgSe1mPU+UFB3x1NTIFr1gd3X8nCC0Gcwy9HKkOtY8j6ei678qoA0
         G8tg==
X-Forwarded-Encrypted: i=1; AKwUvBybM2tpi44SMeFBTV5ofqXsUQCCkS6qXcSqbXk2Hm8wJyytzN6B8eiFIDdLHKRvupQatIzrNA+kF2sU0V8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbsAhcdv2pc4/m/qY9eHK86D2kfFmpHOG7fi/wC5lqUbShGqZ3
	vo0SQiXiF8FvsYXZZhfLhBWxo5BUC8h/Bngggc6IHKiueyMy3tocLnDr
X-Gm-Gg: AYBFou0REtSLJITFsCJcdGOtVYn2kBQxk5ZNocXurtjrs/t/tYYOIM0jJlYoXN/dGO3
	29roKWfDLaAsbNLFYxE7jThhF3OfMbV+SFPgf2JNFPScnZ22PoeXqGI/CIX2Bt9qgK2fCQjV1aK
	QLHDlPO9R1FqPWmYGCnewCpKUr36DMKFSqhczohqhyilZ/qWeBU2fCBkUBqJXrqv+DEIEJsxJt4
	dLY4mQoBesS4an7L+1Co+Ivd6AEMQaWU/rIzTOmSfp/52Qz5JLKal46tvz5C62SA44yPvdzBlFg
	HZAG/zUfyQqL7yJLubez0Zqf8YiBGZLyZ2wIhUb8GRbQccuTGs6/SwAnQ/RJaPE877tamxgt0vG
	lWu42xxijsjq9/CkDd8dJDN+H6KAVOt3e/z0l+urlWqDfjiE82bXzn+UCvb3UpGbIYGF9gOGaW4
	Z0EXbArkCrrq6PzwdzdKnW7WUKpPJbBMpt0tZNNfoC/EXt9BxCFAz/vp+Fq74BvZ5UsjSqxpKTC
	vrtWO+Ys2UDwkOlgjq6vifr/JeNIFgYu3Vcn3yN5OXphzvZ3lHX7i3+wwIfsH9a2qqtiIhfLEZI
	iwOLUsx/m0vksawhFFColY388HNDerfeYwLObncbGeRb
X-Received: by 2002:a05:693c:88cb:20b0:368:74ca:1c5 with SMTP id 5a478bee46e88-36874ca066dmr935998eec.37.1792609342466;
        Wed, 21 Oct 2026 12:02:22 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm9500604eec.3.2026.10.21.12.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:02:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] gpiolib: use __free(gpiod_put_array) in gpiod_get_array()
Date: Wed, 21 Oct 2026 12:02:09 -0700
Message-ID: <20261021190212.2237804-4-dmitry.torokhov@gmail.com>
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

Switch to using __free(gpiod_put_array) scope-based cleanup facility
in gpiod_get_array(), simplifying error unwinding and eliminating manual
gpiod_put_array() calls.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 144a63e6692c..79f3be30ace1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5190,28 +5190,24 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
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
 
@@ -5222,6 +5218,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 */
 		if (i == 0 && gpiod_hwgpio(desc) == 0) {
 			struct gpio_descs *array;
+			size_t descs_size = struct_size(descs, desc, count);
 
 			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
 						    gdev->ngpio : count);
@@ -5229,10 +5226,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array = krealloc(descs, descs_size +
 					 struct_size(array_info, invert_mask, 3 * bitmap_size),
 					 GFP_KERNEL | __GFP_ZERO);
-			if (!array) {
-				gpiod_put_array(descs);
+			if (!array)
 				return ERR_PTR(-ENOMEM);
-			}
 
 			descs = array;
 
@@ -5293,7 +5288,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array_info->gdev->label, array_info->size,
 			*array_info->get_mask, *array_info->set_mask,
 			*array_info->invert_mask);
-	return descs;
+	return_ptr(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_array);
 
-- 
2.56.0.307.g5fe7bd680c-goog

