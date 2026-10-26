Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030495;
	b=5R2BUQAjCVQCz8r0KwJkPM8uJj7Xf0OMbnPqUJf6VGmKlGCsAZJYeFiliMv9POYyfsfn
	 R4gPYty7yasABWHZBqW83KEO+zhG4GiLwt8ARX7nGFU7Y+cL/2sBbr8pY+HcsLiY4lGXT
	 eKV0/nVilxAs7MZmURu3xyZ8AnQ7qrx8skMPp7X+hfuAW5kEnkYYeYcKtZxHdUcjG91OL
	 LEX/j4Qt4dLhjw5t66N5OnmtsWeAT5K7XQ3uicX+t6iHJVUrpqIJy4utAUu/3n4pE8ust
	 W/tr9OSbiVV4QTl9kAMDHopC8yIXGv6+R5JNWV/MuRWFRzzLGIkU3Z9qv2hFMgIIiLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uVxW16mpXXGmdLmnlhGkMZ8vb/cT1vcxPz/t91VG3GA=;
	b=hUBoWk33WZQfwHCCE9uWIvlalZuogoZ8q2Jr/tOf0Y9kW104IxBlKCtYZ4kWIqjyyhA1
	 qgxSifu7PPkqUGe+DyzoG/IeRnIyX4JJVrjAk/lEp0I8C8ECHYqKkB9cWOm6Gv5F3cD6N
	 6AmUyLKQyZNMctyR/0s0RNhnZ+5G29/BXeBK9gOvPhhsqN9wrwvASFHEWHx4ZbGUEeo99
	 K8FrfXviQxmg/UyRDLXsRVcqflcaZ+pkxM7rKE4+3KPPH1T0HhIo89z+6wiRX2Af2z6Ri
	 oY2EYSk5p5DEkcJPn+AbR+VsCbuCYq/EfDT1SBB/ktaGeLqpeEF4wrAZ0F4qiYwruyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dKuwiBtA;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3697860A3825
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3697860A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dKuwiBtA
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso487774666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030493; x=1793635293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVxW16mpXXGmdLmnlhGkMZ8vb/cT1vcxPz/t91VG3GA=;
        b=dKuwiBtAhp7V4crTsQUnIcckkqMCIAl7G9TcxSolZPJvcCLHncBZj+KrSLJ/L2OQCw
         5TZD7o5PrIH4mE4SI5e94fqSF7UyBgG7fjGByocApjIkeIYJXkhz5cM490QzJKoVQAk6
         UTGoEtGTisqVCLdN+2mBOJ0tSIFwvtQbzb0VtgCqKTv5IzxR3oREk1K+4MwK9uVf2Yp7
         DDmIoXeKXRNsedlkqmDrIyupwlUNiWN77QVDJZ/VNsHR1tAeps7RgnTETJAMgDEm7msq
         39DiQQ5PIAW3fYuXr/fz2FTHB9nTNyVMA/dXysazNcgi6ZVvriFeHyju1EfY+jSkl8mb
         paqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030493; x=1793635293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVxW16mpXXGmdLmnlhGkMZ8vb/cT1vcxPz/t91VG3GA=;
        b=HEK94TUmh1ekO9MKhmBvAMoSOM2K924R2kO5alc7OAe+NPOIjBVA2YUilIutGnzWqZ
         iZfOAOJ0PsRnt3OtphreBFnurxMoYZxWkUouRVsGfKCWXgZTG0nqLi4/TRAKntyvk+Su
         i7ojPyVjOg2FmVoceTxnaekQzrSaNBJ4ADKuUKbh52EEwokx/C1mlBlt6FzmpAvg0z5v
         dStMX8zNigquJ/W9IOie0zhLi58eczdNBzebipmNUquQiqso4akuZ5igHIKnAJNvFEGp
         frgGjVhlUW6F1CSgeglOh3OHvctWFm+spaf5htagvFDJrZY5bTQUDfxFnB4m1ccWAIpO
         EU4A==
X-Forwarded-Encrypted: i=1; AKwUvBy2NV8tiugLR0eNQnaokCPHgBFWgkRyuZ/Jer6DC1gC58OV84W/o1p7B5sirTBWNb30Ojwy6A7yjKuWViU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7SpcF1HqRfNy6CLZDXsB+Osg93haSMPrlK0TLhsbCjcZ+ufiI
	cCIpsD7RsZMnsZOISxg4uQVz7KyylCn3lcTnRYpNYiEJGBZ+ERmBCHz3HWhKLFCboMc=
X-Gm-Gg: AYBFou0ljv/Egahsp6tbT6265Ls2fFcaZ9gN2IP2lS/UJhSJQE9uBScv3WS4stLP7ix
	jWLKeI8yfCtbKu9Czxp5FJK6vaesrQMYocrN2b4AEKgjKvT7l9GBcMDrcv5mpWAzYfOOjP9mn+C
	rCCf9f4KYN+jrwf7sfRyAgnk5uwCFLBdcNcm1NCEEf7nYxmw5+lvgJYbkXEnCauIyypDirWpl7p
	K8NL4TO2wXMONRLMfDF4HpL3zixNsJmyXRTK2AITgBjBpGBv6sdc4FStS320I7RKB0gQyTbA/Ov
	S+lAISAETtbdtoCkWIncF3xaeoW9xat03j2ig69SnhEkNSw2wa7sP9BHSnm9ZqqGqVeVWILJr61
	aBUH6NZA1711lI/jxKjYHpLW4no3Bfvivj+uf3MEDmr20RGgATjWM+cmddzAM28ZcgXv5inguBe
	hNJSyIYdlmWzBq3hv2zQJfxATi65xp6Ls9pkc1Ix/jj4S6tXT1+6Tq/gxfPBy/CWNglJH4kXYId
	Qr9WLEHtEIP2cfF5C0t/AfX0TmcRpO70XBdx0631WfB7PG19/acI6n+P4RdckMgLwx5wQ3wtw01
	tt/fBdi3xZ9gXNgF1lyuyLubKB6cPqCJbvQn
X-Received: by 2002:a17:907:e93:b0:c46:ca2b:84bd with SMTP id a640c23a62f3a-c46ca2b8958mr640208666b.30.1793030493521;
        Mon, 26 Oct 2026 09:01:33 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:30 +0000
Subject: [PATCH 13/15] thermal/drivers/samsung: acpm-tmu: Disable regmap
 locking for MMIO INTPEND reads
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
Message-Id: <20261026-acpm-tmu-fixes-v1-13-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=900;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=n9oiBAiToV2j4imluH0Dini5o5jk9l5YDFDeRG4d+9Q=;
 b=7egW4kVv7aVKyCi0S0idVb5FBWfiO3hOv7yz0j+W9TmYVCqptWD0mnRVo2uyEHV17etYiyvBh
 TCUuH84NV5KD7i/ZAuGk68LaJMqn+KLQISgMVlqRMXgTK286SThIUKP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The regmap in acpm-tmu is only used for full-width 32-bit relaxed MMIO
reads of the INTPEND registers, with no read-modify-write operations or
regmap cache. Set .disable_locking = true in gs101_regmap_config to
avoid unnecessary regmap lock overhead on every INTPEND register read.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 2324efcffb84..fd491b4f305d 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -127,6 +127,7 @@ static const struct regmap_config gs101_regmap_config = {
 	.reg_stride = 4,
 	.val_bits = 32,
 	.use_relaxed_mmio = true,
+	.disable_locking = true,
 	.max_register = GS101_REG_INTPEND(15),
 };
 

-- 
2.56.0.257.gf7497c7d27-goog

