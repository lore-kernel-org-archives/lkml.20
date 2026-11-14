Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637283;
	b=KzuKqPS3wKMMVH79hDHuVpxnNUOGYOZ58EIxOoyRm7p+2eHKgO5LriF2rHwNakP++GVq
	 A/YMsuWVEa6hpfqUcTKVpJBGlAXhBuRETosRcY0ZEZOzX0zy1D5kCMl7174oy/V3sCv4+
	 NJwMwq0OaRWnHFFKWSqk4EaLuOoHISoMvsv9wrR6967DpcLVCee+FTDm2yWVXaCwkeAia
	 E8mU/CzhiT9STBFFp2+yIYQkBLjqaF490QPb4sZwIQ7nNBxN9XJ4QtV5eD0FBtZ+HuSGf
	 p30iILo6fzCtEB1JsSJbOeGnXSjI9wtJ/CDa7mnNqHkV4lQBWWT1F+wPTmNKtKscTlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=abVHe5Yq8xpjvjNcf4nXdIo33DFUomEvkrSWJnINeGU=;
	b=J1KLpSp8bE3aqEKRTDUu6zzn8+u8/frfzk1bxtreF9jODydzV/T5a6knwvEneRMWXhXo
	 qGEkzbW1Thcbbn1nbpPVCNI/zXoZLz9O8Rv2etq+Fn/UrWqFyaqzpSDiqADatZBd6B758
	 cis8A2qCgXLVTZyGiDcJEJkhwJxIo1TafpwTUlLc717NuqyKrmu8JcpgGf8OrFBkMo7M4
	 jPRxfT3NRSrXVoBX+bhvLSWQVaHs3sXrAxFWdxXT3o/xBXKQGtYdt9X0LUek4ZJ61sQ2c
	 NxAuJii8PixXz6T9cG4eM0k2ujtm79fHh6PO/nB0nWnFiGxk0Qn57fzMRxWCB2jNNaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMrelVvG;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B99606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B99606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMrelVvG
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1269272c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637282; x=1795242082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=abVHe5Yq8xpjvjNcf4nXdIo33DFUomEvkrSWJnINeGU=;
        b=FMrelVvGEGRP9SrqMgasxA/KJYJ+/JFNu+5AbzinUjZAP+nbyaLR9aiDX+md5Sdrsd
         Wi8Xqw6tVdzsLFP3SVg/U73LtR3JsN6AIR/NFrraNGV3XkRlzseGQqVCjT795A0etIfb
         FTQRXG+bKfIVWPnI3VDSygtCKvvE+B1nPcBKLYUq4O08dmdgQqOiPU6eJADwLq2itgMH
         yunKcMQGgfTtCA3giaRuWaNJoOpdJ7I5fc7+NrB4YKBINky0c5rnrRZK8Iv5HMAEehUt
         P9YN4KIQrsPRoT5sAuc9Dw10TPCWZoHvt5h/lUamhw/DPXMtg4w0dMcdp69EN7/Q88HH
         GMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637282; x=1795242082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abVHe5Yq8xpjvjNcf4nXdIo33DFUomEvkrSWJnINeGU=;
        b=ZOtot7+hDoD8imLzUColK/8R+l3Z+9DfdpUUubSRWJXbK5iPjyGWVVwxBi5iqSTkbv
         ikBcl7W0OofudhGTZmZ8GbUXUB2dac6LsMj0GhGziLGZ7paN0r2QKeQx4cmNttLIRh1j
         TlPPq3Y3Hj4XQ/KAEhKdnC/AEMfsAC2FKMk9PLnIjUdVolms1WOFbyU9j9QAfFbIpT4T
         c/ROFiwmgrVZXXNsv3nTuRX53MT5gU84f1ifqtlv7ve/CFi299vEBZ+rL7IR/e2GZEzU
         e6jbHkGKClGOi1gBZ+amZnJj2Oo/C6lEIorZTSP7NeQ+9uTT4TP6G5vFUO4n1n/w1n6o
         zLvw==
X-Forwarded-Encrypted: i=1; AL+hErGSuNmwYS8wykKpg5DyPYUzd0YOH0T+lpA5L6jJvqVMBHo4ym0l0kj9b+IYcxeV0wgG1fGRpfZUl80Q8NI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z+FuqSxWsB3hbohcDMgXJpEQcNGfzROMqNho8TIxEDQCkPDoP
	rLUxrKrP7L6WOFM0UunaOIH1Zfch3WytV3CIF+xfAk1fCx9hnlKRWnUZ
X-Gm-Gg: AYBFou0VfDtZoNTmvyGvvJHh8QHQhem6P2trFJFGMjnsgYll4XXIGf7MHc6pA1um9Th
	Z2R3onGdoJDkkNx+s/b9spYbEz80FWlFl1ZPCVM/UTFr3YCIsRdbJEEjWBY5tFVdj7D2lB+vdvu
	FjvRoGIKJH/Kv5YbDLQL7lFrh9r/pWc3D5tETNsovXgG7b0i542LFRaRyumTN3IiHfTSwaW5e7C
	u54HMk4+U6TJ0J1UAe0fl/TxCXDvROrYLlcoV2zU5Z51hReZef5OfGothKvuW9sjk5j0QRz9JcL
	sibZ+9M/7EHKDjdqO5pV51SytT+dIBMATiqA4ODnu0M3p0vyY0I22Rf02T4WcEISB54R0hNp+UO
	cXs6wIGn9xi/8L9CqFZo9FjQ78MOpGSCVGLirpJtv7vbw5CgBqHSFGHQ/H76KbVLaZ3BpXjFDTG
	LbXG8P+Sf4txXArNsSauAz28jbhxS2mcEljPbKkErh3NsFafc65Cqe32W8J8PL89XmIeKy0tlzm
	I7M1bHtdTf70ucAigcKUN+jpfWSbGGydDdQU/hs/ZeISOx7segirg9T3UWyWvmeI4KPgdmAPSyA
	qPIzOGUGoKqKjpfPRITduld8UMNDj+GVZjLOQEHMigNTMkmoueg6VPbJj3ea0/Yz6vEWT9cgHi6
	WD/I0lw==
X-Received: by 2002:a05:7022:7e84:b0:1b2:6b17:28e6 with SMTP id a92af1059eb24-1b505b6c46fmr3635557c88.9.1794637282100;
        Fri, 13 Nov 2026 22:21:22 -0800 (PST)
Received: from kdev ([131.179.133.114])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d990sm15468809c88.4.2026.11.13.22.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:21:21 -0800 (PST)
From: Niloy Meharchandani <niloymeharchandani@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Niloy Meharchandani <niloymeharchandani@gmail.com>
Subject: [PATCH] staging: iio: frequency: ad9834: use devm_mutex_init()
Date: Fri, 13 Nov 2026 22:20:21 -0800
Message-ID: <20261114062021.142296-1-niloymeharchandani@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Initialize st->lock via devm_mutex_init() instead of mutex_init() in
ad9834_probe() and propagate any initialization error. Since ad9834
already manages its remaining resources with devm_* helpers and defines
no remove() callback, using devm_mutex_init() ensures proper mutex
cleanup on probe failure or device removal when CONFIG_DEBUG_MUTEXES is
enabled.

No functional change intended. Compile-tested only.

Signed-off-by: Niloy Meharchandani <niloymeharchandani@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 3d97502d5909..9cb1fcbcb1ba 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -412,7 +412,11 @@ static int ad9834_probe(struct spi_device *spi)
 	if (!indio_dev)
 		return -ENOMEM;
 	st = iio_priv(indio_dev);
-	mutex_init(&st->lock);
+
+	ret = devm_mutex_init(&spi->dev, &st->lock);
+	if (ret)
+		return ret;
+
 	st->mclk = devm_clk_get_enabled(&spi->dev, NULL);
 	if (IS_ERR(st->mclk))
 		return dev_err_probe(&spi->dev, PTR_ERR(st->mclk),
-- 
2.53.0

