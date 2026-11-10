Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304636;
	b=Mo1ApldoMkvZyDY7zcanVjXnD/P+OsiOUKkkLen13p2rjzBoppnSUjBrPmFJv5Xp2XqE
	 zgWK8GXydeFoZc8P1y5x5YdciHbfWBQYJz43oDbftmP4Ct3F1q7uVEVAbnYNI1hiXpZO7
	 DDcY9D+LOrSxTwqFT7fFJlCZ8x40O8euSA77a5wrM7fWUTcodqa2CmRb3PIrSedqk/zWM
	 134LzRM42Yy/RBIPv2gz1FEooz00R1uUNxDLKxn7FJkjZODOyg1eYHcdomUGLn3NYRF2r
	 RXaFldiYuEArZSXWeZR///S961VHEsVR4gLIeTAd3EDUtA2wUzPj9Lm11LcbGHBybLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cr1HltizvWayFo41XNkNxw+fGqlfdV0vW0QjzKRC/tY=;
	b=RBBvMlY6MCRnCZ4BOGoX+Ez/kOFvFGgL30IYVSXrhYIHp0RjGC+9cmXsN+E/3UOywVb7
	 FSZVAUHU0qP4bwSqEoJaBD9JlBJAVnfdVdvdn709dF2zdh/sitXKr6jc7+bd6cd6g+i9T
	 bDZ9rFzBAnJKhkwhqJ1Baz2BtePg1h1gbLl7MG1vjk2+VWzDg2aNMmjoymiEGlI+7Pjvh
	 MXYorQcrygODq8TO0uq6WWsx4f2UJ/BrqiAGSwXGiOyxb3kVpH1bAKR9nEDfqcMODQ5IJ
	 uSCjUpXt48UcqE0knMuiXYxwfIErLju3a6p1IwAb3Ex+ZIgNSyim5MqkDoRpH5vOmYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCYdfsfA;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE81606A901
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE81606A901
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCYdfsfA
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso2635054c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304636; x=1794909436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cr1HltizvWayFo41XNkNxw+fGqlfdV0vW0QjzKRC/tY=;
        b=aCYdfsfAXj3vohBdQYRudfCUIdjPEyILDtym05OSKtEwd0jXMpavlqauHhDA+pKctU
         OProCkm8DPgk6iUW+SOa3Sd5NjlogFzBUvRWew/U6LtsZ0U29pfqgIg8bgJl2OF/M1Qy
         GNJ1meuzJ492VoKYC4bEkHtz5rJJ/DF9RgLTrLLT5ra9nkEU58y3ECFa9FbkV37ZOkBa
         SXgnmbr/l/kG8yZqkL1u6ZQ8H2H6nj1um+BYSHI9+73O4mZXuzfrq4NGunBaQGHVrJ5A
         vrLjKcr27NvRuiXl3rhN2i/BzzsT/P+CGThWKqMJ1X6koOYUsjTTIDHTjIk0UC/MZrjX
         Yj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304636; x=1794909436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cr1HltizvWayFo41XNkNxw+fGqlfdV0vW0QjzKRC/tY=;
        b=FI1NchKKiQXtLctSBLaYDH+WNuzhn3W2AIL9NxYnq6xInwbccQ5YiWF4uvF5fZF6ry
         q7Ay3fZYlqrTwNTfBtoYeJxWch9wQRkrR2VxMY6ueQdp3AENJdInr/J3+5GXxImsMF9a
         HZHDsvEO618B4Uf6kX4WLAVXlcFnlQJSdIBnuQBUO7OilmXNsYsrgFCh3GGN71ljWJy/
         lZ8XJnjsT/4kXy4S9smMDsgA9A1s0gssLNtEvuFkjNl06A+m8LJ1ebfAgnZdFCeQtBLF
         RZmVVaBbsYosu/K0YkdtHyziSsYFh2KYYokNmgEeBD6iwZR+SaaTp+WSm8YE7dFcqsyb
         /cEA==
X-Forwarded-Encrypted: i=1; AL+hErFhZNqdK7pS6if7FAniC1RrYdDMOG5Ah000J0nFJ3JSR3KpBb+VCbsHu9ixvj2nqXEObHgQa0GiP77vW2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GYf6ifukBDK5VTqbUdTJw6pfn4/vNiLqS3UBbqWZ/n0deQZ4A
	Gcu8bxK/9Q0gdu5d5O3U4jDAuRBz09goLZsZdK7JkRc79S1N0I+E1cHr
X-Gm-Gg: AYBFou1VGTVYWuTSFP4e1hmOUOdLmfoi1/f5r/HhefmPk5n8OWJALfjlTsqBbJJb5Pd
	BcLp1mVRy+yGc4U5/7vbrCUNWl1kqbtx9ERDMytnVOt29F8n4ije+bKM/FeOFykeMsrBH2PjWYI
	X2GQYLIXy2u2qZyPbHEzWRSBGtvQJ2aIHTdkpsol2+QyABx+u0oW4UA+HIxHR0qJbAHu0Jfe6Qg
	OhpblpMj3CdFCrJk/4gGj7eMYjnaxzDYuzb4ScvN3vGN9Ox6XCyzUXw1pYzJSafPscSI9LFl8cS
	42gyzMzKxbaXIE20b0lVqQ0eap7nNGzDl7RmuP1jt8AjRYhtC1RuN13pSGu3/Xl8D+2K3ehXi52
	utwUsTGQXrVHVk3BQqJFoP/HIor3+HewpgsSmgEIDu2+PY5dfp69lDLNw8k4iM63p3Dhe+BEbwo
	Jgw0HUhUY0b2ABHc4fg1KMUdlfnUJXW21H7h7S9FY7NHnZsmFM57VMMYjP/bMGHccW6Vr8gtU4R
	+KYHOfuGBbCmSPOHTnxYFTSvOHxoPkG6UbLx/goOobswSfxf30hT2DPduGRQ2mnhwD+7jS7ni/H
	1mZaqkO8yKn2aSVQxAXjq294vAp8VR8nRRhkOVCq0fkss4yExjgYiywDhWJTIZAcFdw4xzTVvLn
	JGgw6k2aVCgZNkvWOHcGnuwTCM4PN7IQe9UYyLOPLdbCABw==
X-Received: by 2002:a05:7022:f503:b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1b3b6180311mr2664542c88.31.1794304635203;
        Tue, 10 Nov 2026 01:57:15 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:57:08 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 5/6] ASoC: dwc: Propagate optional IRQ lookup errors
Date: Tue, 10 Nov 2026 16:55:24 +0700
Message-ID: <20261110095525.504660-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
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

platform_get_irq_optional() can return errors other than
-EPROBE_DEFER. Propagate these errors instead of silently
continuing, while treating -ENXIO as the absence of an IRQ.

Use dev_err_probe() to report IRQ lookup failures.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index b0d3413c27d2..0d2be2d8d31a 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -961,8 +961,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq == -EPROBE_DEFER)
-		return irq;
+	if (irq < 0 && irq != -ENXIO)
+		return dev_err_probe(&pdev->dev, irq, "failed to get IRQ\n");
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
 				pdev->name, dev);
-- 
2.43.0

