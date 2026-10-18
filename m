Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F0A499F20
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327506; cv=none; b=O1+ZDTU76aR/pc/wZaHPT0iWmP6YtyHF7T821l5Wnf0FUFNM46tfEAu1IqTNxgcifHw63wHrmCWvrJqVVa2X9m/4hOt/2ngpaj5YmN4TBWb44xeUN+R/CD1JgZlMznjr+1f36aG2zHNo4FSlOauKHTWJgt90wLjMks6UX8vmpF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327506; c=relaxed/simple;
	bh=3I+4yCTTMxYs+18mWdxArezIbQagU+UQBy7qTOwjZjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=az9ESrfpISJ9uAwkITr6xje1MZCkSuXYzl9x5epMyMykoS8mLpMmv9YkOlOMs1DLQLCZP9Eqw/ncFnoK6efS3tT6qL6uGYKlp6Y/eVf5OEz1l+K2BmCF3Nqj0Hw27eOWsEHT/WBoTYUKA2OI+Vl/alCSXfk6Eizad1XzTlI9Zvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8RDj1al; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8RDj1al"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so8751735e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327501; x=1792932301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cw9JnxKH2XB78dT3C90Gx+S2oqjKdyT1Kqbq/lUTLGQ=;
        b=C8RDj1albbvMulghN4fv13ywPbmlZPvt410Ydr8ix/gJHRRHia9ws+7/viVDfO+ABu
         cLMyn2KDL69d3cDUDXDfFI/KKppYtlONY0girYzsBHYaiRYqFRD/s7J79uv8TsLX2m2O
         a7QLgcJW2waR5giClY1ZFyI4T8Dn2WM2T9iL4lSiDRRxgETbkfPAfcu+6F0JvNVd8snl
         XQrC+EmBN2wCxC8hDYHoZdv4Y+uRYYzp/BVATu8PCMNz2C9NvA3mZK3x/C+SMXITJe7q
         rGaRnEVLaPuvJ0vJP/R49iaIKGxSgTYFMjUyMlYLn3xDvi9IWOo1497Mnd0eTSOt2mbz
         8qMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327501; x=1792932301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cw9JnxKH2XB78dT3C90Gx+S2oqjKdyT1Kqbq/lUTLGQ=;
        b=AGuF6fPSYdJ9bVn2d4ginChro2F+8GEy3S3OdCHZh3rt2YjBIKcei4cNwzS80bQZJf
         FQvWJu3pCdU4QjjTfumkLgZy5/6EY6sRTmBJo3/69raM8fIiLYa14QKarHlIgoLl9w5E
         JxHDRe0/XQl0pSnaNumf7vAJXqRRdlIowpMeb2M1d4m2VEExjZwCyWuZ8I5ZFD+giAeK
         nUy1xEKwWW7lJMmQAkEC4M5dw91ZxgHriVS0OcnjehIkPUvBjIpecXkHvtz9BGmcT6Ir
         abqhY2+XYgHZdT8iQOE6n90ieuHF8mQ6XhlNzyXvQN7nsmnYttqR2pqPdHaZ0K+Pu/kk
         VU2A==
X-Forwarded-Encrypted: i=1; AKwUvBy/0lp15izu6NFWgrZtVUMt8k7SuoUHOpRP8QjawgTUB5lyw4766FIJ8aqYcyfhSTa8eqCtNpvYOOBl/Dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7VJifqCERCIBJMsosR7NVJHvPd91qRcmaV+FxnFQoriksNGjZ
	qyyxI8BGpEb2+il6EFB96E0oVlAT0miKae4WiOeFQn4ektYY56Nrr8Vc
X-Gm-Gg: AYBFou0X9vyU2dpTKj5nPph79dIgDZduIwuAsom+sDfZNXnU6Aq17xTp64yNl/buEIu
	Ou9/xc2siplSXNgeo+qG4V8OeI+76OOfdRAVUX8lpr+qi7w9rfy/VG3VsPvyH9TT+jSYusYahU+
	lkR9a6oN/SDiZaI0nqJ68nfRYMfl+qwfcC0beREiiSK0STvgtOHR7h94sSg8iRysLfZgZDi9N7F
	rYRsW78wBKJMlDzy4fEWOswNf9YQKR6O0FOnZnkbk8pkcw5WHQgWwAmEfQQtVatfRlLeTVpZPxJ
	42hqVmWdrdlwzmHm/Lgw13FUhOsHqfDEltvUQ0+uaGppBKdgrGga3NTwk5w52sCNghPq57ADNXN
	lZa9pPPh3NcdxqmxCmAWpusCAUFloJOgRTg4dwWj2Sno25wvzLfIhRwoXiHI6/YndqpaNKxieqG
	TJ9R47xWscIRox9HMZRB7OAOGwJtTNWY6rSUgoyPjPwiF4v52XasWejI1XmJk0cIy3Yv4+8kSYA
	2BAxmZ5BPmZZj/7xU28xpf6OfSpEKT097evpGPAdQG+AaKpFoDPsG0vbaQyXKNXLdJMu70zkloX
	3QA/T7KhB88fgmnFdeshVTr7vx2Y8lH9QoUcQ1Q5QQExmVKDDfgz7QjyTBwT2MYLwI6gYSj5Ibz
	MalJOpc7aS89Adt3TmH85C/c=
X-Received: by 2002:a05:600c:4e03:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a1d75ffbdamr115371105e9.19.1792327501266;
        Sun, 18 Oct 2026 05:45:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-318a-f58b-5e43-a2b9.ipv6.o2.cz. [2a00:1028:8388:a84e:318a:f58b:5e43:a2b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm16386408f8f.42.2026.10.18.05.45.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 05:45:00 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: dts: samsung: Add support for Hardkernel ODROID-U2
Date: Sun, 18 Oct 2026 14:44:57 +0200
Message-ID: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces device tree support for Hardkernel's ODROID-U2
single board computer, based on the Samsung Exynos4412 Prime SoC.

ODROID-U2 is the predecessor of ODROID-U3 and shares most of its hardware
design (2 GB LPDDR2 RAM, LAN9730 10/100 Ethernet on HSIC0, USB3503A hub
on HSIC1, MAX98090 audio codec with headphone jack and on-board MEMS DMIC,
MAX77686 PMIC, PWM-controlled cooling fan header, blue heartbeat LED).

Key differences from ODROID-U3:
- The micro-USB (DWC2 / hsotg) port does not have a VBUS supply switch,
  so it operates only in peripheral mode (dr_mode = "peripheral").
- The 3.5 mm jack is headphone only, and the board features an on-board
  MEMS digital microphone (DMIC) rather than an analog mic input.
- There is no expansion header with SPI.

Hardware verification was performed on a physical ODROID-U2 board running
Linux 6.12:
- DWC2 USB: verified in peripheral mode via /sys/class/udc and dmesg.
- Ethernet: SMSC LAN9730 detected on HSIC0, link up at 100 Mbps Full-Duplex.
- Storage: microSD (mmcblk2) detected and functional. eMMC was not tested,
  as no eMMC module was available.
- Thermal: /sys/class/thermal/cooling_device0/type shows pwm-fan (no fan
  was attached).
- Audio:
  * Stereo headphone playback verified with speaker-test and aplay.
  * On-board digital MEMS microphone (DMIC) recording verified with:
      amixer -c OdroidU2 cset name='DMIC Mux' DMIC
      arecord -D hw:OdroidU2,0 -f S16_LE -r 48000 -c 2 -d 5 /tmp/dmic.wav
      aplay -D hw:OdroidU2,0 /tmp/dmic.wav
    Audio routing includes "Mixer DAI RX", "HiFi Capture" connecting the
    MAX98090 codec capture to the Exynos I2S controller.
- LED: blue:heartbeat blinking with heartbeat trigger.

Josef Schlehofer (2):
  dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
  ARM: dts: samsung: Add Hardkernel ODROID-U2

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm/boot/dts/samsung/Makefile            |   1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |   6 +-
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 139 ++++++++++++++++++
 4 files changed, 144 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.54.0 (Apple Git-157)

