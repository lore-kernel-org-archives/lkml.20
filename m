Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070550;
	b=I2414DoDbOB//M9MYLGDtBfhqXj6seNQ6snFb9FB+0S/+qBnIhmz2YY4kujMy5PKlBbU
	 sMePWbTmZein2BRnpeTSAvtuSouCRK2qT2mS1s4URDOLniug1YSWWMu93QZjxUFMhkK5n
	 8bL8AIlR/R9Qm6lKsy31NnVZ17MRNXF068tTagMz6CtxVVk0zHPG8fviv0ENnce9DQGAa
	 gwL/cc8MNkmDEqIFGll8XaQcZYQ1YMNn9pCN+gpaH2ToHSzMeSl/JmLFjIw43IjD2ZWBp
	 jrYTB2jP3JjNDapvRTTiptxce+qCkHQTWZj0SXtRr1HsEzfrcv0JP2o51C6G7FyqyGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pu+Rl+gMqP9If0Ub7sYkKuMz0VatAGisa2iKuQxjj6U=;
	b=Bo84yG8WevxJm+Pi7b+Oj1btKzgHH1//iZNdIko44xZXFOsKu9VkyMAQAJhXvysXjO/Q
	 khlwNnwfTXyq7a12RsVEVVkJPAhIWRQCR47cw4norw1lRn8RQNlnj7XxJV62gViBq/IWT
	 yOXag2RFfd1YybdErhcvG1c7Bpf8x1C9fItAj85J4TClnSwYo2xf6Xgx2vMwfIq1kh8AD
	 YYlBcjfOTSRqNCNMwrx7RNYZmwXrHOfDtrQ4c3g5MeXDuYHGuPSbwSFpn/bjbelhGczNG
	 N7RKP51TQUJRtO/9k4r04TlnDnhn4KWJcjjT5umP/9htdJYI9A2cin84ffM3OfXzvBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c/uEp2hQ";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1EB606D803
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A1EB606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c/uEp2hQ
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso963457f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070547; x=1794675347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pu+Rl+gMqP9If0Ub7sYkKuMz0VatAGisa2iKuQxjj6U=;
        b=c/uEp2hQ5+h1kDjotfTazZWstUhzS7e6HSsa+UHnqcoOOLBTbrl/vru19/bg9xVXqD
         XIMfqUvA9vMstBgEKbq1bx20WSF4nYSAQFtnOFlyHMTPzinUhwNIuOEoxNL2lw5NNwmF
         FDVUf1tH7enMnOdnsJWaQQC0wm0Nx1xUq6ZGbCs8SiafigHagHLQ4iQrPbifC8jtvCm9
         QRzOb2thrB5Dm5yKDL99TwEvweldMkiENsrlFfIOdct6PugKqiEJ6gP5h++m6Hv1TFBA
         x5SrX1+eKYiICgonozlQUmFyJ4fr4P2A2SeokQKGBQkVU6LvLDXfqz/K8WRL20+SwWcn
         Hs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070547; x=1794675347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pu+Rl+gMqP9If0Ub7sYkKuMz0VatAGisa2iKuQxjj6U=;
        b=2hixCNI04/GLKXUP/41oo2HMdgzSDY06MIzAf9iXWLIQb7N2qyZyTHcefl8SK8X8dU
         OBukCZS3kBRJUhvejzotVgke835An3D3QKg4b4gG2TTpvjoNixxJF3790JLZslAgKC3d
         G3bf+SDr5hrkxcYW2V1zXwehFVxbdFu7Ysbt+dmbngy+cGxNFx5855KIqi3syKrNO8AE
         hyC27VhNsDw1AqJkhpg65c+6e+Q+hVqjgHyDIYz3e3KsHt+6DESD0BwVCa1YP2JJeSMc
         7i78l2mVIEnPaFaWncUKd4vO1pOGKTpnvT+arWH5k/8y2vq7H0aI3+As5SABg4wa5uhh
         ngtg==
X-Forwarded-Encrypted: i=1; AL+hErG0yVxjzQRRg/kgeJK1l/zTE6AEX/Pc1eQL3rZBZVUptp+qgOnHA43lAL3OJpUinRXDBsuaGkKlPFEGcfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EMD4XBR8QH3wENwSJ4KUZ2DMkvSSEIuOAQlpNcMVFsLUfLC4Z
	8oeFfhb1K8iiZJ1lfaeQyoYDI83YtST72XWfzKHOjXuxa5vqov3RXNYJ
X-Gm-Gg: AYBFou3Esl4Xo2fZnIG5DVy8khxMIqiUiyYSCu5/TM0DTMsnChLAO5RHZhm1kWpPlRf
	35NczVxcauPstV6mkMoj0+XyJ1mI0kpejvGv7RqQha/euPpCwmHlw3tliW1ORn0owpsWSxr9vgd
	4FOlbGxr2XQEfIBJQrWcKsjgVeo4kANBUHlE5mIXAHAKfzzG3jtje2e0jLZ2GJCSoeDIlFRfMsb
	2T53jPvOPEEpN/+ARZhxCSy2j5SRwujOkVHZxZ/lrorYi/5IvmZ2X/8FXhFiXqdXvOBMXh3QuPm
	xSul6uHGUuUBdS2Yl0Xgw7dYVFtDeWArYT679+rsYi6/uIUthxlEG+pr3eJQoFvXcS3/VyKWltf
	e5lwO1l7jJ2Y1eZEAkqm/TRqPWst0HYqMOSgzMwvZ+r9mmcPUrkdr+thW3loCGUb57SqbP5ujua
	MhDkhg8r4OClPYKzCir9M+5F7wo+bzbaDjPDda7+rojAzOlqK/2DViXE+0mjNjTiZEvmFxVOZZS
	8Cl+hrLhsBXVv+6QL7ngaNlzQ8J5XY6akLKvqw31Fx654BQnZHwV3gh+36xScE5do3yPXcCbowd
	nNhxaDyvMlr8SkmoZhaMK6Zr6CwFq2zrFw==
X-Received: by 2002:a05:6000:40de:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-4927ec0bb02mr11650221f8f.29.1794070547458;
        Sat, 07 Nov 2026 08:55:47 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:47 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:25 +0100
Message-ID: <20261107165527.576383-3-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
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

Several stanzas in the same file already select REGMAP_MMIO,
SND_MESON_G12A_TOACODEC among them.  These three do not.

axg-pdm calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-pdm.c:(.text+0xc4): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_PDM unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_PDM=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 2cfc123eea74 ("ASoC: meson: add axg pdm input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d0f60f8af2b5..4b06a9e7c72a 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -92,6 +92,7 @@ config SND_MESON_AXG_SPDIFIN
 
 config SND_MESON_AXG_PDM
 	tristate "Amlogic AXG PDM Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_DMIC
 	imply COMMON_CLK_AXG_AUDIO
 	help
-- 
2.43.0

