Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5EC392822
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791054470; cv=none; b=rNVqIuQHMQE6qb8BqiDvzQmwXirmvsF1W9LEZm7Oy+hlY5YFqB5c90614Wy9z75fO8YDDK+T7iv6A9EdQP0RX8pZhvKkmpfZmWlQYHHwYx0dVMQbtzn9ZvA8StTYc5credUkCSK/PMmSIrYZFGr2qGJ4RGWdcpkzWRItS7rWRRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791054470; c=relaxed/simple;
	bh=TKPP0VzgeDagGyLZwK0huHH8JWRvxQanvSViJXLm7is=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hbEVu+el5l6O9HHFpb2K67aIrMErFyg9wv/sxXeLAGCzk4wG5iwaa3jaDmXuS9AwN82vxwRzfwNy90uozLtk2nBBNWXzwe6qOZaczEu//wgxVFATef4QzAb7WOM7aiPertpXNpuSs+TSdr5TKg49+Sh2cak6UrBKfxDQArjUh6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMI9krby; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMI9krby"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so4510035e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791054467; x=1791659267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKkf2SFy8uqVHKA6kh6K9FK6RoDGCKvfagK/bM4F5lQ=;
        b=RMI9krbynjF5Q3dtVd2qkDiLfOh7k8604o45OmCoBQsb+y5Y+fEyHmFEuCaOuwKYtu
         NxUFsHEpiX8yYMLAUSXqh70lzIlpcZRdF2YPdAERtFbYAnf8H8lZTziAo2jkF2soOI9T
         jTKKT5nhAsb/A6pXSgFpwvYywqMLZ6fmziLouBdcir5Y4DzfQL/5COqSuZ/086rjgU5a
         +7pHXrj1CLZOmpEbOLxefP1kLwVg9VZ4fjRQMH3gjoqwh7tsjCVzXxl/YcBVF4b3fuLZ
         yACPZbtGyQJuDPOEIQhvvR8oADyAHEc+k1LT1dPIW+fRs/EIs3QUNr90Tgt5DR8iGtdR
         nvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791054467; x=1791659267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKkf2SFy8uqVHKA6kh6K9FK6RoDGCKvfagK/bM4F5lQ=;
        b=DKvg1ljBz6uPkd7RhbRKxYhHc0yTjksptQrCcGiMBsDZfEcQYZgPhYwqL/KiVixKoy
         HDDr5EX2yjOEm1uIKpsysYtqtrjUC5uQl1CPFem5XP//qSKb0eiWTLVW8RVs+O5lKyI5
         EDGvHui9U9BEoVqq8tGbNQaYzex6LH0km00Ed2Dv+9RLw97dvCKq4OT0O9TLLoDKQ3+3
         h2VhlGLQ1IcQj3aA6R57//WACNGAmt5dQ4+8qUyS8NWoy3eOmCqSDd6K6sw0p5ALy7BF
         wCTAOVzO+rztP8s/FxQmjN/gY0M6V4eG+D/WwoTr4P0pwN5qZif/jQm8R6Kv/hqNaUAh
         a5dQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+/lWm1M3OEpFjFd146ByXmgRZPYt4dgEgLo0wBYTzdTILWNcOA0w6soldZxHG+vU7xBYRndVvtsMmMC8=@vger.kernel.org
X-Gm-Message-State: AFuF++m2aB2bdEJMY+xY1ObQpFR0sdyB1t8hiRyzCqjlVZPq/phRvzDR
	DKMMolCI9aHW02MmRy9dKN/WjFdlSEq1oh3mwkuICV7tthMEnS9JF4mIOHOiAyyh
X-Gm-Gg: AYBFou2tfPgvW3OYiQQwSu48DAUKBQNxcDGUjc8IVfyJaZqX+oLFhVcEZ8KDq4rTKWL
	aKO7aS/tqMabvntjucyr8RsOZKUj7PtmVnClleaYfg9ljICCG7IOo+DPaX4NBiAgmp/vmvCsWdt
	/SFPe0zx7J4jSynY9KVYWVjYOheJLBt39z6eve18G1/GF3OvCStV5pdro4laTZG2m0YITE9C4AV
	3mr0O58z1Sfr0VbqDpPj4Udsw5yfWFICpSvsKCbpYACiqfMVbNsGIfTxGFYew58R6Aa5tYHllM+
	KcGRITQ/9N89RVbWUdMynqhyu5/836G4uRSk5uRWyTi4Qwxbz2bEp1Sw3bISKklaEt+q/QK5H5T
	5qOIRDQW337ZxPYSzkveKitgg4TaFyfMdVeOHxLsC5KUtanxhmVd96sM4ZzFpxWko+uakQyWiPn
	7qQbK2vTrnfokM0FW8oj6utcWP8ulxonm4/TBR4XL3pMmD89ptoUCfWD1DTlVaIDW+DoxDrwe1I
	xQd6DXkr+lcCyHuaVjWiFNLy1peKP/p9E07BufaOEfuUnksLurwsAODDEM733rYiu2V5g3h66JX
	pPQFg81iwpdw8iSAV+h7p2h6r60OC/JlNiOE3P2MnTreJsaAvhHKNFGZazxQIJjKNEk4hgO9ILm
	oi+Y=
X-Received: by 2002:a05:600c:4703:b0:4a0:25fe:a4b with SMTP id 5b1f17b1804b1-4a02759442bmr120884405e9.15.1791054466825;
        Sat, 03 Oct 2026 12:07:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02752aeb3sm200984615e9.0.2026.10.03.12.07.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 12:07:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: es8375: use devm_clk_get_optional() for mclk
Date: Sat,  3 Oct 2026 21:07:38 +0200
Message-Id: <20261003190738.77564-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

es8375_read_device_properities() gets "mclk" with devm_clk_get() and
then tests the result for NULL to print "assuming static mclk". A
missing clock makes devm_clk_get() return -ENOENT, so the probe fails
before that test can match.

The binding does not require clocks, its example has none, and
everest,mclk-src lets the codec run from SCLK instead of MCLK. Use
devm_clk_get_optional(), as es8311, es8316, es8323, es8326 and es8389
do for the same clock.

Found with an experimental clang warning about NULL tests on functions
that return error pointers. Tested only in QEMU with i2c-stub in place
of the codec, not on real hardware.

Fixes: de2b3119f9f7 ("ASoC: codecs: add support for ES8375")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 sound/soc/codecs/es8375.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
index e8747bc24433..67bf73d80fb5 100644
--- a/sound/soc/codecs/es8375.c
+++ b/sound/soc/codecs/es8375.c
@@ -661,7 +661,7 @@ static int es8375_read_device_properities(struct device *dev, struct es8375_priv
 		return ret;
 	}
 
-	es8375->mclk = devm_clk_get(dev, "mclk");
+	es8375->mclk = devm_clk_get_optional(dev, "mclk");
 	if (IS_ERR(es8375->mclk))
 		return dev_err_probe(dev, PTR_ERR(es8375->mclk), "unable to get mclk\n");
 

base-commit: e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
-- 
2.53.0

