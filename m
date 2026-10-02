Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBF43655C0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915972; cv=none; b=hpKujeAGpnYrFAt/kSntQArg8C22HCdF+lcFmllzl/Fw3xvpa/IE80a/K0UhEXQstEcH59D7Pv9WsxO18D96MPgSjetu6r7PRqjS+4yI9PgBYN7h/QoUnhuMiUEx5un+B4LRWg0CXhCV9AR6OUeqB28SqM314d2OftkD2TOX0Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915972; c=relaxed/simple;
	bh=x66uwvIu5ywRUNH1KcdRg8/f3THWh2VZZ16aKaZQsC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=drZgPf1Doq8Etlr/UrdAoBdJ1Zk/xQIAmExDHYDezqnmlido/EOXB5jbn8soJeisaOcghU6vP8TkrfKOz1XzX5V+ncarFvQumVk1BnHAa+RXtlgt4qBHxErB+XXyDINgkOmhkyBo0GLz0rHhiX7V2xTD365c5UieYxBsBYHNga4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2Y+mhMq; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2Y+mhMq"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2dd05994cso11885375ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915971; x=1791520771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1AdBqTLN1NoLcfkeqL2tMz91d07+kTAZBqSBvoPLus=;
        b=V2Y+mhMqydjl6Z6uf9Y4rBw3tk/0TRM1ff90OWhSQBeFwGy2QTAE1VWUXBl4o+oK01
         +pmbxP7rKVFIwE7yEvXtuqLGSz6QrZGivADCPkDmuk9iGs8J9xQfoj7Hb/SY/M5Kp6/x
         JAvSHPidAU06ca6cP1YYUslH40VKOXGHCJHkqAQx8RqERVen90P8RZxINUmTqpt9pmlo
         0y+rwT3oRQXOEuorWSYlKeKVMSgVT4FMox40zwf2pRbW8TvSyfI/a3PL78zqFxbbk9NI
         rR7AZxyj33csjjyKuGL8MThLPTgZjGnbtTJP8MP1Mn9RL3wTYRCZrq9a2m5GM+m8r1pT
         F81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915971; x=1791520771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1AdBqTLN1NoLcfkeqL2tMz91d07+kTAZBqSBvoPLus=;
        b=1bcP+SvIyHKYHO6m5kuGGVK0Wr02O9NZCPFGr6tJwFnIp15ShflHKTWMjiUilHAuzz
         H39QTF0j1GOVy1y5yzt9txmGLWEFq3CdRMN47gat04xHPXWyRD2B8vXf53v/RH71izxC
         beNCJQLbAy71vusZQ2V6VZt9BYKmbhuKNoYTNL0C0AKv6/1AUR3YoABalmpKu/NoJQz7
         aevjvcmNmt+i66T1WpayJJ4L4v3U6PuCwZm6wK1LP6E0eEEsOpDX/NrIg5N4lhHNrnpg
         L/+hTCfwqe0qQ5N5mY8hx4uIhL+KckbQ7IBjkDC3YFEu44bKX7cSYtA2rAVYngk4oreS
         USEA==
X-Forwarded-Encrypted: i=1; AKwUvBwDrnos6Suyhp48M3hs129OchKvyyqMZ8V6EuKxFRugogcbZyvdpHupJuc9eTlnhuL3E7bsx5cUevcmbJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCWhZAEd5c33bQhoNZHK2sw7zqlQ4sLzT3UGduT7gS8lvv96f6
	JiwCKnwAfEBKkRmvpr2eMB9yqzu4vd6EuHEsZDfo60TZJByxZkaFuREE65P9AA==
X-Gm-Gg: AYBFou1lgv17WwanUf6IqBGNNcyIz/C8aVwsf0lj27rG7FDkNb6pXgHP4TKqeG95zSJ
	G5A0+p9XrvlJWsjropzbMk91vahCh9ERVGf4jDxcMKSq99Ac70tZzUq6xd/04bSiQOrlqJVq/Qy
	+jE7nkv6u8KDzsI3UKjJdJI+uafer8IgQ2+QTE6NpLHa7sPwmwZOWj1SjR69yJ8mc9NPEdTsxb/
	v2Bfld62KMfqA/NGP8FIO9ynzBdX69Re6YmKUrrOb/qYWu29m/4ud4rAJ38r/JZBnzCosRA4ea+
	pK820XpATgb5JVyFs4MCtNNghQpoAWnjc30GDKNIsRasuCZ85F4Rm0nbfYCxL4Oekf2OaMZCPBu
	XOxmjJcNbC/KyVE68nwS4VkIx5FBYELp2Bsiot3cigK8Xdkscl6MgP73r4asD20xY7qKeH2nVW2
	QoUcBIEomtpNTW7/oQ0nQdUthks+RTuIMZmdn4oF33OdTbSRV57AvCHAuR/B7YmaAgqBzvnQYLZ
	MbqfOwZLFTPKC/qLxjo1czxRc0Nyqy2ufCTe3PoLFG8gBxu8cmnfzN8+jncCIHnl0GHof7vdjlx
	2ClVcssRPGmmKA==
X-Received: by 2002:a17:902:e5c2:b0:2e3:d33:b27c with SMTP id d9443c01a7336-2e49b6198ebmr13023775ad.38.1790915970609;
        Thu, 01 Oct 2026 21:39:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:30 -0700 (PDT)
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
Subject: [PATCH 2/5] ASoC: atmel-i2s: use optional API for muxclk
Date: Fri,  2 Oct 2026 11:38:53 +0700
Message-ID: <20261002043856.97295-3-phucduc.bui@gmail.com>
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

The muxclk is an optional clock according to the device tree
binding.

Use devm_clk_get_optional() to handle the optional muxclk instead of
handling the missing clock explicitly.

When muxclk is not available, devm_clk_get_optional() returns NULL.
clk_set_parent() returns 0 when passed NULL, preserving the existing
behavior.

Unlike the existing code, errors other than -EPROBE_DEFER are now
returned instead of being silently ignored.

Fixes: b543e467d1a9 ("ASoC: atmel-i2s: add driver for the new Atmel I2S controller")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index f28808d980ce..c52d048449f8 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -589,21 +589,15 @@ static int atmel_i2s_sama5d2_mck_init(struct atmel_i2s_dev *dev,
 				      struct device_node *np)
 {
 	struct clk *muxclk;
-	int err;
 
 	if (!dev->gclk)
 		return 0;
 
-	/* muxclk is optional, so we return error for probe defer only */
-	muxclk = devm_clk_get(dev->dev, "muxclk");
-	if (IS_ERR(muxclk)) {
-		err = PTR_ERR(muxclk);
-		if (err == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_dbg(dev->dev,
-			"failed to get the I2S clock control: %d\n", err);
-		return 0;
-	}
+	/* muxclk is optional */
+	muxclk = devm_clk_get_optional(dev->dev, "muxclk");
+	if (IS_ERR(muxclk))
+		return dev_err_probe(dev->dev, PTR_ERR(muxclk),
+				     "failed to get the I2S clock control\n");
 
 	return clk_set_parent(muxclk, dev->gclk);
 }
-- 
2.43.0

