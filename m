Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940037;
	b=pYPHUDsuVhMcXGiIdnk3ynoiEeJAHEelSTb/yHrcjpVFfCaENIXyCRv6OBmUYcZcQ7WQ
	 inA8jc1Lzi/BlUnq2Fzv1SgU6QcPHX6xIQHikYa6RtL9wsVBH5CqS2Mfu73JwakzFx5FC
	 13wugai8RXnCwNVW1EQYdc5eQ9tGXGILJ7d0HUotrvc3gTV7zo31d7txQn+WR5acIcR9D
	 V7BVJXzi773D3s0xw5zfG1ow2N64EcC5UiHbTrxLm03GX5sG+uNtO4qyTLvGZ6ZfO988s
	 YyI1/hFrw7VtNLM0y9braWcDuSgnrI+dTUdInbzGCWQ7ZV3iZYGIxOW1HinwxoItKsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m4kAH8DCfpe22OkmCb4iXEvhigID4lmHLEwsjbr3sm0=;
	b=OuphFimuha8nvpsJ12cnPmt/oUVtmqvKbwR2M+1uu1K4hMjz/TnHPPkTyBEII0v4Tpqp
	 bobj1aPiO1jbZ98/b4MluEG2qeotuwUWoaGNpnyvBlxM6YgOb5JHcvJJs4FE0RinBzKPf
	 BBNM0yolL5zA5GMbDTnvIxxNuLpMLff4m7Vc8tb/0dhGj0P1yWRPxM9uxtXqXfmxCtDsF
	 qIF4Sg7ngKsKlJIpwJUnoaxprZXgJ5bwSSiH+/rRRhsbro1ZEWJ0JbQpzOMZ8AAi5pjEZ
	 HHYrz55tkrPo7qYoCI4EYjIuObghfDzOaVXQapp9rXgl1YbKKZx5U0hWip5OWu0hjLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WIHJ5XAH;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCEE606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DCEE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WIHJ5XAH
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df54150dfso1170415f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940036; x=1793544836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4kAH8DCfpe22OkmCb4iXEvhigID4lmHLEwsjbr3sm0=;
        b=WIHJ5XAH8wgyHoq1C/naLVLPt+y80xFDDGNa+UkjOww70HePVeg3yChQ7FXqcZSOvI
         MUa8cdxJtMxKYuOkdaJGnVl0ec4XE70euxMXCkjxAECFZOlUt3r/r/yOOb7vMk4aWiFx
         Qbv/7+aZkOPppaH8z0TlLvnVk1FrXWDt57Kn2WEmxgB485igiHHwkdVmO9eM8vXa3jzH
         e0Zug3sVA7L5miKMQubaV9fO3o+FzxWNlypujkbEf0DE5rHP9j0BXOKSYghd5TF4+rVn
         rgwugEYuZbsuGnS7BSWxA1Vvtoze1MzwlOIUYmelqoG2M5EnB3A1tqKUwCe1cRSInDMM
         G3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940036; x=1793544836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4kAH8DCfpe22OkmCb4iXEvhigID4lmHLEwsjbr3sm0=;
        b=bXEZdCbYTcmh7BKsiTp3T/daPfffya5Aj1549Qt+Nf648J4UB1sZCPhkoeHv3yWH0A
         8NwJupkiAj+2JoldLMxWtJM9K70b6yDT7ANgLWJ9Ks3Nq9UwfC84tR0dCS7VKIGVqcrt
         kyKEFCYm16drSMmOF68xa5o1km3cDHuTZCcLBFX4SM2HnS78RXw7Gu//frQS8S8hjZPi
         fBT9trXFuQ72sRg0+C28lZ/2MJPl1ptmuJkC8c9ST/p85GfZLeXYGYBjC/7YZB02l5vy
         F+WxtwpCqZiccq8HCPZFmWiuSZ++qhvXfwrbYYibNDg5vw07NE0G8RdmO/NJihywwZI5
         fk+g==
X-Forwarded-Encrypted: i=1; AKwUvBy2AFe9I2tHTxhxCfUrYRTqdJXR7WLbpyhu/Nq6FrUV/mnW1RQyF1whrH2mjQ0Zv2ZKQOklrsCRemkDw/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5v/spkN86JIskvE0kKeLNv991pEcJPA+Q3QItsfUA3EWL7C8e
	3KHFAlj+BvFYQnUkLYlgev0eap+7wK9mM9jgQvM+C1zjtUgFDBaOUl9BMaxuSrS8
X-Gm-Gg: AYBFou0E86cniw+PTTgrS/fTiQml8y2gyzUYATwa7IbhXbVAiVMLWFNq0vwTvgjhVTG
	RHdPAZWjw12O3DYfh2mqZmsgndEFiwQRI8fCjYhfzYJtNkLhKmuKH0W1mcyFCgssBeSW/6MEJ2Y
	IXhTlgJefKprXmsoa5fRIhccKp0pdN294KjcZAOUsef7zuP6i6mLHB/YvXvmMjnEW0cBZv7aWJs
	NPwZuSrhoJ8ckSEAU2FH/vnyJoqK4sCxFdTpPjUG6A5DkTZ6uwA//K/OPZVgJq0HuMB+aOSthiO
	wKdvum1LZPiRvKrSKkhHSC/jUxxIUoCtnD/vS2XdOQPb3w5UyDn7jAouh1UT+pKTK1eKLSJPLz1
	WB4bHRrENDwgQ3NyyvA+a7vJFfpUW4EjPl2T/CxY1Q8Nnj/eoxLeoxQcnaUWAh6fB+z1IdJ/d8i
	iul5Hs+pItZ6wMO+pRR2bpMzu5uV1Rmhg8Ql531e8adOSgcIET/1U3UXIyMuyoygNTrXEo7U3rw
	SVOwOOiPSUu6FNIE/ii9A4l0KIxqHlR6c3VpI5Wf0SpqAbr2Guw7DA38Nk2v6WMhrGsm2fLsKqd
	rvdxsay4FHVC+z5Yc4znpfj0BEcvC3Rgxbn+DAul7niB7cVHA/4BXQH5egLA6XdfNRoF0R2wK+4
	NoKEiHI21y+t6ERkR
X-Received: by 2002:a05:6000:260c:b0:48b:116d:56fb with SMTP id ffacd0b85a97d-48e3eb2b643mr8140142f8f.1.1792940035370;
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm10986471f8f.27.2026.10.25.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: rt5631: Support an MCLK clock from the SoC
Date: Sun, 25 Oct 2026 15:53:52 +0100
Message-ID: <20261025145354.3476371-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The RT5631 driver doesn't take a master clock, so when MCLK comes from a
SoC clock output, that clock is turned off at boot as unused. This
series adds an optional "mclk" clock to the binding and enables it in
the driver while the codec is active, as rt5616 does.

The board that needs it is the GPD XD (RK3288), whose device tree is not
upstream yet. Its MCLK is i2s0_clkout: handed to simple-audio-card, the
mux picked the 12 MHz oscillator for 12.288 MHz (wrong pitch); held by
the codec, it follows the I2S clock, as on the RK3288 boards with ES8388
and MAX98090 codecs.

Testing: dt_binding_check for realtek,rt5631.yaml; W=1 builds for arm
(multi_v7) and arm64 (defconfig) with SND_SOC_RT5631=y and =m, no
warnings. Tested live on the GPD XD (RT5631 on simple-audio-card, mclk-fs
256) on 6.18.54 with this change backported (the bias level read uses
snd_soc_component_get_bias_level() there): i2s0_clkout stays on the I2S
clock at 11.2896 MHz for 44.1 kHz and 12.288 MHz for 48 kHz, and both
play at the right pitch. Boards without an "mclk" clock are not affected
(clk_prepare_enable() on a NULL clock does nothing); not tested on other
boards.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session where I
asked it to fix the pitch problem without the RK3288 clock change that
was refused in 2014. It traced the clock ordering in simple-audio-card,
proposed taking the clock in the codec driver following rt5616, and
drafted the patches and the messages. I reviewed and understand them,
and tested them on the GPD XD as described above.


Romain TISSERAND (2):
  ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
  ASoC: codecs: rt5631: Enable the optional MCLK

 .../bindings/sound/realtek,rt5631.yaml          |  8 ++++++++
 sound/soc/codecs/rt5631.c                       | 17 ++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)


base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
-- 
2.43.0

