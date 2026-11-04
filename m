Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783518;
	b=JpLkLRGrSoJWZ7AYD2w+eGGhrQKi4eEgE8s1IR/WwduKptNU+13lhcKBe5DFometemwU
	 a3iUbccwvKzTQsbkCKKW0FhFjI8OdPKaSohrwBzgS72GDHgdZyiI9lbzYMSJGDnBz12hB
	 vFr7FwChOwtpM99dc1Au1VyMWbsDJU99adq2AK925tM9ObZpXWyNPQPj9VT/29Rs3B+QO
	 9cPOeVHCmf+UVf5bfgV5d/7F6c1GBLJBbnyz/SBtZ90t129HXmahdCfa1179AFORSuo0D
	 HF9QJIHUAhm/aSwgquHasfbIVZnNL0xxTYZNjloMGVT2IxS6bN/6+v6QMowBt+qReNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jhKXBgg1sGJn3Jt16h2wqToqL6AFAOLSOJl/Bs/EcRQ=;
	b=r8sB3vqbd6ms7G1ZQ87lkTbJPvzPRJ9ql6pGrjix227CsxzqyA/WzusfqCb0p8qZTFqS
	 F1RZrgvrFv9pYn4p05rqwzpMNlOiMzL9yqqY41hPBIvaNIDeAKq5ku+3MBcZqVF+FfTxl
	 bZGXn/YtxaLOdRvDSPewPUNjHaM/WL5pLdnQxgx9Rgo2B8j14Ww3p01QUq02pP2Wi71e9
	 b5FY/b3kA9JECe05nc1yQXfLxsi3bnG/cIK0YAfb5Ji1c8eKZBYMK83/l1DVLI+AkhwR8
	 O5P9y1wTAXccYQgJ9NYD5Oj/NRKr1mVVO+EJDG008miZ74/eBcIjFSb0LyIjcGgOm1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="V+MVO5/H";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9975606A33A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9975606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+MVO5/H
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso366986a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783517; x=1794388317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhKXBgg1sGJn3Jt16h2wqToqL6AFAOLSOJl/Bs/EcRQ=;
        b=V+MVO5/HOUMXtW+/hWueRfgYYSpNHXYFNqTWJ9hFYaAepDbyaIcWGBP0lq/7ECVyiz
         pu5ak9PTxbqAGtMCCGCkV4JYyp0LgHh6H2R9nAlPNTTMRRexRBzPpCwFy2cau+8uXLQN
         TWc4mS0s+LEXUJULMmh3PSj1vKBzFNch0PSuHxECSEMeHRYXAYj+RRi7Co+jurN/OYIG
         ofNcMpIQYtODaVmYwJiqI/8DxXzF/v3htZX9HjivxERIhYgRr/1lQqzMVk0phwNuPT57
         Wt4KTLx6AfKCvSr4ZJuRvscVA/B6s++LnOaOiL7sLuNLVSX6oGmu6m03ehWAz3OP8y8D
         Y4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783517; x=1794388317;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhKXBgg1sGJn3Jt16h2wqToqL6AFAOLSOJl/Bs/EcRQ=;
        b=g95DJAXbL4dboA2LTP3+3XbcnsCzVn9C2Wj2kTZyEYAmwtRo/kZaV0wVSEtqLeiINu
         vCQmGqZAwjQB6oYNvHkHZrfLmRlu6+Opl1o33zT73804KEK5NNUvjXRxj4WkZYlqk/zX
         0GmB3lt8oXVn8nW1ilTJcskYgEXc7SRIemnSbstFRSyaG7wDDsKAi1kJTrgt3V75dx0D
         PQT5R+RAeKL7+xgiag2+Y5AjhlaFjscgOmZFx0clrF2bAEPUg2jVfSQ4aEaRnTkOQD7X
         xdrjud+2AipmFxXGSz304H48NdzSqfLArNBNM3tFaz6rxSGUN1tco53kmleW5QycU4Td
         UznQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaRGBrFEfDR/ff3xKOYiLaBhZLZ6lioGKDZfVSlJwkpCSMTbhhV9MT8n/d6WC/AjWxoJ0Bstbclki2YU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rt/M9xSBgvrwdLwgHKhVSjsAz9GDKSGtl++eMJlvFxFzFyydu
	G9atmw5GTDZaWYE3yvpzzoyACSaLemak/3N9ZCsjVYheYK2hVYob4eEj
X-Gm-Gg: AYBFou3Jqb4OrR3NFBf6IXFUOe047yc0kNlwj/C5ng5Bwbpl+kAej3XxlOZ4ntJw4Fw
	Z3FfS64WQk68gljS/kBLn2GM6TcSvAsOwYlCaPyY0ZL3q3Gqx+ljIj6i6e/cgufr6NfAGRXfT7J
	Ajuin5POcGZh8jf9Z2GYdVGvfvEKaqGJMZMyZoZ4qce+vLa2vhkXYwA38/JL4vs1YjLeGJ4XHNp
	KNX0/5oG11LV8iFIRx1pUCxU6w1/APYO8KBk6wWNSzpQxUxQkrPfka5/VQ4aeA4s7ryFLgHt8RD
	b5cUHnjkGf/nn85s5zn3ITn9i6YYAqkD4q8gfxfFJp+/gbRQraaNyAbLNBWxNnakpoivzkXQWP5
	79Ml3aybiRytyLhHyt3ofVoGe8PEbKXPORiWpU/ZCeHcuelixf3+HBwJzDSDSL01ngQlNNwM+YX
	inTZSu/w/9iTuG9LTJsdwJXaY9EVq22FW1sW0ApfeLhuakLUQyaueNKoTou+YcBfjiFFzi49l1B
	e0ZAUtzf+70Y9Z8qyW1wdJ4e2vA/rg9PSjocg+YVzpM2XoEoE4St1pbFJOn9jnX7c2GQami1APy
	+UDhYXXAl/1pYzRhVrkaBTVxaWKO+CeDDxWJY/P6QkiHmUI5NE1aRUDU0gQ+guWwKupnf0K6bFG
	LQ0t5MxAvxiv2TN4=
X-Received: by 2002:a17:90a:e187:b0:3ac:77c8:ac29 with SMTP id 98e67ed59e1d1-3ae896f862emr12115163a91.15.1793783517097;
        Wed, 04 Nov 2026 01:11:57 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09369c638sm3167257a91.0.2026.11.04.01.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:11:56 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v4 0/2] iio: adc: Add Nuvoton MA35D1 EADC support
Date: Wed,  4 Nov 2026 17:11:34 +0800
Message-Id: <20261104091136.151269-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds IIO support for the Enhanced Analog-to-Digital
Converter (EADC) found on Nuvoton MA35D1 SoCs.

The EADC provides eight external analog inputs which may be used as
single-ended inputs or as four fixed differential pairs: 0-4, 1-5,
2-6 and 3-7.

The initial driver supports direct conversion and triggered buffered
capture using sample module 0. Although the hardware provides multiple
sample modules, this version of the driver uses only sample module 0
and therefore supports one active voltage channel per buffered scan.

The series is based on Linux v7.4-rc1.

Changes in v4:
- Use the common ADC diff-channels property to describe differential
  inputs and keep reg as the logical channel index.
- Restrict differential inputs to the four hardware-supported pairs.
- Restrict channel child nodes to the ADC properties supported by the
  MA35D1 EADC.
- Prevent single-channel and diff-channels from being specified
  together.
- Document that each single-ended input and differential input pair
  may be described only once.
- Remove interrupt-names and simplify the interrupt descriptions.
- Update the binding example to demonstrate separation of the logical
  channel index from the physical ADC inputs.
- Update channel parsing to match the revised binding semantics.
- Store physical ADC inputs in the IIO channel/channel2 fields and use
  address for the logical DT channel index.
- Reject duplicate physical single-ended inputs and differential input
  pairs.
- Use the physical positive input when programming the sample-module
  channel selection and the logical index for firmware-node channel
  translation.
- Use interrupt index 0 instead of looking up ADINT0 by name.
- Add the standard one-hot scan-mask validation callback.
- Use iio_for_each_active_channel() when selecting the buffered
  channel.
- Use a fixed scan structure for the single-channel buffered layout.
- Limit conversion results to the 12-bit ADC data width.
- Always report -ETIMEDOUT when a conversion times out.
- Make timeout recovery best effort so interrupt disable, control reset,
  IRQ synchronization and stale status cleanup are all attempted even
  if an earlier recovery step fails.
- Use devm_regulator_get_enable_read_voltage() for the optional
  external reference supply.
- Rework clock management to explicitly balance prepare/enable state
  across probe, suspend, resume, error paths and driver teardown.
- Improve suspend and resume error-path handling.
- Remove the redundant explicit REGCACHE_NONE setting.
- Split interrupt status read failures from interrupt-source checks and
  handle failures when clearing the interrupt status.
- Use symbolic definitions for the ADC resolution and differential
  scale width.
- Use cleanup guards for mutex handling in buffered capture and keep
  trigger notification outside the locked section.
- Use more specific error codes for channel capacity, duplicate channel
  definitions and out-of-range physical inputs.
- Apply the requested regmap, control-flow and coding-style cleanups.

Changes in v3:
- Document all four ADINT0 through ADINT3 hardware interrupt outputs and
  add interrupt-names.
- Document ADINT3 as the shared conversion and result-compare interrupt
  output.
- Remove the redundant minItems/maxItems constraints from the fixed
  interrupts items list.
- Rework the channel binding for the fixed differential pairs and use
  single-channel for single-ended inputs.
- Add #io-channel-cells so the EADC can be referenced by DT IIO
  consumers, and define the cell as the logical channel index.
- Add firmware-node channel translation so sparse or reordered channel
  child nodes are mapped by their logical channel index.
- Restrict unsupported generic ADC channel properties including bipolar,
  common-mode-channel, settling-time-us and oversampling-ratio.
- Explicitly configure INTPOS for end-of-conversion interrupt
  generation.
- Explicitly configure the ADINT0 sample-module source and clear unused
  sample-module routing.
- Reset the EADC control circuits during hardware initialization and
  clear inherited ADC interrupt enables, result-compare interrupt
  enables and sample-module trigger sources.
- Add timeout recovery using the EADC control-circuit reset, followed by
  IRQ synchronization and stale status/completion cleanup.
- Use iio_push_to_buffers_with_ts() for triggered buffered capture.
- Avoid mixing cleanup guards with goto paths in the trigger handler.
- Add ARCH_MA35 || COMPILE_TEST and HAS_IOMEM Kconfig dependencies.
- Drop redundant linux/bitops.h and linux/mod_devicetable.h includes.
- Use direct regmap helpers, explicit REGCACHE_NONE and
  regmap_assign_bits() where appropriate.
- Use fixed-width register offsets and kernel time/unit helpers.
- Use size_add() for channel array allocation.
- Request ADINT0 by interrupt name.
- Improve system suspend and resume handling.
- Address review comments from Jonathan Cameron, Rob Herring,
  Andy Shevchenko, Uwe Kleine-König and automated review/testing.

Changes in v2:
- Reworked the driver to use regmap.
- Added optional external reference supply support and IIO scale
  reporting.
- Added optional reset handling.
- Added externally triggered buffered capture.
- Added signed differential conversion handling.
- Added fixed differential-pair validation.
- Added system sleep support.
- Added optional DMA properties to the binding.

Patch 1 adds the devicetree binding.
Patch 2 adds the IIO driver.

Chi-Wen Weng (2):
  dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
  iio: adc: Add Nuvoton MA35D1 EADC driver

 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++
 drivers/iio/adc/Kconfig                       |  14 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ma35d1_eadc.c                 | 912 ++++++++++++++++++
 4 files changed, 1090 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.25.1

