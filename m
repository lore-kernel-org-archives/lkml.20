Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397785;
	b=0R1247nuZ8okbEIC/96RIb5dZCSrUXaonkcx/V/Vpzfw9z2woyrMbsMRPy4a82W90O21
	 OeSpKd5mGCo51NHrgeFO/AgNqyYYKSGE7Ql5TbhMKKGAX85WoV9Yda2sZnUaU2uPfgJsW
	 JKT9pTK0g5xGFcTYCakwpUp25Q/SgCBgFeTlogfe7p1ni5DyK5/P0+gL19gM03iNn9iMa
	 JwPtAOBgTS6NdM7AaE/6DGBwEsKwJMK1YSD1PrDkN1sOQvzsPeL1u8c67SWUlzdwNUfUf
	 AK4qXwe6my2LGqJrB+UP9sM0O5kTlSzICCYjU8MUsLe57VcsQhUE96qSj2AffhK7dJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jO0VjvUkoXke5VYihliU8dcf5tAfDK0cqhQxSUbr4I4=;
	b=5GuepbIZcB7mixOAtw2Lxx4Q/w8734Rg2LYCnNnwDqkTn0dCPP/WuB8YO0qQzGZeYDBr
	 V5lllhSdQFWMw98yc1I8RlOP3w/e+0hyv359t/AjyTNdQ66e+nb2FhFeXGmwtoAMZwyRb
	 xWtKezB3NmyA3xpjeyolpeBNueKqsGML2sYU77OP+iQWDdsP8mIhHzpM7MeLlbMo+mDRk
	 n+6j+z0kngHIF1onKtXwD4pqlw6lZxmHZ1b7j3EXx6mkDErpOI+hQ6+vlL2OmZvKM142d
	 ZpEA5DyfzAzfB5HIvWJFJk1HCTbn37QzlRPNlr/ndfsgZxe7Pnwv2isIU1a4vlakv2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CI5THnCx;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA42606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AA42606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CI5THnCx
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2634435f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794397784; x=1795002584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jO0VjvUkoXke5VYihliU8dcf5tAfDK0cqhQxSUbr4I4=;
        b=CI5THnCx9XHPclhLPwF+qhxFNve7iO55qXN6ZeydaXGA7rrp4RHQPgx0ZTCGaL22CU
         dTjyYelltz9wk6HtVEIsn0OA2ruDBC+XDnxoyg6vRxET9ZH8ILgBrGyWrguecPkxKzvD
         bL9JlXWROMq4CDaKThyGwLsg98zk2F4HwpNvFXyhpFp3tAWBX7mPogFw3ubbn2YP8qyI
         kaQaMrU9ztB55Zt01SyeeF0qi7IteQgWldgKVTV1l7aZ5+dKVGsWtDRxSNBMccgf6C6L
         LOcmjz//kyFCQtn/RrO9BJbeLVYTPofalS02+CFzdRgbwCPRsbKk4yBw7WfdOHG0E3Ps
         crkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397784; x=1795002584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jO0VjvUkoXke5VYihliU8dcf5tAfDK0cqhQxSUbr4I4=;
        b=TZ5WUInhIVxyckK+kq8jn/IwSdeURFpqOOIGmUXxfokpw/mZlwU+dMy4jVEA5jGck9
         HLWdy5MiyBsBFHSBtuFkGUaaIeTq4VKPmHQ3kEzp+p8OuJp5ZPtFouTCVN8LjXs+GGJl
         d19lIHhYP3KD3ktEE3y+Xs2QbtJOpAjDuNPannsZMnwnQeBR+l9ng+plFgdYwfchCCTq
         B1qARH0286XCrfK+arMQb8hZUcUUQz6fMWfWTEJTad7DHR9h4qcIqeFQDa11DDSoLF8b
         3mnMW36BffwjI0F56EC91yQYkeuatVIjes3Ydj/hrHdZVqg7AePJKUp12GCrwr5eRapt
         fLwA==
X-Forwarded-Encrypted: i=1; AL+hErFHwnT1xyXjzechQUU69MkWFm8hpuQPRiCV5sr706YjI9SZWVyjAlH8tB8Zbz+N/9e/jxHxszwFCy+UHdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SbWBY5S7IzH56/eR+MqChReRJrzks74M03pf6leaVWKoP90p1
	07ilcwKITF/8F0SN2UP9r1Pm4WghME6fWghSNhCKMzJnrYdfLOL/7JY=
X-Gm-Gg: AYBFou3GAjw5rtMY4oFa99h5jg4L2kA1Z8HfN2YOQi+pnJ68zBA7TsJZAc4smbahKer
	sQRGE5VnPamqU7uZGrg0eA3BN3XuHAVO6uxYvPaYwNE58vIt3dW1Y79/1mReRIONFeliGrLTFAL
	oHa9fIRvD6pREiVPErTOhQxxXSLZ87d6BCTWeMdm79kgIOB/B5JnnMrAoUIsbGJTHQY2eFaZiIU
	YS4YDpdX20k1cWdJg/Osb3TOREYadXRlUOyT5LovKEx4fnI5xVTXI5MKY/hfR1bH/FT3z/F15M1
	2WvOz/V2qRgkqsoOxN+7nZmktvGKN47fv+dfqTVl+0FZKxmpex0BHKxg2f5HtxUAXQS5VwxfLKN
	IgPUFI/h2BS5PKJRCaQqwMedf9N+Bt5EwVGCxAGYbK+EXIKsvef0f2jm0IKP909YJprqxUVg9ar
	+X7wbnQ7bAbD7I41Af8BIPKnAC9NDWJlVoJ4XdWTrK5S9/rqtXzFpaN1fyD6i6IjUmXafGuPxEd
	Y5RBx7XHHRQOl6hcR8t8FhSs6c7VIRv4lHsU77Ny7hkCw775AHzERvf0FRD6VhTpl0G6XkKbx0G
	Zu5LjsxwrKQgmge5Q5rJVnSqeVhl4PKLCaS7
X-Received: by 2002:a05:6000:387:b0:490:6e0f:a02e with SMTP id ffacd0b85a97d-499c69cae59mr3687287f8f.17.1794397783745;
        Wed, 11 Nov 2026 03:49:43 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4982eedfb36sm10789106f8f.0.2026.11.11.03.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:49:43 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] ASoC: rt5668: initialize calibrate_mutex before first use
Date: Wed, 11 Nov 2026 11:49:19 +0000
Message-ID: <20261111114919.95639-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

rt5668_calibrate() is called during i2c_probe() and takes
calibrate_mutex. However, mutex_init() for that mutex is not called
until later in the probe sequence, after the INIT_DELAYED_WORK calls.
This means the first calibration locks an uninitialized mutex.

While this works by accident because devm_kzalloc zeroes the struct
memory, it is incorrect and triggers warnings with
CONFIG_DEBUG_MUTEXES=y.

Move the mutex_init() call to before rt5668_calibrate() so the mutex
is properly initialized before its first use.

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/rt5668.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index cd6245d6b91af..6748bcc63ac39 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2490,6 +2490,8 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 
 	rt5668_reset(rt5668->regmap);
 
+	mutex_init(&rt5668->calibrate_mutex);
+
 	rt5668_calibrate(rt5668);
 
 	regmap_write(rt5668->regmap, RT5668_DEPOP_1, 0x0000);
@@ -2547,8 +2549,6 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 	INIT_DELAYED_WORK(&rt5668->jd_check_work,
 				rt5668_jd_check_handler);
 
-	mutex_init(&rt5668->calibrate_mutex);
-
 	if (i2c->irq) {
 		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 			rt5668_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
-- 
2.47.3

