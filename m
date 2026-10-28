Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195961;
	b=Cok0xv5pWJT9sFDDjr9Ia0BwFyLs7XKXrjqUV+AFGihm6aI3fQT3N/DvQqcM6rBv19A/
	 PZ1WnELFRNu4RV2NYYp2JNcnqUh02SNhr9Hz2uXsrvMOpL75e4GYopp0FYjjf6mvE/5nq
	 6rPOA1pbKFUZ7YDJu2DOsM3/lqzsPHiYx2nkt9yyQbjpBixhiVBILbFRVmH75+vpGbUEK
	 R/OADhjkcQQtTWjPBO+9n8Jh99hrpYE4QyzdEi5b5fGSefC/AQtEhe5V/glWxrgqRJaqk
	 O8cpemkTKSBBdQujZG2ox82Xzr7gZNFLGza3tTc2+eyu4T3jhRfInI0A5QQJEP+mIHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=;
	b=lIKtNfbIsljg/Cnkt/107K6EQHAxcXDaZVVmfecagr25HmxY5KWX07XEjxERBMjPLLe9
	 dsU7HnjAX2cOXH7x6oYLYzUjIjondFU6UlWw8e8qPr0nXRY9GT3xy56b1o4oFC6CfDMDo
	 orW9PDMvrvnPJ5uZ1FOitUCtk/GIUsPwe9cfrFhsBwjlqDNp4WStIWtQzCPPqIHAzWE1x
	 j6xpoly7HDr5EkBPvc6zP0h6dT8nbnBlsWNqbQM0lA8KXzEDFfabTmKj9BCyBHQBKovCf
	 plUcYU71sfuFMIxvGpmfFn0NYLvvK963zUD3Hg3k6dvxu2ryVtJOBXTOORMbsS2kRtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=d135ZkWZ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB448606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB448606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=d135ZkWZ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso7647665e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195959; x=1793800759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=;
        b=d135ZkWZ0M6ftIv8qzLvPuqcdeM5tiOBVyUBSN3wwckCuVNuqXSnhL2Buf1IoYHKIu
         B6jnFQVFZiphxcWZz+Dx9fEfUWyZZoC0l0rG/AdsZ7VIwPMfLuM8Gll06pKM5n7gO2Jz
         3fx14VVhccXZZwEV6t81TRS5U8smBXLzBV/8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195959; x=1793800759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=;
        b=pbBRo1SyFO27b54c5dRHLWe0Snv3d2YKaVSuYrHzv1rmoL8wyDf8Uax4W2QgvcS+ce
         lN0ffncU9hk9gWOFJ10Pn+8dV01dp0aUxzO4/D2n7s3YbXMdX0EmhU2bQSLA6vhx7U7s
         ZA5WNX0U5kE48QQ3Vzyt61WBeyF1l4/6ApVdvFbzkdsE0byicOI7mZ3rVzFX+y7Eysot
         +zO+UEVfvxrvgtEHY7rHxrHHXOLW9tIRoD94TRdxieJPqOeLDbO89FE6h9TailtKJiso
         QjUbgxFBSyr6GDMuSQyccddYPk6mcuU4/PGrw4OCbRXw0hCpHrq/CbjB0S4MJ8elZeiL
         uUJA==
X-Forwarded-Encrypted: i=1; AKwUvBwBEgDv3f3tR0FpJoF6y9Jz15/klqMkmGMT+nGANxeNRqeSRa2qeALmwc67HOgoJdvPE6oQbWCsGU4CuqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAk4zwTxUYLiJfKTxpitJ5QY+tZ750DidXflLujigd4zoMmsgB
	ulOb2NU1nTE0+9VaWPmWLcUTbyOZ2tz25L1xyRmgQHgqU2UWWwWF0b7Qxt/PUBXW0pg=
X-Gm-Gg: AYBFou0nGEJLdT9T0p36I1tRD2ptc5As/EMV4aLkVXi90dEr9wnEo97VfaPpHcsDyaf
	KxlrFcOyNzDHW5WZSc6I7h9aE0u1JUr1QhrvCggtzcfR5zSwimk09T97Iwkz8npGB2FG823pwDl
	stVsq2QSm5z1y/l6e1tVz6M5FaMRpCGn+ia5nUs+TK0mj1F3NUkWZmRQP+PZYnipYlC90sY2zc0
	mGyc16PzDpjSmMw/qvevTv/EYfLCFcOZ2dU7orsFdJgo4aRBmuYBJw5lJUX70POqCJhiQnpbCFn
	JuwNdrpTncPP45ytFENKYF+liIFx5tjMym/qzbvvwxl519/yYsQfY7v+VXc8RpxYiYPOo0+vfsB
	lqwIsPc1/Sf5h9055ZhTToJyY6Zfr23kjPVSQw0M65xvNa9975zZgaR1Dxv2vBdTtx/THbPoiLv
	o67z34k0YVb1ee7Bo45gnQ4MDSFzhntCr4ynKicWo3J5lp7OX5U6VRoIF1CVSKVgz6w/2IMWFzo
	B/FDK68qAlwuiFSJ0T+xri8PvajCUKZbUDPiVjl05Zmipxj2KLT02vZfcPIwdLPm7LSbr4wGHWh
	O9r2SlzMpVpjaa3w+7+k1cUJmcMpGdHliGz88NEkkJlyQTRqEBnjwUql6BUF88k64cqm8jXfLTV
	aMeOTipDEK/tNpwBcfJlSU7TzblbPckd+J2ug26YS3L/T+RwiKJh7E+KeRgmektPScfQtmQ==
X-Received: by 2002:a05:600c:3510:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4a966774dc4mr52485205e9.18.1793195959170;
        Wed, 28 Oct 2026 06:59:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 0/4] Select the STM32MP25 LTDC pixel clock source for the RGB output
Date: Wed, 28 Oct 2026 14:59:04 +0100
Message-ID: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
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

On STM32MP25 the LTDC pixel clock is selected in the SYSCFG
DISPLAYCLKCR register among the DSI byte lane clock, the LVDS PHY pixel
clock (reset value) and the LTDC kernel clock. The SYSCFG node is
already described as provider of this clock, which the LTDC references
as "ref" clock, but no driver registers it, so the RGB (DPI) output
can't work.

This series adds a driver for this mux, probed as an auxiliary device
of the STM32MP2 SYSCFG driver, and selects the pixel clock source on the
Engicam MicroGEA-STM32MP257D-RMM display overlays. Patch 1 is an
independent fix for the RGB display overlay.

Tested on the Engicam MicroGEA-STM32MP257D-RMM board with both the RGB
(Rocktech RK050HR345-CT106A) and the LVDS (Ampire AM-1280800W8TZQW-T00H)
displays.

I am sending it as RFC since I am not sure about:

- the mux parents are referenced by their global names. Should they
  rather be described by clocks/clock-names in the SYSCFG binding?
  Moreover, no driver registers "txbyteclk" yet.

- the pixel clock source is selected in the board devicetree by
  assigned-clock-parents. Should the LTDC driver rather select it
  according to its output (RGB, LVDS or DSI)?


Dario Binacchi (4):
  arm64: dts: st: fix the Engicam RMM RGB display pixel clock
  clk: stm32: add STM32MP25 SYSCFG clock driver
  soc: st: stm32mp2-syscfg: register the STM32MP25 clock device
  arm64: dts: st: select the Engicam RMM display pixel clock source

 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso |   3 +
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso |   5 +
 drivers/clk/stm32/Kconfig                     |  12 ++
 drivers/clk/stm32/Makefile                    |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c      | 111 ++++++++++++++++++
 drivers/soc/st/Kconfig                        |   1 +
 drivers/soc/st/stm32mp2-syscfg.c              |  28 ++++-
 7 files changed, 159 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/stm32/clk-stm32mp25-syscfg.c

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: stm32mp25-ltdc-pixclk

-- 
2.43.0

