Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946630;
	b=u4f15IPK/+RChPOHzy+Kiu/qNl3XQvKenCvmfge4nMkDcCF8BLLDBi0GxH21v1pqqBuf
	 +uoIds7JhxL8cL8YQZTU85Wcw2HUsadgNVuOh+++4Q2vS+EzLMZOz3NLn16EP9TmFRfVP
	 mkYiC7q4Od1PrUsEzM6ocu01wC8aEFiX2Q3OLe5ud7yOPhBjWErihizvjRYOGFeaRs5rt
	 0jyB3egL0Wgo3o5t0lpdjeoevCXEJyhIt+VZtWSTYOLa6U/7mw/8h++beNYI5Ur/mOMwX
	 X0QR6znxfDrrKp3/e3M0HaFcm4puJdtO+9neVhuKWks6+vVczcI+tJuqTBy1UhZ4Vnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nAL496ri9VKdSWQizRCEdUiIjbSCELQxYIrRBVTfu5s=;
	b=obER5c7edePmwtjDXyY6IXyrQH05mZbwXVUJZXgKQE2p6PdjHN9Tf2j49AD2LZ+VMNXc
	 /5vytDv8VoAOraaf9OTg+DUMi/tfkSRFPbiasghB9MJT9A/1MTBaVWyU+gwe16Q8Rtomj
	 EFqQTpHJ9sPK79DlN1E2kNp8m3oF1mkYKCS3YQjBHtKYpsmLPC0t3/kyYkSNUJqk0/diG
	 3D43Qo/S04k6sb7P3xcDFPFfKjvullbKaBXsG2SctnnPmuxyl3OOyQ+tUigAH7IechNEF
	 csRpUwelPJRJXyToalbDrolI7GPHsuz96dB64lxlDJtEmy+Q7VoBcxkaUCFZYDjBL6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nOInwOCq;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2C8606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2C8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nOInwOCq
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so746688c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946629; x=1794551429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAL496ri9VKdSWQizRCEdUiIjbSCELQxYIrRBVTfu5s=;
        b=nOInwOCqxsijnO9GyE7LMiIoj/e36C3BUOX+c8uRoGsxBIx3DyKpXZ8NuF0v4+8wIR
         fCfxStUwZV9xfKUlezs91+r7n+SQ5GGoZLDiXJkMd4sCqj61/JjnrxAOnKkJmCrc6acw
         4Wwh+A85Suybe09PK2RKn+AyGCvmmeN4NpH+F3vuD7qLLEyWimihK9u0PpwNPipP/HVD
         4kuibfYI+w1Bbw/DOcavOiXo/tPJLyMrZxWsYKlqfpAvsF/2IUAuGR0s/0Y0VA9ofpcR
         AYDMLUX3PqpPztr71br9K4tnyBg4k8yl2SYFn1mUYxKZjC6KcAwHQJff6ZAuGzmUZIA2
         8MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946629; x=1794551429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAL496ri9VKdSWQizRCEdUiIjbSCELQxYIrRBVTfu5s=;
        b=f0UUomSbrtOzCYcWMG1chj9iBBPMl+UcsVK/3+V9Rl6wroETVeXQTfy0QFgV+bTYxw
         VOci6UvhgUV26Uf9NRFRiSOVqCbymZPFp5DrLFjAitvdETeO1MXd5rpu5UXUSqdihlbX
         kWdA0QLNza0Ru16EN5Vb368LCqgUmu4zT7wwyS8dVF4iWASPSDnrFVrhLDOKq0bL//4p
         CnJQ/JvyChnDM7YvDnr6o8eO3uETkc8i9oZHuBFO2BUzQKuN4Fxbi1vDr24wwOMMUH75
         4SONXO9F7MQ4zmIAB/aIDc1Ypa3EjkD2YwcRajt2QrgAHvXAZA5sv+OhIF8ZBB4m88V/
         H2bA==
X-Forwarded-Encrypted: i=1; AKwUvBwLJw/M7ZBwq30qOAhua1jkHrkj3A4Bx/oleKRyphhOr/ptt9r8YQAHbgySHtufD1VE3jJpvTZ6qAuQGm4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ux0nZxqnCEZg31C7hfLWrWPVuiSQQEGc04J0aZDJU8tLO3gsm
	HBPauuvKpP1j4XVQSC0OC8brzFLfrMjV8ngjhqYIal7a5DL0xhLxlHyM
X-Gm-Gg: AYBFou0y5W9jRsb4gELKILsB4K+dQl8xvhkEZ3GvdjHNBzLj94aAdf/Wfdkzoqg2FTL
	n1BCtva17tCG7MPMmGA/Q4an2fanhWqjHgDfBmQcserx6y1ml9Zo+4dL1zq6cW+eViriwpXPqQH
	TrOfQy0uUXZV+MJzCacEyDZ7ttogH+vCyA6ZrBOvbOxYket0hNrxX40dsgFZjLcYcjIPUJoHPiY
	IkqK4yoVVNEP5Nw8zV4f3/QFs+pk5UilQn5n6AraQt0HLopiyTlig9n8BVDDcVSqlbZqSMaJQJP
	ZTtayIE+0oMrsPyhLJ+lVoUI6fFZH1kGvd4JfgtCZNYBEyFJqlpyC3GUh72MDjNT2OjgKEGz3Go
	zeFX9hinWrnIChz409QE6+fMw1590Xs2RP2+SCr7SztTWm90kW1nrfg39pvH4f+7gC7GMb8nrnw
	XRc/IqxEbh/vIX3BI80CVrNxwK4cz6XPgN1z2yMxMKGX60P3L5ttoFRHCHWOP6TdrcH22ms3EjW
	HatsyAh43MuvwvVrcFROySaoxWdpAWcFBqdmt1Cc1SH9w9JeNN043m09QMLWVv1OVqickWZl+2B
	uo3IsGgxUJRuRB5pfBe7mc8OG9g0bICAO4jKBmk1QCeOM8zwN6VjZYFsre+pcWIPPOk6vxQsXWa
	s1PhpzQNPk6zH2HD7qw==
X-Received: by 2002:a05:701b:4647:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b25d31faaamr1677445c88.21.1793946628976;
        Thu, 05 Nov 2026 22:30:28 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:28 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:19 -0800
Subject: [PATCH v3 5/8] gpiolib: use __free(gpiod_put_array) in
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
Message-Id: <20261105-b4-gpiolib-free-v3-5-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

Switch to using __free(gpiod_put_array) scope-based cleanup facility
in gpiod_get_array(), simplifying error unwinding and eliminating manual
gpiod_put_array() calls.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e095aaef0a09..1da91e52e51c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5227,28 +5227,23 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 						enum gpiod_flags flags)
 {
 	struct gpio_desc *desc;
-	struct gpio_descs *descs;
 	struct gpio_device *gdev;
 	struct gpio_array *array_info = NULL;
 	int count, bitmap_size;
 	unsigned long dflags;
-	size_t descs_size;
 
 	count = gpiod_count(dev, con_id);
 	if (count < 0)
 		return ERR_PTR(count);
 
-	descs_size = struct_size(descs, desc, count);
-	descs = kzalloc(descs_size, GFP_KERNEL);
+	struct gpio_descs *descs __free(gpiod_put_array) = kzalloc_flex(*descs, desc, count);
 	if (!descs)
 		return ERR_PTR(-ENOMEM);
 
 	for (int i = 0; i < count; i++) {
 		desc = gpiod_get_index(dev, con_id, i, flags);
-		if (IS_ERR(desc)) {
-			gpiod_put_array(descs);
+		if (IS_ERR(desc))
 			return ERR_CAST(desc);
-		}
 
 		descs->desc[descs->ndescs++] = desc;
 
@@ -5258,6 +5253,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 * its chip as a candidate for fast bitmap processing path.
 		 */
 		if (i == 0 && gpiod_hwgpio(desc) == 0) {
+			size_t descs_size = struct_size(descs, desc, count);
 			struct gpio_descs *array;
 
 			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
@@ -5266,10 +5262,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array = krealloc(descs, descs_size +
 					 struct_size(array_info, invert_mask, 3 * bitmap_size),
 					 GFP_KERNEL | __GFP_ZERO);
-			if (!array) {
-				gpiod_put_array(descs);
+			if (!array)
 				return ERR_PTR(-ENOMEM);
-			}
 
 			descs = array;
 
@@ -5330,7 +5324,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array_info->gdev->label, array_info->size,
 			*array_info->get_mask, *array_info->set_mask,
 			*array_info->invert_mask);
-	return descs;
+	return_ptr(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_array);
 

-- 
2.56.0.506.g506a7eabc5-goog

