Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377971;
	b=Adbkmxy5kBG+UQC0CGUybS34B7JLxFDMU5O8ws5TIRaRoaMKJcVXKtI64hAQWy3YYhPv
	 0C4MPsaQqKop5mrWwoKK7fjF05XvXI7cNuXrN6JqT9jhh3TyzJpDSlh1EGN8to6avT2nC
	 MhzIXVkP+rbGa64RNLPqnpnTeVn90+hJyiHq81m416b2whbub5IUaAOHChgFFIAxP20ib
	 J7ERFn/1lPURi/qrG4jOkd40T9Mej9EhRMwUvprg//blJ8Bd8Gcg9H9PZG3B1CD/+GtC1
	 X3O0mCK1s9JpDSi/HiNfkKO+cRMcUpf0KHIFzQpHxFoQKTWewcO1Evs0nNeMrWNeREQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=M1SoM7Xac7RXZwO+FnicXP4wRxU5w10jY+RMIW4NnkA=;
	b=pDMy/4AJd+VBkHNeKx//V+fwt/sFcnb4pVvzWPZFNCOvmw1AYCTxCiGLUeSBQWTcQcv0
	 TshY1G3gfHH2wEecEsg3JqGzco0UTImko/knKi6a+L7a3xYws9fO9ghB8y8D0uFPX7QKe
	 6tNLi6QW+N9KY9t3VLxYx9QNrmVDkaN0eMc/xPynELs5rEZkAvfs9NrnIBQXDCSBFi3Qi
	 VzvVX2Ij0WJHbdcANhdHTDKSd8wo8wphXEVWH7kFQswHForN56g079V/BACT33+6hvZX7
	 up5wrNY+YSkoqHsytUnh0JfoTyjGTV7C6d15YbD2aKIYV5P8Qlcr7KVriqEr/roiNGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UhiUxfVV;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF1606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36CF1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UhiUxfVV
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so892568f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377969; x=1793982769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1SoM7Xac7RXZwO+FnicXP4wRxU5w10jY+RMIW4NnkA=;
        b=UhiUxfVViZ5IUIzdX30bgbH7bnfmS47mtCkiS1SsXq2cwi7tAd60t4KCAbLJj0lRi3
         2is2jDU1pcSDxlYa62ovzcyE30FMNzCiKMWOh2n48i55nCFOsqpKc7OMZXXMgaxYGErS
         BmYy/tVGiXyCkc34ZmQHijwRYgRDsqp3mY0t/VSiB1ja9LEh8WJYZPg9AGCoEAVTq1zC
         uYhyUdwxKyK7cFYJd8aex9efUxAGg1aGVmk+Wju5+NBPDdYrMEqPEbbPzXGsOM3CsfnL
         uYvQg9pFRPWjZr6uWNcuLl9dndq4BLYXoJrnhOo/tkfzss6/EvQcI1FncFtRPjJj3bz/
         VxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377969; x=1793982769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1SoM7Xac7RXZwO+FnicXP4wRxU5w10jY+RMIW4NnkA=;
        b=hHD+beCGGnuUSAZR9AUjTQHb1RpkcMZSt4kBD0NzRMedSR5CHmuOp5/+i26veiLfrZ
         njqMrJBNSscxx/145yuj02LyFajRJOJqS8kfHnwse6FbucZ+olJ8Es/ntnEDo6xjb0a1
         hpGO0AehUM5CVAmWOoSytQUlmUzOTGKFXWIgwZ5ugI7Jdw0WJ2OYahNBs1kiza+SB0G9
         Zp8B2Ls96FzkwLlstqmSsuYSZrgvCiIrrQJjkIqhes6Y1gDaQfinvAm5jLmNMXEIKZA4
         sqwiK91VCK9yf3hpzKolzDdb+5Lux8cxfgnvhObuSkGFuH1AM/vsBoxqlkwjbKY5n6Kh
         P4ew==
X-Forwarded-Encrypted: i=1; AKwUvBzdXJSv/WKlnxe9rdXAy4auJ43HTdQd4+loqJorJ+n7GjluHWsuwt6vg30iliWw1VsYLYe83MBRAluvBe4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJy9VuLGtxKgt58n8XeoRRky1VL7wIU6A32F8n8/lBP8KXH3Go0
	RFlP8Bo++CgbvezIEs1HSnXaCEF2gETF2Ihra6eXAdyXvHWI9O1mZ4IFymNfwBwDnXI=
X-Gm-Gg: AYBFou3Uccu4aYu2gUoQAa1HCdDm3u0GEvlQdXF3/CxDtzPa/CknDgH26F0D8r7bRu+
	JkIb7rBh4MNqWZ5hwxmdpPXs1ogJv+cTIsD+1K8u1A0R66gyj7USxihdrI8X2vn4mPKJMsSLVRj
	mTCUBfUqzvszlT8aCDWQi8bCdwLQ0YUJfNHzzMRzm2F/yziG6Wn6sJFC36OyaR/w7T74jxuPHKR
	EZC2UkpuyIGCyY09eqO2gld+TfnFULAFLSQZed/NFZNvSJjm+7FMfFMpEd0WZiLgScjtdKyT9DL
	zNbShRg4PJ025X8atPOzkOTNUMBSUQjPKNiyleGWQ+230OGwO343dwyzGeg4Wao3UDs9E9SADJU
	by8fvSmrCt6lyLKzIrSELtC+5zbq3jqo9WzLb7/LJiJVIwDbr9IsanxyNoZlTZ7j9swLGT7QKRC
	WqTiphlf/sDq+/lkpXSJrS2mj3t02uXFy7pOxgAymA/hdiwz7nVGW7yu1yHfg07LydwoqbGxc5X
	zk2y0d0bzEItC447n7a1K6jZpwxOLZ+fVoUo6amFb3Ta7xnIME27bsEJLNtgIGkO134es9t423R
	dhbU4RiMYkGt8X3xwDt13lXGQDEfmiviuORp8XsIQBe0jCKb
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr64716115e9.29.1793377968735;
        Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm45130975e9.0.2026.10.30.09.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 17:29:53 +0100
Subject: [PATCH 1/2] ASoC: meson: card: leave the device drvdata to the
 ASoC card
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
Message-Id: <20261030-meson-card-register-fixup-v1-1-6474985e94f6@baylibre.com>
References: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
In-Reply-To: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0RFe1Fr3NaxVtejZemaL7j5wb6r/Qt9kPR04MlhQsks=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq2bcGOyzGlzq7QHs65mvjjvKLVt7V/Jc+saPA+rS
 /KVXHh/uqOUhUGMi0FWTJGlhrta/J2k1pdZ03Vuw8xhZQIZwsDFKQAT+XKckeHfCw+1YwYd73yc
 ly6uTff6EMXxOD9pR6zZ/iXVhyIet/gwMsxx9l7/94VQvvGk7R2Kpz7UKYtXr1U+sp9nDpOxd6b
 6CwYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

snd_soc_register_card() sets the device drvdata to the card, so
meson_card_remove() gets the card, not the meson_card it expects. The
card is not the first member of meson_card, so the links are read from
the wrong place and remove() crashes on unbind or rmmod.

Get priv from the card and drop the platform_set_drvdata() call that
the card registration overrides.

Fixes: aa9c3b7273a5 ("ASoC: meson: axg: extract sound card utils")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index f2796dc84fa5..3cdc73b3fe8b 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -276,7 +276,6 @@ int meson_card_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, priv);
 	snd_soc_card_set_drvdata(&priv->card, priv);
 
 	priv->card.owner = THIS_MODULE;
@@ -324,7 +323,8 @@ EXPORT_SYMBOL_GPL(meson_card_probe);
 
 void meson_card_remove(struct platform_device *pdev)
 {
-	struct meson_card *priv = platform_get_drvdata(pdev);
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 
 	meson_card_clean_references(priv);
 }

-- 
2.53.0

