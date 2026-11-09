Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238904;
	b=DmHvhsLJTlaV5mdgDyELl0xWkc/h5fx0KWwkZuEi+fvVXgzRYfOpynKecLBQOTUR0vlB
	 pb4pT9OOUvpw7NOW4ZTiVxQrlAOv+uBhYT+f6wnWsqMW/vWX3pcjCyOKZ9hjfQKyokNjs
	 K7XydCClf71bFfq8RF+SA+UwxNl3lrqwSAAK8JB0JkKDzQNMDA0wHfmt1fPa9N2Olzv3P
	 tKW01Bzq07QoMsfMBpjdblF85xn5j96EXR/kQfheGLSRxF7qADeBPJ1tJJ1Zf/qE0UGEh
	 MaDyhTmXIc/1gOgVMUqodvU1hk4rgOKXLZu7YWtjfRqo5tLG2A+zUKGUbwU9S/47XXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=;
	b=CaN3vuF0btXrEmzMaXTX3GsCWlMEYcSd9k/3vyh7X/K4jgodnnWOpzT/3udfY6KUQTME
	 xE55ANk8LF4alWYF4WHfFAt+r6y9ok2y+rUagtOAlOX0qYb6uFolmCIBj2UM0flPUohJK
	 D+6bXhrqnTTkAIJyc5eap+YACKXdRhyslzWh14XyTfG0zpCu0c1UbySSJv4stejSXb+TC
	 fPifdEAydo5P9LYf8RewW6CX/zj5wN64LYPbegLBEOAMuuNSWurr7BAcME1un/WwSBjOE
	 2xYZvMzP7RSSmPyE8xY7WgSbS3m8K0Xzk/nupGUlQdIubxcy9uD0NLP9z0IyPtly99g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2IRYRDE;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C8C606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C8C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2IRYRDE
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so12465215e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238902; x=1794843702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=;
        b=V2IRYRDEW6dfC/zMwiv5i52coHSR6HRTWDTVNhOsO53P6V8DSfdK1r9FW75k11M/bn
         u5cwpI7gNs5xMh9zfNuE5xepf3hvpX3JFr9ODYeaY4m3xP9QiP3Qz8oiMHnkg7zF9gSf
         fducrG1HsLlcsEjNfzv+mcrrBpLZdACGJ5CILOqSCH4SA2LPWRbGMVMcyoOwZmlXgCih
         eyo+txNU0RVtnvPvat94ijiEKVEll3hI7WpEBaw+EbsRpraremGPDX98+Ysby/B8ZavA
         4aZBNzgXq1iCY72liAg6ZgSjtlvbudtFy9imzQZ6/GckZWJCmMbLkBCxapcbyme9mdcm
         PHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238902; x=1794843702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=;
        b=se6EA0JSbKj5gJluqsEryrmSrRNsvETFeHxdBZRhpITK7bsKTSQGSKEzmv0DwsmAnO
         9D3w5Gz5YdpgoI9zGaQwEA7NtlkziEiFz8A0R4rdXglLTdARGYEgm61EoKHs+w1dtX5c
         pRqwFLOVFoNwfISJwBQKn3oA5WvGL/IIKTGthZnDDuLSzy7KaxqT3bPhZPPZjE4GQq+Z
         89PHUTeYQxmdpugpdNYEmNXGWRZv4UghzZmY/Mk20g9mh8PKTQ+GWnH/cvl40j/+UBOt
         SoJhTk/oxC1bL6ur6WLHLVOzPb8zgzttYQeB769LQyE8spU7ssN1LsCrdXkG7/MX7y/4
         UW6w==
X-Forwarded-Encrypted: i=1; AL+hErEwCPU8s3jL5adeRn6vHA34VyTG/My3RnH1MftnjJ4BsaYPeNf3Mogs2HPVtR5r0Cw7r9XhBqHtNq8yCjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C0kcZe4zYOsqRMahd8sAE/qaSpcnIej3Ht32twbjimPSoIoXo
	MkfpkNiKO/yh5xksn/OdrNDVa+o8HHnukWB4dLjHCGgL/J0TtTzwTSqQ
X-Gm-Gg: AYBFou3q/j12VP5jTrZK4ExaPej6o2eEbubYFrDq6nfKZSQyXkNeGmuEzFYvcWiheyJ
	eAGGw2XmNmWtWqIxAWPBA/psoAD2dvrf6jFh1QOVZzCp6Y/mpdtckwA9udR8Pssy5NnTmBMpoPk
	1BJFKt+8BcPqRRiIj5ayqNGk4Zd2Y0+GTjg8ygVOjV0YvMjr2TZBkQwE/mdL45oi4AWRZwAuLHF
	MuOBUmybVWquv3BoiH2AF38lu/182GImcaDW5p9iZawyWb3KXZ0N+B3itXYUYUp4nVlmrnyztSx
	s1JqDak/MGQ3lDoBh+Z0B411kOgs7fqb56YhzQlC50+8RV2kai1mi1ehKgOx1+5O2wX4ENuG7u/
	lsEuqf5ZbvLWz5V6nbOocfBwsy9aPhqNdMC1oXA+q/iY5VeA3z/5NRnE7c29JHW1qX6nQONxCCJ
	T15EwS5yskSLSesV6QjL15bih6S8YEVpSweYMtZx1HAPSlAicqn2+3e+WeROP8ixG3/kEx/ZA77
	IP4XzNWIAkYn3bzQvsHTf7cVM2CfvAm2cyJnFLl6Ba0ZaR4YPHyaX66/yhRp3HbhOnbblEBrhB4
	qO4RftTUuYUki4WF2FbcrAmnFZOH1hsGz5Rl8f05zwyNjynaLQwMFy7i9/LW9fD4zzqIi7rcTRJ
	PiQ==
X-Received: by 2002:a05:600c:c114:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4b963c7c6e3mr61028555e9.16.1794238902401;
        Mon, 09 Nov 2026 07:41:42 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:42 -0800 (PST)
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
Subject: [PATCH v2 4/4] ASoC: meson: axg-spdifout: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:20 +0100
Message-ID: <20261109154120.592392-5-jude.gyimah87@gmail.com>
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
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
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

