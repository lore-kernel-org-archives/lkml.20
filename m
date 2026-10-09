Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382164A68AD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544970; cv=none; b=q7SC9b/DEbIGbQBy+nqXijPdKaETeyM/MG5lo8vCfjFJvKrCpb0Mhhn2zjBYNhgkJUh3Bin2S2orTWXaJP3olK3+KSaII/Y1S1gn+tEeyWxBK86wXE6hpYcO/kM1+TFP50GecTQmYbIt58WNgNenlkXxH1/+A4gldJIHY9xUQXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544970; c=relaxed/simple;
	bh=boIn8KgK5PRI6J0HhSMz6lPxr3UKsW1nRa3yznbaAQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbpj1j+Dxog7oPOot7+/RdMlMVSxzu2xrdWOsNgWCwe9ODd5kyYNPPpBuOddhD+PtWR1NgaoV6MPxJSQeelDkCxFqBC8amPeiM36oa1SbzP9o0tXHgxz61iWputcXQBTfWbJsYri1GkgLdW/IUzxaA3ZrQzpA1TQy+irYmNwh3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXtoV3dj; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXtoV3dj"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4748458eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544950; x=1792149750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CyIZVoXOz6gOWywHaJMWqzxz+SCTg9brEP9p+6ifWQ=;
        b=fXtoV3dj1Mpf43vps6ofr94MnQlTbg6/HxFJTQqfFAtt1nsBrQwwlkzHAiG/6HWGep
         DOkx3V8numV/4l2Gf2bIq4n8UmfIh/sSAX0F5x5k4PPNeNe7QMeUjMVkjLGcVyExdZY3
         2+gzkXCeuV1BDKUnHhR0jIc9fpUyT8eOhRgUOZlYjETZVVeU/iMbH89rGqnUiIV2N+9J
         WK3Zg5ezc/NOi3ntqKVCXtMISDSKJFpOyyrF6Vgw5ojIJ1SGcTBBDi9poP6KGUfjY7n0
         V0TNuafqH4HhsAGxuN7qHybqYt6otroeW4jz0DPdv34hI7CxkNK12nG3pHELh5ssy23x
         uNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544950; x=1792149750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CyIZVoXOz6gOWywHaJMWqzxz+SCTg9brEP9p+6ifWQ=;
        b=JoE94Qe5cAxrcf02wZq4UZKS2MaPFixX9UEb3uz0rjbT2J5bCx7NajBhEE11/cGv60
         PLNsABApOOamaP6shxNCbb4K6NdqzVxB+pSmVPTowkNyKGM+QvYtJ2V4mhXca9c7ftXq
         7iRihNTIqEDfrqhGGjFc2IfN1GwZHeM0J7FiYo5+OahMivR++2i4aPjlvelzjn6jvMcK
         b/jXcnV9v633PzvMx3eoGrblYBufGMDUjkEPEQoE86/E6FjL8/+TfFC3apOmRyQuWDIK
         3flqyTOgxLge70G5wRW2y0cuuFMpvALFm/hRiZnvEnSvnuhQaLJQgtEnQIDtIHc3rIFU
         ikRw==
X-Forwarded-Encrypted: i=1; AKwUvBx+z7w/4KQqVxKIgLuCO/AohupGivTO9TMzINg1+7u8yDocGrc5DztdDwl/WgJdpzSrOctz32o9WIylo38=@vger.kernel.org
X-Gm-Message-State: AFuF++k6pyHHXqZ4Q7eQMtrMPNSha14RmdM+MIc6O0hcOHMtpa482kFQ
	tG92u4ghjxf9hU1nafrm3ZcO+hij6EqECiLkpItvDGRfl0yI33Scq2pul7kVzQ==
X-Gm-Gg: AYBFou0n7TWs2BRgCVTb9beSwP3DKzUu5JsG3xIp19kyPV8ILPBfr+ByChwgorDJ2ZP
	yCktLPXf4rfnvn/pan8BNVmlkamJXevdUGyj+ANWTG1JN/Q9PZJ48cziKR9cA3ls3AoZ3Zn1DQh
	thJipZHKt30v8BR8wSzHC+6a7CWgdcGTkpNnG6MlXaZH9rEnAoGJBUMVQiMlJCVO/R9O9c4biDb
	tKwS/S5u36MFgPCHeFv103sM2766KlXB7DhJbAWNOmjxm6TwWtVKappGE2IXLi1pNVmfuFnGn7Q
	JeXJWtS38XMW+U2G1Iyausj1PgXyS0JlEO4StDacsdBoeVdIdFlOY8umIEk6Ik1tUAT0BprDNJw
	pjcF/JVZMoTUf2QPL+BJ9wfPVSBGFVMe0bqFz1oPAf1K/k1DPHroEiOdVzA4Fnq3jx1xF26TNBy
	XL1nGefpEklZixAchCrSo3R+qirJviexHWphbOWdwTaChOrAOCSM4e/Omn0SvqlJIcgF+Vsfo+w
	v5Dg7ivGcyomN3uOIbmh8oNstjOCEjyg+YqWcf9BHZc6f1LE3poop42lo+kzXS1l2I4s2Q7gu1/
	nZ9ZVEWgpBm/qQ==
X-Received: by 2002:a05:7300:e5c2:b0:355:cd68:6f03 with SMTP id 5a478bee46e88-355cd687760mr515014eec.33.1791544949795;
        Fri, 09 Oct 2026 04:22:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm7258752eec.20.2026.10.09.04.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:22:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: codecs: rt5659: propagate GPIO errors
Date: Fri,  9 Oct 2026 18:22:04 +0700
Message-ID: <20261009112204.33199-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009112204.33199-1-phucduc.bui@gmail.com>
References: <20261009112204.33199-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return an error pointer, including
-EPROBE_DEFER, but rt5659_i2c_probe() does not handle these errors
for the ldo1-en GPIO and does not check for errors for the reset GPIO.

Check the return values and propagate GPIO lookup errors.

Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt5659.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 3097ee6d4e89..b40dc9c50139 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -4113,10 +4113,14 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 	rt5659->gpiod_ldo1_en = devm_gpiod_get_optional(&i2c->dev, "ldo1-en",
 							GPIOD_OUT_HIGH);
 	if (IS_ERR(rt5659->gpiod_ldo1_en))
-		dev_warn(&i2c->dev, "Request ldo1-en GPIO failed\n");
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5659->gpiod_ldo1_en),
+				     "failed to get ldo1-en GPIO\n");
 
 	rt5659->gpiod_reset = devm_gpiod_get_optional(&i2c->dev, "reset",
 							GPIOD_OUT_HIGH);
+	if (IS_ERR(rt5659->gpiod_reset))
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5659->gpiod_reset),
+				     "failed to get reset GPIO\n");
 
 	/* Sleep for 300 ms minimum */
 	msleep(300);
-- 
2.43.0

