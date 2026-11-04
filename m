Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763656;
	b=H3iyPBUjxdf1o0ziwsMyT35bsc8uSmpyz95eII/WA6sUNQGStj2gd4V6jaSV2sHt7k+C
	 cfaurVaxti7llHIk/6zZZEZ+OV37coB5m8B9VhJ73F+j72dtjpMl2n0yqbsmSOIba5beq
	 m6YC7oW2l2VLuSxZstnrSalIgtcwnuOrKLBImtO0BhJ+MdBA9anqBXdq68i3gF/djncMH
	 mPNCDL9M2whbJ9svaX5wFDcgZ+elRRCOyb0b6ADHdD6dz7mp2Dndmx+AfefsUwiIqg8bi
	 IdvtKojAr+3tMVyc0YYKixmBs+UZ2WilPzlG9ISTn4IIUUHQHzcu55MNPAgobkm0rsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XrTiHBjWqhtdr6KbbaJ8xLQ2Sig+fOe3Yn5/6f4R/3U=;
	b=ybWIcW6A39fJyiuqBdqFZCIQLq9YPbZg3+Py1IXiMiedCMKWdgH9AC8jO++4JViH2aHI
	 uB0iSoGutoFC5zonyFInWscOah4dXBXZXx1PnZ904TWtdj3ViZzwEww+8nzVJOr9Foiro
	 tr/w3o5IbPMLIok7ZI65gvGN8pNj/qbcMNtipF4G/cWetVR0jDi4KPQwuv3g925Azu2iS
	 IYI5E2Dm30lDXlFpO87fZ/vDoB5t4Bpgf234NF3fJQt3o4u3BU66G3kcICLAeDHyJDLqq
	 QXrJenUVTSGtjeMHunUn3nHQeoneeaY306tFXDjmwBiJb7UCMPlorvqjmQlf2mBCvdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7JNLGhh;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90CA606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C90CA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7JNLGhh
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso368195eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763655; x=1794368455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrTiHBjWqhtdr6KbbaJ8xLQ2Sig+fOe3Yn5/6f4R/3U=;
        b=x7JNLGhh9ftIwWOAyLHBIpDKiKqV609DM4CdWkkSL5nD41aLF2vzsOaqkExa9da7E/
         P2P2AWaFr2pS8ptUb5cxsFYG+fnuMxpk12R2BYmipait8p2AwDHOUUuD1+uITJRhHh1T
         xOrVMNxyMxEOp7lV3X1ipVWpWko8AbXIO0zf78PO9HveuVso5o8ef8FKEQhptMiNYCF4
         ai4RTzMSRRs68XMCQgMyYF5ey4/Aj3sgM6WyDovaN17w4sp9BBPJW4I/UpJVtXmBRiNV
         Vpqo141j5AX0PJfXNcWcz+Dt9nGk8v6aVUUT6a9z2jwankuOwsJEjGsH670pcQFOwXMF
         RJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763655; x=1794368455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrTiHBjWqhtdr6KbbaJ8xLQ2Sig+fOe3Yn5/6f4R/3U=;
        b=zNFxrCEz8H6dOzRbWZjvg/fBk+VvYXLUx86ckuUsNiLrC+60IG8SC22ZrnOfw7tlt1
         jpM0mQSRPVRQ3g9eP8JrdojuegFNuTVbYKaT2csB6w69hHu/gk2C1sioWx1QkJkodXJ3
         aLsbS5C3VcJSwZoIUGqDgXiu5aQAnmM1nyKJxQp9L8FhQJWvv4iyMFtW+Aajk3loVFf9
         CR5D/zdOfj1MkwQyEUcn+PGataNSgBO3gTNQBCjAlTAMK0eIgZqPWHTxstvVpCQzsk+A
         BEue1QLjSnLxdV1uADgRh/7GroY7U4W1f4CJyl6cTsVScHGo505HtkgDDfWKb1tGMah7
         mWuA==
X-Forwarded-Encrypted: i=1; AKwUvByMZhdakN5GDBSRRffuJ/jnsUolvn7sICH7a4LHt0E4HSuwsI3JciQuxGjsM3/AWzCxlNj5vQDViGVLcCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VnJWJcu5g8tFR7JnOZUBoMUl3jgF6hYmLzeeuBF0mUymhCB3f
	E9TtCeHoveT6TJQLMbTnlCaNNFnEdbPFfHLLgJUHAx9B3sN0Z0k3O7vL
X-Gm-Gg: AYBFou3ns33oFZQ9/eGAhDHRzPaRbs0t9CBY/gxqgmHAiMgkdI5j8r6BFJhTScsi31+
	oJz1m6gcVx+DFRCVVt1BtSUdTpNvjH3Z6SK0KO99nZHMmpf3/Xiaa7y+VcxLWYU7cvAVlC9D2Yr
	qyuyk2QJHGjLrMkTvJd1sP/JD/nkXRk4IBjmXbFMdc6+cmBSQj0oCeg4w+6pkZKMctpS5nrub1f
	RchjwbxS4PkTKcD1BAbHB4dDlMqEko+Dl1st+cjhU0KdFLC4VfxTBZvP2CQmmsP1b7379m4zpSd
	7/6K1oyMvWm21LnaWSw8euZO6fQqGHgF/7Cedh9AUFAu3gazAtDkzReXUrSpfDmmeQW01McbsAA
	4w74YUUNI5E3Qd+Xs9CGAr0zpEAD/zYnvlEJ9uUM1EKmxuoQkQ4hxf19VKlvYFaE34/+BtxOswJ
	dgjPetXgaYMH3NwAplAJuUIIiysHBcKrJTNiNeWG4tK8uUeOKOLt9uIzg1sQ55MHcNCdoSJk/cD
	woshC2RQsczRE18F56UCvUTGO47Rb/69vhs31IB56TwI6cpYpJZm1TCAQE5uinVu0bGzNmfDlDD
	z1UvgKP4iSo3cOV7K7VGRNgsTSfwXm1LY1wdVkTntEiPX1uLqQfDghREvJe/QR2loKpap9WOTB5
	v5pQJXqPHxQvzvha3Q9oOWrmf8ez1nAv6HMcl2A==
X-Received: by 2002:a05:693c:6316:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-36ca42dbf31mr1612630eec.25.1793763654739;
        Tue, 03 Nov 2026 19:40:54 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:54 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:35 -0800
Subject: [PATCH v2 7/7] gpiolib: use bitmap_zalloc() for fastpath bitmaps
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
Message-Id: <20261103-b4-gpiolib-free-v2-7-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
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
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 47 +++++++++++++++++++++++++++++++++++++----------
 drivers/gpio/gpiolib.h |  2 +-
 2 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cf311c1a707c..bba4e5bb125f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5208,13 +5208,28 @@ static void gpiochip_free_hogs(struct gpio_chip *gc)
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
+	struct gpio_descs *descs __free(gpiod_put_array) = NULL;
 	struct gpio_array *array_info;
-	struct gpio_descs *descs;
 	size_t descs_size, alloc_size;
-	unsigned int bitmap_size;
+	unsigned int nbits;
 
 	/*
 	 * If pin hardware number of array member 0 is also 0, select
@@ -5224,25 +5239,36 @@ static struct gpio_descs *gpio_descs_alloc(unsigned int count, struct gpio_desc
 		return kzalloc_flex(*descs, desc, count);
 
 	descs_size = struct_size(descs, desc, count);
-	bitmap_size = BITS_TO_LONGS(max(gdev->ngpio, count));
-	alloc_size = descs_size + struct_size(array_info, invert_mask, 3 * bitmap_size);
+	alloc_size = descs_size + sizeof(*array_info);
 
 	descs = kzalloc(alloc_size, GFP_KERNEL);
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
@@ -5274,7 +5300,7 @@ static void gpio_descs_check_fastpath(struct gpio_descs *descs,
 		 * hardware number is different from its array index.
 		 */
 		if (bitmap_full(array_info->get_mask, idx)) {
-			descs->info = NULL;
+			gpio_descs_free_fastpath(descs);
 		} else {
 			__clear_bit(idx, array_info->get_mask);
 			__clear_bit(idx, array_info->set_mask);
@@ -5397,6 +5423,7 @@ void gpiod_put_array(struct gpio_descs *descs)
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
2.56.0.385.gac671c819a-goog

