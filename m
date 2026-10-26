Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975273;
	b=23jWMo5nIBlk4mKrCRRvgFZjCr/2MVTbjfEQcDSaa5afqsl713ifYF/IJpG8qGLPgLmZ
	 pgCCK6OKa7TIsMd9tXCM9C9KkIIvq7tVJMu+yQKiX08DOplNwK7qnoFDD5GgK3+BQ3n/t
	 kTdoLFc/wJKvpm/iMRpSSYeZpUPan9acBwoeS7MaZn/MIrd9Uc5l+TpKKXVHCGAEMKvcT
	 M/FBuhKm4cByvDmALmFoLItAOm+Epgb0oa4qhDNC3tv+RDFBgZfbptKh2HRR5Lx/vFILJ
	 unb1T0YQiqYnHUpRyQbWuNSnY9aLVO2xn9oPwRGVo5WFrLOINFaQJJ+CNt1fA87xH2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
	b=T2ArmfBZxMmGb8EjPPk3SVKonFz2pEwEV48xMxNdjW44WvDbHzl8xb78zr1agBWD6kkY
	 ext4jL/fWB0BBNbWJD+5OYR/imzUB61tACLHtIEzKhNcNAhf6TGw12QOiNfW5y3L4XHc4
	 G/3CkMe4emSDEzo08p0CT84Xc3687jBJc2Pslm55lTXPxRvYXv4bhepLL379RiSJk3yHX
	 Tf00hjWBxEROPYmdOmr6NGWDnJ6PwCBg/KYuuKQH2ueqMSajEKVLI/jebuC8gGze8AWlw
	 zeROd+KLQk8P6Y0OJuXcr1MrZe7A2HKkwt18BM+oYQw/fVOoikxr4UtX7FMhu4INK7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VKx+obQA;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF6E606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF6E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VKx+obQA
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a215e64962so16806765e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975270; x=1793580070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=VKx+obQAPb5/XrR9/roIFYPRYGDzzDrkDoIp3EMgMBi/JMmvYE/fBNeA1Z1c4kRnb2
         /5FawM3AjVvvX2Vrbh2TeCQRbtjZKXN31fGLMSFHZlpPbp6IvroOUVjulEOZx9U6Wt0R
         vw6XMPJz+4WhSv8rAMrLWA5HDcT33bu6gonFcqDZTJMHo5OqCR7/k65EenzsIYSVHt3K
         X5K9j8DMsvfVEImpHP6pQ5C63OFW9hT5m6zBFUVKsN/rb48+OTqeSmIUI0zrG74dep6K
         VELfJ4YXVWTb93hj7rhxZIB6NR5Vqzki9sivn9wYcT7X5QMTBRK2DCzwDEfHSgibQkoU
         Tc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975270; x=1793580070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=ZDkU7Nd4lem09FPC3/HbHxTQ7pct7vryJjkzZWba5+6foquB4NQ87Opecex/LE2Gg8
         q14O9TuYdhlfymDGmd19pJyYXg3MDFXJJWAMw/WAjZmAaTxqGYbDBKBEkDjmItBiw5Io
         YdI3KXM0WzJ/Aomql/gzObb5T/YPiFWzYiYJ0CsVjyZHgOavAYK8deV3fzjG3aHrCykQ
         dpsIYWxmx0Q1VGNVh5t0vLkKIjW16E0I3C+ZjD5hfiW41RkRx34OuPBuUyL40pA6PCsf
         k/q1Di/Pw1aWXbJ+8uF/0SbMSSztn2tuINVPldfKK7ZTrkYq3/D8DbpcWTbj9GUVFkvj
         v/vw==
X-Forwarded-Encrypted: i=1; AKwUvByXVHAifYMAsra9kKqWWsEvhb+KoAgO3PFi9FvC1KvJG9yn8ReNJzF8Lhj8DxXnElqB4xrpLHiGSPfUJfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJW0qA3GEndxAHAXaxja2c5pGFRqq6ixku78Q3hHBg9DY154fR2
	KSLKB6FTNcf+mtAiO18StIp6h6AqhveH5bPEnmWUixW6ms26fYCf2hmz
X-Gm-Gg: AYBFou3M2h62wlseqzcycZFg3DOY29jJwEIaxebgJgimq3nRzRJBQoNNxSOdUZbfr+X
	XMNPWsIvLlLrFzU4h7PtLE0urPzuXIjhks/N6UYiMWonxXMQV8xImESDrX9V08hZ/H6gPsNjJNL
	a+pHg0RYIjR94+FhaTrDW6YQMi5cbQVHCZhdvTnsWHF6vM3ita0wbo3OeyJlnwopbccMV3xnGOp
	M1d9WYUIRvwpVzjIZy78wPyytV8tLrqd1fBTVjkgih70ykJCRjBHUcDYt9+UzP+9hIDsqpwE6ZD
	tGY6VAERPBTY5aDn+dC5osIANKtiA/4SHArteeuT0eIxXT9nWwe8XJLIaO5JeMRDAmeJAmzx5Jg
	yOopQvQyTF2xsdKibVyAbNc1uJ8wb6b1q7QzDjvmoQ54fLeiSIeHtHnB8uDCxFyx4EL7fq/Oiwl
	OQgvnCwlkXLXcIReEzkpmnw4YXP7U62fhx12AlYDt5tLEMgLy174LoMuklAMaSMrPBnrLlKxckX
	6jwmmnrmtjnGhjrwYaTFpTdf3sTjpk6NyfykYGUp0F+iDM7FNbW9O79EJ2vafvgMWeebR3ZGC0m
	8WnCfUONVok40A==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4a35aae5c48mr101973045e9.0.1792975270272;
        Sun, 25 Oct 2026 17:41:10 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:41:09 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] sy7636a: power the panel only during updates
Date: Mon, 26 Oct 2026 00:39:11 +0000
Message-ID: <20261026003918.155321-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature in the regulator driver instead, as the TPS65185
and FP9931 drivers do, and remove the hwmon driver. Boards that relied
on VCOM staying on mark it always-on. The regulator also switches VCOM
with VCOM_EN, gains VCOM voltage control and binds to the I2C device
directly.

Tested on a PocketBook Verse (B288).

Pablo Mazzini (7):
  ARM: dts: imx: keep the SY7636A VCOM on
  regulator: sy7636a: fix the chip name
  regulator: sy7636a: add VCOM voltage control
  regulator: sy7636a: wait for power good, then switch VCOM_EN
  regulator: sy7636a: report the temperature
  regulator: sy7636a: bind to the I2C device directly
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD and hwmon options

 Documentation/hwmon/index.rst                 |   1 -
 Documentation/hwmon/sy7636a-hwmon.rst         |  26 --
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi         |   1 +
 .../boot/dts/nxp/imx/imx7d-remarkable2.dts    |   1 +
 arch/arm/configs/imx_v6_v7_defconfig          |   2 -
 drivers/hwmon/Kconfig                         |  10 -
 drivers/hwmon/Makefile                        |   1 -
 drivers/hwmon/sy7636a-hwmon.c                 | 102 --------
 drivers/mfd/Kconfig                           |  10 -
 drivers/mfd/simple-mfd-i2c.c                  |  11 -
 drivers/regulator/Kconfig                     |   6 +-
 drivers/regulator/sy7636a-regulator.c         | 240 +++++++++++++++---
 include/linux/mfd/sy7636a.h                   |  34 ---
 13 files changed, 205 insertions(+), 240 deletions(-)
 delete mode 100644 Documentation/hwmon/sy7636a-hwmon.rst
 delete mode 100644 drivers/hwmon/sy7636a-hwmon.c
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.52.0

