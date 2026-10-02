Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A20446074
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934594; cv=none; b=KaWURWeHvQvvxqdKCLaDBhbQBJR6Pl7xJIzkpRhz/ogSYUQrU24RyOm7X5fvxQIThk7UCUhn1p5E05//c0/4KvpOzz7XUeg1A2IQAOZ3gxidpBa0GXW+LSTCDQxkna9yLPBkxNS38MTSnuXQvtmuI99CISBpl5om3NRoxUCtLqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934594; c=relaxed/simple;
	bh=0UD9OIqCmDhTrj0b9dG//QSQztmY8kSUpwuV73z/Ymw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q5Zl9WPuqUiCO4tInzK0gshVh8H0A8NQkTLU1nTwwTTCMM1ADQO9TobgnAQTACnTvI0DrLG7eXdXVxz4nLIT37WT6m2gA0b3RzuXZPS5fHN5slVcBqb3TOGMgpPiioMmBrWeA+qHzwXmw2KdOkpulGMBaCrY4Taio1au9XOtne0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ArwhLn1Y; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ArwhLn1Y"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a09e2d0f7dso2579815e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934585; x=1791539385; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=17hXUf/wpq+x73auKkD+LetKx3d+qKZ9hCfZeZlNHuU=;
        b=ArwhLn1YQtw9zAkNY8WFJanj2LujvtQyX0xvO+4+IMDajPq145SxwNWBPc213oKq8O
         VrEsPrHf5TlxllWeRTt6U8DCwVykQ40DLSnM4WoJs6Y8J4kaFDn4o2+4aKzxBaqfgSaG
         1p2p9TsIhRQuXtgaRXddO3t77WPTdmWdP2k68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934585; x=1791539385;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=17hXUf/wpq+x73auKkD+LetKx3d+qKZ9hCfZeZlNHuU=;
        b=JF9bIxS0GAncjQhQookWesgGbbo5LTbW8nDmWNnz+7ZBbYdVJ6nB+0Moj6NVtxer67
         piMz7bt7crAtvrlDnJvkoSk1TllXi3ZlRMTjLsUZamvTILgAXuEy6rv68d/k+sVAjJq2
         mfBRU+KNbrOplhAFTekiNlNYlbm3R4TNzJQ2NUtnazQdOk3exS+hUIRTWrnHryMLb9IY
         o2k9MwukhuBmH3ApcuLWt4eajoSqvoLvHXN4ac9r+WYpIVKf6Ivl73PcNxiWcEWdnQ9P
         vPu41bMf+RbK1EEUVBHCyx7VkubGSfaQUEPZ8mjyG4sp5OYe/pLonYo4NQWwIDFHXVnr
         hs5g==
X-Forwarded-Encrypted: i=1; AKwUvBx++AIIrBoe1Jn16pU6nb1fyfcC8uruNj01gxf81dn0Yh2wC6IT8d3RjiuevIVEwndlF6QpYTd10M07oN8=@vger.kernel.org
X-Gm-Message-State: AFuF++lc+j+BStiFGtfK0pgzwnHZMhRXrn7DAobSErt8aMpXS6r7iFrG
	/WuaSiZ1LrK2tAL25RKk+n/krp/apcLCuvraKRi5UjK5ZpeXEOFfzo4hK7srsPSAQKc=
X-Gm-Gg: AYBFou1qeLyhh3iedZlcGqaOPfBhN/Nu7oomSBap4Wl6ZF9sLLOmWO3gQJiQj6mItu0
	SO6hmN8Gw7Pcuq1GBvwAKGQL+dOT8tWIJBUk7ioI2ifi5i7MnBsWudOqhqrmKecBvuEB3Sdfy71
	tBNvdXG6N4EFuUeA5gSet9wMDZHN2sxOh80XbPRX9qj/9Q/K/5G4b5EXlk08YWAY3C4JXfuSlPE
	dOcjlGy0/TfJS4+CZwKZy1BppQfD8NV8t00XDqoVKxNreIz6shvy3XZxcjFo1QfbMtMI4zCsqOY
	EmezbsB7tVK2NJmv7UJh4PSyU8GGEukLmrbh567WlIKQTRJEnzQrY9cPY4W7kq2FbbeWbEkA/9+
	q9M6utX7QPKwkOLT7GHnwj2LegEdgq6NBSYGEuWYxcvx+Y2bbeT0hSd/EAOEW5B1RvWWq0Klhji
	MB4XX6qdiW337GlzP/2WGflCyYFF+KKsuBD+WNQxpQ04MAE2Mqc9F/6v4sOd59+P3pczQxlguAH
	eE=
X-Received: by 2002:a05:600c:3144:b0:4a0:1c0e:b2a8 with SMTP id 5b1f17b1804b1-4a0275780d3mr35684945e9.28.1790934584855;
        Fri, 02 Oct 2026 02:49:44 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c8bb0sm73051165e9.11.2026.10.02.02.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:44 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Subject: [PATCH 0/5] ASoC: pcm179x: Add support for pcm1795 and pcm1796
Date: Fri, 02 Oct 2026 11:49:29 +0200
Message-Id: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMj3fL8omxdcwPTNCODJDMDIwsTJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tALTQLfVoAAAA
X-Change-ID: 20261002-work-705f20b60284
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>
X-Mailer: b4 0.15.2

This adds support for the PCM1795 and the PCM1796 to the pcm179x driver.

The PCM1795 is register compatible with the PCM1792A, but it encodes two
of the register 18 FMT[2:0] values differently, so the format encoding is
described with a per-codec table instead of the width switches. Only the
PCM1795 has real 32-bit formats; on the PCM1792A and the PCM1796 a 32-bit
container keeps the 24-bit code, as it always has. Left-justified, which
the driver accepted but never programmed, is added on the way.

This series is based on a work done in 2016 by my collegue:
https://lore.kernel.org/all/20160311232856.GC27257@panicking/

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
Michael Trimarchi (2):
      ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
      ASoC: pcm179x: Add support for pcm1975

Roman Smrž (3):
      ASoC: pcm179x: Refactor regmap value lookup
      ASoC: pcm179x: Add left-justified formats for pcm1792a
      ASoC: pcm179x: Add pcm1796 as compatible with pcm1792a

 .../devicetree/bindings/sound/trivial-codec.yaml   |   2 +
 sound/soc/codecs/pcm179x-i2c.c                     |   2 +
 sound/soc/codecs/pcm179x-spi.c                     |   2 +
 sound/soc/codecs/pcm179x.c                         | 116 +++++++++++++++------
 sound/soc/codecs/pcm179x.h                         |  12 ++-
 5 files changed, 101 insertions(+), 33 deletions(-)
---
base-commit: ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
change-id: 20261002-work-705f20b60284

Best regards,
--  
Roman Smrž <roman@amarulasolutions.com>

