Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238902;
	b=p+jZFQSr4HeECGaCm3gYuwlajQh2zcoMoELUniotE1GNerVn+5GyQ9krfX02OD21WdCA
	 uBFkZzECgOIqqVLtF5maE3msg33O12FNKZiexLxfWr9NboDCVvK6ieJQEYxMBrrUIvg8S
	 wi+jWB3NKZqbg/yJTk60m6VYYNltZESG08nIoX15MnUbOCcWBSVl77+YdYbsUzdtw1Vnu
	 cyY418w0d825xa/+0aKlKJPA4Pvps4PVYHoFHT3BQpOOPTEDROwojC2l/hVX6uFOFR/1w
	 w4xL5801XU1TUNUdrsMVnYVrNA/tR9ouYK8snQBMRa6MLUgM31QIvmxcbOSG+OMp/cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=585xw9jBGIafN94+2hL8PTvVRoZk2mBN5Pq+TZee7eI=;
	b=f9EdFCMnolmmIkYWJ5NjfhneFA2jv4DjSOwhukGdruf5W03EmSFHIqO2/2y/WSUfr47b
	 qFRNn11U/BhFtbXgZHhWORnRbpKBfig75wNc/8jnVzqCj8ndNxw7lk3FCz1FJqwnGkf4M
	 nAiRtKaFmKtMh2QNVjRsMOvfUgqw3OcadA1HtGAI9ID0wPOEc6/4vHfhqLNERRyUeING4
	 LHamzlGs4509qFZQ91PhCIy14tTQKx0urpkYraJGoMcWUrlKXa51a1lzgwRXSv12LFbIW
	 goLs1tR0lU9L/8EPVlM8gRe/uy4ehf0Vw14C1z+TdPTDGUsLN/X2rf9ABPEBDL5Z2sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZqfXKPnH;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D47606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D47606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZqfXKPnH
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso7450675e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238901; x=1794843701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=585xw9jBGIafN94+2hL8PTvVRoZk2mBN5Pq+TZee7eI=;
        b=ZqfXKPnHKxubWeZmDq5uGQCPUXWAz4pz9eD7KK2RrGmiaerhH/4u6/jHe//xdFrf4F
         3B79tpi+logTiRZuzmhLaqWQxrPHo0r40sc5bFZUjPpqPhInf9CHv+vOwowIQuhwrabh
         U7eCZ5cbc2DKkazmHWslXL/OtZ41v0cQBo1pLEtJ3pw6HRlNDWawkAKih16KY+Wu2RT0
         O/sJlD2tE+PUW3YHd5tXdvYQVGfWhMRWHETBzZIonmo5Ozjwm0dbly+GJ8R2TCUjlZf9
         DXwy1CUss0x6/0CJw4noQMKh3a2tFEVH2pUi2/gnZvKqWiGTZyhb/65dv0RxM0zbvdXR
         inNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238901; x=1794843701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=585xw9jBGIafN94+2hL8PTvVRoZk2mBN5Pq+TZee7eI=;
        b=EjnJSKrgpvY8PbMke5kpWrsyzF+Ond6i9piD0R/h9m59PxEbhmAI+GxyUUbQyNZdeR
         0umd+qLx1UnVo4/ZHkBj2uNOHa71HPfuTn57+T4irYqvFrD2wbjl7koIMQHeo/BprHIn
         uXrm5EMiTcYGdrVsQqHqiIIVtGSR95TRuvbA5qgc7hMahJ7FZs8UjSOTZ9fJYco+hqUk
         2T69AQaQ9y//e/WgQlGH/dOXR3mhVmSc+ctcwGd+6II9Vp2fMo/heCWJTUo6b5TR4hIi
         kyOdr6mvBZzV81ua9qlw81gv4ofZxl+ciMibQZ++/zcPsSfxnaCfFwSGjr7FijZHIxZM
         q72A==
X-Forwarded-Encrypted: i=1; AL+hErHTt05bR7YCp/yxCU4fv+7wKmGjimrTJ6LlE7MC73yvL2CHd4ifKuv3UYgPg1n1200aaVcAMHaZ0UajaEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2dJuVhJahlcQuFrRzOjgQK7anFpcRFTpGL9QXsNcq/oox8/wq
	fVFZmm6OZLqoykp1EKlgf05bp+PBOocCbZO6NE3+3igvp31wIgzTA141
X-Gm-Gg: AYBFou0dNapjTpkdVtl5u3oOM/aaBgkldJZVlhgzM6TX0FjV0icvE8tn9ldAtjhsd3T
	zRDUQTXW9aurOvn1IdKhZT94EmPXk8caqssx1y4tUgGy5Vyc1rNG0a0aKvV0JyfPsjYtf063W6y
	10Xo75BL6WKFhr0PijBGUJ+HKQ30pxe++W81urXYBOw1TYMDf5rBg2CYqNgGyrBzDRYLuZeZNEo
	D419QCaPBEVApHByPykxC3AGXcaHCz1bHwsGi5G3chzv8BDX+kpFrchEWMc8+ym2r1rcRymzZoi
	rbE1s4ImH93XhbhrHUQ3fK8NsUSav9KAs56JK1FSJmIsYD3H5xXl6s8rdZGQ6sXyGSgpe7ZDBBp
	foKebLIVx3D1k7KvPLh870JUHwN0M4HcBYpen2nPa88FVyhfPV1Z5XRZ7EKQM6PPVybjh+h1Mx9
	EXZe4M5ik7jktDlSDIH3VRM73WjN0PbboRFeKc9Dl3ZYj+UmiedODgFZ63d73F6YyFP3/+iwNCa
	RcE2Z++YvmBdhHD3xwrasdMhH9XjYXlQs53Ge5Zqbogl6pm7FL7oIOkV0GlKbXRxuYLN1UEKsw2
	fVdN5ISHIjauvbuWqy2NpR9p/dRBu1S88veQ+07WelBs2K7Fi9qlL8F6rocec5H6M6k8cYDCeK6
	G/w==
X-Received: by 2002:a05:600c:4e92:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4b94d76c213mr90091485e9.3.1794238900743;
        Mon, 09 Nov 2026 07:41:40 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:40 -0800 (PST)
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
Subject: [PATCH v2 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:18 +0100
Message-ID: <20261109154120.592392-3-jude.gyimah87@gmail.com>
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

Several stanzas in the same file already select REGMAP_MMIO,
SND_MESON_G12A_TOACODEC among them.  However, SND_MESON_AXG_PDM does not.

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
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
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

