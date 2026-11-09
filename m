Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238902;
	b=GCUvwBnoR4wbmOB/YJOVfBBCJbdbaxLmoFFAgyRw8MBglF9rpE97VF8aAPdzJy0gpnLN
	 zsxeJ1uf+IMIIvBl5i0Oo7yAqQ+W8NEAyfIKjw5IkRraVYKY7HVxCh8KubgcUonkWoWMm
	 wRuAFylD62ApjXnp51hQvVQS2PZqdSD+fEC99Iv3drRgxSo2pIUQOY6S5F3svGaGfkyDi
	 +vgub0TyZy3FKHFnEUvVJY+nt2ckySpnp8gY80iU7Yz6uxXYvoZwQtPpEgT+Wvvvj/yMq
	 SBIMNbMpTjB3Xc2PRWOR5cvZPrko2KmGOqrglmxeuD26GyMZJcnOpcE03px4KIAL74w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gmgl4U92sUaeq/fSzBRONwmIvK9ejAxa0Sr1yFZjy/8=;
	b=ppPjRRJFWa2xd5od1NdrlTw120pSL/1J5fNACNDSPsRBzhNuuG9czz5p1EfnUgnc7dlY
	 lXVeacWvCQyffjT1V+O04SrBceNPzHnj4haYhC6NpMyc+bl227pzqkC1pzTtihzcEDrvu
	 VPmoJ9iLeJBeC7E+gRAhXt3CT3unM5lhav8/cbEpZZtwH2TjBbAFwgUeFI9bqcBXJz0iY
	 /6dws1Uj66AXNKb8BmFVh6oByQwN8JnrHDQNXpSUxMJHe1uzsSq0cLGrEgFelErgYjzks
	 BtBh45OsdOBjEl6M/aV2koV6flihkCXLTNnHHdkQzqTmxva3t3MYGAM42fQYTZUzd0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJzKxBt2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0CA606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA0CA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJzKxBt2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so8191445e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238900; x=1794843700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gmgl4U92sUaeq/fSzBRONwmIvK9ejAxa0Sr1yFZjy/8=;
        b=dJzKxBt2EpLvZoLXHahlVk4GK3hLlY73ohpXBwbX8Q6uDBOFpsYwtmXUz09yPtqkDq
         dF5toolMezqGdq3JSaBnBEVPbD8R5gwxMgFczOTzKiRupwEFwd66kKbvwvUwKkuoC0PG
         gNIrlDJpPGqr9/9X/RpNnS9eyo585Vao1l8CmNHk1H5CbBaSYlnwvNhZg2DknaBPHVx2
         MTcxtVH8IgYiK1MBXbdAsgbTo5DLwWqUX1DfFWxgOUb8T1wLSARFrGUZvhaodQjfuptp
         M4Pr1yJEgo966psLFJwyKrfSOqBQyqDNeqcUVp9xdo6BLmTi+2peR2zD8RM2Omd+zPeZ
         BuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238900; x=1794843700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gmgl4U92sUaeq/fSzBRONwmIvK9ejAxa0Sr1yFZjy/8=;
        b=zKmUetiYLg17wKWU41bsQB0auWZe1lseFgRX4zPgvrP2P5nZELKgqlmxrMOikM2ryd
         II1t4b6N/gbsjcKNs800nCHkSbiOs4wmhu5avjYS61MRQiR977JdmhtYq8D4gNWSzSN9
         16s2avJwho8jIOfeXlMMREBTETxhaBHxLbx6OOlI1ySa5lDF7ZAXJsZmW68IJkIV90c5
         viAFT4dPnJWy5lpsAEu4tZYTUbmUfPZ+HzCmMM/VbHeZw5NCliRbCIUkrGdbWCYf1CQD
         Zv6VCEt7wtU1hTxInUNC+YIWhGKfRvbVpfmYhrbCsVAd7Q1uOgoWVIjDBhf2Fy0Jh1ZO
         Ft6Q==
X-Forwarded-Encrypted: i=1; AL+hErHtG01euccMy1hTXiJ07K3DIXqXZQKaUnJYnMFmXDXAazA582I9juuPqN/XaD2ViCsPRBalGWIBsRBmAQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ouI/FHS7vjsU+NV1JcYx3nB/GbNG1lpu9kM4ENCvZgBfQokRD
	OONcsmLuBHgAt/fWXo/bCtY6lGYEt4ci6pTxHrn5e9elybbbS0qVwyDI
X-Gm-Gg: AYBFou2npXosyI8sYnaRC9+WK5q998uymQHIOyRLCf6smmWLEskExA70Zt9Szo42oEy
	4JwcM8c27LgnXtGg/auYq35qfln/QxpRkJ5GC4U79fbGrNNrZ/VlRO8rin8ZAzVTicS6LlW7IC2
	gSTXMes2Rv7a/afmdo716uOUjfdm5nNpyvI7trOat0VgRK4Uti3BP7qv8CygvyMI2SXHv4poqpK
	su3fyWqmJmg4YI8iPvHLAqWdBZ/kjFJ9zVEnUd9KrltDK6PkK5vy28ycKTxbD8nQnaPYTV/+/xF
	k4caFsm1CU0xjPq9TSVX0iH6g7L2Tm6c3a6ghYPgmKDOPPUOLD4MNaXpHT9/IbEB9WQ1it/FZT4
	JxuaZn8EcR2juCek7FTdKhbr2nl7ypWwwjKEHgEesB2u4HDLkd8/YO5py6KOfkDLNlI2IU9NsL6
	poI7It0dBOz76qODB75R1rIUDpNIaje9u+8bGEFRWhk2AZEgl4tUU5OVjOIwiUoDs0OuuaqDFxM
	YTBnKbsS+aT3kzNghAkENyQ6Yp/toijVO9AV3A6SI8pgAB/2nWTcwER1Ywkf8CoH6XMpLPL0HSe
	hEDDJSPopMclvy1y9HQu62a+rIGlPKStxyGefSONNz+OSwXTOCPv6zNpyV8sIhE=
X-Received: by 2002:a05:600c:3b87:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4b963c6d630mr91396875e9.20.1794238899925;
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
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
	Jude Gyimah <jude.gyimah87@gmail.com>,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 1/4] ASoC: meson: aiu: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:17 +0100
Message-ID: <20261109154120.592392-2-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
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

gx-formatter.o is part of snd-soc-meson-aiu:

  sound/soc/meson/Makefile:7: snd-soc-meson-aiu-y += gx-formatter.o

so SND_MESON_AIU is the option that decides where its call lands,
and the error below names gx-formatter.c rather than aiu.c.

aiu calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  gx-formatter.c:(.text+0x74): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave SND_MESON_AIU
unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AIU=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a..d0f60f8af2b5 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -4,6 +4,7 @@ menu "Amlogic"
 
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
+	select REGMAP_MMIO
 	select SND_MESON_CODEC_GLUE
 	select SND_PCM_IEC958
 	imply SND_SOC_MESON_T9015
-- 
2.43.0

