Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705997;
	b=r7u9DPzJAYNG9Q5rlFSMaqv30NXC7nQjwSyOL6ujdczeDklxnQ1b2P0Gl5qX0y5TOxTF
	 rwe6gZzQC4bkrgsio5TZXaSKx1EyIOrQ63gWF+k15KWlY14RlDiclACCuCAMtfwe0dae0
	 mNnRZLCpwWXmaq9psB12xJjf1y+WCMbfYyalztPIKB0jwfmzijK1nZ9Tn6fgCEVD2W2zK
	 SdIZ/YdM4neLai4hPP+1SpL1mqnM8XkZd2RUk6FIPikVJ/jNorQ79ZIjgrtTFjNOWLbzk
	 BVIIw6zEKtSSzxtRFxFTGnjf9hmDNKt4c5t/KMnYOHQx5NaWjLfkWZDveDf89lDrMQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+7xYBNBMdS31buKtvrCVWN4DltJtCF5Df1RCKstunLI=;
	b=yWnvYB+poHGjgxDH1ziJUDNbszHjpjaL9rm5cwJuLwQIeCv+4D/S9sF2IKxwWZUPLUu9
	 HOctDZ0VsMzeuT1NgoEiy0vhUgfD4jsZsQo/OFhoykd9l/5VSXf/OhH6KD2I8OJ2AzHe+
	 CvNn1kbYJBEjjplqWj/rj6W28yD6pMZWxCRhX95gF7r5leWIt7AD+KvoXbinnEcrBGSmS
	 S1J2Y7XO7iebslOPe0UyBkmUduIWuPLgE/tBbty25hd8RBlG65lJBSXIRjIHPcMGHAvq8
	 KtixRy9ZNybvvwkJUrbHyqPXmk1MKtewPDQndyTHmxfbkgm29BFIZBpmqNqXbXbIO2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g0wNJP9+;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED03E60A3808
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED03E60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g0wNJP9+
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-156cbe59622so239005c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705991; x=1793310791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7xYBNBMdS31buKtvrCVWN4DltJtCF5Df1RCKstunLI=;
        b=g0wNJP9+qMUoq4l7CC7ElHp6paJAwU3peNqvFYsSyx9iyJ0feSsN/a6/yoYX4rTFyt
         1p1RFtm79H9YGeZekYcpSnDgrioq87inFeQrcEng280PMg40zNuwfKO9Oi/CZzYOy3kc
         w+Wx7vKEIkCUwjdlWVWV9lySrd6tdmfIa0qGtnFyDM6e2/QH7Gkotni+SBK4gau/tQFN
         iZobf3y2WyAgUPyEoZA2nWcbiRPgLOGYGJXs4pa7IbBL9plXo9FunqukcMQJdCrX74Ko
         lKjMZTUQpV+C76zEM8b++2WtPSOO6O7y3/Q1Y6+CZE677S2UzOkzbsWsEaJMxhjKsixp
         Oy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705991; x=1793310791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+7xYBNBMdS31buKtvrCVWN4DltJtCF5Df1RCKstunLI=;
        b=GYD/GZFysWhC+xwJsMPMMD3i4533Gycp4mG6uw+uhC0qzE1qH4+J7X4IYgTv4G2xpE
         DWk1hGGv4WxiWE/k4VJVIn2Y5k7odyCPDab7jT2G2Oq7ajJ6hHnbqpunWemaRdBswAge
         zhr/Ve8wckdJ0Zw3rdXGIqRSR0cIGX1Xo8uAYcqLk6cAICUq9eYMnJKSWakEjSrYCAZ8
         vPEwniqqFea7xYpmtKiOnIydCALrEzeoG6Ty+esdxBhGgekAgkKF1ZET/b6SrjU2m1hx
         ynu0deSsGYbRrFT1u4RgKDkaoyyvpi59OiIx3+eWKCyZkgeNxDMsKVJwQsKSzvBufCm/
         k9jA==
X-Forwarded-Encrypted: i=1; AKwUvBzt5ioKVyLvwBnrAq3QVwSalYO5kjHDF5uJt00XYeUEwwoDdzG9unQ/7TjSOmuzxAaM5WrUVNBla36zshY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGPEW43m3rpqxAJEXDU33RhPNjKGNc3ELkuNgoBjr+764usrCp
	j64Z16ddTXKPCbOXx94+AUJPW8GD/IfQQ/alsvGbwZnZpYQsjMS8HqwMTccgPA==
X-Gm-Gg: AYBFou3O4ZxKyYaNIQMEC8KHjbAuzgqg8CMxaLAkHix0IdXnUM2JZLxU+42K5wdLucw
	BpzQM/RhvXEuYmhKAyNLTwKIIuD9JoWiXN3KbKjpaa2E/Ky9JjPVsyxmSIcUEwWaW4NiGaAwsHu
	drzb4k07z1nrKuZXYJjEnPfcL5Z6AFNJDLuiJF8Ga7Phwqf3FraSlwcd7YLS9byTfVQQ12tzfFr
	5PKsuM/oLsSK9p/57s0MXqEl0pXOUFWwq7ShVlNzGLH6V3oMbN9+zOC/DrZaS35kFcsxkxJyWaU
	DX27avP3Q21RWqZoLexDQ+E4531vIA91pCzVUPpLVN3dyfEBR6sF1G/zp/0U0R/gpg5Z8UflidU
	RX9aF6goh44P/eSQf1q29FalRN2KZ/ux71ELBuXyOOOFgL3faoxo7l+rpzZZFyG/+2aRhHc5+2m
	dxQgCC3ko5dZvLqk/usemlLWYPnG/UhC9WRDMGW0sfc5jivHbqswJvmkmOByBmu8ptOnwy3/KCl
	8Sef1NWKlP5Yrlf1ZQwzcM6yQF1DinwjC5mwOMfkipGSnYfI967mmwnZ0i9BaEaBq0x5XixvFgT
	0CJf4Nu9k5kCZpA65hxhlLdqFOYHipkRpQhkdY8dehfztOs0yHGdaSaNqdjtL+RFiw==
X-Received: by 2002:a05:701b:4244:10b0:144:fa58:95d8 with SMTP id a92af1059eb24-19599611181mr785699c88.27.1792705990921;
        Thu, 22 Oct 2026 14:53:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm1110403c88.19.2026.10.22.14.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:53:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 14:52:47 -0700
Subject: [PATCH v3 3/5] gpiolib: of: add a quirk for legacy name for
 TWL4030 external mute GPIO
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
Message-Id: <20261022-gpiolib-of-v3-3-42c3b6439fba@gmail.com>
References: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
In-Reply-To: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

The legacy property name specifying the external mute GPIO of the
TWL4030 audio codec is "ti,hs_extmute_gpio". Commit 178c169a30b0 ("ASoC:
codec: twl4030: Convert to GPIO descriptors") converted the driver to
the gpiod API, which expects property names ending with a "-gpios" or
"-gpio" suffix. Add a quirk to gpiolib so existing device trees using
"ti,hs_extmute_gpio" continue to work.

Note that a custom lookup helper is used because the compatible string
check is needed on the parent node ("ti,twl4030-audio") while the node
name itself ("codec") is also validated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 44799a4e9d97..424c02f81c20 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -676,6 +676,35 @@ static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_TWL4030)
+static struct gpio_desc *of_find_twl4030_gpio(struct device_node *np,
+					      const char *con_id,
+					      unsigned int idx,
+					      enum of_gpio_flags *of_flags)
+{
+	const char *legacy_id = "ti,hs_extmute_gpio";
+	struct gpio_desc *desc;
+
+	if (!con_id || strcmp(con_id, "ti,hs_extmute"))
+		return ERR_PTR(-ENOENT);
+
+	if (!of_node_name_eq(np, "codec"))
+		return ERR_PTR(-ENOENT);
+
+	struct device_node *parent __free(device_node) = of_get_parent(np);
+	if (!parent)
+		return ERR_PTR(-ENOENT);
+
+	if (!of_device_is_compatible(parent, "ti,twl4030-audio"))
+		return ERR_PTR(-ENOENT);
+
+	desc = of_get_named_gpiod_flags(np, legacy_id, idx, of_flags);
+	if (!gpiod_not_found(desc))
+		pr_info("%s is using legacy gpio name '%s' instead of '%s-gpios'\n",
+			of_node_full_name(np), legacy_id, con_id);
+	return desc;
+}
+#endif
 
 typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
 						const char *con_id,
@@ -688,6 +717,9 @@ static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 #endif
 #if IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO)
 	of_find_trigger_gpio,
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_TWL4030)
+	of_find_twl4030_gpio,
 #endif
 	NULL
 };

-- 
2.56.0.257.gf7497c7d27-goog

