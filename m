Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705991;
	b=aobN++8zxGil3w9y4B+AE5xW7QK8x10jeGl1HOc7ozndINxRZtJJGAs76YZILHDsHTau
	 wVo+n0ypKm9MzXDAMBUd+AecIQXcWIVN2TWi2vXDJNOSDXLUcPLOT0jbsY5UbIBDCCzyd
	 yP4ihiGT5MYhYNLe59bKkv1ExcsaxsAsQvw0dfKHEEBRd7PEB9AcZHCkGAgmlM4VopTea
	 WVcEflqOolL3TAbWQrM0VH/w+d67MG4EGtUrXP/iKyD8rdDKlOTwYWqptoNn/l23gYLvC
	 REdpqbI7x+AaAUmAQlsnvJVTR2pL3LXwZVX3lZGClFd8pd3Q3qeiL9HEniA+SHomETQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=uhtP9+xIJ+/btqQFJ1BUxvwX/N4DreYFh/wk1Ug1uXs=;
	b=cCP7XEP62C/gv46K5N+nWT/niMrcw/6s8MA9pxxX6SrRQVIeKp9zXriGcPzWy/tPk+PV
	 PhCiRQvfliXRNBYbhSiL1FUAMIi6psakjYayXL9c9o3n18CbHUApaqOCCeHjG5YF0qTq8
	 /LCTYy/VAwjXv2srzUrjaRSksBp/CwTaaMnhkN5V6PWcDPjXeoLTgIFUIM1yY5S9N0KnW
	 v0sYuvmaSmT9ky2CvMH+UHO5eWPFWfsU/SiyIoUMS3B8s9w7ApxtBgO8pi1tIwRt0CtRL
	 +VNjjP02m0/FwTatGjCusws89ylLEcBoihFW9AV4U1Q2b38sXDi7hPiYEX8f6Tvk3PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aWerPP2T;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB7860A260F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB7860A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aWerPP2T
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so310119c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705990; x=1793310790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhtP9+xIJ+/btqQFJ1BUxvwX/N4DreYFh/wk1Ug1uXs=;
        b=aWerPP2T1G+0YUzHsifQ4h8KCo9WhQHXTGTJ4UD6c+v3Lhry4A3IP5pWv1/Vio7CGm
         9GUpB+FNKU8YoKw1lZM46jz5aW3NOY2Y2TZqLh1Rs0SoEXPcY4Ve3xdhMD1InndCFxwj
         952qjMDy+GYlpu039Nhifaiobe3a5zmEWo+O/0nGv54ao1FoBWarTmucs1D+oTsJIgG6
         9fzEpPrSizRThwXS3yxNFdxTC3Uc+tvoJ3gWIu1kJwlrQwkNcl+3n8l4bllM2lMMCegx
         ryy17yn10IgIf/gmF1+XOQjlWEITcR0OGnzK9f7lYI6vKARRNdy3oEDqV6z8m/Q7WXY6
         VHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705990; x=1793310790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhtP9+xIJ+/btqQFJ1BUxvwX/N4DreYFh/wk1Ug1uXs=;
        b=s9009LUoBquBXdvp5rImRpHjmPE8HPUlvQXzjy0Z2frSr3cIShq6FnbpoiH7RP+21s
         vd+VWuZLSNiyjuu76189Bi/6EBfoeiQnbsp2p0e2i0wnaWR4rZRLjF1wPEomy6q9dTg+
         MRVM67p4I4hMyn7taKAZC14KGTJvGVB5lTQfu3Hketeb4EQuVJYg6pHig2jjTwpC964J
         JiUo/etz/WwOxbI5sHsCM0zZBqrjkwCbp0DCHse6b33Nk7SEyYhWTJMq6oEszwKt8rrx
         2E4BH+thKwem13Zs2NNsMAiuk2FpMxzE2udhTKgLVyQZQjyfNB//SpXlBdRbihTZ1pJD
         vT0A==
X-Forwarded-Encrypted: i=1; AKwUvBxv5unr+51RvuHCaiKgpHKhdO6dWzSe7ty7sOpiNvCyk1dz+R2TgYoCLHNQmZGWSY5R/kXx3VmZpLzneZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtS13zRNv2VlHRJi9+2Xf8J38PNB+HcrhiXUsktgIMd+aHdQJH
	6hw5aQkUGnJ2ooZegPiJ0zzR9QufcxkXtNmBn94Qa1JCC777FeCDkviY
X-Gm-Gg: AYBFou1RbKD+oPun1SdaLUBa7XIM6WJkxPdFAlkam88tFuf/90GlNWrG1/2C+XGszxK
	lGQGAc3mixwR6hkxlhIEE2xrzusFec/g5rlvCmwQd6FFT44FjkDnbURXgE7BeuLknZcZo7XAnK+
	xOkWveshxWVYwjl/EzvoM+iUXsfob/jtS/5rP9OlbyDfo2JNJ/eTVoqxzWmtnvnwtEHX2TDHiHG
	wnsF/6Hj9FEe+1kEtHFS2zpRwcuznInouHh1Kyi/3ct/sQFj08GZzAOX+OgQurvjzxdBhJg90B8
	ktIJt6eH1KSQAnJO5Y/TC3OHOur4eErHW2SqzBc1d7vyS3goGp1zNYYhkRTT9906J1gmVVqTkfN
	NwiHtk4KqR9rMQwf8N8vGB84LJAbgkrSEnALT5LtHaGHfBOt9bLovist9hp0/JoJKwmebwHkFdh
	Z2wXd40KGryoFzCkGNGKvaMq5g0+OmzXhgIUkEAExeBaAryP5MvlSNv40r//ZQuuObnGlnWzQyj
	fIaU0+M4GFJfaALiS1q6OLIvoesHuYtwHT0H2Qgk8av80yk9KH1qApSfiQIv9qxQSwRvz8B3uOc
	0EjpxlhyP0/IwOu4W2epg9uTorwhOBzZEddLEshlhXeskAn+c0pLB3JXS6H5XvXFXg==
X-Received: by 2002:a05:701b:42d3:10b0:182:6c6c:d876 with SMTP id a92af1059eb24-195982d48c3mr887162c88.8.1792705989671;
        Thu, 22 Oct 2026 14:53:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm1110403c88.19.2026.10.22.14.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:53:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 14:52:46 -0700
Subject: [PATCH v3 2/5] gpiolib: of: compile of_find_trigger_gpio()
 conditionally
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
Message-Id: <20261022-gpiolib-of-v3-2-42c3b6439fba@gmail.com>
References: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
In-Reply-To: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Compile of_find_trigger_gpio() and include its entry in the
of_find_gpio_quirks table only when CONFIG_LEDS_TRIGGER_GPIO is enabled,
and remove the redundant runtime check.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 03ce98baf68e..44799a4e9d97 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -651,6 +651,7 @@ static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO)
 /*
  * Trigger sources are special, they allow us to use any GPIO as a LED trigger
  * and have the name "trigger-sources" no matter which kind of phandle it is
@@ -664,9 +665,6 @@ static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
 {
 	struct gpio_desc *desc;
 
-	if (!IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO))
-		return ERR_PTR(-ENOENT);
-
 	if (!con_id || strcmp(con_id, "trigger-sources"))
 		return ERR_PTR(-ENOENT);
 
@@ -676,6 +674,7 @@ static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
 
 	return desc;
 }
+#endif
 
 
 typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
@@ -687,7 +686,9 @@ static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
 	of_find_mt2701_gpio,
 #endif
+#if IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO)
 	of_find_trigger_gpio,
+#endif
 	NULL
 };
 

-- 
2.56.0.257.gf7497c7d27-goog

