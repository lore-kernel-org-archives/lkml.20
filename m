Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733118;
	b=PRlMvlymnw+MFOMzqDh3sRlo/LbvT6NWtLy0M8tFSx352pXTzG9Z9dLN7GPYEewsSnyF
	 v2hgiP+ORbAuvP0FzVl+S+wBKSIu2DJeGu4k5CD2ejUFWqUUsAYZfIjRXpCNb+K1+wS7i
	 MOlzy45HeJbp21GW2Oo+hVt57Nyz+rToVbi2XwriNJIevD3qcjjWuucRGw80JcdnY0Amf
	 015xakHWRgDHki/sN2mDcfPFG9W7DLioY5UCAKKjLoh5HrVwLSIP2U5boy4j9Tb+YqOtz
	 wuZlIxTwgLd7AunmwmOOoYg6Zwz504k/U4jYUSPWr/jPNjAk6cx6E0STkk71ytsxNLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
	b=pEtoXOekK5WW8godkS8RkKVCWqoSdqJlAf2Cv8Q5JdoKJj3qB3/kCYvm6e+UQVg60QSe
	 k7clLeE0GR7V6kiGYGpKty32pi2OdJ/R+VIp/yVO/r9J23ZghyX7jnVkK8RGi9Jbtl0P3
	 84y4l5fujZa6sEaRcwCuytFV7hHF/V0Wlr4l8Y4JzwxZ7fAl5WHMOV/WeD1lo4PuJslHp
	 LI8TP8KsASycqWWZXAHDhnZS6BLNB3N5tnnV1am7dz2gYvJc1L9+Rme7ylWESOYdZDzn6
	 pzFNsrvWEN5MV2v6nc9I7PvxEKZpCbSKst60ds8hmj7suaj2odwXRmm1B8mHMu7WeVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxDgOdPI;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556B8606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxDgOdPI
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50a4a2132cso299245066b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733117; x=1795337917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
        b=cxDgOdPIXVmH57Fd68NwsdJOuUZP8P8vdJ6d5BdqZUabe+Ute9wkApOR93dPGFzm54
         TyCDW/GZUTprEszT/0jdMNrLPbr7AU4aZgtO+07t7eykMSJSKemC19TNIVqoPM9rEXLC
         gn8ylbQm2QbrJUNsUwtL1lfFPvRliu8uarTjaHtoiuggbfwP01ziLWyIQp/KumpG2wJH
         +OLv6HnZB76Y7uBnDgVT8rMHUvGjPE57UXDrrWnPqK240DsCVAH9LdO48xRJkxxgQ8Iq
         SIgPAr6IdJMeddfYGaOsMGA5oxxy5pnE7+8fLwCqsQcLQyXlrq38AtinDEHaOJ8RMwoG
         qNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733117; x=1795337917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
        b=gVLDC6rvjmkndzp5YvE/8WS4jU62apdaFh0/GuLaLCqCTquBWpj2DwdIM4Okg9joQp
         fCzgRjERWOjpr6Q+BpYLtVicAxrRxDJ5U+6QxzeKeL6n61+/ExHqiLComUI39nlk55Fx
         T49xB2P+ICm4p1Don00GzQ26jH9HPuqUv5ggYL5bxNdGsMR2K5pMZyHuoVvKSfVu0Hyo
         6ly6CRM/LqPa57qEBaq9SKZBoHoGIJGopU8PwkLTNOiniTHNz+Z8CISMDKq2C8gYtmnv
         K5fY3i19XsJTHLJVJt6cU3PwHNs5M4fGAI4BUBTMGF3Kymeaa+T6ZcJz+5zjmb/O9/s6
         PfZQ==
X-Forwarded-Encrypted: i=1; AL+hErFcCJaP9AK4x9m0aDl3UFUGqfxeB6gElDdYf4ihefui4URhNJs7DWLH51K6iSSYMkXWxtKE7uzoZ/69Z00=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JlBiS73G4uzAcx2S6FEI3WCBNvSE/X4fewvO/FwYoZjMqXWcM
	UclY6KQL65ZXzVwEsgM1g7bpOYeg7ZegirScV/kWKQLtpL+zohmoaSNp
X-Gm-Gg: AYBFou3Bfop8ign+I6snwXmTr1069CdViMr1tICyEeaabHi13QVg0OrJOkhQJDWx1EE
	5OkyGoKgQgEd3PTJJ0mF2bptqIrY2GPql8Om6UscE3O7XoiVyuuiA2L+h2/9X2Wfs26CUF0+dCH
	4aT0ICqnosctWrrq6fJieCMKt3lQ14jdl2lYAfKP93dqWROh8p0XCYAD2FLzRAJxHuxJHYKOfbz
	PyWPhLUAdth5Uz4N+pOAYCocopyCsYuRVftFhOE19boaAA966Ylhcx7TBvqVMLr/jPcq/kdyI7l
	uGFXLPrZu8BbRMuaCr3WTsMthAudVjFN1C7jeDYkoqNPxertG+VfSPmaPIF8C6bvrbUMawLkZfb
	WlaTghi1bw6Rq8at23/Z3i0VmlZB3BmDKQjOYvgpPx/iBfUu0tDc3eYQys1H+lo0E4FcEbf4zj6
	Vtu98s1o4snC6xk4HjG1dYe7w1g5ljNg7J8DLQB/c0dEwk3HoARgV8ERTUvfstNHi1KcrLZbIPB
	YEuIz0YWiV7frLjAvhKuxNC8FT8wPvybUUrubbPcR+BWtxxaDYUf/mB0upapXnBaPe5bn9AJcj4
	dw6i41uIrCdh7w6ad9e8SgI3n0YQZR0PVY6s65ErCDLtkKbDA4YZRXw1t4Beq3TdMLU0BCaB26o
	d2Q3enFGpTA==
X-Received: by 2002:a17:907:3ccc:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c509637e31dmr585009166b.22.1794733116617;
        Sun, 15 Nov 2026 00:58:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/4] mfd: aat2870: Convert to use OF bindings
Date: Sun, 15 Nov 2026 10:58:21 +0200
Message-ID: <20261115085826.89641-1-clamor95@gmail.com>
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

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

---
Changes in v2:
- fixed led-max-microamp scaling
- fixed max_brightness parsing
- fixed regulator init_data and of_node passing
- of_platform_populate > devm_of_platform_populate

Changes in v3:
- removed max-brightness property
- switched from dedicated max_brightness property to dynamically
  calculating brightness steps
- update regulator registration to use mostly core regulator framework

Changes in v4:
- set max_brightness form aat2870_bl->max_current instead pdata->max_current
- switch gpiod_set_value() > gpiod_set_value_cansleep()
- constify aat2870_regulators
- max_current in bl switched from int to u32

Changes in v5:
- drop max_current from aat2870_bl_driver_data entirely
- remove legacy gpio and mfd core headers
- headers in aat2870 sorted alphabetically

Changes in v6:
- led current set to default matching driver behavior
- max_current initialized with same default value as pre conversion

Changes in v7:
- rebased to be applicable on top of devm_kzalloc_obj conversion
---

Svyatoslav Ryhel (4):
  dt-bindings: leds: Document Skyworks AAT2870
  backlight: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 133 ++++-----------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  78 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 264 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

