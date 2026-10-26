Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030487;
	b=jyzT4DwygZYwilAbKR0+B7Or+z0D6v4L65iu4bruKTJW+SJkSHIxNh1xdEJyK5UHk8FK
	 Rr0wsGLjGwCVgtWh/UQP45kYnLh3MJfrI7A5/zpNFICu7Loski3svQm5H0Zsp6xMzMRMr
	 +xkuAPnD+0SMJUmil1EGv6Ne9lVrdLZL78k90Bhbw7Sm5OIdhxybvtpZ3NEunNrgWtfvu
	 9pKTS+dF9TvUOHI1633dbXDC2RwwU1R872aqcwPC/+9rWGMhNPFmXf5f+ybfMr/VPi098
	 cgxPWpTsgxfzrz/Xdb9ydnE+VuNj0CkVEpmvwquARm/0RdnnApG1CORaUcAFnIrBuBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ieFDF25dHP1edNybu7K5/jDCEdFup8w+Bgydwx+0E/0=;
	b=Za1hsfSN5vRZ90lZhYNf2HXlwl0p4M67ty3ySEyZwi7GFBZIdQjVhtPxuSsagiG4I+qh
	 rbJUZM2TRAEhAGJp7ugZHWjofrXC3uGXtBDV9DyU4VlIsTpDbNMwMqzvYPh8x3PbOo+Cj
	 MIGxCuDcLV2o6zAIovrIrm6o4sivihPaVnZj6nJD2zRmhSHy/Cc4DiXKlaBBF2LJoX3Xz
	 cu+4sDflnOoPk84NyaFJrkKfrsGJt876X/PNCKzfG8gI2Caipa9V5wQAxbAA/a2/YYJ0e
	 YREHoJJryxDHQIicAi5zQfO171W5zuDJ2JIgc1qCIee9KmC2kRljPPot2P9hVqVPMtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gsE9AsRf;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16B6606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B16B6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gsE9AsRf
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4677aad67bso338165566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030485; x=1793635285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieFDF25dHP1edNybu7K5/jDCEdFup8w+Bgydwx+0E/0=;
        b=gsE9AsRfp/au/VPClVtisPgS6NL256YXXHzhJBWy3p1a/BBvDH3CNC7dLlGzaId/YW
         pcOXtpWKTQYLZG12QhmvYxybnaQzqn2QsD+5YxfukWZr2gAbkqmwsLtrq0wNsrXeNJlP
         cqb1SzkAiWmtSCwz0Wlc/vT0MRZ1dVaiTkol79s82Gy5KEELqMsZ2WpuVeM+OaV//05L
         cWQ+CW0oT8G4nEGNsznxPlH9ZPL67128KDXDU5l5bGAxXBsOkRFptLyviLgsWLy5JxVS
         qcReQrkrfX3dtt0wKH7H7Cqd1dmRgKnpoJ+MNADCxuesWYeYESr46w0hAGZUTThKNIem
         FVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030485; x=1793635285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieFDF25dHP1edNybu7K5/jDCEdFup8w+Bgydwx+0E/0=;
        b=JIN/GiEN07z1gAeG8MEiJT0X5M6py+mYI2eP/0bahnOhMEE5DkYWpo6FQ3ik/LGvq2
         duOq05LFUmAbHdEqVGxQLAu/YyegPV/fOqjxYOUFpRFE0JN/KxVD6nT6jpkwfjskdHhv
         TUfq5i1jdBbqCtI2Og63JBF/SUOXAkQR2sykVlqV/0YERe4MMEDTP7oTzJX60MjJf7Eq
         vidpQLt4x5UkeLGF2W0knkhVABwSg7avPG8rJODuWHCCgkXqjoJ8rOVNL+HjRZE4RaLl
         /qyqA2JIaNXc/tdABUq/YLk2VLk/AuxQgyPLo+IQY1W3jX/9Szy/zYW43ONZXLuQZ8ue
         u66g==
X-Forwarded-Encrypted: i=1; AKwUvBzTwOKaK5uR5QEXGSBoDXLaHsGzWO+QSKIDQb7AL7yza0IBgMBOuiBWQgkxRcDksXSc50AHMmxDE+33btw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUkaAmA/jvAXfs9eoUrx9aArAmS/T66HO7THss9Bb22dzpUOql
	Tdted6ZenOawDPS+5cLnXyp221hciuqfqniuBdilgU8iJqeUxi30Purln7swEkn6bWM=
X-Gm-Gg: AYBFou0JHJX9tRvuBEz7WxKlXOpLG8O6C59sFnfXlpTwu7CUJ4FNIqf/YakLiJ9Mr5q
	T6FkeFy/fQVjvLSkssn9vsBb54aSwWlOj9S0FlJyswfczvru06AYhbMD/rqLpjlWuaJmWKNyWc4
	eth/DQ905w959YuQDi6AMfMeP+SEmgM0TrM/418N+TFDWcZGGEi90MU9uTePmWvJOK68cW7QbGm
	r8GDIguHy3e47VsXirXIBn7YCMv/JydMWGZtO4Rdczp7VRtbi/TtlLVQF4GvgXYtx6ODn6PNJeN
	wJAy6AIXZVLSEYNeXGOKjTMaYcMj6KSUbpki0gqjlRb5v9+olWYVY2AdHhd3HiepjiX3vYhHNqK
	5DGEUIxhG/IDCHLud8B8MK8uPMjhAUK5huZUVK0lBofof1sM82D6KUuCGtm7ZvFaj+a6hYRIUEr
	c5nwHOWn+TmM45XUwYR6xB85+u2UCbakaZTY4rLFdJ1fhaeXXvlQn/JDkY/HV10vwJ+9fpTdJts
	QgYLUC5YkoINom50USKseWMs1JxVk8YMGMxoWTN4yjsa85VArJR1MX6ltyq3OKaDH21/aYq1k24
	J0s0TdrmV+XZid54HzrnIPBsiMV9RDkl/keP
X-Received: by 2002:a17:907:94ca:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c46bde7eaf0mr1008564766b.35.1793030484647;
        Mon, 26 Oct 2026 09:01:24 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:24 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:18 +0000
Subject: [PATCH 01/15] thermal/drivers/samsung: Select REGMAP_MMIO for
 EXYNOS_ACPM_THERMAL
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-1-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1279;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=+KG/D0KvZbRCiAETwTUCvZNQ2kPMmB1TmI4WJYpa5dI=;
 b=2yYo0FGBL9w+ojSMILSlcsZfUlNX7O+SioBKk1y25nYproZ23ihVuFC9rL3cKbPnDkrkXyVRX
 NrWjK5uLAq8B/i+SeoGzPZ+7+BlB12MD0bUop+iIEYL7ezkPiyFgupH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The Exynos ACPM TMU driver calls devm_regmap_init_mmio() in
acpm_tmu_probe(), which requires CONFIG_REGMAP_MMIO.

When ARCH_EXYNOS is enabled, REGMAP_MMIO is selected transitively via
EXYNOS_PMU. However, both the Samsung thermal menu and
EXYNOS_ACPM_PROTOCOL allow COMPILE_TEST builds with ARCH_EXYNOS disabled
(COMPILE_TEST && !ARCH_EXYNOS), where nothing in EXYNOS_ACPM_THERMAL's
dependency chain selects REGMAP_MMIO, resulting in build failures when
REGMAP_MMIO is not enabled by another driver.

Select REGMAP_MMIO under config EXYNOS_ACPM_THERMAL.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
index f63eeae304b7..18ab4ffc8671 100644
--- a/drivers/thermal/samsung/Kconfig
+++ b/drivers/thermal/samsung/Kconfig
@@ -16,6 +16,7 @@ config EXYNOS_ACPM_THERMAL
 	depends on THERMAL_OF
 	depends on HAS_IOMEM
 	depends on EXYNOS_ACPM_PROTOCOL
+	select REGMAP_MMIO
 	default ARCH_EXYNOS
 	help
 	  Support for the Thermal Management Unit (TMU) on Samsung Exynos SoCs

-- 
2.56.0.257.gf7497c7d27-goog

