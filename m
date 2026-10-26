Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021396;
	b=h0UABc0L9AyDA55BWCnWi4v34yRihzRK4vGwqsShdkaVao9hkQqBB+cmdavCHqx394Sz
	 5K4RZysrQJkYJuZKOy6Y1sMWniXbiiVRwkvL4dqCWAWmELLfDv7+1d3YME+CJVN1+S9Nb
	 aJ9IYpDMg11Zt+uOCQ18mxKIGhVuHlTnBZADqdCmQF7BVoJQOUSOFaiTicY/3pru3B3tD
	 KaB7hDb6dJv7Y0FWwshEOcjUoUisYiAzxMbrN8t81JydMnc+DN7oIp+aB8YrpPFpSE0le
	 JYVBmi1GOOaCFJIYgol2f/O4lDk09jN+WBe61329E421JsAXHCvAsi4ROZAukWhzY5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iiDTsK3ygekIQj3ntqY+O/GObcC7NdXYPBilD7+mkLE=;
	b=LjBhPtHrse3jcSv9PcEdETbTrqp5hJJwebHuqDfO+wEcN0IAJ0HK8o9Eb61dHXFFyJWw
	 Lq4GeDf6BSm/5qpyEbvsx4eU5qwh+mYLSkDvKBLgD5IqoV7pKtLuFbjFC3XGDnEuRZ+WX
	 a2kL69gqlqnR0VvUCTNxfk8wA/F/rGxk10YymuTAuzEhg1P85SqLzpKnkF6YsU9Lpg7mA
	 XAsZV3KxZn9jV5O2+RVY/6YGY+SOaebVf4lEIINaaG39qQWPPdzYzc2awbc5SabbKvKc6
	 cVWxGl/5y0iZ1V4qEf/QKYBxE8zhA0vaP6t2sV585oRdwFcNtrmOBLiyh19xFAOoqww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O8oleLt9;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8D4606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8D4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O8oleLt9
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so19367125e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793021394; x=1793626194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiDTsK3ygekIQj3ntqY+O/GObcC7NdXYPBilD7+mkLE=;
        b=O8oleLt9bYddyfHzaqD8q3C4tm0T6idIiOvvhW69nLX6Dj5gGAbMKR4kYq6sjnOD0v
         d49O3poowtAaOeL2V29eJXro1a/JwAJSXcaEp2YwJPijKE9fjwgeCdd1HHhbGKknyTRr
         WJI9G2xkB3BOa7UwEt09UTNNhEQqloPU3krtZr85T33X/DMq3zgt0zrAHJO+16n3qq/T
         fpeTkdvq6RvZ6BV4fxEk2Ic4hXuOjFnBuqsRES6avDaPUIXsMT7DS5yOtC7H2xXilZ5U
         NCRaXrW8/E6hWVV8laBJ6vp2swIqh3xeoZdWm2cHPkVK64w6d8dRjWavPIo0MRmlVAK2
         17Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021394; x=1793626194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiDTsK3ygekIQj3ntqY+O/GObcC7NdXYPBilD7+mkLE=;
        b=TpLV4H0lfOH1fjVULBxJyZBzM5oVF0xEHFjebwUFVHRSZ0h4KWy2nyXaNFtpg9U7jU
         MXVnjGL4elQSA5pyoA2MXGEv02ZPVmmyKA6Vf4ZsuGg0edsD01ADnqajmZn9alnBiyxb
         HWO+8z3aNX99ZG2skq3ctdIZCcVUjbqeB/JKb37uA+2zhD/Xz2kRAQqmpJ3s/J1rq1FZ
         pxaYvOGilm9iDYMOpxuCJ/USua+9hlxRU0+q8b7AwHmkX4+Lha//plw7GxCRByfPxX3w
         h1Ue4MHM7JjGvqrim2Cbv3anl8QDGJYpPBOatbBD6B5i+01i6yyRsy7K5Fjkgqm/ayp8
         PeWg==
X-Forwarded-Encrypted: i=1; AKwUvBxy8rzdSsH4A2O/yeAGdrQoItku9Gbf/MD8eMjBiuvXxLYcko9yUry+FZ374olADWYasYXFveWxniD67JM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMFkn6O+1lagRcs6B9LwEJaX3mgMK0h0x9PvB5v4lpJWgZLPw5
	SMmsxUWM7VvM9/fAJ5QCXLEaPwyyGxi0bkjBFJTiILIK7fwD8VQTLLAg4ulZh0TyFkg=
X-Gm-Gg: AYBFou2rWT46RdzkWOxFq+PeadkfOU/qTLttksPrWW0B/FX+m9UBmJJ880rO4LPDqsn
	OEqws7F25y+ggXm11IBku+nkZyCaKzT9AEwpBAN+hnW8mxDUhaoh5u+IgD24d8B8APzeXcqnUOY
	M1f5oWwB3zavs4MbJSnwJ7dWEVM7AB9Gpmv0k+fvqUELJKUU/TKeGBEsZzNL7QlGnLVrY3tvdRN
	92eCuv7PMA/6zMEX4rbxHPZzvvg9Zyok8W3KiNKQCwq8hNhdL9UWHWEZF9MNcDtoRgUmBvPGE7T
	mPysWi0CF8FxNyPUD+y0fl5wWEwUAmU7+bdfqrpsYjZQM8n0ggpZZbjD87u0sPhPT4mER1tZlGA
	Wadvy9PRi68OoLL0uuH14vE746ibemYgnD5ku4mH1QNV7RuvekO9Dln4hHbp7+bZ3ZgdTAe1nkW
	if2mq2x0pwxjLIVIZT4QqSiaT1OPbK9WnoGDEWczI5nURYlKXBs/q2OrFab3Q7/uFg3WKYYauCG
	lQQQEpePNeEyaZXZp3BhKbYh9/UnWtCPoPZ9CCFVhHgd5k+Cv5eEiB+ciLaZVTUwnGNnD8VDNMn
	ZsCIMEga3VVqqaZQ/MTdaFH0YL67X/vJxmJm0usi4v2UjnXAG6GQFKRpv13BDmgIAhuBKJ+C
X-Received: by 2002:a05:600c:5307:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a35ac8bb56mr121212915e9.7.1793021394320;
        Mon, 26 Oct 2026 06:29:54 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm194507095e9.0.2026.10.26.06.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:29:53 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 26 Oct 2026 14:29:44 +0100
Subject: [PATCH 1/2] clk: meson: add the missing HDMI divider /4 alias
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
Message-Id: <20261026-upstream-clk-regmap-ro-divider-v1-1-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On GXL and G12A, HDMI PLL divider values 2 and 3 both select /4, but
only value 2 is listed in the tables. Reading value 3 therefore gives
an unknown divisor and an incorrect clock rate.

Add value 3 to both tables. This also avoids a division by zero when
the read-only rate-rounding helper uses the value read from hardware.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 3 ++-
 drivers/clk/meson/gxbb.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..b23b9514fa91 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -779,12 +779,13 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
 
 /*
  * G12/SM1 hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..8cb6404c0efd 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -350,12 +350,13 @@ static struct clk_regmap gxbb_hdmi_pll = {
 
 /*
  * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 

-- 
2.56.0

