Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032171;
	b=orcmEUtuxLKUverhiB4rCE+SUcvVf86RSBpoyKwKNExuN0gWgJQolrMWLK0lyMFxc9jo
	 habR3KZd/avrC8AdfRI34qmc4KOOLeyxULRzV7LnXouTBpzsb84I5PBpPPMTXzII5jhN/
	 ZUTkPaN95oN3T2Pm2eyqvONbZ3WwFbaC9Pt7cS89EjYIJO8h+pWs6Sips44tiJLtRDD/8
	 FZxXxyvhqLWTNJn4emMCPJLXNsFWImQQN6SjEc4xAlTjMYDzpZL2sf7f1JOuGrPZSKmtb
	 hNvzZaTGqvVsnCIsjrDQRSNHt03zVeLbqHk07JQTjcIbhwSIdnCSKBl9hPQiiy7h6Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
	b=hilIc/EBy461CXdjTnisfT51o58q/ta1bhbe9+WX71ukGmFdYsWpPDZdNtddS9qv3XS6
	 dFVagCSFF0d1Vjv3xTILi1kwecaCWTtXA1fhHI4IEb81a5kf8Gru7ND3kMb4ZJNdyhprc
	 11M80vV+kWRCSi42SarN9BCmySg3m4AZWIxK6UJpp7XtccGWWZjStQTBj6CMZQD7XxARs
	 ZrPJF8RkNgJ2B3QxJWij1KvPevAKPXGjQLzkQjDosTJX9hAXQ7cQTYsaoXHLhf1ZSOz0I
	 L9ia/7Nb4lKHU1TxsOcb+ieggef9i3wOcRvzYhDiyqFI+t+GDOYVOinqxBeQl5GZigQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UFvdN46h;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD5A606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD5A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UFvdN46h
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11684515e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032169; x=1793636969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
        b=UFvdN46h6VM2vLA7R3cAPPK922u9tSe8C295U9Alqm8e4DsJtko9nSYuvcn4PyXkVb
         bripretixYg8PzKsEWrod7Q5w6I6B/qaWHytJZf/6OjOEs32KYdyHheMIo/M9/preWIV
         HJggu63BVDLzDPNMGF/sJ0fo5jcnLkQB9xrmIZJrLg9IPYbqW4o/6whBKpoX+K8UTsm9
         CCYqMaVhrC8+DKwudmoMyu/r5JL1FT9ybYW8J4zncUFNqhgWG/K4ORaQnEDaRzayUOp+
         PCcbUGO1LC5uMXL9ZdVBRhdiJEEKnf8vWJZmiFa0CgifpihVg4JdHF4im8bGbsEj4iE4
         kEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032169; x=1793636969;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
        b=W/K0d69is/lnjovFaHKdq9ljefU4JcyrHbhigfJYZYw6AO4fQcALkQDg6Ey3mhATY6
         5r1ntPLrTlLhq+4VYCUUujWsxPdjDr//44DvXDqXJLcQ+zbcKqfbuLPrksT/8nR+Kozy
         hPGtXZj+Wdc9/sWZldSVkx6A4cm4GZd9MTRLnBFJ5MnHUee8NiUKltiRFVvRdb1oUQEL
         IJJeCPgE9V9W8JPKAZY2JHlJZFR0ha9SMyK70Idford9k5FFyxjqz3C/aRoqk+/jTfBs
         ZA1mazdpV5xOh55/BUNSsNw1U/yDyPkIPhcL3gL8EwmArnoWmbSz6/YCc8YeeAlUp9pT
         xVLw==
X-Forwarded-Encrypted: i=1; AKwUvBy6sT/G7Fm9sVwcfBWPWYdEHW0+hrB280dvJltlMe0MGxaAsqQc7xheYtQUSZvovBM6PGKalQjhvuSeg/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmPrxcbPdM41vv6vr21JXRXwoMilyohkPU9UG6KwExqXghAbip
	vr793qhRgWnlO0YffGdh/q1BjHPodOxCH7a0VHRqpPeyhzRhP1+o7a/2lmxrcF8/GS0=
X-Gm-Gg: AYBFou2203PKyXLTq/DD6q7z8RQG9RmEDBywDasKgtVsxVfL7tbwYhaEY6WHUApJVXR
	MF6ZgOuDxySYi5YvKhyGOIPK3d9t24ZCKcOZ1OhrlytXkY6ubz/m6mv5aIGWPNGKpewxfmVdLIm
	WQBbQJOzPvPGvsn7SEvA41AL04odYHYDyA6qbwRAbUq0NXQFJDUcRFYjUQ+osruk02wkfijTpMX
	lssGg1cZ4l9+HaPTqd0qiWfY93+Is0Z4YfOWeaHY76rB5OJLTE9iDQJ+lFgtiC+6QgIJTLStOuV
	R/ebGZPkK5n3QEb8S8N0nLfPD0OJUm9XMS1T687YY8+MkefLHAvcDgf8ERFUnppLzXrK5z5AkAy
	GglPezkJ8ZAeoyuhN+Nmgf567Alckpct2+Rs4W0rdmbAcbFJUwCyEsP8EE+AudJj3A7YqZESExi
	Rs8rSl3jYXrWusN4a5ci3rKgJay3N4tAZYt+NLbSTwfRHq7ZHGRRZBqSTGbyh9vD0XQFVTFeSuN
	D1+RaWJ+vNAwWGC5MxYtXzK0hOf14Bu6N4YczA/miDTxC4wWhImWscnY+IoVuDAk8y48fFMttow
	AQyCNHNIwJ3w1tEoY9O0sSvL5IRZoEvYvK83AbuGauU=
X-Received: by 2002:a05:600c:474a:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a35ac91f2amr145516315e9.16.1793032169353;
        Mon, 26 Oct 2026 09:29:29 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebcb851sm14919875f8f.26.2026.10.26.09.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/22] gpio: max7301: Drop unused assignment of spi_device_id driver data
Date: Mon, 26 Oct 2026 17:28:15 +0100
Message-ID:  <0f73136ac61cd1ef0a00bf074e3db92f49e79a02.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=N1ag9qLsPodh6SZJ2X6l/iSN9O9FLF3gpdlS+1pEOA4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+mt5/hwLD/cV+XWUtgyFEIrN8A9KC/E0J/G JWLGTDsDD+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/pgAKCRCPgPtYfRL+ TqwtB/43N8psTSJkoaY6Lpg/IFwoExOM+XhsEJkZNx1LrfcROHleJ0xf+JNaa78FJXkm4GFpiOu aNkIhfZH+1LG7PdFr879gBb6Nqjpr3RlLgy+kmppercgVINS9keN/L2BBqmIZuBY8gcVXIMXQ19 fRIA4J0bD6QO+l4Iuk0pBjk464GoCZoyXjQZjdFYitFUCRRf7raFgs3DCSWn4LxvFFLFyWukIbs HgDLO4BsLiVl0yyOxAXaUkUrLgtrd4ENcudGX4Q5w6Pl1zBWOhckuf0PHZqBs7y8fYxXz0Jwm86 fFVoOw9R7l9PIegHiCg0Kw9MOdawsQrcfuw4opmsnmMLavA8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
spi_device_id to zero without relying on that value. Drop this unused
assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max7301.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index 11813f41d460..c8bf6a9c3de0 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -70,7 +70,7 @@ static void max7301_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id max7301_id[] = {
-	{ "max7301", 0 },
+	{ "max7301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max7301_id);
-- 
2.56.0.rc1

