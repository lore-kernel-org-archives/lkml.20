Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098255;
	b=3TZxNbxEUuLM8nXRn6UgQaeXrGXpRCXyk0zcBoptxocmTN8shIF6vZ3sw7I9YMtAy5Dj
	 fAEyDdTt1vke+6Us1trgy8XeFMLyI6RepCRgU9ZND6Eca4IP0pLr05jCrxG5TeH56QhCr
	 EwLJJ6HX6nY/XxUMBzC9Bl2ANxx+qOp3r7dY8xEA1qrvvsT+9zkRVQb7ismE2vkyq/smu
	 0bvFUO3mhQ4NJi9KXvNE6ebi7l7PsX4zQUuv5J4HCIQ4zMIXJjxTsYmAXA3jak9M3cMG7
	 uzmWyEDJzY0emUiVOlqCL6jgniLU2W+LBh3IIJcEs3PqOWMpKcY83N/cBQY7+d8+jjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
	b=ELytL8tkwG34X8LMo9wDFyNfBLPNc6ZFl+L4OdexsD/vILU32mlxv5GZ5HNietEOYmSj
	 enrkGuF6xSm4/ByVShqiJpU98ESTkVvcw/4ZCDibkHluDS0J31YYQQrEEza+qZ2W70pXe
	 OX5kGijb4bkbzgZ2PdUgoZYkd8fZGPJIsX8yukIFTsH1LEK2KBC6WPaSy6/aaKgs+J0+e
	 gs9uE+CQmTXcfZtCeaqP54UOKWtjDqK/onDa8w1/iaEEJ4X6ByBKFYmfqVJhvdBWNIC4s
	 daLQeMF0QvLviS3hcX+cQZ8UHtlNBbl1oVxvaIngdcXqeXHDWnRHW7i/at3+r6xBr/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Bhd4BbK2;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EE4606B7AA
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4EE4606B7AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Bhd4BbK2
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e4831c028so2313125f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098253; x=1793703053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
        b=Bhd4BbK2b9R2y7WiC3mCg4ICLaF0VpfovWzv5ch69CRux8xOhhqfERO0SISZ/4Lclr
         kJHwZhDvWYHJTtAQ2OaPJ83FXKcrwLmU+awxmWpyGZxPO9t1ifUpMH5CO8Yi9+2JdYTX
         6szs07bH9J0Eer2HUBAFOrx+6aqgNMarH1KT5o7b7IjQal2uB+XVrYpYUlJZl+6aLwo1
         PP+etqK9D9hyN8NdW74Qg7s1pF5J1QFuSOH8pEFHSlY4EFHxowsrlT55o0LfZbW90MTa
         SGIovh1pvg+SMu2NXNF3cuCVK6Lxqx82yUIbhtky1FXFntTA0eoYPzw6nwCuRgHNZtSR
         V7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098253; x=1793703053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
        b=wx19wDNcUWHoNbSYhbVAa2cAA+60CYuAoSV8Ju3m/QD8Wwb66MvdGQM89nPGoJoM/N
         GliSap7YDo15qaQ40nB4ADbRdzi573MO9rb3STw1ZKQd+6amS0LoNh6sE9HpZL3S8Yev
         BR2bbFxWils5gBrLmrmAhNkJf4Y1GJyiOz0ubKfp0pEdYaaF1wRYLoJxaY+ZFgJl/K1w
         vflQdngJvd8jGqOlQhyeCERukcfDqLdYwhCbZ/Mc13e7FfC0ftvEZwc3UACO33jtp71a
         DS8sz+PMMfsxM6EGhfQ2eVLcPEgFL+vbRS3Q0+vLQr4vr+C5Qe0oRab5uHAL7u77ekBs
         pHSQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3GKKaMpb5Ffj88Kj7ygyp6jGnRSzBfDeYLfg/Y0KHVWRoeGBWUFm85CQatCvV4bvppVnpnfhFL+1hGWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBXyiHJZnxKk+Q2N1AS/WV1n06Fy45X9dxMiVfph4XRX2LEECW
	xspKGNvotiWcfSx7I0Uzarzh3IHsIrT21KgWkx7eKGnjB10tG5zh0OIzESEzCNhAMxpamNAEsup
	RAAhvWic=
X-Gm-Gg: AYBFou2IgYWa0nClso8nplVi9SZ9jU7c8bFPUrejJcYhmzb8ou1sbH4vXqhm8vvl2nL
	0lQ2rcB0cVh3zNt234lj05IN9Jthtd8JF6JYz9DDlNLPZCtvaJQJDrWGLJRP2DK/U2xLmEb2liw
	h1yEHT6yRx4reT/9jTNQuJcveSjOvlZhQHxcVk0Cz2bMGLHRi5VYPgfVJ8nSuV27UmlzYd9v/QE
	mpuzPM3PjfFLhDW6g3q1x7UoYmBcxtQ/iA8tmokjJg8CFTsDEXQ9VPQfLH59EsjGOjNgvnm4glx
	I7EUldcPR9xa8lGPQAZ8Gpf98zFy5UN2U9++tQ//OlB+aAJq/Depv1eM4i3Rs5Xej6bMSq/s++d
	oHUjHV+wKhv/q9v7GdL0QASw1nXsjygbtI7spp407OlF5fc0A32yVyk+r9y6cdmVnPlfRcfMpcY
	Ki+HNacFPD5ShV3ZrIglSSI4w7PdN5jEYd1nq8lGZWbPqRnUp7TQr6WOqPHw+vXJHT20/Q3KZeJ
	xNPTZ3A2MdJzA5hTJtl1jBHkUe8ugS18Pm4tG/PYT1Dqs3XerjBZzV0ahHzAvKUkDc06uEsxIxB
	IHME/0y2h9sbekf6tscJIEed17B3fcio8XbpxC6IGnX23tb5fNPJM1fU7p5uPHTy
X-Received: by 2002:adf:e003:0:10b0:48e:370f:5aa8 with SMTP id ffacd0b85a97d-48e3eb2bcbbmr13271784f8f.2.1793098253028;
        Tue, 27 Oct 2026 03:50:53 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecd8c05sm28466124f8f.49.2026.10.27.03.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:52 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 20/23] gpio: max77620: Unify style of platform_device_id array
Date: Tue, 27 Oct 2026 11:48:57 +0100
Message-ID:  <634c0412c9d369179afae9a32b1c879813a8eac3.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=PwZq6cSexLoeh84nIBT27WIhYIRtJCbiT1iCV8GXeTE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHYfiE1/fm0dv123hRuSJEpZJd9swyYusDzH JadLd/A7kSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCB2AAKCRCPgPtYfRL+ TtRYB/wK9s8cgLN7UO/tLGIQ0DRnQgBx7MKgIGU8wlGupz9xOZspihJutU36MtPgU5abd6tUXmO vveYdPtbS9kBX0Z41cl7oxnuW5vRZkOr/q03nhi3FoPRbPKRklmjxinE/VBXGYylqDWSBRurill KD+0DlRrdbOVWwTvTwxejEeLe5697AXJFGIZ0kWBX63IX5cP9i5jpSK20SYGGqhtC10Ij95VDW0 H37Lk3o67zcLbHztVp4r1pD/G7UxrEiNYzOvyN6UZmkluE/OnJr+sPqvXbz5bgHZKGqNhirbmpg 6vNwxanliBGElAU3kXRhhwsKmPvzb10zPOvR/PGY5Xe/PmrU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the platform_device_id array to conform to the most used
and generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the single offender accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max77620.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 2bf3b55a61b5..99ac7ffb650b 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -365,8 +365,8 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77620_gpio_devtype[] = {
-	{ .name = "max77620-gpio", },
-	{ .name = "max20024-gpio", },
+	{ .name = "max77620-gpio" },
+	{ .name = "max20024-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77620_gpio_devtype);
-- 
2.56.0.rc1

