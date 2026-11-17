Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889287;
	b=qUSLlVI2Xszs3THWM/GdcpxcemgwIAM0IomgTePia79qmpiTbWkJA2B6jgGcS0Oxncv7
	 NAjEXEP5CEfWLQSXD0MgeQjv/sENz0JI+MQnY8UxUUsmPfQZ7weYd75uBY6RLocDqEa8E
	 brDz5hlk91R4GDCvuRw8/huRD15oDkvOTt1vUlLttcabvfgGm1qlCCg9aqAcLcmLiQaiL
	 YzTtXCpjktsga2sMPGPfd9M+7gIqcNtKIolgaSZblDHUUB5kXzDOEz4DbH/MfeCwZY8qD
	 0OoJayY3WskCv8sqVj1x+y5D9WW/N6TzCrQgeGwwl70c4Ps8jfJdVfW4viNGpw/OXTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XIcutFxtKY5e7a2xv9fceQp19paF2ilpk4Nu1u5fqLw=;
	b=gws9pWskWgo5/Aay/YClMD6S7K5rmcMw/UD4/ePOQuCV+wp34ZggTXVPcbS7rBwy8tPM
	 tXxaJH3eUBtSA929rYrG7NMIDp+oeZdRoWzFjzhMpPjmaJbYVVNa3zjl1+Kz63GOCE2KX
	 mL+xxdaXDEVtxcCA0gxl0KApRmONIT9Fe8QN/9FfHdN5MjEGWgNjkOkY2GTPhxU8tdMQO
	 vEre5mFKXJUfY9W66QoPbmP3SWasp9tD5Zpllc9Qx0B9r1ezi9B+FXMNrOmtP7TyUg0TV
	 /83KaA2HmUjb3AAr6L1WQ8kia4Ks64DgI9E32HBAJWWWDBUXy7FJChnP4SInHtqAsHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YKexKFum;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8478C606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8478C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YKexKFum
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ea7190aea1so15171145ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794889287; x=1795494087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIcutFxtKY5e7a2xv9fceQp19paF2ilpk4Nu1u5fqLw=;
        b=YKexKFumA62r4NnViuW+Eh4RHHPmwOrbBMKrA0CidZyGbvIZG5PUNSXtcECwcgSUyg
         iHB+6fwivzQUaWAeZSMBIpbpW2xWXB5YSqLH+IU2K4IZ5CcDDXXqt8ZGBd7RctjH7tJc
         QUOMUWRc4xjA7OP4rT8KqjnodT2Awm0dUcGwAiMh2kJUXEunvC2BQHG1Qpv29/WEvkq3
         +segr2JrHcO9AwIDEV/TYk0qrQ5z6c+4Wy9oZNQ9m3PhuwDwTL0vNLMqlSrhTRNVXOKO
         wRNzK5oIDfbc4MtpfOgEyc8QThM7zv7fj5l4ssEOgcZrwPSKKPvawW4kVqyQ2NhBJx30
         y6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794889287; x=1795494087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIcutFxtKY5e7a2xv9fceQp19paF2ilpk4Nu1u5fqLw=;
        b=VgfZrLHFAF5qkzxra+5B+Hq2sFWJhg2jD1BLXz58ZR97q8y5PKBwPfdv+5bHyl0buH
         F+3Mxe6WoaCUkUbfyggreXArWE20vJwctotyxgH4A08O+TE3RzqGRP1WNkdrq1WnuQwK
         jfvZP2njb0CUWPhU/Zf3Szgj40K208/UyiPgSBJTeWgrGaOJK7TzdJl00rSfAJOwHs+k
         L6XCjsV5cnWY1QJYHmrczlL55vLN5/vDLpxuTBtFKkSQ6y3Wj4NcaQ1N3v6rqZCXtyGr
         GYS4vvhfqwhBtLO9dFgyJYomkEDw8QWftMudwY4WXUyuvkGcbUPCW9NhUXVdPBl6Oa+6
         7ETw==
X-Forwarded-Encrypted: i=1; AL+hErHnBXWBG3cthhQsB48j8mGuVCb0Nrrams8l68UZQadWjq0JYUoaUN593OH7+nkHYMl2T7J+Jb/aTN22kq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z84y/Eohi8LlaUPY4H+dtgg6H94KJRN/bpz7GPtJFze6Y760YBA
	0ffRSdV/lPRiNh/GNu9vTGgRMNJZjgjAJXVxHSajESYX/F+rfLW/nrhG
X-Gm-Gg: AZFdTZflQIFON0016Ge5pQw5XvgcLzuqfZDIdbg1f/svqB5bizJwSEZzlANzN0Sg54G
	p9IDQEhpliz/2f/TnyALMSaOoZkkGn3ubLGOwZcWPkj00PNS4tGwZZ5qYrZ0b1J3BflrIZ8GsO9
	fGOCptAGwLMs1A+Q6fktvOjr0IsGnmTrstHXMM8YV9QVPtrQV5agXIkI7mBnDEHYgsP77CJngcE
	i+g/nPu8C/UouesDvmuQvDKbtjKHtoLVK2w+qqWJFR6TT9NM5D38sJZls8lO0hUg82xF0QCiAT8
	rFO3H6SP/3YqczqTXszco3ROgSwLK/q2ukpbIBpzY/RUMVaxg+oCP2UUK5eJQ+lkcu5YI5/kE8a
	aYbwv+cG26mzlz5bijb2Co+gRvBZ3lJlCRv7cnqWf2BhoicT36rjy28Xk7uoJC+DS/0oSwbeefo
	LiTizytPdo7qwFxmUsc7ZEsG8/dRg8WZPRie0D2co02zW++5bFZnoKLn7uDkBTZywUNaOjLsnHB
	1y/enHMPa451DkERrxWwUzF73ZLs9yinCyste9z7H+/SZbPl+0nDHuslzeiJUYXu3OV6KQrRtBQ
	+QQ4UhK914mUzfMLhtRpr93sYNykHCNrcsK2P0cJN/opoB8A+Wgc4Kj6j+/i0sNr+n0pUjZynay
	x+MXs9fHAPnXh94W3KQ924ZQzYzieVt68ua5eZHDn2A0L
X-Received: by 2002:a17:903:244d:b0:2ef:e465:5047 with SMTP id d9443c01a7336-2efe465548cmr442305ad.33.1794889286773;
        Mon, 16 Nov 2026 20:21:26 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efe41c8df5sm412385ad.70.2026.11.16.20.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:21:26 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: cirrus: ep93xx-i2s: Simplify platform_get_irq() error check
Date: Tue, 17 Nov 2026 11:21:01 +0700
Message-ID: <20261117042102.12442-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117042102.12442-1-phucduc.bui@gmail.com>
References: <20261117042102.12442-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq() is documented to return a non-zero IRQ number on
success and a negative error number on failure. Drop the special
handling of a zero return value and check only for irq < 0.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 97816fb75368..8dcfc6717e19 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -462,8 +462,8 @@ static int ep93xx_i2s_probe(struct platform_device *pdev)
 
 	if (IS_ENABLED(CONFIG_SND_EP93XX_SOC_I2S_WATCHDOG)) {
 		int irq = platform_get_irq(pdev, 0);
-		if (irq <= 0)
-			return irq < 0 ? irq : -ENODEV;
+		if (irq < 0)
+			return irq;
 
 		err = devm_request_irq(&pdev->dev, irq, ep93xx_i2s_interrupt, 0,
 				       pdev->name, info);
-- 
2.43.0

