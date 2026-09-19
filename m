Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393AB38886B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789837872; cv=none; b=ApEbELrqKkVOUiLkVSZM8SEBgHL+5pQQ5x2+dZhvg+sRN93ZXa70eIq9axGhyJJ2Wnjm8ZReeh93g9u22qZadYDYrBnd18gVUp1M39Iiu/WOLzloUI0BK9meoSXMiaIc6kSKqxSYFzvZrKoz1y6GHQJh7EwObQmRAUzawzc+59A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789837872; c=relaxed/simple;
	bh=r3SPUIne5J4Oz5owY0VHkq2rzwe/oQWXUFcrXTAfcWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ppap3u7Iz0MQUKlWmE7q3tR+Ye59AIRSuUJNVtx33wu0+NnJ1eBHxjNXntWx7o6G39WyIdv2SThfOPtB1IhKb4sdU50Pzh/PkaHKohmbLlZVS0VBkdnDg18MvD/CHqhIUCfVGjHSCL5T7LUdDVWGogghxXHCE4D2Ql2EyheqW9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VY9xPNDA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VY9xPNDA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so939088f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789837868; x=1790442668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Abh44k+y+UnIpTLO2dWqUzZCllUOsbQmhQCG3AtwbVE=;
        b=VY9xPNDAXeueLQmes0fYX36r6SBHnLaaP+pbFS91lKzJ7rwE3WTA2C1ut3P+DTfu64
         yKgk9JkdvkW/hilEWZKNBw1sWIuqfkuGtl+pVjmrjkE8crh2zRoE5Ja1vrUHDTmdE8TC
         rCLeeDM6dJSnCaRVgktZm/cCSJNoc9MH2aEAoqOOMLHF0vTqqVkq8bkLgIWwVT/vITDr
         jC8RbhaW19L/VFEaAoNUDQMTwHLdsScZ3yIifJLlNZxleUgcU8aBUETJqikswmfeu1F/
         urcb5nIX4AFYiFoqTrkLE/zNW6gIpmRP9q8Nv26Id/Uj5RhVF3xPkf0+OZVvGj8PtN5P
         Xu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789837868; x=1790442668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Abh44k+y+UnIpTLO2dWqUzZCllUOsbQmhQCG3AtwbVE=;
        b=YGE8xcFEn0fmP1FjDFTJ2TBlRSzrFJKybhgJr/tXewW+mkyPZT8ezLjyo/6N1kedYx
         3qmVvkueGFlPp2guGxZc1Dj32dV+4Iwq5O0/5k5F+fbdAfRCEHWxWDi+3IbVNgbAWLdM
         hzIL2zgMd2kNsuynA5JonoV4Yv+/MSpfK03LvM7C811rYe2Fx1X832EPU+bxNPH1bPxU
         77+CPrxocuXNNBySEj62mLL+W0BxTeoefesjNUMZH6OTB7IkcWI5R8fClpljDKi/PSk2
         6kRtV9HwSA0YwZeXJSLlon6t9pvJpIAd9AFPbGdraiEapfmSot9BU+SnNIS8/krYA6EM
         S84Q==
X-Forwarded-Encrypted: i=1; AKwUvBzbVFRbDeZT14p537ZVoHfAizmIA7h+QytXXoKcmiftZ5/oIMPdKr70EWerfcvJpCCvmsZjJBH31svny4g=@vger.kernel.org
X-Gm-Message-State: AFuF++lopIdlj7WmfBG/iDUCuL5Kbfxd55w915bELDZ64vBT+OKaT9kP
	OGDT8Gasi6j08zyF4dyXVtYoKw5aBmmUPse/3SW6e1cwdxUl2rRMnwV8
X-Gm-Gg: AYBFou17IazdyNelgv47XjrVVlj+8T2wa7DhKOhJWKECzygAeCzuktj/Av+BtjM7cx9
	XNVi1xJWKxu4UCdhsC3EyqR9Gsp+2AdxKxaKNA1Waqosyu+CqoD8j+NLCpHCA7hvTa6rnJtFDj+
	f/MofyxUWuTevxeIZU160OAE08jSm/FOEpvU1D6NgGk/sV5HCLWGraN+YS9YBB7SNo2by0zU/4h
	e68rjPOFIFHc70xmOfgFwPDXUVX5ZHdhjZrg42dgMYNgLDf3fOY6sdUKC1WqCvVCLzGWnQ/jIim
	B127faQsMiX+41Sat64r3jX96gho5ZPJzuyFoMzXMSEVrztGXYzO/ns7V9eZ9DfMvRKIwO4+wlv
	Mvz7o7URg1iTiUa3/Ve2X4cGQo3/f3eIxZnkCxJrv6RBzCoaMpjiPsr6wdKKqRVkhtZRUmqIopy
	IFR74RTlh9RSlPX/BWnz+PoNzCgdX1s0BzHVw4BfVaF525ZNhyxvqR4Zb7kzmbAFdZjtPRyUDP+
	E9bx+qrkTE65pE/4cNyEhd6vjruNy5msQ0BSptoOn6YBgdD5VMbO0wwzEmF7Cf4In7I/w6ovuM8
	nWqu0JtFtVcanVo2DRcuaoR6Iz3p+iH2IwymxNNjkTz9DN46fEa3VQgpdyS+6gQUUTIr/WDxO8p
	dGA2XzV3eEZFGhdc56oA8b8kugA==
X-Received: by 2002:a05:600c:19cd:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49fc584fc7bmr85741365e9.25.1789837868253;
        Sat, 19 Sep 2026 10:11:08 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f8563sm98714425e9.6.2026.09.19.10.11.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 10:11:07 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Jonathan Cormier <jcormier@criticallink.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] gpio: tps65219: Use the variant-specific direction callback
Date: Sat, 19 Sep 2026 19:10:59 +0200
Message-Id: <20260919171100.90430-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260919171100.90430-1-kmehltretter@gmail.com>
References: <20260919171100.90430-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPS65214 template installs its own get_direction callback because
its direction bit is in GENERAL_CONFIG. The shared get and direction
callbacks nevertheless call tps65219_gpio_get_direction() directly and
interpret the unrelated TPS65219 MFP bit.

On TPS65214 this can reject reads from an input and skip the change from
input to output. Call the callback selected by the gpio_chip template
instead.

Fixes: 1b6ab07c0c80 ("gpio: tps65219: Add support for TI TPS65214 PMIC")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Testing:

  - This callback path was exercised together with patch 3 by a
    temporary KUnit test using a RAM-backed regmap under x86_64 QEMU
    10.2.1.  The TPS65214 direction-output test failed on the base
    commit and passes with this series.
  - This has not been tested on real hardware; testing on affected
    hardware is welcome.

 drivers/gpio/gpio-tps65219.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index b25c6f7277680..479a80ef76543 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -87,7 +87,7 @@ static int tps65219_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	 * status bit.
 	 */
 
-	if (tps65219_gpio_get_direction(gc, offset) == GPIO_LINE_DIRECTION_OUT)
+	if (gc->get_direction(gc, offset) == GPIO_LINE_DIRECTION_OUT)
 		return -ENOTSUPP;
 
 	return ret;
@@ -176,7 +176,7 @@ static int tps65219_gpio_direction_input(struct gpio_chip *gc, unsigned int offs
 		return -ENOTSUPP;
 	}
 
-	if (tps65219_gpio_get_direction(gc, offset) == GPIO_LINE_DIRECTION_IN)
+	if (gc->get_direction(gc, offset) == GPIO_LINE_DIRECTION_IN)
 		return 0;
 
 	return gpio->change_dir(gc, offset, GPIO_LINE_DIRECTION_IN);
@@ -190,7 +190,7 @@ static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned int off
 	if (offset != TPS6521X_GPIO0_IDX)
 		return 0;
 
-	if (tps65219_gpio_get_direction(gc, offset) == GPIO_LINE_DIRECTION_OUT)
+	if (gc->get_direction(gc, offset) == GPIO_LINE_DIRECTION_OUT)
 		return 0;
 
 	return gpio->change_dir(gc, offset, GPIO_LINE_DIRECTION_OUT);
-- 
2.53.0
