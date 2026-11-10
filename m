Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347789;
	b=KTm9l7jahAdb6a4TmKUgaH4pRZuXT4JorZmRx99GCAU0xWJBXFaKxcBo+afoVtQ0yBAX
	 OMkqKvb4WS3c4QnovwLTesKy3WnSQ8uSNMbMfjYgSUJFMUTPKALF51tCY4n5GZwtB5HCm
	 c4zcjNx0sIfARyNyQCGebgQrvVcN/MMisDUH+H4e+Tiqxy0LreVjHweGiULJr7c/fBL0V
	 F/gw7QqjsLw4m77llxCLUx1Xnm6FEdE+YqLCDR1dePJvKucuyxkXj91pHUR3QtAZeSBLr
	 Jl/il+kImuogRWQvXPZuKvGdDFBImevTiy/wof98PRq0wyt/N+KLqhnRqa6S5x+u75g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=;
	b=PAdisoONVKeOv/FMvL5tv3u6XAtp66FNy8OtUVFZuXF+BX8WqmUtDoag2XlNxngtv9+/
	 dJJo39LczYrEWxWn2OPzYhDcyXMTTe5ASaE93VI3IPtIIKp6csM8JT3LKSFpAI/iR2i4N
	 YoDTu2q9abZTyT4cz8VxCNfgID9gDc9f2qkqlw4igbK30C4zQ2/jpKzSe6Vh54XakJLHb
	 bhKuz/VlT7s9hYizjogOmqVErn2SWq1NibCpzMpSnDMyTMfkNY25TNN2mUBwiU7UN7dXr
	 aTPom6ewxGO9mHV8+VrjkPZHIORtj7YrufjRF9MnoRSUGNwLI82E9cACkl1He8nX1Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pnyN8E3P;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE58606C983
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE58606C983
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pnyN8E3P
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214af2076so19251095e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347787; x=1794952587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=;
        b=pnyN8E3PkA3JkFJuwnMjAxb7avDoA+jvgosay72oDS5E739u/8Nolhdn7hsJyHLHZt
         yB/mTwG+qNhRwMnghUSO8KJQ9OHoX6u3H9Dksgnl9RbnaY5GMxnpN/W/TR9Z328EWZKQ
         E6C4KujBIr41uqM1iVoC3TqYd/org3gEc5ka67FQzPOu0ZHJH9S2zaVwQP4bkLMvuTJ9
         A8t5xumCbrGkvJXrC0Rxerwqkm/q4YG2VpMuctpfASHCJuyEsqg/yTLyTwVsdOmBjcQh
         yI6ciJq+lm0aPEhee48xszoD/mDTIsDBUXE7ird+tgMWmLjKQwrcxijU8rMbjH5kKPFt
         roFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347787; x=1794952587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=;
        b=Xqhdwy9gEdcu0MUPDvuZaq+jbq121fgIVbpJbou3V3p+rh60M4JRgalXWWuXg+G/NT
         N0z0ALUyu8OliChN1gPavqxzLRKPYmZE76f619ogwwDzQcSuHR6y1yCktLIEKOJvjd57
         8m8tpnV0ehafS0htjAP8sT2a59mPFJQuzlTIJb2B960pekkYmaNdl7x6bnlRtzdkTG8s
         kHlUOO+8bguhYYWgkqgrdstTD/hzKPNcAJx1TlI+SNm5+odo/Lv+HzxKtHBMC8mnTicV
         doW8Rurq4M1ESTqPKHjZuafP4xur2eohHq0O4dUUuohMrOm0Fal+f5uDhbfHgsQoqUWr
         yYkQ==
X-Forwarded-Encrypted: i=1; AL+hErGc+JDjucdgLNx1pljBzeBd0dqux5Pze5GQHUx6daGRVxYrkAZ36ruZuoyq6wH1yxrOY1gJJ2Z3M8kKh4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PK+SJfcAyP/4j9dpjWxnk5zV02eos4xQ3/6S+ENaxNJSc2sQ7
	RPbeQr0c4x+m/kLXkqJD0pib0z272Ds+9gWHO3carWa+608AM1kreNYWGUexdosypYY=
X-Gm-Gg: AYBFou2GL6j8ustJb8OjeB+XZnUu4TqpRJBlejMSAWRjhXvE9iBFLaM9IWKS2Qy3nhw
	l8ZZWHkbv85H/z2M1GEU+ItqLIHZTmlhn2yolz9myMBuVPE63K27QwKY8mfMcy0kvqjFFNwT2tu
	w50iFrtDxZ1Y2IcSTruyBQ5qrB8q0KR3oDlAXj5Yb08WdDqmHKMZvRQ864tKLZQxfkiGI9jxqDO
	99/U6sZ9NaebBy38R80rrlMVcey1Vy9XYEyBU6Y8uyv4Z14+T60QWqQvXr7UOYIPBRfksgqQPg9
	z569WlGRqBCOkCifVNqVnAeLCYYtUAuyBn2HDssGogcgafEuGc7zqacL+SnxJqqnULt/EY5DliM
	pKPJO4dmz0Ikk/S3vpQLqEusE2B+edvSs3/hfxGm4gsYzuyneQId4TpOSiZ35pV6FeiuJUS1saA
	YU/7on85GR+bDn0uOu10XgkfckL/kZQ0ptI73JFbTTMuYpXu6PBz+c4xgpl7S8dVFVp8W/jbNP6
	XcyWTImM7aqKoHV9VFF+WiO7Tw6gFD5S7aO7yi9TOwfnQHBYnidiD6sUK+Aa6OU3C2aGT68RBgQ
	eDwK6koktYeNUTLNYRBWVrmbUNX9bgCqpw==
X-Received: by 2002:a05:600c:83cf:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4ba0935cc7fmr6834225e9.11.1794347787385;
        Tue, 10 Nov 2026 13:56:27 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fe9357sm104638115e9.9.2026.11.10.13.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:26 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 15/20] mfd: Use named initializers for platform_device_id array
Date: Tue, 10 Nov 2026 22:54:40 +0100
Message-ID:  <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2610; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=GtAPN5RJoz25rnsaMIkCchglusimHC6pNuburCmgGRg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85LIi8QM3sjZgogwtug7vcVX0SJ3+X0vaVym+ L1HdZB2sE+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSyAAKCRCPgPtYfRL+ TmYhCACII9zsLdrs/XbNbp5plwyC1+ueOodgi90o8Ine575DtEGWJWFKxuOyV3MjOikDIUogOsG MzJmZ24/rTI7I4xwYZlkYEAqHwAGYW8EMjWiQpKt5XO8wsAFYIxFSL8LTY71t74mgHbWDhNI+8w 2TxE30D1nc84pn3rOgSAECQGKJdmFQ2ypL3quSOgUzff6KmjPytCYfR+0y/C9BOwmXcw28lKsDc mkicJ29/gVaaf9mRn6Qtjl2QU/WU4d3KO3rTHSnwNDd0A7kyku+SPqvzMsCcRe+ONI4Alw7KzMt c3E3M48lKlrj231S7RpIbK24VOHABh3tP5EwFKaeE7IzoPbd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Also drop a tailing comma after a list terminator to match the common
style for these device-id arrays.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++----
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index d5602b2f4a0e..8638fc8472f7 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1252,10 +1252,10 @@ static int ab8500_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id ab8500_id[] = {
-	{ "ab8500-core", AB8500_VERSION_AB8500 },
-	{ "ab8505-core", AB8500_VERSION_AB8505 },
-	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
-	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
+	{ .name = "ab8500-core", .driver_data = AB8500_VERSION_AB8500 },
+	{ .name = "ab8505-core", .driver_data = AB8500_VERSION_AB8505 },
+	{ .name = "ab9540-i2c", .driver_data = AB8500_VERSION_AB9540 },
+	{ .name = "ab8540-i2c", .driver_data = AB8500_VERSION_AB8540 },
 	{ }
 };
 
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 96aac158fd8b..3c7e7f1efd0f 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME },
+	{ .name = DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index e74936ac206f..385121867da5 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -435,8 +435,8 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397" },
-	{ },
+	{ .name = "mt6397" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
 
-- 
2.56.0.rc1

