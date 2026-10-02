Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC03655C0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915968; cv=none; b=Xa8hePY/OAUVSOJH9LyH4jvXoL+7uQnkCeh61oh70f3XAV+1hdG6k8p1vPQXi6cX4YiXKbchOi9XWAT9cbp3+4XBP3YRq8AB4ZLGArNMf1iBwg1kjoTGF8cf+naKHTveDmc8KrIcSyL13ng4GwUWNm6fYi0+OceYW1jRjJfh8FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915968; c=relaxed/simple;
	bh=cgl3PKF9zE87V0n/hFfoQ5EuOvHz5Rt1aQJR3Bk0Obg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXV3Hmx41jmVQ/Yj3DogKkmJOYFu/j/smkFDeLsaZ7FPPlVoMBYLRSqpL1FUAJDEKC3pHHiVbJhsMl46rtcI4XqacUzbvbOTf4OUszP+QuOHd+fvEvi65GTdAVQl0UqVysK48cpihQBjQpbGWdPZbA09p7KE0xi07i7BmExm/TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rl/oHG98; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rl/oHG98"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2e2bfc2540cso19002055ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915967; x=1791520767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTeu9HyQ7QnjlcIIK3OqakZx+SHSODb4TDDJ1zx8l2A=;
        b=rl/oHG98bhqJuzaS2Q1hNKIrxfwQh4ro4o4fq0XwsFEajG8zhkkm1PRAgJXbo23iho
         KYeR72x37L1ifx8bTSvUoITLQ0zNc4S/YLsRKBo3ZlepXhcIGeXZ/9TxKKU9pK7NFSSP
         WIVf5jWkUzIw/8Cw3XW+8zkBg+e1RvGRGELfWSX/8NthVkjE6bsXjNzQlPqsKeaUH/Ja
         Wfndb0PTu3XNqZALbdIwkfkD+uAh7rR7FdcPv/9h361FAHqj1+oGg/YwgzH7m8Yn+pPN
         DoQpB+m9cDmVOurksHamX98BqDmp81BqFRCCG3h0IHEPdC3AAYZfD+yVfvTVJITSFQES
         pZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915967; x=1791520767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTeu9HyQ7QnjlcIIK3OqakZx+SHSODb4TDDJ1zx8l2A=;
        b=0Vz9Rs8nQ9jKfyxkiPXnFZ0hHug6ElOLxEutQLd5cN1KnfW3NtVut/rDXGPsfW7tfC
         N/F8+x6hdnxwHVcOpY57n/pGLR/YbAyipMidbZwWI4XVHcNRjmCYk6or+7f8+FGu87VU
         aE5kciJfBC4zVsaxj13IrZ7QJMI2S8QfKfpW0ZF8LEdN0x0nWn5x6HY+4PLgVh1XjUwO
         1FFdfah5n8AwLQ1oqjTO2T6S7AKB/PkitGQ/hIVZ8yAnxTeslxHPieLH//WjyWsTLv+T
         vfwzU2OMLugL4athuxorFA2RdQRNXYas2QMSpxK84F9Ju6M5L0k4mocB6BFUJl8u1Pqh
         yCdw==
X-Forwarded-Encrypted: i=1; AKwUvByMmANRvGICPKZfQL/XMiZCKX67yVjwxzpJa27I23V66UqO3RoOEfE9eVyd7gH2AbgSH++GLNpKmFi7TCs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqOtagnrCGfgpJtJjKJw8HWq1XmNSvef7aZG7ZM0UsDsX5jrAN
	s12Uut/5/JoGUJFuTaT12377bblQgvEuoYnj+gRuHbHtPV3yuMmHgDd+
X-Gm-Gg: AYBFou0rnfX7foZ+u+YRzirRMU0ZH2Io8trLZ0f5k3ogaB8pq3B9RfeJtMcms9RbitM
	1mrxbMZDJDGLRHxCbyYG6j6yHrdCvvmp9uusf+dwebrAXSTuDLaycIFUj0IFxJRetfAVWJRdZmM
	a0MHJlYQ7nyFY624Qu1IphwqukDie3OhUzdtu85wvmh7hVIM2NN5CFU8BaembmclRt/eXwYzgW7
	wOcV0hD4HDryH32cKBJMPcZ8GRSx8AIsdmoRzkStLj6kRA7ji5sQcT3xy0s4f9jX67rmnX0KkFh
	hRiBJd5LQhWiZFSVWg1TYv4RfGrTWlHL/ZqKs0ubVHn+g3tHxE6hUSq6CMw+/1bf6PVK5954rlF
	2usRQHJ55Rz6UzocsEqdZc1nqEeU2SB3LLKDo2APVCsaDP7M5hXScSPS6gLkJdVzNdui+M4aQ1C
	Af4Zx2D0x4q3TA2jWKI+kZK0WFA6hrrI+hbnmXHa4jUzFGUgo/4+iwXg+0FKGC3WkPyQgaRWb0X
	/NqUERzBCNzxXxbWsY5UzTcmdH4+Nm7d3jzMwpyOSorglhKeMvDwyVwKWQOczuTqIkDjUu5XyXG
	H8CrURQNSD477w==
X-Received: by 2002:a17:903:181:b0:2dd:c053:d73f with SMTP id d9443c01a7336-2e49b681d7dmr15081205ad.38.1790915966639;
        Thu, 01 Oct 2026 21:39:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:26 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/5] ASoC: atmel-i2s: fix MCK generator error handling
Date: Fri,  2 Oct 2026 11:38:52 +0700
Message-ID: <20261002043856.97295-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Disable the gclk and reset the MCK configuration when an error occurs
while enabling the MCK generator.

This prevents the gclk from remaining enabled after a failed clock
configuration.

Fixes: 73ad0df57290 ("ASoC: atmel-i2s: Remove unnecessary audio PLL clock (aclk)")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index d9ad262ec44d..f28808d980ce 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -466,11 +466,21 @@ static int atmel_i2s_switch_mck_generator(struct atmel_i2s_dev *dev,
 	mr |= ATMEL_I2SC_MR_IMCKMODE_I2SMCK;
 	ret = regmap_update_bits(dev->regmap, ATMEL_I2SC_MR, mr_mask, mr);
 	if (ret)
-		return ret;
+		goto err_disable_gclk;
 
 	/* Finally enable the I2S Master Clock generator. */
-	return regmap_write(dev->regmap, ATMEL_I2SC_CR,
-			    ATMEL_I2SC_CR_CKEN);
+	ret = regmap_write(dev->regmap, ATMEL_I2SC_CR, ATMEL_I2SC_CR_CKEN);
+	if (ret)
+		goto err_reset_mr;
+
+	return 0;
+
+err_reset_mr:
+	regmap_update_bits(dev->regmap, ATMEL_I2SC_MR, mr_mask, 0);
+err_disable_gclk:
+	clk_disable_unprepare(dev->gclk);
+
+	return ret;
 }
 
 static int atmel_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.43.0

