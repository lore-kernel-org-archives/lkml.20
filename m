Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070553;
	b=bMujgf6WMs2HhOuw3ShDQo4mFVDYteMpIBGHJPH3+nrzdyqMAC8Y/nbdiT49tfph5JMP
	 3mWtdCutg1aAgQOUpNxP0oIIhtZqLaU5EO8d5GvP5qH76SuJ0i/d1vyfGxFiqQsdzWqm/
	 eDbV+o/6cDVEhpgaYMKl0Jyg7Vio7ppXjx3Sjcl7dAbIWJWEKt/iFgoYKIXaaW+ABhy34
	 s7ntATxwQHXUsONkNBkYsWIg6eoVoBudiJSFLILHGtZj5yzLSqpBYOf52xTsHd2SC2Viy
	 t1t4CDEFZCQmlbI7tb/jIoz2VVip8BBnwubeNH4rG4r1cuxs6Knc8zQT7Ou0KtUIJ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TEGARoUazb0CZK9Y7+6uTs8sJWEMjS5uHIP12nGwzPw=;
	b=U5HQA3hWsInIwPx1e+hSBoJicyvo/kvfEMeMDwAj/Y6lEYjuNhco/HahumkFFZx1uXOy
	 b12EPg11pF83ISPsg1cJKQke4QJp4HKA8Jly75582jTbyLnqnlaxUo2c/sI6P7sgLZxEn
	 3PcPos9r7Lz2jn5VF2vdOkOwDyEI5gutFFs5GmpoI7JFGBmIg6aKqiGMBGUJc4RoAipTc
	 tPVfmznnFvfYJQaqFwfcERuu+6BhRG42YsCVY1DOn2aFkjySOo0Jd1lGgTSj2krkLfdYK
	 jj92guPxzQVHSCcQgA7d2SDnAbz6rccyA9b4Bf77VojouIAHaDTxRKr7ZpveGBIRVtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PF3svjCZ;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E358606D830
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E358606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PF3svjCZ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490a0e72588so803724f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070552; x=1794675352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEGARoUazb0CZK9Y7+6uTs8sJWEMjS5uHIP12nGwzPw=;
        b=PF3svjCZ7q5UlZ12sY0J4HeKiTsdNl/2O2wVO4EVNvCk0+54rUOz00g2nQvgTcnO3D
         pPTBgX3duHnzXILDn0MFIUtxEH9xuIdF05Royyyd4KjDUA1h4vzdblboCkUzUN7fbSBz
         wV6Ax2oiZLHRnFCuDDmM3t9SgTNNO0AmU76O5AcXQ7J1duYJQcVpuDkxp+VMTIzipXiy
         jwIpIN7yaOkz1UzjQPiK0Sm96btg1QPAsejvn2j91CxbDtt7tbthe5SHMjZK7aLmgAIF
         5lKunlXM7yFlXLSQpfOFvOQosIX1f/IKtidTRMPZyegf/+s/VCZG5nHdpbMqE2d7rd5t
         D9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070552; x=1794675352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEGARoUazb0CZK9Y7+6uTs8sJWEMjS5uHIP12nGwzPw=;
        b=S24fuCfiOtWsJx3YH2GMkX1cKkMg9FSCE//FmOgqClTZvjv1TKi6OTMb1V4uVO96Nu
         YDXflcB5XFRmatIswbAfcenNnGmZ5U+QtYfNJSWDiwP0Ya5K9pSNc0lNV2Xja0xkjqJY
         psngIcsFnKeOzvO3ZOau913hXS5AHDGVIQ99PYMkYdAgLNRVqMhkHve82B0+Hd64Ye6g
         sCE9njMaZoayIubFgzBKJzr48NQ1XUViIMY47ONBtLd93ZDCpqLjXnNBkiAx/TBZzhGm
         q3HGdW4ccVIdrwPn925vXtC1kl23A7plpXgIy8jJU2FiRXas7KpC66CqmoS+XIX7zRNe
         6B0g==
X-Forwarded-Encrypted: i=1; AL+hErH4kUVxaUnjcdzIzIXbduMdyZV4l1rjN4SC05V4KxppG8mBMSJuXb5nMlmQnrLQBNtvIVSiOgcEZw0DIbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ns5odhy0MmcyxVF17v3miZ3v95hpURRmsxBsCBuOu4IqFGMvH
	m9UFrgJN1YGyY7jWcfvXJ9PK9vyfshu/wX7J/iCwTydDNyMh3zSfokdf
X-Gm-Gg: AYBFou34Vf+58my1OoqKCSUO9BSgTY7YeP3BPpv2cgYGdakmwIWn9ksbuqBIeMNyCac
	TobCR7EKURi1RuZxxHB+cm4hXgMCQKcc6yJa3iKg57xBDe/fuaUvOnfP5qTVZbrJOixSumzsyp+
	Bsmc/0cacNDcuF/g15L7gEnIcgWgaHBgV9wZgDf/qBCkXnzFY2xIR14AM78S/7V+3WH3M1gLgFg
	TyRo4bRm3yOUqL0unesTs6woYj8Wa31wejrNZ6/3qWoenhZeio6Vn/RUHAtRm7K2hu4NakwPfjN
	KbJmO1nw7A6WleeXg5bpBHu+U+UJcvbkaeEbpNC0ruIf9+5DafINr2pPaS61AlgyYS+FqQEG2df
	sHst2i6/Fg218lp0ZaceC2gzYN2KHj/gUk5BQydubu2lM+pcMsnhZZ7IrlsJ9cN/nRGQkUSZFNB
	ZgCfg2Cic4L9s/iaB5AVygAODUWaiv8ghLdY6Dyi3VIVpt4dIwyqwzX01l5iOeyN+fr2xxMP9i0
	J4vYLtcf4SQ2OUsUmnkbB49DobZRryRbP4ntxG9wULHKG9CU3r62JIydDzGvqGmoi6JZ3C7uRt9
	VY60ETfx12dteCqUY/Xdl1kLlwPff3p8wTWUhV702uAo+5DH/Ou+afM=
X-Received: by 2002:a05:6000:1a8a:b0:48f:bbf3:cf52 with SMTP id ffacd0b85a97d-4927ff37842mr12135105f8f.52.1794070551891;
        Sat, 07 Nov 2026 08:55:51 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:50 -0800 (PST)
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
Subject: [PATCH 4/4] ASoC: meson: axg-spdifout: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:27 +0100
Message-ID: <20261107165527.576383-5-jude.gyimah87@gmail.com>
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

axg-spdifout calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifout.c:(.text+0x9c): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFOUT unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFOUT=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 53eb4b7aaa04 ("ASoC: meson: add axg spdif output")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 10c7d59a5ad1..272639dd8eaf 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -76,6 +76,7 @@ config SND_MESON_AXG_SOUND_CARD
 
 config SND_MESON_AXG_SPDIFOUT
 	tristate "Amlogic AXG SPDIF Output Support"
+	select REGMAP_MMIO
 	select SND_PCM_IEC958
 	imply SND_SOC_SPDIF
 	imply COMMON_CLK_AXG_AUDIO
-- 
2.43.0

