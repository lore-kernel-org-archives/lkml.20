Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763650;
	b=bIXmy91vocfgY6Kemk09WXKW3dtj+ou3pI7l5Xij98CKwlGAcBS8foAs9IdSkcQ6NHUV
	 VvUIyO8i0C40SUuupFwTHyk+YakZ3xDuYJsfMWLRrQSOJoNwXNLjNXLcrz6A+1P/dGp5f
	 Y3ENmD3Yg3ng1G+Dola4FrjsQWXAMrpOiQvjyTwFbhPRBe+SscE0jRhNhsDmnEJpdHwlY
	 jxeU58E4/bsWQI+T1GyN9lHiP1ZEta27J9/dvAHhM9aWXNsdsgCNAXUi480ndlxwPYwdc
	 e4SPof+kUzluJ8sShveBv3P/s4usSQzSb0W2K3tUlzSNPb94JMAzgL1KCbOdyKY2V/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7tLpRU/GEaCK+ENwOIrn/UUBZtS7oPSYWzO0iXkGUew=;
	b=CVBZLveFte/MkMURbnhKi7wQqmwkUKAYJdngN7okvixVc9Bsr+wcXVEurJwURPVHSNS+
	 PRKftE0kP7SmqoUTwnp7kzUYbWi9+51QXwpLk1zPfk63AP70eCTYqsU926AQ1eRRKoT/Q
	 OU5U6KpUhbfCwrx68mA7tAo1QbGdJPpIYL3IuYU28IvGyuimBL973hDxNLwiOykLN/fPQ
	 mCXu6JU2/Wm3lkF+Z1rIyz5HaU68dNA14D9VCt4syLDA0Ch6yO3eyZbUFRS7ywsq0qMwT
	 o517IysrEQGSqW1b/jEWp7KwFZPsVFNltTxRPfKRBGMqhFs7XZ51oeENdADhboT8Wdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNShc140;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7C8606A333
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7C8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNShc140
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35c76e9614aso304233eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763649; x=1794368449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tLpRU/GEaCK+ENwOIrn/UUBZtS7oPSYWzO0iXkGUew=;
        b=TNShc140HF6GeM3l0UhgsC130gsMRbIFXc7y6L4MvnkM5SJtkw+yaI/Q5OyKn3JSK4
         6MytQRnySFW1OOlWm1A2EuQ40Ybog/6Kywh0hMP4GHARZbQD5AtOau9Oi+OFUXmq0Zh+
         GiOC/uaPmT6i15VzqLly7EDOLxW0tw9/BT3ZxcPHqNaiaceWZVi0Sz6LC2IBYb+6q9d2
         DpXJ/WLrim0XE4oMFRFjsEWL/BMAbMqXqE3zMzs8Sz/tB0AyHEinTCdG44PtZsBgqrFi
         Cl1QjE6awQ8D2bmYqNTH8Rlr6sZ4BhsHAyFGcwEIfrYDtlYflmrLcoPp8icIa3lGilgn
         SrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763649; x=1794368449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tLpRU/GEaCK+ENwOIrn/UUBZtS7oPSYWzO0iXkGUew=;
        b=P2gDaF2HNhknxs0hPA74jxvycmmsv3t6o0F3khKxZhexAsSqJ8tWjT1rNwiiSXcjpx
         Nmz4Xb8yFXx+YRLkn11LIS5KyPr22scfr2JVvxTp7d1G6zYx1/Q/QCXcnjDyKAi6ORK+
         tv+4N+9aBydBUbBUSW5kS16pSAZLt3Qcpn9XNGmfNITTZxHn9+e3wAAjt4Z96UnulNpG
         7zrTXRVpF+Ddzd9J9PghZkJl4kSx+ImklVzeIQ620Dl6bIzap6VewAkBT4Mvcuvf1RQd
         gvYbUm+SVfVP9cmAepT6p/h6JbKLjKgWBBfpnoaGSqQRMo56/WVg40PJp2i7akK0EOWH
         mjcA==
X-Forwarded-Encrypted: i=1; AKwUvByr6RojHA+OME6yqlDX6by58ixdfhIkhmMhrbbWIWZu2hw31fifxuxvPY62ofN9A8wVwOhteftRTdyXnBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rmGmZp4boPX9GfilIQne1BipNFB70579uy3CxRiJhn4mPQn2f
	IBd+hdsJgebLfUtQnbGrmeh7J7U+36NpPV1K0sbwwhuvIBSWZuuZTFj+
X-Gm-Gg: AYBFou0C68QxhoERdJmAwE6v5bSDK0Na0JOJl+7UnAacxTGjIxL7/smV65c09jTYqZk
	cqoGTz4ztxxVl+X6WB/XNkUDawc2OMgKNtIhUg05q9y8ctA/Wm8CY4hBAXm6+cTCIh/A+55V9la
	avCYY94JpHnuV/ZZ/zPqKdlfKKsxrq4MYApq3vFZ8POBwO65znaVk4XUnOGY/ta4vxuqsWAIo+J
	EOPS+nm1ZcasVRY7KW8cutEbvhJ9BmaJSVT+h9otM31VepTXItal+5772qo0AYv3W/wdboZD4aB
	CRbs0a25IlMsS722lqBs1VjCRYmRlCxCk1EToL+1IJh49A0YHHmzlZKLaGMjjlKiMJbWM8ibCk/
	iHPPuJCHpcyvWko+L5Q4dTflZSPWdX3NEf3EiinbcfvMi4pW7G58hrnVqUJIvRUNL3EFH6J5ht7
	p3UN1hQtACPUqFXl/i87Cbim/iNfYVJyL/o9mGmVPJjSEwZfHvkPQDvRG2Pn770DSJUgQ67G0qz
	j60UzwfAjSoeFzmi5HFx79tmx13sYNsLWuUGAFuhjk3GwSld/MwWsb7GCZLwNWbt125z/A8+2MW
	svhGE47DM+5hwlFnEC/RD3dUjpGEdTu5pU/wffoBQvSmUnE1MSncRdYcWnOrerbzTm0H7rm9DBr
	PU95XrNo64aeb1dOZ
X-Received: by 2002:a05:693c:20c4:20b0:36a:75aa:33bc with SMTP id 5a478bee46e88-36a75aa36f2mr8196445eec.24.1793763648908;
        Tue, 03 Nov 2026 19:40:48 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:48 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:31 -0800
Subject: [PATCH v2 3/7] gpiolib: of: return -ENOENT from of_gpio_count()
 stub
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
Message-Id: <20261103-b4-gpiolib-free-v2-3-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

gpiod_count() and its firmware backends are expected to return either a
positive number of GPIOs or a negative error code (-ENOENT) when no
GPIOs are assigned. However, the !CONFIG_OF_GPIO stub for
of_gpio_count() returns 0 instead of -ENOENT. This causes gpiod_count()
to skip the platform_gpio_count() fallback (which triggers when
count < 0) and erroneously return 0 to callers.

Change the stub to return -ENOENT to match the real of_gpio_count()
implementation and the other error-returning stubs in gpiolib-of.h.

Fixes: f626d6dfb709 ("gpio: of: Break out OF-only code")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 218cfe5bc4ac..9ca540d93f93 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -46,7 +46,7 @@ static inline bool of_gpiochip_instance_match(struct gpio_chip *gc,
 static inline int of_gpio_count(const struct fwnode_handle *fwnode,
 				const char *con_id)
 {
-	return 0;
+	return -ENOENT;
 }
 static inline int of_gpiochip_get_lflags(struct gpio_chip *chip,
 					 struct fwnode_reference_args *gpiospec,

-- 
2.56.0.385.gac671c819a-goog

