Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0AB3C3C15
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398988; cv=none; b=IBTnHZVEre24Grcte8V9KNc7FQp9xDq2ThX2lHst8wh9/YWsHcpZ6eX85WHWmkbnL2w4RwDj0L8d1XfdceKP8kIhPXpBpPJB48xT2P+C8gVkkleprr9evXRd+27ueCU1BlzQzGtMi9Kf6BHgwQQudF7bXTLPs6gCuRTDRIKDtUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398988; c=relaxed/simple;
	bh=fYRj8qFKNJXm1gWOar6pgdPbjVP6k3xNpTQTpY/uZrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IiYZfENMI5ZoQh+Fhq0IbG9djGew/7zoQ4jUnawsuQTKqDaC2Hb4wbcW3avNpeLPUbc2n0b/Ld1rLBUBqK4TX5UsedQlBAT4+KBNm8/aD+yoLOxMpswTeR2l90bqVWJVDisMQNsOjo03bWmsYR4w+KqMlyNBezD+cLusEFzDR+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/H5SfvT; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/H5SfvT"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c43373ae89aso132364466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792398984; x=1793003784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UyIIKcOQE3LOkHo2Iikq4ClSniu9+AZmAOWlKwdcPZg=;
        b=n/H5SfvT7TLi3yjvqiZvwB+ToF8z9xbJ49SH5p+1QUoJIDXsAK6yuzaVsx7B3wHmbg
         p050c2F4hCS4hTL09VKii/iqsg/S/gtGD1snJHcpdj8kjb6ut9B14klXvn2KlPx/9Fed
         FLWah4FXYyBQJlY/5jhBcua6w8Lbns72BG/1mUphVrhL0jtCs8B+o/b9y5FgBmPCLbrc
         Th7oRZZjzc+SJwpqDF506Sl3y8zNSUwVHDrBxROvR0ZGGA4upTA/RY7kFZO9jYQqGRH9
         +M5f9BrxsJWEjUpoceib4xfE22MDy8O6E5VcEnUHk3a/ebh1kJNZXI58kTcu0AUG3R/D
         LPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398984; x=1793003784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyIIKcOQE3LOkHo2Iikq4ClSniu9+AZmAOWlKwdcPZg=;
        b=TOJWBiJi9HB9Isruo6dNiKDSWfjalJayK9pFK97R/jSb+/xEluXW/HRvbjYEeeoZQc
         QYPk93Kz7uv11AQhDAMgSbO7MjcsRINjDOudSiB53hAF/1UExuwLoE+N8azpllzqzrbS
         TMXJLszo/A9rwu7TWHPWIz32bN+vunkAnTlTXZc5zFM/8bhohqUj4+zRfLOLJP51mw9S
         NvSuapbhhfK+ZWFgiyfaotdNrAGpFHGrWpi7j8YhbLdvDiB2hkYhnEBTfI462SceKj4C
         MvFP4CsYTc0xPc4C+zmSKTs43E9P5ygJ7Cpa7dY0+tVcz4IQIPByHudYg0bZlAu/qj52
         PzVQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3vMDZh6B2FA7JMf2q1xZxhujVptjbgCqbtOs6PgTMOQWkNHDVzmr/jhc8D3bCYV9OLa9BXiIfYEphTAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrDwHM2PutK9sE7bduBfAgWqVrAeJrWt56wwYuMk7bNfsXZFvp
	vOYO1dIi5paOHIfb8f61iry6cVjSaZ7eGN9HH6qLS7SPChpWraNfEWHk
X-Gm-Gg: AYBFou2cJfiO/tupdBlC4zBMJrdl6uoRVaDD7snnpq6fJYPzYssmk5VHjGKcw1yp7a0
	n5CNyIgsGtwhPsaoRniCOK7ZHdojAE9DyVjFAsreUmewoJf85KNHoNTkDq9ch7yG9xeJwiTkqHC
	Sd+7+Qi2VzZuohTo61gWNLt+lmLyshAoPG0AjDRxe7HXcvRzGdARpQ7+mHX6SDt3BJC/QdbEHS/
	IvlaUOUH3qHTm0uue1JuK2kbUZvRAnSdZLRUYpN0CWuSbYzj3oGchGDPIrAXVQS1NU8dhLcE/3h
	WdF5TyMLRWhJeKen+ezUOTs+75hAQi5GvAudmfHMquV+IL5yofUi/s02PDk4iedsKuEmxUlDyLK
	cievuEeGBAqrqR9SNPHiPrtOmcXIxUOZKz5sr5Z4zkeANiufGlULQ/sr9MVE2b+5dZ2676WR1+B
	qbHuys724yjz/GRRFZODvkUh1t/ctzrleT+yubNufOlU/0G9M7wIa4c5w3kFsVOmsXm3VI5DYl9
	6lXs1SlcwSWVy3H5QW3Wp2xvLJcDexklnWIFUraBwHhjXLQOgiK2AKO8+DuTD2XbsiaI44Wk6zM
	DfwFfc82Xw0woAv7kLpAhpXlDpI=
X-Received: by 2002:a17:907:3e15:b0:c2e:808a:f78a with SMTP id a640c23a62f3a-c419f31b40emr481793566b.32.1792398984217;
        Mon, 19 Oct 2026 01:36:24 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf98fsm323106966b.13.2026.10.19.01.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:36:23 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v5 0/5] iio: pressure: dps310: add Zilltek ZTS8032
Date: Mon, 19 Oct 2026 11:36:15 +0300
Message-ID: <20261019083620.1285782-1-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Zilltek ZTS8032 is a register compatible DPS310 with two more
pressure calibration coefficients (c31, c40) and a different TMP_CFG
layout. The FIFO is the same as on the DPS310.

1-2: Vendor prefix and the zilltek,zts8032 compatible.
3: Per-chip data in the I2C and ACPI match data, no functional change.
4: OF match table.
5: ZTS8032 chip data: the coefficient count, the external sensor flag,
   and a Horner step each for c40 and c31.

Based on iio/testing (43ffda3c7f84), on top of the FIFO series.

There is no public ZTS8032 datasheet.

Testing: ZTS8032 on an arm64 (MT7987) board, with dps310.c from this
series backported to 6.12. in_pressure_input matches the datasheet
formula evaluated from the raw and coefficient registers to within 1 Pa
at every oversampling rate from 1 to 128, and TMP_CFG reads 0x00 after
probe. Buffered capture without a trigger runs through the FIFO
(CFG_REG reads 0x02 while enabled, 0x00 after) and returns the same
pressure and temperature as direct reads, with pressure only and with
both channels. Every patch builds without warnings with W=1 on x86_64
and i386, dt_binding_check passes. I have no DPS310, so patches 3-4 are
untested on one.

An LLM coding assistant (Claude Code) was used for this series: it
ported the ZTS8032 support from the vendor driver, wrote the code and
changelogs and the hardware test scripts, under my direction. I
reviewed and tested the result.

Changes in v5:
- Rebase onto iio/testing with the FIFO series. The ZTS8032 FIFO is the
  same (FIFO_EN, 32 entries, FIFO_STS, RESET FIFO_FLUSH), so it needs no
  chip flag (Rupesh)
- Replace the tmp_cfg chip field with coef_for_ext_sensor and build the
  TMP_CFG startup value with FIELD_PREP() (Jonathan)
- Drop the TMP_CFG comment on the ZTS8032 chip data (Jonathan)
- Use get_unaligned_be16() for c31 and c40 (Jonathan)
- Link to v4: https://lore.kernel.org/r/20261016153533.3701000-1-paulius.zaleckas@gmail.com

Changes in v4:
- Rename DPS310_MAX_COEF_LEN to MAX_COEF_LEN, separated from the
  per-chip lengths by a blank line (Andy)
- Add Andy's and Joshua's Reviewed-by tags
- Link to v3: https://lore.kernel.org/r/20261015104945.2687162-1-paulius.zaleckas@gmail.com

Changes in v3:
- Drop v2 1/6, superseded by a22dc7ebb21a in iio/testing; rebase onto
  it and add c40 and c31 as Horner steps. This also covers the Sashiko
  overflow report on v2 1/6.
- C99 initializers for the ACPI ID (Andy, Uwe)
- Add DPS310_MAX_COEF_LEN in patch 3 and bump it in patch 5 (Andy)
- Parse c31/c40 based on a chip flag, not the coefficient count (Andy)
- List the supported sensors one per line in Kconfig (Andy)
- Link to v2: https://lore.kernel.org/r/20261013112124.1878296-1-paulius.zaleckas@gmail.com

Changes in v2:
- Split the driver patch into per-chip data, OF match table and
  ZTS8032 support (Andy)
- Drop the linux/mod_devicetable.h include (Andy, Uwe)
- Return -ENODATA when there is no match data (Andy)
- Add Conor's Acked-by to the bindings
- Link to v1: https://lore.kernel.org/r/20261012114550.1680054-1-paulius.zaleckas@ui.com

Paulius Zaleckas (5):
  dt-bindings: vendor-prefixes: Add ZillTek Technology
  dt-bindings: iio: pressure: infineon,dps310: Add Zilltek ZTS8032
  iio: pressure: dps310: add per-chip data
  iio: pressure: dps310: add an OF match table
  iio: pressure: dps310: add Zilltek ZTS8032 support

 .../iio/pressure/infineon,dps310.yaml         |  4 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/iio/pressure/Kconfig                  |  6 +-
 drivers/iio/pressure/dps310.c                 | 80 ++++++++++++++++---
 4 files changed, 77 insertions(+), 15 deletions(-)


base-commit: 43ffda3c7f8456bbe641ae8249a077a361b97880
-- 
2.55.0

