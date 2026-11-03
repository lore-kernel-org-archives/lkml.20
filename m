Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712368;
	b=sLkNiB31BB4iRdOirBNnfCCs34Jhcg9SXKVZ3/sLMSPOUuxm8hNv9PvXoydDcXzcx1og
	 Tgakt5eNG/ngSlrlPrA8Kchx4Jbl2PCR+YOBj+2Q++Q89DWYv8f3POVVSSonw5LdmD6CG
	 EXd7UEM2cQZruJhJAPMrJLnFzBDvTapCb3SBiJo4OkUDeH7ZEW8Qper2KpF9hQJA0efqZ
	 PgpXw84jy14fZKk3Mkr6PhzB3Q13iisTlORf0IutgWxYDDnIDOBrvA/pxjBsqSqdWL7RK
	 OBNaxli/Msa0G8yzB7CyefjxQ6UosK8zQj5mwvc6mooKMRvXCRwLEVrbkAAAIytjtZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y+g2AMTya4HYz0zERnN4BvDBd0jLIZfZI/CWvcyCK8U=;
	b=qqeBj0Nr0BeEonMEAPVf3aLzpD1Z9zg1DDxmkyEFAlOj2ZId6kGE9jBw/fBCGGmchDsf
	 wRK2Neoop2vORPJZoN8FQWc15EF7ekDBhIOK5ggOmQucmOSdubjahuWEOvf4J63Phsb1q
	 ZaanOXxmWLakCSrEbZjbwXfco4KAwExqC0fEk7QcrZIBlCQv2WWH5QoXNun+7ky0C6J1t
	 lfHg6osDdLnfnZASky9E4Z34dmujcB6+IsV6nKPPW6CSxJnkX8ee7Cf1F5gtZWxDXusoF
	 ghnaDHDOsHDGwlRdf2uJ0burL+VQ/Al/tEJWIfhu/caR8y8VvX0qvKFMmYE/pgeFkpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWlnjz4r;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3D1606D831
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC3D1606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWlnjz4r
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so4331205e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712366; x=1794317166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+g2AMTya4HYz0zERnN4BvDBd0jLIZfZI/CWvcyCK8U=;
        b=CWlnjz4rrRz9SV2C7HxzrXH8uQwffRboT01bIdNjdoU/CpU6VNRuT7dV8mJLhkcdQu
         C7EnTSgO+/V8b/NINxTfys7U+6VyjOflCbVwdOD9b5BLKcsm/KQ9ikH9BfaSQiU0Qqcs
         6dZt3WZKHzubmah3bts/maoMf0MV6SgvWVrwhg7ejvl4x4/eArvRHPlDpvQIqfp51Jju
         Cuvrily8cWhaWmvS+MBa1sYVOtaRdEro9k/ZdSL5pYr5IRNN2LWtas9TtSExGOiB0Dp0
         zpSS8XqpkecAaCZkm7SatmjWhyDtDv/PHb25cGCxcrWFzmH3PIQRz8pfzm57Vc2kKkG6
         KqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712366; x=1794317166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+g2AMTya4HYz0zERnN4BvDBd0jLIZfZI/CWvcyCK8U=;
        b=wj/3+kwJNA8/XBJbh4GBlLQ7QwZK3lgU/RYhxU/zjQGXTI3hXGrlzZIUvvAQrGh4AL
         P6alGtXWsf7U0hLYtJ1YjgHinCZNGKW2aj4qKLILltJB7GyA0eKFOFJxz9/LdAIESdp7
         xAvdGSLd6hrnl/R7knwyn71kLKeyl2S5ZpNbnZstWf9l7lWaEoeFaaU0kJPr8zUsLHJX
         awZlO57bGyZGpKHYdf8pNKCjtYPL05ZW9cgoHqRIBPxfGLNzv9QMA/gCGcrJVuAW8Yby
         WZKMzsIkUw0EijeGSmAAT5evTuD1hWSolyDcFeEe/tDoiZ4xablcR66x2lBiVIws6W+t
         AwYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcfJe/+EymDy9zOQG2f2A9JUbp+F0o6SWgSyit+PoJsOxnR0YZQVPbTopwxhdgZMejKD5VZ+d2rc+Z3QU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kx1k7EiXhen87gm0HAUPxlPcoeX9xAYEVlAViSg3pbCtD2mYJ
	2+xrRJ0wspkcSpWy/CtMcvBGZ5O6ozswnWdw0//KAw4+Ici4uTIsvdpw
X-Gm-Gg: AYBFou0az6bVOByYcKY18JnM2z91qGWoILSu3kqy2dL6aOCorZX79ZKd6CZyLEzQ6+C
	89JVnEUdyq66iPOYxXVG9GC+82x/5UeMpVwT3kRUKZsI2B1p5ZOGu5ONOaWSXEuapn360bVZpwl
	1/dFzccsmUKUhGU3rbCVmvfwt5hjDP/pm01bQDM6WFZFKccVkCK/RbsTIJv66U91nMOQ4B04I2j
	gmlXEiBxbqrf/Oa/NeFsv7aufqfAb8fF6BhQs5/EY7eiJU50NIZ32CbPyRUedsdtpNGnFmOlBHO
	teL2eesKPnzBQDyTHHHEdfr2ophtx8IsGL50YWf2qt5itsvrHQvIQOsmfN0t6lDJFer8xVtTziV
	W7ClSgzHYxkN065Prjpwiuhkxf3wxwAv9E4Ta8wDGu/UBX/6fRuG+VlPJ6dIlp+QJEscnhlrSGZ
	vBb3rT1HLarGcMG9jE7CmOpNwG8o+Z9ai7nFRmdv1x0zOhTgjJGPlCpNaq5poVFF0Isebmj5oWc
	8U7Zwohy6rZlWLxNYCOuMUTucWEzc06emV2cGnobEdI/CmWMPAguja3wuE7n9JCpd9pO4YvE84E
	6P57GwkCgEW0D6YfHtyOVVa1xLHgCuJLOYYENV9ucCCM0DzJyI++7hPd79yZ1mSSdvJFyZQMHrZ
	LPA==
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr301749905e9.16.1793712366192;
        Tue, 03 Nov 2026 05:26:06 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:05 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 5/5] ASoC: rockchip_spdif: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:37 +0100
Message-ID: <20261103132537.3717496-6-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
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

rockchip_spdif calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_spdif.c:(.text+0xf67): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_SPDIF unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_SPDIF=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: f874b80e1571 ("ASoC: rockchip: Add rockchip SPDIF transceiver driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index aba9a518d3b2..0e5110125c14 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -45,6 +45,7 @@ config SND_SOC_ROCKCHIP_SAI
 
 config SND_SOC_ROCKCHIP_SPDIF
 	tristate "Rockchip SPDIF Device Driver"
+	select REGMAP_MMIO
 	select SND_PCM_IEC958
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
-- 
2.43.0

